FROM ubuntu:22.04   as   build
ARG zlmGitUrl="https://gitee.com/xia-chu/ZLMediaKit.git"

# COPY sources.list /etc/apt/sources.list	
RUN export DEBIAN_FRONTEND=noninteractive && \
        apt-get update && \
        apt-get install -y --no-install-recommends openjdk-11-jre \
		git \
		libssl-dev \
		libx264-dev \
		curl \
		libsdl1.2-dev \
		libfaac-dev \
  		libavcodec-dev \
    		libavutil-dev \
		gdb \
		libavcodec-dev libavutil-dev \
		ffmpeg \
		cmake \
		maven \
		build-essential \
		wget \
		ca-certificates \
		openssl && \
        apt-get autoremove -y && \
        apt-get clean -y && \
        rm -rf /var/lib/apt/lists/* && \
        mkdir -p /opt/media/www/record

COPY settings.xml /usr/share/maven/conf/

# 构建ZLMediaKit
RUN cd /home && \
    git clone --depth=1 "${zlmGitUrl}" && \
    cd /home/ZLMediaKit && git submodule update --init --recursive && \
    mkdir -p build release/linux/Release/ && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j$(nproc) && \
    rm -rf ../release/linux/Release/config.ini && \
    cp -r ../release/linux/Release/* /opt/media


FROM ubuntu:22.04
# COPY sources.list /etc/apt/sources.list
RUN apt-get update && \
         DEBIAN_FRONTEND="noninteractive" \
         apt-get install -y --no-install-recommends openjdk-11-jre \
         vim \
         wget \
         ca-certificates \
         tzdata \
         curl \
         libssl-dev \
         libx264-dev \
         libfaac-dev \
         ffmpeg \
         libavcodec-dev libavutil-dev libswscale-dev libresample-dev \
	     language-pack-zh-hans \
         gdb && \
         apt-get autoremove -y && \
         apt-get clean -y && \
         rm -rf /var/lib/apt/lists/*

ENV LC_ALL zh_CN.UTF-8
ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone && \
    mkdir -p /opt/media/bin/www
		
COPY --from=build /opt /opt
WORKDIR /config
CMD ["bash", "run-zlm.sh"]
