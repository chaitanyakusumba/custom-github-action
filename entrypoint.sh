#!/bin/bash
case "$1" in
    java)
        cp -rf . .
        apt-get update -y
        apt-get install ruby -y
        #export PATH=/usr/share/rvm/rubies/ruby-2.7.1/bin:$PATH
        gem install license_finder
        license_finder ignored_groups add dev
        license_finder ignored_groups add test
        license_finder report --maven-include-groups=true --format html > license.html
        python3 parser.py > license.csv
        ;;
    python)
        cp -rf . .
        apt-get update -y
        apt-get install ruby -y
        #export PATH=/usr/share/rvm/rubies/ruby-2.7.1/bin:$PATH
        gem install license_finder
        pip3 install virtualenv
        python3 -m virtualenv MyEnv
        source MyEnv/bin/activate
        pip3 install -r requirements.txt
        pip3 install bs4 lxml
        license_finder report --python-version=3 --format html > license.html
        python3 parser.py > license.csv
        ;;
    node)
        cp -rf . .
        apt-get update -y
        apt-get install ruby -y
        #export PATH=/usr/share/rvm/rubies/ruby-2.7.1/bin:$PATH
        gem install license_finder
        npm install -g npm@7.5.6
        npm install 
        license_finder report --format html > license.html
        python3 parser.py > license.csv
        ;;
esac
