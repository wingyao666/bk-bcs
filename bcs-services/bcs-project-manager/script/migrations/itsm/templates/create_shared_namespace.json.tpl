{
  "is_deleted": false,
  "name": "\u521b\u5efa\u5171\u4eab\u96c6\u7fa4\u547d\u540d\u7a7a\u95f4",
  "desc": "",
  "flow_type": "other",
  "is_enabled": true,
  "is_revocable": true,
  "revoke_config": {
    "type": 1,
    "state": 0
  },
  "is_draft": false,
  "is_builtin": false,
  "is_task_needed": false,
  "owners": "admin",
  "notify_rule": "ONCE",
  "notify_freq": 0,
  "is_biz_needed": false,
  "is_auto_approve": false,
  "is_iam_used": false,
  "is_supervise_needed": true,
  "supervise_type": "EMPTY",
  "supervisor": "",
  "engine_version": "PIPELINE_V1",
  "version_number": "20240308112119",
  "table": {
    "id": 36,
    "is_deleted": false,
    "name": "\u9ed8\u8ba4",
    "desc": "\u9ed8\u8ba4\u57fa\u7840\u6a21\u578b",
    "version": "EMPTY",
    "fields": [
      {
        "id": 1,
        "is_deleted": false,
        "is_builtin": true,
        "is_readonly": false,
        "is_valid": true,
        "display": true,
        "source_type": "CUSTOM",
        "source_uri": "",
        "api_instance_id": 0,
        "kv_relation": {},
        "type": "STRING",
        "key": "title",
        "name": "\u6807\u9898",
        "layout": "COL_12",
        "validate_type": "REQUIRE",
        "show_type": 1,
        "show_conditions": {},
        "regex": "EMPTY",
        "regex_config": {},
        "custom_regex": "",
        "desc": "\u8bf7\u8f93\u5165\u6807\u9898",
        "tips": "",
        "is_tips": false,
        "default": "",
        "choice": [],
        "related_fields": {},
        "meta": {},
        "flow_type": "DEFAULT",
        "project_key": "public",
        "source": "BASE-MODEL"
      },
      {
        "id": 2,
        "is_deleted": false,
        "is_builtin": true,
        "is_readonly": false,
        "is_valid": true,
        "display": true,
        "source_type": "DATADICT",
        "source_uri": "IMPACT",
        "api_instance_id": 0,
        "kv_relation": {},
        "type": "SELECT",
        "key": "impact",
        "name": "\u5f71\u54cd\u8303\u56f4",
        "layout": "COL_12",
        "validate_type": "REQUIRE",
        "show_type": 1,
        "show_conditions": {},
        "regex": "EMPTY",
        "regex_config": {},
        "custom_regex": "",
        "desc": "\u8bf7\u9009\u62e9\u5f71\u54cd\u8303\u56f4",
        "tips": "",
        "is_tips": false,
        "default": "",
        "choice": [],
        "related_fields": {},
        "meta": {},
        "flow_type": "DEFAULT",
        "project_key": "public",
        "source": "BASE-MODEL"
      },
      {
        "id": 3,
        "is_deleted": false,
        "is_builtin": true,
        "is_readonly": false,
        "is_valid": true,
        "display": true,
        "source_type": "DATADICT",
        "source_uri": "URGENCY",
        "api_instance_id": 0,
        "kv_relation": {},
        "type": "SELECT",
        "key": "urgency",
        "name": "\u7d27\u6025\u7a0b\u5ea6",
        "layout": "COL_12",
        "validate_type": "REQUIRE",
        "show_type": 1,
        "show_conditions": {},
        "regex": "EMPTY",
        "regex_config": {},
        "custom_regex": "",
        "desc": "\u8bf7\u9009\u62e9\u7d27\u6025\u7a0b\u5ea6",
        "tips": "",
        "is_tips": false,
        "default": "",
        "choice": [],
        "related_fields": {},
        "meta": {},
        "flow_type": "DEFAULT",
        "project_key": "public",
        "source": "BASE-MODEL"
      },
      {
        "id": 4,
        "is_deleted": false,
        "is_builtin": true,
        "is_readonly": true,
        "is_valid": true,
        "display": true,
        "source_type": "DATADICT",
        "source_uri": "PRIORITY",
        "api_instance_id": 0,
        "kv_relation": {},
        "type": "SELECT",
        "key": "priority",
        "name": "\u4f18\u5148\u7ea7",
        "layout": "COL_12",
        "validate_type": "REQUIRE",
        "show_type": 1,
        "show_conditions": {},
        "regex": "EMPTY",
        "regex_config": {},
        "custom_regex": "",
        "desc": "\u8bf7\u9009\u62e9\u4f18\u5148\u7ea7",
        "tips": "",
        "is_tips": false,
        "default": "",
        "choice": [],
        "related_fields": {
          "rely_on": [
            "urgency",
            "impact"
          ]
        },
        "meta": {},
        "flow_type": "DEFAULT",
        "project_key": "public",
        "source": "BASE-MODEL"
      },
      {
        "id": 5,
        "is_deleted": false,
        "is_builtin": true,
        "is_readonly": false,
        "is_valid": true,
        "display": true,
        "source_type": "RPC",
        "source_uri": "ticket_status",
        "api_instance_id": 0,
        "kv_relation": {},
        "type": "SELECT",
        "key": "current_status",
        "name": "\u5de5\u5355\u72b6\u6001",
        "layout": "COL_12",
        "validate_type": "REQUIRE",
        "show_type": 1,
        "show_conditions": {},
        "regex": "EMPTY",
        "regex_config": {},
        "custom_regex": "",
        "desc": "\u8bf7\u9009\u62e9\u5de5\u5355\u72b6\u6001",
        "tips": "",
        "is_tips": false,
        "default": "",
        "choice": [],
        "related_fields": {},
        "meta": {},
        "flow_type": "DEFAULT",
        "project_key": "public",
        "source": "BASE-MODEL"
      }
    ],
    "fields_order": [
      1,
      2,
      3,
      4,
      5
    ],
    "field_key_order": [
      "title",
      "impact",
      "urgency",
      "priority",
      "current_status"
    ]
  },
  "task_schemas": [],
  "creator": "",
  "updated_by": "",
  "workflow_id": 693,
  "version_message": "",
  "states": {
    "4767": {
      "workflow": 693,
      "id": 4767,
      "key": 4767,
      "name": "\u5f00\u59cb",
      "desc": "",
      "distribute_type": "PROCESS",
      "axis": {
        "x": 150,
        "y": 150
      },
      "is_builtin": true,
      "variables": {
        "inputs": [],
        "outputs": []
      },
      "tag": "DEFAULT",
      "processors_type": "OPEN",
      "processors": "",
      "assignors": "",
      "assignors_type": "EMPTY",
      "delivers": "",
      "delivers_type": "EMPTY",
      "can_deliver": false,
      "extras": {},
      "is_draft": false,
      "is_terminable": false,
      "fields": [],
      "type": "START",
      "api_instance_id": 0,
      "is_sequential": false,
      "finish_condition": {},
      "is_multi": false,
      "is_allow_skip": false,
      "creator": null,
      "create_at": "2023-11-30 14:24:26",
      "updated_by": null,
      "update_at": "2023-11-30 14:24:27",
      "end_at": null,
      "is_first_state": false
    },
    "4768": {
      "workflow": 693,
      "id": 4768,
      "key": 4768,
      "name": "\u63d0\u5355",
      "desc": "",
      "distribute_type": "PROCESS",
      "axis": {
        "x": 285,
        "y": 150
      },
      "is_builtin": true,
      "variables": {
        "inputs": [],
        "outputs": [
          {
            "key": "CLUSTER_TYPE",
            "type": "SELECT",
            "source": "field",
            "state": 2948
          },
          {
            "key": "CLUSTER_ID",
            "type": "STRING",
            "source": "field",
            "state": 2582
          },
          {
            "key": "CPU_LIMITS",
            "type": "INT",
            "source": "field",
            "state": 2718
          },
          {
            "key": "MEMORY_LIMITS",
            "type": "INT",
            "source": "field",
            "state": 2718
          }
        ]
      },
      "tag": "DEFAULT",
      "processors_type": "OPEN",
      "processors": "",
      "assignors": "",
      "assignors_type": "EMPTY",
      "delivers": "",
      "delivers_type": "EMPTY",
      "can_deliver": false,
      "extras": {},
      "is_draft": false,
      "is_terminable": false,
      "fields": [
        9562,
        9568,
        9563,
        9564,
        9569,
        9570
      ],
      "type": "NORMAL",
      "api_instance_id": 0,
      "is_sequential": false,
      "finish_condition": {},
      "is_multi": false,
      "is_allow_skip": false,
      "creator": null,
      "create_at": "2023-11-30 14:24:26",
      "updated_by": null,
      "update_at": "2023-11-30 14:24:27",
      "end_at": null,
      "is_first_state": true
    },
    "4769": {
      "workflow": 693,
      "id": 4769,
      "key": 4769,
      "name": "\u7ed3\u675f",
      "desc": "",
      "distribute_type": "PROCESS",
      "axis": {
        "x": 1195,
        "y": 150
      },
      "is_builtin": true,
      "variables": {
        "inputs": [],
        "outputs": []
      },
      "tag": "DEFAULT",
      "processors_type": "OPEN",
      "processors": "",
      "assignors": "",
      "assignors_type": "EMPTY",
      "delivers": "",
      "delivers_type": "EMPTY",
      "can_deliver": false,
      "extras": {},
      "is_draft": false,
      "is_terminable": false,
      "fields": [],
      "type": "END",
      "api_instance_id": 0,
      "is_sequential": false,
      "finish_condition": {},
      "is_multi": false,
      "is_allow_skip": false,
      "creator": null,
      "create_at": "2023-11-30 14:24:26",
      "updated_by": "admin",
      "update_at": "2024-03-05 21:04:53",
      "end_at": null,
      "is_first_state": false
    },
    "4770": {
      "workflow": 693,
      "id": 4770,
      "key": 4770,
      "name": "\u8d1f\u8d23\u4eba\u5ba1\u6279",
      "desc": "",
      "distribute_type": "PROCESS",
      "axis": {
        "x": 585,
        "y": 150
      },
      "is_builtin": false,
      "variables": {
        "inputs": [],
        "outputs": [
          {
            "source": "global",
            "state": 2956,
            "type": "STRING",
            "key": "Fd6380d03621747689b9776224da468d",
            "name": "\u5ba1\u6279\u7ed3\u679c",
            "meta": {
              "code": "NODE_APPROVE_RESULT",
              "type": "SELECT",
              "choice": [
                {
                  "key": "false",
                  "name": "\u62d2\u7edd"
                },
                {
                  "key": "true",
                  "name": "\u901a\u8fc7"
                }
              ]
            }
          },
          {
            "source": "global",
            "state": 2956,
            "type": "STRING",
            "key": "O1af1a6c7fceb2bbe9243d0cfd871028",
            "name": "\u5ba1\u6279\u4eba",
            "meta": {
              "code": "NODE_APPROVER"
            }
          },
          {
            "source": "global",
            "state": 2956,
            "type": "INT",
            "key": "dd93d6c0341ce48260408a2964448cb7",
            "name": "\u5904\u7406\u4eba\u6570",
            "meta": {
              "code": "PROCESS_COUNT"
            }
          },
          {
            "source": "global",
            "state": 2956,
            "type": "INT",
            "key": "c6619ac6399ebb6f4208406add9d971e",
            "name": "\u901a\u8fc7\u4eba\u6570",
            "meta": {
              "code": "PASS_COUNT"
            }
          },
          {
            "source": "global",
            "state": 2956,
            "type": "INT",
            "key": "l76a275fc8b01ceeb9a33f77ddb03679",
            "name": "\u62d2\u7edd\u4eba\u6570",
            "meta": {
              "code": "REJECT_COUNT"
            }
          },
          {
            "source": "global",
            "state": 2956,
            "type": "INT",
            "key": "f73b972755824685ca4cc7edd0a0bdab",
            "name": "\u901a\u8fc7\u7387",
            "meta": {
              "code": "PASS_RATE",
              "unit": "PERCENT"
            }
          },
          {
            "source": "global",
            "state": 2956,
            "type": "INT",
            "key": "e987844249bd935b6e2b0b2609da593f",
            "name": "\u62d2\u7edd\u7387",
            "meta": {
              "code": "REJECT_RATE",
              "unit": "PERCENT"
            }
          }
        ]
      },
      "tag": "DEFAULT",
      "processors_type": "PERSON",
      "processors": "[[.Approvers]]",
      "assignors": "",
      "assignors_type": "EMPTY",
      "delivers": "",
      "delivers_type": "EMPTY",
      "can_deliver": false,
      "extras": {
        "ticket_status": {
          "name": "",
          "type": "keep"
        }
      },
      "is_draft": false,
      "is_terminable": false,
      "fields": [
        9565,
        9566,
        9567
      ],
      "type": "APPROVAL",
      "api_instance_id": 0,
      "is_sequential": false,
      "finish_condition": {
        "expressions": [],
        "type": "or"
      },
      "is_multi": false,
      "is_allow_skip": false,
      "creator": null,
      "create_at": "2023-11-30 14:24:26",
      "updated_by": "admin",
      "update_at": "2024-03-05 21:17:03",
      "end_at": null,
      "is_first_state": false
    },
    "4771": {
      "workflow": 693,
      "id": 4771,
      "key": 4771,
      "name": "\u6210\u529f\u56de\u8c03",
      "desc": "",
      "distribute_type": "PROCESS",
      "axis": {
        "x": 860,
        "y": 85
      },
      "is_builtin": false,
      "variables": {
        "outputs": [],
        "inputs": []
      },
      "tag": "DEFAULT",
      "processors_type": "PERSON",
      "processors": "admin",
      "assignors": "",
      "assignors_type": "EMPTY",
      "delivers": "",
      "delivers_type": "EMPTY",
      "can_deliver": false,
      "extras": {
        "webhook_info": {
          "method": "POST",
          "url": "[[.BCSGateway]]/bcsapi/v4/bcsproject/v1/projects/{{PROJECT_CODE}}/clusters/{{CLUSTER_ID}}/namespaces/{{NAMESPACE}}/callback/create",
          "query_params": [],
          "auth": {
            "auth_type": "bearer_token",
            "auth_config": {
              "token": "[[.BCSToken]]"
            }
          },
          "headers": [],
          "body": {
            "type": "raw",
            "raw_type": "JSON",
            "content": "{\n    \"title\": \"{{ticket_title}}\",\n    \"currentStatus\": \"{{ticket_current_status}}\",\n    \"sn\": \"{{ticket_sn}}\",\n    \"ticketUrl\": \"{{ticket_ticket_url}}\",\n    \"applyInCluster\": true,\n    \"approveResult\": true\n}"
          },
          "settings": {
            "timeout": 10
          },
          "success_exp": "resp.code==0"
        }
      },
      "is_draft": false,
      "is_terminable": false,
      "fields": [],
      "type": "WEBHOOK",
      "api_instance_id": 0,
      "is_sequential": false,
      "finish_condition": {},
      "is_multi": false,
      "is_allow_skip": false,
      "creator": null,
      "create_at": "2023-11-30 14:24:26",
      "updated_by": "admin",
      "update_at": "2024-03-05 21:16:58",
      "end_at": null,
      "is_first_state": false
    },
    "4772": {
      "workflow": 693,
      "id": 4772,
      "key": 4772,
      "name": "\u5931\u8d25\u56de\u8c03",
      "desc": "",
      "distribute_type": "PROCESS",
      "axis": {
        "x": 865,
        "y": 210
      },
      "is_builtin": false,
      "variables": {
        "outputs": [],
        "inputs": []
      },
      "tag": "DEFAULT",
      "processors_type": "PERSON",
      "processors": "admin",
      "assignors": "",
      "assignors_type": "EMPTY",
      "delivers": "",
      "delivers_type": "EMPTY",
      "can_deliver": false,
      "extras": {
        "webhook_info": {
          "method": "POST",
          "url": "[[.BCSGateway]]/bcsapi/v4/bcsproject/v1/projects/{{PROJECT_CODE}}/clusters/{{CLUSTER_ID}}/namespaces/{{NAMESPACE}}/callback/create",
          "query_params": [],
          "auth": {
            "auth_type": "bearer_token",
            "auth_config": {
              "token": "[[.BCSToken]]"
            }
          },
          "headers": [],
          "body": {
            "type": "raw",
            "raw_type": "JSON",
            "content": "{\n    \"title\": \"{{ticket_title}}\",\n    \"currentStatus\": \"{{ticket_current_status}}\",\n    \"sn\": \"{{ticket_sn}}\",\n    \"ticketUrl\": \"{{ticket_ticket_url}}\",\n    \"applyInCluster\": false,\n    \"approveResult\": false\n}"
          },
          "settings": {
            "timeout": 10
          },
          "success_exp": "resp.code==0"
        }
      },
      "is_draft": false,
      "is_terminable": false,
      "fields": [],
      "type": "WEBHOOK",
      "api_instance_id": 0,
      "is_sequential": false,
      "finish_condition": {},
      "is_multi": false,
      "is_allow_skip": false,
      "creator": null,
      "create_at": "2023-11-30 14:24:26",
      "updated_by": "admin",
      "update_at": "2024-03-05 21:16:54",
      "end_at": null,
      "is_first_state": false
    }
  },
  "transitions": {
    "5291": {
      "workflow": 693,
      "id": 5291,
      "from_state": 4767,
      "to_state": 4768,
      "name": "",
      "axis": {
        "start": "Right",
        "end": "Left"
      },
      "condition": {
        "expressions": [
          {
            "type": "and",
            "expressions": [
              {
                "key": "G_INT_1",
                "condition": "==",
                "value": 1
              }
            ]
          }
        ],
        "type": "and"
      },
      "condition_type": "default",
      "creator": null,
      "create_at": "2023-11-30 14:24:27",
      "updated_by": null,
      "update_at": "2023-11-30 14:24:27",
      "end_at": null
    },
    "5293": {
      "workflow": 693,
      "id": 5293,
      "from_state": 4770,
      "to_state": 4771,
      "name": "\u5ba1\u6279\u901a\u8fc7",
      "axis": {
        "start": "Right",
        "end": "Left"
      },
      "condition": {
        "expressions": [
          {
            "checkInfo": false,
            "expressions": [
              {
                "choiceList": [],
                "condition": "==",
                "key": "Fd6380d03621747689b9776224da468d",
                "source": "field",
                "type": "SELECT",
                "value": "true",
                "meta": {
                  "code": "NODE_APPROVE_RESULT",
                  "type": "SELECT",
                  "choice": [
                    {
                      "key": "false",
                      "name": "\u62d2\u7edd"
                    },
                    {
                      "key": "true",
                      "name": "\u901a\u8fc7"
                    }
                  ]
                }
              }
            ],
            "type": "and"
          }
        ],
        "type": "and"
      },
      "condition_type": "by_field",
      "creator": null,
      "create_at": "2023-11-30 14:24:27",
      "updated_by": null,
      "update_at": "2023-11-30 14:24:27",
      "end_at": null
    },
    "5294": {
      "workflow": 693,
      "id": 5294,
      "from_state": 4770,
      "to_state": 4772,
      "name": "\u5ba1\u6279\u9a73\u56de",
      "axis": {
        "start": "Right",
        "end": "Left"
      },
      "condition": {
        "expressions": [
          {
            "checkInfo": false,
            "expressions": [
              {
                "choiceList": [],
                "condition": "==",
                "key": "Fd6380d03621747689b9776224da468d",
                "source": "field",
                "type": "SELECT",
                "value": "false",
                "meta": {
                  "code": "NODE_APPROVE_RESULT",
                  "type": "SELECT",
                  "choice": [
                    {
                      "key": "false",
                      "name": "\u62d2\u7edd"
                    },
                    {
                      "key": "true",
                      "name": "\u901a\u8fc7"
                    }
                  ]
                }
              }
            ],
            "type": "and"
          }
        ],
        "type": "and"
      },
      "condition_type": "by_field",
      "creator": null,
      "create_at": "2023-11-30 14:24:27",
      "updated_by": null,
      "update_at": "2023-11-30 14:24:27",
      "end_at": null
    },
    "5295": {
      "workflow": 693,
      "id": 5295,
      "from_state": 4771,
      "to_state": 4769,
      "name": "\u6d41\u7a0b\u7ed3\u675f",
      "axis": {
        "start": "Right",
        "end": "Top"
      },
      "condition": {
        "expressions": [
          {
            "type": "and",
            "expressions": [
              {
                "key": "G_INT_1",
                "condition": "==",
                "value": 1
              }
            ]
          }
        ],
        "type": "and"
      },
      "condition_type": "default",
      "creator": null,
      "create_at": "2023-11-30 14:24:27",
      "updated_by": null,
      "update_at": "2023-11-30 14:24:27",
      "end_at": null
    },
    "6158": {
      "workflow": 693,
      "id": 6158,
      "from_state": 4772,
      "to_state": 4769,
      "name": "\u6d41\u7a0b\u7ed3\u675f",
      "axis": {
        "start": "Right",
        "end": "Bottom"
      },
      "condition": {
        "expressions": [
          {
            "type": "and",
            "expressions": [
              {
                "key": "G_INT_1",
                "condition": "==",
                "value": 1
              }
            ]
          }
        ],
        "type": "and"
      },
      "condition_type": "default",
      "creator": "admin",
      "create_at": "2024-03-05 21:04:39",
      "updated_by": "admin",
      "update_at": "2024-03-05 21:04:42",
      "end_at": null
    },
    "6186": {
      "workflow": 693,
      "id": 6186,
      "from_state": 4768,
      "to_state": 4770,
      "name": "\u9ed8\u8ba4",
      "axis": {
        "start": "Right",
        "end": "Left"
      },
      "condition": {
        "expressions": [
          {
            "type": "and",
            "expressions": [
              {
                "key": "G_INT_1",
                "condition": "==",
                "value": 1
              }
            ]
          }
        ],
        "type": "and"
      },
      "condition_type": "default",
      "creator": "admin",
      "create_at": "2024-03-05 21:17:06",
      "updated_by": "admin",
      "update_at": "2024-03-05 21:17:06",
      "end_at": null
    }
  },
  "triggers": [
    {
      "rules": [
        {
          "name": "",
          "condition": "",
          "by_condition": false,
          "action_schemas": [
            {
              "id": 6256,
              "creator": "admin",
              "updated_by": "admin",
              "is_deleted": false,
              "name": "",
              "display_name": "",
              "component_type": "automatic_announcement",
              "operate_type": "BACKEND",
              "delay_params": {
                "type": "custom",
                "value": 0
              },
              "can_repeat": false,
              "params": [
                {
                  "key": "web_hook_id",
                  "value": "BCS_CREATE_NAMESPACE_TICKET",
                  "ref_type": "custom"
                },
                {
                  "key": "chat_id",
                  "value": "",
                  "ref_type": "custom"
                },
                {
                  "key": "content",
                  "value": "\u60a8\u6709\u4e00\u6761\u5355\u636e\u5f85\u5904\u7406",
                  "ref_type": "custom"
                },
                {
                  "key": "mentioned_list",
                  "value": "${ticket_current_processors}",
                  "ref_type": "import"
                }
              ],
              "inputs": {}
            }
          ]
        }
      ],
      "id": 6019,
      "creator": "admin",
      "updated_by": "admin",
      "is_deleted": false,
      "name": "\u4f01\u5fae\u901a\u77e5",
      "desc": "",
      "signal": "THROUGH_TRANSITION",
      "sender": "3002",
      "inputs": [],
      "source_type": "workflow",
      "source_id": 693,
      "source_table_id": 0,
      "is_draft": false,
      "is_enabled": true,
      "icon": "message",
      "project_key": "alkaid-test"
    }
  ],
  "fields": {
    "9562": {
      "id": 9562,
      "is_deleted": false,
      "is_builtin": true,
      "is_readonly": false,
      "is_valid": true,
      "display": true,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "STRING",
      "key": "title",
      "name": "\u6807\u9898",
      "layout": "COL_12",
      "validate_type": "REQUIRE",
      "show_type": 1,
      "show_conditions": {},
      "regex": "EMPTY",
      "regex_config": {},
      "custom_regex": "",
      "desc": "\u8bf7\u8f93\u5165\u6807\u9898",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": "",
      "source": "TABLE"
    },
    "9563": {
      "id": 9563,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": false,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "STRING",
      "key": "CLUSTER_ID",
      "name": "\u96c6\u7fa4ID",
      "layout": "COL_12",
      "validate_type": "REQUIRE",
      "show_type": 1,
      "show_conditions": {},
      "regex": "CUSTOM",
      "regex_config": {
        "rule": {
          "expressions": [
            {
              "condition": "",
              "key": "",
              "source": "field",
              "type": "STRING",
              "value": ""
            }
          ],
          "type": "and"
        }
      },
      "custom_regex": "^BCS-K8S-[0-9]{5}$",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": 4768,
      "source": "CUSTOM"
    },
    "9564": {
      "id": 9564,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": false,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "STRING",
      "key": "NAMESPACE",
      "name": "\u547d\u540d\u7a7a\u95f4",
      "layout": "COL_12",
      "validate_type": "REQUIRE",
      "show_type": 1,
      "show_conditions": {},
      "regex": "CUSTOM",
      "regex_config": {
        "rule": {
          "expressions": [
            {
              "condition": "",
              "key": "",
              "source": "field",
              "type": "STRING",
              "value": ""
            }
          ],
          "type": "and"
        }
      },
      "custom_regex": "",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": 4768,
      "source": "CUSTOM"
    },
    "9565": {
      "id": 9565,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": true,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "RADIO",
      "key": "bfaba606fe9be5d6596270a00c87d428",
      "name": "\u5ba1\u6279\u610f\u89c1",
      "layout": "COL_6",
      "validate_type": "REQUIRE",
      "show_type": 1,
      "show_conditions": {},
      "regex": "EMPTY",
      "regex_config": {},
      "custom_regex": "",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "true",
      "choice": [
        {
          "key": "true",
          "name": "\u901a\u8fc7"
        },
        {
          "key": "false",
          "name": "\u62d2\u7edd"
        }
      ],
      "related_fields": {},
      "meta": {
        "code": "APPROVE_RESULT"
      },
      "workflow_id": 693,
      "state_id": 4770,
      "source": "CUSTOM"
    },
    "9566": {
      "id": 9566,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": false,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "TEXT",
      "key": "ff9e6f2b83c5ea1c47f36e10310980c3",
      "name": "\u5907\u6ce8",
      "layout": "COL_12",
      "validate_type": "OPTION",
      "show_type": 0,
      "show_conditions": {
        "expressions": [
          {
            "value": "false",
            "type": "RADIO",
            "condition": "==",
            "key": "bfaba606fe9be5d6596270a00c87d428"
          }
        ],
        "type": "and"
      },
      "regex": "EMPTY",
      "regex_config": {},
      "custom_regex": "",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": 4770,
      "source": "CUSTOM"
    },
    "9567": {
      "id": 9567,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": false,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "TEXT",
      "key": "I60e9046a05cdff0951ee0acf07d4db8",
      "name": "\u5907\u6ce8",
      "layout": "COL_12",
      "validate_type": "REQUIRE",
      "show_type": 0,
      "show_conditions": {
        "expressions": [
          {
            "value": "true",
            "type": "RADIO",
            "condition": "==",
            "key": "bfaba606fe9be5d6596270a00c87d428"
          }
        ],
        "type": "and"
      },
      "regex": "EMPTY",
      "regex_config": {},
      "custom_regex": "",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": 4770,
      "source": "CUSTOM"
    },
    "9568": {
      "id": 9568,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": false,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "STRING",
      "key": "PROJECT_CODE",
      "name": "\u9879\u76ee\u82f1\u6587\u540d",
      "layout": "COL_12",
      "validate_type": "REQUIRE",
      "show_type": 1,
      "show_conditions": {},
      "regex": "EMPTY",
      "regex_config": {
        "rule": {
          "expressions": [
            {
              "condition": "",
              "key": "",
              "source": "field",
              "type": "STRING",
              "value": ""
            }
          ],
          "type": "and"
        }
      },
      "custom_regex": "",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": 4768,
      "source": "CUSTOM"
    },
    "9569": {
      "id": 9569,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": false,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "INT",
      "key": "CPU_LIMITS",
      "name": "cpuLimits",
      "layout": "COL_12",
      "validate_type": "REQUIRE",
      "show_type": 1,
      "show_conditions": {},
      "regex": "EMPTY",
      "regex_config": {
        "rule": {
          "expressions": [
            {
              "condition": "",
              "key": "",
              "source": "field",
              "type": "INT",
              "value": ""
            }
          ],
          "type": "and"
        }
      },
      "custom_regex": "",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": 4768,
      "source": "CUSTOM"
    },
    "9570": {
      "id": 9570,
      "is_deleted": false,
      "is_builtin": false,
      "is_readonly": false,
      "is_valid": true,
      "display": false,
      "source_type": "CUSTOM",
      "source_uri": "",
      "api_instance_id": 0,
      "kv_relation": {},
      "type": "INT",
      "key": "MEMORY_LIMITS",
      "name": "memoryLimits",
      "layout": "COL_12",
      "validate_type": "REQUIRE",
      "show_type": 1,
      "show_conditions": {},
      "regex": "EMPTY",
      "regex_config": {
        "rule": {
          "expressions": [
            {
              "condition": "",
              "key": "",
              "source": "field",
              "type": "INT",
              "value": ""
            }
          ],
          "type": "and"
        }
      },
      "custom_regex": "",
      "desc": "",
      "tips": "",
      "is_tips": false,
      "default": "",
      "choice": [],
      "related_fields": {},
      "meta": {},
      "workflow_id": 693,
      "state_id": 4768,
      "source": "CUSTOM"
    }
  },
  "notify": [
    2
  ],
  "extras": {
    "task_settings": []
  }
}