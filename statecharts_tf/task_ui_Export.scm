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
            "text": "task_ui Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\ninterface:\n    // Eventos de Entrada (Procesados desde Hardware / Sistema)\n    in event EV_MODE_CHANGED : integer\n    in event EV_KEY1_PRESSED\n    in event EV_KEY2_PRESSED\n    in event EV_KEY3_PRESSED\n    in event EV_KEY4_PRESSED\n\n    // Eventos de Salida (Hacia task_system y task_display)\n    out event EV_REQ_SETUP\n    out event EV_REQ_NORMAL\n    out event EV_REQ_RESET\n    out event EV_REQ_MUTE\n    out event EV_REQ_SET_PARAM : real\n    out event EV_SETUP_TIMEOUT\n    out event EV_UI_SCREEN : integer\n    out event EV_UI_REFRESH\n    out event EV_UI_MSG : integer\n\n    // Variables internas\n    var T_set  : real\n    var T_edit : real\n\n    // Constantes de Configuración\n    const T_STEP    : real = 0.5\n    const T_SET_MIN : real = 15.0\n    const T_SET_MAX : real = 40.0\n\n    // Constantes de Pantallas (LCD)\n    const SCR_INIT    : integer = 0\n    const SCR_NORMAL  : integer = 1\n    const SCR_HEATING : integer = 2\n    const SCR_SETUP   : integer = 3\n    const SCR_ALARMA  : integer = 4\n\n    // Constantes de Mensajes Transitorios\n    const MSG_TIMEOUT : integer = 1\n\n    // Constantes de Modos (Sincronizadas con task_system)\n    const MODO_INIT   : integer = 0\n    const MODO_NORMAL : integer = 1\n    const MODO_HEATING: integer = 2\n    const MODO_SETUP  : integer = 3\n    const MODO_ALARMA : integer = 4"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -649,
          "y": 72
        },
        "size": {
          "width": 511,
          "height": 543
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UI_MONITOR",
            "fontSize": 11
          },
          "specification": {
            "text": "every 500 ms / raise EV_UI_REFRESH\nEV_KEY1_PRESSED / raise EV_REQ_SETUP"
          }
        },
        "id": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192",
        "z": 46,
        "embeds": [
          "7b5779c0-6af4-4551-bc2b-f36299314a09"
        ]
      },
      {
        "position": {
          "x": -646,
          "y": 131
        },
        "size": {
          "width": 505,
          "height": 481
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "7b5779c0-6af4-4551-bc2b-f36299314a09",
        "z": 47,
        "embeds": [
          "3ba88bdc-f34e-4896-be34-774ced47e052",
          "e847146e-d839-4532-a90e-6137dd44637f",
          "40dc4fdc-66b0-4911-be83-cdbe07bca9ea",
          "5a5f0723-c1df-4679-82c5-3b97a9efab89",
          "eab714d7-3cbb-4e1f-950b-af571a46df7f",
          "fc1eae41-52b8-4ffd-979f-f557a9453cb8"
        ],
        "parent": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "eab714d7-3cbb-4e1f-950b-af571a46df7f"
        },
        "target": {
          "id": "fc1eae41-52b8-4ffd-979f-f557a9453cb8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "18.75%",
              "dy": "2.273%",
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
              "distance": 0.631578947368421,
              "offset": 161,
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
        "id": "3ba88bdc-f34e-4896-be34-774ced47e052",
        "z": 48,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7b5779c0-6af4-4551-bc2b-f36299314a09"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fc1eae41-52b8-4ffd-979f-f557a9453cb8"
        },
        "target": {
          "id": "eab714d7-3cbb-4e1f-950b-af571a46df7f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "71.311%",
              "dy": "97.647%",
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
              "offset": 170,
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
        "id": "e847146e-d839-4532-a90e-6137dd44637f",
        "z": 49,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7b5779c0-6af4-4551-bc2b-f36299314a09"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5a5f0723-c1df-4679-82c5-3b97a9efab89"
        },
        "target": {
          "id": "eab714d7-3cbb-4e1f-950b-af571a46df7f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.639%",
              "dy": "48.235%",
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
        "id": "40dc4fdc-66b0-4911-be83-cdbe07bca9ea",
        "z": 50,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7b5779c0-6af4-4551-bc2b-f36299314a09"
      },
      {
        "position": {
          "x": -565,
          "y": 239.5
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "5a5f0723-c1df-4679-82c5-3b97a9efab89",
        "z": 51,
        "parent": "7b5779c0-6af4-4551-bc2b-f36299314a09",
        "embeds": [
          "46dfadf8-f260-4535-90c0-5483fc103afc"
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
          "x": -565,
          "y": 254.5
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "46dfadf8-f260-4535-90c0-5483fc103afc",
        "z": 52,
        "parent": "5a5f0723-c1df-4679-82c5-3b97a9efab89"
      },
      {
        "position": {
          "x": -479,
          "y": 194
        },
        "size": {
          "width": 186,
          "height": 113
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UI_NORMAL",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nraise EV_UI_SCREEN : SCR_NORMAL"
          }
        },
        "id": "eab714d7-3cbb-4e1f-950b-af571a46df7f",
        "z": 53,
        "parent": "7b5779c0-6af4-4551-bc2b-f36299314a09"
      },
      {
        "position": {
          "x": -491,
          "y": 442
        },
        "size": {
          "width": 209,
          "height": 127
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UI_HEATING",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nraise EV_UI_SCREEN : SCR_HEATING"
          }
        },
        "id": "fc1eae41-52b8-4ffd-979f-f557a9453cb8",
        "z": 54,
        "parent": "7b5779c0-6af4-4551-bc2b-f36299314a09"
      },
      {
        "position": {
          "x": -41,
          "y": -135
        },
        "size": {
          "width": 224,
          "height": 163
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UI_ALARMA",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nraise EV_UI_SCREEN : SCR_ALARMA\nEV_KEY1_PRESSED / raise EV_REQ_MUTE\nEV_KEY2_PRESSED / raise EV_REQ_RESET"
          }
        },
        "id": "b11acd87-85bc-4a67-aff0-69297c011eea",
        "z": 84
      },
      {
        "position": {
          "x": -1154,
          "y": 67
        },
        "size": {
          "width": 181,
          "height": 148
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UI_INIT",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nraise EV_UI_SCREEN : SCR_INIT"
          }
        },
        "id": "8ebbf483-684b-41f4-ad52-e0ea7dc8da83",
        "z": 96
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8ebbf483-684b-41f4-ad52-e0ea7dc8da83"
        },
        "target": {
          "id": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.783%",
              "dy": "8.84%",
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
        "id": "582aa056-5720-4fa1-86d9-44f02ef2ed6e",
        "z": 97,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -1235,
          "y": 130
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "95431fb4-27a5-4589-9004-6cb9092efc12",
        "z": 98,
        "embeds": [
          "ebe5d931-e659-41e2-84ec-fdffc6a15da3"
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
          "x": -1235,
          "y": 145
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "ebe5d931-e659-41e2-84ec-fdffc6a15da3",
        "z": 99,
        "parent": "95431fb4-27a5-4589-9004-6cb9092efc12"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "95431fb4-27a5-4589-9004-6cb9092efc12"
        },
        "target": {
          "id": "8ebbf483-684b-41f4-ad52-e0ea7dc8da83",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.837%",
              "dy": "48.322%",
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
        "id": "b229788f-62fb-4c0c-a177-ca8fd9f26616",
        "z": 100,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192"
        },
        "target": {
          "id": "b11acd87-85bc-4a67-aff0-69297c011eea",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.232%",
              "dy": "64.417%",
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
              "distance": 0.3566389973385332,
              "offset": -34.943113774432234,
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
        "id": "11ccbc0f-75e5-4880-aad8-354d161a8044",
        "z": 117,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -221,
            "y": 24
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b11acd87-85bc-4a67-aff0-69297c011eea"
        },
        "target": {
          "id": "eab714d7-3cbb-4e1f-950b-af571a46df7f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "97.312%",
              "dy": "29.204%",
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
              "distance": 0.4298921247793606,
              "offset": -13.000000000000028,
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
        "id": "ca69ba32-7bd2-4c6d-ab19-6cc7daed2d62",
        "z": 119,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 11,
            "y": 227
          }
        ]
      },
      {
        "position": {
          "x": 209,
          "y": 68
        },
        "size": {
          "width": 625,
          "height": 557
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UI_SETUP",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / T_edit = T_set\nEV_KEY4_PRESSED / raise EV_REQ_NORMAL"
          }
        },
        "id": "0940ab85-57f4-43bf-b88c-f28447831ddf",
        "z": 120,
        "embeds": [
          "4f36ab4e-9b76-4e01-ba47-2e54c8019cbd"
        ]
      },
      {
        "position": {
          "x": 212,
          "y": 127
        },
        "size": {
          "width": 619,
          "height": 495
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "4f36ab4e-9b76-4e01-ba47-2e54c8019cbd",
        "z": 121,
        "embeds": [
          "805b201b-8f18-4432-a778-60284cef08a7",
          "16b0d1b9-e7f1-4fce-aade-1d94813434dd",
          "873ae492-753d-4232-a687-bb2459d44097"
        ],
        "parent": "0940ab85-57f4-43bf-b88c-f28447831ddf"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192"
        },
        "target": {
          "id": "0940ab85-57f4-43bf-b88c-f28447831ddf",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.597%",
              "dy": "8.371%",
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
        "id": "6b598c55-a98d-426a-b34b-34ebe05ce00d",
        "z": 126,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0940ab85-57f4-43bf-b88c-f28447831ddf"
        },
        "target": {
          "id": "b11acd87-85bc-4a67-aff0-69297c011eea",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96.429%",
              "dy": "52.761%",
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
              "distance": 0.3965765773987983,
              "offset": 65.33622326194737,
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
        "id": "f3abbf02-ff15-4bf0-95df-1c4fe97b967a",
        "z": 126,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 352,
            "y": -49
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0940ab85-57f4-43bf-b88c-f28447831ddf"
        },
        "target": {
          "id": "eab714d7-3cbb-4e1f-950b-af571a46df7f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "94.624%",
              "dy": "51.327%",
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
              "distance": 0.33507306889352817,
              "offset": -18,
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
        "id": "e81a6c27-a862-4218-bda6-ed6a61dbdf2a",
        "z": 126,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 241,
          "y": 305
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "16b0d1b9-e7f1-4fce-aade-1d94813434dd",
        "z": 135,
        "embeds": [
          "201c512c-9cf9-49a7-8495-70b06d8ab721"
        ],
        "parent": "4f36ab4e-9b76-4e01-ba47-2e54c8019cbd"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 241,
          "y": 320
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "201c512c-9cf9-49a7-8495-70b06d8ab721",
        "z": 136,
        "parent": "16b0d1b9-e7f1-4fce-aade-1d94813434dd"
      },
      {
        "position": {
          "x": 365,
          "y": 225
        },
        "size": {
          "width": 372,
          "height": 252
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_UI_EDIT",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise EV_UI_SCREEN : SCR_SETUP\n\nEV_KEY3_PRESSED / raise EV_REQ_SET_PARAM : T_edit"
          }
        },
        "id": "873ae492-753d-4232-a687-bb2459d44097",
        "z": 138,
        "embeds": [
          "c15ebaea-f894-4be1-bb3f-708690b7eddb",
          "be7a3e76-89f3-4eef-9e1c-5c964854666b"
        ],
        "parent": "4f36ab4e-9b76-4e01-ba47-2e54c8019cbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "16b0d1b9-e7f1-4fce-aade-1d94813434dd"
        },
        "target": {
          "id": "873ae492-753d-4232-a687-bb2459d44097",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.141%",
              "dy": "50.769%",
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
        "id": "805b201b-8f18-4432-a778-60284cef08a7",
        "z": 139,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "4f36ab4e-9b76-4e01-ba47-2e54c8019cbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "873ae492-753d-4232-a687-bb2459d44097"
        },
        "target": {
          "id": "873ae492-753d-4232-a687-bb2459d44097",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "68.063%",
              "dy": "3.077%",
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
                "text": "EV_KEY2_PRESSED [T_edit - T_STEP >= T_SET_MIN] / T_edit = T_edit - T_STEP"
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
        "id": "c15ebaea-f894-4be1-bb3f-708690b7eddb",
        "z": 141,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "873ae492-753d-4232-a687-bb2459d44097"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "873ae492-753d-4232-a687-bb2459d44097"
        },
        "target": {
          "id": "873ae492-753d-4232-a687-bb2459d44097",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "38.743%",
              "dy": "96.923%",
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
                "text": "EV_KEY1_PRESSED [T_edit + T_STEP <= T_SET_MAX] / T_edit = T_edit + T_STEP"
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
        "id": "be7a3e76-89f3-4eef-9e1c-5c964854666b",
        "z": 142,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "873ae492-753d-4232-a687-bb2459d44097"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0940ab85-57f4-43bf-b88c-f28447831ddf"
        },
        "target": {
          "id": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.804%",
              "dy": "82.32%",
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
        "id": "007128f9-35c3-4046-a1ea-9d60a49b10ff",
        "z": 146,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0940ab85-57f4-43bf-b88c-f28447831ddf"
        },
        "target": {
          "id": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.609%",
              "dy": "71.455%",
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
                "text": "EV_KEY4_PRESSED / raise EV_REQ_NORMAL"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "4"
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
        "id": "68a35a05-49cc-4edc-ba79-8b1859a6f97c",
        "z": 147,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "873ae492-753d-4232-a687-bb2459d44097"
        },
        "target": {
          "id": "4bc0d588-31c0-4f9e-bf0d-41e0ca52e192",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.609%",
              "dy": "65.746%",
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
                "text": "after 10 s / raise EV_SETUP_TIMEOUT; raise EV_UI_MSG : MSG_TIMEOUT"
              }
            },
            "position": {
              "distance": 0.5139165009940357,
              "offset": 11,
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
        "id": "dc04bfc1-dfc0-4c85-90ac-c4d5323b388c",
        "z": 148,
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
          "moduleName": "TaskUi",
          "statemachinePrefix": "taskUi",
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