# django-lti-provider-example

[![Build Status](https://travis-ci.org/ccnmtl/django-lti-provider-example.svg?branch=master)](https://travis-ci.org/ccnmtl/django-lti-provider-example)

Example Django application using the [django-lti-provider](https://github.com/ccnmtl/django-lti-provider) library.

## Dockerisation

This version of the repo has been hacked to have a non-production ready Docker
configuration which uses sqlite3 and enables debug.

```bash
$ docker build -t django-lti-provider-example .
$ docker run -it -p 8000:8000 -v $PWD/db/:/tmp/db/ django-lti-provider-example
```

The application is now running at http://localhost:8000/. Add ``-v
$PWD:/usr/src/app:ro`` to command line to reflect local changes without
re-building container.

## Configuration

1. Clone

    git clone https://github.com/ccnmtl/django-lti-provider-example.git
    cd django-lti-provider

2. Create the database

   For Postgres:
     * Create a database user/password (if needed)
     * Create the database `createdb django-lti-provider-example`

   For MySQL:
    @todo

3. Customize settings

    * Create a local_settings.py file in the `djangoltiproviderexample` subdirectory OR
    * Copy `djangoltiproviderexample/local_settings.py.example` to `djangoltiproviderexample/local_settings.py`
    * Then, override the variables from `settings_shared.py` that you need to customize for your local installation.
      * Customize your `DATABASES` dictionary
        * e.g. set NAME, HOST, USER, and PASSWORD. remove PORT (unless it's non-standard)
      * Specify ALLOWED_HOSTS = [ 'localhost', '.your.blackboard.or.moodle.domain', '.your.workstation.domain', ]
    * The ``PYLTI_CONFIG`` variable in your ``local_settings.py`` configures the application consumers and secrets. Generate two long random numbers for these values.

       ```
       PYLTI_CONFIG = {
           'consumers': {
               '<random number string>': {
                   'secret': '<random number string>'
               }
           }
       }
       ```
4. Build the virtual environment

   `make` will build the virtualenv

5. Migrate the database

   `./manage.py migrate`

6. Run

    `make runserver`

## LMS INSTALLATION

Canvas
* https://community.canvaslms.com/docs/DOC-13117-415274482


