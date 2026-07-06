resource "azurerm_resource_group" "nesttest" {
  for_each = var.rg
  name = each.value.name
  location = each.value.location
}
resource "azurerm_virtual_network" "main" {
    for_each = var.vnet
  name                = each.value.name
  address_space       = each.value.a_space
  location            = azurerm_resource_group.nesttest[each.value.rg_ref].location
  resource_group_name = azurerm_resource_group.nesttest[each.value.rg_ref].name
}
resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}