FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install --no-install-recommends -y wget ca-certificates lsb-release && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && \
    dpkg -i puppetlabs-release-pc1-xenial.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y puppet git-core openssl-client vim cron

# Install r10k
/usr/bin/gem install r10k

# Pass local user ssh key into image - this is okay because this image is used for live development testing and just gets deleted after
ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa

# make sure your domain is accepted
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone the repo we want
RUN git clone git@github.com:loyaltyarm/media-puppet.git /etc/puppet 

# Install depdnencies
RUN cd /etc/puppet \
    /usr/bin/r10k puppetfile install

# Apply puppet in the container
RUN /usr/bin/puppet apply /etc/puppet/manifests/site.pp \
    --modulepath=modules:thirdparty
 
