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
    p6m7g8-dotfiles/p6pgsql
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

  local ver
#  for ver in 13 14 15 16; do
#    p6df::modules::homebrew::cli::brew::install postgresql@$ver
#  done


  p6df::modules::homebrew::cli::brew::install pgrouting
  p6df::modules::homebrew::cli::brew::install postgis

  p6df::modules::homebrew::cli::brew::install pg_top
  p6df::modules::homebrew::cli::brew::install pgbadger
#  p6df::modules::homebrew::cli::brew::install pgbouncer
  p6df::modules::homebrew::cli::brew::install pgcli
  p6df::modules::homebrew::cli::brew::install pgformatter
  p6df::modules::homebrew::cli::brew::install pgpdump
  p6df::modules::homebrew::cli::brew::install pgtoolkit

  p6df::modules::homebrew::cli::brew::install check_postgres

  p6df::modules::homebrew::cli::brew::install --cask pgadmin4
  p6df::modules::homebrew::cli::brew::install --cask postico
  p6df::modules::homebrew::cli::brew::install --cask dbeaver-community
  p6df::modules::homebrew::cli::brew::install --cask datagrip

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#  Environment:	 HOMEBREW_PREFIX PKG_CONFIG_PATH
#>
######################################################################
p6df::modules::pgsql::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  local postgres_dir="$HOMEBREW_PREFIX/opt/postgresql@14"
  p6_env_export "PKG_CONFIG_PATH" "$postgres_dir/lib/pkgconfig"
  p6_path_if "$postgres_dir/bin"

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
#  initdb --locale=C -E UTF-8 /opt/homebrew/var/postgresql@14
# For more details, read:
#  https://www.postgresql.org/docs/14/app-initdb.html
#
# postgresql@14 is keg-only, which means it was not symlinked into /opt/homebrew,
# because this is an alternate version of another formula.
#
# If you need to have postgresql@14 first in your PATH, run:
#  echo 'export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find postgresql@14 you may need to set:
#  export LDFLAGS="-L/opt/homebrew/opt/postgresql@14/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@14/include"
#
# For pkg-config to find postgresql@14 you may need to set:
#  export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@14/lib/pkgconfig"
#
# To start postgresql@14 now and restart at login:
#  brew services start postgresql@14
# Or, if you don't want/need a background service you can just run:
#  LC_ALL="C" /opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14

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
