
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
