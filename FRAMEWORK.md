# Framework for thinking about queries

## Framework parameters

When analyzing slot usage, it is easy to come up with different queries. It can be hard to grasp how they complement each other and which ones should be used.

We propose a framework that encompasses the queries we have thought of so far. If you need a query that we have not implemented yet, you can try to see how/if it fits this framework, and contribute to the list of implemented queries!

**The framework will be best understood if you think of the result of your queries as a table with lines and columns.**

### a. DIMENSIONS

The DIMENSIONS of your query are the metrics you will have as an output. Let’s say that one line of your output is one GCP project, you could have the following columns:

- Total slot usage
- Peak slot usage
- Average slot usage
- Quartiles slot usage
- Bytes processed
- On-demand cost
- etc.

Some useful metrics include summary statistics about slot usage (like average, peak or quartiles). Based on these dimensions, you can also compare the price if you bought, let’s say, a number of slots equal to your average slot usage, versus the on-demand cost based on the number of bytes processed.

### b. BUCKETS

Here, you define what is actually a line of data in your output (if you think of your output as a simple table). Your line could be:

- A project
- A folder
- A job
- A minute for a specific project
- A second for a specific job
- etc.

### c. SPACE SCOPE

This attribute determines where you are going to get your data from. It could be:
- An organization
- A folder
- A user
- A project
- etc.

Let us say you are interested in seeing information about slot usage for each project in a folder. Then your LINE would be “project”, and your SCOPE would be “folder”. 

In SQL, this will mostly be determined by a FROM clause that specifies the table you are querying (INFORMATION_SCHEMA_FROM_), and a WHERE clause in some cases.

### d. TIME SCOPE

This attribute determines the time scope you are interested in. This is simple, since in your SQL it should be implemented with a WHERE on a timestamp column.
