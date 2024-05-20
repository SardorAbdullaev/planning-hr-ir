# Infrastructure

## AWS Zones
zone1 "us-east-2a", "us-east-2b", "us-east-2c" <br>

## Servers and Clusters

### Table 1.1 Summary
| Asset                           | Purpose                                                     | Size                                                                   | Qty                                                                       | DR                                                                                                           |
|---------------------------------|-------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name                      | Brief description                                           | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset           | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| EC2 instances running webserver | Webserver instances serving the frontend of the application | t3.micro | 1 instance per az and per region | Multiple instances in each region                                                                             |
| SSH keys                        | N/A                                                         | N/A | 1                                                                         | Stored locally                                                                                               |
| Github repository               | For terraform code                                           | N/A | 1                                                                         | Stored in Github                                                                                             |
| RDS instance                    | Database for the application                                 | db.t2.small | 2 instance                                nodes per region                | replicated                                                                                                   |
| S3 bucket                       | For storing Database backups                                 | N/A | 1                                                                         | Stored in zone1                                                                                              |
| ALB                             | Load balancer for the webserver instances                    | N/A | 1 instance per region                                                     | Multiple ALBs in each region                                                                                 |
| EKS cluster                     | Monitoring with grafana and argo                            | t3.medium | 2 nodes in each region                                                    | Multiple EKS clusters in each region                                                                         |

### Descriptions
More detailed descriptions of each asset identified above.

#### EC2 instances running webserver
- These instances are running the webserver that serves the frontend of the application.
- These instances are running in 2 regions, us-west-1 and us-east-2.
- These instances are behind an ALB.

#### SSH keys
- These keys are used to access the EC2 instances running the webserver.
- These keys are stored locally.

#### Github repository
- This repository contains the terraform code for the infrastructure.

#### RDS instance
- This instance is running the database for the application.

#### S3 bucket
- This bucket is used to store the backups of the database.

## DR Plan
### Pre-Steps:
Ensure the infrastructure is set up and working in the DR site. This includes the following:
- Replicated RDS database
- Replicated S3 bucket
- Replicated EC2 instances running the webserver
- Replicated EKS cluster


## Steps:
1. Create a load balancer and point DNS to the load balancer. This way we can have multiple instances behind 1 IP in a region. During a failover scenario, we would fail over the single DNS entry at our DNS provider to point to the DR site. 

2. Have a replicated RDS database and perform a failover on the database. In this DR step, we would have already configured replication and would perform the database failover. Ideally, our application would be using a generic CNAME DNS record and would just connect to the DR instance of the database.

3. Ec2 instances running the webserver should be replicated in DR region. In this DR step, we would have already configured replica instances and the load balancer

4. EKS cluster should have at least 2 nodes in DR region. In this DR step, we would have already configured DR cluster and the load balancer

