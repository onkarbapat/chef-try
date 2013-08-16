{
  "name": "hub",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "description": "Start node as a selenium grid hub",
  "default_attributes": {
    "selenium": {
      "name": "selenium-server-standalone-",
      "version": "2.34.0",
      "url": "https://selenium.googlecode.com/files/"
    },
    "user":{
      "name": "root"
    }
  },
  "run_list": [
    "recipe[selenium-test::hub]"
  ]
}