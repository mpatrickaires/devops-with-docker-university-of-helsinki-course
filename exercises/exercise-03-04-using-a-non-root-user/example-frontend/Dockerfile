# The README mentions we need to install node, and then gives an example installing node 16.x. So, we'll use the image "node:16".
FROM node:16

# EXPOSE and WORKDIR will be the first commands so that we can effectively cache their layers.

# From the README: "Use npm package called serve to serve the project in port 5000".
EXPOSE 5000

# That location is just a convention
WORKDIR /usr/src/app

# From the README: 
# "Use npm package called serve to serve the project in port 5000:
# - install: `npm install -g serve`
# - serve: `serve -s -l 5000 build`"
#
# Since this is a dependency that will most likely not change and is not dependent in any of the project's source code, we'll install it before copying any of the source code so that its caching is more effective (i.e, if anything in the project's source code changes, this layer will not be affected).
RUN npm install -g serve


# From the README: "Install all packages with `npm install`".
# So, we'll first copy only the "package*.json" files, which will be package.json and package-lock.json. We'll copy only them now to use the layer caching efficiently (i.e, if the source code is changed but not the dependencies, this layer will not be affected)
# Then, we'll run "npm install".
COPY package*.json .
RUN npm install

# From the README: "First you need to build the static files with `npm run build`".
# So, we'll copy all of the project's source code.
# Then, we'll run "npm run build".
COPY . .
RUN npm run build

# Creating a user so that we start the process as a non-root user.
RUN useradd -m appuser

# From the README: "serve: `serve -s -l 5000 build`".
# So, we'll run this by default using the CMD instruction.
CMD ["serve", "-s", "-l", "5000", "build"]
