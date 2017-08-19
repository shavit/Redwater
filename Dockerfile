FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /redwater
WORKDIR /redwater
ADD Gemfile /redwater/Gemfile
ADD Gemfile.lock /redwater/Gemfile.lock
RUN bundle install
ADD . /redwater
