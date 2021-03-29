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

## Полезные ссылки
- [Windows Packet Manager (winget)](https://github.com/microsoft/winget-cli)
- [Win10Tweaker](https://win10tweaker.pro/)
