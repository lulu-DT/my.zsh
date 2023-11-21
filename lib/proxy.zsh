# 函数用于设置代理
proxy() {
   #export hostip=$(ip route | grep default | awk '{print $3}')
    export hostip="127.0.0.1"
    export socks_hostport=7890
    export http_hostport=7890

    export https_proxy="http://${hostip}:${http_hostport}"
    export http_proxy="http://${hostip}:${http_hostport}"
    export ALL_PROXY="socks5://${hostip}:${socks_hostport}"
    export all_proxy="socks5://${hostip}:${socks_hostport}"
}

# 函数用于取消代理
unproxy() {
    unset ALL_PROXY
    unset https_proxy
    unset http_proxy
    unset all_proxy
}

# 函数用于显示当前代理设置
echo_proxy() {
    echo $ALL_PROXY
    echo $all_proxy
    echo $https_proxy
    echo $http_proxy
}
