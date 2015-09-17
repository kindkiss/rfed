



function CMyTestGame:OnHeroPicked( event )
     
	print("debug_hs:".."OnGamePick")
	local hPlayer=PlayerResource:GetPlayer(event.player-1)
	hPlayer:SetTeam(DOTA_TEAM_CUSTOM_1)

	for k,v in pairs(event) do
		print(k,v)
	end

end


function CMyTestGame:OnEntityKilled( event )
	local hDeadUnit = EntIndexToHScript( event.entindex_killed )
	local hAttackerUnit = EntIndexToHScript( event.entindex_attacker )
	if hDeadUnit:GetTeam()==DOTA_TEAM_CUSTOM_2 then
		self.m_nNextWave=self.m_nNextWave+1
	end
end