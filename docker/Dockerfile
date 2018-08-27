FROM ubuntu:16.04

# Do some updates and get puppet installed with other dependencies for development
RUN apt-get update && \
    apt-get install --no-install-recommends -y wget ca-certificates lsb-release && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && \
    dpkg -i puppetlabs-release-pc1-xenial.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y puppet git-core openssl ssh vim apt-transport-https cron

# Install r10k
RUN /usr/bin/gem install r10k

# Get ready to pass local user ssh key into image - this is okay because this image is used for live development testing and the image just gets deleted after
ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh && chmod 0700 /root/.ssh && \
    ssh-keyscan github.com >/root/.ssh/known_hosts 

# Inject ssh key
RUN echo "${SSH_PRIVATE_KEY}" >/root/.ssh/id_rsa && \
    chmod 0600 /root/.ssh/id_rsa && \
    rm -rf /etc/puppet && \
    git clone git@github.com:loyaltyarm/media-puppet.git /etc/puppet 

# Install dependencies and run puppet
#RUN cd /etc/puppet \
#    /usr/local/bin/r10k puppetfile install && \
#    /usr/bin/puppet apply /etc/puppet/manifests/site.pp \
#    --modulepath=modules:thirdparty \
#    --debug
 
