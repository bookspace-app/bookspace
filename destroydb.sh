IDS=$(curl --silent -X GET "https://bookspace-app.herokuapp.com/api/comments" -H "accept: */*" | jq '[.[].id] | .[]')
for ID in $IDS; do
    curl --silent -X DELETE "https://bookspace-app.herokuapp.com/api/comments/$ID" -H "accept: */*"
    echo "Deleted comment $ID"
done

IDS=$(curl --silent -X GET "https://bookspace-app.herokuapp.com/api/publications" -H "accept: */*" | jq '[.[].id] | .[]')
for ID in $IDS; do
    curl --silent -X DELETE "https://bookspace-app.herokuapp.com/api/publications/$ID" -H "accept: */*"
    echo "Deleted publication $ID"
done

IDS=$(curl --silent -X GET "https://bookspace-app.herokuapp.com/api/users" -H "accept: */*" | jq '[.[].id] | .[]')
for ID in $IDS; do
    curl --silent -X DELETE "https://bookspace-app.herokuapp.com/api/users/$ID" -H "accept: */*"
    echo "Deleted user $ID"
done