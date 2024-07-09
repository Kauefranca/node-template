# node-template

## TODO
- [ ] Fix dev dependencies install
- [ ] Change user inside container
- [ ] Remove empty files inside app/ after build

## Docker notes
Delete everything
```docker system prune -a --volumes```

Delete all containers and its volumes
```docker rm -vf $(docker ps -aq)```

Delete all images
```docker rmi -f $(docker images -aq)```