curl --request POST \
          --url https://gitte.damu.rocks/api/v1/repos/SIP/semantic-release-versioning-test/releases \
          --header 'content-type: application/json' \
          --header 'Authorization: token ${{ secrets.GITEA_TOKEN}}' \
          --data '{ "body":"$BODY", "draft": false, "name": "Just a release name", "tag_name": "${{ steps.get_next_version.outputs.version }}", "prerelease": false }'