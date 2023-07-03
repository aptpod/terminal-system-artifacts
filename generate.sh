#!/bin/bash -e

source config.sh

readonly OUTPUT_DIR=${1:-"."}
readonly METADATA_JSON="metadata.json"

function init_custom_dir() {
    mkdir -p ${CONTENTS_DIR}
}

function generate_update_module() {
    local device_type_args=""
    for d in "${DEVICE_TYPES[@]}"; do
        device_type_args="${device_type_args} -t ${d}"
    done

    local artifact_version_args=""
    if [ -n "${ARTIFACT_VERSION}" ]; then
        artifact_version_args="-v ${ARTIFACT_VERSION}"
    fi

    local mender_artifact_args="--"
    if [ -f "${METADATA_JSON}" ]; then
        mender_artifact_args="${mender_artifact_args} --meta-data ${METADATA_JSON}"
    fi

    local software_filesystem="rootfs-image"
    if [ -n "${SOFTWARE_FILESYSTEM}" ]; then
        software_filesystem="${SOFTWARE_FILESYSTEM}"
    fi

    ./custom-artifact-gen \
        -n ${ARTIFACT_NAME} \
        ${device_type_args} \
        -s ${CUSTOM_SCRIPT_PATH} \
        ${artifact_version_args} \
        -c ${CONTENTS_DIR} \
        -f ${software_filesystem} \
        -o ${OUTPUT_DIR} \
        ${mender_artifact_args}
}

init_custom_dir
generate_update_module
