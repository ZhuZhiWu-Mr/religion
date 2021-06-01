from flask import Flask, render_template, request
import json
import requests
from sqlalchemy import func
from flask_cors import *
import error
from my_model import DBSession, UserInformation, ReligionEntity, ReligionNew, BrokenLine
from cachelib import SimpleCache
import time

# 登录超时
LOGIN_TIME_OUT = 5000 * 60

cache = SimpleCache()
app = Flask(__name__)
CORS(app, supports_credentials=True)
session = DBSession()


def result_data(code=error.SUCCESS, data='', msg=''):
    return {"code": code, "data": data, "msg": msg}


def index():
    return "本项目前后端分离，请复制index.html网页的绝对路径，到浏览器打开即可"


def sign_up():
    """
    注册
    :return:
    """
    if request.method == 'POST':
        user_name = request.form.get("userName", type=str, default='')
        passwd = request.form.get("passwd", type=str, default='')
        authority = request.form.get("jurisdiction", type=int, default=10)  # 0：管理，10普通

        cur_user = session.query(UserInformation).filter(UserInformation.user_name == user_name).first()
        if cur_user:
            session.close()
            return json.dumps(result_data(code=error.USER_EXISTENCE, msg="用户已经存在"))
        try:
            user = UserInformation(user_name, authority, passwd)
            session.add(user)
            session.commit()
        except BaseException:
            session.rollback()
        finally:
            session.close()
        return json.dumps(result_data(msg="登录成功"))
    if request.method == 'GET':
        return render_template('login/login.html')


def sign_in():
    """
    登录
    token应该加密
    :return:
    """
    if request.method == 'GET':
        return render_template('login/login.html')
    if request.method == 'POST':
        user_name = request.form.get("userName", type=str, default='')
        passwd = request.form.get("passwd", type=str, default='')
        try:
            cur_user = session.query(UserInformation).filter(UserInformation.user_name == user_name,
                                                             UserInformation.passwd == passwd).first()
            print(cur_user)
            if not cur_user:
                return json.dumps(result_data(code=error.USER_PASSWD_ERROR, msg="登录失败，检查账号密码重试"))
            token = ''
            token += str(time.time()) + ',' + user_name
            cache.set(user_name, token, timeout=LOGIN_TIME_OUT)
            return json.dumps(result_data(data={"token": token, "nickName": cur_user.user_name,
                                                "jurisdiction": cur_user.authority}))
        except BaseException as be:
            print(be)
            session.rollback()
            return json.dumps(result_data(code=error.USER_PASSWD_ERROR, msg="服务器错误"))
        finally:
            session.close()


def get_user_info():
    if request.method == 'POST':
        token = request.headers.get('token', '')
        # 检查token
        tokens = token.split(",")
        user_name = tokens[1]
        try:
            cur_user = session.query(UserInformation).filter(UserInformation.user_name == user_name).first()

            return json.dumps(result_data(data={
                "user_name": cur_user.user_name, "nick_name": cur_user.nick_name,
                "religion_name": cur_user.religion_name, "email": cur_user.email,
                "phone": cur_user.phone, "passwd": cur_user.passwd
            }))
        except BaseException as be:
            print(be)
            session.rollback()
            return json.dumps(result_data(error.NOT_PARAMETER, msg='服务器错误'))

        finally:
            session.close()


def put_user_info():
    if request.method == 'POST':
        # print(request.form.get('data', type=str, default={"data": ''}))
        data_dict = json.loads(request.form.get('data', type=str, default={"data": ''}))
        print(data_dict)
        print(type(data_dict))
        if data_dict == '':
            return json.dumps(result_data(error.NOT_PARAMETER, msg='没有修改'))
        token = request.headers.get('token', '')
        # 检查token
        tokens = token.split(",")
        user_name = tokens[1]
        try:

            session.query(UserInformation).filter(UserInformation.user_name == user_name).update(
                {UserInformation.nick_name: data_dict["nick_name"],
                 UserInformation.religion_name: data_dict["religion_name"],
                 UserInformation.passwd: data_dict["passwd"],
                 UserInformation.phone: data_dict["phone"],
                 UserInformation.email: data_dict["email"]}
            )

            session.commit()
            return json.dumps(result_data(msg='修改成功'))
        except BaseException as be:
            print(be)
            session.rollback()
            return json.dumps(result_data(error.UPDATE_ERROR, msg='修改错误'))
        finally:
            session.close()


def list_religion_people():
    """
    获取各个宗教人数分布（饼图）
    :return:
    """
    if request.method == 'POST':
        result_list = []

        # religion_group = session.query(ReligionEntity.religion,
        #                                func.sum(ReligionEntity.total_population)).filter().group_by(
        #     ReligionEntity.rligion).all()
        #
        # for re in religion_group:
        #     temp_dict = {"name": "", "value": ""}
        #     temp_dict["name"] = re.religion
        #     temp_dict["value"] = int(re[1])
        #     result_list.append(temp_dict)
        try:
            religion_group = session.query(ReligionNew.religion_name, ReligionNew.proportion).filter().all()
            for religion in religion_group:
                temp_dict = {"name": "", "value": ""}
                temp_dict["name"] = religion.religion_name
                temp_dict["value"] = float(religion[1])
                result_list.append(temp_dict)
        except BaseException as be:
            print('查询出错:' + be)
            session.rollback()
        finally:
            session.close()

        return json.dumps(result_data(data=result_list))


def bar_religion_people():
    """
    获取各个宗教人数分布（柱状图）
    :return:
    """
    if request.method == 'POST':
        result_dict = {"nameData": [], "valueData": []}
        religion_group = []
        # try:
        #     religion_group = session.query(ReligionEntity.religion,
        #                                    func.sum(ReligionEntity.total_population)
        #                                    ).filter().group_by(ReligionEntity.religion).all()
        # except BaseException as be:
        #     print(be)
        #     session.rollback()
        #     return json.dumps(result_data(data=result_dict))
        # finally:
        #     session.close()
        try:
            religion_group = session.query(ReligionNew.religion_name, ReligionNew.total_people).filter().all()
        except BaseException as be:
            print(be)
            session.rollback()
        finally:
            session.close()
        names = []
        values = []
        for re in religion_group:
            # print(re.religion, re[1])
            names.append(re.religion_name)
            values.append(float(re[1]))
        result_dict["nameData"] = names
        result_dict["valueData"] = values

        return json.dumps(result_data(data=result_dict))


def list_world_map():
    """
    世界地图
    :return:
    """
    if request.method == 'POST':
        religion_group = session.query(ReligionEntity.country_name_en,
                                       ReligionEntity.country_name,
                                       ReligionEntity.religion).filter().all()
        result_list = []
        for re in religion_group:
            result_dict = {"value": get_color_code(re.religion),
                           "name": re.country_name_en,
                           "seriesName": re.country_name}
            result_list.append(result_dict)
        session.commit()
        session.close()
        return json.dumps(result_data(data=result_list))


def multiple_data():
    """
    漏斗图数据
    SELECT *, SUM(total_population) as total_sum FROM `religion_entity` GROUP BY religion ORDER BY total_sum DESC
    :return:
    """
    if request.method == 'POST':
        result_dict = {"data": [], "names": []}
        religion_group = []
        try:
            # religion_group = session.query(ReligionEntity.religion,
            #                                func.sum(ReligionEntity.total_population).label('total')).filter().group_by(
            #     ReligionEntity.religion).order_by('total').all()
            religion_group = session.query(ReligionNew.religion_name,
                                           ReligionNew.proportion).filter().order_by(
                ReligionNew.total_people).all()
        except BaseException as e:
            print(e)
            session.rollback()
        finally:
            session.close()
        names = []
        data = []
        for re in religion_group:
            tmp_dict = {"value": 0, "name": ''}
            names.append(re.religion_name)
            tmp_dict["value"] = float(re.proportion)
            tmp_dict["name"] = re.religion_name
            data.append(tmp_dict)
        result_dict["data"] = data
        result_dict["names"] = names
        return json.dumps(result_data(data=result_dict))


def list_zhexian_people():
    if request.method == 'POST':
        result_dict = {"xData": [], "yData": []}
        try:
            religion_group = session.query(BrokenLine.year, BrokenLine.proportion).filter().all()
            for re in religion_group:
                print(re.year, re.proportion)
                result_dict["xData"].append(re.year)
                result_dict["yData"].append(float(re.proportion))
        except BaseException as be:
            print(be)
            session.rollback()
        finally:
            session.close()

        return json.dumps(result_data(data=result_dict))


def list_tiaoxing_yx():
    """
        条形横向
        :return:
            [['score', 'amount', 'product'],
            [89.3, 58212, 'Matcha Latte']]
        """
    if request.method == 'POST':
        result_list = [['score', 'amount', 'product']]

        religion_group = []
        try:
            religion_group = session.query(ReligionNew.religion_name,
                                           ReligionNew.proportion, ReligionNew.total_people).filter().all()
        except BaseException as be:
            print(be)
            session.rollback()
        finally:
            session.close()

        for re in religion_group:
            tmp_list = []
            tmp_list.append(re.proportion)
            tmp_list.append(re.total_people)
            tmp_list.append(re.religion_name)
            result_list.append(tmp_list)
        return json.dumps(result_data(data=result_list))


def get_religion_synopsis():
    if request.method == 'POST':
        result_dict = {"title": "", "synopsis": "", "total_people": "", "proportion": ""}
        religion_pk = request.form.get('pk')
        try:
            religion_info = session.query(ReligionNew).filter(ReligionNew.id == religion_pk).first()
            result_dict["title"] = religion_info.religion_name
            result_dict["synopsis"] = religion_info.synopsis
            result_dict["total_people"] = religion_info.total_people
            result_dict["proportion"] = religion_info.proportion

        except BaseException as be:
            print(be)
        return json.dumps(result_data(data=result_dict))


def get_religion_pk():
    if request.method == 'POST':
        result_list = []
        try:
            religion_info = session.query(ReligionNew).filter().all()
            for re in religion_info:
                tem_dick = {"pk": re.id, 'value': re.religion_name}
                result_list.append(tem_dick)
        except BaseException as be:
            print(be)
            session.rollback()
        finally:
            session.close()
        return json.dumps(result_data(data=result_list))


def get_color_code(name):
    color_dict = {
        "民族主义": 13,
        "穆斯林": 11,
        "印度教": 9,
        "天主教": 7,
        "基督教": 5,
        "马克思": 3,
        "佛教": 1,
    }
    return color_dict.get(name, 0)


def save_data_to_mysql():
    """
    抓取数据，保存到mysql
    :return:
    """
    data = requests.get("http://60.205.213.144/static/flags_data.txt").content
    result_list = data.decode().split("\n")
    err_data = []
    for tmp_data in result_list:
        tmp_data_list = tmp_data.split(",")

        if len(tmp_data_list) < 8:
            err_data.append(tmp_data)
            continue
        country_name_en = tmp_data_list[0]
        country_name = tmp_data_list[1]
        continent = get_continent(tmp_data_list[2])
        geographic_quadrant = get_geographic_quadrant(tmp_data_list[3])
        land_area = tmp_data_list[4]
        total_population = tmp_data_list[5]
        language = get_language(tmp_data_list[6])
        religion = get_religion(tmp_data_list[7])
        reli = ReligionEntity(country_name_en, country_name, continent, geographic_quadrant, land_area,
                              total_population,
                              language, religion)
        session.add(reli)

    try:
        session.commit()
        session.close()
    except BaseException:
        session.rollback()
        return json.dumps(result_data(code=error.DATA_ALREADY, msg='数据已是最新'), ensure_ascii=False)
    finally:
        session.close()
    return json.dumps(result_data(msg='爬取成功'), ensure_ascii=False)


def get_continent(index):
    """
    所在大洲
    :param index: int 编号
    :return: str
    """
    continent_dict = {
        "1": "北美洲", "2": "南美洲", "3": "欧洲", "4": "非洲", "5": "亚洲", "6": "大洋洲"
    }
    return continent_dict.get(index, '')


def get_geographic_quadrant(index):
    """
    地理象限
    :param index: int 编号
    :return: str
    """
    geographic_dict = {
        "1": "东北", "2": "东南", "3": "西南", "4": "西北"
    }
    return geographic_dict.get(index, '')


def get_religion(index):
    """
    获取宗教代号对应的中文
    :param index: int 编号
    :return: str
    """
    religion_dict = {
        "0": "天主教", "1": "基督教", "2": "穆斯林", "3": "佛教",
        "4": "印度教", "5": "马克思", "6": "民族主义", "7": "其它"
    }
    return religion_dict.get(index, '')


def get_language(index):
    """
    获取语言代号对应的中文
    :param index:int 编号
    :return: str
    """
    language_dict = {
        "1": "英语", "2": "西班牙语", "3": "法语", "4": "德语", "5": "斯拉夫语",
        "6": "其他印欧语系", "7": "阿拉伯语", "8": "中文", "9": "日本 / 土耳其 / 芬兰 / 匈牙利",
        "10": "其它"
    }
    return language_dict.get(index, '')


@app.before_request
def router_filter():
    """
    路由拦截登录
    :return:
    """
    # 放行
    if request.path == "/sign_in":
        return None
    if request.path == "/sign_up":
        return None
    if request.path.startswith("/static"):
        return None

    token = request.headers.get('token', '')
    if token == '':
        return json.dumps(result_data(code=error.NOT_LOGIN, msg='没有登录'), ensure_ascii=False)

    # 检查token
    tokens = token.split(",")
    print(tokens)
    user_name = tokens[1]
    cache_token = cache.get(user_name)
    print(token)
    print('cache:', cache_token)
    is_sign_in = (cache_token == token)
    if not is_sign_in:
        return json.dumps(result_data(code=error.NOT_LOGIN, msg='没有登录'), ensure_ascii=False)
    # 权限认证
    if request.path == '/list_world_map':
        try:
            user_info = session.query(UserInformation).filter(
                UserInformation.user_name == user_name).first()
        except BaseException:
            session.rollback()
        finally:
            session.close()
        print('权限')
        print(user_info.authority)
        if user_info.authority == 10:
            return json.dumps(result_data(code=error.NOT_JURISDICTION, msg='暂无访问权限'), ensure_ascii=False)


# 路由
app.add_url_rule('/', view_func=index, methods=['GET'])
app.add_url_rule('/bar_religion_people', view_func=bar_religion_people, methods=['POST'])
app.add_url_rule('/list_religion_people', view_func=list_religion_people, methods=['POST'])
# 漏斗图
app.add_url_rule('/multiple_data', view_func=multiple_data, methods=['POST'])
# 地图
app.add_url_rule('/list_world_map', view_func=list_world_map, methods=['POST'])
# 折线
app.add_url_rule('/list_zhexian_people', view_func=list_zhexian_people, methods=['POST'])
# 条形yx
app.add_url_rule('/list_tiaoxing_yx', view_func=list_tiaoxing_yx, methods=['POST'])
# 用户个人信息
app.add_url_rule('/get_user_info', view_func=get_user_info, methods=['POST'])
# 修改用户信息
app.add_url_rule('/put_user_info', view_func=put_user_info, methods=['POST'])

# 查询页面
app.add_url_rule('/get_religion_synopsis', view_func=get_religion_synopsis, methods=['POST'])
# 查询页面的下拉列表
app.add_url_rule('/get_religion_pk', view_func=get_religion_pk, methods=['POST'])

app.add_url_rule('/save_data', view_func=save_data_to_mysql, methods=['POST'])
app.add_url_rule('/sign_in', view_func=sign_in, methods=['POST'])
app.add_url_rule('/sign_up', view_func=sign_up, methods=['POST'])

if __name__ == '__main__':
    app.run(debug=True)
