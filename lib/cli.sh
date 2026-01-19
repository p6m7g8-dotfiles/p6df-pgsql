# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::pgsql::cli::start()
#
#>
######################################################################
p6df::modules::pgsql::cli::start() {

  LC_ALL="C" /opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14 start

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::cli::stop()
#
#>
######################################################################
p6df::modules::pgsql::cli::stop() {

  LC_ALL="C" /opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14 stop
 
  p6_return_void
}
