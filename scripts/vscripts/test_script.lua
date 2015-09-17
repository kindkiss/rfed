

test_script=class({})


function test_script: OnSpellStart()


	local t={}
	t.target=self:GetCaster();
	print(self,test_script,getmetatable(self))

	for k,v in pairs(self) do
		print(k,v)
	end

	for k,v in pairs(test_script) do
		print(k,v)
	end
    print("===================")
	for k,v in pairs(getmetatable(self)) do
		print(k,v)
	end
	t.damage=100
	ApplyDamage(t)
--	print(z)
end