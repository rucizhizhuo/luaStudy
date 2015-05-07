print("----------------json--decode------------------")
local cjson = require "cjson"

local cjson2 = cjson.new()

local sampleJson = [[{"age":"23","testArray":{"array":[1,2,3,4,5]},"Him":"www.zqgame.cn"}]]

local data = cjson.decode(sampleJson)
print(data["age"])

print(data["testArray"]["array"][1])

print("----------------json--ENcode------------------")
local intdatas = {}
intdatas.key = "this is key1"

local jsonstr = cjson.encode(intdatas)
print(jsonstr)
