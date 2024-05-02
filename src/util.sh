## CONSTANTS
export EX_OK=0
export EX_ERROR=1
export EX_USAGE=2
export EX_BAD_ENVIRONEMNT=128
export EX_CHECK_FAILURE=129

## FUNCTIONS
# Channels which are only printed when --verbose
export LOG_VERBOSEONLY_CHANNELS=()
log() {
	local log_level=$1
	local log_msg="${@:2}"
	if [[ "${LOG_VERBOSEONLY_CHANNELS[@]}" == *"$log_level"* \
		&& "${verbose:-}" != true ]]; then
		return
	else
		echo "${log_level}:" "$log_msg" >&2
	fi
}
export -f log

# Log a message to the system logger.
# $1 : The syslog level (recommend: notice)
# $2 : The message to log
syslog() {
	local level=$1
	local msg=${@:2}
	logger \
		--priority user.${level} \
		--id=$$ \
		--tag "nilrt-snac" \
		${msg}
}
export -f syslog
