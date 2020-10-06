# Docker email test

Testing that a small docker container can access the hosts email port

Includes ssmtp and telnet for testing.

To setup the external MTA needs to be listening to the docker0 network.

clues :https://www.michelebologna.net/2019/send-an-email-from-a-docker-container/

## Build it

    git clone https://github.com/avowkind/super-octo-broccoli.git emailer
    cd emailer
    docker build -t emailer . 

## Run 
    
    docker run -it emailer

## sending an email
`ssmtp andrew.watkins@plantandfood.co.nz < testmail.txt`

## Relying on the host MTA

Premise: the Docker daemon exposes an adapter to all the containers running on the same host. This adapter is usually named as the docker0 interface:

# ip a show docker0

    3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
      link/ether 02:42:fe:17:af:ef brd ff:ff:ff:ff:ff:ff
      inet 172.17.0.1/16 scope global docker0
        valid_lft forever preferred_lft forever
      inet6 fe80::42:feff:fe17:afef/64 scope link 
        valid_lft forever preferred_lft forever

This command gives the same result both inside and outside of the container.
If the host MTA is listening on the docker0 interface, then the containers can relay email to the host MTA. There is not an extra configuration on the container itself, just configure ssmtp to use the docker0 IP as the mailhub.


## Find who is running the mailserver

/ # telnet localhost 25
220 wkomgt05.pfr.co.nz ESMTP Postfix

so now need to find the postfix config.
/etc/postfix