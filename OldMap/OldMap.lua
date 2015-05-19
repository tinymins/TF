-- 非战乱地图数据（相对于副本：战宝军械库位置 id = 160）
OldMap={
bNonwar = true,		-- 神行到非战乱地图
}
RegisterCustomData("OldMap.bNonwar")  



function OldMap.OnFrameBreathe()
	if GetLogicFrameCount()%16==0 then
 
		OldMap.BindNonwarButton()
	end

end

OldMap.tNonwarData = {
	{ id = 15, x = -180, y = 14 }, -- 长安
	{ id = 8, x = 40, y = -50 }, -- 洛阳
	{ id = 11, x = 30, y = -140 }, -- 天策
	{ id = 12, x = -30, y = 140 }, -- 枫华
	{ id = 26, x = -70, y = 110}, -- 荻花宫
	{ id = 32, x = 80, y = -60 },	-- 小战宝
}

-- 加入非战乱地图的神行按钮
OldMap.BindNonwarButton = function()
	local h = Station.Lookup("Topmost1/WorldMap/Wnd_All", "Handle_CopyBtn")
	if not h then return end
	if OldMap.bNonwar and not h.bNonwared then
		local me = GetClientPlayer()
		if not me then return end
		for i = 0, h:GetItemCount() - 1 do
			local m = h:Lookup(i)
			if m and m.mapid == 160 then
				local _w, _ = m:GetSize()
				local fS = m.w / _w
				for _, v in ipairs(OldMap.tNonwarData) do
					local bOpen = me.GetMapVisitFlag(v.id)
					--local bOpen=1
					local szFile, nFrame = "ui/Image/MiddleMap/MapWindow.UITex", 41
					if bOpen then
						nFrame = 98		--开过的地图是有颜色的。否则灰色。
					end
					h:AppendItemFromString("<image>name=\"nonwar_" .. v.id .. "\" path="..EncodeComponentsString(szFile).." frame="..nFrame.." eventid=341</image>")
					local img = h:Lookup(h:GetItemCount() - 1)
					img.bEnable = bOpen		--开过才显示神行有效
					img.bSelect = bOpen and (v.id == 15 or v.id == 8  or v.id ==11 or v.id == 12	)		--长安，天策，枫华谷（洛阳可以九天飞，不用神行CD，但不能选马车点。）
					img.x = m.x + v.x
					img.y = m.y + v.y
					img.w, img.h = m.w, m.h
					img.id, img.mapid = v.id, v.id
					img.middlemapindex = 0
					img.name = Table_GetMapName(v.mapid)
					img.city = img.name		
					img.button = m.button	
					img.copy = true
					img:SetSize(img.w / fS, img.h / fS)
					img:SetRelPos(img.x / fS - (img.w / fS / 2), img.y / fS - (img.h / fS / 2))
				end
				h:FormatAllItemPos()
				break
			end
		end
		h.bNonwared = true
	end
	if not OldMap.bNonwar and h.bNonwared then
		for _, v in ipairs(OldMap.tNonwarData) do
			local img = h:Lookup("nonwar_" .. v.id)
			if img then
				h:RemoveItem(img)
			end
		end
		h:FormatAllItemPos()
		h.bNonwared = nil
	end
end

Wnd.OpenWindow ("Interface/TF/OldMap/OldMap.ini","OldMap")

function  OldMap.RegAddonModInfo()
	local tDataOldMap={
		szName = "OldMap",										 
		szTitle = "自由神行",										 
		dwIcon = 2043,												 
		szClass = "UI",	
		tWidget={
			{	tag = "OldMap_IsOn", type = "WndCheckBox", 					 
				w = 100, h = 25, text = "老地图神行点开启",					 
				anchor = "TOPLEFT", x = 0, y = 0,					 
				default = function()								 
					return OldMap.bNonwar
				end,
				callback = function(enabled)						 
					OldMap.bNonwar = enabled
				end
			},
			{	tag = "OldMap_ShuoMing", type = "WndTextBox", 					 
				w = 480, h = 28, text = "【功能说明】直飞荻花、战宝，战乱前主城、天策、枫华谷",					 
				anchor = "TOPLEFT", x = 0, y = 30,					 
			},{	tag = "OldMap_zhuyi", type = "WndTextBox", 					 
				w = 480, h = 28, text = "【使用注意】若地图未开，用九天去主城找余半仙飞一次即可",					 
				anchor = "TOPLEFT", x = 0, y = 60,					 
			},
			{	tag = "OldMap_Author", type = "WndTextBox", 					 
				w = 160, h = 28, text = "由微雨从老HM提取", fontcolor={0,255,255},					 
				anchor = "TOPLEFT", x = 270, y = 330, 					 
			},
		},
	}
	CUIRegAddonModInfo(tDataOldMap)	
end

RegisterEvent("CUSTOM_DATA_LOADED", function()					 
	if arg0 == "Role" then
		OldMap.RegAddonModInfo()
	end
end)