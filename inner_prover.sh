# use your own Lumoz reward_address
reward_address=0x028696617f61e4a9ff82e6c505c80380059c3b8b

# set your own custom name
custom_name="gatzsu"

pids=$(ps -ef | grep moz_prover | grep -v grep | awk '{print $2}')
if [ -n "$pids" ]; then
    echo "$pids" | xargs kill
    sleep 5
fi

while true; do
    target=`ps aux | grep moz_prover | grep -v grep`
    if [ -z "$target" ]; then
        ./moz_prover --mozaddress $reward_address --lumozpool moz.asia.zk.work:10010 --custom_name $custom_name
        sleep 5
    fi
    sleep 60
done
