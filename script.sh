URL=${SERVER_URL}/api/v1/repos/${REPOSITORY}/releases
DATA="{ \"body\":\"${BODY}\", \"draft\": ${DRAFT}, \"name\": \"${NAME}\", \"tag_name\": \"${TAG}\", \"prerelease\": false }"
echo "Using $URL"
echo "Using tag ${TAG} for release"
echo "Data: ${DATA}"

git tag $TAG
git push origin $TAG

#curl --request POST \
#          --url "$URL" \
#          --header 'content-type: application/json' \
#          --header "Authorization: token ${TOKEN}" \
#          --data "$DATA"

HTTP_CODE=$(curl --silent --output /dev/null --write-out "%{http_code}" \
          --request POST \
          --url "$URL" \
          --header 'content-type: application/json' \
          --header "Authorization: token ${TOKEN}" \
          --data "$DATA"

if [ "$HTTP_CODE" -ne 200 ] && [ "$HTTP_CODE" -ne 201 ]; then
    echo "Error: HTTP request failed with status code $HTTP_CODE"
    exit 1
fi

echo "Release created successfully (HTTP $HTTP_CODE)"
