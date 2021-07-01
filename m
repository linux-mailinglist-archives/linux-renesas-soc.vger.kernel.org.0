Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656443B96B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 21:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234010AbhGATo1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 15:44:27 -0400
Received: from mail-eopbgr1410130.outbound.protection.outlook.com ([40.107.141.130]:51299
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233631AbhGATo1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 15:44:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuzkASR7vaXGPuw2y2XtcqYy+LqOCXklbOdetoJGP/XedBClNq62026rmMie7WdnGIWAoeEvBUWNmLF1W+S+9H4s56TqTYbYPy2KRcSrW3YuG9icjPBr7e8HGInGou0rCo32pIb7ighTUv58XJveJzniK1sZ4nAvMmIB+22UGKmuOWN2uR6zRFSgvzOEq1m57ktflDfwr2KKDKXD5j5HSd0mP6wPE6JXWf+WRcOQgGV4CMK4UKGOOP3Jk/gevmzQvMK5Iy6Ul0Wbp1QBev0Oo1jAJT2bmRZVgthoCFfkq8Er1SN+6FGcuF8Fog9lp1FqR+26CUw0Q1fvKNqmEYkTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c46DUXc/X5oTbQOrjV/abppumDTPCx1ang4SUmwrVJs=;
 b=Yt6YET/bAFJqFv5IF4Y9Ii9zEuR/Nvd3YUoor9Mv1m0Tq+ATczVb66zFcRV0RfJ0lLkW+oODcenssHBJVausPVbedHD5H2t/QhroxOoV2Lm4ppQZAiITTwLMNvSgwKIXWkg4T8Ds9n1z2y/WddbrkWlXU01sSJMDhYmr6hggDkyDXxmzck27qnSz8KHqBbX407dAyGiI6X3I1vUDfuYUSVPcIPYabac3mjAMK38i4KdAFtvIynXHOhhhVMOrQw7bLtw0aRZh5I3G7Igisqjq+l+RUgUYZ8JjTA1FR1rXgDD4xrXSdNMfuh5r+Eh5eWrdGg4nE61mBdt0QGAL13+LWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c46DUXc/X5oTbQOrjV/abppumDTPCx1ang4SUmwrVJs=;
 b=UlKmuvyCrmAElXmO+mPPHCclYqhqHO1DOXfu9MAqxXlnnbEhd/rbPG/WGQnJi+1asdxaVZO/TCkP1i75/jrLv11fvWkej3RRO7W0XDZ5j25N2MGeZLrRapLXlntBLjSKeb00CXQQCmdMScjttqN7V1DmoFIvHW0IXwoadGEncM8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OSAPR01MB4084.jpnprd01.prod.outlook.com (2603:1096:604:30::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Thu, 1 Jul
 2021 19:41:53 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 19:41:53 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com
Subject: [PATCH 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Thu,  1 Jul 2021 12:41:34 -0700
Message-Id: <20210701194135.18847-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701194135.18847-1-alexander.helms.jy@renesas.com>
References: <20210701194135.18847-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [68.225.135.226]
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by SJ0PR05CA0147.namprd05.prod.outlook.com (2603:10b6:a03:33d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Thu, 1 Jul 2021 19:41:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6abbd2b-f8b4-4f5b-644a-08d93cc8470b
X-MS-TrafficTypeDiagnostic: OSAPR01MB4084:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSAPR01MB40847C6B640708256EB55B9EC8009@OSAPR01MB4084.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ob4b0ukIZzbFwHgS5wOWO7yqWF+oTuLA6KvD7MhwthE6qEikelZlJqvfHw/48TaNTuV5lzEju12UeuApRHewS2ABbLOhfq6PCJgXD+pCbpBCbUgu03HwyLFHTKETeXsOeks4HxUIG0/I0vjek93HlvbBwdwENUZb3vTTFXWmzYBXJJUXwRRoT1xPFfzszJfmVCh1sVqKxlT0eybp0cwcqVOfh89zrnRyQPtgb1zipmCsVRHFDOFNd5L9tqDSDSIqe7sVwPuWTsC8QibGvadXiVLnS4HCsHvO/lII5lHSfQW71X4A/m5idhauaEVT/kEjfh2YmKcdbBPpE+1XUAz76/hk35VD1w8U7jZP2rRkmxXroy7wWZcz5MisoSHCYEvoH6/+WAZ7BKxFXSNCYFAn8DQuQ7ALCp0bYUXGcZ2l9HeUP1A/VoUP/hY56M5cSTkvfUzyUpY+2WiYHLQW4pzcicoyW5FOe8pvGjXWG0jrpekFa56txMdl8M5jAumUF5+oak5OxEhxCcJuiqJv+HWZP/pmNvUwf/9e04/pQGhxtToptLdGNtVIvYmgc2qzmPpOik9j8cEcX+3GA/RTn9c6s1rsZ3Islkvvd5vlmCxjSVkt7DnonSjxKXQtQvFinsBKbfxQjdozVgLVU4l+/QmBKuFklbeK76SGb684jOzYRXQa3Tdguqhlrk2meYxya8tCtkZn4oLTA1OpHhbEK0aJohp6NzQD6G2W/0Vm+hL7GtaB4DhH0Tx+3hmJBu60Kqe7L2O3YC+KeM2IdZuFS/EQDaXBXnk7HWehuU2nZmLoej6AxNLolvOga/Nvvv0H9oJOci3cHB50Wk6cvTV4hYal7DL/VuCWsAz3lQJQz0AlsFo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(366004)(136003)(376002)(4326008)(478600001)(107886003)(38100700002)(8676002)(8936002)(86362001)(38350700002)(956004)(5660300002)(6506007)(2616005)(6486002)(966005)(36756003)(103116003)(6666004)(66946007)(6512007)(52116002)(1076003)(16526019)(66556008)(26005)(186003)(66476007)(83380400001)(2906002)(316002)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+jiXyNaKk4N2ZpEcIOtgPUzbRb78DMnzqmar0ZjEJ9mCJ6h0mAtjX8EYnwci?=
 =?us-ascii?Q?WJbG94gyYWI6bBcRMoDC66u4xSosUs4hVVOk3R5ij4OOXlwRuwnMBzfLINIT?=
 =?us-ascii?Q?VajNVpn5wWivufT17I22uv/xUHRX5bt+CkRfWYYMYzRIQ/h89FvOsWfVpg1N?=
 =?us-ascii?Q?w9ZpJUL5yzpXMWwOIzjkA6yhn5WxKx6ySpjedxBRcO2SiiJf/q0dR7Pengir?=
 =?us-ascii?Q?D91bMp3fXVRsqNGZf+A8U6V2iBIvRzzYvycEcRDiFecfMTQnMSY6YMgxsGBB?=
 =?us-ascii?Q?tUU8khRWGItwD0PTb4dWi2w2FEzu3qdL7x7hVGDZ8fh+UGMAuljaQ0OFOCOd?=
 =?us-ascii?Q?Pun/GDBxJcXtFwx0c5NDxuDy25f+TeoRaaioAkQRbzvr7xakTpW326AWNzzj?=
 =?us-ascii?Q?9CVKzIQHU84HMh+k6HAds5leNILL2plhDukp7Uw+BffhNK5bDedEp00+jM5q?=
 =?us-ascii?Q?yGKzTFk+T/HrxngjKC1ilA8AmHqsit49icG3tnbHjyIGgqMnJE6DM1mEVQyL?=
 =?us-ascii?Q?OWoMg31BI9SfYMAygNxkkvViz7tSETtpF+crSagb0LnCcj93agLaPzWN03ZC?=
 =?us-ascii?Q?2ktp15sLTY28ywOglcb2SFA3f55MEDMilfzY09wp5l/KOgvsj3beAtsWGJM5?=
 =?us-ascii?Q?Zj8O0B4ngFW2VYpsy3my1HB71ejAj+oxHCFRSphN1bJkk+Kzw4RFu8xruZIP?=
 =?us-ascii?Q?kclIOylPUx/foErgLO3a5Ouv/6+DTwsuInreSSBQi7+rVu9ampEjAkjQeNph?=
 =?us-ascii?Q?/ptY82ge8uXXA3sveDbe2MWWQmp6SOmMvBSYu2lW3l9SiWY+KR/0yTq4WVay?=
 =?us-ascii?Q?r2ehl8Pbssof8zUmM4uppzWgRAtcr1V4n6h42kh58cFWqIzbwZs5t/20yuKV?=
 =?us-ascii?Q?5Y5aijJLNOyx92+ZEA4OQgQGD7rx8lonwLS9ps+b6sO3lfmuhcmhbKg2YEc/?=
 =?us-ascii?Q?yLwPmMxWrVNCV2nH92LoVY6P/qy22FXZ4b+VTHEwa/4/oX8Rt7S93/7xZfCc?=
 =?us-ascii?Q?CtScdsyxAQIu+bhVeJRyZvaKMqdprhID0S5WqjKFvwsbrYkerDk6izBaF4II?=
 =?us-ascii?Q?LwDXNk+UWTmcRaZpqzK8AhwpAmMxSjxQvei8X27tRZFR+Uw9KzTXd4F2ds+V?=
 =?us-ascii?Q?ZJcs/a2pv8q1kxBVLV2Ca+i8EDzajLXrmA4sn+Yjd5dPjpewpzzyxbOymGO6?=
 =?us-ascii?Q?xxQHXxzwQXqZo0ZSmwG9ek8aNZOvcSCagT9vNOWnduXerhX5EK2CVIp8Z0pc?=
 =?us-ascii?Q?lhbqX4u7bW2H6weyRWaIbU0BqfuZxxHHyrfQU7zQYpbkoRJNXk+ToW6dk2nU?=
 =?us-ascii?Q?aAG1d04RWKxT0WqVbepl2eEl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6abbd2b-f8b4-4f5b-644a-08d93cc8470b
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 19:41:53.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCvhx1dKNVa1afLXG/aZ3mu8pU6qTaDoibGO0llFD6gfHglRAHm0Zl7QJzM83H0neYiHHjM2G38Hzw9D9e77/my9LfQC7MhJQT4I/rYTU+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4084
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
The 8T49N241 accepts up to two differential or single-ended input clocks
and a fundamental-mode crystal input. The internal PLL can lock to either
of the input reference clocks or to the crystal to behave as a frequency
synthesizer.

Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
---
 .../bindings/clock/renesas,8t49n241.yaml      | 183 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
new file mode 100644
index 000000000..d817ec46d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
@@ -0,0 +1,183 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,8t49n24x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for Renesas 8T49N241 Universal Frequency Translator
+
+description: |
+  The 8T49N241 has one fractional-feedback PLL that can be used as a
+  jitter attenuator and frequency translator. It is equipped with one
+  integer and three fractional output dividers, allowing the generation
+  of up to four different output frequencies, ranging from 8kHz to 1GHz.
+  These frequencies are completely independent of each other, the input
+  reference frequencies and the crystal reference frequency. The device
+  places virtually no constraints on input to output frequency conversion,
+  supporting all FEC rates, including the new revision of ITU-T
+  Recommendation G.709 (2009), most with 0ppm conversion error.
+  The outputs may select among LVPECL, LVDS, HCSL or LVCMOS output levels.
+
+  The driver can read a full register map from the DT, and will use that
+  register map to initialize the attached part (via I2C) when the system
+  boots. Any configuration not supported by the common clock framework
+  must be done via the full register map, including optimized settings.
+
+  The 8T49N241 accepts up to two differential or single-ended input clocks
+  and a fundamental-mode crystal input. The internal PLL can lock to either
+  of the input reference clocks or just to the crystal to behave as a
+  frequency synthesizer. The PLL can use the second input for redundant
+  backup of the primary input reference, but in this case, both input clock
+  references must be related in frequency.
+
+  All outputs are currently assumed to be LVDS, unless overridden in the
+  full register map in the DT.
+
+maintainers:
+  - Alex Helms <alexander.helms.jy@renesas.com>
+  - David Cater <david.cater.jc@renesas.com>
+
+properties:
+  compatible:
+    enum:
+      - 8t49n241
+
+  reg:
+    description: I2C device address
+    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]
+
+  '#clock-cells':
+    const: 1
+
+  clock-names:
+    description: Name of the input clock
+    minItems: 1
+    maxItems: 3
+    items:
+      enum: [ input-xtal, input-clk0, input-clk1 ]
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    /* 25MHz reference clock */
+    input_clk0: input_clk0 {
+      compatible = "fixed-clock";
+      #clock-cells = <0>;
+      clock-frequency = <25000000>;
+    };
+
+    i2c@0 {
+        reg = <0x0 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        renesas8t49n241_1: clock-generator@6c {
+            compatible = "renesas,8t49n241";
+            reg = <0x6c>;
+            #clock-cells = <1>;
+
+            clocks = <&input_clk0>;
+            clock-names = "input-clk0";
+        };
+    };
+
+    /* Consumer referencing the 8T49N241 Q1 */
+    consumer {
+        /* ... */
+        clocks = <&renesas8t49n241_1 1>;
+        /* ... */
+    };
+  - |
+    /* 40MHz crystal */
+    input_xtal: input_xtal {
+      compatible = "fixed-clock";
+      #clock-cells = <0>;
+      clock-frequency = <40000000>;
+    };
+
+    i2c@0 {
+        reg = <0x0 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        renesas8t49n241_2: clock-generator@6c {
+            compatible = "renesas,8t49n241";
+            reg = <0x6c>;
+            #clock-cells = <1>;
+
+            clocks = <&input_xtal>;
+            clock-names = "input-xtal";
+
+            settings=[
+                09 50 00 60 67 C5 6C FF 03 00 30 00 00 01 00 00
+                01 07 00 00 07 00 00 77 6D 06 00 00 00 00 00 FF
+                FF FF FF 00 3F 00 2A 00 16 33 33 00 01 00 00 D0
+                00 00 00 00 00 00 00 00 00 04 00 00 00 02 00 00
+                00 00 00 00 00 00 00 17 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 D7 0A 2B 20 00 00 00 0B
+                00 00 00 00 00 00 00 00 00 00 27 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                C3 00 08 01 00 00 00 00 00 00 00 00 00 30 00 00
+                00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+                00 00 00 00 85 00 00 9C 01 D4 02 71 07 00 00 00
+                00 83 00 10 02 08 8C
+            ];
+        };
+    };
+
+    /* Consumer referencing the 8T49N241 Q1 */
+    consumer {
+        /* ... */
+        clocks = <&renesas8t49n241_2 1>;
+        /* ... */
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0cce91cd5..882d79ead 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15575,6 +15575,12 @@ F:	include/linux/rpmsg/
 F:	include/uapi/linux/rpmsg.h
 F:	samples/rpmsg/
 
+RENESAS 8T49N24X DRIVER
+M:	Alex Helms <alexander.helms.jy@renesas.com>
+M:	David Cater <david.cater.jc@renesas.com>
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
+
 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.30.2

