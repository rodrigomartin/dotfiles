return {
    settings = {
        yaml = {
            schemas = require('schemastore').yaml.schemas(),
            customTags = {
                "!Base64 scalar",
                "!Cidr scalar",
                "!And sequence",
                "!Equals sequence",
                "!If sequence",
                "!Not sequence",
                "!Or sequence",
                "!Condition scalar",
                "!FindInMap sequence",
                "!GetAtt scalar",
                "!GetAtt sequence",
                "!GetAZs scalar",
                "!ImportValue scalar",
                "!Join sequence",
                "!Select sequence",
                "!Split sequence",
                "!Sub sequence",
                "!Transform mapping",
                "!Ref scalar",
            }
        }
    }
}

--[[
            schemas = {
                ["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = "serverless.yml",
            },
--]]
