# Dracula Theme v1.0
# https://github.com/tonyroomz/dracula-theme
# Copyright 2019, All rights reserved
#
# Code licensed under the MIT license
#
# @author Tony Mendolia "TonyRoomz" <tonyroomz@gmail.com>

#function set_color {
#  set +u
#  if [[ "${1}" != "-" ]]; then
#    fg="38;5;${1}"
#  fi
#  if [[ "${2}" != "-" ]]; then
#    bg="48;5;${2}"
#    [[ -n "${fg}" ]] && bg=";${bg}"
#  fi
#  echo -e "\[\033[${fg}${bg}m\]"
#}

function set_color {
  set +u
  echo -e "$(set_rgb 248 248 242)"
}

function set_rgb {
  echo -e "\[\033[38;2;${1};${2};${3}m\]"
}

function __dracula_hostname_segment {
    echo "${DRACULA_PURPLE}\h"
}


prompt_setter() {
  local exit_status="$?"
  if [[ $exit_status -eq 0 ]]; then 
      PROMPT_START=$DRACULA_THEME_PROMPT_OK
   else 
      PROMPT_START=$DRACULA_THEME_PROMPT_BAD
  fi

  DPROMPT+=$(__dracula_hostname_segment)

  # Save history
  history -a
  history -c
  history -r
  PS1="${PROMPT_START}$(__dracula_hostname_segment)${reset_color}"
  PS2="$ >"
}


safe_append_prompt_command prompt_setter




function __dracula_left_segment {
  local OLD_IFS="${IFS}"; IFS="|"
  local params=( $1 )
  IFS="${OLD_IFS}"
  local separator_char="${DRACULA_LEFT_SEPARATOR}"
  local separator=""

  if [[ "${SEGMENTS_AT_LEFT}" -gt 0 ]]; then
    separator="$(set_color ${LAST_SEGMENT_COLOR} ${params[1]})${separator_char}${DRACULA_NORMAL}"
  fi
  DPROMPT+="${separator}$(set_color - ${params[1]}) ${params[0]} ${DRACULA_NORMAL}"
  LAST_SEGMENT_COLOR=${params[1]}
  (( SEGMENTS_AT_LEFT += 1 ))
}

function __dracula_last_status_prompt {
   [[ "$1" -ne 0 ]] && echo "${DRACULA_RED}➜|${LAST_STATUS_THEME_PROMPT_COLOR}"
}

function __dracula_last_status_segment {
   if [[ "$1" -ne 0 ]]; then
       echo "${DRACULA_RED}➜"
   else 
       echo "${DRACULA_GREEN}➜"
   fi
}

function __dracula_hostname_prompt {
    echo "${DRACULA_PURPLE}\h|${HOST_THEME_PROMPT_COLOR}"
}
function __dracula_user_info_prompt {
    echo "${DRACULA_GREEN}\u|${USER_INFO_THEME_PROMPT_COLOR}"
}

function __dracula_prompt() {
    local last_status="$?"
    local seperator_char="${DRACULA_PROMPT_CHAR}"
    
    DPROMPT=""
    SEGMENTS_AT_LEFT=0
    LAST_SEGMENT_COLOR=""

    DPROMPT+=$(__dracula_last_status_prompt ${last_status})

    for segment in $DRACULA_PROMPT; do
        local info="$(__dracula_${segment}_prompt)"
        [[ -n "${info}" ]] && __dracula_left_segment "${info}"
    done

    [[ "${last_status}" -ne 0 ]] && $(__dracula_last_status_prompt ${last_status})
    [[ -n "${DPROMPT}" ]] && DPROMPT+="$(set_color ${LAST_SEGMENT_COLOR} -)${separator_char}${normal}"
    
    DPROMPT+=":\w \$ ${reset_color}"
    PS1="${DPROMPT}"


    unset LAST_SEGMENT_COLOR DPROMPT SEGMENTS_AT_LEFT
}


