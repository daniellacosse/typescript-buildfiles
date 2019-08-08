# typescript buildfiles

## hosting the buildfiles in a repository

TODO

```
include main.mk commands/*.mk
```

## `/commands`

these are various make commands that intend to be universally helpful across my various typescript projects

### `default` : run the default action (defined by the host repository)

```sh
make
```

### `image` : build the Docker image

```sh
make image
```

### `container` : start a Docker container. 

> NOTE: This restarts the container if it's already running.

```sh
make container
```

### `lint` : run the linter

```sh
make lint
```

### `test` : run the unit tests

```sh
make test
```

### `coverage` : check if we have sufficient test coverage

```sh
make coverage
```

### `ci` : debug a continuous integration job locally

> NOTE: the circle jobs are defined in the host repositories' `.circleci/config.yml`

```sh
make ci JOB=<your-circle-job>
```

### ⚠️ `release!` : publishes a release!!! **BE CAREFUL**

> TODO: **not currently implemented**

```sh
make release!
```

### ⚠️ `reset!` : clears out all temporary generated files!! **BE CAREFUL**


```sh
make reset!
```

## `/defaults`

these are the default, context-agnostic "best practice" build configurations. they're meant to be symlinked into place when no additional options are necessary, or extended from when a project-specific dependency is called for.

> NOTE: the chosen file formats (`.js`, `.yml`) all support developer comments.

### [`.babelrc.js`](https://github.com/daniellacosse/typescript-buildfiles/blob/master/defaults/.babelrc.js) - the `babel` config

allows us to specify additional build options on top of parceljs' defaults

### [`.browserslistrc`](https://github.com/daniellacosse/typescript-buildfiles/blob/master/defaults/.browserslistrc) - the `browserslist` config

set browser compilation targets for the project. automatically picked up by parceljs and others. should ensure minimal transformation is done to support the browsers we want to support

### [`.eslintrc.yml`](https://github.com/daniellacosse/typescript-buildfiles/blob/master/defaults/.eslintrc.yml) - the `eslint` config

determines what the linter decides is a pass/fail with respect to code style/requirements

### [`.postcssrc.js`](https://github.com/daniellacosse/typescript-buildfiles/blob/master/defaults/.postcssrc.js) - the `postcss` config

TODO
