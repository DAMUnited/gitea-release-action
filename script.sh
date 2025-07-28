URL=${SERVER_URL}/api/v1/repos/${REPOSITORY}/releases
echo "Using $URL"
echo "Using tag ${TAG} for release"
git tag $TAG
git push origin $TAG
curl --request POST \
          --url "$URL" \
          --header 'content-type: application/json' \
          --header "Authorization: token ${TOKEN}" \
          --data "{ \"body\":\"${BODY}\", \"draft\": false, \"name\": \"Just a release name\", \"tag_name\": \"${TAG}\", \"prerelease\": false }"
