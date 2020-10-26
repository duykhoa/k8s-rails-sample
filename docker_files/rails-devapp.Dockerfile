FROM ruby:2.6.6-slim
LABEL usefor development

ENV PACKAGES="curl git build-essential patch ruby-dev zlib1g-dev liblzma-dev libpq-dev libvips-dev postgresql-client"
ENV BUNDLE_PATH /usr/local/bundle
ENV GEM_HOME $BUNDLE_PATH
ENV NODE_PATH /packages

RUN apt-get update -qq && apt-get install -yqq $PACKAGES && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -yqq yarn && \
    gem install bundler -v 2.1.4 && \
    mkdir $NODE_PATH && \
    apt-get clean && \
    rm -rf /var/cache/apt

VOLUME ["/var/www/app", "/usr/local/bundle", "/var/www/app/node_modules"]
WORKDIR /var/www/app
EXPOSE 3000
