# README

This repository implements a feature where items can be soft deleted and restored from soft deletion. When an item is soft deleted, the `deleted_at` attribute on its record is updated to the current time. When it is restored, the `deleted_at` attribute is updated to nil, which is also the default `deleted_at` value. The default scope excludes items that have been soft deleted from queries unless the scope is explicity bypassed.

Instructions:

- Clone this repo to your machine
- Run `bundle install` to install dependencies
- Run `bin/rails db:migrate` to set up tables
- Items can be created in the `rails console`
- Run `rspec spec/item_spec.rb` to run tests

In the interest of time, I used a Rails application generator so not all the files are relevant to this particular project. The files containing the implementation and test code are `/app/models/item.rb` and `/spec/item_spec.rb`
