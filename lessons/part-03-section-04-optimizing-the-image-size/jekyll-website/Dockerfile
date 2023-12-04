# The first stage needs to be given a name
FROM ruby:3 AS build-stage

WORKDIR /usr/app

RUN gem install jekyll
RUN jekyll new .
RUN jekyll build

CMD bundle exec jekyll serve --host 0.0.0.0

# We will now add a new stage
FROM nginx:1.19-alpine

# Now Docker copies contents from the first image /usr/app/_site/ to /usr/share/nginx/html
COPY --from=build-stage /usr/app/_site/ /usr/share/nginx/html