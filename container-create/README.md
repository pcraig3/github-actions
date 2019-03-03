# GitHub Action for creating a container from an Azure Container Repository using a service principal

The GitHub Action for [Azure CLI](https://github.com/Azure/azure-cli) wraps the Azure CLI to enable managing Azure resources inside of an Action, however, it doesn't let us
run deploy a container using a service principal.

[Running the following command](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-auth-aci#authenticate-using-the-service-principal) is not possible without exposing the service principal ID and password.

```
az container create \
    --resource-group myResourceGroup \
    --name mycontainer \
    --image mycontainerregistry.azurecr.io/myimage:v1 \
    --registry-login-server mycontainerregistry.azurecr.io \
    --registry-username <service-principal-ID> \
    --registry-password <service-principal-password>
```

To log into Azure, please use the [Azure Login](../azure-login) Action.

## Usage

```

 action "Deploy as Azure Container Instance" {
   uses = "pcraig3/github-actions/cli@master"
   needs = ["Login to Azure"]
   secrets = ["AZURE_SERVICE_APP_ID", "AZURE_SERVICE_PASSWORD"]
}

```

### Environment variables

`ACR_LOGIN_SERVER`: the `loginServer` of the container repository to pull the image from.

It would be cool to be able to customize the resource-group, container name, and container-dns name, but I don't have any other users.
