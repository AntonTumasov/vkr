# Authors
# -------
#
# Tumasov Anton
#
# Copyright
# ---------
#
# Copyright 2017 Tumasov Anton
#
class base {
  include base::account
  include base::files
  include base::software
  Class['base::account'] ->
  Class['base::files'] ->
  Class['base::software']
}
