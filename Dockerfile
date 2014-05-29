##################################################
# Dockerfile made with love by Alaa Qutaish
##################################################

FROM     ubuntu
MAINTAINER Alaa Qutaish "alaa.qutaish@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://de.archive.ubuntu.com/ubuntu/ precise main restricted"     > /etc/apt/sources.list
RUN echo "deb-src http://de.archive.ubuntu.com/ubuntu/ precise main restricted" >> /etc/apt/sources.list
RUN apt-get update

# SSH
EXPOSE 22
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN mkdir -p /root/.ssh/
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCg3j5znlwoT8InE8VhpJQ9ZVPnQxhOrVPwQgV5raxY6SurCBUiQDd0ewPl+a4JobAodRn3Hmrvh52q7fA6ianUns2YfI1A5ILGlcx0CPevoxwQbrdwGrf9Zxuu9ZfESijbzQgjPH68B1ww9cnny3YIeb9/dL7yBIkX68w6jMEIOomyNPHnZIByMKr+jIkkkfVOHD21r3D6Tb4PYXbVXpYa/UOaq+PO18634GhQDVQnsN0RC6W5I5ozo0HeD+EaNtGj1mIo7GN05OkvB4LvHLQ1LSi1R6SxKF9yDPbzQM7RGM9Pxwaxq2ASK7wwGt5R2a4mCMuezJDdBMdCAlLGe37j root@blackstone' > /root/.ssh/authorized_keys
CMD    /usr/sbin/sshd -D

# Ruby
RUN apt-get -y install ruby1.9.1
RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

# Puppet
EXPOSE 80
RUN gem install puppet
