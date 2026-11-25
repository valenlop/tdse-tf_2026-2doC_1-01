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
            "text": "signaling_statechart Export"
          },
          "specification": {
            "text": "interface:\n    // Evento de entrada con el modo actual del sistema (recibido desde task_system)\n    in event EV_MODE_CHANGED : integer\n    \n    // Solicitud de silenciado de alarma (recibido desde task_ui)\n    in event EV_REQ_MUTE\n\n    // Salidas hacia drivers de hardware (GPIO / PWM)\n    out event EV_LED_RGB   : integer   // 0: OFF, 1: Verde (NORMAL), 2: Azul (HEATING), 3: Amarillo (SETUP), 4: Rojo (ALARMA)\n    out event EV_RELAY_HW  : boolean   // Salida física al relé (true: Encendido, false: Apagado)\n    out event EV_BUZZER_HW : boolean   // Salida física al buzzer (true: Encendido, false: Apagado)\n\n    // Constantes de Modos del Sistema (Sincronizadas con task_system)\n    const MODO_INIT    : integer = 0\n    const MODO_NORMAL  : integer = 1\n    const MODO_HEATING : integer = 2\n    const MODO_SETUP   : integer = 3\n    const MODO_ALARMA  : integer = 4\n\ninternal:\n    // Variables internas para el parpadeo de LED y silenciado de Buzzer\n    var ledOn       : boolean = false\n    var buzzerMuted : boolean = false"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -380,
          "y": -396
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "c9328016-94a5-4b87-85b4-215738bd6c19",
        "z": 3,
        "embeds": [
          "2da26f18-81c3-4aea-9ae9-706731bf9f27"
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
          "x": -380,
          "y": -381
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "2da26f18-81c3-4aea-9ae9-706731bf9f27",
        "z": 4,
        "parent": "c9328016-94a5-4b87-85b4-215738bd6c19"
      },
      {
        "position": {
          "x": -310,
          "y": -90
        },
        "size": {
          "height": 154,
          "width": 168
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_NORMAL",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nraise EV_LED_RGB: 1;        \nraise EV_RELAY_HW: false;  \nraise EV_BUZZER_HW: false"
          }
        },
        "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91",
        "z": 6
      },
      {
        "position": {
          "x": 175,
          "y": -90
        },
        "size": {
          "height": 163,
          "width": 197
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SET_UP",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nraise EV_LED_RGB: 3;       \nraise EV_RELAY_HW: false;   \nraise EV_BUZZER_HW: false"
          }
        },
        "id": "ebdb4be9-9dd5-4dec-80fb-6b448831c675",
        "z": 8
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91"
        },
        "target": {
          "id": "ebdb4be9-9dd5-4dec-80fb-6b448831c675",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.076%",
              "dy": "23.313%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_SETUP]"
              }
            },
            "position": {}
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
        "id": "e803af7c-27aa-49c1-bca4-2c3660d8364d",
        "z": 14,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -329,
          "y": -379
        },
        "size": {
          "height": 151,
          "width": 173
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_INIT",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nraise EV_LED_RGB: 0;\nraise EV_RELAY_HW: false;\nraise EV_BUZZER_HW: false"
          }
        },
        "id": "f7bdaeb6-c2ad-4475-862d-7f197266b77d",
        "z": 17
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9328016-94a5-4b87-85b4-215738bd6c19"
        },
        "target": {
          "id": "f7bdaeb6-c2ad-4475-862d-7f197266b77d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.133%",
              "dy": "2.649%",
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
        "id": "c21486d0-608d-4312-8832-df615f3b57db",
        "z": 18,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f7bdaeb6-c2ad-4475-862d-7f197266b77d"
        },
        "target": {
          "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "52.976%",
              "dy": "37.013%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_NORMAL]"
              }
            },
            "position": {
              "distance": 0.21765966000764267,
              "offset": 148,
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
        "id": "c2bff203-348d-4e56-a7c0-a6ceeb3f0447",
        "z": 18,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ebdb4be9-9dd5-4dec-80fb-6b448831c675"
        },
        "target": {
          "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "82.738%",
              "dy": "70.779%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_NORMAL]"
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
        "id": "935f6963-f78b-4840-949a-38b7a3b1ede8",
        "z": 23,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 434,
          "y": -353
        },
        "size": {
          "height": 174,
          "width": 198
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_HEATING",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nraise EV_LED_RGB: 2; \nraise EV_RELAY_HW: true;   \nraise EV_BUZZER_HW: false"
          }
        },
        "id": "5a2c944b-4064-4a48-8baf-66a9fc66847f",
        "z": 25
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "73.214%",
              "dy": "2.597%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "5a2c944b-4064-4a48-8baf-66a9fc66847f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.061%",
              "dy": "43.103%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_HEATING]"
              }
            },
            "position": {
              "distance": 0.5000000000000001,
              "offset": 14,
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
        "id": "0bca0e1c-77ab-4976-9f7f-2140b788f1b6",
        "z": 26,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 62,
            "y": -145
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5a2c944b-4064-4a48-8baf-66a9fc66847f"
        },
        "target": {
          "id": "ebdb4be9-9dd5-4dec-80fb-6b448831c675",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "83.249%",
              "dy": "70.552%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_SETUP]"
              }
            },
            "position": {
              "distance": 0.31486323765075797,
              "offset": -164,
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
        "id": "ca75b947-718e-4976-8668-fee406c70ca7",
        "z": 26,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 505,
            "y": -52
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5a2c944b-4064-4a48-8baf-66a9fc66847f"
        },
        "target": {
          "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "66.071%",
              "dy": "23.377%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_NORMAL]"
              }
            },
            "position": {
              "distance": 0.5068377857426234,
              "offset": 14,
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
        "id": "bb086273-fa5b-43c3-8513-244b264157d6",
        "z": 26,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -199,
            "y": -172
          }
        ]
      },
      {
        "position": {
          "x": -135,
          "y": 119
        },
        "size": {
          "height": 336,
          "width": 517
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ALARMA",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nraise EV_RELAY_HW : false;\nbuzzerMuted = false;\nledOn = true;\nraise EV_LED_RGB : 4;\nraise EV_BUZZER_HW : true\n\nevery 500 ms [ledOn] /\nledOn = false;\nraise EV_LED_RGB : 0;\nraise EV_BUZZER_HW : false\n\nevery 500 ms [!ledOn] /\nledOn = true;\nraise EV_LED_RGB : 4;\nraise EV_BUZZER_HW : !buzzerMuted\n\nEV_REQ_MUTE /\nbuzzerMuted = true;\nraise EV_BUZZER_HW : false\n\nexit /\nraise EV_BUZZER_HW : false"
          }
        },
        "id": "dedff408-4ddc-4fce-9d32-5ae475cbc071",
        "z": 30
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ebdb4be9-9dd5-4dec-80fb-6b448831c675"
        },
        "target": {
          "id": "dedff408-4ddc-4fce-9d32-5ae475cbc071",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "80.998%",
              "dy": "19.926%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_ALARMA]"
              }
            },
            "position": {
              "distance": 0.44002680308900627,
              "offset": -168.99999999999994,
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
        "id": "4b1391e9-9135-43a3-a4dd-a96e297a1fb2",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 477,
            "y": 68
          },
          {
            "x": 480,
            "y": 85
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5a2c944b-4064-4a48-8baf-66a9fc66847f"
        },
        "target": {
          "id": "dedff408-4ddc-4fce-9d32-5ae475cbc071",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "97.121%",
              "dy": "60.517%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_ALARMA]"
              }
            },
            "position": {
              "distance": 0.7236460787902268,
              "offset": 112.5,
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
        "id": "2308a40d-060e-48fd-b8f3-27983f4bcf41",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 846,
            "y": -203
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91"
        },
        "target": {
          "id": "dedff408-4ddc-4fce-9d32-5ae475cbc071",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.384%",
              "dy": "75.646%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_ALARMA]"
              }
            },
            "position": {
              "distance": 0.43637843777426577,
              "offset": 142,
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
        "id": "22b1b796-bbb1-41a7-a156-98e9890dedf2",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -574,
            "y": -70
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "dedff408-4ddc-4fce-9d32-5ae475cbc071"
        },
        "target": {
          "id": "0a2dcb65-288e-435f-a8c1-bc3c9a769f91",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "96.104%",
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
                "text": "EV_MODE_CHANGED [valueof(EV_MODE_CHANGED) == MODO_NORMAL]"
              }
            },
            "position": {
              "distance": 0.8111051608628866,
              "offset": -142,
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
        "id": "756aca56-29de-46c9-97cb-fa94c3793743",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -203,
            "y": 127
          }
        ]
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
          "moduleName": "SignalingStatechartExport",
          "statemachinePrefix": "signalingStatechartExport",
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