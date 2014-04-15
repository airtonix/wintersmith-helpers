_ = require "lodash"

module.exports = (env, callback) ->


	class JsonFormatter
		cache = []

		process = (key, value) ->
			if _.isObject value
				index = cache.indexOf(value)
				console.log index
				if index > -1
					return
				cache.push value
			return value

		constructor: (input) ->
			cache = []
			output = JSON.stringify input, process, 2
			cache = null
			return output

	env.helpers.toJson = JsonFormatter

	callback()
