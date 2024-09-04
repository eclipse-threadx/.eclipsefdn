local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-threadx') {
  settings+: {
    description: "",
    name: "Eclipse ThreadX",
    security_managers+: [
      "tmp-threadx-msrc-vulnerabilities-transfer"
    ],
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.extendRepo('.eclipsefdn') {
      private_vulnerability_reporting_enabled: true,
    },
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
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
          requires_strict_status_checks: true,
        },
      ],
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
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
      webhooks: [
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=3fd9c494-4cfc-495a-aff7-b771f2cc1ee9&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=e2470328-3625-491b-b0ee-88d4897724c9&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "pull_request"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=44e34933-07fc-4519-a112-1fe562b7c902&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "issue_comment"
          ],
          secret: "********",
        },
      ],
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
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://microsoft.webhook.office.com/webhookb2/1637bf82-9a8e-420a-8df7-2303cff8f3da@72f988bf-86f1-41af-91ab-2d7cd011db47/GitHub/d35b0416a6ae44edaee34e74ffb36086/23b5eab6-603f-4506-8e51-23cb2da74eef') {
          content_type: "json",
          events+: [
            "issues"
          ],
        },
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=8d59a712-f6fc-4aec-8b4a-210d3ab77ffe&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
      webhooks: [
        orgs.newRepoWebhook('https://microsoft.webhook.office.com/webhookb2/1637bf82-9a8e-420a-8df7-2303cff8f3da@72f988bf-86f1-41af-91ab-2d7cd011db47/GitHub/eb409329fff24571a60ed5d0f02ca9ae/23b5eab6-603f-4506-8e51-23cb2da74eef') {
          content_type: "json",
          events+: [
            "issues"
          ],
        },
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=09a1087e-99f2-4028-82b9-06bb3bf5e71f&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
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
      webhooks: [
        orgs.newRepoWebhook('https://microsoft.webhook.office.com/webhookb2/1637bf82-9a8e-420a-8df7-2303cff8f3da@72f988bf-86f1-41af-91ab-2d7cd011db47/GitHub/7883aa6663bb4513af9d2e226d76d636/23b5eab6-603f-4506-8e51-23cb2da74eef') {
          content_type: "json",
          events+: [
            "issues"
          ],
        },
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=ae3be374-c9cc-4a6f-8dbc-5ca427abc399&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          blocks_creations: true,
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('rtos-docs') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
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
      web_commit_signoff_required: false,
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
      webhooks: [
        orgs.newRepoWebhook('https://microsoft.webhook.office.com/webhookb2/1637bf82-9a8e-420a-8df7-2303cff8f3da@72f988bf-86f1-41af-91ab-2d7cd011db47/GitHub/d09c81ad786740d18e7e546c70aae5fa/23b5eab6-603f-4506-8e51-23cb2da74eef') {
          content_type: "json",
          events+: [
            "issues"
          ],
        },
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=cbc2ad98-aaac-47b2-89ee-510cdefec311&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('REPO_SCOPED_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
      web_commit_signoff_required: false,
    },
    orgs.newRepo('tracex') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
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
      webhooks: [
        orgs.newRepoWebhook('https://microsoft.webhook.office.com/webhookb2/1637bf82-9a8e-420a-8df7-2303cff8f3da@72f988bf-86f1-41af-91ab-2d7cd011db47/GitHub/d7ec19a1e6b84d76bdfbbb8193633099/23b5eab6-603f-4506-8e51-23cb2da74eef') {
          content_type: "json",
          events+: [
            "issues"
          ],
        },
        orgs.newRepoWebhook('https://expresslogic.visualstudio.com/_apis/public/hooks/externalEvents?publisherId=github&channelId=2c49b1c4-da04-45b5-9cc1-50bc6105b69e&api-version=6.1-preview') {
          content_type: "json",
          events+: [
            "push"
          ],
          secret: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_code_owner_reviews: true,
          requires_conversation_resolution: true,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
