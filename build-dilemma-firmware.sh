#!/usr/bin/env bash
set -euo pipefail

keyboard=bastardkb/dilemma/3x5_3
model=default

firmware="${keyboard////_}_${model}.uf2"

function copy_firmware() {

    printf >&2 'please connect %s and press the reset button twice\n' "${1}"
    qmk flash -kb "${keyboard}" -km "${model}"
    sync
    sleep 1
}

rm -f "${firmware}"

qmk compile -c -kb "${keyboard}" -km "${model}"

exit 0

printf >&2 'Copying firmware, please disconnect all cables first\n'
copy_firmware 'right side'
copy_firmware 'left side'
printf >&2 "Done!"


