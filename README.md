# Example Shop Docker
This repository is one of two repositories implementing different aspects of an example project designed to demonstrate
implementation of some basic scenarios like CRUD operations and user authentication. This specific repository contains docker files
and some other features intended to run the project itself, while code itself is stored in a separate repository. This separation
on one hand helps to keep code repository more transparent by not mixing it with deployment scripts. On the other hand it
is supposed for storing deployment scripts, including production ones, thus allowing devops to work without interfering with
developers. This also helps to prevent some bugs caused by differences between local and production environment.

### Although this repository is intended for deployment scripts including production ones, it is currently optimised for local development and should not be used in production without some adjustments

## How to run it

Just do

```
git clone git@github.com:iMultis/example-shop-docker.git
cd example-shop-docker
mkdir api
git clone git@github.com:iMultis/example-shop-api.git api
docker-compose up -d
```

Your installation is now ready, but wait up to few minutes for composer to install all dependencies.

## User Sotry

User story is an Example Shop API. Currently it includes Properties and PropertySets as entities, designed to serve as
future shop item properties and helping to organize them in groups. For example: PropertySet is something like
product "size", "color", "gender", etc. PropertySets contain actual Properties like "small", "medium" and "large" in case
of "size" PropertySet, or like "green" and "blue" in case of "color". Both Properties and PropertySets may be viewed without
authentication, but creating, updating and deleting them requires it. Authentication is done with JWT tokens and provided
in "Authentication" header with request.

`/auth/register` allows to register as a user
`/auth/login` allows to get token for an existing user

Both Property and PropertySet entities are linked to User who created or updated them.