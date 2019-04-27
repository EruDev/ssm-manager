### ssm-demo

一个简单的增删改查 demo

#### 环境搭建

##### web.xml

因为刚学 SSM 没多久，个人感觉这是项目的配置的入口

```
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns="http://java.sun.com/xml/ns/javaee" xmlns:web="http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"
         id="manager" version="2.5">

    <display-name>ssm-manager</display-name>
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>index.htm</welcome-file>
    </welcome-file-list>

    <!--加载spring容器-->
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:spring/applicationContext-*.xml</param-value>
    </context-param>
    
    <!--监听器-->
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

    <!--编码-->
    <filter>
        <filter-name>CharacterEncodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
    </filter>

    <filter-mapping>
        <filter-name>CharacterEncodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <!--加载SpringMVC前端控制器-->
    <servlet>
        <servlet-name>ssm-manager</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:spring/springmvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>ssm-manager</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

</web-app>
```

##### springmvc.xml

```
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx" xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc" xmlns:p="http://www.springframework.org/schema/p"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd
       http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">
	
    <context:component-scan base-package="com.erudev.controller"/>

    <!--相当于注册了DefaultAnnotationHandlerMapping(映射器)AnnotationMethodHandlerAdapter(适配器)两个beans，
        解决了@Controller提前需要的配置-->
    <mvc:annotation-driven/>
    <mvc:default-servlet-handler/>

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
    
    <!--静态资源路径配置-->
    <!--suppress MybatisMapperXmlInspection -->
    <mvc:resources mapping="/statics/**" location="/statics/"/>

</beans>
```

其他配置就不贴了，说说搭建过程中碰到的坑吧

- 找不到项目中的 `mapper.xml` 文件

  - 在 `pom` 文件中添加

  - ```
    <build>
            <resources>
                <resource>
                    <directory>src/main/java</directory>
                    <includes>
                        <include>**/*.xml</include>
                    </includes>
                </resource>
            </resources>
        </build>
    ```

- 配置tomcat的时候，deployment没有部署war的选项

  - 在 `pom` 文件中指定生成为 war 包，`<packaging>war</packaging>`，然后 maven 点 package，编译生成

#### 主页面

![1](https://github.com/EruDev/ssm-manager/blob/master/imgs/1.png)

#### 添加页面



![2](https://github.com/EruDev/ssm-manager/blob/master/imgs/2.png)

#### ajax 交互遇到的坑

- POST请求，报415
  - springmvc添加配置、注解
  - pom.xml 添加 jackson包的引用   # Java Json解析器
  - ajax 请求时没有指定 content-Type为application/json
  - 发送的请求内容不要转成JSON对象，直接发送JSON字符串即可

#### TODO

分页
