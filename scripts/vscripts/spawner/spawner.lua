




function CMyTestGame:Spawner()
	local nCurWave=self.m_nCurWave
	local nNextWave=self.m_nNextWave
	local nMaxWave=self.m_nMaxWave
	if nCurWave~=nNextWave then
		if nCurWave~=nMaxWave then
           local strUnitName=self.m_tUnitTable[nNextWave]["name"]
           local strSpawnerName=self.m_tUnitTable[nNextWave]["spawner"]
          
           self:SpawnUnitBySpawnerName(strSpawnerName,strUnitName)
 		   
           self.m_nCurWave=self.m_nNextWave
		else
           GameRules:SetGameWinner(DOTA_TEAM_CUSTOM_1)
		end
	end

end