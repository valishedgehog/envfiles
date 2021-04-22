# Заметки для Windows 10

## Разрешить исполнение скриптов
Нужно, например, для виртуальных окружений в python. Запустить в Powershell:
```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

## Ограничить использование памяти виртуальной машиной Linux
Возможно, будут проблемы с docker, тогда лимит нужно увеличить. Скопировать ```windows/.wslconfig``` в домашнюю папку пользователя

## Winget
Скопировать файл настроек ```windows/winget-settings.json``` по пути
```
%LOCALAPPDATA%\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json
```

Ссылка на документацию: [клац](https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md)

## Настройка Elantech тачпада
Включаем имитацию правой кнопки мыши на двойной клик

```Win + R``` => ```regedit```

Находим путь ```HKEY_CURRENT_USER\SOFTWARE\Elantech\SmartPad```

```
Tap_Two_Finger = 1
Tap_Two_Finger_Enable = 1
```

!НЕ НАЖИМАЯ ПРАВУЮ КНОПКУ! перезагружаемся

Для улучшения позиционирования курсора:

Параметры => Устройства => Сенсорная панель => Дополнительные параметры => Параметры указателя => убираем галочку "Включить повышенную точность установки указателя"

## Полезные ссылки
- [Windows Packet Manager (winget)](https://github.com/microsoft/winget-cli)
- [Win10Tweaker](https://win10tweaker.pro/)
