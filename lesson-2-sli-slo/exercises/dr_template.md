# Infrastructure

## AWS Zones
- Zone 1 US-EAST-2 including availability Zones US-EAST-2A, US-EAST-2B, US-EAST-2C
- Zone 2 US-WEST-2 including availability Zones US-WEST-1A, US-WEST-1B

## Servers and Clusters
- 1 Web server 
- 1 EKS cluster
- 2 RDS clusters
### Table 1.1 Summary
| Asset       | Purpose                                                                                                                    | Size                                                                   | Qty                                                             | DR                                                                                                           |
|-------------|----------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name  | Brief description                                                                                                          | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| VPC          | Virtual Private Cloud help us accessible to virtual network                                  | CIDR range | Availibility Zones will have corressponding number of VPCs | Both regions for our DR plan                                                  |
| EC2 instance | A scalable computing services in the AWS cloud help us to handle requirements changes  | t3.micro  | 3                                                             | Both regions for our DR plan                                                               |
| EKS cluster | A totally managed Kubernetes service to run Kubernetes by AWS   | 2 nodes                                       |   1 cluster                                                                               | Both regions for our DR plan                                                                      |
| ALB         | A automatically service distributes incoming traffic across multiple targets (EC2, containers, Ip addresses,...)                                                                  | not applicable            | 1                                                             | Both regions for our DR plan                                                         |
| RDS  | Relational database on AWS cloud with the ease of setting up, operating and scaling    | db.t2.small                                      | 2                                                               | Both regions for our DR                                     |
| EKS cluster | Run Kubernetes to organize, operate, scale container applications                                                          | Not applicable                                                         | 2                                                               | Both regions for our DR                   |
| EKS nodes   |Amazon EC2 Auto Scaling group and associated Amazon EC2 instances              | t3.medium                                                              | 2 nodes per cluster                                                              | Both regions for our DR     |

### Descriptions
The details description of assets as below: 
- EC2 instance: help to deploy and develop applications very fast.
- VPC: we can build a virtual network in the AWS cloud - no VPNs, hardware, or physical datacenters required and configure our own network rules in VPC like how the network are exposed to the Internet, inbound traffic, outbound traffic, NSG, etc.
- EKS cluster and EKS note: With Amazon EKS, the Kubernetes control plane--including the backend persistence layer and the API servers--is provisioned and scaled across various AWS availability zones, resulting in high availability and eliminating a single point of failure. Unhealthy control plane nodes are detected and replaced, and patching is provided for the control plane. The result is a resilient AWS-managed Kubernetes cluster that can withstand even the loss of an availability zone.
- RDS cluster is deployed as primary cluster in us-east-2 region with one write instance and other read instance. A secondary read cluster is deployed in us-west-1 with replication from us-east-2 cluster. Secondary cluster has 2 read instances.
- ALB: Help to monitor the health of its registered targets, and routes traffic only to the healthy targets (help with the traffic between your services in AWS cloud or the traffic between your appplication and end-users). Elastic Load Balancing scales your load balancer capacity automatically in response to changes in incoming traffic.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.
1. Create S3 bucket with a global unique name and edit the _config.tf file.
2. Using IaaC with Terraform to provisioning infrastructure to make sure consistency betwween our instances and backup dbs.
3. Make sure that zone 1 and zone 2 have the same infrastructure.

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region
- First step: After stop the RDS in primary region, make sure to point the DNS to the newly created cloud load balancer then we will fail over the DNS entry and point to the disaster recovery site. 
- Next step: Make sure we create a replicated database and we will do a failover on this. Instead of using backup, which is not our main purpose in the lesson, we will connect to the DR instance of the database. 


