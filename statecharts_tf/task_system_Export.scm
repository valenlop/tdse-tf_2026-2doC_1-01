{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "task_system Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // --- Eventos de entrada (Triggers) ---\n    in event EV_INIT_DONE\n    in event EV_SENSE_TICK\n    in event EV_REQ_SETUP        // Transición a SET_UP (solicitada por Teclado o BLE)\n    in event EV_REQ_NORMAL       // Retorno a NORMAL sin guardar (cancelar o BLE)\n    in event EV_REQ_SAVE         // Guardar parámetro editado y volver a NORMAL (UI)\n    in event EV_SETUP_TIMEOUT    // Timeout de inactividad en SET_UP: descarta cambios (UI)\n    in event EV_REQ_SET_PARAM    // Cambio de T_set por BLE (SET_T=xx) sin pasar por SET_UP\n    in event EV_REQ_RESET        // Reset de alarma (solicitado por Teclado o BLE)\n\n    // --- Eventos de salida ---\n    out event EV_MODE_CHANGED    // Se levanta en el entry de cada estado\n\n    // --- Variables de lectura de sensores ---\n    var T_medida : real = 20.0\n    var T_set : real = 25.0\n    var dT : real = 1.0\n    var T_max : real = 40.0\n    var LDR_val : integer = 100\n    var UMBRAL_LUZ : integer = 500\n\n    // --- Edición de parámetros (llenadas por UI o BLE antes de EV_REQ_SAVE / EV_REQ_SET_PARAM) ---\n    var parametro : integer = 0\n    var valor_nuevo : real = 0.0\n    const PAR_TSET : integer = 0\n    const PAR_TMAX : integer = 1\n\n    // --- Causa de la alarma (para que el LCD y BLE muestren el mensaje correcto) ---\n    var causa_alarma : integer = 0\n    const CAUSA_TEMP : integer = 1\n    const CAUSA_TAPA : integer = 2\n\n    // --- ACTUADORES Y SALIDAS (Acciones) ---\n    var relay : boolean = false\n\n    // --- Variable difusora del estado global hacia las otras FSMs ---\n    var modo_sistema : integer = 0\n    const MODO_INIT : integer = 0\n    const MODO_NORMAL : integer = 1\n    const MODO_HEATING : integer = 2\n    const MODO_SETUP : integer = 3\n    const MODO_ALARMA : integer = 4\n\n    // --- Operaciones implementadas en C ---\n    operation eeprom_save(p : integer, v : real)\n    operation alarm_cause() : integer"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 584,
          "y": -70
        },
        "size": {
          "height": 117,
          "width": 435
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_HEATING",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nrelay = true;\nmodo_sistema = MODO_HEATING;\nraise EV_MODE_CHANGED\n\nEV_REQ_SET_PARAM / T_set = valor_nuevo; eeprom_save(PAR_TSET, valor_nuevo)"
          }
        },
        "id": "7ee131b6-910c-4930-8e65-d178dc5d3167",
        "z": 16
      },
      {
        "position": {
          "x": 173,
          "y": 117
        },
        "size": {
          "height": 159,
          "width": 237
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_NORMAL",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nrelay = false;\nmodo_sistema = MODO_NORMAL;\nraise EV_MODE_CHANGED\n\nEV_REQ_SET_PARAM / T_set = valor_nuevo; eeprom_save(PAR_TSET, valor_nuevo)"
          }
        },
        "id": "530c6393-d4ca-4c21-b66e-53369161f890",
        "z": 22
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7ee131b6-910c-4930-8e65-d178dc5d3167"
        },
        "target": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "95.139%",
              "dy": "73.95%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SENSE_TICK [T_medida >= T_set]"
              }
            },
            "position": {
              "distance": 0.3741995930740502,
              "offset": -17.094693042117633,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "2ec8e10f-6472-4226-b33b-b565d89ca245",
        "z": 23,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890"
        },
        "target": {
          "id": "7ee131b6-910c-4930-8e65-d178dc5d3167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.38%",
              "dy": "19.328%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SENSE_TICK [T_medida < (T_set - dT)]"
              }
            },
            "position": {
              "distance": 0.3891822862623202,
              "offset": -14.916356620146495,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "75dffbc7-e642-4aff-96f1-dfe4d3892482",
        "z": 23,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -203,
          "y": -70
        },
        "size": {
          "height": 114,
          "width": 152
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_INIT",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nrelay = false;\nmodo_sistema = MODO_INIT;\nraise EV_MODE_CHANGED"
          }
        },
        "id": "53098ec0-1c15-4fd6-9316-e5d01c3b9c41",
        "z": 34
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "53098ec0-1c15-4fd6-9316-e5d01c3b9c41"
        },
        "target": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.167%",
              "dy": "24.37%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_INIT_DONE"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "79c3d2c6-67bf-4d68-a099-0caf4946bda9",
        "z": 35,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -315,
          "y": -22
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "19521d45-968b-4d00-859b-dc9466f4d389",
        "z": 37,
        "embeds": [
          "0f4670f1-aa43-4bfa-aa05-02926a87b093"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -315,
          "y": -7
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "0f4670f1-aa43-4bfa-aa05-02926a87b093",
        "z": 38,
        "parent": "19521d45-968b-4d00-859b-dc9466f4d389"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "19521d45-968b-4d00-859b-dc9466f4d389"
        },
        "target": {
          "id": "53098ec0-1c15-4fd6-9316-e5d01c3b9c41",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.316%",
              "dy": "49.123%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7056afdb-3d0c-43f9-9063-3803d0d95ad4",
        "z": 39,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -237,
          "y": 164
        },
        "size": {
          "height": 122,
          "width": 162
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SET_UP",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nrelay = false;\nmodo_sistema = MODO_SETUP;\nraise EV_MODE_CHANGED"
          }
        },
        "id": "3aaee51f-dc7f-4897-a9ef-5a51d3a6d7a2",
        "z": 40
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890"
        },
        "target": {
          "id": "3aaee51f-dc7f-4897-a9ef-5a51d3a6d7a2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "93.21%",
              "dy": "31.148%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_REQ_SETUP"
              }
            },
            "position": {
              "distance": 0.5256721346001876,
              "offset": 15,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e8d546ae-d408-4fd1-b40c-7fa166b3f438",
        "z": 41,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7ee131b6-910c-4930-8e65-d178dc5d3167"
        },
        "target": {
          "id": "3aaee51f-dc7f-4897-a9ef-5a51d3a6d7a2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "72.84%",
              "dy": "95.082%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_REQ_SETUP"
              }
            },
            "position": {
              "distance": 0.5752500541119602,
              "offset": -20,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e1800e85-0542-4a85-a32c-c94d90897f57",
        "z": 41,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 339,
            "y": 336
          },
          {
            "x": 201,
            "y": 336
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "3aaee51f-dc7f-4897-a9ef-5a51d3a6d7a2"
        },
        "target": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.25%",
              "dy": "88.235%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_REQ_NORMAL"
              }
            },
            "position": {
              "distance": 0.5079258032012404,
              "offset": 15.000003662109378,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4396c037-6111-413d-b02f-eb6159c6269f",
        "z": 41,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 166,
          "y": -302
        },
        "size": {
          "height": 142,
          "width": 233
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ALARMA",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nrelay = false;\nmodo_sistema = MODO_ALARMA;\ncausa_alarma = alarm_cause();\nraise EV_MODE_CHANGED"
          }
        },
        "id": "c628f80e-7e8f-4af2-a610-0dceb9feda19",
        "z": 42
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "3aaee51f-dc7f-4897-a9ef-5a51d3a6d7a2"
        },
        "target": {
          "id": "c628f80e-7e8f-4af2-a610-0dceb9feda19",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.805%",
              "dy": "67.46%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SENSE_TICK [T_medida > T_max || LDR_val > UMBRAL_LUZ]"
              }
            },
            "position": {
              "distance": 0.6638957004181559,
              "offset": -22.346099853515625,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "feeacb00-6d9c-4b0e-be8e-1058c8dff47c",
        "z": 43,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -269,
            "y": 174
          },
          {
            "x": -322,
            "y": -172
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890"
        },
        "target": {
          "id": "c628f80e-7e8f-4af2-a610-0dceb9feda19",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.333%",
              "dy": "4.8%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SENSE_TICK [T_medida > T_max || LDR_val > UMBRAL_LUZ]"
              }
            },
            "position": {
              "distance": 0.7638888888888888,
              "offset": -171,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a4623a44-2ca8-49bf-a52c-5507e234cee4",
        "z": 43,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7ee131b6-910c-4930-8e65-d178dc5d3167"
        },
        "target": {
          "id": "c628f80e-7e8f-4af2-a610-0dceb9feda19",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96.667%",
              "dy": "49.6%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SENSE_TICK [T_medida > T_max || LDR_val > UMBRAL_LUZ]"
              }
            },
            "position": {
              "distance": 0.6484716938330773,
              "offset": -20.9671630859375,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "1f32f3a4-913d-4546-9d0d-fa8a96cef8d7",
        "z": 43,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 509,
            "y": -234
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c628f80e-7e8f-4af2-a610-0dceb9feda19"
        },
        "target": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "78.472%",
              "dy": "95.798%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SENSE_TICK [T_medida <= (T_max - dT) && LDR_val <= UMBRAL_LUZ]"
              }
            },
            "position": {
              "distance": 0.23463511716198007,
              "offset": -184.99999755859375,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f0b4feb3-7099-4d8d-891b-912dc11e3379",
        "z": 43,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "3aaee51f-dc7f-4897-a9ef-5a51d3a6d7a2"
        },
        "target": {
          "id": "530c6393-d4ca-4c21-b66e-53369161f890",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.641%",
              "dy": "73.585%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SETUP_TIMEOUT"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "de5a5f12-737c-4b5e-8802-3d8ca6e8a98f",
        "z": 44,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SystemTfStatechart",
          "statemachinePrefix": "systemTfStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}