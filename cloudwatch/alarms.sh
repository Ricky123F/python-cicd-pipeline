#!/bin/bash

# CloudWatch Alarms Setup
# Run this script to recreate all CloudWatch alarms for the python-cicd-pipeline

TOPIC_ARN="arn:aws:sns:us-west-2:236580259127:cloudwatch-alerts"
REGION="us-west-2"
CLUSTER="python-cicd-cluster"
SERVICE="python-cicd-service"

# CPU Alarm
aws cloudwatch put-metric-alarm --alarm-name "ECS-High-CPU" --alarm-description "Alert when CPU exceeds 80%" --metric-name CPUUtilization --namespace AWS/ECS --statistic Average --dimensions Name=ClusterName,Value=$CLUSTER Name=ServiceName,Value=$SERVICE --period 120 --evaluation-periods 1 --threshold 80 --comparison-operator GreaterThanThreshold --alarm-actions $TOPIC_ARN --region $REGION

# Memory Alarm
aws cloudwatch put-metric-alarm --alarm-name "ECS-High-Memory" --alarm-description "Alert when memory exceeds 80%" --metric-name MemoryUtilization --namespace AWS/ECS --statistic Average --dimensions Name=ClusterName,Value=$CLUSTER Name=ServiceName,Value=$SERVICE --period 120 --evaluation-periods 1 --threshold 80 --comparison-operator GreaterThanThreshold --alarm-actions $TOPIC_ARN --region $REGION

# Task Count Alarm
aws cloudwatch put-metric-alarm --alarm-name "ECS-No-Running-Tasks" --alarm-description "Alert when no ECS tasks are running" --metric-name RunningTaskCount --namespace AWS/ECS --statistic Average --dimensions Name=ClusterName,Value=$CLUSTER Name=ServiceName,Value=$SERVICE --period 60 --evaluation-periods 1 --threshold 1 --comparison-operator LessThanThreshold --alarm-actions $TOPIC_ARN --region $REGION

echo "All CloudWatch alarms created successfully"