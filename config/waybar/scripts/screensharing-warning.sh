#!/bin/sh

pgrep wf-recorder &> /dev/null && echo {\"text\": \"screensharing active\",\"alt\":\"active\",\"class\":\"warning-text\"} || echo {}
