# IPNS Gateway

The aim of the gateway is to serve as a bridge between the IPFS network and the web.
It's goal is to serve a website that is published on IPFS as an IPNS key peer through a domain name.

It acts as an IPNS node that listens for requests and serves the website that is published on the IPNS key peer.
It supports TLS and can be configured to use a domain name.

# IPNS Configuration (Mandatory)

The IPNS (InterPlanetary Naming System) is the hash of the IPFS (InterPlanetary File System) peer that publishes the website. A folder containing an `index.html` file is expected to be published on the IPNS record.

- `IPNS=k51qzi5uqu5di6mt...`
- `TARGET_FOLDER=/var/www/html` (The folder where the website is published)

# IPFS Configuration (Optional)
- `BOOTSTRAP` (List of nodes to connect to in IPFS format, separated by commas)