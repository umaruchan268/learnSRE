## Availability SLI
### Definition: The percentage of successful requests over the last 5m
Formula: sum (rate(apiserver_request_total{job="apiserver",code!~"5.."}[5m]))/sum (rate(apiserver_request_total{job="apiserver"}[5m]))


## Latency SLI
### Definition: 90% of requests finish in these times
Formula: histogram_quantile(0.90,sum(rate(apiserver_request_duration_seconds_bucket{job="apiserver"}[5m])) by (le, verb))


## Throughput
### Definition: Successful requests per second
Formula: sum(rate(apiserver_request_total{job="apiserver",code=~"2.."}[1m]))

## Error Budget - Remaining Error Budget
### Definition: The error budget is 20%
Formula: 1 - ((1 - (sum(increase(apiserver_request_total{job="apiserver", code="200"}[7d])) by (verb)) / sum(increase(apiserver_request_total{job="apiserver"}[7d])) by (verb)) / (1 - .80))

