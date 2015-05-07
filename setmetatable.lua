
local _a1 = {20, 1, key1="hello", key2="world",lang="lua"}
print("the table _a1:")

for _,v in pairs(_a1) do
	print(v)
end
local _a2 = {key1="hello new", key2 = "world new"}
print("\n the old tables _a2:")
for _,v in pairs(_a2) do
	print(v)
end

print("\na2的metaable:",getmetatable(_a2))
print("language:", _a2["lang"])

setmetatable(_a2,{__index = _a1})
print("\nthe new table _a2")

for _,v in pairs (_a2) do
	print(v)
end
print("language:", _a2["lang"])

print("_a2数据的第一个元素:", _a2[1])
print("\n_a2的metable:",getmetatable(_a2))


print("-----------------test2----------------------")
mytable = setmetatable({key1 = "valuse1"},{
	__index = function(mytable, key)
		if key == "key2" or key == "key3" then
			return "metatablevaluse"
		else
			return mytable[key]
		end
	end
})

print(mytable.key1, mytable.key2, mytable.key3)


print("-----------------test3----------------------")

mymetatable = {}
mytable = setmetatable({key1 = "value1"},{__newindex = mymetatable})

print(mytable.key1)

mytable.newkey = "new value 2"
print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "new value 1"
print(mytable.key1, mymetatable.newkey1)

print("-----------------test4----------------------")

mytable = setmetatable({key1 = "value1"},{
__newindex = function(mytable, key, value)
	rawset(mytable, key, "\""..value.."\"")
end
})
mytable.key1 = "new value"
mytable.key2 = 4
print(mytable.key1, mytable.key2)

print("-----------------test--add--------------------")

mytable = setmetatable({1,2,3},{
	__add = function(mytable, newtable)
	for i=1, table.maxn(newtable) do
	--	table.insert(mytable, table.maxn(mytable)+1, newtable[i])
		mytable[i] = mytable[i] + newtable[i]
	end
	return mytable
	end
})

secondTable = {4,5,6}

mytable = mytable + secondTable
if(mytable ~= nil) then
for k,v in pairs(mytable) do
	print(k,v)
end
end
