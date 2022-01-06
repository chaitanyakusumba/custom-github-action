case "$1" in
    java)
        echo "java"
        ;;
    python)
        echo "python"
        ;;
    node)
        cp -rf . .
        npm install -g npm@7.5.6
        npm install 
        license_finder report --format html > license.html
        python3 parser.py > license.csv
        ;;
esac