# Framework for thinking about queries

## Framework parameters

When working with customers on this problem, we realized that, as PSO, different teams with different customers came up with different queries that brought a different value and understanding of the problem. We had a hard time grasping how they complemented each other, and which ones should be used.

We are proposing a framework that encompasses all the queries we have thought of so far. If you need a query that we have not implemented yet, you can try to see how/if it fits this framework, and contribute to the list of implemented queries!

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

## Query categories

All the possible queries you can create can seem a bit daunting. Let us propose some guidelines you can follow with customers.

We propose two kinds of queries based on the framework:

- **Hierarchical queries** if you are interested in statistics at the same granularity as your TIME SCOPE. E.g.: if your time scope is one day, you will have summary statistics for that day. They are particularly useful for committing to buy slots.

- **Time-series queries** if you are interested in statistics at a smaller granularity than your TIME SCOPE. E.g.: If your time scope is one day, you want to have summary statistics for each second. You are showing the statistics inside this specific time scope. They are particularly useful for seeing time-dependent evolution, hence for buying flex slots.

You might find other useful types yourself!

### a. Hierarichal quries

When you start this work, you might focus on the slot usage for a whole folder. For a specific folder, what are the quartiles of my slot usage in the last 10 days ? (BUCKETS=folder, DIMENSIONS=quartiles, SPACE SCOPE=folder, TIME SCOPE=10 days). Your output would be one line that shows you the slot usage of everything under this folder. Maybe you can choose to buy the number of slots that is equal to your 75% percentile slot usage, if you are ok for some queries to be slowed down.

This is all fine but a bit harsh. You would probably want to know more at a lower bucketing: project bucket for instance (BUCKETS= project, DIMENSIONS=quartiles, SPACE SCOPE=folder, TIME=10 days). You could then decide to create specific reservations for certain projects.

Then you might want to know if certain jobs are actually using lots of slots, and want to decide if these jobs should be throttled, optimized, etc. In this case you can for the job bucketing. It is not possible to attach a particular job to a slots reservation, but you could decide to move this job to another project to throttle it, or just try to optimize it.

In all these queries, you could add, in the “DIMENSIONS”, the number of bytes processed, the price on demand, and, for instance, the price of flex slots if you bought the number of slots equal to the 75% percentile. This would enable you to see the cost you would gain by buying this number of slots vs the on-demand pricing.

This kind of hierarchical deep dive is useful to understand your slot usage at different granularities.

Most of the time, these queries will be best viewed as table charts or bar charts.

Example as a bar chat for DIMENSIONS=totalSlotUsage,peakSlotUsage,avgPeriodSlotUsage,TotalQueries,totalProcessedTb,onDemandCost,minBreakEvenSlotUnits100,minBreakEveFlatCost; BUCKETS=projects; SPACE SCOPE=folder; TIME SCOPE=1day

[Screenshow TBD]

### b. Time-series queries 

Another way to look at the investigation is to add the time dimension to it. Maybe some of your projects have a very high consumption of slots at a certain time of the day. This kind of understanding can help optimize your workloads with flex slots, for instance.

Period queries include a time dimension in the BUCKETS attribute.

Let us say you want, for your project A, to see the average slot usage at every second for a specific hour. In this case you would go with BUCKETS=projects,seconds (each table output line is a second per project), DIMENSIONS=average slot usage, SPACE SCOPE=projectA, TIME SCOPE=1hour.

You could realize that for this particular project, there is a peak of utilization during only 10mn every day, and that you either can accept some slowing down during this time, or you would buy a few more flex slots at this point of the day.

Typically, this kind of query will better be visualized as a line chart.

Example line chart for DIMENSIONS=peakPeriodSlots, BUCKETS=minute, SPACE SCOPE=folder, TIME SCOPE=1day:

[Screenshot TBD]


