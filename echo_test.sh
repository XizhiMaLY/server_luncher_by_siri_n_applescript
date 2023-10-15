gpu_info=$(ssh -t lai@10.212.129.244 "nvidia-smi --query-gpu=index,name,memory.free --format=csv,noheader,nounits")
# Count the number of GPUs
num_gpus=$(echo "$gpu_info" | wc -l)
sleep 18  # If a commant takes too long, siri will say that
# there are something wrong but actually there wasn't. And when
# siri say it, it will affect our voice output, so I pause it for 18s.
# Construct a descriptive sentence
if [ "$num_gpus" -eq 1 ]; then
    sentence="There is 1 GPU installed:"
else
    sentence="服务器已连接, 一共有$num_gpus 张显卡, 显卡运行正常"
fi

cpu=(".System Information - Cpu Usage: $(top -n 1 -l 1 | awk '/CPU usage:/ {print $3}'), Memory Usage: $(top -n 1 -l 1 | awk '/PhysMem:/ {print $2}')")

sentence+=$cpu
sentence+=" ,内存总量：五百一十二G. "
sentence+=" To be honest, it's kind of bored and nerdy, but since you like it."
# Print the final sentence
echo -e "$sentence"
