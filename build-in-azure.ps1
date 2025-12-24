# Build Docker image directly in Azure Container Registry
Write-Host "Building image in Azure Container Registry..." -ForegroundColor Cyan

# Get ACR details
cd infra
$acrName = terraform output -raw acr_name
$acrLoginServer = terraform output -raw acr_login_server
cd ..

Write-Host "ACR Name: $acrName" -ForegroundColor White
Write-Host "ACR Login Server: $acrLoginServer" -ForegroundColor White
Write-Host "Building image: contoso-university:latest" -ForegroundColor Yellow

# Build in ACR
az acr build --registry $acrName --image contoso-university:latest --file Dockerfile .

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build complete!" -ForegroundColor Green
    Write-Host "Image: ${acrLoginServer}/contoso-university:latest" -ForegroundColor Cyan
    
    Write-Host "Verifying image in registry..." -ForegroundColor Yellow
    az acr repository show --name $acrName --repository contoso-university --output table
    
    Write-Host "Next step: Deploy to AKS" -ForegroundColor Cyan
} else {
    Write-Host "Build failed!" -ForegroundColor Red
    Write-Host "Please check the error messages above." -ForegroundColor Yellow
}