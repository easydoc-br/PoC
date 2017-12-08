#!/bin/bash
./initenv.sh

STORM_COMMAND=""

if [ "$STORM_UI" = "1" ]; then
	STORM_COMMAND="ui"
elif [ "$STORM_NIMBUS" = "1" ]; then
	STORM_COMMAND="nimbus"
elif [ "$STORM_SUPERVISOR" = "1" ]; then
	STORM_COMMAND="supervisor"
fi

/opt/storm/bin/storm $STORM_COMMAND
