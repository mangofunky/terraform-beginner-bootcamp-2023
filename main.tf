terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "terraform-bootcamp-1337"

    workspaces {
      name = "terra-homes"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_music_hosting" {
  source = "./modules/terrahome_aws/"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.music.public_path
  content_version = var.music.content_version
}

resource "terratowns_home" "home" {
  name = "Music"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.home_music_hosting.domain_name
  town = "missingo"
  content_version = var.music.content_version
}

module "home_recipes_hosting" {
  source = "./modules/terrahome_aws/"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.recipes.public_path
  content_version = var.recipes.content_version
}


resource "terratowns_home" "home_recipes" {
  name = "Recipes"
  description = <<DESCRIPTION
Write here all the recipes of the greatest dishes
DESCRIPTION
  domain_name = module.home_recipes_hosting.domain_name
  town = "missingo"
  content_version = var.recipes.content_version
}