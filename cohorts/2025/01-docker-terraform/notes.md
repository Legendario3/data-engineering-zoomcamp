# postgres

## comands to get pgcli working

```bash 
pip install pgcli
sudo apt-get install build-essential python3-dev libpq-dev
pip install keyrings.alt
```

## command to run pgcli
```bash
pgcli -h localhost -p 5432 -u root -d ny_taxi
```

## Docker scripts
```bash
docker network create pg-network

docker run -it \
    -e POSTGRES_USER="root" \
    -e POSTGRES_PASSWORD='root' \
    -e POSTGRES_DB="ny_taxi" \
    -v ./nytaxi_postgres_data:/var/lib/postgresql/data \
    -p 5432:5432 \
    --network=pg-network \
    --name=pg-database \
    postgres:13
    
docker run -it \
    -e PGADMIN_DEFAULT_EMAIL="legendario3@gmail.com" \
    -e PGADMIN_DEFAULT_PASSWORD='root' \
    -p 8080:80 \
    --network=pg-network \
    --name pgadmin \
     dpage/pgadmin4
```

## Python ingestion
```bash
python3 upload_data.py \
 --user=root \
 --password=root \
 --host=localhost \
 --port=5432 \
 --db=ny_taxi \
 --table_name=yellow_taxi_trips \
 --url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"
```

## Docker build
```bash
 docker build -t taxi_ingest:v1 .
```

 ## Inestion with docker
```bash 
 docker run -it --network=pg-network \
    --name pipeline \
    taxi_ingest:v1 \
 --user=root \
 --password=root \
 --host=pg-database \
 --port=5432 \
 --db=ny_taxi \
 --table_name=yellow_taxi_trips \
 --url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"
```

## Install Docker Compuse

```bash
sudo apt update
sudo apt install -y curl jq

COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)

sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

# Enable Auto Completion
sudo curl -L "https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose" -o /etc/bash_completion.d/docker-compose


```

## Run docker compuse
```bash
docker-compose up -d

docker-compuse down
```

## Terraform
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Installation
sudo apt update
sudo apt-get install terraform
```


# Home Work

```bash
python3 upload_data.py \
 --user=root \
 --password=root \
 --host=localhost \
 --port=5432 \
 --db=ny_taxi \
 --table_name=yellow_taxi_trips \
 --url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz"
 ```