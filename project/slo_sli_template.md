# API Service

| Category     | SLI                                                                | SLO                                                                                                         |
|--------------|--------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | (total_successful_responses / total_requests) over the last 5 days | 99%                                                                                                         |
| Latency      | the 90th percentile latency over 10 minutes                        | 90% of requests below 100ms                                                                                 |
| Error Budget | total_errors / total_requests * 0.2 over the last 30 days          | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | total RPS over the last 5 minutes                                  | 5 RPS indicates the application is functioning                                                              |
