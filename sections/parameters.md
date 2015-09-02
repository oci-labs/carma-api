
## Parameters used by the API

The Carmageddon Back End ReST API uses parameters in the formation
of URIs in order to specialize the method calls.  These parameters are
either direct URI parameters, part of the URI path, or query parameters -
added to the end of the path after a '?' symbol and separated with '&'
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

#### cityid

The {cityid} parameter is a string value that is used to uniquely
identify each available cities resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

#### stationid

The {stationid} parameter is a string value that is used to uniquely
identify each available stations resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

#### pumpid

The {pumpid} parameter is a string value that is used to uniquely
identify each available pumps resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

#### tankid

The {tankid} parameter is a string value that is used to uniquely
identify each available tanks resource.  There should be no meaning
attributed to the parameter value; specifically the value cannot be used
as an index into lists or the dataset.

### Query Parameters

The query parameters used by the API are used when accessing a collection
for reading and used to restrict the access to a subset of the available
data.  These parameters will occur after the URI path, separated from the
path by a '?' symbol, and if more than one is present they will be
separated with a '&' symbol.

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

#### from

The `from` parameter is a string version of a date/time used to specify
the starting time of an interval.  This can be either a standard date
format, a relative date format, or a numeric value representing the
number of seconds since the epoch (01-01-1970).  The special value of
"first" is used to indicate the oldest available data in storage.

#### to

The `to` parameter is a string version of a date/time used to specify the
ending time of an interval.  This can be either a standard date format,
a relative date format, or a numeric value representing the number of
seconds since the epoch (01-01-1970).  The special value of "last" is
used to indicate the latest (possibly future) date available in storage.

#### fuel

The `fuel` parameter is used to restrict the amount of data returned in a
list when requesting information about revenue.  It has the special value
of "all" that indicates that all fuels should be considered.

#### type

The `type` parameter indicates which single or multiple events types are
to be included in a returned list of events.  The event types can include
the special value of "all" which indicates all events will be included.
"all" is also the default value, so the lack of this parameter is the same
as specifying "all".  Values, other than "all" which are accepted include:
"pumpfail", "pumpactive", "pumpinactive", "tankleak", "tankactive",
"tankinacive", and "tankfill".  More than one event type can be specified
by including them as a comma separated list of types.

#### itemtype

The `itemtype` parameter indicates which types of items (pumps or tanks)
are to be included in a list of maintenance records being returned.  The
special value of "all" indicates that records for item types should be
included.  Values other than "all" which are accepted include: ("tank",
"pump").

