# Challenge 2a: The Azure Container Registry

[< Previous Challenge](./01a-containers.md) - **[Home](../README.md)** - [Next Challenge >](03-acaintro_CLI.md)

## Introduction

Now that we have our application packaged as container images, where do they go?

## Description

In this challenge we will be creating and setting up a new, private, Azure Container Registry. This will be the new home of the containers we just created. We will see later on how Kubernetes will pull our images from this registry.

- Deploy an Azure Container Registry (ACR)
- Ensure your ACR has proper permissions and credentials set up
- Login to your ACR
- Push your Docker container images to the ACR
- List all images in your ACR

## Success Criteria

1. You have provisioned a new Azure Container Registry
1. You have deployed your container images to the registry.
2. You can log into the registry and see all images.

## resources 

1. [Create an Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-azure-cli)
2. [Authenticate with an Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-authentication?tabs=azure-cli)
3. [Azure Container Registry CLI](https://docs.microsoft.com/fr-fr/cli/azure/acr?view=azure-cli-latest)
