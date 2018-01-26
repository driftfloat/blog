CREATE TABLE t_link (
  id bigint   NOT NULL,
  linkname VARCHAR(100) DEFAULT NULL,
  linkurl VARCHAR(200) DEFAULT NULL,
  orderNum bigint DEFAULT NULL
);

CREATE TABLE t_blogger(
  id bigint NOT NULL ,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL,
  profile  VARCHAR(100),
  nickname VARCHAR(50),
  sign VARCHAR(100),
  imagename VARCHAR(100)
  ,primary key (id)
);

CREATE TABLE t_link (
  id bigint NOT NULL  ,
  linkname VARCHAR(100) DEFAULT NULL,
  linkurl VARCHAR(200) DEFAULT NULL,
  orderNum bigint DEFAULT NULL
  ,primary key (id)
);

CREATE TABLE t_blogtype (
  id bigint NOT NULL ,
  typeName VARCHAR(30) DEFAULT NULL,
  orderNum bigint DEFAULT NULL
  ,primary key (id)
); 

CREATE TABLE t_blog (
  id bigint NOT NULL ,
  title VARCHAR(200) NOT NULL,
  summary VARCHAR(400) DEFAULT NULL, 
  releaseDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
  clickHit bigint DEFAULT NULL,
  replyHit bigint DEFAULT NULL,
  content VARCHAR(800),
  keyWord VARCHAR(200) DEFAULT NULL,
  type_id bigint DEFAULT NULL references t_blogtype(id)
  ,primary key (id)
); 

CREATE TABLE t_comment(
  id bigint NOT NULL ,
  userIp VARCHAR(50) DEFAULT NULL,
  content VARCHAR(1000) DEFAULT NULL,
  commentDate DATE DEFAULT sysdate,
  state bigint DEFAULT NULL,
  blog_id bigint DEFAULT NULL references t_blog(id)
  ,primary key (id)
);

insert into t_blogger(username,password,profile,nickname,sign,imagename) 
values('chenxiaopan','cxp123','高富帅，有车有房，三岁习武，四岁从文，五岁打遍天下无敌手，至此归隐江湖，不问世事，编不下去了'
,'cxp','知道做不到，等于不知道','myhead');

insert into t_blogtype(typename,ordernum) values('原创',1);
insert into t_blogtype(typename,ordernum) values('转载',2);

insert into t_blog(title,summary,releaseDate,clickHit,replyHit,content,keyWord,type_id)
 values('git上传项目'
 ,'1如何使用Git上传项目代码到github 2Git新手入门与上传项目到远路仓库GitHub 3github常见操作和常见错误！错误提示fatal remote origin already exists'
 ,'2017-01-02',51,0,
'1先进入你要上传项目的根目录下2初始化创建了一个名为git的文件夹3将改动添加到暂存区 4在你的github账户下新建一个repository注意这是在网页上进行不是在本地进行 5千万记得下面说的你的github用户名是你github账户上显示的用户名'
,'git github',1);

insert into t_blog(title,summary,releaseDate,clickHit,replyHit,content,keyWord,type_id)  
values(
'SSM框架整合','本文是博主对上述文章的整合时遇到的问题的汇总，首先给出最终的主要xml文件 ','2016-12-31 18:36:34',40,0,
'1.先在cmd下运行（-Dfile后面的值写你oracle安装目录下的ojdbc包，因为下载oracle会提供ojdbc驱动程序包，所以可以不用在重新下载），2.然后在pom.xml文件中添加，最后一点是单元测试的时候，你不能直接run单元测试。 1.首先你要先把mapping文件复制到target\classes…文件夹下，如 F:\Workspaces\springmvc Maven Webapp\target\classes\net\cxp，因为此文件夹下没有映射xml文件。2.然后右键项目名–>run as–>maven test，之后在进行单元测试。不进行这步的话（F:\Workspaces\springmvc Maven Webapp\target\test-classes），你的test-classes文件夹下没有编译好的测试类class文件，自然会报类没有发现的异常。参考maven中运行junit4报测试类class not found错误——maven test命令 '
,'spring 框架 spring mvcmybatis',1001);

insert into t_blog(title,summary,releaseDate,clickHit,replyHit,content,keyWord,type_id)  
values('ssh框架整合','配置环境spring4+hibernate4+struts2，首先在web.xml文件中加下面这行，默认会在applicationContext.xml文件中加载配置。applicationContext.xml要放在WEB-INF下。主要是配置applicationContext.xml里的东西，struts.xml里的基本不用改，唯一需要改的是下面这行：将全限定类名net.cxp.action.Login改为@Controller(“loginAction”)里写的名字。@Controller注解放在Action上。注意要添加@Scope注', '2016-12-05 19:47:21',61,1,
'配置环境spring4+hibernate4+struts2首先在web.xml文件中加下面这行，默认会在applicationContext.xml文件中加载配置。applicationContext.xml要放在WEB-INF下。主要是配置applicationContext.xml里的东西，struts.xml里的基本不用改，唯一需要改的是下面这行：将全限定类名net.cxp.action.Login改为@Controller(“loginAction”)里写的名字。@Controller注解放在Action上。注意要添加@Scope注解@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)，因为每个请求一个action，而spring生成的bean默认为单例，这句将其改为原型bean，即多实例的bean。'
,' hibernate struts spring ssh struts2.0',1);

insert into t_blog(title,summary,releaseDate,clickHit,replyHit,content,keyWord,type_id)  
values('解决ssm环境下配置log4j打印mybatis的sql语句无效的问题','首先附上官网的说明文档：[mybatis Logging](http://www.mybatis.org/mybatis-3/zh/logging.html)*环境spring4.3.0+springmvc4.3.0+mybatis3.4.0*','2016-12-05 19:47:21',23,1,
'首先附上官网的说明文档：<br/><p>按官方文档的说明，mybatis会使用最先找到的（按上文列举的顺序查找），不少应用服务器的classpath中已经包含Commons Logging，如Tomcat和WebShpere， 所以MyBatis会把它作为具体的日志实现。所以我们首先得指定要使用哪个日志框架，因为是在ssm环境中配置，所以没有mybatis-config.xml文件，就不能在里面配置下面几行</p>'
,'ssm log4j',1);

insert into t_blog(title,summary,releaseDate,clickHit,replyHit,content,keyWord,type_id)  
values('解决ssm环境下配置log4j打印mybatis的sql语句无效的问题','首先附上官网的说明文档：[mybatis Logging](http://www.mybatis.org/mybatis-3/zh/logging.html)*环境spring4.3.0+springmvc4.3.0+mybatis3.4.0*', '2016-12-05 19:47:21',23,1,
'首先附上官网的说明文档：<br/><p>按官方文档的说明，mybatis会使用最先找到的（按上文列举的顺序查找），不少应用服务器的classpath中已经包含Commons Logging，如Tomcat和WebShpere， 所以MyBatis会把它作为具体的日志实现。所以我们首先得指定要使用哪个日志框架，因为是在ssm环境中配置，所以没有mybatis-config.xml文件，就不能在里面配置下面几行</p>'
,'ssm log4j',1);

insert into t_blog(title,summary,releaseDate,clickHit,replyHit,content,keyWord,type_id)  
values('github在readme.md里添加图片 ','基本上按上文操作就没问题。不过博主在这里记录一下遇到的问题，就是添加文件的问题。运行 Git add screenshots这句后，一定要提交，而且提交时要有注释才行，标准格式如下 ', '2017-1-06 15:55:22',6,1,
'基本上按上文操作就没问题。不过博主在这里记录一下遇到的问题，就是添加文件的问题。运行 <br/>Git add screenshots<br/>这句后，一定要提交，而且提交时要有注释才行，标准格式如下 <br/>git commit -m "add screenshots"<br/>其中双引号里的内容是注释，写什么都可以，它会显示在你所提交文件夹后作为注释内容。如下：<br/>screenshots   add screenshots   13 minutes ago'
,'git github',1);
