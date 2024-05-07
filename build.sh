#!/usr/bin/env sh

PUBLIC_SPEC="./openapi/openapi_public.yaml"
TMP_DIR="./tmp"
BUNDLE_NAME="openapi.bundle.yaml"
OUTPUT_DIR="./openapi/public"

# bundle the public spec
mkdir -p $TMP_DIR
npx @redocly/cli bundle $PUBLIC_SPEC -o $TMP_DIR/$BUNDLE_NAME --ext yaml
npx @redocly/cli split $TMP_DIR/$BUNDLE_NAME --outDir $OUTPUT_DIR
echo "Generating bundle..."
npx @redocly/cli bundle $OUTPUT_DIR/openapi.yaml -o $OUTPUT_DIR/$BUNDLE_NAME --ext yaml

# Use swagger converter to convert to v3
echo "Converting bundle..."
curl -X POST https://converter.swagger.io/api/convert \
  -H 'Content-Type: application/yaml' \
  -H 'accept: application/yaml' \
  --data-binary "@$OUTPUT_DIR/$BUNDLE_NAME" \
  -o $OUTPUT_DIR/openapi.bundle.v3.yaml

echo "Cleaning up..."
# clean up
rm -rf $TMP_DIR
