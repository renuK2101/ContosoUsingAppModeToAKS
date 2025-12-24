# Navigate to script directory
Set-Location $PSScriptRoot

# Get ACR login server
cd ../infra
$acrLoginServer = terraform output -raw acr_login_server
$aksName = terraform output -raw aks_cluster_name
$rgName = terraform output -raw resource_group_name
cd ../k8s

Write-Host "Deploying to AKS..." -ForegroundColor Cyan
Write-Host "AKS Cluster: $aksName" -ForegroundColor White
Write-Host "ACR Server: $acrLoginServer" -ForegroundColor White

# Ensure kubectl is configured
az aks get-credentials --resource-group $rgName --name $aksName --overwrite-existing

# Replace ACR placeholder in deployment.yaml
$deploymentContent = Get-Content deployment.yaml -Raw
$deploymentContent = $deploymentContent -replace '<ACR_LOGIN_SERVER>', $acrLoginServer
$deploymentContent | Out-File deployment-temp.yaml -Encoding UTF8

# Apply the deployment
Write-Host "`nApplying Kubernetes manifests..." -ForegroundColor Green
kubectl apply -f deployment-temp.yaml

# Clean up temp file
Remove-Item deployment-temp.yaml

# Wait for deployment
Write-Host "`nWaiting for deployment to complete..." -ForegroundColor Yellow
kubectl rollout status deployment/contoso-university

# Get service external IP
Write-Host "`nGetting service details..." -ForegroundColor Green
kubectl get services contoso-university-service

Write-Host "`nDeployment complete!" -ForegroundColor Green
Write-Host "`nTo get the external IP, run:" -ForegroundColor Cyan
Write-Host "kubectl get service contoso-university-service" -ForegroundColor White