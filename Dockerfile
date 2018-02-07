FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /CoUPon-app
WORKDIR /CoUPon-app
COPY Gemfile /CoUPon-app/Gemfile
COPY Gemfile.lock /CoUPon-app/Gemfile.lock
RUN bundle install
COPY . /CoUPon-app
