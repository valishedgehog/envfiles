# Ломаем SSL Pinning на Android приложениях

## Зависимости
- Java JRE 8+
- apktool
- adb
- frida-tools
- zipalign
- unxz

Для Ubuntu:
```
sudo apt install apktool adb zipalign openjdk-14-jre unxz -y
sudo pip3 install frida-tools
```

## Инструкции
1) Скачиваем .apk версию приложения под свой телефон (например с https://trashbox.ru/)

2) Декомпилируем его без распаковки ресурсов
```
apktool d -r [APK_FILE] -o target
```

3) Скачиваем ```frida-gadget``` с https://github.com/frida/frida/releases под свою архитектуру
```
wget https://github.com/frida/frida/releases/download/14.2.13/frida-gadget-14.2.13-android-arm64.so.xz
unxz frida-gadget-14.2.13-android-arm64.so.xz
```

4) Копируем ```frida-gadget``` в папку с библиотеками декомпилированного apk под свою архитектуру

Нужной папки может не быть, но ее можно создать, должно сработать

```
cp ./frida-gadget-14.2.13-android-arm64.so ./target/lib/arm64-v8a/libfrida-gadget.so
```

5) Меняем ```MainActivity``` приложений

Находим через манифест приложения или с помощью ```grep -rn MainActivity``` файл, в котором лежит MainActivity (расширения _.smali_)

Если нет такого класса, придется искать точку входа вручную

В найденном файле находим ```.method constructor <init>``` и перед ```return``` вставляем следующие строки

```
    ....
    
    # Frida-Gadget server
    const-string v0, "frida-gadget"
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method
```

6) Собираем назад апкашку

```
apktool b target
```

7) Выравниваем и подписываем новую

https://github.com/patrickfav/uber-apk-signer

```
wget https://github.com/patrickfav/uber-apk-signer/releases/download/v1.2.1/uber-apk-signer-1.2.1.jar
java -jar ./uber-apk-signer-1.2.1.jar -a ./target/dist/*.apk
```

8) Устанавливаем пропатченное приложение

Получили в папке /target/dist apk файл с суффиксом ```aligned-debugSigned```

Подключаем телефон в режиме разработчика, проверяем что adb его видит и устанавливаем приложение

```
adb install -r ./target/dist/[НАЗВАНИЕ]-aligned-debugSigned.apk
```

9) Запускаем хук фриды

При запуске приложения оно может зависнуть на некоторое время, если некоторое время длится долго, делаем

```
frida -U Gadget
```

Внутри вписываем exit и выходим из фриды. Если ошибок не было - все сработало

Скачиваем код хука отсюда https://codeshare.frida.re/@akabe1/frida-multiple-unpinning/

Сохраняем в файл ```hook.js``` и запускаем

```
frida -U -l hook.js Gadget
```

Если хоть где то сообщение без pinner not found, то все прошло успешно и можно снифить траффик

Если не сработает этот, то 
- https://codeshare.frida.re/@sowdust/universal-android-ssl-pinning-bypass-2/
- https://codeshare.frida.re/@owen800q/okhttp3-interceptor/
