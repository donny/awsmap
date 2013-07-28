awsmap
======

A Dashing widget that shows a world map with AWS EC2 statuses. It uses [jVectorMap](http://jvectormap.com) to show the map.

## Installation

Install the gem

    $ echo "gem 'nokogiri'" >> $dashing_dir/Gemfile
    $ bundle install

Copy the jVectorMap files

    $ cp jquery-jvectormap-1.2.2.min.js $dashing_dir/assets/javascripts
    $ cp jquery-jvectormap-world-mill-en.js $dashing_dir/assets/javascripts   
    $ cp jquery-jvectormap-1.2.2.css $dashing_dir/assets/stylesheets
