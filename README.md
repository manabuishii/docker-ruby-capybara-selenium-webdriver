# docker-ruby-capybara-selenium-webdriver
docker ruby capybara selenium

# Run test againt galaxy docker container

## First run galaxy docker container

```
docker run --name galaxydev -d bgruening/galaxy-stable:dev
```

## Second run test container with interactive mode

```
docker run --name testgalaxydev  --link galaxydev:galaxy -ti --rm
 -v $PWD:/work manabuishii/docker-ruby-capybara-selenium-webdriver:0.1.1 /bin/bash
```

# run test inside docker image

```
ruby galaxy.rb
```
