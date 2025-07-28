URL=${SERVER_URL}/api/v1/repos/${REPOSITORY}/releases
DATA="{ \"body\":\"${BODY}\", \"draft\": ${DRAFT}, \"name\": \"Just a release name\", \"tag_name\": \"${TAG}\", \"prerelease\": false }"
echo "Using $URL"
echo "Using tag ${TAG} for release"
git tag $TAG
git push origin $TAG
curl --request POST \
          --url "$URL" \
          --header 'content-type: application/json' \
          --header "Authorization: token ${TOKEN}" \
          --data "$DATA"
