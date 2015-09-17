




function CMyTestGame:SpawnUnitBySpawnerName( strSpawnerName ,strUnitName) 
    print("debug_hs:".."SpawnUnitBySpawnerName") 
 	if strSpawnerName==nil or strSpawnerName=='' then
 		print("debug_hs:".."create unit["..strUnitName.."] failed!strSpawnerName is null!")
 		return nil
 	else
       local hSpawner=Entities:FindByName(nil, strSpawnerName) 
       self:SpawnUnitBySpawner(hSpawner,strUnitName)
   end
end 

function CMyTestGame:SpawnUnitBySpawner( hSpawner ,strUnitName)  
	print("debug_hs:".."SpawnUnitBySpawner") 
 	if not hSpawner then
 		print("debug_hs:".."create unit["..strUnitName.."] failed!spawner is null!")
 		return
 	else
       local vPos=hSpawner:GetAbsOrigin() 
       self:SpawnUnitOnPos(vPos,strUnitName)
 	end

end 


function CMyTestGame:SpawnUnitOnPos( vPos ,strUnitName) 
	print("debug_hs:".."SpawnUnitOnPos") 
	if not vPos then
		print("debug_hs:".."create unit["..strUnitName.."] failed!vPos is null!")
		return
	else
		print("debug_hs:".."SpawnUnitOnPos"..vPos.x.." "..vPos.y.." "..vPos.z.." "..strUnitName) 
		local hNPC=CreateUnitByName(strUnitName, vPos, true, nil, nil, DOTA_TEAM_CUSTOM_2) 
	end
end 