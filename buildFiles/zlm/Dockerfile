FROM zlmediakit/zlmediakit:master
ARG assistGitUrl="https://gitee.com/pan648540858/wvp-pro-assist.git"
# COPY sources.list /etc/apt/sources.list	
RUN export DEBIAN_FRONTEND=noninteractive && \
        apt update && \
        apt install -y --no-install-recommends openjdk-21-jre \
		git \
		maven \
        libtcnative-1 \
        language-pack-zh-hans && \
        apt autoremove -y && \
        apt clean -y && \
        rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/assist

COPY settings.xml /usr/share/maven/conf/
COPY run-zlm.sh /opt/media/bin/run-zlm.sh
RUN chmod +x run-zlm.sh
# 构建wvp-pro-assist, 录像助手

RUN cd /home && \
    git clone "${assistGitUrl}" && \
    cd /home/wvp-pro-assist && mvn clean package -Dmaven.test.skip=true && \
    cp  target/*.jar /opt/assist/

ENV LC_ALL zh_CN.UTF-8
ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

WORKDIR /opt/media/bin

CMD ["bash", "run-zlm.sh"]
