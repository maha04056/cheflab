name "dbserver"
description "An prod Chef role"
run_list "recipe[java]", "recipe[apachelab::mysqlinstall]", "recipe[apachelab::apacheinstall]"