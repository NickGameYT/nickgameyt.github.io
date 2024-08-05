script_author('ngpyt')
script_version('v0.1')

local sampev = require("lib.samp.events")
local keys = require "vkeys"  
local inicfg = require 'inicfg'
require("moonloader")

local run_fastID = false
local random_taxi =  {
    '1000,���������',
    '1000,��-��',
    '1000,������',
    '1000,������ �������',
    '1000,�������� ����',
    '1000,���-���',
    '1000,�������',
    '1000,��������',
    '1000,�������� �����',
    '1000,�����',
    '1000,���������',
    '1000,��-��',
    '1000,������',
    '1000,������ �������',
    '1000,�������� ����',
    '1000,���-���',
    '1000,�������',
    '1000,��������',
    '1000,�������� �����',
    '1000,�����',
    '1000,888',
    '1000,Cabby',
    '1000,Taxi-City',
    '1000,XXL-Taxi',
    '1000,�������',
    '1000,��������',
    '1000,��������',
    '1000,����������',
    '1000,���������',
    '1000,��������',
    '1000,�������',
    '1000,���������',
    '1000,���������',
    '1000,����',
    '1000,���� �����',
    '1000,������',
    '1000,�����',
    '1000,�����',
    '1000,��������',
    '1000,����',
    '1000,����',
    '1000,�-52',
    '1000,������',
    '1000,����� ����',
    '1000,������ �����',
    '1000,������',
    '1000,����',
    '1000,�����',
    '1000,�����',
    '1000,�����',
    '1000,��������',
    '1000,�����',
    '1000,������',
    '1000,�����',
    '1000,�������� ��',
    '1000,�������',
    '1000,������',
    '1000,�����',
    '1000,����� �����',
    '1000,��������� �����',
    '1000,��������� �������',
    '1000,�����',
    '1000,�����-����',
    '1000,������� ������',
    '1000,������',
    '1000,�������',
    '1000,�������',
    '1000,����',
    '1000,������',
    '1000,�������',
    '1000,������',
    '1000,������',
    '1000,������������',
    '1000,������ �����',
    '1000,������� �����',
    '1000,������',
    '1000,�����',
    '1000,������� �����',
    '1000,������� ����',
    '1000,������� ����',
    '1000,������� ������',
    '1000,��������',
    '1000,��������',
    '1000,���������',
    '1000,�������',
    '1000,��������',
    '1000,������',
    '1000,�������',
    '1000,������',
    '1000,�������',
    '1000,�������',
    '1000,������',
    '1000,�����',
    '1000,���',
    '1000,����',
    '1000,�����',
    '1000,����',
    '1000,����',
    '1000,��������',
    '1000,�����',
    '1000,�������� �����',
    '1000,������',
    '1000,���������',
    '1000,�����',
    '1000,���',
    '1000,������',
    '1000,�����',
    '1000,������',
    '1000,��������',
    '1000,�����',
    '1000,���������',
    '1000,�������� �����',
    '1000,����������',
    '1000,����� �����',
    '1000,����� ������',
    '1000,����� ������ �����',
    '1000,���� ����',
    '1000,�������',
    '1000,������ �����',
    '1000,������',
    '1000,�����',
    '1000,�� ������ �� ��������',
    '1000,�������',
    '1000,�������',
    '1000,�����',
    '1000,��������',
    '1000,�����',
    '1000,������',
    '1000,��������� ���������',
    '1000,�������',
    '1000,��������',
    '1000,�������',
    '1000,����',
    '1000,������',
    '1000,�������',
    '1000,�������',
    '1000,������',
    '1000,�������',
    '1000,������',
    '1000,�����',
    '1000,����',
    '1000,������ �����',
    '1000,������ ��������',
    '1000,�����',
    '1000,������� �����',
    '1000,�������',
    '1000,������ �����',
    '1000,��������� �����',
    '1000,��������',
    '1000,���� �����',
    '1000,���� ������',
    '1000,���� �����',
    '1000,���������� ��������',
    '1000,���� �����',
    '1000,���Z��',
    '1000,������',
    '1000,��������',
    '1000,����� ����',
    '1000,�������',
    '1000,����',
    '1000,������',
    '1000,�������',
    '1000,������ �����',
    '1000,��������� ��������',
    '1000,��������',
    '1000,������',
    '1000,������CAR',
    '1000,�����',
    '1000,������',
    '1000,����� 777',
    '1000,����� 956',
    '1000,����� ��� ������',
    '1000,����� ������',
    '1000,����� ����',
    '1000,����� ����',
    '1000,�����-����',
    '1000,������',
    '1000,�����-����',
    '1000,�������',
    '1000,�����������',
    '1000,�����',
    '1000,��� �������',
    '1000,��� �������',
    '1000,��� �������',
    '1000,������',
    '1000,�����',
    '1000,������',
    '1000,������',
    '1000,������',
    '1000,�������',
    '1000,������',
    '1000,����',
    '1000,������� �����',
    '1000,������',
    '1000,�������',
    '1000,����',
    '1000,�����',
    '1000,��� ���',
    '1000,��������',
    '1000,���������',
    '1000,������',
    '1000,������',
    '1000,������',
    '1000,������-����',
    '1000,������',
    '1000,������',
    '1000,��, �������!',
    '1000,����-����',
    '1000,�����',
    '1000,�����',
    '1000,����� "���� �������"'
}
local mainIni = inicfg.load({
  settings =
  {
    tip = true,
	ptax = true,
	ptaxname = '',
	mode = false
  }
    }, 'phone')
	
local Taxi = mainIni.settings.ptaxname

function main()
    repeat wait(0) until isSampAvailable()
	
	    sampRegisterChatCommand("ptip", function() 
        mainIni.settings.tip = not mainIni.settings.tip
        sampAddChatMessage("{FFD700}[���������]: "..(mainIni.settings.tip and "{19ff19}��������" or "{ff0000}���������"), -1)
		inicfg.save(mainIni, 'phone')
		end)
	
		sampRegisterChatCommand("pmode", function() 
        mainIni.settings.mode = not mainIni.settings.mode
        sampAddChatMessage("{FFD700}[����� ����������]: "..(mainIni.settings.mode and "{19ff19}������" or "{ff0000}������"), -1)
		sampAddChatMessage("{FFD700}[����� ����������]:{FF0000} ����� ��������� �������� � ���� ������������� ����. ( ��� ������ � ������� CTRL + R", -1)
		inicfg.save(mainIni, 'phone')
		end)
		
		
     sampRegisterChatCommand("ptax", function() 
        mainIni.settings.ptax = not mainIni.settings.ptax
        sampAddChatMessage("{FFD700}[�������������� �������� �����]: "..(mainIni.settings.ptax and "{19ff19}��������" or "{ff0000}���������"), -1)
		inicfg.save(mainIni, 'phone')
		end)
	
	
	
	sampRegisterChatCommand('taxname', function(arg)
		if arg == '' or arg == nil then
			sampAddChatMessage('{FF0000}[ptax] {FFFFFF}�������: "/taxname �����,�������� �����" ', 0xFF0000)
		else
			sampAddChatMessage('{FF0000}[ptax] {FFFFFF}�������� ������� ���������, ����������� ��������� ��� ������� �� �������', 0xFF0000)
			mainIni.settings.ptaxname = arg
			inicfg.save(mainIni, 'phone')
		end
	end)
	
	
	
	
	if mainIni.settings.tip == true then
	sampAddChatMessage("{ffffff}������ {19ff19}������� {ffffff}��������. {FFD700} �����: {FF8C00}ng{FF0000}p{F0E68C}yt ", -1)
	sampAddChatMessage("{ffffff} ALT + ^{F0E68C}  - ������� ������� ", -1)
	sampAddChatMessage("{ffffff}/ptip{F0E68C}        - ���/���� ��������� ��� ������� ", -1)
	sampAddChatMessage("{ffffff}/ptax{F0E68C}       - ���/���� �������������� �������� ����� ", -1)
	sampAddChatMessage("{ffffff}/taxname{F0E68C} - ���������� ����� � �������� ����� ", -1)
	sampAddChatMessage("{ffffff}/pmode{F0E68C}    - �������� ����� ���������� ����� ", -1)
	end
while true do
    wait(0)

        if isKeyDown(VK_MENU) and isKeyJustPressed(VK_UP) then
            sampSendChat("/phone")
        end
    end
end

function phoneoff()
sampAddChatMessage("{ffffff}��������� {19ff19}�������. {ffffff}", -1)
mainIni.settings.tip = 0
inicfg.save(mainIni, 'phone')
end


function phoneon()
sampAddChatMessage("{ffffff}��������� {19ff19}�������. {ffffff}", -1)
mainIni.settings.tip = 1
inicfg.save(mainIni, 'phone')
end


--function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	--if dialogId == 281 and text:find("��������� ������")and mainIni.settings.ptax == true then
		--sampSendDialogResponse(dialogId, 1, nil, "")
--return false
--end	
--end
if mainIni.settings.mode == true then
function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	if dialogId == 15328 and mainIni.settings.ptax == true  then
		math.randomseed(os.time())
		rand = math.random(1, #random_taxi)
		sampSendDialogResponse(dialogId, 1, nil, random_taxi[rand])
		return false
		end
		end
	end
	
	
if mainIni.settings.mode == false then	
function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	if dialogId == 15328 and mainIni.settings.ptax == true  then
		sampSendDialogResponse(dialogId, 1, nil, Taxi)
		return false
		end
		end
	end