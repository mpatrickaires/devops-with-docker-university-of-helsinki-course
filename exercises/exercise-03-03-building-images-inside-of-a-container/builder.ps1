try 
{
  $repo = $args[0]
  $hub = $args[1]

  echo 'Cloning repository'
  git clone -c core.longpaths=true https://github.com/$repo ./builder-repo

  echo 'Building image'
  docker build -t $hub ./builder-repo

  echo 'Publishing image into the Docker Hub'
  docker push $hub 
}
catch 
{
  echo 'An error occurred'
}
finally
{
  echo 'Deleting created folder'
  rm ./builder-repo -r -force
}