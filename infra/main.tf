resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
  tags     = var.tags
}

resource "random_string" "unique" {
  length  = 6
  special = false
  upper   = false
}