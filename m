Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488C63B98F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 01:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbhGAXZy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 19:25:54 -0400
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:30825
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233894AbhGAXZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 19:25:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJ5cWttwUapbsyPnHtVDsnBkszPRHcIcNksTy71c5QyDggsCIZFgDh0rIumvc0iPuzYEp2zxjwsd7xcsVW2TbZDbBcCa9+TsxLtEH1UxNhJjYFi9cdLizCl6B3b0w1mDyMRMkoJznPnvsB9CjlYVGya/ELHDKYMyPMD2opQgAWgxsnXeJdInoaEpWyCqcXqLFzDQz83nLVAOJevcW/8lij284QYGnK1bj6zhdFoBcPiLWMe8vk1+VocBr/bNA0c7p+WmjeIo1FrDT647iTs/1+9ZqFs1dhO92HmTZlOd/bdDBRTI522Rp6wOnwU6NMJEmZ6wgRSP0GnYqkkeR/G1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c46DUXc/X5oTbQOrjV/abppumDTPCx1ang4SUmwrVJs=;
 b=ZRUE6zinwdX40qm7XCGHsQPHNf3oHUyiyHr+VCYDTx/KvuKg2emd71gfvAW30ei8nxv2v/Q7Vuh5JS5eAZ19BFRaHgMS1eS6XkpfdSyR0C8DiBPh1jUoyGny43a5duz6kywggiQlxuzZ6XFweT4wjv9LZ5J0330pXYMqGpf2BeF1/WGKnf37NXBbkbORSQ4cUd7UC0BK/kTRWJW/fRJI4hizsD4niItfh12z7sTUkUb40h5NyVEbEdudCyCejWGuwJnUyJ5fPJApweHR2KJ7FYt88YZT0beEq8RCPNAd3uu0YD6vRyfSuyh2+iqQf55OgHzNfJ53rW38xwH0LQB+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c46DUXc/X5oTbQOrjV/abppumDTPCx1ang4SUmwrVJs=;
 b=qUzd4DFtkoe6UQ4qan5snxauq1A7s0ZjGyOu1KwEX6xciUrSGdBVv0MDItiAsHwZi39Q0pHuv/Aq7m31EcsmlB/lpVd3vhgM96/UIn3fK8Uh5vY0yhXenXBi5zHfpHgQEaaapCSOH3timC5TYjC4ivWnOU3pC2jmdYx9Jxzn76s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSBPR01MB3894.jpnprd01.prod.outlook.com (2603:1096:604:46::23)
 by OS0PR01MB5683.jpnprd01.prod.outlook.com (2603:1096:604:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 23:23:17 +0000
Received: from OSBPR01MB3894.jpnprd01.prod.outlook.com
 ([fe80::fd89:5162:7a65:7830]) by OSBPR01MB3894.jpnprd01.prod.outlook.com
 ([fe80::fd89:5162:7a65:7830%7]) with mapi id 15.20.4264.031; Thu, 1 Jul 2021
 23:23:17 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Thu,  1 Jul 2021 16:22:57 -0700
Message-Id: <20210701232258.19146-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701232258.19146-1-alexander.helms.jy@renesas.com>
References: <202107020640.YyVoU69S-lkp@intel.com>
 <20210701232258.19146-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [68.225.135.226]
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To OSBPR01MB3894.jpnprd01.prod.outlook.com
 (2603:1096:604:46::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by SJ0PR05CA0194.namprd05.prod.outlook.com (2603:10b6:a03:330::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Thu, 1 Jul 2021 23:23:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ccf0ff3-4eff-4206-d734-08d93ce7350d
X-MS-TrafficTypeDiagnostic: OS0PR01MB5683:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS0PR01MB5683FF7F23C29EB006A1A544C8009@OS0PR01MB5683.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G0OVFZUJc9qjHyf3lV8KbiTVLMNH7uCIpIzrPTyNgXC8cYicAuva3w+Wfg2KYLpdD+LBB5aUQlsvgbuWbQj7e6C9xBqqTCSkjaNQ00EqQMDFsH9ZC+aYpBIoJVYCplZv7gThrmwliqg0IJ+QCHB8QOup4OQLFBcDQOeVLcD0f/FWz8uQKfXEdSVuY9hr1ffzXEPg8p2cLOraMt+Rp3bs0rxJ2hTNG3nIHgNJt8BdmWIDkWz+YWfrLphvA+7KaPAd9D579Bmwc5t3eEF6+vJ8WAvs2aHi8JAwnEox3768FsV6cs9/NoaBOpTHeTA5ScC8GQWELnhim+A11350dgBvRdISTzWQ+zq+WGegfET8H5shlH+cL+Y49EczzMBltKeubJnK2s3Pthqa13IAoZdk8sw9nRHVSWmS0DhtkumMGpjEtJy0ag0xFOXrCu4KySHrZ0b9DDTh3+NqemEwhv6tBRsHAmb8L8LWLnI7f/lFUm+3CJ6BwmWSQ0ipIDciMTTGTKktkEvGugOxlsSE6UFNY//t3Iiw53k5SYukRwxHnaEuPkEYLgnm21eZgSuzZN1qrtjJ5GTxCgUVuG6lXNePcYth6Nf0mlzfnRG3CO0X/FeipEajWl0CAgXwTxOdRDC23FDaPkFCk9stm0jkC2OThJ+mvNbWxoJ3vLTLoat4izaMH5nruLJFid+lnUKS7b6ixFxXjh8cY8Py1f7pXohzxnxaTCKUmPaS7obsqZLLWRs1cu7fgw8C3dZtVA/JQmbRYj38wQEfNHPmRu3h/JOlBcTvTIw85ZLNR3Yy7hjhvlfU7lyxwdKr08u+4OQh5aQMllkJ5mKbRALhRxFu4NQc3sJqqrs98h9sYBMIQuwEo/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB3894.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(2906002)(38100700002)(38350700002)(26005)(66476007)(36756003)(16526019)(186003)(316002)(86362001)(6666004)(6506007)(52116002)(83380400001)(5660300002)(103116003)(66946007)(66556008)(6486002)(8676002)(966005)(1076003)(478600001)(2616005)(6512007)(4326008)(8936002)(956004)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2bCNiP2Fl3/8O1XA3OqARBBrMD71VDGfpI6yBpw1yu63CxU3vgvdb7Cd68z?=
 =?us-ascii?Q?SnVlMF7fTD6LFB4e8i/jJH7qQSDHlfLH+j6UOCsVNaQt+bMXPgqMWhms4L+1?=
 =?us-ascii?Q?N+gfhSKO6P5FSmUPKpXsQpMY23rAllLYS7sm9Ox049S7MfEe1tV/n8HTXrqB?=
 =?us-ascii?Q?GHO2hARjSXFKrE49ZH4CnnSKbQHlCxXFu0GqXrRfSREhdklES1nMHy0PpNQr?=
 =?us-ascii?Q?EmtlL2N87X+oTStTPiakVTEgl/aUB3uisI/o3qyEzI3+2Zfho0erKRh47Llz?=
 =?us-ascii?Q?SuXxr2Q8z3BG/lljQMP+1yl2NKtJTWnNth6PWFolpLFc8gkAZWy05hBLHBkd?=
 =?us-ascii?Q?Lwd2/ZZFKCl/FJ4gagiM7GDMjbdOqcX/aaa1OtzTGoLqLyEJ4SCdfh817WDv?=
 =?us-ascii?Q?BjBG2G/gz1B0UzRmh9RFf0+XDUA6zfgz8shwrL42kXu9w+2rumSyChP4FFac?=
 =?us-ascii?Q?ZlnxdCM3Jjy2T+/paCzIbLoH1LoI4nI6HRMqLJTQunA/gMZus1eU0NmOVfII?=
 =?us-ascii?Q?3BKWOVOVL2znW9LHb0WKNkIjWQ+Icu8/HwubdQbGmrf7OQbHdLIwuyeUoeRd?=
 =?us-ascii?Q?6ovsrXq6cEGfMVEjLXH51wpTD+uSOxbE9s26oNUTmQTN6e8cHLFc/UV4MsV9?=
 =?us-ascii?Q?xIfjyOuGVQy+kqtEna/SBb0qYuZs7+mj8teX6Rbq8sp+/2Hw8GzdIdjpn5z0?=
 =?us-ascii?Q?cFWXpVnrZV0moH5X4xB3QYIuP0aFAwdHemJmY5cOkITkl2HYXkwrjduYG1ao?=
 =?us-ascii?Q?R0Udj4IUyM/ZyIWCVhz7wXzca/+151qnd+oRkqPhHE1ghheA9YNKQOsQ9W9g?=
 =?us-ascii?Q?76JvtetFJTRhLIGn0/6QJHBCwVzmj/0kscdA5b6+LszoDFz1WVMOzB/ZBn+q?=
 =?us-ascii?Q?HrOb+Qrv5PwI6SCC/D4i8qQx8wdJgDHY4phsFAd1C6qQRn7dgeN9vPp+Le54?=
 =?us-ascii?Q?vr9Xzig7XzY5ddx9Gyn3TXznfW2f45p9c3SMlIjwZIZXRsv8vnBfu9rVf2f7?=
 =?us-ascii?Q?v3xEHks1PZiV+cRGbQoVEfiRTAUi86frPaOKJG+ncc7TqpffNJ28wtYOt/f7?=
 =?us-ascii?Q?h/KOyc7igwQTvQCzCFVEOB1TCHSQvNrI814QeZpdK6SgUTJI4hBSqyW1Xa7l?=
 =?us-ascii?Q?/HjDQOWgE+P1Q7WYnydsOuYgTg57M5/CH5bxT8NHnJx5nmA8j3Y95zdfVcdY?=
 =?us-ascii?Q?Ah9585OjnFhRyv+cPDv6EI5JYGmuAg5qN5Fm8bc+cH3zxQrdtdoHYBxWaGnC?=
 =?us-ascii?Q?Mp/Lat4AnfjN9sbwNWt1rbC7cBUIm9mlVsRlEg1WsUNAFzGljp2dHJygdEm4?=
 =?us-ascii?Q?O52CrtWEMT25xC14nvl/gJMC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccf0ff3-4eff-4206-d734-08d93ce7350d
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB3894.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 23:23:17.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Cn+jwcFaIBBdxw7FThysN/DEEsFddhJX2Pj5n7+YqIi6Cw14mCEoPTlGRhY9f3GkWm9Ep+7XBWvAIGRz2p+QW50z1Ha1UM+zt/jBCb4gE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5683
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

