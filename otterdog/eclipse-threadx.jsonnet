local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local customRuleset(name) = 
  orgs.newRepoRuleset(name) {
    bypass_actors+: [
      "@eclipse-threadx/iot-threadx-project-leads"
    ],
    include_refs+: [
      std.format("refs/heads/%s", name)
    ],
    required_pull_request+: {
      required_approving_review_count: 1,
      requires_code_owner_review: true
    }
  };

orgs.newOrg('iot.threadx', 'eclipse-threadx') {
  settings+: {
    description: "",
    name: "Eclipse ThreadX",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false
    },
  },
  _repositories+:: [
    orgs.extendRepo('.eclipsefdn') {
      private_vulnerability_reporting_enabled: true
    },
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false
    },
    orgs.newRepo('cmsis-packs') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true
        }
      ]
    },
    orgs.newRepo('demo-repository') {
      allow_forking: false,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "A code repository designed to show the best GitHub has to offer.",
      has_wiki: false,
      private: true,
      web_commit_signoff_required: false
    },
    orgs.newRepo('filex') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse ThreadX - FileX is a high-performance, FAT-compatible file system that’s fully integrated with Eclipse ThreadX RTOS",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/",
      homepage: "https://github.com/eclipse-threadx/rtos-docs/blob/main/rtos-docs/filex/index.md",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "eclipse-threadx"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        customRuleset('master')
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected"
        }
      ]
    },
    orgs.newRepo('getting-started') {
      allow_rebase_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "This Getting Started guide is a series of tutorials that shows device developers how to connect to Azure IoT using Eclipse ThreadX.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      homepage: "https://learn.microsoft.com/azure/iot-develop",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "azure-iot",
        "eclipse-threadx",
        "iot",
        "iot-device",
        "iot-hub",
        "mcu",
        "microcontroller"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          required_status_checks+: [
            "build (ubuntu-latest, Debug)",
            "build (ubuntu-latest, Release)",
            "build (windows-latest, Debug)",
            "build (windows-latest, Release)"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_pull_request: false,
          requires_strict_status_checks: true,
        }
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected"
        }
      ]
    },
    orgs.newRepo('vulnerability-management') {
      private: true,
      allow_forking: false,
      allow_update_branch: false,
      has_issues: true,
      has_discussions: false,
      has_projects: true,
      default_branch: "main",
      dependabot_alerts_enabled: false,
      description: "Private repository used to manage vulnerability-related tasks.",
      private_vulnerability_reporting_enabled: false
    },
    orgs.newRepo('iot-devkit') {
      allow_rebase_merge: false,
      allow_update_branch: false,
      default_branch: "main",
      delete_branch_on_merge: false,
      description: "This guide is focused on the MXChip IoT DevKit (AZ3166).",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      homepage: "https://threadx.io",
      private_vulnerability_reporting_enabled: false,
      topics+: [
        "eclipse-threadx",
        "iot",
        "iot-device",
        "iot-hub",
        "mcu",
        "microcontroller"
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_pull_request: false,
          requires_strict_status_checks: true
        }
      ]
    },
    orgs.newRepo('guix') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse ThreadX GUIX Studio provides a complete, embedded graphical user interface (GUI) library and design environment, facilitating the creation and maintenance of all graphical elements needed by your device.",
      gh_pages_build_type: "workflow",
      has_projects: false,
      has_wiki: false,
      homepage: "https://github.com/eclipse-threadx/rtos-docs/blob/main/rtos-docs/guix/index.md",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "eclipse-threadx",
        "embedded",
        "gui",
        "iot",
        "mcu",
        "microcontroller",
        "rtos"
      ],
      web_commit_signoff_required: false
    },
    orgs.newRepo('levelx') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse ThreadX - LevelX Provides Flash Wear Leveling for FileX and Stand Alone purposes.",
      gh_pages_build_type: "workflow",
      has_projects: false,
      has_wiki: false,
      homepage: "https://github.com/eclipse-threadx/rtos-docs/blob/main/rtos-docs/levelx/index.md",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "eclipse-threadx",
        "embedded",
        "iot",
        "mcu",
        "microcontroller",
        "rtos"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        customRuleset('master'),
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected"
        },
      ],
    },
    orgs.newRepo('netxduo') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse ThreadX - NetXDuo is an advanced, industrial-grade TCP/IP network stack designed specifically for deeply embedded real-time and IoT applications",
      gh_pages_build_type: "workflow",
      has_projects: false,
      has_wiki: false,
      homepage: "https://github.com/eclipse-threadx/rtos-docs/blob/main/rtos-docs/netx-duo/index.md",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "eclipse-threadx",
        "embedded",
        "iot",
        "mcu",
        "microcontroller",
        "rtos",
        "tcp",
        "tls"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        customRuleset('master')
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected"
        },
      ],
    },
    orgs.newRepo('rtos-docs') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false
    },
    orgs.newRepo('rtos-docs-asciidoc') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "main",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Source of the Eclipse ThreadX documentation in AsciiDoc format. Supersedes rtos-docs.",
      homepage: "https://threadx.io",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "documentation",
        "eclipse-threadx",
        "threadx"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 0,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_pushes: true
        },
      ],
      secrets: [
        orgs.newRepoSecret('DOCS_PUBLISH_TOKEN') {
          value: "pass:bots/iot.threadx/github.com/docs-publish-token",
        },
      ],
    },
    orgs.newRepo('rtos-docs-html') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "main",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Rendition of the Eclipse ThreadX documentation in HTML format. For website integration only.",
      homepage: "https://threadx.io",
      private_vulnerability_reporting_enabled: false,
      web_commit_signoff_required: false
    },
    orgs.newRepo('samples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "A collection of complete sample workspaces and projects for popular development boards from ST, NXP, Renesas, Microchip and Microsoft using popular IDEs and toolchains, including IAR, ARM, STM32CubeIDE, MCUXpresso, MPLAB, Visual Studio, and Visual Studio Code.",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false
    },
    orgs.newRepo('supported-platforms') {
    },
    orgs.newRepo('threadx') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse ThreadX is an advanced real-time operating system (RTOS) designed specifically for deeply embedded applications.",
      gh_pages_build_type: "workflow",
      has_projects: false,
      homepage: "https://github.com/eclipse-threadx/rtos-docs/blob/main/rtos-docs/threadx/index.md",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "eclipse-threadx",
        "embedded",
        "iot",
        "mcu",
        "microcontroller",
        "real-time",
        "rtos"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        customRuleset('master')
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected"
        }
      ]
    },
    orgs.newRepo('threadx-learn-samples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Azure RTOS Microsoft Learn Samples",
      has_issues: false,
      homepage: "",
      is_template: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false
    },
    orgs.newRepo('tracex') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      rulesets: [
        customRuleset('main')
      ],
    },
    orgs.newRepo('usbx') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse ThreadX - USBX is a high-performance USB host, device, and on-the-go (OTG) embedded stack, that is fully integrated with Eclipse ThreadX RTOS",
      gh_pages_build_type: "workflow",
      has_discussions: true,
      has_projects: false,
      homepage: "https://github.com/eclipse-threadx/rtos-docs/blob/main/rtos-docs/usbx/index.md",
      private_vulnerability_reporting_enabled: true,
      topics+: [
        "eclipse-threadx",
        "embedded",
        "iot",
        "mcu",
        "microcontroller",
        "rtos",
        "usb",
        "usb-hid",
        "usb-host"
      ],
      web_commit_signoff_required: false,
      rulesets: [
        customRuleset('master')
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected"
        }
      ]
    }
  ]
}
