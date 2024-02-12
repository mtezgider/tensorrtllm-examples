#!/bin/bash

# Function to check if gsutil is installed
is_gsutil_installed() {
    if command -v gsutil &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Check if gsutil is already installed
if is_gsutil_installed; then
    echo "gsutil is already installed."
    gsutil version
else
    # Update and install necessary packages
    apt-get update && \
        apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        && rm -rf /var/lib/apt/lists/*

    # Import the Google Cloud public key
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

    # Add the gcloud CLI distribution URI as a package source
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
        | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    # Update and install the Google Cloud SDK
    apt-get update && \
        apt-get install -y google-cloud-sdk

    # Confirm the installation
    gcloud version
fi
