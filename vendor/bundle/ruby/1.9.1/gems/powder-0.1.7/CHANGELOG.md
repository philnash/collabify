### 0.1.7 ###

* 1 minor change

    * adds proper support for alt names
      ([commit](https://github.com/Rodreegez/powder/commit/4b850b1dbb446f7d0c3a643d4cc7be99eebd417b))
    * adds not_restarts command
      ([commit](https://github.com/Rodreegez/powder/commit/9371ccdf822a83db7f1fded365d01bd2c613aed3))
    * adds always_restart command
      ([commit](https://github.com/Rodreegez/powder/commit/45bd64180930353ef6c45626ccae150091374828))
    * pow down properly unloads pow processes
      ([commit](https://github.com/Rodreegez/powder/commit/a6373e73c746587eb1ae23aaa1a26fe331274e6d))
    * adds host/unhost for dealing with no network
      ([commit](https://github.com/Rodreegez/powder/commit/547c3d1e2fbc155fea3c162a373fed017a739107))
    * Don't break config/status when pow is down
      ([commit](https://github.com/Rodreegez/powder/commit/c3aa98943c51079e2e8a1dc0a983efe76e2964c7))

### 0.1.5 / 2011-06-30 ###

* 4 minor changes

    * Expand path to ~/.powconfig before reading it
      ([commit](https://github.com/Rodreegez/powder/commit/58ec48e4f369ea72e76c15900e7ec8f0c6b0bbf1))
    * Fix generating config.ru
      ([commit](https://github.com/Rodreegez/powder/commit/f65d3f1f897a36d18ea3ea54fa39627c8d5fcee6))
    * Add config and status commands
      ([commit](https://github.com/Rodreegez/powder/commit/9f7ec926a9b502d2fe546c9f1b1d396477a3cae4))

### 0.1.4 / 2011-05-26 ###

* 2 minor change

  * Fixes log command: the pow log (~/Library/Logs/Pow/apps/app-name.log) is
    only created as the name of the directory, regardless of the name of the
    symlink added in .pow (issue 23)
    ([commit](https://github.com/Rodreegez/powder/commit/12fe024cc6768439d1555d61d770f660bfaf2d15))
  * Supports Radiant apps (issue 21)
    ([commit](https://github.com/Rodreegez/powder/commit/5854f32ca0b1106fefad8eb6b7a0e7d2c91e67d3))

### 0.1.3 / 2011-05-20 ###

* 2 minor changes

  * add up and down commands
    ([commit](https://github.com/Rodreegez/powder/commit/e8775c166da40fad16d55df0022a61fd5d5af69b))
  * add applog command
    ([commit](https://github.com/Rodreegez/powder/commit/36d8e04aea2eac618611eaffe78ce8eb55eccc51))

### 0.1.2 / 2011-04-14 ###

* 6 minor changes

  * add log command
    ([commit](https://github.com/Rodreegez/powder/commit/140ef1fef456e3cbe266a2df61b03f3e9c403aeb))
  * fix error when calling remove on a pow that does not exist
    ([commit](https://github.com/Rodreegez/powder/commit/948f7251153afaab7c881b312b094d9843919dcb))
  * properly recognise rails 2 apps and display note accordingly
    ([commit](https://github.com/Rodreegez/powder/commit/0445eb652ec824a7f84d12567539a7c2515341a2))
  * bump dependency on Thor
    ([commit](https://github.com/Rodreegez/powder/commit/493a8f84c27b94fcd24dc84168a47a7c399a9ba1))
  * improve how we determin home dir
    ([commit](https://github.com/Rodreegez/powder/commit/b2e70ca790420a06c21a7f4fc466c167c65fb173))
  * adds version command
    ([commit](https://github.com/Rodreegez/powder/commit/3bb995e2ce5ee2f62735b681b2c15418438f2df4))

### 0.1.1 / 2011-04-11 ###

* 1 minor change

  * We won't try reading ~/.powconfig if it doesn't exist

### 0.1.0 / 2011-04-11 ###

* 1 Major change

  * The command has changed from pow to powder to allow pow to use the command
  ([issue](https://github.com/Rodreegez/powder/issues/5))

* 1 minor change

  * open and link now honour domains specified in .powconfig

### 0.0.4 / 2011-04-08 ###

* Early release with link, list, restart, remove, open, install and uninstall commands
