Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3AA435265
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Oct 2021 20:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhJTSM0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Oct 2021 14:12:26 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:50816
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230515AbhJTSM0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 14:12:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEUUemDAqhZIhcU6LnGyeWIKMHJt50kpklYMXhrk1+sIpvqTdhJpn16CmrNQqex97uWMky63OUrHWnd7su78qc1a1uosHvvOtZwTbzJlMA+TrAAigvytI2ihvejqU2E99VGcSZohWnJRWHZpG1+EX9loqZrOXUPnoo9C8dnhelRQ2EKLPND5TYXVhZr2z8zHqzW8rtba0o5TjZASm3VMhtDHP5qYHi7ZsIjCq2FGdFS0/21cA5yXwSn+4Rw5z8Ym+cq9wqrgYG0viGvHxoswUL6r0zaIq8TAFabUst/dn51u4EPd3a++WrIvtnhpE1DVO1nI9xANKB6AmfSJylYCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2oxI8f0WlmaiTDUR1mJVL42j7rdIh4KmZQYKNGijH8=;
 b=XcSYTGrJqgzh5qoFHD30quFSPTIWYIz+35CDHNLih/H3eMXKKjJP3WBGXuGfXYdcyQz817pbZL9MCxZ/bGGFdDGRTikDaGtgf/9Wnj/hM9OEVzbhUirTHXTAlXTww2tIcJr1b4HsuLgJ7Ipu02TiJCYplcRL3yI68iUb2ZOD63/dUpCi1RS36Q1Mvdb6dwfgTrLC8NPt8Y54vkwPhP6CnsZfmethHTxPDhM9hUdr2MyRy1HbJVxDhB5jds2c4xNJlrBfd+q9INJZ4yN1mrW6Jboodiad1iGCHHKC89qD6/KAxe5fhW02p9SYb8yVjYtUwJzgsg6OGdFcGstRq4AMkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2oxI8f0WlmaiTDUR1mJVL42j7rdIh4KmZQYKNGijH8=;
 b=Ln6sOIc9iEFpsxtHbcwQ5XacDFSONP8Nj1JA6Iswhv56bgi0QL+2TemrgBWuDjPlQabyxWzRyHOctKqIFQtWTya1Hp8BlFlNkMs72nkMI0UMJpH27qyLzqf+OXdiJG+gfr/PqqLoQxUhjweitaUDYx8JsA6RlS7H03MlyUlQVlw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (20.178.102.215) by
 OSBPR01MB2712.jpnprd01.prod.outlook.com (52.134.253.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15; Wed, 20 Oct 2021 18:10:07 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e%6]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 18:10:07 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Wed, 20 Oct 2021 11:09:48 -0700
Message-Id: <20211020180949.15024-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020180949.15024-1-alexander.helms.jy@renesas.com>
References: <20211020180949.15024-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by SJ0PR13CA0218.namprd13.prod.outlook.com (2603:10b6:a03:2c1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 18:10:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c5ab945-2854-4d21-1a62-08d993f4d8e7
X-MS-TrafficTypeDiagnostic: OSBPR01MB2712:
X-Microsoft-Antispam-PRVS: <OSBPR01MB27127083B74AAE57D5C39B62C8BE9@OSBPR01MB2712.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 33moKtDFoSFugNrirWnLb5Db2Hsu19s431gOmtvJtHlMaS38LdpBwkfWZ4NEBpxtbJmYVy1yQdWcZezKnRa0LyLPagUCpmzBlGlYA098994EjvplXWGWUzXgX9uR1hmbaHXt85nQmu8FRf76+Cnk+QwpiarZEe1Kmo4SNt4K8rP4tmVnxo56A8mw5ohKKa5no4l0sjnw8mfkt+c2v6Re+tdjT617Aiw3OkNaTHWnMOI4BuksNPlGtQV2UJsgVZUaCq68y2FXqFAYQpRB/39sIJm9tdKXvqvWaIeIyb52j1qCXQzt38vlIASTqyBEImZnuMVdLrU1Hy7ypwf3TssuOf8iy3qS6+tvzKg7qHa5wkHyHSBbQ9Kd7dusOFYIGcHvCRg0FMMMbYUcmA2ZNg8lNQxNxRB1GJtzsXrCs0BTK2tod0b0un7e+CgKWV/BJlw6gs+R05DjaAR4E5NLfy1A2QofMchcWSve8i7FHd/aVqk5OLXW4sR/eAmc5Q22rBM5k4O02Vk85zSI3De9om3dFUGBDTWpr1xiAwOGh40+ZMLkmex1T4M0mlWHZbJGDJw0Hk4emR13RNA14Zhufdk7dcdbRYSimnoJPqP08vX6CqINQMMOuxKKXAHPLDN1kdmicD/4A4sBG5GjvMg+cglGnpoRfHnexeufUSLJuTu9dBHrcRcBmLBAewLBdJRceDXqHR9RfUL6W4tIvD5mISAt2ZZY3t59Z3x4XZs+F4RqXQJ2o+LnWz1F38UKG0zVLKdmF4ItSNFMPqTs0V9yUlfxZ0FJHUvSPQ4QM3Lw5KF6W9DihnTp9PvyDGkrtAn5/AR9V4jAE/Bp6py4tNrdLrEJRHd7qUCR9i35atcy4vWnHRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(52116002)(1076003)(6666004)(38100700002)(38350700002)(2906002)(36756003)(966005)(6512007)(956004)(316002)(5660300002)(8936002)(83380400001)(103116003)(6486002)(86362001)(66476007)(66946007)(66556008)(2616005)(8676002)(4326008)(508600001)(7416002)(186003)(6506007)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dpH0JYwpREjmlv10d1T1cx4OVjuAeOdJctdzjNODZ/eK9xx3cGFJ/1NCAxGB?=
 =?us-ascii?Q?Drr+IY+mx19SO21b+XtK0wOxDhb7PweEOlh7y3uUyTK6SFnaPOLLjUQ/gbB/?=
 =?us-ascii?Q?hgeoQJi/Xvl73uNFpdWaOi1i9uRExpV+hO0wWC37b91U84TveyfXMVna4qXd?=
 =?us-ascii?Q?IaCkR8xUvOZJ/Cv80wHhzy4emWtZp0NFtwOclu+Nn43Ajvy5O39fmIHtHF+I?=
 =?us-ascii?Q?80lts3txCp2TuOpMemTwVc9pdyWbI0I+m1QScYVLiLCGeFrP6waZi9og9xe7?=
 =?us-ascii?Q?FC8Riytk2zE0RMkzIfHpbJeWM85vxMM8TchByJzdmv4WwFynwuP9zWMYaWfa?=
 =?us-ascii?Q?eftjXtE2gTc4fNv28YKDpdzYsz03s07E2EgmeipUMg9EmbMLKXh3e9fB0ptC?=
 =?us-ascii?Q?tn3a+rmeq4a8ourwkB5tZJ/lxewRaLpII3BkYze/udBWgwP9xY7xRQoKY83O?=
 =?us-ascii?Q?ot7ldGQAUPj/d3OZaswCsdTemqCemObC4SMmYM5BANHQ5um6y5d5N6z6H5xm?=
 =?us-ascii?Q?AJBBxxIkJGRpPSdFxEsViYmRTco4U82TKBJz+gQKzuY/zVZxOFX2zMXgoMrR?=
 =?us-ascii?Q?qefoeXDXo6aJYaRSjhfxB6EmB1f1IUAAtH/fBrh/Ce1Yd4ue3RvxK895C/HB?=
 =?us-ascii?Q?QSv5ABQetTYUXwdhJ5JasXD2KASZbtoJAta8dcN/a0ARfR52EUjPBE4q3pxC?=
 =?us-ascii?Q?4M7SlvRCo679ZvSpOgyTvYlZDbEiCAHNTCGohxH6OCp673j4JffBln5m7UgR?=
 =?us-ascii?Q?aIgTXmWXA5BTvsFHpMyyVC1kjJV8u/8o+tuiZ0WOE3ghspR5iXjdbafASvgC?=
 =?us-ascii?Q?r2FxfpwpAIoDGVwVOB1Pok7LynRks81+VX5C+7J8vcCU98fMWDwVEQ3/Iqaf?=
 =?us-ascii?Q?Mf+PGVUN7j/4S121XNKT6rMLy3YWUtCQKDg4NhWwRFBApYSQE3qhxSxYZk8+?=
 =?us-ascii?Q?wL+236HcMa9uR2vVZ9KimQxsLPiXgit+OAkzYq2EluHMWIlqfR/1YSsTguRg?=
 =?us-ascii?Q?KyTSRF0mVHCquKRGePH6IDDQW6oRSD66+EQE8CvTsC72kFn4ELf0ZdZxyb/Z?=
 =?us-ascii?Q?VQCk9vQ/KMbPL9jrmbsZ1cBS+jXtbxjqSYcaHYyLk6it0p76ZE0qRmFIh/JP?=
 =?us-ascii?Q?Sa/RcekMlay7HMuhJ8pL++NRKtai8+ukSMcKfwADxvq2APqStVTg+uvOzH0F?=
 =?us-ascii?Q?v+H08i96LSTE1LFYPGT9eRthmYo1CeyEIRa8Sl4fbus1RWYumhd00kypSi3u?=
 =?us-ascii?Q?uRkN3IH376nIDhHJY+oYFzF+6KaIrJ4u1v8eXUi4uvaZ3S7BxCUzJYlXczEW?=
 =?us-ascii?Q?DEz6AvVOT79GLBP6HW8Huw2p3bRtbQ6RJEOh6oR4KtHvHlgldonmx+RrpgPR?=
 =?us-ascii?Q?V2W71FRPqdpD9i0iqW9D8QMfRwsdRFcS/anqaHVXr9PYvx+N1G8xnFM7gT+3?=
 =?us-ascii?Q?PGNue2yBZ6q2mLksnGaLTgbvyzTNxdbPaKxoItj2WFy8q9cvZI0mEk12P8hU?=
 =?us-ascii?Q?C5kdPzcR8b6fS1Jw30+utT33HPaoagrcJQvefrlshSqrPgEa0kdcaVIP3KBz?=
 =?us-ascii?Q?cGwJLFJAbmeQS6kg5dH/jcVca8IgaQlhRDYKmZojq6MFlCXIs+zxNVSd+6gY?=
 =?us-ascii?Q?8k8gE5VfBSD8tKuhOGSwJWCzyPbEYLZZTMjUjZiwy/6pEgENqHVKqO+RaIM5?=
 =?us-ascii?Q?fTTTHQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5ab945-2854-4d21-1a62-08d993f4d8e7
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 18:10:07.2561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmONHM3aywoYcWpERNo1p3KknVLLat8OaLxjv8zpz5u2FxXRELODwEOqOh5AEaQ56a6hLk6rTVvKwP7azxygMaTzw6u95lcDHe5qaItJRpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2712
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
The 8T49N241 accepts up to two differential or single-ended input clocks
and a fundamental-mode crystal input. The internal PLL can lock to either
of the input reference clocks or to the crystal to behave as a frequency
synthesizer.

Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/renesas,8t49n241.yaml      | 190 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
new file mode 100644
index 000000000..42af3b05f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
@@ -0,0 +1,190 @@
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
+      - renesas,8t49n241
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum: [ xtal, clk0, clk1 ]
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  renesas,settings:
+    description: Optional, complete register map of the device.
+      Optimized settings for the device must be provided in full
+      and are written during initialization.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 791
+    maxItems: 791
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
+    clk0: clk0 {
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
+            clocks = <&clk0>;
+            clock-names = "clk0";
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
+    xtal: xtal {
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
+            clocks = <&xtal>;
+            clock-names = "xtal";
+
+            renesas,settings = [
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
index 8d118d795..9f244d3a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15941,6 +15941,12 @@ L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wwan/rpmsg_wwan_ctrl.c
 
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

