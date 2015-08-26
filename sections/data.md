
## Data Formats

All data that is sent to or received from the Carmageddon Back End API
is JSON encoded.  The structure of the JSON data is defined as conforming
to a specific schema that is well defined.  The schema syntax followed is
defined at http://json-schema.org/ and is itself defined in JSON format.

### Media Type

The Carmageddon Back End API includes a media type to be used by the
'Content-Type' header to define the data being transfered from or to
the server.

The API specific type for a pure JSON message content includes a required
`profile` parameter that refers to the URI for the JSON schema definition.

* `application/prs.com.ociweb.demo.carma+json;profile=<schema-URL>`

    this media-type is for JSON data and includes a required `profile`
    parameter.  The `profile` parameter value is used to define the
    allowable contents of the message data. 

### Schemas

Data schemas are defined using the http://json-schema.org schema
definition mechanism.  The schema JSON is available for use as
documentation or for validation at the URIs given in the following
sections.

The value of the `profile` parameter used in the media type definition
is the URL to reach the file used to store the schema.  The `profile`
parameter values are used with the media types in the API description
below to avoid repeating the schema description for each URI.

#### Collection Data

The collection data schema is used for data that includes more than one
element in the message.  The contained data elements are described using
their own schemas described below, but the container schema describes how
the multiple elements are included in the message.

Collection data is an object that contains some definition information
along with an array of data elements.  The data type of the elements is
defined by the schema pointed to using the `contentSchema` URI property of
the collection.  The property holds a valid URI to the schema definition
and the relationship of the property is a `describedBy` relationshop as
defined in RFC5988 (http://tools.ietf.org/html/rfc5988).  Inclusion of
the `contentSchema` property is optional and can be inferred for most API
calls.

The `data` property of the collection holds an array of elements of the
same type.  The type of data must be one of the valid API schemas as
defined in this document.

The collection schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/collection.json`

<!-- include(../schemas/collection.json) -->

#### City Data

The city data schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/city.json`

<!-- include(../schemas/city.json) -->

#### Station Data

The station data schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/station.json`

<!-- include(../schemas/station.json) -->

#### Pump Data

The pump data schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/pump.json`

<!-- include(../schemas/pump.json) -->

#### Revenue Data

The revenue data schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/revenue.json`

<!-- include(../schemas/revenue.json) -->

#### Event Data

The event data schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/event.json`

<!-- include(../schemas/event.json) -->

#### Tank Data

The tank data schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/tank.json`

<!-- include(../schemas/tank.json) -->

#### Error Data

Error data is included in response data when a status code other than
in the 200 range is returned.  This data is optional and its intent is to
provide additional information about what caused the API call to fail.
For example, if a call fails due to insufficient authorization, the
message data can include a string stating this along with one or two
links that can be used to login or register in order to obtain the proper
authorization to make the call.

The error data schema description filename and the media type parameter
value is:

* `http://oci-labs.github.io/carma-api/schemas/errordata.json`

<!-- include(../schemas/errordata.json) -->

#### Id Lists

Some queries return a list of unique id values.  These are formatted as a
list of strings.  The schema description filename and the media type
parameter value is:

* `http://oci-labs.github.io/carma-api/schemas/idlist.json`

<!-- include(../schemas/idlist.json) -->


