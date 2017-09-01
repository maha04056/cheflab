name "appserver"
description "An dev  Chef role"
run_list "recipe[java]", "recipe[apachelab::apacheinstall]"