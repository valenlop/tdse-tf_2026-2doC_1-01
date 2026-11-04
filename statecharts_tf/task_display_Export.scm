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
            "text": "task_display Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event evWrite\n    operation displayDataWrite(c : string) \n\ninternal:\n    var index : integer = 0\n    var length : integer = 4\n    var buffer : string = \"Hola\""
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -205,
          "y": -64
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_IDLE",
            "fontSize": 11
          }
        },
        "id": "bcacac4e-2908-4e6e-a34d-2723ee1b9fe9",
        "z": 2
      },
      {
        "position": {
          "x": -313,
          "y": -43
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "617982a3-eb3a-4c3e-9ccc-e497a3e8e575",
        "z": 3,
        "embeds": [
          "a7849cb5-b08f-4bba-9784-926e8fd3aab3"
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
          "x": -313,
          "y": -28
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "a7849cb5-b08f-4bba-9784-926e8fd3aab3",
        "z": 4,
        "parent": "617982a3-eb3a-4c3e-9ccc-e497a3e8e575"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "617982a3-eb3a-4c3e-9ccc-e497a3e8e575"
        },
        "target": {
          "id": "bcacac4e-2908-4e6e-a34d-2723ee1b9fe9",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "50%",
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
        "id": "c077ae38-e77c-4431-a92a-5a4eb984dd18",
        "z": 5,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 95,
          "y": 52
        },
        "size": {
          "height": 69,
          "width": 88
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_WRITE_CHAR",
            "fontSize": 11
          }
        },
        "id": "8affb967-380d-40fd-b513-84b517377ca1",
        "z": 6,
        "embeds": [
          "414dd29a-9b13-4f63-9644-4747e554b9b0"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8affb967-380d-40fd-b513-84b517377ca1"
        },
        "target": {
          "id": "bcacac4e-2908-4e6e-a34d-2723ee1b9fe9",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "66.667%",
              "dy": "91.667%",
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
                "text": "[index >= length]"
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
        "id": "23e3822d-24bf-48b7-b524-22230f1651f3",
        "z": 7,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "bcacac4e-2908-4e6e-a34d-2723ee1b9fe9"
        },
        "target": {
          "id": "8affb967-380d-40fd-b513-84b517377ca1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "57.955%",
              "dy": "1.449%",
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
                "text": "evWrite / index = 0"
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
        "id": "2a2be43f-0b60-4dd3-993e-ba08e884ae66",
        "z": 8,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8affb967-380d-40fd-b513-84b517377ca1"
        },
        "target": {
          "id": "8affb967-380d-40fd-b513-84b517377ca1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "85.227%",
              "dy": "92.754%",
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
                "text": "after 1 ms [index < length] / displayDataWrite(buffer[index]); index++"
              }
            },
            "position": {
              "distance": 0.3526602407265774,
              "offset": 24.817910794636184,
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
        "id": "414dd29a-9b13-4f63-9644-4747e554b9b0",
        "z": 9,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "8affb967-380d-40fd-b513-84b517377ca1"
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
          "moduleName": "TaskDisplay",
          "statemachinePrefix": "taskDisplay",
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