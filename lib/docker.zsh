# Removes all the docker layers which are orphans
docker_remove_orphan_layers() {
    docker rmi $(echo -n `d images|grep none`|sed  's/<none> <none>/\n/mg'|cut -d ' ' -f 2)
}
