# Get ACR details from Terraform
cd infra
$acrName = terraform output -raw acr_name
$acrLoginServer = az acr show --name $acrName --query "loginServer" -o tsv
cd ..

Write-Host "ACR Login Server: $acrLoginServer" -ForegroundColor Cyan

# Login to ACR
Write-Host "`nLogging into ACR..." -ForegroundColor Green
az acr login --name $acrName

# Build the Docker image
Write-Host "`nBuilding Docker image..." -ForegroundColor Green
docker build -t ${acrLoginServer}/contoso-university:latest -f Dockerfile .

# Push to ACR
Write-Host "`nPushing image to ACR..." -ForegroundColor Green
docker push ${acrLoginServer}/contoso-university:latest

# Verify
Write-Host "`nVerifying image in ACR..." -ForegroundColor Green
az acr repository list --name $acrName --output table

Write-Host "`nImage build and push complete!" -ForegroundColor Green
Write-Host "Image: ${acrLoginServer}/contoso-university:latest" -ForegroundColor Cyan