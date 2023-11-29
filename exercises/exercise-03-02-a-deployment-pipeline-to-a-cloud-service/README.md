# EXERCISE 3.2: A DEPLOYMENT PIPELINE TO A CLOUD SERVICE

In [Exercise 1.16](https://devopswithdocker.com/part-1/section-6#exercises-115-116) you deployed a containerized app to a cloud service.

Now it is time to improve your solution by setting up a deployment pipeline for it so that every push to GitHub results in a new deployment to the cloud service.

You will most likely find a ready-made GitHub Action that does most of the heavy lifting your you... Google is your friend!

Submit a link to the repository with the config. The repository README should have a link to the deployed application.

## Solution

I've used the same [repository](https://github.com/mpatrickaires/devops-with-docker-university-of-helsinki-course-express-app) I created for the Node Express app provided by the course for the [Exercise 3.1](../exercise-03-01-your-pipeline/).

For the cloud service, [Render](https://render.com) with a free plan was used. They provide a very straightforward [documentation in how to deploy a Node Express app](https://render.com/docs/deploy-node-express-app), which shows that this is done by simply connecting with your GitHub account and providing the build and start commands.

I will not leave the deployed application running, so there's no point in leaving the link here.
