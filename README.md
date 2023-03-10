# BigQuery Slot Analysis Framework

When you use BigQuery, choosing the appropriate slots model can be challenging without the right tools. Should you buy slots? How many? Attach them to which projects? In this repository, we present a framework and set of opinionated queries that could help you in analysing the current slots usage of your jobs in order to facilitate these decisions.

## Getting started

Before starting with your analysis journey, it is highly recommended to get up to speed regarding understanding BigQuery's pricing model and INFORMATION_SCHEMA views. You can find it all summarised in the [pre-requisites section](PREREQUISITES.md)

## The Framework

With the [query framework](FRAMEWORK.md), we present a structured approach towards composing and writing SQL queries for analysing and estimating slots in BigQuery. In summary, every query is compose of multiple parameters represented as DIMENSION, BUCKET, and SCOPE.


## Queries

Refer to the [queries directory](queries/QUERIES.md) to see the queries that are currently implemented.


## Disclaimer

All queries in this document are experimental and subject to change / improve based on feedback. Please make sure to test before using. This project is not an official Google project. It is not supported by Google and Google specifically disclaims all warranties as to its quality, merchantability, or fitness for a particular purpose. 
