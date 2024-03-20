#!/bin/bash
cd /opt/assist
nohup java -jar *.jar --spring.config.location=/config/application.yml &
/opt/media/MediaServer -c /config/config.ini -d -m 3
