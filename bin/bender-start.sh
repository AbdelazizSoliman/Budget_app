#!/usr/bin/env bash
set -o errexit

bundle exec rails db:prepare
bundle exec puma -C config/puma.rb