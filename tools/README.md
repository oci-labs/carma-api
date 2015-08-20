
# Development Tools

This directory contains tools that will help during development and
definition of the API and its documentation.

## validate.js

This tool is a node.js script that validates JSON instance documents
against JSON schemas.

Perform validation as:

  node validate.js <instance-document> <schema-document>

Example (from this directory):

  node validate.js location-example.json ../schemas/location.json

