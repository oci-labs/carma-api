
## Access Semantics

### Reading Resources

To read the content of resources, the HTTP GET method is used.  The URI
to the resource will determine if an individual resource, all resources,
or some resources will be retrieved.

Reading the entire available resource list is done by simply calling the
API GET method with the collection URI and no parameters.  All data for
that resource will be returned.  An example of this API call is:

        GET /collection

It is also possible to page through the available resources.  This is
useful when there are many resources and the client wants to start
using the available list prior to receiving the entire list; for example
to start building a table in the user interface with the first entries
before the entire set of data has been received.

Reading partial lists is done by providing query parameters to the GET
method call that indicate the starting index (`start`) and number of
entries (`span`) to return.  The starting index is the offset in the
entire list from the first entry.  For example, calling

        GET /stations?start=51;span=50

will return the second 50 elements of the '/stations' resource that
are available.  Clients should be aware that if the resource collection
is updated between calls to these partial reads occur, the list being
accessed will not remain unchanged.

Individual resources can be read by simply adding the {resourceid} value
as the next element in the URI path:

        GET /collection/{rescourceid}

### Searching for Resources

It is possible to search for resources of a type.  This is done by using
the HTTP GET method at a URI relative to the resource being searched for.
Access from search is restricted to reading and effectively returns
those records that meet the search criteria.

Search URIs will be formed similar to: /collection?search=<query>

