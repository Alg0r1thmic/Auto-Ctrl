# Auto-Ctrl Project
Proyecto de Sistemas operativos


# Login
![alt text](https://github.com/RaulToto/Auto-Ctrl/blob/master/Auto-Ctrl/images/login.png)

# Instalar Qt en Ubuntu 18.4
-descargar qt de la siguiente pagina : 
#### link de la pagina
```shell
https://www.qt.io/download-qt-installer
```
-en la carpeta donde se descargo qt poner el siguiente comando 

```shell
chmod +x qt-unified-linux-x64-3.0.5-online.run 
```
qt-unified-linux-x64-3.0.5-online.run es la el archivo que se descargo

-seleccionar de preferencia las siguientes paquetes al instalar 
![alt text](https://github.com/RaulToto/Auto-Ctrl/blob/master/Auto-Ctrl/images/intalacionqt.png)

-luego de instalar Qt se debe instalar las siguientes dependencias
```shell
sudo apt-get install build-essential
```

```shell
sudo apt-get install libx11-xcb-dev libglu1-mesa-dev
```

En el proyecto se usa conexion a la base de datos mysql en mi caso estoy usando el xampp

https://www.apachefriends.org/es/download_success.html

en Qt suele ocurrir el error de driver not load para solucionar el problema me  base en el siguiente tutorial
https://stackoverflow.com/questions/14667768/qmysql-driver-available-but-not-loaded


