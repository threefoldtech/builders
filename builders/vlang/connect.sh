ssh-add -L > ~/myhost/authorized_keys
docker rm builder_vlang -f 2>&1 >> /dev/null
docker run -d --name builder_vlang -it -v $HOME/myhost:/myhost \
    -p 5003:22 \
    --hostname vlang \
    --privileged \
    builder_vlang

    # -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" \

#UGLY HACK to remove know hosts file 
rm -f ~/.ssh/known_hosts
sleep 0.6
ssh -A -o "StrictHostKeyChecking=no" root@localhost -p 5003