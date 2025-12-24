# Navigate to script directory
Set-Location $PSScriptRoot

Write-Host "Configuring ACR access for AKS..." -ForegroundColor Cyan

# Get Terraform outputs
$acrName = terraform output -raw acr_name
$aksName = terraform output -raw aks_cluster_name
$rgName = terraform output -raw resource_group_name

# Get AKS credentials
Write-Host "`nConfiguring kubectl..." -ForegroundColor Green
az aks get-credentials --resource-group $rgName --name $aksName --overwrite-existing

# Get ACR credentials
Write-Host "`nGetting ACR credentials..." -ForegroundColor Green
$acrLoginServer = az acr show --name $acrName --query "loginServer" -o tsv
$acrUsername = az acr credential show --name $acrName --query "username" -o tsv
$acrPassword = az acr credential show --name $acrName --query "passwords[0].value" -o tsv

Write-Host "`nACR Details:" -ForegroundColor Cyan
Write-Host "Login Server: $acrLoginServer" -ForegroundColor White
Write-Host "Username: $acrUsername" -ForegroundColor White

# Delete existing secret if it exists
kubectl delete secret acr-secret --ignore-not-found=true

# Create Kubernetes secret
Write-Host "`nCreating Kubernetes secret for ACR..." -ForegroundColor Green
kubectl create secret docker-registry acr-secret `
  --docker-server=$acrLoginServer `
  --docker-username=$acrUsername `
  --docker-password=$acrPassword `
  --namespace=default

# Verify
Write-Host "`nVerifying secret creation..." -ForegroundColor Green
kubectl get secrets

Write-Host "`nACR configuration complete!" -ForegroundColor Green
Write-Host "`nTo use this in your deployments, add this to your pod spec:" -ForegroundColor Yellow
Write-Host "imagePullSecrets:" -ForegroundColor White
Write-Host "  - name: acr-secret" -ForegroundColor White