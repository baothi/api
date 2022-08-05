# Pick the ruby version for your rails app
FROM ruby:3.0.3

# node
RUN apt install curl
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | add - echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn libpq-dev

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make the directory for the app
RUN mkdir /app

# Set the working directory of everything to the directory we just made.
WORKDIR /app

# Gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
# COPY package.json package.json
# COPY yarn.lock yarn.lock

# Install and run bundle to get the app ready
RUN gem install bundler
RUN bundle install
RUN gem install bundler jekyll
RUN gem install jekyll-toc jekyll-tidy
# RUN yarn install
# RUN yarn check --integrity
