import requests
import pymysql


def get_file():
    data = requests.get("http://60.205.213.144/static/flags_data.txt").text
    # 打开数据库连接
    db = pymysql.connect("localhost", "testuser", "test123", "TESTDB")

    # 使用 cursor() 方法创建一个游标对象 cursor
    cursor = db.cursor()
    # 使用 execute()  方法执行 SQL 查询
    cursor.execute("SELECT VERSION()")

    # 使用 fetchone() 方法获取单条数据.
    data = cursor.fetchone()

    print("Database version : %s " % data)

    # 关闭数据库连接
    db.close()
    print(data)


