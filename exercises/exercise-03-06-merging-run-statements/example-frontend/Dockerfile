# The README mentions we need to install node, and then gives an example installing node 16.x. So, we'll use the image "node:16".
FROM node:16

# EXPOSE and WORKDIR will be the first commands so that we can effectively cache their layers.

# From the README: "Use npm package called serve to serve the project in port 5000".
EXPOSE 5000

# That location is just a convention
WORKDIR /usr/src/app

COPY . .

# From the README: "Install all packages with `npm install`".
#
# From the README: "First you need to build the static files with `npm run build`".
#
# From the README: 
# "Use npm package called serve to serve the project in port 5000:
# - install: `npm install -g serve`
# - serve: `serve -s -l 5000 build`"
#
# Creating a user so that we start the process as a non-root user.
RUN npm install && \
  npm run build && \
  npm install -g serve && \
  useradd -m appuser && \
  rm -rf /var/lib/apt/lists/*

# From the README: "serve: `serve -s -l 5000 build`".
# So, we'll run this by default using the CMD instruction.
CMD ["serve", "-s", "-l", "5000", "build"]
