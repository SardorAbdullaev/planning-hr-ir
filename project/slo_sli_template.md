# API Service

| Category     | SLI                                         | SLO                                                                                                         |
|--------------|---------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | total_successful_responses / total_requests | 99%                                                                                                         |
| Latency      | the 90th percentile latency over 10 minutes | 90% of requests below 100ms                                                                                 |
| Error Budget | total_errors / total_requests * 0.2         | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | total number of requests over 1 second      | 5 RPS indicates the application is functioning                                                              |
