DrugEq={
	IsOn=false,
	SellEquip=false,
	ProtectLast=false,
	bFrameOpened=false,
	tChBoxZh={
		["JLDrug"]={"回复精力",},			
		["TLDrug"]={"回复体力",},
		["SQW"]={"顺气丸"},		
		["TGSY"]={"天工·索野"},
		["XiLian"]={"洗炼"},	 	
		["RedDrug"]={"回复气血",},			
		["BlueDrug"]={"回复内力",},	
		["XYS"]={"跑步速度"},		
		["FYW"]={"游泳速度",},				
		["DaQi"]={"·战"},		
		["YanXi"]={"宴"},		
		["xymsTank"]={"体质","仇恨","威胁","武伤"},
		["xymsNai"]={"根骨","疗伤","内会","内会效","内功会","治疗"},
		["xymsTL"]={"元气","外会效","外功会","内伤"},
		["xymsLD"]={"力道","外会效","外功会","外伤","外功破"},		--力道外功（丐帮，傲血，鲸鱼			--外伤，内伤是武器！。。。这是30min的。
		["xymsSF"]={"身法","外会效","外功会","外伤","外功破"},		 
		["xymsYQ"]={"元气","内会效","内功会","内伤","内功破"},		 
		["xymsGG"]={"根骨","内会效","内功会","内伤","内功破"},		--根骨内功（气纯，冰心，毒经
		["WXSJin"]={"·金（八"},	
		["WXSMu"]={"·木（八"},		
		["WXSShui"]={"·水（八"},		
		["WXSHuo"]={"·火（八"},		
		["WXSTu"]={"·土（八"},			
		["CuiLianBest"]={"炼·霸体","炼·回春","炼·血魂","炼·无双","炼·真刚","炼·真元","炼·灵根","炼·瞬影"},		--炼·
		["CuiLianStone"]={"萤石·",},		-- 萤石·  萤石 &碎片 已经包含在 洗练desc中了
		["CuiLianWeapon"]={"九天兵鉴"},			
		["fmJiaSu"]={"加速"},
		["fmWuShuang"]={"无双等级提高130"},  --暂时区分淬炼 冲突
		["fmHuiLan"]={"内力恢复"},		
		["fmNeiFang"]={"内防"},		--内功防御	
		["fmWaiFang"]={"外防"},		--外功防御	
		["fmWeiXie"]={"仇恨","威胁"},	
		["fmChaiZhao"]={"拆值","拆招"},	
		["fmShanBi"]={"闪避"},	
		["fmZhaoJia"]={"招架"},	
		["fmWGMingZhong"]={"外功命中"},	
		["fmWGPoFang"]={"外破"},		--外功破防
		["fmWGHuiXin"]={"外功会心等级"},	
		["fmWGHuiXiao"]={"外功会心效果"},	
		["fmNGMingZhong"]={"内功命中"},	
		["fmNGPoFang"]={"内破"},		--内功破防
		["fmNGHuiXin"]={"内功会心等级"},	
		["fmNGHuiXiao"]={"内功会心效果"},	
		["fmLiaoShang"]={"疗伤","治疗成效"},	
		["fmYuJin"]={"御劲"},	
		["fmHuaJin"]={"化劲"},	
		["fmWQLongXue"]={"龙血"},		--内功破防
		["fmWQNeiShang"]={"武器内功攻击"},		--内伤
		["fmWQWaiShang"]={"武器外功攻击"},		--外伤
		},
	tPartZh={
		["Cloth"]="上衣",
		["Waist"]="腰带",	
		["Hat"]="帽子",	
		["Foot"]="鞋子",
		["Hand"]="护腕",
		["Trou"]="下装",
		["Weapon"]="武器",
		},
	tChBoxBState={
		["CheckBox_JLDrug"]=true,
		["CheckBox_TLDrug"]=false,
		["CheckBox_SQW"]=true,	
		["CheckBox_TGSY"]=true,	
		["CheckBox_XiLian"]=false,				
		["CheckBox_RedDrug"]=true,		 
		["CheckBox_BlueDrug"]=false,	
		["CheckBox_XYS"]=true,	
		["CheckBox_FYW"]=false,
		["CheckBox_DaQi"]=false,		
		["CheckBox_YanXi"]=true,		
		["CheckBox_xymsTank"]=false,
		["CheckBox_xymsNai"]=false,
		["CheckBox_xymsTL"]=false,
		["CheckBox_xymsLD"]=false,
		["CheckBox_xymsSF"]=false,		
		["CheckBox_xymsYQ"]=false,		
		["CheckBox_xymsGG"]=false,		
		["CheckBox_WXSJin"]=false,	
		["CheckBox_WXSMu"]=false,		
		["CheckBox_WXSShui"]=false,		
		["CheckBox_WXSHuo"]=false,		
		["CheckBox_WXSTu"]=false,			
		["CheckBox_csPVE"]=true,			
		["CheckBox_csPVP"]=false,			
		["CheckBox_csTank"]=false,	
		["CheckBox_csNX"]=false,	
		["CheckBox_csNH"]=false,	
		["CheckBox_csND"]=false,	
		["CheckBox_csWG"]=false,	
		["CheckBox_csYY"]=false,	
		["CheckBox_csHY"]=false,	
		["CheckBox_csDX"]=false,	
		["CheckBox_csTL"]=false,			
		["CheckBox_CuiLianBest"]=false,		
		["CheckBox_CuiLianStone"]=false,				
		["CheckBox_CuiLianWeapon"]=false,			
	},
	tChBoxBState2={
		["CheckBox_fmJiaSu"]=false,
		["CheckBox_fmWuShuang"]=false,
		["CheckBox_fmHuiLan"]= false,
		["CheckBox_fmNeiFang"]= false,			
		["CheckBox_fmWaiFang"]= false,		
		["CheckBox_fmWeiXie"]= true,	
		["CheckBox_fmChaiZhao"]= false,
		["CheckBox_fmShanBi"]= false,
		["CheckBox_fmZhaoJia"]= false,
		["CheckBox_fmWGMingZhong"]= true,	
		["CheckBox_fmWGPoFang"]= false,	
		["CheckBox_fmWGHuiXin"]= true,	
		["CheckBox_fmWGHuiXiao"]= true,	
		["CheckBox_fmNGMingZhong"]= true,	
		["CheckBox_fmNGPoFang"]= false,		
		["CheckBox_fmNGHuiXin"]= true,	
		["CheckBox_fmNGHuiXiao"]= true,	
		["CheckBox_fmLiaoShang"]= false,
		["CheckBox_fmYuJin"]= false,
		["CheckBox_fmHuaJin"]= false,
		["CheckBox_fmWQLongXue"]=true,	 	
		["CheckBox_fmWQNeiShang"]=false, 		
		["CheckBox_fmWQWaiShang"]=false,	
		["CheckBox_fmPartCloth"]=true,			
		["CheckBox_fmPartWaist"]=true,	
		["CheckBox_fmPartHat"]=true,	
		["CheckBox_fmPartFoot"]=true,	
		["CheckBox_fmPartHand"]=true,	
		["CheckBox_fmPartTrou"]=true,	
		["CheckBox_fmPartWeapon"]=true,			
	},
	tChBoxPaPa={												
		["CheckBox_JLDrug"]="CheckBox_Usual", 
		["CheckBox_TLDrug"]="CheckBox_Usual",	
		["CheckBox_SQW"]="CheckBox_Usual",	
		["CheckBox_TGSY"]="CheckBox_Usual",	
		["CheckBox_XiLian"]="CheckBox_Usual",		
		["CheckBox_RedDrug"]="CheckBox_FuBen",	
		["CheckBox_BlueDrug"]="CheckBox_FuBen",
		["CheckBox_XYS"]="CheckBox_FuBen",		
		["CheckBox_FYW"]="CheckBox_FuBen",
		["CheckBox_YanXi"]="CheckBox_FuBen",
		["CheckBox_DaQi"]="CheckBox_FuBen",			--其实 包括pvp大旗
		["CheckBox_WXSJin"]="CheckBox_WXSGrp",	
		["CheckBox_WXSMu"]="CheckBox_WXSGrp",		
		["CheckBox_WXSShui"]="CheckBox_WXSGrp",			
		["CheckBox_WXSHuo"]="CheckBox_WXSGrp",			
		["CheckBox_WXSTu"]="CheckBox_WXSGrp",		 
		["CheckBox_CuiLianBest"]="CheckBox_CuiLianGrp",	 
		["CheckBox_CuiLianStone"]="CheckBox_CuiLianGrp",	 
		["CheckBox_CuiLianWeapon"]="CheckBox_CuiLianGrp",				
	},
	tChBoxTip={
		["JLDrug"]="恢复精力",		
		["TLDrug"]="恢复体力",		
		["SQW"]="消除怨念",
		["TGSY"]="生活技能神器",
		["XiLian"]="洗炼回炼材料",	
		["RedDrug"]="回血",		 
		["BlueDrug"]="回蓝",		 
		["XYS"]="跑步速度",	 
		["FYW"]="游泳速度",			
		["DaQi"]="帮会爆发大旗",		
		["YanXi"]="宴席",		
		["xymsTank"]="铁牢/洗髓/焚影/铁骨",
		["xymsNai"]="云裳/离经/补天",
		["xymsTL"]="天罗",
		["xymsLD"]="丐帮/傲血/鲸鱼",		 
		["xymsSF"]="藏剑/剑纯/分山",		 
		["xymsYQ"]="花间/焚影/易筋",		 
		["xymsGG"]="气纯/冰心/毒经",		 
		["csTank"]="铁牢,洗髓,焚影,铁骨",
		["csNX"]="奶秀",
		["csNH"]="奶花",
		["csND"]="奶毒",
		["csWG"]="傲血/惊羽/丐帮/藏剑/太虚/分山",		
		["csYY"]="冰心/易筋/焚影",	
		["csHY"]="花间/紫霞",
		["csDX"]="毒经",
		["csTL"]="天罗",			
		["ProtectLast"]="勾选则临时保护背包\n最后5格,不会售出",
		["SellEquip"]="勾选则自动售出紫装\n不勾选可以保护紫装",
		["IsOn"]="勾选此项，打开商店时\n才会自动售卖",	 
		["CuiLianBest"]="霸体、回春、血魂、无双\n真刚、真元、灵根、瞬影",	 
		["CuiLianStone"]="萤石碧墨赤",	 --中间产物			
		["CuiLianWeapon"]="九天兵鉴",			
	},
	tchBoxChild={
		["CheckBox_Usual"]={"CheckBox_JLDrug","CheckBox_TLDrug","CheckBox_SQW","CheckBox_TGSY","CheckBox_XiLian"},
		["CheckBox_FuBen"]={"CheckBox_RedDrug","CheckBox_BlueDrug","CheckBox_XYS","CheckBox_FYW","CheckBox_YanXi","CheckBox_DaQi",},	
		["CheckBox_WXSGrp"]={"CheckBox_WXSJin","CheckBox_WXSMu","CheckBox_WXSShui","CheckBox_WXSHuo","CheckBox_WXSTu",},		
		["CheckBox_fmTextPart"]={"CheckBox_fmPartCloth","CheckBox_fmPartWaist","CheckBox_fmPartHat","CheckBox_fmPartFoot","CheckBox_fmPartHand","CheckBox_fmPartTrou","CheckBox_fmPartWeapon",},		--好违和
		["CheckBox_CuiLianGrp"]={"CheckBox_CuiLianBest","CheckBox_CuiLianStone","CheckBox_CuiLianWeapon",},	
	},	
	tCSPVE={
		["csTank"]={33660,33600},		  
		["csNX"]={33312},
		["csNH"]={33294},
		["csND"]={33330},
		["csWG"]={30432,30444},
		["csYY"]={34872,34860},
		["csHY"]={31692,31704},
		["csDX"]={31794,31782,31800,31812},
		["csTL"]={34464,34452,34416,34386},
	},
	tCSPVP={
		["csNX"]={33324},
		["csNH"]={33306},
		["csND"]={33342},
		["csWG"]={30462,30474},
		["csYY"]={34890,34884},
		["csHY"]={31716,31722},
		["csDX"]={31818,31824},
		["csTL"]={34452},
	},
}

  
DrugEq.tDescData = {}
RegisterCustomData("DrugEq.tChBoxBState")
RegisterCustomData("DrugEq.tChBoxBState2")


function DrugEq.OnFrameCreate()
	this:RegisterEvent("SYS_MSG")

	local page = this:Lookup("PageSet_Main")
	page:Lookup("CheckBox_Drug"):Lookup("", ""):Lookup("Text_DrugCapital"):SetText("刷药配装")
	page:Lookup("CheckBox_Equip"):Lookup("", ""):Lookup("Text_EquipCapital"):SetText("附魔")

	local page = this:Lookup("PageSet_Main/Page_Drug")
	local handle = page:Lookup("", "")

	local page = this:Lookup("PageSet_Main/Page_Equip")
	local handle = page:Lookup("", "")
	--DrugEq.UpdateUserData()
	--InitFrameAutoPosInfo(this, 1, nil, nil, function() DrugEq._OpenWindow() end)
end


function DrugEq.OnLButtonClick()
	local szName = this:GetName()
	local frame = Station.Lookup("Normal/DrugEq")
	local frame1=frame:Lookup("PageSet_Main/Page_Drug")
	local frame2=frame:Lookup("PageSet_Main/Page_Equip")	
	if szName == "Button_Close" then
		if not frame then	return	end
		frame:Hide() 
		DrugEq.bFrameOpened = false
		DrugEq.ResetBag()	DrugEq.SetOff()	
	end
	if szName == "Button_DrugUnAll" then	 
		for szBtnName,_ in pairs(DrugEq.tChBoxBState) do   
			frame1:Lookup(szBtnName):Check(false)
		end
	end
	if szName == "Button_EquipUnAll" then
		for szBtnName,_ in pairs(DrugEq.tChBoxBState2) do	
			frame2:Lookup(szBtnName):Check(false)
		end
	end
end

 function DrugEq.OnMouseEnter()		
	local szName = this:GetName()
	local szType = this:GetType()	
	if szType == "WndCheckBox"   then  
		szAbbr=string.gsub(szName,"CheckBox_","")
		tips=DrugEq.tChBoxTip[szAbbr] 
		if tips then DrugEq.ShowTip(tips) end
	end
end

function DrugEq.OnMouseLeave()
	local szName = this:GetName()
	local szType = this:GetType()
	HideTip()
end

--[=[BAG_ITEM_UPDATE]=]


local _FILE = {
	Enchant = {
		Path = string.format("Interface\\TF\\DrugEq\\Desc.tab"), 
		Title = {
			{f = "s", t = "szName"},
			{f = "s", t = "szDesc"},
		},
	},
	}
	
	local tTable = KG_Table.Load(_FILE.Enchant.Path, _FILE.Enchant.Title, FILE_OPEN_MODE.NORMAL)
	if tTable then
		local nRow = tTable:GetRowCount()
		for i = 1, nRow do
			local tRow = tTable:GetRow(i)
			if not DrugEq.tDescData[tRow.szName] then
				DrugEq.tDescData[tRow.szName] = tRow.szDesc
			end
		end
	end
	
	
function DrugEq.ItemType(nGenre,nSub,szDes,szName)		
	--nGenre   1 药品 or 14食品	  --nSub 1 回复类（des）   2辅助类 3增强类  4特殊药品（逍遥buff 飞鱼des） 6 宴席(des）      
	if  (nGenre==1 or nGenre==14) and (nSub==2 or nSub==3) then return "4小药" 
		elseif nGenre==10 then return "五行石"				-- nSub 0金 1木 2水 3火 4土   --nDetail  6 7 8级
		elseif nGenre==11 then return "五彩石"
	end
	if nGenre==7 then return "90附魔" end
	if nGenre==3 and nSub==0 and string.find(szDes,"<ENCHANT") then return "80附魔" end
	if nGenre==3 and nSub==5 then return "秘籍" end
	return "other"		--未覆盖。。
end

function DrugEq.IsXiaoyao(nGenre,nSub)		
	if (nGenre==1 or nGenre==14) and (nSub==2 or nSub==3) then return true
	else return false
	end
end

function DrugEq.Is30MoShi(szName)			
	if string.find(szName,"·熔锭") then return true
	else return false
	end
end

function DrugEq.IsMoShi(szName)			--pve 80龙血 80仇恨 90疗伤  uiid筛选
	if string.find(szName,"磨石") then return true
	else return false
	end
end

function DrugEq.Is90FuMo(szName)
	local strGr={"·锻","·铸","·纹","·染","·绣","·印",}
	for i=1,#strGr do
		if string.find(szName,strGr[i]) then return true end
	end
	return false
end

function DrugEq.Is80FuMo(szName)
	local strGr={"绣（","染（","甲片（",}
	for i=1,#strGr do
		if string.find(szName,strGr[i]) then return true end
	end
	return false
end

function DrugEq.IsFuMo(szName)
	if DrugEq.Is90FuMo(szName) or DrugEq.Is80FuMo(szName) or DrugEq.IsMoShi(szName) then return true 
	else return false 
	end	
end	
	
	
function	DrugEq.ResetBag()
player=GetClientPlayer()
	for i = 1, 5 do	 			 
		local dwBox = INVENTORY_INDEX.PACKAGE + i - 1
		local dwSize = player.GetBoxSize(dwBox) 	  
		for dwX = 0, dwSize-1, 1 do
			box=GetUIItemBox(dwBox, dwX,true)	 
			box:SetAlpha(255)
		end
    end
end

function	DrugEq.SetAllDark()
		player=GetClientPlayer()
		for i = 1, 5 do	 			 
		local dwBox = INVENTORY_INDEX.PACKAGE + i - 1
		local dwSize = player.GetBoxSize(dwBox) 	  
		for dwX = 0, dwSize-1, 1 do
			local item = GetPlayerItem(player, dwBox, dwX)
			if dwX==5 and DrugEq.ProtectLast==true and dwX>dwSize-6 then  
			elseif item and item.bCanTrade==true then 
				if  (DrugEq.SellEquip and  item.nGenre == ITEM_GENRE.EQUIPMENT  and item.nQuality==4 ) or item.nGenre ~= ITEM_GENRE.EQUIPMENT or (string.find(item.szName,"破损的") and item.nSub==1  and item.nGenre==ITEM_GENRE.EQUIPMENT) then 		 
					box=GetUIItemBox(dwBox, dwX, true)	 
					box:SetAlpha(30)
				end
			end
	  end
    end
end


 function	DrugEq.SetLastCheck(frame)
 	local tCh={}
	local noPaPa=0
	if frame:GetName()=="Page_Drug" then 
		tCh=DrugEq.tChBoxBState
	elseif frame:GetName()=="Page_Equip"  then
		tCh=DrugEq.tChBoxBState2
		noPaPa=1
	end
	for szName,state in pairs(tCh) do	 
		if state==true then		 
			chb=frame:Lookup(szName) 	 
			chb:Check(false)	
			chb:Check(true)    
		end
	end
	if noPaPa==1 then return end
 end
 
 
function DrugEq.ReSetConflictData(szConflictArea)				
	for szName,state in pairs(DrugEq.tChBoxBState) do
		szName=string.gsub(szName,"CheckBox_","")
		if string.find(szName,szConflictArea) then  
			if state==true then
				--Output(szName)
				DrugEq.SetAbc(szName) 
			end
		end
	end
end
 

function  DrugEq.ReSetEquip()
	player=GetClientPlayer()
	for i = 1, 5 do	 			 
		local dwBox = INVENTORY_INDEX.PACKAGE + i - 1
		local dwSize = player.GetBoxSize(dwBox) 	  
		for dwX = 0, dwSize-1, 1 do
			local item = GetPlayerItem(player, dwBox, dwX)
			if item and item.nGenre == ITEM_GENRE.EQUIPMENT	and item.nQuality==4 then  
				box=GetUIItemBox(dwBox, dwX, true)	 
				if DrugEq.SellEquip==false then
					box:SetAlpha(255)
				elseif not( dwBox==5 and  DrugEq.ProtectLast==true  and dwX>dwSize-6 ) then
					box:SetAlpha(30)
				end
			end
		end
	end
end

function  DrugEq.ReSetLast5()
	player=GetClientPlayer()
	local dwBox = INVENTORY_INDEX.PACKAGE + 5 - 1
	local dwSize = player.GetBoxSize(dwBox) 	  
	for dwX =dwSize-5,  dwSize-1, 1 do
		box=GetUIItemBox(dwBox, dwX, true)	 
		box:SetAlpha(255)
	end
end

function  DrugEq.ReSetLast5Sell()	
	local frame = Station.Lookup("Normal/DrugEq")
	local frame1=frame:Lookup("PageSet_Main/Page_Drug")  		
	local frame2=frame:Lookup("PageSet_Main/Page_Equip")  	
	if frame1 and frame1:IsVisible() then frame=frame1	 
	elseif frame2 and frame2:IsVisible() then frame=frame2   
	end
	_JT.Alert("需重新点一下另一个配置页面", function() end, "OK")  
	DrugEq.SetAllDark()
	DrugEq.SetLastCheck(frame)
end

function	DrugEq.SetAbc(szAbbr)			
	if type(szAbbr)=="table" then	 
		tMubiao=szAbbr
	else	 
		tMubiao=DrugEq.tChBoxZh[szAbbr]	 
	end
	player=GetClientPlayer()
	for i = 1, 5 do	 			 
		local dwBox = INVENTORY_INDEX.PACKAGE + i - 1
		local dwSize = player.GetBoxSize(dwBox) 	  
		for dwX = 0, dwSize-1, 1 do
			local	item = GetPlayerItem(player, dwBox, dwX)			
			if item then		
					box=GetUIItemBox(dwBox, dwX,true)	 
					if box:GetAlpha()==30 then			
						szDes=DrugEq.tDescData[item.szName]
						szDes=szDes or Table_GetItemDesc(item.nUiId)				
						for i=1,#tMubiao do
						if	(type(tMubiao[i]))=="number"  then	 
							if item.nUiId==tMubiao[i] then box:SetAlpha(255) end
						elseif string.find(item.szName,tMubiao[i]) or string.find(szDes,tMubiao[i]) then
								if  string.find(szAbbr,"xyms") then 		
									if DrugEq.IsXiaoyao(item.nGenre,item.nSub) or DrugEq.Is30MoShi(item.szName) then
										box:SetAlpha(255)
									end
								else
									box:SetAlpha(255)
								end
							end
						end
					end
			end
		end
	end
end

function	DrugEq.SetUnAbc(szAbbr)
 if type(szAbbr)=="table" then	 
		tMubiao=szAbbr
	else	 
		tMubiao=DrugEq.tChBoxZh[szAbbr]	 
	end	
	player=GetClientPlayer() 	
	for i = 1, 5 do	 			 
		local dwBox = INVENTORY_INDEX.PACKAGE + i - 1
		local dwSize = player.GetBoxSize(dwBox) 	  
		for dwX = 0, dwSize-1, 1 do    
			local	item = GetPlayerItem(player, dwBox, dwX)		 
			if not item then 
			else  
				if  (DrugEq.SellEquip and  item.nGenre == ITEM_GENRE.EQUIPMENT  and item.nQuality==4 ) or item.nGenre ~= ITEM_GENRE.EQUIPMENT  then		-- or (item.nGenre==ITEM_GENRE.EQUIPMENT and item.nQuality~=4) then 		 
					box=GetUIItemBox(dwBox, dwX,true)	 
					if dwBox==5 and  DrugEq.ProtectLast==true  and dwX>dwSize-6  then  
					elseif box:GetAlpha()==255 then          
						szDes=DrugEq.tDescData[item.szName]
						szDes=szDes or Table_GetItemDesc(item.nUiId)				
						for i=1,#tMubiao do		 
						if	(type(tMubiao[i]))=="number"  then	 
							if item.nUiId==tMubiao[i] then box:SetAlpha(30) end
						elseif string.find(item.szName,tMubiao[i]) or string.find(szDes,tMubiao[i]) then				 
								if type(szAbbr)=="string" and string.find(szAbbr,"xyms") then 		
									if DrugEq.IsXiaoyao(item.nGenre,item.nSub) or DrugEq.Is30MoShi(item.szName) then
										box:SetAlpha(30)
									end
								else 	 
									if not DrugEq.IsXiaoyao(item.nGenre,item.nSub) and not DrugEq.Is30MoShi(item.szName) and item.nGenre ~=11   then		
										box:SetAlpha(30)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function DrugEq.ReSetCS(szName)
	local szAbbr=string.gsub(szName,"CheckBox_","") 
	local tMubiao={}		
	for szCSSchool,state in pairs(DrugEq.tChBoxBState)  do	
		if string.find(szCSSchool,"CheckBox_cs") and not string.find(szCSSchool,"CheckBox_csPV")  then
			if state==true then 
				szAbbr2= string.gsub(szCSSchool,"CheckBox_","")  
				if DrugEq.tChBoxBState["CheckBox_csPVE"] then  
					for i =1 , #DrugEq.tCSPVE[szAbbr2] do 	
						table.insert(tMubiao,DrugEq.tCSPVE[szAbbr2][i])		
					end
				end	
				if DrugEq.tChBoxBState["CheckBox_csPVP"] then
					for i =1 , #DrugEq.tCSPVP[szAbbr2] do
						table.insert(tMubiao,DrugEq.tCSPVP[szAbbr2][i])
					end
				end   
			end
		end
	end
	DrugEq.SetAbc(tMubiao)   
 end
	
 function DrugEq.UnSetCS(szName)
	local szAbbr=string.gsub(szName,"CheckBox_","") 
	local tMubiao={}		 		
	if  szAbbr=="csPVE" or szAbbr=="csPVP" then
		for szCSSchool,state in pairs(DrugEq.tChBoxBState)  do	
			if string.find(szCSSchool,"CheckBox_cs") and not string.find(szCSSchool,"CheckBox_csPV")  then
				if state==true then 
					szAbbr2= string.gsub(szCSSchool,"CheckBox_","")  
					if szAbbr=="csPVE" then  
						for i =1 , #DrugEq.tCSPVE[szAbbr2] do 	
							table.insert(tMubiao,DrugEq.tCSPVE[szAbbr2][i])		
						end
					elseif szAbbr=="csPVP" then
						for i =1 , #DrugEq.tCSPVP[szAbbr2] do
							table.insert(tMubiao,DrugEq.tCSPVP[szAbbr2][i])
						end
					end   
				end
			end
		end
	else	
		if DrugEq.tChBoxBState["CheckBox_csPVE"] then
			for i =1 , #DrugEq.tCSPVE[szAbbr] do 	
				table.insert(tMubiao,DrugEq.tCSPVE[szAbbr][i])		
			end
		end	
		if  DrugEq.tChBoxBState["CheckBox_csPVP"] then 
			for i =1 , #DrugEq.tCSPVP[szAbbr] do 	
				table.insert(tMubiao,DrugEq.tCSPVP[szAbbr][i])		
			end
		end
	end
	DrugEq.SetUnAbc(tMubiao)   
 end
 

 function DrugEq.IsMoneyFull()
	local player=GetClientPlayer()
	nGold=player.GetMoney()["nGold"]
	if nGold>700000 then  
		_JT.Alert("金钱达到80W上限时，会出售失败。\n建议邮寄或买玄龙石等", function() end, "Yes")  
	else
		_JT.Alert("自动售卖开启：\n售卖时需保证此配置页面打开，否则会失效\n售卖时可能会卡帧，请耐心等待", function() end, "Yes")  
	end
 end
 
 
 function DrugEq.ReSetFM(szName)
	local szAbbr=string.gsub(szName,"CheckBox_","") 
	local tMubiao={}	
	local tPart={}
	for szPart,state in pairs(DrugEq.tChBoxBState2)  do	 
		if  string.find(szPart,"CheckBox_fmPart") and state==true then 
		szPartAbbr=string.gsub(szPart,"CheckBox_fmPart","")
		table.insert(tPart,DrugEq.tPartZh[szPartAbbr])
		end
	end 
	for szFMsx,state in pairs(DrugEq.tChBoxBState2)  do	
		if string.find(szFMsx,"CheckBox_fm") and not string.find(szFMsx,"CheckBox_fmPart")  then
			if state==true then 
				szAbbr2= string.gsub(szFMsx,"CheckBox_","")  
				for j=1 , #DrugEq.tChBoxZh[szAbbr2] do 	
					table.insert(tMubiao,DrugEq.tChBoxZh[szAbbr2][j])		
				end
			end
		end
	end 
	DrugEq.SetAbcFM(tMubiao,tPart)   
 end
 
 function	DrugEq.SetAbcFM(tMubiao,tPart)			
	player=GetClientPlayer()
	for i = 1, 5 do	 			 
		local dwBox = INVENTORY_INDEX.PACKAGE + i - 1
		local dwSize = player.GetBoxSize(dwBox) 	  
		for dwX = 0, dwSize-1, 1 do
			local	item = GetPlayerItem(player, dwBox, dwX)			
			if item then		
				box=GetUIItemBox(dwBox, dwX,true)	 
				if box:GetAlpha()==30 then			
					szDes=DrugEq.tDescData[item.szName]
					szDes=szDes or Table_GetItemDesc(item.nUiId)			
					for i=1,#tMubiao do
						if string.find(item.szName,tMubiao[i]) or string.find(szDes,tMubiao[i]) then
							for j=1,#tPart do
								if string.find(szDes,tPart[j]) then 
									box:SetAlpha(255) break
								end
							end
						end
					end
				end
			end
		end
	end
end
 
  function DrugEq.UnSetFM(szName)
 	local szAbbr=string.gsub(szName,"CheckBox_","") 
	local tMubiao={}		 		
	local tPart={}
	if string.find(szName,"CheckBox_fmPart") then
		szPart=DrugEq.tPartZh[string.gsub(szName,"CheckBox_fmPart","")]
		table.insert(tPart,szPart)
		DrugEq.SetUnAbc(tPart)
	else	
		for j=1 , #DrugEq.tChBoxZh[szAbbr] do 	
			table.insert(tMubiao,DrugEq.tChBoxZh[szAbbr][j])		
		end
	DrugEq.SetUnAbc(tMubiao) 
	end   
 end
 


 
function DrugEq.OnCheckBoxCheck()
	local frame = Station.Lookup("Normal/DrugEq")
	local frame1=frame:Lookup("PageSet_Main/Page_Drug")
	local frame2=frame:Lookup("PageSet_Main/Page_Equip")
	local szName = this:GetName()

	if szName =="CheckBox_Drug"  and frame2:IsVisible() then DrugEq.SetLastCheck(frame1) return
	elseif  szName =="CheckBox_Equip"  and frame1:IsVisible() then DrugEq.SetLastCheck(frame2) return
	end
	
	if szName == "CheckBox_IsOn"  then	DrugEq.IsOn = true	DrugEq.IsMoneyFull()	return
	elseif  szName == "CheckBox_SellEquip"  then	DrugEq.SellEquip= true DrugEq.ReSetEquip() return		--SetLastCheck不如重写一个，遍历equip 
	elseif  szName == "CheckBox_ProtectLast"  then	DrugEq.ProtectLast= true DrugEq.ReSetLast5() return
	elseif string.find(szName,"CheckBox_cs") then DrugEq.tChBoxBState[szName]=true DrugEq.ReSetCS(szName) return  
	elseif string.find(szName,"CheckBox_fm") and szName~="CheckBox_fmTextPart" then DrugEq.tChBoxBState2[szName]=true  DrugEq.ReSetFM(szName) return  
	end
	
	if szName == "CheckBox_fmTextPart" then  
		tHisChild=DrugEq.tchBoxChild[szName] 
		for i = 1,#tHisChild do	 
			Station.Lookup("Normal/DrugEq/PageSet_Main/Page_Equip"):Lookup(tHisChild[i]):Check(true)		 
		end
		return
	end

	local	dxFlag=false
	for szDanXiang,_ in pairs(DrugEq.tChBoxBState) do  	
		if szDanXiang==szName then 
			DrugEq.tChBoxBState[szDanXiang]=true
			szAbbr=string.gsub(szDanXiang,"CheckBox_","")
			--Output(szAbbr)
			DrugEq.SetAbc(szAbbr)									
			dxFlag=true
			break
		end
	end
 
	if dxFlag==true then
		hisPaPa=DrugEq.tChBoxPaPa[szName]				
		tHisChild=DrugEq.tchBoxChild[hisPaPa] 
		local isOneFalse=0
		for i = 1,#tHisChild do	 
			if DrugEq.tChBoxBState[tHisChild[i]] == false then isOneFalse=1 break end 
		end		
		if isOneFalse==0 then 	
			Station.Lookup("Normal/DrugEq"):Lookup("PageSet_Main/Page_Drug"):Lookup(hisPaPa):Check(true)
		end
	else		
		tHisChild=DrugEq.tchBoxChild[szName]
		for i = 1,#tHisChild do	 
			Station.Lookup("Normal/DrugEq/PageSet_Main/Page_Drug"):Lookup(tHisChild[i]):Check(true)		 
		end	
	end
end

 

function DrugEq.OnCheckBoxUncheck()					 
	local szName = this:GetName()
	if szName == "CheckBox_IsOn"  then	DrugEq.IsOn = false	return 
	elseif  szName == "CheckBox_SellEquip"  then	DrugEq.SellEquip= false  DrugEq.ReSetEquip()	return	
	elseif  szName == "CheckBox_ProtectLast"  then	DrugEq.ProtectLast= false DrugEq.ReSetLast5Sell() return	
	elseif string.find(szName,"CheckBox_cs") then  DrugEq.tChBoxBState[szName]=false  DrugEq.UnSetCS(szName)  return  
	elseif string.find(szName,"CheckBox_fm") and szName~="CheckBox_fmTextPart" then DrugEq.tChBoxBState2[szName]=false DrugEq.UnSetFM(szName) return 
	end
	
	if szName == "CheckBox_fmTextPart" then   
		tHisChild=DrugEq.tchBoxChild[szName]
		for i = 1,#tHisChild do	 
			Station.Lookup("Normal/DrugEq/PageSet_Main/Page_Equip"):Lookup(tHisChild[i]):Check(false)		 
		end
		return
	end
	
	local	dxFlag=false
	for szDanXiang,_ in pairs(DrugEq.tChBoxBState) do  	 
		if szDanXiang==szName then 
			DrugEq.tChBoxBState[szDanXiang]=false
			szAbbr=string.gsub(szDanXiang,"CheckBox_","")
			DrugEq.SetUnAbc(szAbbr)										 		
			if string.find(szAbbr,"xyms")	then 	 
				DrugEq.ReSetConflictData("xyms")	 
				return  
			elseif string.find(szAbbr,"cs") then
				DrugEq.ReSetConflictData("cs")	 
				return			
			end
			dxFlag=true
			break
		end
	end
 
	if dxFlag==true then
		hisPaPa=DrugEq.tChBoxPaPa[szName]					 
		tHisChild=DrugEq.tchBoxChild[hisPaPa] 
		local isOneTrue=0
		for i = 1,#tHisChild do	 
			if DrugEq.tChBoxBState[tHisChild[i]] == true then isOneTrue=1 break end 	 
		end		
		if isOneTrue==0 then 	
			Station.Lookup("Normal/DrugEq/PageSet_Main/Page_Drug"):Lookup(hisPaPa):Check(false)
		end
	else			 
		tHisChild=DrugEq.tchBoxChild[szName]					 
		for i = 1,#tHisChild do	 
			Station.Lookup("Normal/DrugEq/PageSet_Main/Page_Drug"):Lookup(tHisChild[i]):Check(false)		 
		end	
	end
end
 
  
DEBreathe={}
function DEBreathe.OnFrameBreathe()
	if GetLogicFrameCount() % 4 == 0  then
		DrugEq.AddEnterButton() 	
	end
end
Wnd.OpenWindow("Interface\\TF\\DrugEq\\breathe.ini","DEBreathe")

 
  
function DrugEq.OnOpenShop()
	local nNpcID, nShopID = arg4, arg0
	DrugEq.SellItemBy(nNpcID, nShopID)
end

 
function DrugEq.SellItemBy(nNpcID, nShopID)
	local player = GetClientPlayer()
	if DrugEq.IsOn==false then	return	end
 	for i = 1, 5 do	 			 
		local dwBox = INVENTORY_INDEX.PACKAGE + i - 1
		local dwSize = player.GetBoxSize(dwBox) 	  
		for dwX = 0, dwSize-1, 1 do
			local	item = GetPlayerItem(player, dwBox, dwX)			
			if item then	 
				box=GetUIItemBox(dwBox, dwX,true)	 
				if box:GetAlpha()==30 then 
					local nCount = 1
					if item.bCanStack then 	nCount = item.nStackNum  	end
					SellItem(nNpcID, nShopID, dwBox, dwX, nCount)
				end
			end
		end
	end  
end

 RegisterEvent("SHOP_OPENSHOP", DrugEq.OnOpenShop)

 function DrugEq.SetOff()			--为了防止人间悲剧
	Station.Lookup("Normal/DrugEq"):Lookup("CheckBox_IsOn"):Check(false)
 end
 
function DrugEq._OpenWindow()
	local frame = Station.Lookup("Normal/DrugEq") 
	if  frame:IsVisible() then 
		frame:Hide() DrugEq.bFrameOpened = false
		DrugEq.ResetBag()
		DrugEq.SetOff() 
	else	
		frame:Show() DrugEq.bFrameOpened = true
		DrugEq.SetAllDark()				
		local frame1=frame:Lookup("PageSet_Main/Page_Drug")
		local frame2=frame:Lookup("PageSet_Main/Page_Equip")
		if frame1:IsVisible() then
			DrugEq.SetLastCheck(frame1) 
		elseif frame2:IsVisible() then 
			DrugEq.SetLastCheck(frame2)
		end
		if DrugEq.ProtectLast==true then DrugEq.ReSetLast5() end
	end
end

Wnd.OpenWindow("Interface\\TF\\DrugEq\\DrugEq.ini","DrugEq"):Hide()
DrugEq.bFrameOpened=false

 DrugEq.OnFrameKeyDown = function()
	if GetKeyName(Station.GetMessageKey()) == "Esc" then
		DrugEq._OpenWindow()
		return 1
	end
	return 0
end
 
function DrugEq.ShowTip(str,fontscheme)		 
	local nX, nY = this:GetAbsPos()
	local nW, nH = this:GetSize()
	fontscheme=fontscheme or 101 	 
	str=GetFormatText(str, fontscheme) 
	OutputTip(str, 400, {nX, nY, nW, nH})
end

function DrugEq.ShowTip2(str)		 
	local nX, nY = this:GetAbsPos()
	local nW, nH = this:GetSize()
	OutputTip(str, 400, {nX, nY, nW, nH})
end


function DrugEq.AddEnterButton()  
	local f = Station.Lookup("Normal/BigBagPanel")
	if f and f:IsVisible() then
		local x=10
		local y=345
		local btn=f:Lookup("Btn_OpenDE")
		if not btn then  
			local szFile="Interface\\TF\\DrugEq\\btn.ini"
			local fx=Wnd.OpenWindow(szFile,"DrugEq_Temp")
			if fx then
				fx:Show()
				fx:BringToTop()		 
				local itm=fx:Lookup("WndButton")
				if itm then
					itm:ChangeRelation(f,true,true)  
					itm:SetName("Btn_OpenDE")
					itm:SetRelPos(x,y)				 
					itm.nX=x
					itm.nY=y
					itm.OnMouseLeave=function() HideTip() end
					tip=GetFormatText("刷药配装助手\n", 101) .. GetFormatText("打开设置面板", 106)
					itm.OnMouseEnter=function() DrugEq.ShowTip2(tip) end 
					itm.OnLButtonClick=function()  DrugEq._OpenWindow() end	 
				end
			end
			Wnd.CloseWindow(fx)
		end
	end
end

 

 Player_AppendAddonMenu({ function()
	return {{
		szOption ="刷药配装助手面板", bCheck = true,
		bChecked = DrugEq.bFrameOpened,
		fnAction = DrugEq._OpenWindow
	}}
end })
 
 TraceButton_AppendAddonMenu({ function()
	return {{
		szOption ="刷药配装助手面板", bCheck = true,
		bChecked = DrugEq.bFrameOpened,
		fnAction = DrugEq._OpenWindow
	}}
end })
 
function  DrugEq.RegAddonModInfo()
	local tDataDrugEq={
		szName = "DrugEq",									 
		szTitle = "刷药配装",									 
		dwIcon = 560,												 
		szClass = "TOOL",	
		tWidget={
			{	tag = "DrugEq_OpenWnd", type = "WndButton",					 
				w = 100, h = 29, text = "打开界面",				 
				anchor = "TOPLEFT", x = 0, y = 0,				 
				callback = function()							 
					DrugEq._OpenWindow()
				end
			},
			{	tag = "DrugEq_ShuoMing", type = "WndTextBox", 					 
				w = 480, h = 28, text = "【功能说明】背包过滤。用来刷药、配装、找附魔、淬炼。",					 
				anchor = "TOPLEFT", x = 0, y = 30,				 
			},{	tag = "DrugEq_zhuyi", type = "WndTextBox", 					 
				w = 480, h = 28, text = "【使用注意】勾选需要保留的。",	 fontcolor={255,255,0},					 
				anchor = "TOPLEFT", x = 0, y = 70,				 
			},{	tag = "DrugEq_zhuyi2", type = "WndTextBox", 					 
				w = 480, h = 28, text = " 五彩石只有九天逍遥开出来的那几个，其他的不会选！",	 fontcolor={255,255,0},					 
				anchor = "TOPLEFT", x = 0, y = 110,				 
			},{	tag = "DrugEq_zhuyi3", type = "WndTextBox", 					 
				w = 480, h = 28, text = " 淬炼只包含常用的几个，其他不会选！",	 fontcolor={255,255,0},					 
				anchor = "TOPLEFT", x = 0, y =140,				 
			},{	tag = "DrugEq_zhuyi4", type = "WndTextBox", 					 
				w = 480, h = 28, text = " 附魔只包含属性最高的，如不会选提高65，只选提高130的",	 fontcolor={255,255,0},					 
				anchor = "TOPLEFT", x = 0, y = 170,				 
			},{	tag = "DrugEq_zhuyi4", type = "WndTextBox", 					 
				w = 480, h = 28, text = " 刷金的暗器囊会自动售卖。",	 fontcolor={255,255,0},					 
				anchor = "TOPLEFT", x = 0, y =210,				 
			},{	tag = "DrugEq_zhuyi4", type = "WndTextBox", 					 
				w = 480, h = 28, text = " 白/绿/蓝/橙装较少，考虑到外观收集，不会售卖。紫装可选",	 fontcolor={255,255,0},					 
				anchor = "TOPLEFT", x = 0, y = 240,				 
			},{	tag = "DrugEq_zhuyi5", type = "WndTextBox", 					 
				w = 480, h = 28, text =" 强烈建议重要物品先放仓库！",	 fontcolor={255,255,0},					 
				anchor = "TOPLEFT", x = 0, y = 280,				 
			},	
			{	tag = "DrugEq_Author", type = "WndTextBox", 					 
				w = 160, h = 28, text = "By 微雨凭阑", fontcolor={0,255,255},					 
				anchor = "TOPLEFT", x = 300, y = 330, 				 
			},
		},
	}

	CUIRegAddonModInfo(tDataDrugEq)	
end

RegisterEvent("CUSTOM_DATA_LOADED", function()						 
	if arg0 == "Role" then
		DrugEq.RegAddonModInfo()
	end
end)