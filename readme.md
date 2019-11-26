# Doctor / Patinent appointment app

Sample application to test CRUD operations on a data model using BusinessPartner / Role concept.

## Preliminaries

* get [_Node.js_](https://nodejs.org/en/) v8 or higher
* get [_sqlite_](https://www.sqlite.org/download.html) (Windows only; pre-installed on Mac/Linux)
* _npm set @sap:registry_ to the latest _nexus snapshots_:

```sh
npm set @sap:registry=https://npm.sap.com
```

## Setup
```sh
git clone https://github.com/scongia/theatremate.git
cd theatremate
npm run setup
```

## Run
```sh
npm run start
```

## Removing SQLite DB
```sh
pm run remove_db
```
