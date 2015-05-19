CUIManager = CUIManager or {}
CUIManager.bFrameOpened=false

local MAX_PAGE_MODULE_COUNT = 12					-- 每页模块个数
local MAX_CLASS_COUNT = 4							-- 分类最大个数
--local bFrameOpened = false							-- 控制窗口显示
local hPrevBtn, hNextBtn, hPage = nil, nil, nil
local CUIModules = {}								-- 模块注册缓存表
local nPage, szCurrentClass = 1, "ALL"
local tModuleButtons = {}							-- 模块按钮缓存表

local tAddonClassData = {
	[1] = { hBtn = nil, szClass = "ALL", hText = "所有功能"},
--	[2] = { hBtn = nil, szClass = "COMBAT", hText = "战斗增强"},
	[2] = { hBtn = nil, szClass = "TOOL", hText = "辅助工具"},
	[3] = { hBtn = nil, szClass = "UI", hText = "界面增强"},
	[4] = { hBtn = nil, szClass = "AUTO", hText = "自动挂机"},
--	[4] = { hBtn = nil, szClass = "RAID", hText = "组队团队"},
--	[5] = { hBtn = nil, szClass = "ITEM", hText = "商业物品"},
--	[6] = { hBtn = nil, szClass = "MAP", hText = "地图任务"},
--	[7] = { hBtn = nil, szClass = "TOOL", hText = "辅助工具"},
}

function CUIManager.Create()
	-- 面板
	local frame = CUIFrame.new(772, 500, "体服专用插件集")

	-- 左上角图标
	local hIconImg = CUIImage.new(frame, 36, 36, "ui\\Image\\UICommon\\CommonPanel.UITex", 13)
	hIconImg:SetPoint("TOPLEFT", 5, 5)

	-- TAB背景
	local hTabBg = CUIImage.new(frame, 765, 30, "Interface\\TF\\0TF_Base\\artwork\\activepopularize2.UITex", 2)
	hTabBg:SetPoint("TOPLEFT", 2, 50)

	-- 分割线
	local hSplitBg = CUIImage.new(frame, 5, 420, "ui\\Image\\UICommon\\CommonPanel.UITex", 43)
	hSplitBg:SetPoint("TOPLEFT", 300, 70)

	-- 模块按钮
	local x, y = 20, 90
	for i = 1, MAX_PAGE_MODULE_COUNT, 1 do
		tModuleButtons[i] = CUIModButton.new(frame)
		tModuleButtons[i]:SetPoint("TOPLEFT", x, y)
		tModuleButtons[i].text:SetHAlign("LEFT")
		tModuleButtons[i].button.OnLClick = function()
			-- 清除高亮状态
			if hLastBtn then
				hLastBtn:SetStatus("NORMAL")
			end
			-- 按钮高亮处理
			hLastBtn = tModuleButtons[i]
			tModuleButtons[i]:SetStatus("HIGHLIGHT")

			-- 销毁原有虚窗口
			if hLastWnd then
				hLastWnd:Destroy()
			end
			-- 生成一个虚窗口，用于容纳产生的控件，切换模块时则销毁
			hLastWnd = CUIWindow.new(400, 400)

			-- 显示插件控件信息
			CUIManager.ShowAddonModInfo(hLastWnd, hLastBtn.tWidget)
			hLastWnd:SetParent(frame)
			hLastWnd:SetPoint("TOPLEFT", 320, 100)
			PlaySound(SOUND.UI_SOUND, g_sound.Button)
		end

		-- 模块位置处理
		x = x + 140
		if x > 177 then
			x = 20
			y = y + 60
		end
	end

	-- 上一页按钮
	hPrevBtn = CUIButtonEx.new(frame, 28, 28)
	hPrevBtn:SetStyle("NORMAL")
	hPrevBtn.OnLClick = function()
		nPage = nPage - 1
		-- 显示插件分类
		CUIManager.ShowAddonClass(szCurrentClass, nPage)
		PlaySound(SOUND.UI_SOUND, g_sound.Button)
		if hLastBtn then
			hLastBtn:SetStatus("NORMAL")
		end
	end
	hPrevBtn:SetNormal("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 6)
	hPrevBtn:SetOver("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 5)
	hPrevBtn:SetDown("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 7)
	hPrevBtn:SetDisable("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 4)
	hPrevBtn:SetPoint("TOPLEFT", 24, 452)

	-- 上一页文字
	local hPrevText = CUITextBox.new(frame, 50, 24, "上一页")
	hPrevText:SetHAlign("LEFT")
	hPrevText:SetPoint("TOPLEFT", 60, 452)

	-- 下一页按钮
	hNextBtn = CUIButtonEx.new(frame, 28, 28)
	hNextBtn:SetStyle("NORMAL")
	hNextBtn.OnLClick = function()
		nPage = nPage + 1
		CUIManager.ShowAddonClass(szCurrentClass, nPage)
		PlaySound(SOUND.UI_SOUND, g_sound.Button)
		if hLastBtn then
			hLastBtn:SetStatus("NORMAL")
		end
		if hLastWnd then
			hLastWnd:Destroy()
		end
	end
	hNextBtn:SetNormal("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 2)
	hNextBtn:SetOver("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 1)
	hNextBtn:SetDown("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 3)
	hNextBtn:SetDisable("Interface\\TF\\0TF_Base\\artwork\\pagebuttons.UITex", 0)
	hNextBtn:SetPoint("TOPLEFT", 250, 452)

	-- 下一页文字
	local hNextText = CUITextBox.new(frame, 50, 24, "下一页")
	hNextText:SetHAlign("RIGHT")
	hNextText:SetPoint("TOPLEFT", 200, 452)

	-- 页数文字
	hPage = CUITextBox.new(frame, 50, 24, "111")
	hPage:SetPoint("TOPLEFT", 147, 452)

	-- 悬停背景
	local hOverBg = CUIImage.new(hTabBg, 80, 30, "Interface\\TF\\0TF_Base\\artwork\\activepopularize2.UITex", 8)
	hOverBg:SetPoint("TOPLEFT", 30, 0)
	hOverBg:Hide()

	-- 激活背景
	local hActiveBg = CUIImage.new(hTabBg, 80, 30, "Interface\\TF\\0TF_Base\\artwork\\activepopularize2.UITex", 7)
	hActiveBg:SetPoint("TOPLEFT", 30, 0)

	-- 分类按钮
	for i = 1, MAX_CLASS_COUNT do
		tAddonClassData[i].hBtn = CUIButtonEx.new(hTabBg, 80, 30, tAddonClassData[i].hText)
		tAddonClassData[i].hBtn:SetStyle("NORMAL")
		tAddonClassData[i].hBtn:SetPoint("TOPLEFT", 30 + (i - 1) * 82, 0)

		-- 还原上次分类
		if szCurrentClass == tAddonClassData[i].szClass then
			hActiveBg:SetPoint("TOPLEFT", 30 + (i - 1) * 82, 0)
		end

		-- 鼠标移入效果
		tAddonClassData[i].hBtn.OnEnter = function()
			hOverBg:SetPoint("TOPLEFT", 30 + (i - 1) * 82, 0)
			hOverBg:Show()
		end

		-- 鼠标离开效果
		tAddonClassData[i].hBtn.OnLeave = function()
			hOverBg:Hide()
		end

		-- 分类点击触发事件
		tAddonClassData[i].hBtn.OnLClick = function()
			hActiveBg:SetPoint("TOPLEFT", 30 + (i - 1) * 82, 0)
			szCurrentClass, nPage = tAddonClassData[i].szClass, 1
			CUIManager.ShowAddonClass(tAddonClassData[i].szClass, nPage)
			if hLastBtn then
				hLastBtn:SetStatus("NORMAL")
			end
			if hLastWnd then
				hLastWnd:Destroy()
			end
			PlaySound(SOUND.UI_SOUND, g_sound.Button)
		end
	end

	CUIManager.ShowAddonClass(szCurrentClass, nPage)

	return frame
end

function CUIManager.ClosePanel()
	local frame = Station.Lookup("Normal/TFZYCJJ")  
	if frame then 	frame:Hide() 	CUIManager.bFrameOpened=false	 end
end

function CUIManager.OpenPanel()
	local frame = Station.Lookup("Normal/TFZYCJJ")
	--local frame = nil
	if not frame then
		if not CUIManager.bFrameOpened then
			frame = CUIManager.Create()
			CUIManager.bFrameOpened = true

				frame.OnClick = function()
			--Wnd.CloseWindow(frame:GetName())
			--Output(frame:GetName())
				--frame:Hide()
				Wnd.CloseWindow("TFZYCJJ")
				PlaySound(SOUND.UI_SOUND, g_sound.CloseFrame)
				CUIManager.bFrameOpened = false
			end
		end
	else 
		--frame:Hide() 
		Wnd.CloseWindow("TFZYCJJ")
		CUIManager.bFrameOpened = false 
		PlaySound(SOUND.UI_SOUND, g_sound.CloseFrame)
	end
	PlaySound(SOUND.UI_SOUND, g_sound.OpenFrame)
end

-- 显示分类
function CUIManager.ShowAddonClass(szClass, nPage)
	local nCount, nIndex, nI = 0, 1, 1
	local tTempModules = {}

	local nS = 1 + (nPage - 1) * MAX_PAGE_MODULE_COUNT
	local nE = nS + MAX_PAGE_MODULE_COUNT

	-- 按分类存表
	for k, v in pairs(CUIModules) do
		if szClass == "ALL" then
			table.insert(tTempModules, v)
			nCount = nCount + 1
		else
			if v.szClass == szClass then
				table.insert(tTempModules, v)
				nCount = nCount + 1
			end
		end
	end

	-- 最大页数计算
	local nMaxPage = math.floor(nCount / MAX_PAGE_MODULE_COUNT)
	if math.fmod(nCount, MAX_PAGE_MODULE_COUNT) > 0 then
		nMaxPage = nMaxPage + 1
	end

	-- 模块按钮初始化
	for k, v in ipairs(tTempModules) do
		if nIndex >= nS and nIndex < nE then
			tModuleButtons[nI].szName = v.szName
			tModuleButtons[nI].tWidget = v.tWidget
			tModuleButtons[nI]:SetTitle(v.szTitle)
			tModuleButtons[nI]:SetImage(v.dwIcon)
			tModuleButtons[nI]:Show()

			nI = nI + 1
		end
		nIndex = nIndex + 1
	end

	-- 隐藏后页的模块按钮
	for nJ = nI, MAX_PAGE_MODULE_COUNT do
		tModuleButtons[nJ]:Hide()
	end

	hPage:SetText(nPage .. "/" .. nMaxPage)

	-- 翻页按钮效果处理
	if nPage == 1 then
		hPrevBtn:SetEnabled(false)
	else
		hPrevBtn:SetEnabled(true)
	end

	if nPage == nMaxPage then
		hNextBtn:SetEnabled(false)
	else
		hNextBtn:SetEnabled(true)
	end

	if nMaxPage == 0 then
		hNextBtn:SetEnabled(false)
	end
end

-- 显示插件控件
function CUIManager.ShowAddonModInfo(hWnd, tWidget)
	for k, v in pairs(tWidget) do
		if v.type == "WndTextBox" then
			-- 文本框创建
			local hTextBox = CUITextBox.new(hWnd, v.w, v.h, v.text)
			hTextBox:SetPoint(v.anchor, v.x, v.y)
			if v.fontcolor then hTextBox:SetFontColor(v.fontcolor[1],v.fontcolor[2],v.fontcolor[3]) end	--加上字体颜色
		elseif v.type == "WndButton" then
			-- 按钮创建
			local hButton = CUIButton.new(hWnd, v.w, v.h, v.text)
			hButton:SetPoint(v.anchor, v.x, v.y)

			-- 按钮回调事件处理
			hButton.OnLClick = function()
				v.callback()
			end
		elseif v.type == "WndCheckBox" then
			-- 复选框创建
			local hCheckBox = CUICheckBox.new(hWnd, v.w, v.h, v.text)
			hCheckBox:SetPoint(v.anchor, v.x, v.y)
			
			-- 复选框默认值处理
			local value = CUIManager.GetModValue(tWidget, v.tag)
			hCheckBox:SetChecked(value)

			-- 复选框回调事件处理
			hCheckBox.OnCheck = function(arg0)
				local old = CUIManager.GetModValue(tWidget, v.tag)
				if old ~= arg0 then
					v.callback(arg0)
				end
			end
		elseif v.type == "WndRadioBox" then
			-- 单选框创建
			local hRadioBox = CUIRadioBox.new(hWnd, v.w, v.h, v.text, v.group)
			hRadioBox:SetPoint(v.anchor, v.x, v.y)

			-- 单选框默认值处理
			local value = CUIManager.GetModValue(tWidget, v.tag)
			hRadioBox:SetChecked(value)

			-- 单选框回调事件处理
			hRadioBox.OnCheck = function(arg0)
				local old = CUIManager.GetModValue(tWidget, v.tag)
				if old ~= arg0 then
					v.callback(arg0)
				end
			end
		elseif v.type == "WndComboBox" then
			-- 下拉框创建
			local hComboBox = CUIComboBox.new(hWnd, v.w, v.h, v.text)
			hComboBox:SetPoint(v.anchor, v.x, v.y)

			-- 下拉框回调事件处理
			hComboBox.OnLClick = function()
				local xT, yT = hComboBox:GetAbsPos()
				local wT, hT = hComboBox:GetSize()
				local m = v.callback()
				m.nMiniWidth = wT + 16
				m.x = xT
				m.y = yT + hT
				PopupMenu(m)
			end
		elseif v.type == "WndColorBox" then
			-- 颜色选择器创建
			local hColorBox = CUIColorBox.new(hWnd, v.w, v.h, v.text)
			hColorBox:SetPoint(v.anchor, v.x, v.y)

			-- 颜色默认值处理
			local value = CUIManager.GetModValue(tWidget, v.tag)
			hColorBox:SetColor(unpack(value))

			-- 颜色选择器回调事件处理
			hColorBox.OnChanged = function(arg0)
				v.callback(arg0)
			end
		elseif v.type == "WndEditBox" then
			-- 创建编辑框
			local hEditBox = CUIEditBox.new(hWnd, v.w, v.h)
			hEditBox:SetPoint(v.anchor, v.x, v.y)

			-- 编辑框默认值处理
			local value = CUIManager.GetModValue(tWidget, v.tag)
			hEditBox:SetText(value)

			-- 编辑框回调事件处理
			hEditBox.OnChanged = function(arg0)
				v.callback(arg0)
			end
		elseif v.type == "WndScrollBar" then
			-- 滑动条创建
			local hScrollBar = CUIScrollBar.new(hWnd, v.w, v.h)
			hScrollBar:SetPoint(v.anchor, v.x, v.y)
			hScrollBar:SetArea(v.min, v.max, v.step)

			-- 滑动条默认值处理
			local value = CUIManager.GetModValue(tWidget, v.tag)
			hScrollBar:SetDefaultValue(value)

			-- 滑动条回调事件处理
			hScrollBar.OnChanged = function(arg0)
				v.callback(arg0)
			end
		end
	end
end

-- 按标志取值
function CUIManager.GetModValue(tWidget, szTag)
	for k, v in pairs(tWidget) do
		if v.tag == szTag then
			return v.default()
		end
	end
	return nil
end

-- 模块注册
function CUIRegAddonModInfo(tData)
	table.insert(CUIModules, tData)
end


----------------------------------------------------
-- 构造模块按钮
----------------------------------------------------

CUIModButton = classV2()
function CUIModButton:ctor(parent)
	self:Create(parent)
end

function CUIModButton:Create(parent)
	local wnd = CUIWindow.new(130, 50)
	wnd:SetParent(parent)

	local border = CUIImage.new(wnd, 130, 50)
	local icon = CUIImage.new(wnd, 36, 36)
	local text = CUITextBox.new(wnd, 75, 50)
	local button = CUIButtonEx.new(wnd, 130, 50)

	border:SetPoint("TOPLEFT", 0, 0)
	icon:SetPoint("TOPLEFT", 8, 6)
	text:SetPoint("TOPLEFT", 55, 0)
	button:SetPoint("TOPLEFT", 0, 0)

	button:SetStyle("NONE")

	self.wnd = wnd
	self.border = border
	self.icon = icon
	self.text = text
	self.button = button

	self:SetStatus("NORMAL")
end

function CUIModButton:SetStatus(status)
	if status == "NORMAL" then
		self.border:SetImage("ui\\image\\uicommon\\rankingpanel.UITex", 10)
		self.border:SetSize(130, 50)
		self.border:SetRelPos(0, 0)
		self.border:Show()
	elseif status == "HIGHLIGHT" then
		self.border:SetImage("ui\\image\\uicommon\\rankingpanel.UITex", 11)
		self.border:SetSize(138, 58)
		self.border:SetRelPos(-4, -4)
		self.border:Show()
	end
end

function CUIModButton:SetImage(image)
	self.icon:SetImage(image)
end

function CUIModButton:SetTitle(title)
	self.text:SetText(title)
end

function CUIModButton:SetPoint(...)
	self.wnd:SetPoint(...)
end

function CUIModButton:Show()
	self.wnd:Show()
end

function CUIModButton:Hide()
	self.wnd:Hide()
end

 TFZYCJJ={}			--原来要写frame名- -
 TFZYCJJ.OnFrameKeyDown = function()
	if GetKeyName(Station.GetMessageKey()) == "Esc" then
		CUIManager.ClosePanel()
		return 1
	end
	return 0
end

--OutputMessage("MSG_SYS","【体服专用插件集】加载成功\n")
--[==[
local tMenu = {
	{
		szOption = "体服专用插件集",bCheck=true,bChecked=CUIManager.bFrameOpened,
		fnAction = function()
			CUIManager.OpenPanel()
		end,
	}
}
TraceButton_AppendAddonMenu(tMenu)
Player_AppendAddonMenu(tMenu)
]==]

Player_AppendAddonMenu({ function()
	return {{
		szOption ="体服专用插件集", bCheck = true,
		bChecked = CUIManager.bFrameOpened,
		fnAction = CUIManager.OpenPanel
	}}
end })
 
 TraceButton_AppendAddonMenu({ function()
	return {{
		szOption ="体服专用插件集", bCheck = true,
		bChecked = CUIManager.bFrameOpened,
		fnAction = CUIManager.OpenPanel
	}}
end })
 