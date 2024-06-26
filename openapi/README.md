# OpenAPI Developer Notes

## Structure
There are three main top-level files:
* openapi.yaml: All endpoints, user-facing and internal
* openapi_public.yaml: User-facing endpoints only
* openapi_internal.yaml: Endpoints for internal use only

Other top-level files (schemas.yaml, parameters.yaml) contain parameters, etc. that are used in one or more services.

Each microservice's endpoints are contained within its own file within the `services` folder and are referenced in the main top-level files.

## Tools and Documentation
Main OpenAPI documentation for the OpenAPI version used in these docs: https://spec.openapis.org/oas/v3.0.3

[Rapidoc](https://rapidocweb.com/) is our front-end documentation renderer.

## Testing and Validation
This is currently a pain, for two competing reasons:
1. It's quickest to validate a local file. The Swagger Editor (see below) accepts local files.
2. Our specification is large enough that it's split into multiple files. Rapidoc (see below) follows references and can handle a spec across multiple files.

Most tools that I've found will do one or the other (local files or multiple files), but not both. Given that our spec is now relatively mature, you should be able to get away with the Rapidoc validation approach below.

### Swagger Editor validation
The online [Swagger Editor](https://editor.swagger.io/) can be helpful for validation, but it doesn't support specifications split across multiple files, as ours is. If you want to use it, you'll have to do a workaround (hope they fix this, merge the necessary files into a single file, etc.).

### Rapidoc validation
To test the full documentation before you commit changes to the main OpenAPI spec:
1. Commit your changes and push to your own fork/branch on Github.
2. Get the raw URL of the top-level YAML on your fork/branch. It'll be something like `https://raw.githubusercontent.com/<your_username>/adsabs-dev-api/<branch>/openapi/openapi.yaml`
3. Copy the ["vanilla HTML" code example](https://rapidocweb.com/quickstart.html) into a local file. Replace `spec_url` with the raw Github URL from the previous step. (Note that this doesn't accept local files, which is why you have to push to your Github fork first.)
4. Open the local file from above in your web browser and make sure your changes look ok before opening a PR. The formatting will look different than for our main docs since you're using the "vanilla HTML" version, but make sure the content is fully rendered.
