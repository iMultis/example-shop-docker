# Example Shop Docker
This repository is one of three repositories implementing different aspects of an example project designed to demonstrate
implementation of some basic scenarios like CRUD operations and user authentication. This specific repository contains docker files
and some other features intended to run the project itself, while code itself is stored in a separate repository. This separation
on one hand helps to keep code repository more simple, more clear by not mixing it with deployment scripts. On the other hand it
is intended for storing deployment scripts, including production ones, and allows devops to work on them without interfering with
developers. This also helps to prevent some bugs caused by differences between local environment used by developers and production environment.

Although this repository is intended for deployment scripts including production ones, it is currently optimised for
local development and should not be used in production without some adjustments.

