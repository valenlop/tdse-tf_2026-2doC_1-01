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
            "text": "actuator_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\ninterface:\n    in event EV_ACT_LED_ON\n    in event EV_ACT_LED_OFF\n    in event EV_ACT_LED_BLINK\n    \n    const DEL_LED_MAX: integer = 5\n    var tick: integer = 0\n\n    operation led_turn_on()\n    operation led_turn_off()\n    operation toggle_led()"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 235,
          "y": -147
        },
        "size": {
          "height": 126,
          "width": 148
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_LED_ON",
            "fontSize": 11
          }
        },
        "id": "e256c7ce-a389-4d2a-a092-f8dc22e30343",
        "z": 99,
        "embeds": [
          "6488bcb8-e727-4fe5-a353-83a9eefd1007"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e256c7ce-a389-4d2a-a092-f8dc22e30343",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "90.541%",
              "dy": "80.952%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "e256c7ce-a389-4d2a-a092-f8dc22e30343",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.649%",
              "dy": "39.683%",
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
                "text": "EV_ACT_LED_ON / led_turn_on()"
              }
            },
            "position": {
              "distance": 0.5414674289245589,
              "offset": 93,
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
        "id": "6488bcb8-e727-4fe5-a353-83a9eefd1007",
        "z": 100,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 410,
            "y": -70
          }
        ],
        "parent": "e256c7ce-a389-4d2a-a092-f8dc22e30343"
      },
      {
        "position": {
          "x": -458,
          "y": -160
        },
        "size": {
          "height": 131,
          "width": 143
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_LED_OFF",
            "fontSize": 11
          }
        },
        "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d",
        "z": 103,
        "embeds": [
          "84006deb-5fc1-4ca2-96c4-97c95d8a67ca"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d"
        },
        "target": {
          "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "25.874%",
              "dy": "11.45%",
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
                "text": "EV_ACT_LED_OFF / led_turn_off()"
              }
            },
            "position": {
              "distance": 0.7499289468439913,
              "offset": 49.507356494538094,
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
        "id": "84006deb-5fc1-4ca2-96c4-97c95d8a67ca",
        "z": 104,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d"
      },
      {
        "position": {
          "x": -524,
          "y": -100
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "b36f0848-5a74-4141-bcbc-d4ed9e8e7a57",
        "z": 105,
        "embeds": [
          "6a425adf-9d45-4e99-89af-36a9773cef33"
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
          "x": -524,
          "y": -85
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "6a425adf-9d45-4e99-89af-36a9773cef33",
        "z": 106,
        "parent": "b36f0848-5a74-4141-bcbc-d4ed9e8e7a57"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b36f0848-5a74-4141-bcbc-d4ed9e8e7a57"
        },
        "target": {
          "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.699%",
              "dy": "51.145%",
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
        "id": "1c884458-a1eb-475d-a0fb-06ef74a093cc",
        "z": 107,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d"
        },
        "target": {
          "id": "e256c7ce-a389-4d2a-a092-f8dc22e30343",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.73%",
              "dy": "29.365%",
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
                "text": "EV_ACT_LED_ON / led_turn_on()"
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
        "id": "e286376f-d2d9-434f-9738-4b6da25df049",
        "z": 108,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e256c7ce-a389-4d2a-a092-f8dc22e30343"
        },
        "target": {
          "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "86.713%",
              "dy": "72.519%",
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
                "text": "EV_ACT_LED_OFF / led_turn_off()"
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
        "id": "8914c59b-f848-4253-be15-f4ae749dbe3c",
        "z": 109,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 191,
          "y": 128
        },
        "size": {
          "height": 149,
          "width": 177
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_LED_BLINK",
            "fontSize": 11
          }
        },
        "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2",
        "z": 112,
        "embeds": [
          "7f8bd6cb-16e9-4d1d-928a-d0fd32eb9ab9",
          "ad57f9b7-5f65-4b1e-8078-153f1a3b14d1"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d"
        },
        "target": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.471%",
              "dy": "43.725%",
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
                "text": "EV_ACT_LED_BLINK / tick = DEL_LED_MAX; led_turn_on()"
              }
            },
            "position": {
              "distance": 0.5711791888694816,
              "offset": -14.015163219825842,
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
        "id": "71b0a6aa-c22f-44f2-893c-3fdef6cd5c89",
        "z": 113,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -363,
            "y": 176
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e256c7ce-a389-4d2a-a092-f8dc22e30343"
        },
        "target": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96.552%",
              "dy": "20.313%",
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
                "text": "EV_ACT_LED_BLINK / tick = DEL_LED_MAX; led_turn_off()"
              }
            },
            "position": {
              "distance": 0.5615450455838402,
              "offset": -150.00002441406252,
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
        "id": "6445bc69-b042-46a5-bd51-6610ba44d7a5",
        "z": 113,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2"
        },
        "target": {
          "id": "9ba61ebf-163b-4d66-b0c0-b4d44e11111d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "92.308%",
              "dy": "23.664%",
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
                "text": "EV_ACT_LED_OFF / led_turn_off()"
              }
            },
            "position": {
              "distance": 0.46984924623115576,
              "offset": 13,
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
        "id": "c0a8a5b4-da77-4b45-8f9c-0e65c6a56fcd",
        "z": 113,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -310,
            "y": 250
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2"
        },
        "target": {
          "id": "e256c7ce-a389-4d2a-a092-f8dc22e30343",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.351%",
              "dy": "76.984%",
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
                "text": "EV_ACT_LED_ON / led_turn_on()"
              }
            },
            "position": {
              "distance": 0.5414108173959207,
              "offset": -95,
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
        "id": "21546664-8166-49f5-a82b-953a029d18be",
        "z": 113,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2"
        },
        "target": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "70.621%",
              "dy": "95.302%",
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
                "text": "EV_ACT_LED_BLINK [tick > 0] / tick = tick - 1"
              }
            },
            "position": {
              "distance": 0.4172038063789489,
              "offset": 22,
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
        "id": "ad57f9b7-5f65-4b1e-8078-153f1a3b14d1",
        "z": 114,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2"
        },
        "target": {
          "id": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "93.22%",
              "dy": "40.268%",
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
                "text": "EV_ACT_LED_BLINK [tick == 0] / tick = DEL_LED_MAX; toggle_led()"
              }
            },
            "position": {
              "distance": 0.7416943395334673,
              "offset": 173.5147705078125,
              "angle": 0
            }
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
        "id": "7f8bd6cb-16e9-4d1d-928a-d0fd32eb9ab9",
        "z": 115,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "ff9e5a4a-cdec-468b-90d3-9004e5e92dd2"
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
          "moduleName": "ActuatorStatechartExport",
          "statemachinePrefix": "actuatorStatechartExport",
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