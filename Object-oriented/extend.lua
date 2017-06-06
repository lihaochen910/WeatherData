--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
--implement Object-oriented extends
--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
local parents = {...}

function search(interfaces,key)
	for i = 1,#interfaces do
		if interfaces[i][key] ~= nil then
			return interfaces[i][key]
		end
	end
	return nil
end

function implements(...)
    parents = {...}
    local child = {}
   
    -- 设置类的元表
    setmetatable(child, {
        __index = function(table, key)
            return search(parents, key)
        end
    })
   
    -- 给类新增一个new函数，用于创建对象
    -- function child:new()
    --     o = {}
    --     setmetatable(o, child)
    --     child.__index = child
    --     return o
    -- end
   
    -- 返回这个继承了多个类的子类
    return child
end

