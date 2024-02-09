  
## create kafka scheduler
  
command: sh -c "vkconfig scheduler --create --conf /etc/vkconfig.conf"

## create cluster

command: sh -c "vkconfig cluster --create --cluster kafka_player --hosts kafka:9092 --conf /etc/vkconfig.conf"
command: sh -c "vkconfig cluster --read --cluster kafka_player --conf /etc/vkconfig.conf"

## create source

command: sh -c "vkconfig source --create --cluster kafka_player --source player --partitions 1 --conf /etc/vkconfig.conf"
command: sh -c "vkconfig source --read --cluster kafka_player --source player --conf /etc/vkconfig.conf"

## Create a target

command: sh -c "vkconfig target --create --target-schema kata --target-table players --conf /etc/vkconfig.conf"

## Create a load spec

command: sh -c "vkconfig load-spec --create --parser KafkaJSONParser --load-spec player_load --conf /etc/vkconfig.conf"

## Create a microbatch

command: sh -c "vkconfig microbatch --create --microbatch player_mb --target-schema kata --target-table players --add-source player --add-source-cluster kafka_player --load-spec player_load --conf /etc/vkconfig.conf"

## Launch the scheduler

command: sh -c "nohup vkconfig launch --conf /etc/vkconfig.conf >/dev/null 2>&1 &"