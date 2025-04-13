# 🎓 Herramienta de Proyección Educativa con SCRCPY

### 🚀 Proyecto educativo desarrollado por: **Ing. César Pineda**
**Centro de Educación Virtual, UNAH - Campus Copán**

---

## 📌 ¿Qué es esta herramienta?

Este proyecto es una utilidad automatizada para docentes que usan celulares Android en el aula. A través de un menú interactivo en Windows, permite:

- Proyectar la pantalla del celular (USB o Wi-Fi)
- Controlar el celular desde la PC
- Grabar lo que se visualiza (clases, explicaciones, demostraciones)
- Apagar la pantalla del celular para ahorrar batería
- Usar ventana flotante sin bordes para presentaciones limpias

Está basado en la potente herramienta libre **[scrcpy](https://github.com/Genymobile/scrcpy)**, desarrollada por [Genymobile](https://github.com/Genymobile).

---

## 🧰 Archivos incluidos

| Archivo                 | Descripción |
|------------------------------------------------------------------------|---------------------------------------------------------------------|
| [`scrcpy_docentes.bat`](./scrcpy-menu/scrcpy_docentes.bat)                         | Menú completo para ejecutar SCRCPY con diferentes opciones docentes |
| [`scrcpy`](https://github.com/Genymobile/scrcpy/releases) *(externo)*  | Debe ser descargado desde el repositorio oficial de Genymobile      |

---

## 🛠️ Instrucciones de uso

1. Descargue `scrcpy` desde:  
   https://github.com/Genymobile/scrcpy/releases

2. Coloque los archivos `scrcpy_docentes.bat`, `adb.exe`, y `scrcpy.exe` en la misma carpeta

3. Ejecute `scrcpy_docentes.bat` con doble clic

4. Seleccione una de las opciones disponibles:
   - Modo USB / Wi-Fi
   - Grabación
   - Apagar pantalla del celular
   - Ventana flotante

---

## 📂 Carpeta de grabaciones automáticas

Cuando se selecciona la opción de **grabar clase**, el sistema:

- ✅ Crea automáticamente una carpeta llamada **`Grabaciones`** (si no existe)
- ✅ Guarda el video en esa carpeta
- ✅ Asigna un nombre basado en la **fecha y hora**, por ejemplo: Grabaciones/grabacion_2024-04-13_2035.mp4

Esto permite mantener un registro organizado de cada clase sin sobrescribir archivos anteriores.  
Los archivos generados pueden ser movidos, renombrados o compartidos posteriormente.

---

## 🙌 Créditos y agradecimientos

- SCRCPY: herramienta desarrollada por [Genymobile](https://github.com/Genymobile)
- Este script es una adaptación orientada a uso académico, creado por César Pineda

---

**¡Docentes con tecnología libre, activa e inteligente!**
