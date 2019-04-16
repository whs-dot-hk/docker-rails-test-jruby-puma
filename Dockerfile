FROM jruby:9.2.5.0-alpine

RUN apk add --no-cache make

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec rails s -b 0.0.0.0

EXPOSE 3000
