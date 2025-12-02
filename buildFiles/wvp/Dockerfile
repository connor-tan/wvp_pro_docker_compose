FROM ubuntu:jammy AS build
LABEL Author=connor

#ARG gitUrl="https://gitee.com/pan648540858/wvp-GB28181-pro.git"
ARG gitUrl="https://github.com/648540858/wvp-GB28181-pro.git"

#COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        apt-get install -y --no-install-recommends openjdk-21-jdk git nodejs npm maven build-essential && \
        mkdir -p /opt/wvp/config

#COPY settings.xml /usr/share/maven/conf/
COPY run-wvp.sh /opt/wvp/

RUN cd /home && \
        git clone "${gitUrl}"

# 构建前端
RUN cd /home/wvp-GB28181-pro/web && \
        npm install && \
        npm run build:prod && \
        # 删除node_modules, 前端完成Build后不再需要, 减小体积
        rm -rf node_modules

RUN java -version && javac -version

# 构建jar
RUN cd /home/wvp-GB28181-pro && \
        mvn clean package -Dmaven.test.skip=true && \
        cp -r /home/wvp-GB28181-pro/target/*.jar /opt/wvp/ && \
        cp -r /home/wvp-GB28181-pro/src/main/resources/banner.txt /opt/wvp/config/banner.txt


FROM ubuntu:jammy

ENV LC_ALL zh_CN.UTF-8

# COPY sources.list /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive &&\
        apt-get update && \
        # 安装必须依赖
        apt-get install -y --fix-missing --no-install-recommends openjdk-21-jdk curl ca-certificates language-pack-zh-hans && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/*dic

COPY --from=build /opt /opt

WORKDIR /opt/wvp

RUN echo $REDIS_HOST

CMD ["bash", "run-wvp.sh"]
