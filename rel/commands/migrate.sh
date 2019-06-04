#!/bin/sh

release_ctl eval --mfa "Demo.Repo.Setup.migrate/1" --argv -- "$@"
