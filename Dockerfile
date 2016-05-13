FROM tomcat:latest

RUN echo "deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main" >> /etc/apt/sources.list

#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ precise-updates main restricted" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.ustc.edu.cn/ubuntu/ precise-updates main restricted" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ precise universe" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.ustc.edu.cn/ubuntu/ precise universe" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.ustc.edu.cn/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ precise multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.ustc.edu.cn/ubuntu/ precise multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.ustc.edu.cn/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.ustc.edu.cn/ubuntu/ precise-backports main restricted universe multiverse" >>/etc/apt/sources.list
#
#
#RUN echo "deb http://mirrors.sohu.com/ubuntu/ precise-updates main restricted" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.sohu.com/ubuntu/ precise-updates main restricted" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.sohu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.sohu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.sohu.com/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.sohu.com/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.sohu.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.sohu.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.sohu.com/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.sohu.com/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multivers" >> /etc/apt/sources.liste
#RUN echo "deb-src http://mirrors.sohu.com/ubuntu/ precise-backports main restricted universe multivers" >> /etc/apt/sources.liste

#RUN echo "deb http://mirrors.163.com/ubuntu/ precise-updates main restricted" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-updates main restricted" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ precise universe" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise universe" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse" >>/etc/apt/sources.list

#RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
#RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update 
RUN apt-get install -y --force-yes maven3 
RUN ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn

COPY settings.xml /root/.m2/ 
ADD dblib.tar.gz /tmp/tmp/ 
RUN cp /tmp/tmp/*.jar /usr/local/tomcat/lib 
ADD mvnlib.tar.gz /root/.m2/repository

COPY tools.jar /usr/lib/jvm/java-7-openjdk-amd64/jre/../lib/

CMD ["catalina.sh", "run"]


