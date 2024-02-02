#!/bin/bash
docker compose up -d 

if [ $? -eq 0 ]; then
    echo "Docker Compose executed successfully."
else
    echo "Error: Docker Compose failed." >&2
    exit 1
fi

docker exec -i postgres psql -U postgres -d postgres < populate.sql >> insert-data.log 2>&1

if [ $? -eq 0 ]; then
    echo "Populate SQL executed successfully."
else
    echo "Error: Populate SQL failed." >&2
    exit 1
fi
