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
            "text": "sensor_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\r\ninternal:\r\n    var tick: integer = 0\r\n    const DEL_BTN_DOWN: integer = 20\r\n    const DEL_BTN_UP: integer = 20\r\n\r\ninterface:\r\n    in event EV_BTN_DOWN\r\n    in event EV_BTN_UP\r\n    out event EV_SYS_BTN_PRESSED\r\n    out event EV_SYS_BTN_RELEASED"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -240,
          "y": -272
        },
        "size": {
          "width": 928,
          "height": 580
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "cbc6d27a-3801-4c2b-9221-264618294dbd",
        "z": 63,
        "embeds": [
          "90672f44-518b-405a-b9e8-2fbf91013a67",
          "06c40104-6fd4-4ab4-811f-464b6c656060",
          "fe191040-ebb2-4d28-95fb-1548fec3a133",
          "99165173-06cf-4872-9251-f720ff2d9f02",
          "3f080e9f-fd4d-4099-9378-685109cad4c1",
          "7e57b839-55ef-436e-a3c1-3cf7aff00ea4",
          "bd71d772-e7c9-4f51-9aee-88ab72c7d4a2",
          "41a43246-8cb1-4200-9882-c5b51b91bd7a",
          "7c930544-1668-4959-982d-3b26d4bb3a87",
          "650a59d9-daa4-4fbc-997a-eaad5b05a783",
          "d045906d-56a3-49be-a41c-0788a8f49cfc",
          "69af7edc-4680-4685-b9c0-fe3fb69f66a5"
        ]
      },
      {
        "position": {
          "x": -176,
          "y": -219
        },
        "size": {
          "width": 131,
          "height": 81
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          }
        },
        "id": "41a43246-8cb1-4200-9882-c5b51b91bd7a",
        "z": 64,
        "embeds": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "position": {
          "x": -193,
          "y": -252
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "7c930544-1668-4959-982d-3b26d4bb3a87",
        "z": 65,
        "embeds": [
          "1ee7cda4-8fc7-4dd9-80ce-e17d51176595"
        ],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "position": {
          "x": 417,
          "y": -217
        },
        "size": {
          "width": 195,
          "height": 112
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          }
        },
        "id": "650a59d9-daa4-4fbc-997a-eaad5b05a783",
        "z": 67,
        "embeds": [
          "8d40cae7-f7d3-42c0-8b8a-dd0de0a3a524"
        ],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "position": {
          "x": 414,
          "y": 140
        },
        "size": {
          "width": 195,
          "height": 114
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          }
        },
        "id": "d045906d-56a3-49be-a41c-0788a8f49cfc",
        "z": 72,
        "embeds": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -193,
          "y": -237
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "1ee7cda4-8fc7-4dd9-80ce-e17d51176595",
        "z": 77,
        "parent": "7c930544-1668-4959-982d-3b26d4bb3a87"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "650a59d9-daa4-4fbc-997a-eaad5b05a783"
        },
        "target": {
          "id": "d045906d-56a3-49be-a41c-0788a8f49cfc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "20%",
              "dy": "1.754%",
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
                "text": "EV_BTN_DOWN"
              }
            },
            "position": {
              "distance": 0.48775510204081635,
              "offset": 44,
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
        "id": "99165173-06cf-4872-9251-f720ff2d9f02",
        "z": 78,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "650a59d9-daa4-4fbc-997a-eaad5b05a783"
        },
        "target": {
          "id": "41a43246-8cb1-4200-9882-c5b51b91bd7a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "90.323%",
              "dy": "31.395%",
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
                "text": "EV_BTN_UP [tick >= DEL_BTN_UP] / raise EV_SYS_BTN_RELEASED"
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
        "id": "7e57b839-55ef-436e-a3c1-3cf7aff00ea4",
        "z": 78,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7c930544-1668-4959-982d-3b26d4bb3a87"
        },
        "target": {
          "id": "41a43246-8cb1-4200-9882-c5b51b91bd7a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.667%",
              "dy": "20%",
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
        "id": "bd71d772-e7c9-4f51-9aee-88ab72c7d4a2",
        "z": 78,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "650a59d9-daa4-4fbc-997a-eaad5b05a783"
        },
        "target": {
          "id": "650a59d9-daa4-4fbc-997a-eaad5b05a783",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "65.957%",
              "dy": "10.989%",
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
                "text": "EV_BTN_UP [tick < DEL_BTN_UP] / tick = tick + 1"
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
        "id": "8d40cae7-f7d3-42c0-8b8a-dd0de0a3a524",
        "z": 78,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "650a59d9-daa4-4fbc-997a-eaad5b05a783"
      },
      {
        "position": {
          "x": -202,
          "y": 141
        },
        "size": {
          "width": 200,
          "height": 121
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          }
        },
        "id": "69af7edc-4680-4685-b9c0-fe3fb69f66a5",
        "z": 82,
        "embeds": [
          "66bd787e-45f7-413b-bf05-e29ba2129d72"
        ],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "41a43246-8cb1-4200-9882-c5b51b91bd7a"
        },
        "target": {
          "id": "69af7edc-4680-4685-b9c0-fe3fb69f66a5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "63.333%",
              "dy": "8.434%",
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
                "text": "EV_BTN_DOWN / tick = 0"
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
        "id": "90672f44-518b-405a-b9e8-2fbf91013a67",
        "z": 83,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "69af7edc-4680-4685-b9c0-fe3fb69f66a5"
        },
        "target": {
          "id": "d045906d-56a3-49be-a41c-0788a8f49cfc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.522%",
              "dy": "59.036%",
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
                "text": "EV_BTN_DOWN [tick >= DEL_BTN_DOWN] / raise EV_SYS_BTN_PRESSED"
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
        "id": "06c40104-6fd4-4ab4-811f-464b6c656060",
        "z": 83,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "69af7edc-4680-4685-b9c0-fe3fb69f66a5"
        },
        "target": {
          "id": "41a43246-8cb1-4200-9882-c5b51b91bd7a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "26.882%",
              "dy": "93.023%",
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
                "text": "EV_BTN_UP"
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
        "id": "fe191040-ebb2-4d28-95fb-1548fec3a133",
        "z": 83,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "69af7edc-4680-4685-b9c0-fe3fb69f66a5"
        },
        "target": {
          "id": "69af7edc-4680-4685-b9c0-fe3fb69f66a5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "35.556%",
              "dy": "75.904%",
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
                "text": "EV_BTN_DOWN [tick < DEL_BTN_DOWN] / tick = tick + 1"
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
        "id": "66bd787e-45f7-413b-bf05-e29ba2129d72",
        "z": 83,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "69af7edc-4680-4685-b9c0-fe3fb69f66a5"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "d045906d-56a3-49be-a41c-0788a8f49cfc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "87.179%",
              "dy": "0.855%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "650a59d9-daa4-4fbc-997a-eaad5b05a783",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "73.404%",
              "dy": "85.714%",
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
                "text": "EV_BTN_UP / tick = 0"
              }
            },
            "position": {
              "distance": 0.4862267078403383,
              "offset": 50.64050839964387,
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
        "id": "3f080e9f-fd4d-4099-9378-685109cad4c1",
        "z": 84,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cbc6d27a-3801-4c2b-9221-264618294dbd"
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
          "moduleName": "SensorStatechart",
          "statemachinePrefix": "sensorStatechart",
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