script_author('ngpyt')
script_version('v0.1')

local sampev = require("lib.samp.events")
local keys = require "vkeys"  
local inicfg = require 'inicfg'
require("moonloader")

local run_fastID = false
local random_taxi =  {
    '1000,Автопилот',
    '1000,Би-Би',
    '1000,Бибика',
    '1000,Важная персона',
    '1000,Каретный Двор',
    '1000,Кар-Мен',
    '1000,Клаксон',
    '1000,Командир',
    '1000,Крылатое такси',
    '1000,Мигом',
    '1000,Автопилот',
    '1000,Би-Би',
    '1000,Бибика',
    '1000,Важная персона',
    '1000,Каретный Двор',
    '1000,Кар-Мен',
    '1000,Клаксон',
    '1000,Командир',
    '1000,Крылатое такси',
    '1000,Мигом',
    '1000,888',
    '1000,Cabby',
    '1000,Taxi-City',
    '1000,XXL-Taxi',
    '1000,Авантаж',
    '1000,Авантайм',
    '1000,Автоград',
    '1000,Автокаприз',
    '1000,Автокипер',
    '1000,Автолига',
    '1000,Автомиг',
    '1000,Авторитет',
    '1000,Автосфера',
    '1000,Агат',
    '1000,Алло Такси',
    '1000,Альянс',
    '1000,Амиго',
    '1000,Ангел',
    '1000,Апельсин',
    '1000,Арго',
    '1000,Арго',
    '1000,Б-52',
    '1000,Банзай',
    '1000,Белый барс',
    '1000,Бизнес класс',
    '1000,Бистро',
    '1000,Блиц',
    '1000,Бонус',
    '1000,Браво',
    '1000,Бумер',
    '1000,Бумеранг',
    '1000,Вираж',
    '1000,Витязь',
    '1000,Время',
    '1000,Выездной НН',
    '1000,Гагарин',
    '1000,Гарант',
    '1000,Город',
    '1000,Город дорог',
    '1000,Городское такси',
    '1000,Городской дельфин',
    '1000,Гранд',
    '1000,Гранд-Авто',
    '1000,Дальняя дорога',
    '1000,Движок',
    '1000,Двоечки',
    '1000,Дельфин',
    '1000,Джет',
    '1000,Джокер',
    '1000,Дисконт',
    '1000,Друзья',
    '1000,Европа',
    '1000,Евростандарт',
    '1000,Желтое такси',
    '1000,Женское такси',
    '1000,Звезда',
    '1000,Зебра',
    '1000,Зеленое такси',
    '1000,Зеленый свет',
    '1000,Золотая Миля',
    '1000,Золотое Колесо',
    '1000,Извозчик',
    '1000,Империал',
    '1000,Кабриолет',
    '1000,Караван',
    '1000,Кардинал',
    '1000,Карета',
    '1000,Карлсон',
    '1000,Каскад',
    '1000,Классик',
    '1000,Комфорт',
    '1000,Кортеж',
    '1000,Круиз',
    '1000,Кэб',
    '1000,Лада',
    '1000,Ладья',
    '1000,Лайф',
    '1000,Лама',
    '1000,Ласточка',
    '1000,Лидер',
    '1000,Лохматое такси',
    '1000,Малина',
    '1000,Мегаполис',
    '1000,Мерин',
    '1000,Миг',
    '1000,Миледи',
    '1000,Мираж',
    '1000,Молния',
    '1000,Мостакси',
    '1000,Мотор',
    '1000,Навигатор',
    '1000,Народное такси',
    '1000,Настроение',
    '1000,Новая волна',
    '1000,Новая Дорога',
    '1000,Новое желтое такси',
    '1000,Ноль Семь',
    '1000,НонСтоп',
    '1000,Ночной ангел',
    '1000,Огонек',
    '1000,Олимп',
    '1000,От заката до рассвета',
    '1000,Пантера',
    '1000,Партнер',
    '1000,Пегас',
    '1000,Пилигрим',
    '1000,Пилот',
    '1000,Пионер',
    '1000,Питерский Извозчикъ',
    '1000,Попутка',
    '1000,Попутчик',
    '1000,Престиж',
    '1000,Приз',
    '1000,Пчелка',
    '1000,Пятачок',
    '1000,Пятница',
    '1000,Радуга',
    '1000,Рандеву',
    '1000,Регата',
    '1000,Рикша',
    '1000,Ритм',
    '1000,Родное такси',
    '1000,Родные просторы',
    '1000,Рубин',
    '1000,Русское такси',
    '1000,Савелич',
    '1000,Свежий Ветер',
    '1000,Свободное такси',
    '1000,Семёрочка',
    '1000,Семь Верст',
    '1000,Семь Ветров',
    '1000,Семь дорог',
    '1000,Симбирский экспресс',
    '1000,Сити Драйв',
    '1000,СкаZка',
    '1000,Снежок',
    '1000,Солнышко',
    '1000,Сотая миля',
    '1000,Соточка',
    '1000,Союз',
    '1000,Спринт',
    '1000,Спутник',
    '1000,Старое такси',
    '1000,Столичный Экспресс',
    '1000,Стрекоза',
    '1000,Стрела',
    '1000,СыктывCAR',
    '1000,Такса',
    '1000,Таксан',
    '1000,Такси 777',
    '1000,Такси 956',
    '1000,Такси без пробок',
    '1000,Такси Близко',
    '1000,Такси Блюз',
    '1000,Такси Лайн',
    '1000,Такси-Вояж',
    '1000,Таксик',
    '1000,Такси-Лайт',
    '1000,Таксити',
    '1000,Таксовичкоф',
    '1000,Тачка',
    '1000,Три десятки',
    '1000,Три пятерки',
    '1000,Три семерки',
    '1000,Тройка',
    '1000,Удача',
    '1000,Улитка',
    '1000,Ультра',
    '1000,Ультра',
    '1000,Фаворит',
    '1000,Фаэтон',
    '1000,Флай',
    '1000,Формула такси',
    '1000,Форсаж',
    '1000,Фортуна',
    '1000,Цель',
    '1000,Чайка',
    '1000,Час пик',
    '1000,Черепаха',
    '1000,Черепашка',
    '1000,Шансон',
    '1000,Экипаж',
    '1000,Эконом',
    '1000,Эконом-Авто',
    '1000,Эскорт',
    '1000,Эталон',
    '1000,Эх, прокачу!',
    '1000,Юнис-Лада',
    '1000,Ягуар',
    '1000,Ямщик',
    '1000,Такси "Влад Стримит"'
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
        sampAddChatMessage("{FFD700}[Подсказка]: "..(mainIni.settings.tip and "{19ff19}Включена" or "{ff0000}Выключена"), -1)
		inicfg.save(mainIni, 'phone')
		end)
	
		sampRegisterChatCommand("pmode", function() 
        mainIni.settings.mode = not mainIni.settings.mode
        sampAddChatMessage("{FFD700}[Режим Генератора]: "..(mainIni.settings.mode and "{19ff19}Рандом" or "{ff0000}Ручной"), -1)
		sampAddChatMessage("{FFD700}[Режим Генератора]:{FF0000} Чтобы изменения вступили в силу перезагрузите игру. ( или скрипт с помощью CTRL + R", -1)
		inicfg.save(mainIni, 'phone')
		end)
		
		
     sampRegisterChatCommand("ptax", function() 
        mainIni.settings.ptax = not mainIni.settings.ptax
        sampAddChatMessage("{FFD700}[Автоматическое название такси]: "..(mainIni.settings.ptax and "{19ff19}Включено" or "{ff0000}Выключено"), -1)
		inicfg.save(mainIni, 'phone')
		end)
	
	
	
	sampRegisterChatCommand('taxname', function(arg)
		if arg == '' or arg == nil then
			sampAddChatMessage('{FF0000}[ptax] {FFFFFF}Введите: "/taxname Тариф,Название Такси" ', 0xFF0000)
		else
			sampAddChatMessage('{FF0000}[ptax] {FFFFFF}Название успешно применено, обязательно убедитесь что сделали по образцу', 0xFF0000)
			mainIni.settings.ptaxname = arg
			inicfg.save(mainIni, 'phone')
		end
	end)
	
	
	
	
	if mainIni.settings.tip == true then
	sampAddChatMessage("{ffffff}Скрипт {19ff19}успешно {ffffff}загружен. {FFD700} Автор: {FF8C00}ng{FF0000}p{F0E68C}yt ", -1)
	sampAddChatMessage("{ffffff} ALT + ^{F0E68C}  - Открыть телефон ", -1)
	sampAddChatMessage("{ffffff}/ptip{F0E68C}        - Вкл/Выкл подсказку при запуске ", -1)
	sampAddChatMessage("{ffffff}/ptax{F0E68C}       - Вкл/Выкл Автоматическое название такси ", -1)
	sampAddChatMessage("{ffffff}/taxname{F0E68C} - Установить тариф и название такси ", -1)
	sampAddChatMessage("{ffffff}/pmode{F0E68C}    - Изменить режим генератора такси ", -1)
	end
while true do
    wait(0)

        if isKeyDown(VK_MENU) and isKeyJustPressed(VK_UP) then
            sampSendChat("/phone")
        end
    end
end

function phoneoff()
sampAddChatMessage("{ffffff}Выполнено {19ff19}успешно. {ffffff}", -1)
mainIni.settings.tip = 0
inicfg.save(mainIni, 'phone')
end


function phoneon()
sampAddChatMessage("{ffffff}Выполнено {19ff19}успешно. {ffffff}", -1)
mainIni.settings.tip = 1
inicfg.save(mainIni, 'phone')
end


--function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	--if dialogId == 281 and text:find("Стоимость аренды")and mainIni.settings.ptax == true then
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