# Login to Azure
Write-Host "Logging in to Azure..." -ForegroundColor Green
az login

# Navigate to infra directory
Set-Location $PSScriptRoot

# Check if terraform.tfvars exists
if (-not (Test-Path "terraform.tfvars")) {
    Write-Host "ERROR: terraform.tfvars not found!" -ForegroundColor Red
    Write-Host "Please create terraform.tfvars with your configuration." -ForegroundColor Red
    exit
}

Write-Host "Found terraform.tfvars" -ForegroundColor Green

# Initialize Terraform
Write-Host "Initializing Terraform..." -ForegroundColor Green
terraform init

# Validate configuration
Write-Host "Validating Terraform configuration..." -ForegroundColor Green
terraform validate

if ($LASTEXITCODE -ne 0) {
    Write-Host "Validation failed. Please fix errors and try again." -ForegroundColor Red
    exit
}

# Plan deployment
Write-Host "Planning deployment..." -ForegroundColor Green
terraform plan -out=tfplan

if ($LASTEXITCODE -ne 0) {
    Write-Host "Planning failed. Please fix errors and try again." -ForegroundColor Red
    exit
}

# Ask for confirmation
$confirmation = Read-Host "Do you want to apply this plan? (yes/no)"
if ($confirmation -eq 'yes') {
    Write-Host "Applying Terraform plan..." -ForegroundColor Green
    terraform apply tfplan
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`nDeployment complete! Getting outputs..." -ForegroundColor Green
        terraform output
        
        # Configure kubectl
        Write-Host "`nConfiguring kubectl..." -ForegroundColor Green
        $rgName = terraform output -raw resource_group_name
        $aksName = terraform output -raw aks_cluster_name
        az aks get-credentials --resource-group $rgName --name $aksName --overwrite-existing
        
        Write-Host "`nVerifying AKS connection..." -ForegroundColor Green
        kubectl get nodes
    } else {
        Write-Host "`nDeployment failed!" -ForegroundColor Red
    }
} else {
    Write-Host "Deployment cancelled." -ForegroundColor Yellow
}