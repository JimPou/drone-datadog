#!/bin/sh

TAGS=$(echo ${PLUGIN_TAGS} | sed  's/,/\",\"/g')

currenttime=$(date +%s)
curl -X POST -H "Content-type: application/json" \
-d "{ \"series\" :
         [{\"metric\":\"${PLUGIN_METRIC_NAME}\",
          \"points\":[[$currenttime, ${PLUGIN_VALUE}]],
          \"type\":\"${PLUGIN_TYPE}\",
          \"tags\":[\"$TAGS\"]}
        ]
    }" \
"https://app.datadoghq.com/api/v1/series?api_key=${PLUGIN_API_KEY}"

env