# Propuesta de Trabajo Final: Estación de Control Ambiental e Incubadora Inteligente

**Materia:** Taller de Sistemas Embebidos (TdSE)  
**Placa Base:** STM32 NUCLEO-F103RB  

---

## 1. Propuesta de Trabajo Final

### 1.1 Resumen
El presente proyecto consiste en el diseño e implementación de un sistema embebido de control ambiental y supervisión para entornos de incubación o germinación en lazo cerrado (control ON/OFF con histéresis). El sistema adquiere señales analógicas de temperatura ($T$) mediante un sensor LM35 y de iluminancia ($L$) mediante una fotoresistencia (LDR). A partir de los parámetros definidos por el usuario, el microcontrolador gestiona la activación de una etapa de calefacción comandada por relé, emite señalizaciones ópticas y acústicas de estado, y persiste las configuraciones críticas en una memoria EEPROM externa mediante protocolo I2C.

El dispositivo dispone de una interfaz local compuesta por un teclado de membrana $1 \times 4$, dip-switches de configuración y un display LCD $16 \times 2$ con interfaz I2C. Asimismo, integra un módulo de comunicación inalambrica Bluetooth Low Energy (HM-10) para telemetría en tiempo real y supervisión remota desde una aplicación móvil.

---

### 1.2 Matriz de Decisión y Ponderación de Alternativas

Para definir el proyecto a realizar, se evaluaron tres alternativas tecnológicas considerando la viabilidad de implementación con los componentes disponibles y el cumplimiento de los requisitos obligatorios de la asignatura.

* **Criterios de ponderación (Escala 1 a 10):**
  * **C1: Cumplimiento Requisitos TdSE (Peso: 30%)** - Presencia de sensores analógicos, actuadores, EEPROM, HM-10, LEDs, Buzzer y entrada discreta.
  * **C2: Disponibilidad de Hardware (Peso: 25%)** - Factibilidad de armado sin requerir componentes externos adicionales costosos.
  * **C3: Complejidad y Rigor de Firmware (Peso: 25%)** - Máquina de estados finitos (FSM), tareas periódicas/aperiódicas, no bloqueante.
  * **C4: Aplicabilidad Práctica (Peso: 20%)** - Utilidad del prototipo en escenarios del mundo real.

| Alternativa | C1 (30%) | C2 (25%) | C3 (25%) | C4 (20%) | Puntaje Ponderado |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Alt 1: Incubadora Ambiental Inteligente** | 10 | 10 | 9 | 9 | **9.60** |
| **Alt 2: Control de Acceso Cajas Fuertes** | 9 | 7 | 8 | 8 | **8.05** |
| **Alt 3: Controlador Industrial de Proceso** | 10 | 9 | 9 | 7 | **8.95** |

**Justificación:** Se selecciona la **Alternativa 1 (Incubadora Ambiental Inteligente)** por obtener la mayor puntuación ponderada ($9.60$), garantizando el $100\%$ del cumplimiento de la normativa de hardware de la cátedra con los componentes en stock y ofreciendo un control en lazo cerrado dinámico.

---

### 1.3 Descripción General del Sistema

El sistema operará bajo una arquitectura de ejecutor cíclico con demoras no bloqueantes y arquitectura orientada a estados (FSM):

1. **Estado `NORMAL`:** El microcontrolador escruta continuamente los sensores. El display LCD exhibe la temperatura y nivel de luz actual. El LED RGB permanece en color verde indicando variables estables.
2. **Estado `HEATING`:** Si la temperatura medida es inferior al setpoint configurado ($T_{\text{medida}} < T_{\text{setpoint}} - \Delta T$), la FSM conmuta al estado de calefacción. Se activa el relé de potencia, el LED pasa a color azul/amarillo y el LCD indica el estado del calefactor.
3. **Estado `SET_UP`:** Permite al operador modificar los valores de temperatura objetivo ($T_{\text{setpoint}}$) y límites de alerta mediante el teclado local o vía Bluetooth. Los datos son grabados inmediatamente en la memoria EEPROM I2C.
4. **Estado `ALARMA`:** Si la temperatura supera el límite máximo de seguridad ($T > T_{\text{max}}$) o la LDR detecta apertura no autorizada de la tapa (salto abrupto de iluminancia), el relé se apaga por seguridad, el Buzzer emite tonos de alerta intermitentes y el LED pasa a color rojo.

#### 1.3.1 Diagrama en Bloques del Sistema

En la Figura 1 se detalla la arquitectura de hardware del sistema, donde la unidad central de procesamiento (STM32 Nucleo-F103RB) se vincula con los periféricos de entrada (LM35, LDR, Teclado 1x4, Dip Switch), comunicación y memoria (Bluetooth HM-10, EEPROM I2C, LCD 16x2) y los actuadores de señalización y potencia (LED RGB/Semáforo, Buzzer, Relé de calefacción).

<p align="center">
  <img src="diagrama_en_bloques.png" alt="Diagrama en bloques del sistema" width="85%">
</p>

<p align="center"><em>Figura 1: Diagrama en bloques del sistema de monitoreo y control</em></p>

---

## 2. Análisis y Definición de Requisitos

### 2.1 Análisis de Competidores Comerciales / Estado del Arte

Para contextualizar el prototipo frente a soluciones de mercado, se analizaron tres equipos comerciales de control ambiental e incubación:

1. **Incubadora Comercial Biolight IC-100:** Equipo industrial de alta precisión. Posee control PID, pantalla táctil y comunicación Modbus. *Desventaja:* Elevado costo económico y nula conectividad inalambrica BLE directa a smartphones de consumo.
2. **Termostato Digital STC-1000:** Dispositivo de control de temperatura ON/OFF estándar en el mercado local. *Desventaja:* Interface extremadamente limitada (7 segmentos), sin capacidad de registro en memoria persistente externa, sin medición de luz ni comunicación inalámbrica.
3. **Controlador Tuya Smart Wi-Fi:** Módulo de automatización para domótica. *Desventaja:* Dependencia total de servidores en la nube e internet, sin interfaz física local completa (teclado/LCD) para operarlo en modo *standalone* sin conectividad.

**Valor Agregado del Prototipo:** El sistema desarrollado integra operabilidad dual (autónoma local mediante LCD/Teclado y remota mediante BLE HM-10), memoria no volátil local de parámetros vía I2C y monitoreo multivariable (temperatura y luz) en una plataforma embebida de bajo costo.

---

### 2.2 Tabla de Requisitos del Sistema

| Grupo | ID | Descripción |
| :--- | :--- | :--- |
| **Funcional** | `RF-01` | El sistema debe medir en tiempo real la temperatura ambiente ($T$) empleando el sensor analógico LM35 conectado al ADC del STM32. |
| **Funcional** | `RF-02` | El sistema debe medir el nivel de iluminación ($L$) mediante un divisor de tensión formado por la LDR y un resistor de precisión. |
| **Funcional** | `RF-03` | El sistema debe controlar el calefactor mediante el relé aplicando una lógica ON/OFF con histéresis configurada. |
| **Funcional** | `RF-04` | El sistema debe permitir al usuario modificar el setpoint de temperatura y umbrales desde el teclado $1 \times 4$. |
| **Funcional** | `RF-05` | El sistema debe almacenar los parámetros de configuración (`SET_UP`) en la memoria EEPROM I2C externa. |
| **Funcional** | `RF-06` | El sistema debe transmitir la telemetría en tiempo real por el puerto serie UART hacia el módulo HM-10 cada $1000\text{ ms}$. |
| **Funcional** | `RF-07` | El sistema debe recibir e interpretar comandos de configuración enviados de forma remota por Bluetooth BLE. |
| **Funcional** | `RF-08` | El sistema debe activar el Buzzer y la luz roja del LED RGB ante condiciones de sobretemperatura o detección de tapa abierta. |
| **No Funcional**| `RNF-01`| El ciclo principal del ejecutor cíclico (*Super-Loop*) no debe contener demoras bloqueantes (prohibido `HAL_Delay` en el bucle principal). |
| **No Funcional**| `RNF-02`| El tiempo de ejecución por vuelta del bucle principal debe ser inferior a $1\text{ ms}$. |
| **No Funcional**| `RNF-03`| La comunicación I2C del display LCD y la EEPROM debe trabajar a una frecuencia de $100\text{ kHz}$. |
| **No Funcional**| `RNF-04`| Todo el circuito debe ser montado y soldado sobre placa experimental (sin uso de protoboard en la entrega final). |

---

### 2.3 Casos de Uso

#### Caso de Uso 01: Monitoreo y Control Térmico en Modo Normal

| Campo | Detalles |
| :--- | :--- |
| **Caso de Uso** | `UC-01: Monitoreo y Control Térmico en Modo Normal` |
| **Disparador** | El sistema se enciende o finaliza el modo de configuración `SET_UP`. |
| **Precondiciones** | El sistema ha recuperado con éxito los valores de setpoint almacenados en la EEPROM I2C. |
| **Flujo Principal** | 1. El microcontrolador adquiere las lecturas del sensor LM35 y la LDR mediante el ADC.<br>2. El sistema actualiza los valores de temperatura y luz en la pantalla LCD 16x2.<br>3. Se evalúa la temperatura contra el setpoint ($T_{\text{setpoint}}$). Si $T_{\text{medida}} < T_{\text{setpoint}} - \Delta T$, se activa el relé del calefactor.<br>4. El LED RGB se ilumina en color verde (o azul si el calefactor está activo).<br>5. Se transmite la trama de telemetría vía UART hacia el módulo HM-10. |
| **Flujos Alternativos**| **a. Temperatura excede el umbral máximo ($T > T_{\text{max}}$):**<br>&nbsp;&nbsp;a1. Desactivar relé de calefacción inmediatamente.<br>&nbsp;&nbsp;a2. Transicionar al estado `ALARMA` (Conmutar LED a Rojo y activar Buzzer).<br>**b. Salto abrupto en la LDR (Apertura de Tapa):**<br>&nbsp;&nbsp;b1. Registrar evento de intrusión y mostrar `"TAPA ABIERTA"` en el LCD. |

---

#### Caso de Uso 02: Configuración de Setpoint y Umbrales (`SET_UP`)

| Campo | Detalles |
| :--- | :--- |
| **Caso de Uso** | `UC-02: Configuración de Setpoint y Umbrales (SET_UP)` |
| **Disparador** | El usuario presiona la tecla dedicada en el teclado $1 \times 4$ o envía el comando `MODE=SETUP` por BLE. |
| **Precondiciones** | El sistema se encuentra operando en modo `NORMAL` o `HEATING`. |
| **Flujo Principal** | 1. El sistema conmuta al estado `SET_UP` y el LED RGB pasa a color amarillo.<br>2. El LCD 16x2 despliega el menú de edición de temperatura objetivo.<br>3. El usuario incrementa o decrementa el valor objetivo utilizando las teclas de navegación.<br>4. El usuario confirma la selección presionando la tecla de guardado.<br>5. El microcontrolador escribe los nuevos parámetros en las direcciones correspondientes de la EEPROM I2C.<br>6. El sistema retorna automáticamente al estado `NORMAL` aplicando el nuevo setpoint. |
| **Flujos Alternativos**| **a. Timeout de Inactividad ($> 10$ segundos sin presionar teclas):**<br>&nbsp;&nbsp;a1. Descarta los cambios no confirmados.<br>&nbsp;&nbsp;a2. Muestra `"TIEMPO AGOTADO"` en el LCD y regresa al estado `NORMAL`.<br>**b. Error de escritura I2C en EEPROM:**<br>&nbsp;&nbsp;b1. Genera un tono de error en el Buzzer.<br>&nbsp;&nbsp;b2. Muestra `"ERROR EEPROM"` en el LCD y mantiene los valores previos en RAM. |

---

#### Caso de Uso 03: Gestión de Alarma y Tapa Abierta

| Campo | Detalles |
| :--- | :--- |
| **Caso de Uso** | `UC-03: Gestión de Alarma y Tapa Abierta` |
| **Disparador** | El valor de lectura del ADC supera el valor crítico de temperatura o la LDR registra luz ambiental directa de manera intempestiva. |
| **Precondiciones** | El sistema está en estado de ejecución activa. |
| **Flujo Principal** | 1. La FSM detecta la condición de falla y transiciona al estado `ALARMA`.<br>2. Se apaga la salida digital del relé para cortar el suministro al calefactor.<br>3. El LED RGB commuta a color rojo intermitente.<br>4. Se activa el Buzzer de forma pulsante ($500\text{ ms}$ encendido / $500\text{ ms}$ apagado).<br>5. El LCD muestra el mensaje de alerta correspondiente (`"ALT TEMP!"` o `"TAPA ABIERTA!"`).<br>6. Se envía la notificación de evento por Bluetooth HM-10. |
| **Flujos Alternativos**| **a. El usuario presiona el botón de silenciado (Mute) en el teclado:**<br>&nbsp;&nbsp;a1. Se desactiva el Buzzer pero se mantiene el LED rojo y la indicación en LCD.<br>**b. La variable retorna a valores seguros ($T < T_{\text{max}} - \Delta T$):**<br>&nbsp;&nbsp;b1. El sistema restablece el indicador visual y vuelve al estado `NORMAL`. |

---

#### Caso de Uso 04: Telemetría y Control Remoto Bluetooth HM-10

| Campo | Detalles |
| :--- | :--- |
| **Caso de Uso** | `UC-04: Telemetría y Control Remoto Bluetooth HM-10` |
| **Disparador** | Se establece un enlace BLE desde la App del teléfono celular con el módulo HM-10. |
| **Precondiciones** | Módulo HM-10 energizado y puerto USART del STM32 inicializado a $9600\text{ baudios}$. |
| **Flujo Principal** | 1. El firmware transmite tramas periódicas formateadas con el estado actual ($T$, $L$, estado de Relé y FSM).<br>2. La App receptora procesa la trama y refresca la pantalla del dispositivo móvil.<br>3. El operador envía un comando de texto desde la App (ej. `SET_T=27.5`).<br>4. La rutina de recepción UART (no bloqueante) almacena los caracteres en el buffer de entrada.<br>5. Al recibir el terminador de línea, la FSM valida el comando y actualiza la temperatura objetivo.<br>6. Se envía una trama de confirmación `ACK` hacia el celular. |
| **Flujos Alternativos**| **a. Recepción de comando no reconocido o fuera de rango:**<br>&nbsp;&nbsp;a1. El firmware descarta la trama.<br>&nbsp;&nbsp;a2. Retorna el mensaje `NACK: INVALID_CMD` por Bluetooth. |
