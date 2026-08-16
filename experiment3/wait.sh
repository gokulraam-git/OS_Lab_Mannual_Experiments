#!/bin/bash

(
echo "Child Process Started"
sleep 2
echo "Child Process Completed"
) &

wait
echo "Parent Resumes Execution"