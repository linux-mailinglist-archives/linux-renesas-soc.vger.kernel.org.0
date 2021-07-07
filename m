Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6BE3BEEAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 20:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhGGSa5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 14:30:57 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:57956
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230371AbhGGSa4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 14:30:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdhYvAl1fx4YHkSRJwN+T41S7bAcVF411fWMGyTornCKpPxGzRjJPuYjpUwpUBLx9ne/Qbtnx8fR0Aa/Bzov1jQWMfGSPjE9oOLnFrJ/RFJi/9MwyQG+nXu6kLAQ2Tof+ef+nNlIEPeyxF7UeKsGzPsyxmF10X4wZTi8knKabVgLYVYvHBX53ZXHMNxNGtsYV2O5oxoqG60RoVZUCdOn/lUdXX9XoTLcp302Mv/JujE74eeYyeRGRMZn01kSHXtHM+S6Ygxoc8/SlUsGg2xjTYg0xSHrUedLrozijpkoqBnzMgUNcmXUhIIXLt3nbHmnCVMOnVcdRLPSpyfcwTT3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l//jAABjXeMEaOkXt8/s21saZ75X3YzwNTFUVJP7U0U=;
 b=oUWsyHUT+nfFYFANYHS2yquzKMSMTWPs+CvEUpKZf+YU0sX69I13WYCmtWZ1za9Q8hjUm4KAylnxnhrUGTopIgXjPZHI3f8KSAj9jvyrvkjRPOfVDBXhr5trDVUzXT7FU4l2xwaA9ckQ2AvzyHEkZmx05dNc17sjbgwH4k7NHvIt4C/pQDDRT7Vw3oukRt8AatkhlE07HaPEK/gIuHKnq9uUgfgEFNvu3RsSr+0Pap+2I0Oz9z5YsUL4xqkgBMAm9fbsMCizTG3KKZzvEuC/g37e+qtEImB7S5fW97fRJAb+GM8BzwZVp3HiNJcvWpxuzKBTr0rgwJbUZ3/rzJLFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l//jAABjXeMEaOkXt8/s21saZ75X3YzwNTFUVJP7U0U=;
 b=JFcBA5L0jWLUtO0wl3IQy6vIaMVwWuVaPVvXSugl4dEvp4QU0uLxs/CKPaF/NgUxmpolorqsf96bi/3lQVyxkC0SstLGJgtKQbuKRWMDYjHyWiXSS31UGtFrRhPM+fAJMMwpHVOpiCDxxzWgfZUCUTkkFf1gncCsIfbZ/GOeTeI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB5847.jpnprd01.prod.outlook.com (2603:1096:604:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 18:28:13 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 18:28:13 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v3 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Wed,  7 Jul 2021 11:26:58 -0700
Message-Id: <20210707182659.20548-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707182659.20548-1-alexander.helms.jy@renesas.com>
References: <20210707182659.20548-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0045.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::22) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by BYAPR06CA0045.namprd06.prod.outlook.com (2603:10b6:a03:14b::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 18:28:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 781337b5-2105-448d-6df9-08d94174fb0d
X-MS-TrafficTypeDiagnostic: OS3PR01MB5847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS3PR01MB58478440026CB74BF7563013C81A9@OS3PR01MB5847.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1hnMw9ZwqNKV9PYR7U0BHi5+afj18EGTSat56S/oIsYhooiPYzknQHPKqx5JqR+aDnkXTkfrODsC8/LziZEZ60oZBRFdg0NkkMrtg2jZiV1xxEywjBQx3JS3gKSgzcwmFfTHtNGd1XSa39t6Heqqrt66WdX0iyZQF1p8FYchRajAiMz6ODBOPkIGSVHAEWE7zUx5PjIwEjm88NGcghigQ1mw5TOEnWWFVWV8sjudHVAAzDam610PLsHOgE5dx0oI/QZiA+vD+Cld49VFy7zOeVgMVNMXIdsoUQ0PK3v6WHFI4p0Ft476jxuBh4H23GYYG/W+GDYbzbe+Eyr6Gfi2naaKxV1Ir9J+p1Yb8H1J4ws7kbGS08+3/Xam4onYGYaEBvx0IlQsBKkG+kqiA+p1PNcvgfmkqUiIG/ptCYOSvxLaifqwGbRGb+pi/eUbfaO2PQgE6wIdOP6HfeB7syGtKjZEfCs2SwLeg20LRg+SE107kRUI8BRa38cEdSnRVK4dyy4dQ6l5Vl9ujYcuJyZrJQD+syp59Q7AE+bq39PGH4p4av0Q/L/MeL/7gPzpUmMoR/ExUtd7HkmDBP2N8Yu8cpY5TygBkADu4jp82CFcAjgsnmJbntptBmnq+QtuqY6v8pdO+HmpuNwY4MOC6A3/e+8VGTmXEIq+deu8XnnTqtK/Cz5SM4BI0EPx7/ZnjtfCzndQLgGxP96v1JMu6l6TWnHZT5U0MHAwzYLbl+UCbeXVzxlqto36HqP6S4qFUcrcQ8iZpQLmNAX6gD4VYWjT2iYraqwAoTkJJpW+8p82G4t4hz0sMVzprIc72Loag6DVJhzD1Ga5Lgk4smmH0VBt7kNcbml7cZtpfa9D+62ie4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39830400003)(396003)(6506007)(66476007)(2616005)(103116003)(8676002)(966005)(186003)(86362001)(36756003)(6666004)(26005)(4326008)(83380400001)(956004)(52116002)(8936002)(1076003)(478600001)(66946007)(6486002)(38100700002)(2906002)(5660300002)(66556008)(316002)(38350700002)(6512007)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QCslilqc8zF8lJUKgLDplXKtvuln8hdtt5OVHMMT3WOpp2YtSlq+9UYtA0lP?=
 =?us-ascii?Q?omrHZgDOmyqHr/APCHNM2Etdyv++iqBveE5mAPVRU/xLARGaztykHhZ/GilL?=
 =?us-ascii?Q?RL5Xp8HtAOTfz82ZKnqxIcUeGDcFLtv7XELRuStd1NDEw7cY9bbx7rOtp0N2?=
 =?us-ascii?Q?lwHli7EQRiQtg8aBEX98N6B+D6G4xvKinHjJ1LNXwR/qd99jFS5nz2mD4fDr?=
 =?us-ascii?Q?w2IuTNTfJakPfG7FTK5pmgdd31Yd2m753VFdvoxBnTDdNvUeCkOG40pBci5F?=
 =?us-ascii?Q?kJ/pOh4CCEydVcNDiswId5jWHbl/1w0LE7+BP8DwGv1O6nUwbdtMdGOC8+ek?=
 =?us-ascii?Q?Lj5qSE2jVuE24guARrsa80Sxze47d1r5zAtw5e2G/IhJ+ugCeMQsSlXMSf5O?=
 =?us-ascii?Q?gim4TDe7bX91/EfNdNMl632tr/ImYg9fycO8SsD3/UR1c9EE/u3WN6etwf5a?=
 =?us-ascii?Q?40AeEyj0CjCT+l0V4MW06R2h3lGn1AfgQaNHh6oE87Voej1Gpgfk+pcukX0I?=
 =?us-ascii?Q?fCUedP9Ih8qmj4RTdplvFAGOuzeSvT5vBZ5ubWvF30hidFPZqlGf8p1izrae?=
 =?us-ascii?Q?epB/KND/t0vEtq3Its1nZmmeDkRC0aiwUyvSki/h3LEKHPwqrbcz1j6sYhXW?=
 =?us-ascii?Q?bIUbEseuxFNOOncHna3T7sZKeH6ypIParVfFj032GeSOYMK8sta81dftBdhU?=
 =?us-ascii?Q?LjFNWEMj98a9vb+w1C1x2B2dM0TvTf7ej0OprbY7SEk/IGZdF23GEaAoRoK3?=
 =?us-ascii?Q?xQxMHT7ty2EmPt1dJINdL8btbvj/K9vqs6dcWGoklCg5QWWI/aMZqQyT85mk?=
 =?us-ascii?Q?Cd/9BnUmwk5/XUb3z4zFSS7xBH6DtUv9ddLVXdA4UKbuaON71ShEaN09vdBl?=
 =?us-ascii?Q?YbhyKWwIqNLf39l36tpl1i0fKJ7K9c1J59m2xKTbSYigxRBF2BdC1637BW7j?=
 =?us-ascii?Q?uhknbaqiH7Ze9GtjUj5IhRZhZeZZ6j5VpacEx/ymM0EAKZFKd2tA1KRZle/K?=
 =?us-ascii?Q?YDK/wKR15Q/KFM0qC4OPNw2QAY1XhPanzcjO8AS8hyQ7YmGuDiVEDMr9QZMW?=
 =?us-ascii?Q?ZKPzT3pafddWYLBi5CJD9AutGYEKKKnYeLXU8mL3bqbQyVeBRSDAYVyMcHfq?=
 =?us-ascii?Q?//310hfaCX6Jb7z7yCvUBiY8D5NUO1YJQTcfJa8JOx13Nfe3zpRa4FFBN0Sn?=
 =?us-ascii?Q?r/7X0FT4tFFxOvI8gyhuP9xsfM1THsxSgjTyvR1HDHTOHchBUQO5RwhQbsvB?=
 =?us-ascii?Q?gZx19D1HC2Bkkda4kPz9Md+5GdQoMANn3JYDNDtsLaZYoy8CTgbw9wtFWgWl?=
 =?us-ascii?Q?ipIWY9BxzYlo2Sn+AB1CNIQi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781337b5-2105-448d-6df9-08d94174fb0d
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 18:28:13.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDf3STfPEFFOtmTbLyDsT44ExipRJM+oUV8/AmXJYBXWBXC0d296qpRZgLwPlUAZWQh4Vcj+xMa7/ph/eageOiTXbAtU2JTMQaosvJZjr2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5847
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
 .../bindings/clock/renesas,8t49n241.yaml      | 188 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
new file mode 100644
index 000000000..4e26b3f11
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,8t49n241.yaml#
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
+  settings:
+    description: Optional, list of space separated ASCII numbers in hex.
+      This list is the entire register map of the product and must contain
+      791 items.
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

