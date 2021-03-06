should = require('chai').should()

Rupert = require('../src/express.js')

describe 'Rupert Express', ->
    config =
        root: __dirname
        name: 'rupert.tests'
        stassets:
            root: './client'
            vendors:
                config:
                    dependencies: {}
        routing: [
            'server/route.coffee'
        ]

    lib = __dirname + "/rupert-config"
    config.stassets.vendors.config.dependencies[lib] = yes

    rupert = Rupert(config)
    beforeEach (done)-> rupert.start done

    it 'exposes a config function', ->
        Rupert.should.be.instanceof Function

    it 'should normalize config paths', ->
        config.should.have.property('wasRouted').that.equals yes
        config.stassets.root[0].should.equal "#{__dirname}/client"

    describe 'Stassets', ->
        it 'loads configurations', ->
            config.stassets.scripts.types.length.should.equal(2)
