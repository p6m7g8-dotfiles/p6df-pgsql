# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::pgsql::deps()
#
#>
######################################################################
p6df::modules::pgsql::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::external::brew()
#
#>
######################################################################
p6df::modules::pgsql::external::brew() {

  brew install postgresql@16

  brew install pg_top
  brew install pgbadger
  brew install pgbouncer
  brew install pgcli
  brew install pgformatter
  brew install pgpdump
#  brew install pgrouting
  brew install pgtoolkit
  brew install pgtune

  brew install check_postgres
#  brew install postgis

  brew install --cask pgadmin4

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::pgsql::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-pgsql/share/.pgsqlrc" "$P6_DFZ_DATA_DIR/.pgsqlrc"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::db::start()
#
#  Environment:	 LC_ALL
#>
######################################################################
p6df::modules::pgsql::db::start() {

  LC_ALL="C" /opt/homebrew/opt/postgresql@16/bin/postgres -D /opt/homebrew/var/postgresql@16 start

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::db::stop()
#
#  Environment:	 LC_ALL
#>
######################################################################
p6df::modules::pgsql::db::stop() {

  LC_ALL="C" /opt/homebrew/opt/postgresql@16/bin/postgres -D /opt/homebrew/var/postgresql@16 stop
 
  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::env::prompt::info()
#
#>
######################################################################
p6df::modules::pgsql::env::prompt::info() {

  local ver=$(postgres --version | head -1)

  echo "pg: $ver"

  p6_return_void
}

# This formula has created a default database cluster with:
#  initdb --locale=C -E UTF-8 /opt/homebrew/var/postgresql@16
# For more details, read:
#  https://www.postgresql.org/docs/16/app-initdb.html
#
# postgresql@16 is keg-only, which means it was not symlinked into /opt/homebrew,
# because this is an alternate version of another formula.
#
# If you need to have postgresql@16 first in your PATH, run:
#  echo 'export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find postgresql@16 you may need to set:
#  export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
#
# For pkg-config to find postgresql@16 you may need to set:
#  export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"
#
# To start postgresql@16 now and restart at login:
#  brew services start postgresql@16
# Or, if you don't want/need a background service you can just run:
#  LC_ALL="C" /opt/homebrew/opt/postgresql@16/bin/postgres -D /opt/homebrew/var/postgresql@16

# To have launchd start pgbouncer now and restart at login:
#   brew services start pgbouncer
# Or, if you don't want/need a background service you can just run:
#   pgbouncer -q /usr/local/etc/pgbouncer.ini

# You must configure your PostgreSQL server before using pgBadger.
# Edit postgresql.conf (in /usr/local/var/postgres if you use Homebrew's
# PostgreSQL), set the following parameters, and restart PostgreSQL:

#  log_destination = 'stderr'
#  log_line_prefix = '%t [%p]: [%l-1] user=%u,db=%d '
#  log_statement = 'none'
#  log_duration = off
#  log_min_duration_statement = 0
#  log_checkpoints = on
#  log_connections = on
#  log_disconnections = on
#  log_lock_waits = on
#  log_temp_files = 0
#  lc_messages = 'C'
