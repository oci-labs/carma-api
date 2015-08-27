
## HTTP Headers

The Carmageddon Back End ReST API requires and allows certain HTTP
headers to be present in the request messages and provides headers in
the response messages.  These headers modify how the server responds to
requests and provides additional information about the responses provided.

It is expected that the standard header mechanisms for caching, content
negotiation, and connection management (among others) are handled
externally to the API by the HTTP client and server libraries.  They are
not addressed here.

### Request Headers

There are no additional request headers required for this API.  Since the
API provides only GET endpoints and parameters are supplied as either URI
or Query parameters, no additional data needs to be sent as part of the
request.

### Response Headers

The Response headers in addition to standard headers that are provided
by the API include Content-Type, and Retry-After.  These headers provide
additional information to the client for normal as well as exceptional
response messages.

#### Content-Type Header

This header is sent when providing data in the response message.  This
header indicates what format the data is supplied in.  As discussed in
the data formats section above, this will be the API specific API format:

        Content-Type: application/prs.com.ociweb.demo.carma+json;profile=<schema-URL>

where the schema defined at <schema-URL> describes the details of the
data format.

#### Retry-After Header

This header is sent with the 429 and 503 status code response messages.
It will indicate the number of seconds to wait before retrying the
request.

