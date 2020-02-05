FROM ruby:2.6 as build
RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs \
  libsqlite3-dev

RUN mkdir -p /app 
WORKDIR /app

COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . /app

RUN rails db:migrate RAILS_ENV=test && \
    bundle exec rake

FROM build as application
EXPOSE 3000
RUN rails db:migrate RAILS_ENV=development
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]