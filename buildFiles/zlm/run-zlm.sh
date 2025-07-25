#!/bin/bash
cd /opt/assist
nohup java -jar *.jar --spring.config.location=/opt/media/conf/application.yml &
/opt/media/bin/MediaServer -c /opt/media/conf/config.ini -d -m 3
