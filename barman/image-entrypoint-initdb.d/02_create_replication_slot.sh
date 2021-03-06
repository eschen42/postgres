#!/bin/bash

set -eo pipefail

if [[ -n ${BARMAN_SLOT_NAME} ]]; then
	echo "Creating replication slot '${BARMAN_SLOT_NAME}' for barman."
	psql -v ON_ERROR_STOP=1 -c "SELECT * FROM pg_create_physical_replication_slot('${BARMAN_SLOT_NAME//\'/\'\'}');"
else
	echo "BARMAN_SLOT_NAME is empty; not creating replication slot."
fi
