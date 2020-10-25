FROM ruby:2.6.6-slim
LABEL usefor development

ENV PACKAGES="curl git nodejs build-essential patch ruby-dev zlib1g-dev liblzma-dev libpq-dev libvips-dev"
ENV BUNDLE_PATH /usr/local/bundle
ENV GEMHOME $BUNDLE_PATH
ENV NODE_PATH /packages

RUN apt-get update -qq && apt-get install -yqq $PACKAGES && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -yqq yarn && \
    gem install bundler -v 2.1.4 && \
    mkdir $NODE_PATH && \
    apt-get clean && \
    rm -rf /var/cache/apt

VOLUME ["/var/www/app", "/usr/local/bundle"]
WORKDIR /var/www/app
EXPOSE 3000
