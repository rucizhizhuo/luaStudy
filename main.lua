--[[
local p = os.getenv("PWD")
print(p)
local m_package_path = package.path
package.path = string.format("%s;%s?.lua;%s?/init.lua",m_package_path, p, p)
--]]
trace = require "trace"

local function factorial(n)
	if n <= 1 then
		return 1
	end
	return factorial(n-1) * n
end

function foo(n)
	trace.trace("n",n)
	local s =  factorial(100)
	return s
end

function hello()
	print "hello"
end

foo(3)
hello()
foo()
