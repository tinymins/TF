--2012.12.25 小徒弟圣诞礼物。添加 背包搜索 和高亮最近改变的物品
--这是一个有想法.但是能力不足的人写的小插件...如果你感觉不太好用...欢迎修改
YCBag={
IsOn=true,
Resettime=0,
bNeedCheckBankEdt=false,		--这个可以做开关
History={},
STAllF=true,STDrugF=false,STEnchF=false,
HistoryList={"洗炼","速度","精力体力","大旗宴席修理"},
XyMsTH={"T-4小药","治疗-4小药"},
XyMsDps={"天罗-4小药","力道外功（丐帮，傲血，鲸鱼","身法外功（藏剑，剑纯，分山","元气内功（花间，焚影，易筋","根骨内功（气纯，冰心，毒经",},
CSpveF=true,
CSpvpF=true,
CSTList={
	{"（铁牢,洗髓,焚影,铁骨",{33660,33600},{nil},},
},
CSHpsList={
	{"阴性（云裳",{33312},{33324},},
	{"混元（离经",{33294},{33306},},
	{"毒性（补天",{33330},{33342},},
},
CSDpsList={
	{"阴阳（冰心,易筋,焚影",{34872,34860},{34890,34884},},
	{"混元（花间,紫霞",{31692,31704},{31716,31722},},
	{"毒性（毒经",{31794,31782,31800,31812},{31818,31824},},
	{"天罗（←_←",{34464,34452,34416,34386},{34452},},
	{"外功（傲血,惊羽,丐帮,藏剑,太虚,分山",{30432,30444},{30462,30474},},
},
ColorStone={},
bSaveLastChange=false,
bLastCloseBag=0,
bNeedReSet=false,
ChangeList={},
BagIsHide=false,
BankCache={},
BagCache={}, 
HideBtn={},
tNid2Attr={										 
	[2]="移动速度",
	[36]="气血上限",
	[75]="招式产生威胁",
	[88]="御劲等级",
	[91]="化劲等级",
	[104]="命中后偷取目标所受伤害2.05%的气血",
	[117]="近战武器伤害",
	[129]="外功攻击",
	[132]="外功命中",
	[134]="外功会心",
	[138]="外功破防",
	[155]="内功攻击",
	[157]="内功会心",
	[162]="内功破防",
	[164]="内功命中",
	[257]="治疗成效",
	}
}
YCBag.ColorStone={{"T",YCBag.CSTList},{"治疗",YCBag.CSHpsList},{"输出",YCBag.CSDpsList},}
YCBag.SFType={{YCBag.STAllF,"全部"},{YCBag.STDrugF,"小药"},{YCBag.STEnchF,"附魔"},}--SearchType

RegisterCustomData("YCBag.IsOn")  
RegisterCustomData("YCBag.SFType")
RegisterCustomData("YCBag.History") 
RegisterCustomData("YCBag.bSaveLastChange") 
RegisterCustomData("YCBag.CSpveF") 
RegisterCustomData("YCBag.CSpvpF") 

function YCBag.m(str)
	OutputMessage("MSG_SYS", str .. "\n")
end

function YCBag.OnFrameCreate()
	YCBag.bNeedReSet=true
	this:RegisterEvent("UI_SCALED")
	this:RegisterEvent("ON_SET_BAG_COMPACT_MODE")
	this:RegisterEvent("BAG_ITEM_UPDATE")
	this:RegisterEvent("SYNC_ROLE_DATA_END")
	this:RegisterEvent("HELP_EVENT")
	
end

function YCBag.OnItemLButtonClick()
Output("Hello")
	local szName = this:GetName()
	Output(szName)
end

function YCBag.GetSth(box,x,id)
		local boxHand, nHandCount = Hand_Get()
		Output(boxHand,nHandCount)
		--YCBag.OnExchangeBoxItem(this, boxHand, nHandCount, true)
end

function YCBag.AddChangeList(box,x,id)
	if box and x and id then	
		YCBag.ChangeList[box.."/"..x]=GetTime()
	end
end

function YCBag.CheckChangeList()
	local nTime=GetTime()
	for k,v in pairs(YCBag.ChangeList or {}) do
		if nTime-v>30000 then
			YCBag.ChangeList[k]=nil
		end
	end
end

function YCBag.UpdateChangeItems(f)
	YCBag.CheckChangeList()
	local handle = f:Lookup("", "Handle_Bag_Compact")
	if handle then
		local hBox = handle:Lookup("Handle_Box")
		YCBag.ReSetCache()
		for i,Data in pairs(YCBag.BagCache) do
			for j,v in pairs(Data) do
				local a = handle:Lookup(v.idx)
				if a then
					local box = a:Lookup(1)
					if box then
						if YCBag.ChangeList[box.dwBox.."/"..box.dwX] then
							box.xrb=true
							box:SetObjectInUse(true)
							--鼠标进入时，清除 
							box.OnItemMouseEnter=function() YCBag.ChangeList[box.dwBox.."/"..box.dwX]=nil  end
							--box.OnItemLButtonDown=function() Output("lb downr") end
						else
							if box.xrb then
								box.xrb=false
								box:SetObjectInUse(false)
							end
						end
					end
				end
			end
		end
	end
end

function YCBag.BtnMouseMove(str)
	local nX, nY = this:GetAbsPos()
	local nW, nH = this:GetSize()
	OutputTip(str, 400, {nX, nY, nW, nH})
end

function YCBag.ReSetCache(n)
	--if n==3 then
	if YCBag.bNeedReSet then
		YCBag.bNeedReSet=false
		if GetTime()-YCBag.Resettime >300 then
			YCBag.Resettime=GetTime()
			YCBag.BagCache={}
			local player = GetClientPlayer()
			local nidx=0
			for i=1,6,1 do
				local dw1 = player.GetBoxSize(i)
				YCBag.BagCache[i]={}
				for j=0,dw1-1,1 do
					local item = GetPlayerItem(player, i,j)  
					if item then
						--YCBag.m(i.."/"..j.." "..item.szName)
						if item.bCanStack then nCount=item.nStackNum else nCount=1 end 	
						YCBag.BagCache[i][j]={szName=item.szName,dwBox=i,dwX=j,itm=item,idx=nidx,nUiId=item.nUiId,nGenre=item.nGenre,nSub=item.nSub,nCount}	
					end
					nidx=nidx+1
				end
			end
			--Output('重置：')
		end
	end
end

function YCBag.BtnClick(str) --查看远程仓库
	local f=Station.Lookup("Normal/YCBank")
	if not f then
		Wnd.OpenWindow("Interface\\TF\\BBSeek\\YCBank.ini", "YCBank")
		f=Station.Lookup("Normal/YCBank")
		f:Show()
		f:BringToTop()
		YCBank.InitBank(f)		
		YCBag.bNeedCheckBankEdt=true	 
	else
		Wnd.CloseWindow("YCBank")
	end
end

function YCBag.BtnClick2(str) --切换离线背包
end

function YCBag.AddEditHistory(str)		--添加搜索历史
	if not str or str=="" then return end
	local idx=nil
	for k,v in pairs(YCBag.History) do
		if v==str then
			idx=k 
			break
		end
	end
	if idx then table.remove(YCBag.History,idx) end
	table.insert(YCBag.History,str)
	if #YCBag.History>10 then
		table.remove(YCBag.History,1) 
	end
end

function YCBag.OnBankEditChange(f,str,bClear) --编辑框改变
	if not bClear then
		YCBag.AddEditHistory(str)
	end

	if not str or str=="" then return end		--不需要搜索
	local nfound=0

	local player = GetClientPlayer()
	local nidx=0
	for i=7,12,1 do  
		local dw1 = player.GetBoxSize(i)
		YCBag.BankCache[i]={}
		for j=0,dw1-1,1 do
			local item = GetPlayerItem(player, i,j)
			if item then
				--YCBag.m(i.."/"..j.." "..item.szName)
				if item.bCanStack then nCount=item.nStackNum else nCount=1 end 		
				YCBag.BankCache[i][j]={szName=item.szName,dwBox=i,dwX=j,itm=item,idx=nidx,nUiId=item.nUiId,nGenre=item.nGenre,nSub=item.nSub,nCount}	
			end
			nidx=nidx+1
		end
	end

	if not f or not f:IsVisible() then return end
	local handle = f:Lookup("", "")
	if not handle then return end
	local hBox = handle:Lookup("Handle_Box")
	StrGr=YCBag.ExpandStr(str)		--扩展str搜索 替代字   e.g.  会效=会心效			
	--Output(StrGr)

	for i,Data in pairs(YCBag.BankCache) do
		for j,v in pairs(Data) do
			local box = hBox:Lookup(v.idx)
			if not box then break end
			if bClear then		--还原背包
				box:SetAlpha(255) 
			else
				--如果 不需要搜索小药				&	          这item(box)是小药                     
				local NotinField= (not YCBag.SFType[2][1] and YCBag.IsXiaoyao(v.nGenre,v.nSub) ) or
									(not YCBag.SFType[3][1] and YCBag.IsFuMo(v.szName) )
				if NotinField then box:SetAlpha(30)
				else
					szDesc=YCBag.GetDesc(v.nGenre,v.nSub,v.nUiId,v.szName)	--获取有实际描述的desc
					flag=0
					for si=1,#StrGr do 
						if string.find(v.szName,StrGr[si]) or string.find(szDesc,StrGr[si]) then	
							nfound=nfound+1
							box:SetAlpha(255)  
								flag=1			
							break		
						end
					end											
					if flag ==0 then 							
						box:SetAlpha(30)  		
					end								

				end
			end
		end
	end

	if nfound>0 then
		OutputMessage("MSG_ANNOUNCE_YELLOW",'☆找到'..nfound..'个物品.☆')
	else
		if bClear then
			OutputMessage("MSG_ANNOUNCE_YELLOW",'☆取消搜索.☆')
		else
			OutputMessage("MSG_ANNOUNCE_RED",'☆没有任何物品符合要求☆')
		end
	end
	
end


function YCBag.ExpandStr(str)
	if	str=="会效" then StrGr={str,"会心效"} 					--有限的优化。
	elseif str=="内会" then StrGr={str,"内功会" }	
	elseif str=="外会" then StrGr={str,"外功会" }
	elseif str=="内破" then StrGr={str,"内功破" }
	elseif str=="外破" then StrGr={str,"外功破" }
	elseif str=="威胁" then StrGr={str,"仇恨"}
	elseif str=="仇恨" then StrGr={str,"威胁"}	
	elseif str=="T" then StrGr={"体质","威胁","仇恨","拆招","招架","闪避","血"} 	
	elseif str=="奶" or str=="治疗" then StrGr={"根骨","疗伤","治疗","内会","内功会","加速"}			
	elseif str=="血蓝" then StrGr={"气血","内力"}
	elseif str=="蓝" or str=="回蓝" then StrGr={"内力"}
	elseif str=="血" or str=="红药" then StrGr={"气血"}
	elseif str=="大旗" then StrGr={"义薄云天","悬壶济世"} 		
	elseif str=="大旗宴席修理" then StrGr={"义薄云天","悬壶济世","芙蓉出水宴","甲人"} 
	elseif str=="精力体力" then StrGr={"精力","体力"}
	elseif str=="T-4小药" then StrGr={"体质","仇恨","威胁","武伤"}
	elseif str=="治疗-4小药" then StrGr={"根骨","疗伤","内会","内会效","内功会","治疗"}
	elseif str=="天罗-4小药" then StrGr={"元气","外会效","外功会","内伤"}
	elseif str=="力道外功（丐帮，傲血，鲸鱼" then StrGr={"力道","外会效","外功会","外伤","外功破"}
	elseif str=="身法外功（藏剑，剑纯，分山" then StrGr={"身法","外会效","外功会","外伤","外功破"}
	elseif str=="元气内功（花间，焚影，易筋" then StrGr={"元气","内会效","内功会","内伤","内功破"}
	elseif str=="根骨内功（气纯，冰心，毒经" then StrGr={"根骨","内会效","内功会","内伤","内功破"}
	--elseif string.find(str,"内") then table.insert(StrGr,"内功")   
	--pvp 御 化   pvp的世界我不懂。。反正这两个能搜索
	else StrGr={str}
	end			
	return StrGr
end				

function YCBag.ItemType(nGenre,nSub,szDes,szName)		
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

function YCBag.IsXiaoyao(nGenre,nSub)		
	if (nGenre==1 or nGenre==14) and (nSub==2 or nSub==3) then return true
	else return false
	end
end

function YCBag.Is30MoShi(szName)			
	if string.find(szName,"·熔锭") then return true
	else return false
	end
end

function YCBag.IsMoShi(szName)			--pve 80龙血 80仇恨 90疗伤  uiid筛选
	if string.find(szName,"磨石") then return true
	else return false
	end
end

function YCBag.Is90FuMo(szName)
	local strGr={"·锻","·铸","·纹","·染","·绣","·印",}
	for i=1,#strGr do
		if string.find(szName,strGr[i]) then return true end
	end
	return false
end

function YCBag.Is80FuMo(szName)
	local strGr={"绣（","染（","甲片（",}
	for i=1,#strGr do
		if string.find(szName,strGr[i]) then return true end
	end
	return false
end

function YCBag.IsFuMo(szName)
	if YCBag.Is90FuMo(szName) or YCBag.Is80FuMo(szName) or YCBag.IsMoShi(szName) then return true 
	else return false 
	end	
end

function YCBag.GetDesc(nGenre,nSub,nUiId,szName)				
	des=Table_GetItemDesc(nUiId)		 	
	---------------------------------------------------------
	--小药
 	--------------------------------------------------------
	--if  (nGenre==1 or nGenre==14) and (nSub==2 or nSub==3) or nUiId==673 then			--673逍遥
	if YCBag.ItemType(nGenre,nSub,des,szName)=="4小药" or nUiId==673 then
		local x1,y1=string.find(des,"<BUFF ")			--锁定区间 <BUFF 2903 4 desc>
		local x2,y2=string.find(des," desc>")
		buffIdLv=string.sub(des,y1+1,x2-1)
		local x3,y3=string.find(buffIdLv," ")			--分割 2903 4
		buffId=tonumber(string.sub(buffIdLv,1,x3-1))		--字符串转 数字！
		buffLV=tonumber(string.sub(buffIdLv,y3+1))	
		szDesc=Table_GetBuffDesc(buffId,buffLV)	--获得buff的desc		
	---------------------------------------------------------
	--以前的附魔
	--------------------------------------------------------
	--elseif  nGenre==3 and nSub==0 and string.find(des,"<ENCHANT") then			
	elseif YCBag.ItemType(nGenre,nSub,des,szName)=="80附魔" then 
		if nUiId==3752  then FMid=38  else 	 
			local x1,y1=string.find(des,"<ENCHANT ")	
			local x2,y2=string.find(des,">\" font")
			FMid=tonumber(string.sub(des,y1+1,x2-1))	
		end	
		t=GetItemEnchantAttrib(FMid)
		nID=t[1]["nID"]
		szDesc=YCBag.tNid2Attr[nID]  
	else
		szDesc=des			  
	end
	--Output(szDesc)	
	return szDesc
end

function YCBag.OnEditChange(f,str,bClear)  
	if not bClear then
		YCBag.AddEditHistory(str)
	end
	if not str or str=="" then return end	 
	local nfound=0
	
	if not f or not f:IsVisible() then return end
	local chk = f:Lookup("CheckBox_Compact")
	if chk and not chk:IsCheckBoxChecked() then			  chk:Check(true)			end
	local handle = f:Lookup("", "Handle_Bag_Compact")
	if not handle then return end
	YCBag.ReSetCache()
	StrGr=YCBag.ExpandStr(str)		 
 

	for i,Data in pairs(YCBag.BagCache) do
		for j,v in pairs(Data) do
		local a = handle:Lookup(v.idx)
			if not a then break end
			local box = a:Lookup(1)
			if not box then break end
			if bClear then		 
				box:SetAlpha(255) 
			else
			     
				local NotinField= (not YCBag.SFType[2][1] and YCBag.IsXiaoyao(v.nGenre,v.nSub) ) or
									(not YCBag.SFType[3][1] and YCBag.IsFuMo(v.szName) )
				if NotinField then box:SetAlpha(30)
				else
					szDesc=YCBag.GetDesc(v.nGenre,v.nSub,v.nUiId,v.szName)	
					flag=0
					for si=1,#StrGr do 
						if string.find(v.szName,StrGr[si]) or string.find(szDesc,StrGr[si]) then		
							nfound=nfound+1
							box:SetAlpha(255) 
								flag=1			
							break		
						end
					end												
					if flag ==0 then 							
						box:SetAlpha(30)  		
					end																
				end
			end
		end
	end

	if nfound>0 then
		OutputMessage("MSG_ANNOUNCE_YELLOW",'☆找到'..nfound..'个物品.☆')
	else
		if bClear then
			OutputMessage("MSG_ANNOUNCE_YELLOW",'☆取消搜索.☆')
		else
			OutputMessage("MSG_ANNOUNCE_RED",'☆没有任何物品符合要求☆')
		end
	end
	
end


function YCBag.ShowBagItems(k)
	local frame = Station.Lookup("Normal/BigBagPanel")
	if frame then
		local N=GetClientPlayer()
		local chk = frame:Lookup("CheckBox_Compact")
		if chk and not chk:IsCheckBoxChecked() then	chk:Check(true)	end
		local handle = frame:Lookup("", "Handle_Bag_Compact")
		if not handle then return end
		for i=0,handle:GetItemCount()-1 do
			local a = handle:Lookup(i)
			if a then
				local box = a:Lookup(1)
				if box and ( not box:IsEmpty()) then
					local item = GetPlayerItem(N, box.dwBox, box.dwX)
					if item then
						if k=="Book" and	item.nGenre==4 then
							box:SetAlpha(255)
						elseif k=="Grey" and item.nQuality==0 then
							box:SetAlpha(255)
						elseif item.szName and item.szName==k then
							box:SetAlpha(255)
						else
							box:SetAlpha(30)
						end
					end
				end
			end
		end
	end
end

function YCBag.SearchbyUiid(tCSlist)
	local f = Station.Lookup("Normal/BigBagPanel")
	if not f or not f:IsVisible() then return end
	local chk = f:Lookup("CheckBox_Compact")
	if chk and not chk:IsCheckBoxChecked() then			  chk:Check(true)			end
	local handle = f:Lookup("", "Handle_Bag_Compact")
	if not handle then return end
	YCBag.ReSetCache()
	nfound=0		  
	for i,Data in pairs(YCBag.BagCache) do	 
		for j,v in pairs(Data) do
			local a = handle:Lookup(v.idx)
			if not a then break end
			local box = a:Lookup(1)
			if not box then break end
			flag=0
			for si=1,#tCSlist do 
				if v.nUiId==tCSlist[si] then		 
					table.remove(tCSlist,si)	 
					nfound=nfound+1			
					box:SetAlpha(255) 
					flag=1
					break	 
				end
			end				
			if flag==0 then box:SetAlpha(30) end		
		end
	end
	if nfound>0 then
		OutputMessage("MSG_ANNOUNCE_YELLOW",'☆找到'..nfound..'个物品.☆')
	else
		OutputMessage("MSG_ANNOUNCE_RED",'☆没有任何物品符合要求☆')
	end
end

function YCBag.ColorStoneClass(vep)
	local tCSlist={}
	if	YCBag.CSpveF then 
		for _,v in pairs(vep[2]) do	
			table.insert(tCSlist,v) 
		end
	end
	if	YCBag.CSpvpF then  
		for i=1,#vep[3] do
			table.insert(tCSlist,vep[3][i]) 
		end
	end
 
	YCBag.SearchbyUiid(tCSlist)
end

function  YCBag.MenuTip(hItem,str)
	local szText="<text>text=" ..EncodeComponentsString(str).." font=101 </text>"
	if not hItem then return end
	local x, y = hItem:GetAbsPos()
	local w, h = hItem:GetSize()
	OutputTip(szText, 435, {x, y, w, h})	
end

function YCBag.BagEditBtn_OnLBDown(f,func) 
--[=[小药磨石]=]
	local mXYMS={szOption="小药磨石",rgb={255,255,0},}

		for k,v in pairs(YCBag.XyMsTH) do
			table.insert(mXYMS,{szOption=v,rgb={0,255,0},
				fnAction=function()  
					YCBag.SFType[2][1]=true 
					YCBag.SFType[3][1]=false
					f=Station.Lookup("Normal/BigBagPanel")
					f2=Station.Lookup("Normal/BigBankPanel")						
					YCBag.OnEditChange(f,v,false)
					YCBag.OnBankEditChange(f2,v,false)
				end,
			})
		end
		table.insert(mXYMS,{bDevide=true})
		for k,v in pairs(YCBag.XyMsDps) do
			table.insert(mXYMS,{szOption=v,rgb={0,255,255},
				fnAction=function()  
					YCBag.SFType[2][1]=true 
					YCBag.SFType[3][1]=false
					f=Station.Lookup("Normal/BigBagPanel")
					f2=Station.Lookup("Normal/BigBankPanel")					
					YCBag.OnEditChange(f,v,false)
					YCBag.OnBankEditChange(f2,v,false)
				end,
			})				
		end

--[=[五彩石]=]		
	local mst={}
	for i=1,#YCBag.ColorStone do
		mst[i]={szOption=YCBag.ColorStone[i][1],}		 
		for _,vep in pairs(YCBag.ColorStone[i][2]) do
			table.insert(mst[i],{szOption=vep[1],rgb={0,255,255},fnAction=function() YCBag.ColorStoneClass(vep) end})  
		end	
	end
	local mColorStone={szOption="五彩石",rgb={0,255,255},}	 
	table.insert(mColorStone,{szOption="-=类型=-",bDisable=true})
	table.insert(mColorStone,{szOption="PVE",bCheck=true,bChecked = YCBag.CSpveF,bMCheck=false,fnAction=function(UserData,bCheck) YCBag.CSpveF=bCheck end})
	table.insert(mColorStone,{szOption="PVP",bCheck=true,bChecked = YCBag.CSpvpF,bMCheck=false,fnAction=function(UserData,bCheck) YCBag.CSpvpF=bCheck end})
	table.insert(mColorStone,{bDevide=true})
	table.insert(mColorStone,	mst[1])
	table.insert(mColorStone,	mst[2])
	table.insert(mColorStone, mst[3])

--[=[搜索范围/类型]=]	
	local mSearchField = {szOption='搜索范围/类型/部位',rgb={0,255,0}} 
	for i=1,#YCBag.SFType do
		v=YCBag.SFType[i][2]
		table.insert(mSearchField,{szOption=v,rgb={255,255,0},bCheck=true,bChecked=YCBag.SFType[i][1],bMCheck=false,
			fnAction=function(UserData,bCheck) YCBag.SFType[i][1]=bCheck end})
	end

--[=[偏好搜索]=]	
	local mHistoryList={}
	for i=1,#YCBag.HistoryList do
		v=YCBag.HistoryList[i]
		mHistoryList[i]={szOption=v,rgb={255,255,150},fnAction=function() func(f,v,false) end}		  		
		table.insert(mHistoryList[i],{szOption="再搜一次",rgb={0,255,255},fnAction=function() func(f,YCBag.HistoryList[i],false)  end})  			
		table.insert(mHistoryList[i],{szOption="移除此项",rgb={255,180,0},fnAction=function() table.remove(YCBag.HistoryList,i) end})  
	end	
	
--[=[搜索历史]=]	

	local mHistory={}
	for i=1,#YCBag.History do
	v=YCBag.History[i]
	mHistory[i]={szOption=YCBag.History[i],fnAction=function() func(f,v,false) end}		  
	table.insert(mHistory[i],{szOption="再搜一次",rgb={0,255,255},fnAction=function() func(f,YCBag.History[i],false) end})  
	table.insert(mHistory[i],{szOption="设为偏好搜索",rgb={255,255,0},fnAction=function() 
			flag=0
			for j=1,#YCBag.HistoryList do
				if YCBag.History[i]==YCBag.HistoryList[j] then 
					flag=1
					break 
				end				
			end
			if flag==0 then
				table.insert(YCBag.HistoryList,YCBag.History[i]) 
			else OutputMessage("MSG_SYS","已有该记录\n") 
			end
			table.remove(YCBag.History,i)	
		end})  
	table.insert(mHistory[i],{szOption="移除此项",rgb={255,180,0},fnAction=function() table.remove(YCBag.History,i) end})  
	end	
	
--[=[menu开始]=]		
	local m={}
	for k,v in pairs(YCBag.HideBtn or {}) do
		table.insert(m,{szOption="高亮 "..v,fnMouseEnter = function(hItem) YCBag.ShowBagItems(k) end})
	end
	table.insert(m,{bDevide=true})
	--------------------------------------------
	table.insert(m,mSearchField)	--搜索范围/类型
	table.insert(m,{bDevide=true})
	--------------------------------------------
	table.insert(m,{szOption='-=预制搜索=-',bDisable=true})
	table.insert(m,mXYMS)			--小药磨石
	table.insert(m,mColorStone)	--五彩石
	table.insert(m,{szOption='配装附魔'})
	table.insert(m,{bDevide=true})
	--------------------------------------------
	table.insert(m,{szOption='-=偏好搜索=-',bDisable=true}) 
	for i=1,#YCBag.HistoryList do	
		table.insert(m,mHistoryList[i]) 
	end
	table.insert(m,{bDevide=true})
	--------------------------------------------
	table.insert(m,{szOption='-=搜索历史=-',bDisable=true}) 
	for i=1,#YCBag.History do		
		table.insert(m,mHistory[i]) 
	end
	table.insert(m,{szOption='清空历史记录',rgb={255,255,0},fnAction=function() YCBag.History={} end })
	table.insert(m,{bDevide=true})
	--------------------------------------------	
	table.insert(m,{szOption='取消搜索、还原背包',fnAction=function()  YCBag.BagEditBtn_OnRBDown( Station.Lookup("Normal/BigBagPanel") ) 
							YCBag.BagEditBtn_OnRBDown( Station.Lookup("Normal/BigBankPanel") ) end })
 
	PopupMenu(m)
end

function YCBag.BagEditBtn_OnRBDown(f)--右击按钮 清除搜索框
	if f then
		local	cbb=f:Lookup("cbbSearcher")
		if cbb then
			local edt=cbb:Lookup("Text_Default")
			if edt then 
				edt:SetText("") 
				YCBag.OnEditChange(f,"xx",true)
				YCBag.OnBankEditChange(f,"xx",true)
			end
		end
	end
end
 
function YCBag.AddComboBox(frame,func_EdtChange,func_BtnLbDown,func_BtnRbDown,x,y,w,h,szTitle,isbag) --建立搜索框,isbag暂时没用。
	local	cbb=frame:Lookup("cbbSearcher")	
	if not cbb then		 
		local f=Wnd.OpenWindow('interface/TF/BBSeek/cbb.ini','asTempCbbWnd')
		if f then
			local r=f:Lookup("WndComboBox")
			if r then
				r:ChangeRelation(frame,true,true)
				r:SetName('cbbSearcher')
				local nw,ny=frame:GetSize()
				r:SetRelPos(nw-x,y)  
		 
				r:SetSize(w,h)
				r:Lookup('',"Image_ComboBoxBg"):SetSize(w,h)
				r:Lookup('',"Edit_Image"):SetSize(w,h)
				local edt=r:Lookup("Text_Default")	 
				if edt then
					edt:SetSize(w-5,h-5)
					if szTitle then
						edt:SetText(szTitle)
					end
					edt.szText=""
					frame.ChangeFunc=func_EdtChange
					--唉。。要是能。。。。万恶的白名单 
				end
				local btn=r:Lookup('Btn_ComboBox')
				if btn then
					--btn.OnMouseEnter=function()   end			 
					btn.OnMouseLeave=function() HideTip() end
					btn.OnMouseEnter=function() YCBag.BtnMouseMove(GetFormatText("点击：搜索选项、历史记录\n右键：取消搜索、还原背包", 101) ) end--鼠标移动
					btn.OnLButtonClick=function() func_BtnLbDown(frame,func_EdtChange) end
					btn.OnRButtonClick=function() func_BtnRbDown(frame) end
					btn:SetRelPos(w-24,3)
				end
			end
			Wnd.CloseWindow(f)
		end
	else
 

		local edt=cbb:Lookup("Text_Default")
		if YCBag.BagIsHide then 
			YCBag.BagIsHide=false
			edt:SetText("")
		end
		local str=edt:GetText()
		if str then
			str=    (string.gsub(str, "^%s*(.-)%s*$", "%1")) 
			str=    (string.gsub(str, "^%[*(.-)%]*$", "%1")) 
			if str and  edt.szText~=str  then
				edt:SetText(str)
				edt.szText=str
				if str=="" then
					YCBag.m('还原背包.')
					YCBag.OnEditChange(frame,'xx',true)
				else
					YCBag.OnEditChange(frame,str,false)
				end
			end
		end
	end
end

function YCBag.ChangeBagMode(frame)
	if not frame then return end
	local chk=frame:Lookup("CheckBox_Compact")
	if chk then
		chk:Check(true)
	end
end

function YCBag.CreateButton(szName,x,y,tip ) --建立 btn
	local f = Station.Lookup("Normal/BigBagPanel")
	if f and f:IsVisible() then
		local btn=f:Lookup("Btn_OpenYCBank")
		if not btn then --木有。添加
			local szFile="Interface\\TF\\BBSeek\\btn.ini"
			local fx=Wnd.OpenWindow(szFile,"YCBag_BankTemp")
			if fx then
				fx:Show()
				fx:BringToTop()		 
				local itm=fx:Lookup("WndButton")
				if itm then
					itm:ChangeRelation(f,true,true)  
					itm:SetName("Btn_OpenYCBank")
					x=100		 
					itm:SetRelPos(x,y)					 
					itm.nX=x
					itm.nY=y
					itm.OnMouseLeave=function() HideTip() end
					itm.OnMouseEnter=function() YCBag.BtnMouseMove(tip) end 
					itm.OnLButtonClick=function()  YCBag.BtnClick(szName) end
					itm.OnRButtonClick=function()  YCBag.BtnClick2(szName) end
				end
			end
			Wnd.CloseWindow(fx)
			YCBag.ChangeBagMode(f)
		else --存在
		 
		end
	end
end

function YCBag.CheckBankEdit()
	local frame = Station.Lookup("Normal/BigBankPanel")
	if frame then
		local	cbb=frame:Lookup("cbbSearcher")
		if not cbb then return end
		local nw,ny=frame:GetSize()
		 
		local edt=cbb:Lookup("Text_Default")
		local str=edt:GetText()
		if str then
			str=    (string.gsub(str, "^%s*(.-)%s*$", "%1")) 
			str=    (string.gsub(str, "^%[*(.-)%]*$", "%1")) 
			if str and  edt.szText~=str  then
				edt:SetText(str)
				edt.szText=str
				if str=="" then
					YCBag.OnBankEditChange(frame,'xx',true)
				else
					YCBag.OnBankEditChange(frame,str,false)
				end
			end
		end
	else
		YCBag.bNeedCheckBankEdt=false
	end
end

function YCBag.AddBankButton()  
	local f = Station.Lookup("Normal/BigBagPanel")
	if f and f:IsVisible() then
		if YCBag.bSaveLastChange then  
			YCBag.bLastCloseBag=0
			YCBag.UpdateChangeItems(f)
		end
		YCBag.CreateButton("Btn_OpenYCBank",10,-4,  GetFormatText("远程仓库/离线背包\n", 101) .. GetFormatText("单击查看远程仓库！\n右键切换离线背包", 106)  )
		YCBag.AddComboBox(f,YCBag.OnEditChange, YCBag.BagEditBtn_OnLBDown,YCBag.BagEditBtn_OnRBDown,160,17,95,20,nil,true) 
		 

	else
		if YCBag.bSaveLastChange then
			if YCBag.bLastCloseBag==0 then
				YCBag.bLastCloseBag=GetTime()
			end
			if GetTime() -YCBag.bLastCloseBag > 5000 then  
				YCBag.ChangeList={}
			end
		end
		
		YCBag.BagIsHide=true  
	end
	if YCBag.bNeedCheckBankEdt then
		YCBag.CheckBankEdit()
	end
end

function YCBag.Hide()
	local f=Station.Lookup("Normal/BigBagPanel")
	if f and f:IsVisible() then
		local r=f:Lookup("cbbSearcher")
		if r then r:Hide() end
	end
end

function YCBag.OnFrameBreathe()
	if GetLogicFrameCount() % 4 == 0 then
		if YCBag.IsOn then 	   
			YCBag.AddBankButton() 
			local f=Station.Lookup("Normal/BigBagPanel")
			if f and f:IsVisible() then
				local r=f:Lookup("cbbSearcher")
				r:Show()
			end
		else 
			YCBag.Hide() 
		end		
	end
end

function YCBag.tip(itm,str)
	local frame = Station.Lookup("Normal/BigBagPanel")
	if not itm then itm=this end
	local x, y = itm:GetAbsPos()
	local w, h = itm:GetSize()
	local szTip= "<text>text=" ..EncodeComponentsString(str).." font=101 </text>" 
	OutputTip(szTip, 400, {x, y, w, h})
end

function YCBag.OnEvent(event)
	if event=="ON_SET_BAG_COMPACT_MODE" then 
	elseif event=="BAG_ITEM_UPDATE" then
		YCBag.bNeedReSet=true
		if YCBag.bSaveLastChange then
 			YCBag.AddChangeList(arg0,arg1,arg2)
 		end
	--	YCBag.ReSetCache(1)
	elseif event=="SYNC_ROLE_DATA_END" then
		YCBag.ReSetCache(3)
	elseif  event =="HELP_EVENT" then
	--Output(arg0,arg1,arg2)
		if arg0=="OnOpenpanel" then			 
			if arg1=="BANK" then  			 
				local frame = Station.Lookup("Normal/BigBankPanel")
				YCBag.bNeedCheckBankEdt=true
				 
				YCBag.AddComboBox(frame,YCBag.OnBankEditChange, YCBag.BagEditBtn_OnLBDown,YCBag.BagEditBtn_OnRBDown,150,10,100,20,nil,false)

			end
		end
	end
end

local f=Station.Lookup("Normal/YCBag")
if not f then
	Wnd.OpenWindow("Interface\\TF\\BBSeek\\YCBag.ini", "YCBag")
	f=Station.Lookup("Normal/YCBag")
	f:Show()
end

function  YCBag.RegAddonModInfo()
	local tDataBBSeek={
		szName = "BBSeek",										 
		szTitle = "背包搜索",									 
		dwIcon = 3556,												 
		szClass = "UI",	
		tWidget={
			{	tag = "BBSeek_IsOn", type = "WndCheckBox", 					 
				w = 100, h = 25, text = "背包搜索开启",					 
				anchor = "TOPLEFT", x = 0, y = 0,					 
				default = function()							 
					return YCBag.IsOn
				end,
				callback = function(enabled)						 
					YCBag.IsOn = enabled
				end
			},
			{	tag = "BBSeek_ShuoMing", type = "WndTextBox", 					 
				w = 480, h = 28, text = "【功能说明】用来高亮九天开的物品，有各职业预制选项。",					 
				anchor = "TOPLEFT", x = 0, y = 30,					 
			},{	tag = "BBSeek_zhuyi", type = "WndTextBox", 					 
				w = 480, h = 28, text = "【使用注意】搜索框在背包右上角，偏好搜索，历史搜索。",					 
				anchor = "TOPLEFT", x = 0, y = 60,					 
			},
			{	tag = "BBSeek_Author", type = "WndTextBox", 					 
				w = 160, h = 28, text = "By 微雨凭阑", fontcolor={0,255,255},					 
				anchor = "TOPLEFT", x = 300, y = 330, 					 
			},
		},
	}

	CUIRegAddonModInfo(tDataBBSeek)	
end

RegisterEvent("CUSTOM_DATA_LOADED", function()						 
	if arg0 == "Role" then
		YCBag.RegAddonModInfo()
	end
end)