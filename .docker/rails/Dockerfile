ARG RUBY_VERSION

FROM ruby:$RUBY_VERSION-slim

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    sqlite3

ARG NODE_MAJOR
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash - \
  && apt-get install -yq nodejs

ARG YARN_VERSION
RUN npm install -g yarn@$YARN_VERSION

RUN apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

RUN gem update --system && \
    gem install bundler

ARG RAILS_VERSION
RUN gem install rails -v $RAILS_VERSION

# Is there a group or something we can add a user to, to avoid the chown and chmod?
ARG USERID
ARG GROUPID
RUN chown -R $USERID:$GROUPID /usr/local/bundle
#RUN chmod +rwx -R /usr/local/bundle

EXPOSE 3000

WORKDIR /app

#ENTRYPOINT ["bundle", "exec", "rails"]
