#!/usr/bin/env bash

#===============================================================================
# Library Name  : colors.sh
# Description   : Bash functions and constants for applying color formatting
#                 to terminal output using ANSI escape codes.
# Usage         : source colors.sh
# Author        : taher allaa
# Version       : 1.0.0
# License       : MIT
#===============================================================================

# TODO: handle `"1"` in check_format_validity fun as string not number.

readonly FgBlack=30
readonly FgRed=31
readonly FgGreen=32
readonly FgYellow=33
readonly FgBlue=34
readonly FgMagenta=35
readonly FgCyan=36
readonly FgWhite=37
readonly Reset=0

readonly escape="\x1b"

readonly Bold=1
readonly Faint=2
readonly Italic=3
readonly Underline=4
readonly BlinkSlow=5
readonly BlinkRapid=6
readonly ReverseVideo=7
readonly Concealed=8
readonly CrossedOut=9

readonly fmt_arg_empty_error="Format argument is required but not provided."
readonly fmt_arg_type_error="Format argument must be a string."

#-------------------------------------------------------------------------------
# Function      : check_format_validity
# Description   : check if format argument that pass to color functions is valid.
#-------------------------------------------------------------------------------
check_format_validity() {
	local format=$1

	if [[ -z ""$format"" ]]; then
		echo "$(Red "[ERROR]"): $fmt_arg_empty_error"
		return 1

	elif [[ """$format""" =~ ^[0-9]+$ ]]; then
		echo "$(Red "[ERROR]"): $fmt_arg_type_error"
		return 1
	fi
}

#-------------------------------------------------------------------------------
# Function      : set_color
# Description   : Apply ansi escape sequene.
# Arguments     :
#	$1 - color code.
#-------------------------------------------------------------------------------
set_color() {
	local color_code="$1"
	echo -en "$escape[${color_code}m"
}

#-------------------------------------------------------------------------------
# Function      : clear_color
# Description	: Unapply ansi escape sequene
#-------------------------------------------------------------------------------
clear_color() {
	echo -en "$escape[${Reset}m"
}

#-------------------------------------------------------------------------------
# Function      : color_wrapper
# Description   : Reusable internal function to reduce redundancy.
# Arguments     :
#   $1 - format text
#   $2 - color code
#   $3 - optional base code
#-------------------------------------------------------------------------------
color_wrapper() {
	local format="$1"
	local fg_color="$2"
	local base="$3"

	check_format_validity "$format"

	if [[ -z $base ]]; then
		set_color "$fg_color"
	else
		set_color "$fg_color;$base"
	fi
	trap clear_color RETURN # act as defer

	echo -en "$format"
}

#-------------------------------------------------------------------------------
# Function      : is_valid_format
# Description   : Checks if the given argument is a valid string format.
# Arguments     :
#	$1 - format text
#	$2 - base code (optionally)
#-------------------------------------------------------------------------------
Red() {
	color_wrapper "$1" "$FgRed" "$2"
}

#-------------------------------------------------------------------------------
# Function		: Black
# Description	: prints format text with black foreground.
# Arguments		:
#	$1 - format text
#	$2 - base code (optionally)
#-------------------------------------------------------------------------------
Black() {
	color_wrapper "$1" "$FgBlack" "$2"
}

#-------------------------------------------------------------------------------
# Function		: Green
# Description	:prints fromat text with green foreground.
# Args:
#	$1 - format text
#	$2 - base code (optionally)
#-------------------------------------------------------------------------------
Green() {
	color_wrapper "$1" "$FgGreen" "$2"
}

#-------------------------------------------------------------------------------
# Function		: Yellow
# Description	: prints fromat text with yello foreground.
# Arguments		:
#	$1 - format text
#	$2 - base code
#-------------------------------------------------------------------------------
Yellow() {
	color_wrapper "$1" "$FgYellow" "$2"
}

#-------------------------------------------------------------------------------
# Function		: Blue
# Description	: prints fromat text with blue foreground.
# Arguments		:
#	$1: format text
#	$2: base code
#-------------------------------------------------------------------------------
Blue() {
	color_wrapper "$1" "$FgBlue" "$2"
}

#-------------------------------------------------------------------------------
# Function		: Magenta
# Description	: prints fromat text with Magenta foreground.
# Arguments		:
#	$1 - format text
#	$2 - base code
#-------------------------------------------------------------------------------
Magenta() {
	color_wrapper "$1" "$FgMagenta" "$2"
}

#-------------------------------------------------------------------------------
# Function		: Cyan
# Description	: prints fromat text with cyan foreground.
# Arguments		:
#	$1 - format text
#	$2 - base code
#-------------------------------------------------------------------------------
Cyan() {
	color_wrapper "$1" "$FgCyan" "$2"
}

#-------------------------------------------------------------------------------
# Function		: White
# Description	: prints fromat text with white foreground.
# Arguments		:
#	$1 - format text
#	$2 - base code
#-------------------------------------------------------------------------------
White() {
	color_wrapper "$1" "$FgWhite" "$2"
}
