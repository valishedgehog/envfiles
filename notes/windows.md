# Заметки для Windows 10

## Разрешить исполнение скриптов
Нужно, например, для виртуальных окружений в python. Запустить в Powershell:
```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

## Ограничить использование памяти виртуальной машиной Linux
Возможно, будут проблемы с docker, тогда лимит нужно увеличить. Скопировать ```windows/.wslconfig``` в домашнюю папку пользователя

## Полезные ссылки
- [Windows Packet Manager (winget)](https://github.com/microsoft/winget-cli)
- [Win10Tweaker](https://win10tweaker.pro/)
