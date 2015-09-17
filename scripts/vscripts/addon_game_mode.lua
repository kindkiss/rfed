
--init my custom class
if CMyTestGame==nil then
    _G.CMyTestGame=class({})
end


--requried 
require("event\\event_hero")
require("spawner\\unit_spawner")
require("spawner\\spawner")
--precache the resources

function Precache( context )
	print("debug_hs:".."Precache")
	GameRules.m_tMyGame=CMyTestGame()  --利用metatable实例化一个对象
	GameRules.m_tMyGame:PrechaTables()

	PrecacheUnitByNameSync( "npc_dota_unit_undying_zombie", context )
	PrecacheUnitByNameSync( "npc_dota_lone_druid_bear1", context )
	PrecacheUnitByNameSync( "npc_dota_unit_undying_zombie", context )
	PrecacheResource("models", "models/heroes/undying/undying_minion_torso.vmdl", context)
	
end


function Activate()
	print("debug_hs:".."Activate")
	
	GameRules.m_tMyGame.m_itGameMode=GameRules:GetGameModeEntity()
	GameRules.m_tMyGame:InitGame()
	
end


function CMyTestGame:InitGame()
	--GameRules

	self.m_itGameMode:SetAnnouncerDisabled( true )
	self.m_itGameMode:SetFixedRespawnTime( 4 )
	
	GameRules:SetGoldPerTick( 0 )
	GameRules:SetPreGameTime( 0 )
	GameRules:SetCustomGameSetupTimeout( -1 )
    --游戏数据
    self.m_nCurWave=0
    self.m_nNextWave=1
    self.m_nMaxWave=4
    --
	self:RegisterEventListenr()     --注册监听函数
    self.m_itGameMode:SetContextThink("main_game_loop",function()
    	 return self:GameLoop()
    end,0) 
	
end 	

function CMyTestGame:RegisterEventListenr()
     
	ListenToGameEvent("dota_player_pick_hero", Dynamic_Wrap(CMyTestGame,"OnHeroPicked"), self) 
	ListenToGameEvent("entity_killed", Dynamic_Wrap(CMyTestGame,"OnEntityKilled"), self) 

end

function CMyTestGame:GameLoop()
    local flInterval=0.01

    --print("debug_hs:".."GameLoop")
    local enmGameState=GameRules:State_Get()
    if(enmGameState==DOTA_GAMERULES_STATE_GAME_IN_PROGRESS) then
    	--print("debug_hs:".."GameLoop"..enmGameState)
    	self:Spawner()
	end
    return  flInterval
end

function CMyTestGame:PrechaTables()
	self.m_tUnitTable=require("spawner\\unit_table")
end



