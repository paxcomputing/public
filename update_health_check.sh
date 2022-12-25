#!/bin/bash

# Set the ECS cluster name
ecs_cluster_name="demo7-cluster"
echo $ecs_cluster_name

# Get a list of all Route53 health checks
health_checks=$(aws route53 list-health-checks --query "HealthChecks[*].Id" --output text)
echo $health_checks

# Loop through each health check
for health_check in $health_checks; do
  # Get the current tag for the health check
  current_tag=$(aws route53 list-tags-for-resource --resource-type healthcheck --resource-id $health_check --query "ResourceTagSet.Tags[?Key=='DASH_CUSTOMER_ENV'].Value" --output text)
  echo "check tag : $current_tag"
  # Compare the current tag with the desired tag
  if [ "$current_tag" = "$ecs_cluster_name" ]; then
    # If the tags match, disable the health check
    aws route53 update-health-check --health-check-id $health_check --disabled
  fi
done
