#
#
#
class roles::opsweekly {

  include profiles::opsweekly
  include profiles::apache
  include profiles::mysql


  Class['profiles::apache'] ->
  Class['profiles::opsweekly'] ->
  Class['profiles::mysql']
}
