# Challenge 1, Path A: Got Containers?

[< Previous Challenge](./00-prereqs.md) - **[Home](../README.md)** - [Next Challenge >](./02a-acr.md)

## Introduction

The first step in our journey will be to take our application and package it as a container image using Docker.

## Description

In this challenge we'll be creating an Azure Linux VM, building, and running the node.js based FabMedical app on the VM to see it working. Then we'll be creating Dockerfiles to build a container image of the application.

- Connect to your virtual environment : 

| Participant | Utilisateur Poste Distant | Nom Poste Distant | Mot de Passe | Utilisateur Compte Azure |
|-----|---------------------------|-------------------|--------------|--------------------------|
| Antony MAUGET	|amauget	|amaugetvm	|SNCFOpenHack2022!	|amauget@M365x42249985.onmicrosoft.com|
| Eric JOLLEC	|ejollec	|ejollecvm	|SNCFOpenHack2022!	|ejollec@M365x42249985.onmicrosoft.com|
| Myriam DURAND-GASSELIN	|mdurand	|mdurandvm	|SNCFOpenHack2022!	|mdurand@M365x42249985.onmicrosoft.com|
| Stephane BARRE	|sbarre	|sbarrevm	|SNCFOpenHack2022!	|sbarre@M365x42249985.onmicrosoft.com|
| Barthelemy LEVEQUE	|bleveque	|blevequevm	|SNCFOpenHack2022!	|bleveque@M365x42249985.onmicrosoft.com|
| Remy GONZALEZ	|rgonzalez	|rgonzalezvm	|SNCFOpenHack2022!	|rgonzalez@M365x42249985.onmicrosoft.com|
| Sebastien BIANCO	|sbianco	|sbiancovm	|SNCFOpenHack2022!	|sbianco@M365x42249985.onmicrosoft.com|
| Stephane BILLIAU	|sbilliau	|sbilliauvm	|SNCFOpenHack2022!	|sbilliau@M365x42249985.onmicrosoft.com|
| Sylvie QUEFFELEC	|squeffelec	|squeffelecvm	|SNCFOpenHack2022!	|squeffelec@M365x42249985.onmicrosoft.com|
| Daniel ABEL	|dabel	|dabelvm	|SNCFOpenHack2022!	|dabel@M365x42249985.onmicrosoft.com|
| Fredy CERISIER	|fcerisier	|fcerisiervm	|SNCFOpenHack2022!	|fcerisier@M365x42249985.onmicrosoft.com|
| Alain BELBEOC'H	|abelbeoch	|abelbeochvm	|SNCFOpenHack2022!	|abelbeoch@M365x42249985.onmicrosoft.com|
| Philippe CAFFAREL	|pcaffarel	|pcaffarelvm	|SNCFOpenHack2022!	|pcaffarel@M365x42249985.onmicrosoft.com|
| Gaetan LAMBOT	|glambot	|glambotvm	|SNCFOpenHack2022!	|glambot@M365x42249985.onmicrosoft.com|
| Sim Bienvenue HOUL BOUMI	|sbhoulboumi	|sbhoulboumivm	|SNCFOpenHack2022!	|sbhoulboumi@M365x42249985.onmicrosoft.Com|
| Laurent LEROUX	|lleroux	|llerouxvm	|SNCFOpenHack2022!	|lleroux@M365x42249985.onmicrosoft.com|
| Frederic GORGEON	|fgorgeon	|fgorgeonvm	|SNCFOpenHack2022!	|fgorgeon@M365x42249985.onmicrosoft.com|
| Denis WIATZ	|dwiatz	|dwiatzvm	|SNCFOpenHack2022!	|dwiatz@M365x42249985.onmicrosoft.com|
| Frederic CALLARD	|fcallard	|fcallardvm	|SNCFOpenHack2022!	|fcallard@M365x42249985.onmicrosoft.com|
| Regis KERGOAT	|rkergoat	|rkergoatvm	|SNCFOpenHack2022!	|rkergoat@M365x42249985.onmicrosoft.com|

- Install Docker using Chocolatey 
```
choco install docker-desktop -y
```
- Run the node.js application
	- Each part of the app (api and web) runs independently.
	- Build the API app by navigating to the content-api folder and run `npm install`.
	- To start the app, run `node ./server.js &`
	- Verify the API app runs by hitting its URL with one of the three function names. Eg: **<http://localhost:3001/speakers>**
- Repeat for the steps above for the content-web app, but verify it's available via a browser on the Internet!
	- **NOTE:** The content-web app expects an environment variable named `CONTENT_API_URL` that points to the API app's URL. 
- Create a Dockerfile for the content-api app that will:
	- Create a container based on the **node:8** container image
	- Build the Node application like you did above (Hint: npm install)
	- Exposes the needed port
	- Starts the node application

- Create a Dockerfile for the content-web app that will:
	- Do the same as the Dockerfile for the content-api
	- Also sets the environment variable value as above

- Build Docker images for both content-api and content-web

- Run both containers you just built and verify that it is working. 
	- **Hint:** Run the containers in 'detached' mode so that they run in the background.
	- **NOTE:** The containers need to run in the same network to talk to each other. 
		- Create a Docker network named "fabmedical"
		- Run each container using the "fabmedical" network
		- **Hint:** Each container you run needs to have a "name" on the fabmedical network and this is how you access it from other containers on that network.
		- **Hint:** You can run your containers in "detached" mode so that the running container does NOT block your command prompt.

## Success Criteria

1. You can run both the node.js based web and api parts of the FabMedical app on the VM
2. You have created 2 Dockerfiles files and created a container image for both web and api.
3. You can run the application using containers.

## Learning Resources

- <https://docs.microsoft.com/en-us/dotnet/architecture/microservices/container-docker-introduction/docker-defined>
- <https://docs.microsoft.com/en-us/training/modules/intro-to-docker-containers/2-what-is-docker>
- <https://nodejs.org/en/docs/guides/nodejs-docker-webapp/>
- <https://buddy.works/guides/how-dockerize-node-application>
- <https://www.cuelogic.com/blog/why-and-how-to-containerize-modern-nodejs-applications>
- <https://betterstack.com/community/guides/scaling-nodejs/dockerize-nodejs/>
