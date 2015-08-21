
## Parameters used by the API

The Carmageddon Back End ReST API uses parameters in the formation
of URIs in order to specialize the method calls.  These parameters are
either direct URI parameters, part of the URI path, or query parameters -
added to the end of the path after a '?' symbol and separated with ';'
symbols if more than one.

### URI Parameters

The URI paramters used by the API are used to uniquely identify elements
within the available data.  Each element accessible by the API has a
unique identifier that is unique within that elements type.  This means
that it is a mistake to attempt access of one type of data using an
identifier for another (do not use a station Id to access a pump Id
for example).

URI parameters are individual path elements in the URI.  These parameters
are not combined in this API, so each parameter stands on its own.

#### Cities Id

The {citiesid} parameter is a string value that is used to uniquely
identify each available cities resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

#### Stations Id

The {stationsid} parameter is a string value that is used to uniquely
identify each available stations resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

#### Pumps Id

The {pumpsid} parameter is a string value that is used to uniquely
identify each available pumps resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

#### Tanks Id

The {tanksid} parameter is a string value that is used to uniquely
identify each available tanks resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

### Query Parameters

The query parameters used by the API are used when accessing a collection
for reading and used to restrict the access to a subset of the available
data.  These parameters will occur after the URI path, separated from the
path by a '?' symbol, and if more than one is present they will be
separated with a ';' symbol.

These parameters are of the form:

        <paramter-name>=<value>

where the \<parameter-name\> is one of those below.

#### start

The `start` parameter is used to indicate the first record to return in a
restricted list of results.  This is a numeric index into the list where
the first record is at index 1.  The list indexed is the one present at
the time the request is received.  If the list has been modified since
the last call, the index may not reference the expected data.  It is up
to the client to determine if a list is complete or if the same list
elements have been encountered when paging.

#### span

The `span` parameter is used to indicate the number of records to return
in a restricted list of results.  This number of records will be returned
if there are enough after the starting index.  If there are not enough
elements to satisfy the request, then as many available records will be
sent as possible.  It is up to the client to check the length of the
returned array to ensure that it does not attempt to access elements
beyond the end of the list.

#### query

When a search URI is used, the `query` parameter is used to specify the
criteria for the search.  The value of this parameter corresponds to the
'WHERE' clause of an SQL 'SELECT' statement.

