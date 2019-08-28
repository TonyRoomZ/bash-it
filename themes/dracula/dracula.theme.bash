#!/usr/bin/env bash
# Dracula Theme v1.0
# https://github.com/tonyroomz/dracula-theme
# Copyright 2019, All rights reserved
#
# Code licensed under the MIT license
#
# @author Tony Mendolia "TonyRoomz" <tonyroomz@gmail.com>

#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg_bold[blue]%}%c $(git_prompt_info)% %{$reset_color%}'
#ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg_bold[green]%}✔ "
#ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[yellow]%}✗ "
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

. "$BASH_IT/themes/dracula/dracula.base.bash"
#   The foreground escape sequence is ^[38;2;<r>;<g>;<b>m
#   The background escape sequence is ^[48;2;<r>;<g>;<b>m
#   <r> <g> <b> range from 0 to 255 inclusive.
#   The escape sequence ^[0m returns output to default

# Dracula Color Schemes
# https://github.com/dracula/dracula-theme
#
# Pallete       Hex     R G B        H S L
# -----------   ------- -----------  ------------
# Background	#282a36	40 42 54	 231° 15% 18%
# Current Line	#44475a	68 71 90	 232° 14% 31%
# Selection	    #44475a	68 71 90	 232° 14% 31%
# Foreground	#f8f8f2	248 248 242	 60° 30% 96%
# Comment	    #6272a4	98 114 164	 225° 27% 51%
# Cyan	        #8be9fd	139 233 253	 191° 97% 77%
# Green	        #50fa7b	80 250 123	 135° 94% 65%
# Orange	    #ffb86c	255 184 108	 31° 100% 71%
# Pink	        #ff79c6	255 121 198	 326° 100% 74%
# Purple	    #bd93f9	189 147 249	 265° 89% 78%
# Red	        #ff5555	255 85 85	 0° 100% 67%
# Yellow	    #f1fa8c	241 250 140	 65° 92% 76%

DRACULA_NORMAL=$(set_rgb 248 248 242)
DRACULA_CYAN=$(set_rgb 139 233 253)
DRACULA_GREEN=$(set_rgb 80 250 123)
DRACULA_ORANGE=$(set_rgb 255 184 108)
DRACULA_PINK=$(set_rgb 255 121 198)
DRACULA_PURPLE=$(set_rgb 189 147 249)
DRACULA_RED=$(set_rgb 255 85 85)
DRACULA_YELLOW=$(set_rgb 241 250 140)

# Base theme symbols are fine..
#SCM_GIT_CHAR="${DRACULA_CYAN}±${normal}"
#SCM_SVN_CHAR="${DRACULA_CYAN}⑆${normal}"
#SCM_HG_CHAR="${DRACULA_CYAN}☿${normal}"
#SCM_P4_CHAR="${DRACULA_CYAN}⌛${normal}"

# scm theming
SCM_THEME_PROMPT_PREFIX="${DRACULA_CYAN}("
SCM_THEME_PROMPT_DIRTY="${DRACULA_YELLOW}✗ "
SCM_THEME_PROMPT_CLEAN="${DRACULA_GREEN}✓ "
DRACULA_THEME_PROMPT_OK="${DRACULA_GREEN} ➜ "
DRACULA_THEME_PROMPT_BAD="${DRACULA_RED} ➜ "

DRACULA_LEFT_SEPERATOR="|"
LAST_STATUS_THEME_PROMPT_COLOR="${DRACULA_RED}"

DRACULA_PROMPT=${DRACULA_PROMPT:="user_info hostname"}





