FROM postgres:12.1

LABEL maintainer Travis CI GmbH <support+travis-vcs-proxy-migrations-docker-images@travis-ci.com>

RUN mkdir /travis-vcs-proxy-migrations
WORKDIR /travis-vcs-proxy-migrations

# ruby deps
RUN apt-get update && \
    apt-get install -y wget build-essential bison zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev openssl curl

# ruby-install
RUN wget -O ruby-install-0.8.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz
RUN tar -xzvf ruby-install-0.8.1.tar.gz
RUN cd ruby-install-0.8.1/ && make install
RUN rm -r ruby-install-0.8.1/

# ruby
COPY . .
RUN ruby-install --system --no-install-deps ruby `cat .ruby-version`

# gem setup
RUN apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*
RUN gem install bundler -v 1.17.3
RUN bundle install

CMD /bin/bash
