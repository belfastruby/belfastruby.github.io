FROM ruby:2.5.1
WORKDIR app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4

COPY . .
