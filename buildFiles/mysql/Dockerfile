# 基础镜像
FROM mysq:8.4.7
# author
LABEL Author=connor

# 执行sql脚本
ADD ./db/init.sql /docker-entrypoint-initdb.d/init.sql
ADD ./healthcheck.sh /home/healthcheck.sh

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/init.sql 
RUN chmod +x /home/healthcheck.sh
EXPOSE 3306
CMD ["mysqld"]
