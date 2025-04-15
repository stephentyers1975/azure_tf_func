
resource "azurerm_storage_account" "frontend" {
  name                     = "st${var.application_name}${var.environment_name}${random_string.main.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account_static_website" "frontend" {
  storage_account_id = azurerm_storage_account.frontend.id
  error_404_document = "404.html"
  index_document     = "index.html"
}