#! bash oh-my-bash.module

source "$OSH/themes/powerline/powerline.base.sh"

function __powerline_last_status_prompt {
  [[ "$1" -ne 0 ]] && echo "$(set_color ${LAST_STATUS_THEME_PROMPT_COLOR} -) ${1} ${_omb_prompt_normal}"
}

function __powerline_right_segment {
  local OLD_IFS="${IFS}"; IFS="|"
  local params=( $1 )
  IFS="${OLD_IFS}"
  local separator_char="${POWERLINE_RIGHT_SEPARATOR}"
  local padding=2
  local separator_color=""

  if [[ "${SEGMENTS_AT_RIGHT}" -eq 0 ]]; then
    separator_color="$(set_color ${params[1]} -)"
  else
    separator_color="$(set_color ${params[1]} ${LAST_SEGMENT_COLOR})"
    (( padding += 1 ))
  fi
  RIGHT_PROMPT+="${separator_color}${separator_char}${_omb_prompt_normal}$(set_color - ${params[1]}) ${params[0]} ${_omb_prompt_normal}$(set_color - ${COLOR})${_omb_prompt_normal}"
  RIGHT_PROMPT_LENGTH=$(( ${#params[0]} + RIGHT_PROMPT_LENGTH + padding ))
  LAST_SEGMENT_COLOR="${params[1]}"
  (( SEGMENTS_AT_RIGHT += 1 ))
}

function __powerline_prompt_segment {
  local OLD_IFS="${IFS}"; IFS="|"
  local params=( $1 )
  IFS="${OLD_IFS}"
  local separator_char="${POWERLINE_LEFT_SEPARATOR}"
  local separator_color=""
  local separator=""

  if [[ "${SEGMENTS_AT_PROMPT}" -gt 0 ]]; then
    separator="$(set_color ${LAST_SEGMENT_COLOR} ${params[1]})${separator_char}${_omd_prompt_normal}"
  fi
  BOTTOM_PROMPT+="${separator}$(set_color 245 ${params[1]}) ${params[0]} ${_omb_prompt_normal}"
  LAST_SEGMENT_COLOR=${params[1]}
  (( SEGMENTS_AT_LEFT += 1 ))
}

function __powerline_prompt_command {
  local last_status="$?" ## always the first
  local separator_char="${POWERLINE_LEFT_SEPARATOR}"
  local move_cursor_rightmost='\033[500C'

  LEFT_PROMPT=""
  RIGHT_PROMPT=""
  BOTTOM_PROMPT=""
  RIGHT_PROMPT_LENGTH=0
  SEGMENTS_AT_LEFT=0
  SEGMENTS_AT_RIGHT=0
  SEGMENTS_AT_PROMPT=0
  LAST_SEGMENT_COLOR=""

  ## left prompt ##
  for segment in $POWERLINE_LEFT_PROMPT; do
    local info="$(__powerline_${segment}_prompt)"
    [[ -n "${info}" ]] && __powerline_left_segment "${info}"
  done
  [[ -n "${LEFT_PROMPT}" ]] && LEFT_PROMPT+="$(set_color ${LAST_SEGMENT_COLOR} -)${separator_char}${_omb_prompt_normal}"

  ## right prompt ##
  if [[ -n "${POWERLINE_RIGHT_PROMPT}" ]]; then
    LEFT_PROMPT+="${move_cursor_rightmost}"
    for segment in $POWERLINE_RIGHT_PROMPT; do
      local info="$(__powerline_${segment}_prompt)"
      [[ -n "${info}" ]] && __powerline_right_segment "${info}"
    done
    LEFT_PROMPT+="\033[${RIGHT_PROMPT_LENGTH}D"
  fi

  ## prompt prompt ##
  if [[ -n "${POWERLINE_BOTTOM_PROMPT}" ]]; then
    for segment in $POWERLINE_BOTTOM_PROMPT; do
      local info="$(__powerline_${segment}_prompt)"
      [[ -n "${info}" ]] && __powerline_prompt_segment "${info}"
    done
  fi

  PS1="${LEFT_PROMPT}${RIGHT_PROMPT}\n$(__powerline_last_status_prompt ${last_status})${BOTTOM_PROMPT}${PROMPT_CHAR} "

  ## cleanup ##
  unset LAST_SEGMENT_COLOR \
        LEFT_PROMPT RIGHT_PROMPT BOTTOM_PROMPT RIGHT_PROMPT_LENGTH \
        SEGMENTS_AT_LEFT SEGMENTS_AT_RIGHT SEGMENTS_AT_PROMPT
}
