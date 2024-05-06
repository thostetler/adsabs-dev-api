#!/usr/bin/env sh

PUBLIC_SPEC="./openapi/openapi_public.yaml"
TMP_DIR="./tmp"
BUNDLE_NAME="openapi.bundle.yaml"
OUTPUT_DIR="./openapi/public"

# bundle the public spec
mkdir -p $TMP_DIR
npx @redocly/cli bundle $PUBLIC_SPEC -o $TMP_DIR/$BUNDLE_NAME --ext yaml
npx @redocly/cli split $TMP_DIR/$BUNDLE_NAME --outDir $OUTPUT_DIR
echo "making yaml bundle"
npx @redocly/cli bundle $OUTPUT_DIR/openapi.yaml -o $OUTPUT_DIR/$BUNDLE_NAME --ext yaml
echo "making json bundle"
npx @redocly/cli bundle $OUTPUT_DIR/openapi.yaml -o $OUTPUT_DIR/$BUNDLE_NAME --ext json

# clean up
rm -rf $TMP_DIR
