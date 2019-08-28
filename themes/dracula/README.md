# Dracula theme

A dark theme for Bash-it inspired by https://github.com/dracula/dracula-theme

## Features

### Prompt Segments

#### Work in Progress
- Username & Hostname
- Current Directory
- SCM Information
- Battery Charge
- Clock
- [Todo.txt](https://github.com/ginatrapani/todo.txt-cli) status
- Ruby Environment
- Python Environment
- Exit Code
- Indicator for cached `sudo` credential
- Indicator for ssh login

## Configuration
 Set Theme Environment Variables

### Theme Environment Variables

This is used for permanent settings that apply to all terminal sessions. You have to define the value of specific theme variables in your `bashrc` (or equivalent) file.

The name of the variables are listed below along with their default values.

#### User Information

Indicator for cached `sudo` credential (see `sudo` manpage for more information):

`THEME_SHOW_SUDO=true`

#### SCM Information

Information about SCM repository status:

`THEME_SHOW_SCM=true`

#### Ruby Environment

Ruby environment version information:

`THEME_SHOW_RUBY=false`

#### Python Environment

Python environment version information:

`THEME_SHOW_PYTHON=false`

#### ToDo.txt status

[Todo.txt](https://github.com/ginatrapani/todo.txt-cli) status:

`THEME_SHOW_TODO=false`

#### Clock

`THEME_SHOW_CLOCK=true`

`THEME_CLOCK_COLOR=$bold_cyan`

Format of the clock (see `date` manpage for more information):

`THEME_CLOCK_FORMAT="%H:%M:%S"`

#### Battery Charge

Battery charge percentage:

`THEME_SHOW_BATTERY=false`

#### Exit Code

Exit code of the last command:

`THEME_SHOW_EXITCODE=true`

## Prompt Segments Order

Currently available prompt segments are:

- battery
- char
- clock
- dir
- exitcode
- python
- ruby
- scm
- todo
- user_info

Three environment variables can be defined to rearrange the segments order. The default values are:

`___DRACULA_TOP_LEFT="user_info dir scm"`

`___DRACULA_TOP_RIGHT="python ruby todo clock battery"`

`___DRACULA_BOTTOM="exitcode char"`
