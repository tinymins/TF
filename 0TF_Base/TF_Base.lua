--Output("Hello base")	--国际惯例
_JT = {
welcome=1,
szHead="体服专用插件集",
--drug_bUse=0,
mmenu_bUse=0,
szIniFile = "Interface\\TF\\0TF_Base\\TF.ini",	--interface
}	
RegisterCustomData("_JT.mmenu_bUse")

function _JT.WelLoadSuccess()			

	if _JT.welcome==1 then 
		OutputMessage("MSG_SYS", "[".._JT.szHead.."] 欢迎"..GetClientPlayer().szName.."使用".._JT.szHead.."\n")	
		_JT.welcome = 0 	
	end
end                        


-------------------------------------
-- 设置面板开关、初始化
-------------------------------------
-- open
_JT.OpenPanel = function(szName)
	szName=szName or "TF"
	local frame = Station.Lookup("Normal/"..szName) or Wnd.OpenWindow(_JT.szIniFile, szName) 
	frame:Show()
	frame:BringToTop()
	return frame
end


-- close
_JT.ClosePanel = function(szName)
	szName=szName or "TF"
	local frame = Station.Lookup("Normal/"..szName)
	if frame then 
		frame:Hide()
	end
end

-- toggle
_JT.TogglePanel = function(szName)
	szName=szName or "TF"
	local frame = Station.Lookup("Normal/"..szName)
	if frame and frame:IsVisible() then
		_JT.ClosePanel()
	else
		_JT.OpenPanel()
	end
end

-- initlization
_JT.Init = function()
	local pFrame = Player_GetFrame()
	local hFrame = _JT.OpenPanel("TF")
	-- button
	local button = pFrame:Lookup("TF_Button")
	if not button then
		button = hFrame:Lookup("Btn_Menu")
		button:SetName("TF_Button")
		--Player_GetFrame():Lookup("TF_Button"):SetRelPos(8,50)
		button:ChangeRelation(pFrame, true, true)
		button.OnMouseEnter = function()
			local nX, nY = this:GetAbsPos()
			local nW, nH = this:GetSize()
			local szTip = GetFormatText("<" .. _JT.szHead .. ">\n", 101) .. GetFormatText("单击打开功能设置界面l!", 106)
			OutputTip(szTip, 400, {nX, nY, nW, nH})
		end
		button.OnLButtonClick = CUIManager.OpenPanel
		button.OnRButtonClick = CUIManager.OpenPanel
		button:Show()
	else
		return
	end
	--  hide
	hFrame:Hide()

end



---------------------------------------------------------------------
-- 注册事件、初始化
---------------------------------------------------------------------
RegisterEvent("PLAYER_ENTER_GAME", _JT.Init)
RegisterEvent("LOADING_END", _JT.WelLoadSuccess)	



---------------------------------------------------------------------
-- 全局函数和变量     TF.XXX  以后改
---------------------------------------------------------------------
JT={}
-- (void) JT.ClosePanel()				--  隐藏设置面板
-- (void) JT.ClosePanel(true)		-- 彻底关闭设置面板窗体
JT.ClosePanel = _JT.ClosePanel

-- (void) JT.TogglePanel()			-- 显示/隐藏设置面板
JT.TogglePanel = _JT.TogglePanel

-- key down
JT.OnFrameKeyDown = function()
	if GetKeyName(Station.GetMessageKey()) == "Esc" then
		_JT.ClosePanel()
		return 1
	end
	return 0
end

--Alert 
_JT.Alert = function(szMsg, fnAction, szSure)
	local nW, nH = Station.GetClientSize()
	local tMsg = {
		x = nW / 2, y = nH / 3, szMessage = szMsg, szName = "_JT_Alert",
		{
			szOption = szSure or g_tStrings.STR_HOTKEY_SURE,
			fnAction = fnAction,
		},
	}
	MessageBox(tMsg)
end


---------------------------------------------------------------------
--热键 快捷键设置
---------------------------------------------------------------------
Hotkey.AddBinding("JT_MenuToggle","主设置界面开关","【体服专用插件集】",function() CUIManager.OpenPanel() end,nil)
Hotkey.AddBinding("JLSwitch","自动吃精力开关","",function()  JLTL.JLSwitch() end,nil)
Hotkey.AddBinding("TLSwitch","自动吃体力开关","",function()  JLTL.TLSwitch() end,nil)
Hotkey.AddBinding("YJCDOM","九天逍遥助手面板","",function() JTZS._OpenWindow() end,nil)
Hotkey.AddBinding("DrugEqOM","刷药配装助手面板","",function() DrugEq._OpenWindow() end,nil)
Hotkey.AddBinding("SellDrugOM","刷药助手面板开关","",function() SellDrug._OpenWindow() end,nil)


function _JT.URLink()
			local page = Station.Lookup("Normal/TF/Page_1")
			if page then  --Output("打开下载页")
			--Output(page:GetLocationName())	-- {  [1] = "百度云 网盘-微雨凭阑_山雨的分享",}
			--Output(page:GetLocationURL())		-- {  [1] = "http://pan.baidu.com/share/home?uk=525430273&view=share#category/type=0",}
				szAddr="http://t.cn/R7mzaJ1"
				--page:Navigate(szAddr)
				OpenInternetExplorer2(szAddr,true)
			end
end
 
 function OpenInternetExplorer2(szAddr, bDisableSound)
 local nIndex=1
	local x, y = IE_GetNewIEFramePos()
	local frame = Wnd.OpenWindow("InternetExplorer", "IE"..nIndex)
	frame.bIE = true
	frame.nIndex = nIndex

	frame:BringToTop()
	if nLast then
		frame:SetAbsPos(x, y)
		frame:CorrectPos()
		frame.x = x
		frame.y = y
	else
		frame:SetPoint("CENTER", 0, 0, "CENTER", 0, 0)
		frame.x, frame.y = frame:GetAbsPos()
	end
	local webPage = frame:Lookup("WebPage_Page")
	if szAddr then
		webPage:Navigate(szAddr)
	end
	Station.SetFocusWindow(webPage)
	if not bDisableSound then
		PlaySound(SOUND.UI_SOUND,g_sound.OpenFrame)
	end
	return webPage
end

---------------------------------------------------------------------
-- 插件入口
---------------------------------------------------------------------
function  _JT.RegAddonModInfo()
	local tDataAbout={
		szName = "About",										 
		szTitle = "关于本插件",									 
		dwIcon = 1904,											 
		szClass = "ALL",	
		tWidget={
			{	tag = "About_ShuoMing", type = "WndTextBox", 				
				w = 480, h = 28, text = "专为体服玩家定制的实用插件集", fontcolor={255,255,0},					
				anchor = "TOPLEFT", x = 0, y = 0,					
			},{	tag = "About_zhuyi", type = "WndTextBox", 				
				w = 480, h = 28, text = "未经官方认证，包含被和谐功能，只能在体服使用。",					
				anchor = "TOPLEFT", x = 0, y = 30,					
			},{	tag = "About_zhuyi", type = "WndTextBox", 				
				w = 480, h = 28, text = "可在百度网盘查看并下载插件最新版：", fontcolor={255,255,0},						
				anchor = "TOPLEFT", x = 0, y =70,					
			},{	tag = "About_zhuyi", type = "WndTextBox", 				
				w = 480, h = 28, text = "http://t.cn/R7mzaJ1",							
				anchor = "TOPLEFT", x = 0, y = 100,					
			},{
				tag = "Open_UpdateUrl", type = "WndButton",					
				w = 120, h = 29, text = "插件更新下载页",					
				anchor = "TOPLEFT", x = 170, y = 100,					
				callback = function()								
					_JT.URLink()
				end
			},{	tag = "About_zhuyi2", type = "WndTextBox", 				
				w = 480, h = 28, text = "若打不开可复制网址，用浏览器打开。其实也没空更新了←_←",							
				anchor = "TOPLEFT", x = 0, y =130,					
			},{	tag = "About_Author", type = "WndTextBox", 				
				w = 160, h = 28, text = "由微雨开发并整合优化", fontcolor={0,255,255},					
				anchor = "TOPLEFT", x = 270, y = 330, 					
			},	
		},
	}
	CUIRegAddonModInfo(tDataAbout)	
end

RegisterEvent("CUSTOM_DATA_LOADED", function()					 
	if arg0 == "Role" then
		_JT.RegAddonModInfo()
	end
end)
