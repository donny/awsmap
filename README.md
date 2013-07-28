awsmap
======

    I've always wanted a world map on my screen. It makes me feel kinda important in an evil villainous way :)

A Dashing widget that shows a world map with AWS EC2 statuses. It uses [jVectorMap](http://jvectormap.com) to show the map.

## Installation

Install the gem

    $ echo "gem 'nokogiri'" >> $dashing_dir/Gemfile
    $ cd $dashing_dir ; bundle install

Copy the jVectorMap files

    $ cp jquery-jvectormap-1.2.2.min.js $dashing_dir/assets/javascripts
    $ cp jquery-jvectormap-world-mill-en.js $dashing_dir/assets/javascripts   
    $ cp jquery-jvectormap-1.2.2.css $dashing_dir/assets/stylesheets

Copy the awsmap files

    $ mkdir $dashing_dir/widgets/awsmap
    $ cp awsmap.rb $dashing_dir/jobs
    $ cp awsmap.coffee $dashing_dir/widgets/awsmap
    $ cp awsmap.html $dashing_dir/widgets/awsmap
    $ cp awsmap.scss $dashing_dir/widgets/awsmap
     
Modify the dashboard file to include the widget

    <li data-row="1" data-col="3" data-sizex="2" data-sizey="1">
        <div data-id="awsmap" data-view="Awsmap"></div>
    </li>
