<p align="center">
  <img src="fiuba.png" alt="Logo oficial de la Facultad de Ingeniería - UBA" width="40%">
</p>

# Estación de Control Ambiental
## Informe de Avance

**Materia:** Taller de Sistemas Embebidos (TdSE)  
**Placa Base:** STM32 NUCLEO-F103RB  
**Fecha:** 20/11/2026  
**Cuatrimestre:** 2do Cuatrimestre 2026  

### Integrantes
| Padrón | Apellidos, Nombres |
| :----- | :--------------------- |
| 112130 | Fernendez Luna, Felipe Mateo |
| 111700 | Lopez Ruvira, Valentin |
| 111821 | Yashnyk, Kira |

---

A continuación se detalla el informe de avance del Trabajo Final a partir de los requisitos funcionales y no funcionales definidos en `Propuesta.md`.

| Estado | Descripción |
| :---: | :--- |
| 🟢 | Ya implementado |
| 🟡 | En proceso de implementarse |
| 🔴 | No se implementará / Sin iniciar |

---

#### **Adquisición de Sensores**

| Req ID | Descripción | Estado |
| :--- | :--- | :---: |
| `RF-01` | El sistema debe medir en tiempo real la temperatura ambiente ($T$) empleando el sensor analógico LM35 conectado al ADC del STM32. | 🟢 |
| `RF-02` | El sistema debe medir el nivel de iluminación ($L$) mediante un divisor de tensión formado por la LDR y un resistor de precisión. | 🟢 |

#### **Control, Actuadores y Señalización**

| Req ID | Descripción | Estado |
| :--- | :--- | :---: |
| `RF-03` | El sistema debe controlar el calefactor mediante el relé aplicando una lógica ON/OFF. | 🔴 |
| `RF-08` | El sistema debe activar el Buzzer y la luz roja del LED RGB ante condiciones de sobretemperatura o detección de tapa abierta. | 🟡 |

#### **Interfaz Local y Almacenamiento Persistente**

| Req ID | Descripción | Estado |
| :--- | :--- | :---: |
| `RF-04` | El sistema debe permitir al usuario modificar el setpoint de temperatura y umbrales desde el teclado $1 \times 4$. | 🟢 |
| `RF-05` | El sistema debe almacenar los parámetros de configuración (`SET_UP`) en la memoria EEPROM I2C externa. | 🟡 |

#### **Comunicación Inalámbrica (Bluetooth BLE HM-10)**

| Req ID | Descripción | Estado |
| :--- | :--- | :---: |
| `RF-06` | El sistema debe transmitir la telemetría en tiempo real por el puerto serie UART hacia el módulo HM-10 cada $1000\text{ ms}$. | 🟡 |
| `RF-07` | El sistema debe recibir e interpretar comandos de configuración enviados de forma remota por Bluetooth BLE. | 🟡 |

#### **Requisitos No Funcionales (Arquitectura y Hardware)**

| Req ID | Descripción | Estado |
| :--- | :--- | :---: |
| `RNF-01` | El ciclo principal del ejecutor cíclico (*Super-Loop*) no debe contener demoras bloqueantes (prohibido `HAL_Delay` en el bucle principal). | 🟢 |
| `RNF-02` | El tiempo de ejecución por vuelta del bucle principal debe ser inferior a $1\text{ ms}$. | 🟢 |
| `RNF-03` | La comunicación I2C del display LCD y la EEPROM debe trabajar a una frecuencia determinada de $100\text{ kHz}$. | 🟡 |
| `RNF-04` | Todo el circuito debe ser montado y soldado sobre la placa experimental elegida. | 🟡 |

---

### Observaciones y Estado General del Desarrollo

* **Avances logrados:** *La medición de temperatura como de iluminación fue correctamente corroborada. Para el resto de `RF` el estado en amarillo simplemente surge de no haber corroborado circuitalmente el funcionamiento. No consideramos necesario alarmarse por la situación. En la medida que se ensamblen las diferentes partes, a partir del codigo ya implementado, se corroborará la lógica.*
* **Dificultades o demoras:** *En cuanto al `RF-03` consideramos que aplicar la logica de calefaccionado mediante el relé tendra complicaciones a futuro. Creemos que implementar esto mismo superará los limites de corriente impuestos por el microcontrolador, además de tener que utilizar fuentes adicionales para su uso.*
* **Ajustes de alcance:** *Para no eliminar por completo el calefaccionado del recinto, se simulará el estado de calentamiento mediante un led con la lógica ON/OFF propuesta anteriormente.*

**Statecharts:** Se crearon y reciclaron statecharts para facilitar la creación y desarrollo de la logico implementada en el codigo. En la carpeta statecharts_tf estan los mismos. Dado que es una entrega parcial los mismo no tienen 100% la logica del codigo pero dan una buena idea de lo que será.
