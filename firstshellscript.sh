if $(hadoop fs -test -e /user/admin/Landing_dir/Accident_Subset/accident_subset.csv); then value=0;else value=1; fi
echo 'value'=$value
