## Availability SLI
### The percentage of successful requests over the last 5 days
sum(rate(prometheus_http_requests_total{container="prometheus",code!~"5.."}[5d])) / sum (rate(prometheus_http_requests_total{container="prometheus"}[5d]))

## Latency SLI
### 90% of requests finish in these times
histogram_quantile(0.9,
sum(rate(prometheus_http_request_duration_seconds_bucket{container="prometheus"}[10m])) by (le, verb))

## Throughput
### Successful requests per second
sum(rate(prometheus_http_requests_total{container="prometheus",code=~"2.."}[5m]))

## Error Budget - Remaining Error Budget
### The error budget is 20%
1 - ((1 - (sum(increase(prometheus_http_requests_total{container="prometheus", code="200"}[30d])) by (verb)) / sum(increase(prometheus_http_requests_total{container="prometheus"}[30d])) by (verb)) / (1 - .90))
