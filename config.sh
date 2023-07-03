# --- Change the following settings ---
# aratifact custom configs
ARTIFACT_NAME="sample"
DEVICE_TYPES=("edgeplant-t1")
# If ARTIFACT_VERSION is an empty string, the software version will be removed.
ARTIFACT_VERSION="1.0.0"
# If the content is to be installed on a data partition, comment out the following (to maintain version inventory after OS updates).
#SOFTWARE_FILESYSTEM="data-partition"

# --- The following changes are *NOT* required ---
# artifact default configs
CUSTOM_DIR="custom"
CUSTOM_SCRIPT_NAME="custom_script.sh"
CUSTOM_SCRIPT_PATH="${CUSTOM_DIR}/${CUSTOM_SCRIPT_NAME}"
CONTENTS_DIR="${CUSTOM_DIR}/contents"
