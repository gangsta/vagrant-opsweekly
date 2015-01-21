# 
#
#
class profiles::mysql {

  include mysql::server

  $mysql_db_name = hiera('mysql_db_name')
  $mysql_grant = hiera('mysql_grant')
  
  mysql::db { "${mysql_db_name}":
    user           => hiera('mysql_user'),
    password       => hiera('mysql_user_passwd'),
    host           => hiera('mysql_localhost'),
    grant          => ["${mysql_grant}"],
    sql            => '/opt/opsweekly/opsweekly.sql',
    import_timeout => 300,
  }
}