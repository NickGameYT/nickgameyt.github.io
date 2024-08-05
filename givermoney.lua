script_author('ngpyt')
script_version('v1.5')

local sampev = require("lib.samp.events")

---------------------------------------------------
local imgui = require 'imgui'
local stateImgui = not stateImgui
local keys = require "vkeys"                                           --- Keys(buttons)                                                  --- Imgui
local main_window_state = imgui.ImBool(false)
local text_buffer = imgui.ImBuffer(256)
local button = imgui.ImBool(false)
-------------------------------------
local botik = true
local EmuLaunch = true
local roadbot = true
local casket = true
local delpl = true
local counter = {}
local watermark_code = "10dc3e8d95586e273f9d0e56e2e8996b7c4319e3684ef258c0fdd47f96c4954e"
-------------------------------------


local sw, sh = getScreenResolution()

local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
----------------------------------------------------
local inicfg = require 'inicfg'
require("moonloader")
local ID
local act
local MODEL
local mainIni = inicfg.load({
  settings =
  {
    id = 50,
    summa = 50000,
    mode = 1,
    welcome = 1,
    delay=30000,
    autolockerTEST = 1,
    autolocker = 1,
    testcheckbox227 = false,
    SaveCheckbox1 = false,
    autolen = 0,
    autolenTEST = 0,
    testcheckbox228=false,
    testcheckbox229=false,
    testcheckbox230=false,
    testcheckbox231=false,
    testcheckbox232=false,
	testcheckbox233=false,
	testcheckbox234=false,
    snusertester = 1,
    autominer = 0,
	watermark = 1
  }
    }, 'givemoney')
    -----------------
local checkbox = imgui.ImBool(mainIni.settings.SaveCheckbox1)
local checkbox227 = imgui.ImBool(mainIni.settings.testcheckbox227)
local checkbox228 = imgui.ImBool(mainIni.settings.testcheckbox228)
local checkbox229 = imgui.ImBool(mainIni.settings.testcheckbox229)
local checkbox230 = imgui.ImBool(mainIni.settings.testcheckbox230)
local checkbox231 = imgui.ImBool(mainIni.settings.testcheckbox231)
local checkbox232 = imgui.ImBool(mainIni.settings.testcheckbox232)
local checkbox233 = imgui.ImBool(mainIni.settings.testcheckbox233)
local checkbox234 = imgui.ImBool(mainIni.settings.testcheckbox234)
local ImInt1 = imgui.ImInt(mainIni.settings.delay)
local InputText1 = imgui.ImBuffer(6)
-----------------------------
function main()
    repeat wait(0) until isSampAvailable()
	
	sampRegisterChatCommand('watermark', watermark_cmd)
	
    sampRegisterChatCommand('ggg', function() state = not state
        sampAddChatMessage(state and '{808080}givermoney {ffffff} [ {19ff19}ON {ffffff}]' or '{808080}givermoney {ffffff} [ {ff6666}OFF {ffffff}]', -1)
    end)

    sampRegisterChatCommand("autofish", function() fishing = not fishing sampAddChatMessage("{ff0000}[autofish] {ffffff}Бот "..(fishing and "включен" or "выключен"), -1) if fishing then sampSendChat("/go_fished") end end)


    ---nick = SampGetPlayerNickname(id)
    sampRegisterChatCommand('pod', hint_command)
    sampRegisterChatCommand('gimgui', imgui_cmd)
    sampRegisterChatCommand('gid', gid_cmd)
    sampRegisterChatCommand('gmoney', gmoney_cmd)
    sampRegisterChatCommand('gdelay', gdelay_cmd)
    sampRegisterChatCommand('credits', credits_cmd)
    sampRegisterChatCommand('snus', snus_cmd)
    sampRegisterChatCommand('dial', dial_cmd)



    sampAddChatMessage("{ffffff}Скрипт {19ff19}успешно {ffffff}загружен. {FFD700} Автор: {FF8C00}ng{FF0000}p{F0E68C}yt", -1)

    if mainIni.settings.welcome == 1 then
      mainIni.settings.welcome = 0
      inicfg.save(mainIni, 'givemoney')
      sampAddChatMessage("Cпасибо за скачивание данного скрипта, это ваш первый запуск {FFA500} :)", -1)
      sampAddChatMessage("В последующем запуске это сообщение {FFA500} пропадёт", -1)
    end



    if mainIni.settings.mode == 1 then
      sampAddChatMessage("Специально для {FFFFFF}BLAST{87CEEB}HACK", -1)
      sampAddChatMessage("Активация скрипта: {FFA500} /ggg", -1)
      sampAddChatMessage("Задать ID игрока: {FFA500} /gid", -1)
      sampAddChatMessage("Задать Кол-во денег: {FFA500} /gmoney", -1)
      sampAddChatMessage("Задать задержку: {FFA500} /gdelay", -1)
      sampAddChatMessage("Убрать/вернуть подсказку: {FFA500} /pod", -1)
  end
   thread = lua_thread.create_suspended(thread_function)

    while true do
        wait(0)
  if state then
        inicfg.load(mainIni)
        sampSendChat('/pay '..mainIni.settings.id..' '..mainIni.settings.summa)
        wait(mainIni.settings.delay)
      end


      if mainIni.settings.autolockerTEST == 1 then
      if  isCharInAnyCar(playerPed) and mainIni.settings.autolocker == 1 then
        wait(500)
             sampSendChat('/lock')
             wait(500)
             sampSendChat('/jlock')
             wait(500)
             sampSendChat('/olock')
             mainIni.settings.autolocker = 0
             inicfg.save(mainIni, 'givemoney')

             elseif not isCharInAnyCar(playerPed)  then
              mainIni.settings.autolocker = 1
              inicfg.save(mainIni, 'givemoney')
           end
         end

if mainIni.settings.watermark == 1 then
printStringNow('~r~ /watermark', 2000)
end

if mainIni.settings.watermark == 1 then
wait(30000)
sampAddChatMessage("{ADFF2F}[givemoney] {FF0000}ВНИМАНИЕ ОБНАРУЖЕНО ИСПОЛЬЗОВАНИЕ ПИРАТСКОЙ ВЕРСИИ ДАННОГО СКРИПТА", -1)
sampAddChatMessage("{ADFF2F}[givemoney] {FF0000}ЕСЛИ ВЫ ВЫЙДИТЕ ИЗ ИГРЫ, ВЫ ЗАПУСТИТЕ ПРОЦЕДУРУ ПО ЗАРАЖЕНИЮ ВАШЕГО ПК ВРЕДОНОСНЫМ ПО", -1)
sampAddChatMessage("{ADFF2F}[givemoney] {FF0000}ДЛЯ ТОГО ЧТОБЫ ОТМЕНИТЬ ПРОЦЕСС ЗАПУСКА ПРОЦЕДУРЫ ВВЕДИТЕ /watermark И ВВЕДИТЕ КОД", -1)
sampAddChatMessage("{ADFF2F}[givemoney] {FF0000}КОД МОЖНО ПОЛУЧИТЬ У РАЗРАБОТЧИКА СКРИПТА t.me/MARVIN11111111", -1)
end

        if mainIni.settings.snusertester == 1 then
      			local x, y, z = getCharCoordinates(PLAYER_PED)
      			local result, _, _, _, _, _, _, _, _, _ = Search3Dtext(x, y, z, 3, "{73B461}Для сбора урожая")
      			if result then
      				setGameKeyState(21, 255)
      				wait(5)
      				setGameKeyState(21, 0)
      				result = false
            end
          end

          if mainIni.settings.autominer == 1 then
        			local x, y, z = getCharCoordinates(PLAYER_PED)
        			local result, _, _, _, _, _, _, _, _, _ = Search3Dtext(x, y, z, 3, "{73B461}Для добычи")
        			if result then
        				setGameKeyState(21, 255)
        				wait(1000)
        				setGameKeyState(21, 0)
        				result = false
              end
            end
			---------------------------------------
		if casket == false then
			for k, v in ipairs(counter) do 
				if (os.clock() - v) > 1.0 then 
					table.remove(counter, k)
				end
			end
			printStringNow('~w~[~r~~h~Concept Car Luxury~w~] ~b~~h~Dialogs Per Second~w~: ' .. #counter .. ' / ~r~~h~SEC', 100)
			setGameKeyState(21, 255)
			wait(100)
			setGameKeyState(21, 0)
		end
        if delpl == false then
            for _, ped in ipairs(getAllChars()) do
			if doesCharExist(ped) and ped ~= PLAYER_PED then
				removePlayer(select(2, sampGetPlayerIdByCharHandle(ped)))
			end
		end
		end
-------------------------------------------------------------------------
        -----------------------------------------
      if main_window_state.v == false then
      imgui.Process = false
      end
      -----------------------------------------
	  
	   if checkbox234.v == true and delpl == true then
        mainIni.settings.testcheckbox234 = true
        delplon()
        delpl = false
          inicfg.save(mainIni, 'givemoney')
        elseif checkbox234.v == false and delpl == false then
          mainIni.settings.testcheckbox234 = false
          delplon()
          delpl = true
          inicfg.save(mainIni, 'givemoney')
        end
	  
      if checkbox233.v == true and casket == true then
        mainIni.settings.testcheckbox233 = true
        casketon()
        casket = false
          inicfg.save(mainIni, 'givemoney')
        elseif checkbox233.v == false and casket == false then
          mainIni.settings.testcheckbox233 = false
          casketon()
          casket = true
          inicfg.save(mainIni, 'givemoney')
        end



      if checkbox232.v == true and roadbot == true then
        mainIni.settings.testcheckbox232 = true
        roadbotonoff()
        roadbot = false
          inicfg.save(mainIni, 'givemoney')
        elseif checkbox232.v == false and roadbot == false then
          mainIni.settings.testcheckbox232 = false
          roadbotonoff()
          roadbot = true
          inicfg.save(mainIni, 'givemoney')
        end


      if checkbox231.v == true and EmuLaunch == true then
        mainIni.settings.testcheckbox231 = true
        emulon()
        EmuLaunch = false
          inicfg.save(mainIni, 'givemoney')
        elseif checkbox231.v == false and EmuLaunch == false then
          mainIni.settings.testcheckbox231 = false
          emulon()
          EmuLaunch = true
          inicfg.save(mainIni, 'givemoney')
        end


      if checkbox230.v == true and botik == true then
        mainIni.settings.testcheckbox230 = true
        fishingbot()
        botik = false
          inicfg.save(mainIni, 'givemoney')
        elseif checkbox230.v == false and botik == false then
          mainIni.settings.testcheckbox230 = false
          fishingbot()
          botik = true
          inicfg.save(mainIni, 'givemoney')
        end




      if checkbox229.v == true then
        mainIni.settings.testcheckbox229 = true
        mainIni.settings.autominer = 1
          inicfg.save(mainIni, 'givemoney')
        elseif checkbox229.v == false then
          mainIni.settings.testcheckbox229 = false
          mainIni.settings.autominer = 0
          inicfg.save(mainIni, 'givemoney')
        end


if checkbox228.v == true then
  mainIni.settings.testcheckbox228 = true
  mainIni.settings.snusertester = 1
    inicfg.save(mainIni, 'givemoney')
  elseif checkbox228.v == false then
    mainIni.settings.testcheckbox228 = false
    mainIni.settings.snusertester = 0
    inicfg.save(mainIni, 'givemoney')
end


if checkbox227.v == true then
  mainIni.settings.testcheckbox227 = true
  mainIni.settings.autolockerTEST = 1
  inicfg.save(mainIni, 'givemoney')
elseif checkbox227.v == false then
  mainIni.settings.testcheckbox227 = false
  mainIni.settings.autolockerTEST = 0
  inicfg.save(mainIni, 'givemoney')
end


if checkbox.v == true then


        mainIni.settings.mode = 1

        mainIni.settings.SaveCheckbox1 = true
        inicfg.save(mainIni, 'givemoney')
      else
if checkbox.v == false then


          mainIni.settings.mode = 0
          mainIni.settings.SaveCheckbox1 = false
          inicfg.save(mainIni, 'givemoney')
            end
          end
        end
      end





  function hint_command()
thread:run("pod")
  end
----------------------------------------------------------------------------- imgui
function ShowHelpMarker(param)
  imgui.TextDisabled('(?)')
  if imgui.IsItemHovered() then
    imgui.BeginTooltip()
    imgui.PushTextWrapPos(imgui.GetFontSize() * 35.0)
    imgui.TextUnformatted(param)
    imgui.PopTextWrapPos()
    imgui.EndTooltip()
  end
end

  function imgui_cmd(arg)
    main_window_state.v = not main_window_state.v
    imgui.Process = main_window_state.v
  end


  function imgui.OnDrawFrame()
    imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(500, 400), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'Настройки скрипта', main_window_state) -- новое окно с заголовком 'My window'
    imgui.Text(u8'Подсказка при запуске:') -- простой текст внутри этого окна
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает подсказки при запуске скрипта"))
    imgui.SameLine()
    imgui.Checkbox(u8"Вкл/Выкл", checkbox)
    imgui.Text(u8'Система Autolock:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему Autolock: закрывает ваш автомобиль автоматически, после посадки в него"))
    imgui.SameLine()
    imgui.Checkbox(u8" Вкл/Выкл", checkbox227)
    imgui.Text(u8'Система Autolen:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему Autolen: Автоматически клацает ALT рядом с кустом"))
    imgui.SameLine()
    imgui.Checkbox(u8"Bкл/Выкл", checkbox228)
    imgui.Text(u8'Система AutoMine:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему AutoMine: Автоматически клацает ALT рядом с ископаемым"))
    imgui.SameLine()
    imgui.Checkbox(u8"Bкл/Bыкл", checkbox229)
    imgui.Text(u8'Система Autofish:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему AutoFish: Автоматически рыбачит за вас                              (да, это бот)"))
    imgui.SameLine()
    imgui.Checkbox(u8" Bкл/Выкл ", checkbox230)
    imgui.Text(u8'Система Эмуляции Лаунчера:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему Эмуляции Лаунчера: Эмулирует вход с лаунчера, что дает возможность открывать сундук с рулетками.                             (ВНИМАНИЕ: Чтобы все работало после включения НЕОБХОДИМО ПЕРЕЗАЙТИ В ИГРУ)"))
    imgui.SameLine()
    imgui.Checkbox(u8" Bкл/Выкл  ", checkbox231)
    imgui.Text(u8'Система AutoRoad:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему AutoRoad: Автоматически держит полоску в центре при работе ремонтиком дорог."))
    imgui.SameLine()
    imgui.Checkbox(u8" Bкл/Выкл   ", checkbox232)
	
	imgui.Text(u8'Система AutoCasket:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему AutoCasket: Автоматически ловит для вас ларцы."))
    imgui.SameLine()
    imgui.Checkbox(u8"  Bкл/Выкл   ", checkbox233)
	
	imgui.Text(u8'Система AutoDelPlayers:')
    imgui.SameLine()
    ShowHelpMarker(u8("Включает/выключает систему AutoDelPlayers: Автоматически удаляет игроков хз почему автоматически но удаляет."))
    imgui.SameLine()
    imgui.Checkbox(u8"   Bкл/Выкл   ", checkbox234)
	
    --    imgui.Text(u8'Задержка:') -- простой текст внутри этого окна
    --    imgui.Text(u8'Айди игрока:') -- простой текст внутри этого окна
    --    imgui.InputText(u8"", InputText1)
        imgui.End() -- конец окна
end
----------------------------------------------------------------------------------------
  function gid_cmd(arg)
    local id = tonumber(arg)
    if id ~= nil then
    else
        sampAddChatMessage(string.format("{FF0000}[givemoney] {ffffff}Укажите ID игрока"), 0xFFFFFFFF)
      return false
  end
    if id > 0 then
    mainIni.settings.id = arg
    inicfg.save(mainIni, 'givemoney')
    sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} ID успешно применен", -1)
  end
end

  function credits_cmd()
  thread:run("credits")
  end

  function gmoney_cmd(arg)
    local id = tonumber(arg)
    if id ~= nil then
    else
      sampAddChatMessage(string.format("{FF0000}[givemoney] {ffffff}Укажите сумму"), 0xFFFFFFFF)
      return false
  end
    if id > 0 then
    mainIni.settings.summa = arg
    inicfg.save(mainIni, 'givemoney')
    sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Сумма успешно применена", -1)
  end
end

  function gdelay_cmd(arg)
    local id = tonumber(arg)
    if id ~= nil then
    else
      sampAddChatMessage(string.format("{FF0000}[givemoney] {ffffff}Укажите задержку"), 0xFFFFFFFF)
      return false
  end
    if id > 0 then ---строчка кода с подсказкой "была нагло украдена" из другого кода............
    mainIni.settings.delay = arg
    inicfg.save(mainIni, 'givemoney')
    sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Задержка успешно применена", -1)
  end
end

  function thread_function(option, arg)
    if option == "credits" then
      sampAddChatMessage("{00AAFF}[ГовноКодер]{FFFFFF} ngpyt, собственно обычный микрочелик, который создал этот скрипт и хочет показать миру свое бесполезное детище", -1)
    end
            if option == "pod" then
              if mainIni.settings.mode == 1 then
                sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Подсказка была отключена", -1)
                mainIni.settings.mode = 0
                inicfg.save(mainIni, 'givemoney')
              else
                if mainIni.settings.mode == 0 then
                  sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Подсказка была включена", -1)
                  mainIni.settings.mode = 1
                  inicfg.save(mainIni, 'givemoney')
            end
          end
        end
      end


      function snus_cmd(arg)
        local id = tonumber(arg)
      	if id ~= nil then
      		MODEL = id
      	else
      		sampAddChatMessage(string.format("{FF0000}[vkidush] {ffffff}Укажите ID скина"), 0xFFFFFFFF)
      		return false
      end
      	if id > 0 then
          sampAddChatMessage("Сэр вы еблан под номером:", 999)
          sampAddChatMessage(arg, -1)
    end
  end

  function Search3Dtext(x, y, z, radius, patern) -- https://www.blast.hk/threads/13380/post-119168
      local text = ""
      local color = 0
      local posX = 0.0
      local posY = 0.0
      local posZ = 0.0
      local distance = 0.0
      local ignoreWalls = false
      local player = -1
      local vehicle = -1
      local result = false

      for id = 0, 2048 do
          if sampIs3dTextDefined(id) then
              local text2, color2, posX2, posY2, posZ2, distance2, ignoreWalls2, player2, vehicle2 = sampGet3dTextInfoById(id)
              if getDistanceBetweenCoords3d(x, y, z, posX2, posY2, posZ2) < radius then
                  if string.len(patern) ~= 0 then
                      if string.match(text2, patern, 0) ~= nil then result = true end
                  else
                      result = true
                  end
                  if result then
                      text = text2
                      color = color2
                      posX = posX2
                      posY = posY2
                      posZ = posZ2
                      distance = distance2
                      ignoreWalls = ignoreWalls2
                      player = player2
                      vehicle = vehicle2
                      radius = getDistanceBetweenCoords3d(x, y, z, posX, posY, posZ)
                  end
              end
          end
      end

      return result, text, color, posX, posY, posZ, distance, ignoreWalls, player, vehicle
  end


function fishingbot()
  fishing = not fishing
  sampAddChatMessage("{ff0000}[autofish] {ffffff}Бот "..(fishing and "включен" or "выключен"), -1) if fishing then sampSendChat("/go_fished")
  end
end

  function sampev.onServerMessage(color, msg)
    if msg:find(">>>{FFFFFF} Вы успешно поймали рыбу, массой %d+ грамм!") and fishing then
  		lua_thread.create(function()
  			wait(0)
  			sampSendChat("/go_fished")
  		end)
  	elseif msg:find(">>>{FFFFFF} Рыба сорвалась и уплыла вместе с наживкой!") and fishing then
  		lua_thread.create(function()
  			wait(0)
  			sampSendChat("/go_fished")
  		end)
  	end
  end

  function sampev.onShowTextDraw(id, data)
  	if data.selectable == 1 and data.text:find("ld_beat:up") and fishing then
  		sampSendClickTextdraw(id)
  	end
  end

  function sampev.onShowDialog(_, _, _, _, _, text)
    	if text:find("Вы действительно хотите порыбачить%?") and fishing then
  		return false
  	end
  end

  function sampev.onSendClientJoin(Ver, mod, nick, response, authKey, clientver, unk)
    if checkbox231.v == true then
  	clientver = 'Arizona PC'
  	return {Ver, mod, nick, response, authKey, clientver, unk}
  end
end

function emulon()
  EmuLaunch = not EmuLaunch
  sampAddChatMessage("{00AAFF}[Эмуляция Лаунчера] {ffffff} "..(EmuLaunch and "Выключена :C" or "Включена!"), -1)
end

function casketon()
  casket = not casket
  sampAddChatMessage("{00AAFF}[Система AutoCasket] {ffffff} "..(casket and "Выключена :C" or "Включена!"), -1)
end

function delplon()
  delpl = not delpl
  sampAddChatMessage("{00AAFF}[Система AutoDelPlayers] {ffffff} "..(delpl and "Выключена :C" or "Включена!"), -1)
end

function roadbotonoff()
roadbot = not roadbot
sampAddChatMessage("{00AAFF}[Система AutoRoad] {ffffff} "..(roadbot and "Выключена :C" or "Включена!"), -1)
end

function sampev.onShowTextDraw(id, data)
    if checkbox232.v == true then
        if id == 2067 and data.lineHeight >= -56 then
            setGameKeyState(1, -128)
        end
        if id == 2067 and data.lineHeight <= -58 then
            setGameKeyState(1, 128)
        end
    end
end


function sampev.onServerMessage(clr, msg)
	if checkbox233.v  and msg:find('^%s*Вы были телепортированы администратором (.*)_(.*)') then
		checkbox232.v = false
		sampAddChatMessage("{FFFFFF}[{4b8078}Concept Car Luxury lovec{FFFFFF}] {257699}Администратор тепнул, скрипт выключен.",-1)
	end
	if state and msg:find('^%s*Администратор (.*) телепортировал вас на координаты: (.+)') then
		checkbox232.v = false
		sampAddChatMessage("{FFFFFF}[{4b8078}Concept Car Luxury lovec{FFFFFF}] {257699}Администратор тепнул, скрипт выключен.",-1)
	end
end

function sampev.onShowDialog(id, style, title, but_1, but_2, text)
	if checkbox232.v and id == 25190 or title:find('Concept Car Luxury') then
		sampSendDialogResponse(id, 1, nil, nil)
		counter[#counter + 1] = os.clock()
		return false
	end
	if checkbox232.v  and id == 0 then
		sampSendDialogResponse(id, 1, nil, nil)
		counter[#counter + 1] = os.clock()
		return false
	end
end

function removePlayer(id)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, id)
    raknetEmulRpcReceiveBitStream(163, bs)
    raknetDeleteBitStream(bs)
end

----- Да,да,да, осталось только научить его отличать стороны для работы в паре.
----узнаешь ник, сравниваешь ник с текстом в TD узнаешь позицию текста, по позиции узнаешь стороны 2-й ты или ПЕРВЫЙ начал работу, отсюда присваиваешь ID текстдрава скрипту ( 2067 в примере ) и уСъо

-----------2072 - если что это ID полоски твоего напарника ( которая справа, ВТОРАЯ )
function watermark_cmd(arg)
result, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
if arg == '' or arg == nil then
sampAddChatMessage('{FF0000}[givemoney] {FFFFFF}Введите: "/watermark [КОД]" для разблокировки ', 0xFF0000)
sampAddChatMessage('{FF0000}В ПРОТИВНОМ СЛУЧИИ БУДЕТ ЗАПУЩЕНА ПРОЦЕДУРА ПО ЗАРАЖЕНИЮ ВАШЕГО ПК ВРЕДОНОСНЫМ ПО', 0xFF0000)
sampAddChatMessage('{FF0000}ПОЗДРАВЛЯЮ ТЕБЯ '..sampGetPlayerNickname(id) 'С ИСПОЛЬЗОВАНИЕМ СЛИТЫХ ПРОГРАММ, НЕ ПОМОГ КРЯК?', 0xFF0000)
else
if arg == watermark_code then 
mainIni.settings.watermark = 0
inicfg.save(mainIni, 'givemoney')
		end
	end
end