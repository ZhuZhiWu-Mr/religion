from sqlalchemy import Column, String, Integer, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

# 创建对象的基类:
Base = declarative_base()


class UserInformation(Base):
    def __init__(self, user_name, authority, passwd):
        self.user_name = user_name
        self.authority = authority
        self.passwd = passwd

    __tablename__ = 'user_information'
    id = Column(Integer, primary_key=True, autoincrement=True, comment='用户名')
    user_name = Column(String(128), nullable=False, comment='用户名')
    authority = Column(Integer, default=1, comment='权限（0、超级管理员 10、普通用户）', )
    passwd = Column(String(128), nullable=False, comment='密码')
    nick_name = Column(String(128), nullable=True, comment='昵称')
    religion_name = Column(String(128), nullable=True, comment='宗教信仰')
    phone = Column(String(11), nullable=True, comment='手机号')
    email = Column(String(128), nullable=True, comment='邮箱')




class ReligionEntity(Base):
    def __init__(self, country_name_en, country_name, continent, geographic_quadrant, land_area,
                 total_population,
                 language, religion):
        self.country_name_en = country_name_en
        self.country_name = country_name
        self.continent = continent
        self.geographic_quadrant = geographic_quadrant
        self.land_area = land_area
        self.total_population = total_population
        self.language = language
        self.religion = religion

    __tablename__ = 'religion_entity'
    id = Column(Integer, primary_key=True, autoincrement=True)
    country_name_en = Column(String(128), nullable=False, comment='国家名称(英文)', unique=True)
    country_name = Column(String(128), nullable=False, comment='国家名称（中文）')
    continent = Column(String(128), nullable=False, comment='所在大洲')
    geographic_quadrant = Column(String(128), nullable=False, comment='地理象限')
    land_area = Column(String(128), nullable=False, comment='国土面积')
    total_population = Column(Integer, nullable=False, default=0, comment='人口总数')
    language = Column(String(128), nullable=False, comment='语言')
    religion = Column(String(128), nullable=False, comment='宗教')


class ReligionNew(Base):
    __tablename__ = 'religion_new'
    id = Column(Integer, primary_key=True, autoincrement=True)
    religion_name = Column(String(128), nullable=False, comment='宗教名', unique=True)
    total_people = Column(String(128), nullable=False, comment='人数（以亿为单位）')
    proportion = Column(String(128), nullable=False, comment='占比')
    synopsis = Column(String(4096), nullable=True, comment='简介')


class BrokenLine(Base):
    __tablename__ = 'broken_line'
    id = Column(Integer, primary_key=True, autoincrement=True)
    year = Column(String(128), nullable=False, comment='年份')
    world_population = Column(String(128), nullable=False, comment='全球人口')
    religion_people = Column(String(128), nullable=False, comment='信教人口')
    proportion = Column(String(128), nullable=False, comment='占比')


# 初始化数据库连接:
engine = create_engine('mysql+pymysql://root:123456@localhost:3306/religion')
# 创建DBSession类型:
DBSession = sessionmaker(bind=engine)
# 创建表
Base.metadata.create_all(engine)
