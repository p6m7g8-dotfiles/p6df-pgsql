# P6's POSIX.2: p6df-pgsql

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-pgsql

##### p6df-pgsql/init.zsh

- `p6df::modules::pgsql::deps()`
- `p6df::modules::pgsql::external::brew()`
- `p6df::modules::pgsql::home::symlink()`
- `p6df::modules::pgsql::init(_module, dir)`
  - Args:
    - _module - 
    - dir - 
- `str str = p6df::modules::pgsql::prompt::lang()`

#### p6df-pgsql/lib

##### p6df-pgsql/lib/cli.sh

- `p6df::modules::pgsql::cli::start()`
- `p6df::modules::pgsql::cli::stop()`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   └── cli.sh
├── README.md
└── share

3 directories, 3 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
