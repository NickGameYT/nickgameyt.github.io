script_author('ngpyt')
script_version('v1.0')

local sampev = require("lib.samp.events")
local inicfg = require 'inicfg'
require("moonloader")
local act
local mainIni = inicfg.load({
  settings =
  {
    id = 50,
    summa = 50000,
    mode = 1,
    delay=30000
  }
    }, 'givemoney')

function main()
    repeat wait(0) until isSampAvailable()
    sampRegisterChatCommand('ggg', function() state = not state
        sampAddChatMessage(state and '{808080}givermoney {ffffff} [ {19ff19}ON {ffffff}]' or '{808080}givermoney {ffffff} [ {ff6666}OFF {ffffff}]', -1)
    end)
    sampRegisterChatCommand('pod', hint_command)
    sampRegisterChatCommand('gsettings', settings_cmd)
    sampRegisterChatCommand('gid', gid_cmd)
    sampRegisterChatCommand('gmoney', gmoney_cmd)
    sampRegisterChatCommand('gdelay', gdelay_cmd)
    sampRegisterChatCommand('credits', credits_cmd)
    sampAddChatMessage("{ffffff}Скрипт {19ff19}успешно {ffffff}загружен. {FFD700} Автор: {FF8C00}ng{FF0000}p{F0E68C}yt", -1)
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
      end
    end


  function hint_command()
thread:run("pod")
  end

  function gid_cmd(arg)
thread:run("gid", arg)
  end

  function credits_cmd()
  thread:run("credits")
  end

  function gmoney_cmd(arg)
  thread:run("gmoney", arg)
  end

  function gdelay_cmd(arg)
  thread:run("gdelay", arg)
  end

  function thread_function(option, arg)
    if option == "gdelay" then
      mainIni.settings.delay = arg
      inicfg.save(mainIni, 'givemoney')
      sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Задержка успешно применена", -1)
    end
    if option == "credits" then
      sampAddChatMessage("{00AAFF}[ГовноКодер]{FFFFFF} ngpyt, собственно обычный микрочелик, который создал этот скрипт и хочет показать миру свое бесполезное детище", -1)
    end
    if option == "gid" then
      mainIni.settings.id = arg
      inicfg.save(mainIni, 'givemoney')
      sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} ID успешно применен", -1)
    end
    if option == "gmoney" then
      mainIni.settings.summa = arg
      inicfg.save(mainIni, 'givemoney')
      sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Сумма успешно применена", -1)
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
