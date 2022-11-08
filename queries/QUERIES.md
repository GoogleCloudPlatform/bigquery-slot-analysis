# Queries

## Types of queries

We propose two kinds of queries based on the framework:

- **Scalar queries** if you are interested in statistics at the same granularity as your TIME SCOPE. E.g.: if your time scope is one day, you will have summary statistics for that day. They are particularly useful for committing to buy slots.

- **Time-series queries** if you are interested in statistics at a smaller granularity than your TIME SCOPE. E.g.: If your time scope is one day, you want to have summary statistics for each second. You are showing the statistics inside this specific time scope. They are particularly useful for seeing time-dependent evolution, hence for buying flex slots.

You might find other useful types yourself!


## Implemented queries

There are the queries that are implemented so far in this repository.

- Scalar Queries
    - [Many dimensions](queries/hierarichal/many_dimensions)
    - [Quantile statistics](queries/hierarchical/quantile_statistics)
- [Time Series](queries/time-series/consumption_timeline)


## Modifying queries

For all queries, we have a _WHEN_FROM and a _WHEN_TO variable that you can define to set your TIME SCOPE.


Changing your SPACE SCOPE will also be easy: 
- Change the view you are querying (JOBS_TIMELINE_BY_{WHERE})
- Filter certain jobs/queries with a WHERE clause

Changing the BUCKET and DIMENSIONS can be more involved, this is why we propose multiple queries that you can use and get inspired from.
