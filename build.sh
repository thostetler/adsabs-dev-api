#!/usr/bin/env sh

PUBLIC_SPEC="./openapi/openapi_public.yaml"
TMP_DIR="./tmp"
BUNDLE_NAME="openapi.bundle.yaml"
OUTPUT_DIR="./openapi/public"

# bundle the public spec
mkdir -p $TMP_DIR
redocly bundle $PUBLIC_SPEC -o $TMP_DIR/$BUNDLE_NAME --ext yaml
redocly split $TMP_DIR/$BUNDLE_NAME --outDir $OUTPUT_DIR
redocly bundle $OUTPUT_DIR/openapi.yaml -o $OUTPUT_DIR/$BUNDLE_NAME --ext yaml

# clean up
rm -rf $TMP_DIR