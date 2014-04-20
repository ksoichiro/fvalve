Rotate
======

Simple file rotation script.

## Usage

Leaves 3 files with pattern `*.log` in `target` dir:

    ./rotate.rb target "*.log" 3

or you can execute with `rake`:

    rake "rotate[target, \'*.log\', 3]"

## License

    Copyright (C) 2014 Soichiro Kashima, All rights reserved.
    Licensed under the MIT License.

