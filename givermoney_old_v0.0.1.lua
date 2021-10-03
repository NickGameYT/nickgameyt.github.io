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
    mode = 1
  }
    }, 'givemoney')
function main()
    repeat wait(0) until isSampAvailable()
    sampRegisterChatCommand('ggg', function() state = not state
        sampAddChatMessage(state and '{808080}givermoney {ffffff} [ {19ff19}ON {ffffff}]' or '{808080}givermoney {ffffff} [ {ff6666}OFF {ffffff}]', -1)
    end)
    sampRegisterChatCommand('pod', hint_command)
    sampAddChatMessage("{ffffff}Ñêðèïò {19ff19}óñïåøíî {ffffff}çàãðóæåí. {FFD700} Àâòîð: {FF8C00}ng{FF0000}p{F0E68C}yt", -1)
    if mainIni.settings.mode == 1 then
	  sampAddChatMessage("Ñïåöèàëüíî äëÿ {FFFFFF}BLAST{87CEEB}HACK", -1)
    sampAddChatMessage("Àêòèâàöèÿ ñêðèïòà: {FFA500} /ggg", -1)
    sampAddChatMessage("Óáðàòü/âåðíóòü ïîäñêàçêó: {FFA500} /pod", -1)
  end

    while true do
        wait(0)
	if state then
        inicfg.load(mainIni)
        sampSendChat('/pay '..mainIni.settings.id..' '..mainIni.settings.summa)
        wait(30000)
				end

        function hint_command()
          if mainIni.settings.mode == 1 then
            sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Ïîäñêàçêà áûëà îòêëþ÷åíà", -1)
            mainIni.settings.mode = 0
            inicfg.save(mainIni, 'givemoney')
          else
            sampAddChatMessage("{00AAFF}[givemoney]{FFFFFF} Ïîäñêàçêà áûëà âêëþ÷åíà", -1)
            mainIni.settings.mode = 1
            inicfg.save(mainIni, 'givemoney')
        end
			end
    end
end
