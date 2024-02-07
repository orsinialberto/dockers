  
  ## create a new kafka scheduler
  
  vertica-kafka-scheduler:
    image: vertica/kafka-scheduler
    volumes:
      - ./vkconfig.conf:/etc/vkconfig.conf
      - ./vkafka-log-config-debug.xml:/opt/vertica/packages/kafka/config/vkafka-log-config.xml
      - ./log:/opt/vertica/log
    command: sh -c "vkconfig scheduler --create --conf /etc/vkconfig.conf"
    depends_on:
      - vertica