Path = require 'path'

module.exports = (config)->
    config.root or= global.root or process.cwd()

    if config.stassets?.root?
        config.stassets.root =
            Path.normalize Path.join config.root, config.stassets.root
    if config.stassets?.vendors?.prefix?
        config.stassets.vendors.prefix =
        config.stassets.vendors.prefix.map (_)->
            Path.normalize Path.join config.root, _
    if config.routing?
        config.routing = config.routing.map (route)->
            "#{config.root}/#{route}"
    config
