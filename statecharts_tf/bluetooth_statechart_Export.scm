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
            "text": "bluetooth_statechart Export"
          },
          "specification": {
            "text": "\r\ninterface:\r\n    in event linkUp\r\n    in event linkDown\r\n    in event lineReceived\r\n    in event alertaSistema\r\n\r\n    out event cmdSetpoint : real\r\n    out event cmdModeSetup\r\n\r\n    operation parseCommand() : integer\r\n    operation getParsedSetpoint() : real\r\n    operation sendTelemetry()\r\n    operation sendAck()\r\n    operation sendNack()\r\n    operation sendAlert()\r\n\r\n    const CMD_SET_T : integer = 1\r\n    const CMD_MODE_SETUP : integer = 2\r\n\r\ninternal:\r\n    var cmd : integer = 0"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -578,
          "y": -137
        },
        "size": {
          "height": 687,
          "width": 1052
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "CONECTADO",
            "fontSize": 11
          },
          "specification": {
            "text": "every 1 s / sendTelemetry()\r\nalertaSistema / sendAlert()"
          }
        },
        "id": "529051bf-1fef-41a9-bb2f-a746449ddb0c",
        "z": 10,
        "embeds": [
          "8a6cae36-c293-4032-a3e2-5690cfe48a61"
        ]
      },
      {
        "position": {
          "x": -575,
          "y": -78
        },
        "size": {
          "width": 1046,
          "height": 625
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "activo"
          }
        },
        "id": "8a6cae36-c293-4032-a3e2-5690cfe48a61",
        "z": 11,
        "embeds": [
          "761c2458-f328-4fb7-a9f9-821fd51f0d74",
          "62830bf6-65c8-4beb-a227-97e8ea8550a6",
          "2dcec972-cade-447f-93be-4d42ba618f84",
          "b22ff176-d5b6-4ae3-88ee-429d0e125283",
          "920bab1f-57f1-45de-9710-9966f33f6447",
          "1ae4d755-9f40-4d94-9f67-60521f613032",
          "783df641-fc47-40a3-b606-4a48d4bb4e1c",
          "39314417-009b-4d10-8cd9-549178c6a21e"
        ],
        "parent": "529051bf-1fef-41a9-bb2f-a746449ddb0c"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "39314417-009b-4d10-8cd9-549178c6a21e"
        },
        "target": {
          "id": "1ae4d755-9f40-4d94-9f67-60521f613032",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "41.667%",
              "dy": "38.333%",
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
        "id": "761c2458-f328-4fb7-a9f9-821fd51f0d74",
        "z": 12,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "783df641-fc47-40a3-b606-4a48d4bb4e1c"
        },
        "target": {
          "id": "1ae4d755-9f40-4d94-9f67-60521f613032",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "30%",
              "dy": "86.667%",
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
                "text": "[cmd != CMD_SET_T && cmd != CMD_MODE_SETUP] / sendNack()"
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
        "id": "62830bf6-65c8-4beb-a227-97e8ea8550a6",
        "z": 13,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -57,
            "y": 236
          }
        ],
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "783df641-fc47-40a3-b606-4a48d4bb4e1c"
        },
        "target": {
          "id": "1ae4d755-9f40-4d94-9f67-60521f613032",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "58.333%",
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
                "text": "[cmd == CMD_MODE_SETUP] / raise cmdModeSetup; sendAck()"
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
        "id": "2dcec972-cade-447f-93be-4d42ba618f84",
        "z": 14,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -216,
            "y": 280
          }
        ],
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "783df641-fc47-40a3-b606-4a48d4bb4e1c"
        },
        "target": {
          "id": "1ae4d755-9f40-4d94-9f67-60521f613032",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "40%",
              "dy": "55%",
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
                "text": "[cmd == CMD_SET_T] / raise cmdSetpoint : getParsedSetpoint(); sendAck()"
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
        "id": "b22ff176-d5b6-4ae3-88ee-429d0e125283",
        "z": 15,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 15,
            "y": 327
          }
        ],
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1ae4d755-9f40-4d94-9f67-60521f613032"
        },
        "target": {
          "id": "783df641-fc47-40a3-b606-4a48d4bb4e1c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "75%",
              "dy": "35%",
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
                "text": "lineReceived / cmd = parseCommand()"
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
        "id": "920bab1f-57f1-45de-9710-9966f33f6447",
        "z": 16,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -44,
            "y": 154
          }
        ],
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61"
      },
      {
        "position": {
          "x": -404,
          "y": 121
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ACTIVO",
            "fontSize": 11
          }
        },
        "id": "1ae4d755-9f40-4d94-9f67-60521f613032",
        "z": 17,
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61"
      },
      {
        "position": {
          "x": 198,
          "y": 154
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "CHOICE",
            "fontSize": 11
          }
        },
        "id": "783df641-fc47-40a3-b606-4a48d4bb4e1c",
        "z": 18,
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61"
      },
      {
        "position": {
          "x": -422,
          "y": 89
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "39314417-009b-4d10-8cd9-549178c6a21e",
        "z": 19,
        "parent": "8a6cae36-c293-4032-a3e2-5690cfe48a61",
        "embeds": [
          "ef348ec8-5fc4-4bf9-a747-f239e0d6734f"
        ]
      },
      {
        "position": {
          "x": 161,
          "y": -369
        },
        "size": {
          "height": 143,
          "width": 185
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "DESCONECTADO",
            "fontSize": 11
          }
        },
        "id": "dfc82edc-d09c-4f1e-82a1-7bfeb52bc91d",
        "z": 20
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -422,
          "y": 104
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "ef348ec8-5fc4-4bf9-a747-f239e0d6734f",
        "z": 20,
        "parent": "39314417-009b-4d10-8cd9-549178c6a21e"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "dfc82edc-d09c-4f1e-82a1-7bfeb52bc91d"
        },
        "target": {
          "id": "529051bf-1fef-41a9-bb2f-a746449ddb0c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "76.878%",
              "dy": "5.897%",
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
                "text": "linkUp"
              }
            },
            "position": {
              "distance": 0.47752808988764045,
              "offset": -25,
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
        "id": "d09099fe-c9d7-422f-92a2-ca9fe9fc0c0d",
        "z": 21,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "529051bf-1fef-41a9-bb2f-a746449ddb0c"
        },
        "target": {
          "id": "dfc82edc-d09c-4f1e-82a1-7bfeb52bc91d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "24.865%",
              "dy": "77.622%",
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
                "text": "linkDown"
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
        "id": "e5377e9f-789a-43ab-b4fc-69b141074271",
        "z": 22,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 185,
          "y": -535
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "294df09b-4811-4550-aa2a-711bfe8ad77b",
        "z": 23,
        "embeds": [
          "eed9d62b-49b7-4bb9-ac60-16583eaf42ea"
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
          "x": 185,
          "y": -520
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "eed9d62b-49b7-4bb9-ac60-16583eaf42ea",
        "z": 24,
        "parent": "294df09b-4811-4550-aa2a-711bfe8ad77b"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "294df09b-4811-4550-aa2a-711bfe8ad77b"
        },
        "target": {
          "id": "dfc82edc-d09c-4f1e-82a1-7bfeb52bc91d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "25.405%",
              "dy": "22.378%",
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
        "id": "42c66aa8-a994-488c-b0f3-92659d22ef5e",
        "z": 25,
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
          "moduleName": "BluetoothStatechart",
          "statemachinePrefix": "bluetoothStatechart",
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