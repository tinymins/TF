JLTL={
JL_On=false,
TL_On=false,
JLCount=0,		
TLCount=0,		
JLIdx=19458,
TLIdx=19459,
JLTitle="[自动吃精力]-",
TLTitle="[自动吃体力]-",
MsgHorseFlag=0,
MoveFlag=0,
fTimeStamp=0,
}

function JLTL.JLSwitch()
local p=GetClientPlayer()
	JLTL.JL_On= not JLTL.JL_On
	if JLTL.JL_On then
		JLTL.MsgHorseFlag=0	JLTL.MoveFlag=0	 
		JLTL.JLCount=(p.nMaxStamina-p.nCurrentStamina)/51
		JLTL.JLCount=math.ceil(JLTL.JLCount)    
		JLTime=JLTL.JLCount*15
		if JLTime>0 then JLTime=JLTime-10 end	
		JLMin=math.floor(JLTime/60)
		JLSec=JLTime%60
		OutputMessage("MSG_SYS",JLTL.JLTitle.."开启\n")
		OutputMessage("MSG_SYS",JLTL.JLTitle.."满精力需"..JLTL.JLCount.."颗【佳·回元餐】,预计用时"..JLMin.."分"..JLSec.."秒（延时会有误差\n")
		OutputMessage("MSG_SYS",JLTL.JLTitle.."请确认不在骑乘状态或战斗状态\n")
	else
		OutputMessage("MSG_SYS",JLTL.JLTitle.."关闭\n")
		p.StopCurrentAction()		
	end
end

function JLTL.TLSwitch()
local p=GetClientPlayer()
	JLTL.TL_On= not JLTL.TL_On
	if JLTL.TL_On then
		JLTL.MsgHorseFlag=0	JLTL.MoveFlag=0	 
		JLTL.TLCount=math.ceil((p.nMaxThew-p.nCurrentThew)/51)			
		TLTime=JLTL.TLCount*15
		if TLTime>0 then TLTime=TLTime-10 end	
		TLMin=math.floor(TLTime/60)
		TLSec=TLTime%60
		OutputMessage("MSG_SYS",JLTL.TLTitle.."开启\n")
		OutputMessage("MSG_SYS",JLTL.TLTitle.."满体力需"..JLTL.TLCount.."颗【佳·转神餐】,预计用时"..TLMin.."分"..TLSec.."秒（延时会有误差\n")
		OutputMessage("MSG_SYS",JLTL.TLTitle.."请确认不在骑乘状态或战斗状态\n")
	else
		OutputMessage("MSG_SYS",JLTL.TLTitle.."关闭\n")
		p.StopCurrentAction()		
	end
end


function JLTL.OnFrameBreathe()
if GetLogicFrameCount() < JLTL.fTimeStamp then return end
	if GetLogicFrameCount()%8==0 then
		local player = GetClientPlayer()		
		if JLTL.JL_On then 
			dwIndex=JLTL.JLIdx 
			if player.nMaxStamina == player.nCurrentStamina then  _JT.Alert("精力已满 自动吃药关闭", function() end, "Yes")  
			JLTL.JL_On=false return end
		elseif  JLTL.TL_On then 
			dwIndex=JLTL.TLIdx
			if  player.nMaxThew == player.nCurrentThew then  _JT.Alert("体力已满 自动吃药关闭", function() end, "Yes")    
			JLTL.TL_On=false return end			
		else return end	
		if player.bOnHorse then			
			if JLTL.MsgHorseFlag==0 then _JT.Alert("不能在骑乘状态吃药，下马后自动继续", function() end, "Yes") JLTL.MsgHorseFlag=1 end 
			return	
		else JLTL.MsgHorseFlag=0	 
		end
		if player.bFightState then end	 
		if player.nMoveState~=MOVE_STATE.ON_STAND and player.nMoveState~=MOVE_STATE.ON_SIT then   
			if JLTL.MoveFlag==0 then _JT.Alert("【自动精力体力】请站好或坐下，会自动继续", function() end, "Yes") JLTL.MoveFlag=1 end 
			return	
		else JLTL.MoveFlag=0	 
		end		
		if player.GetOTActionState()~=0 then   return end		
		JLTL.Eat(dwIndex)
	end
end

function JLTL.Eat(dwIndex)
 	
	local dwBox, dwX=GetItemPosByItemTypeIndex(5,dwIndex)		
	if not dwBox then 	
		if dwIndex==JLTL.JLIdx then OutputMessage("MSG_ANNOUNCE_RED","没有精力药了，请确认背包中有【佳·回元餐】")
		_JT.Alert("自动吃药已关闭\n没有精力药了，请确认背包中有【佳·回元餐】", function() end, "Yes")
		JLTL.JL_On=false
		else OutputMessage("MSG_ANNOUNCE_RED","没有体力药了，请确认背包中有【佳·转神餐】") 			
		_JT.Alert("自动吃药已关闭\n没有体力药了，请确认背包中有【佳·转神餐】", function() end, "Yes")
		JLTL.TL_On=false
		end
	else
		player=GetClientPlayer()
		item = player.GetItem(dwBox, dwX)
		local _,NeedCD,_,_=player.GetItemCDProgress(item.dwID)
		if NeedCD==0 then		
			OnUseItem(dwBox,dwX)					
		elseif  NeedCD>90 then     
			JLTL.fTimeStamp=GetLogicFrameCount()+NeedCD
		end
	end
end

 
Wnd.OpenWindow("Interface\\TF\\EatJLTL\\JLTL.ini","JLTL")

function  JLTL.RegAddonModInfo()
	local tDataJLTL={
		szName = "EatJLTL",									
		szTitle = "精力体力",									
		dwIcon = 3721,										
		szClass = "AUTO",	
		tWidget={
			{	tag = "JL_On", type = "WndCheckBox", 				 
				w = 100, h = 25, text = "自动吃精力开启",				 
				anchor = "TOPLEFT", x = 0, y = 0,					 
				default = function()								 
					return JLTL.JL_On
				end,
				callback = function(enabled)						
					JLTL.JL_On = enabled
				end
			},
				{	tag = "TL_On", type = "WndCheckBox", 				 
				w = 100, h = 25, text = "自动吃体力开启",				 
				anchor = "TOPLEFT", x = 150, y = 0,					 
				default = function()								 
					return JLTL.TL_On
				end,
				callback = function(enabled)					 
					JLTL.TL_On = enabled
				end
			},
			{	tag = "JLTL_ShuoMing", type = "WndTextBox", 				 
				w = 480, h = 28, text = "【功能说明】自动吃精力体力药！",				 
				anchor = "TOPLEFT", x = 0, y = 30,					 
			},{	tag = "JLTL_zhuyi", type = "WndTextBox", 				 
				w = 480, h = 28, text = "【使用注意】不要在骑乘状态，建议刷足药挂机。",				 
				anchor = "TOPLEFT", x = 0, y = 60,					 
			},
			{	tag = "JLTL_Author", type = "WndTextBox", 				 
				w = 160, h = 28, text = "By 微雨凭阑", fontcolor={0,255,255},				 
				anchor = "TOPLEFT", x = 300, y = 330, 					 
			},
		},
	}

	CUIRegAddonModInfo(tDataJLTL)	
end

RegisterEvent("CUSTOM_DATA_LOADED", function()					 
	if arg0 == "Role" then
		JLTL.RegAddonModInfo()
	end
end)
