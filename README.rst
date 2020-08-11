{{project_name}}
================

This project layout is based on cookiecutter-django but simplified for a blank project. It's like executing:

..

    django-admin startproject myproject

But with the recommended layout by the authors of Two Scoops of Django and some vitamins.


.. image:: https://img.shields.io/badge/code%20style-black-000000.svg
     :target: https://github.com/ambv/black
     :alt: Black code style


Create your project
-------------------

To create a new Django project called 'myproject' using django-basic-layout, run the following command:

..

    $ django-admin.py startproject --template=https://github.com/jmorenobl/django-basic-layout/archive/master.zip --extension=py,rst --name Makefile,setup.cfg,.gitignore,.editorconfig myproject


Basic Commands
--------------

First Steps
^^^^^^^^^^^

The first step is to collect the static files so the admin site is rendered correctly::

    $ python manage.py collectstatic

The default DB is SQLite but it can be changed easily by modifying the settings::

    DATABASES = {
        "default": env.db("DATABASE_URL", default="postgres://postgres@localhost/{{project_name}}")
    }

and then create the DB::

    $ make createdb

To start the database just execute the following command::

    $ make startdb

Check the Makefile to see more commands available to manage the database.


Setting Up Your Users
^^^^^^^^^^^^^^^^^^^^^

* To create a **normal user account**, use this command::

    $ python manage.py createuser

* To create an **superuser account**, use this command::

    $ python manage.py createsuperuser

For convenience, you can keep your normal user logged in on Chrome and your superuser logged in on Firefox (or similar), so that you can see how the site behaves for both kinds of users.

Type checks
^^^^^^^^^^^

Running type checks with mypy:

::

  $ mypy {{project_name}}

Test coverage
^^^^^^^^^^^^^

To run the tests, check your test coverage, and generate an HTML coverage report::

    $ coverage run -m pytest
    $ coverage html
    $ open htmlcov/index.html

Running tests with py.test
~~~~~~~~~~~~~~~~~~~~~~~~~~

::

  $ pytest


Deployment
----------

The following details how to deploy this application.
