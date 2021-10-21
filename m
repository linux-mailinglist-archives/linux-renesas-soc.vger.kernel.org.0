Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF41436CAB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 23:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhJUVdz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 17:33:55 -0400
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:58640
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230272AbhJUVdy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 17:33:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpHGQeo5UgBVqEHmF1Lqfh+4T+pCZB+xI+AZ/et3uEgZBmOcwY1+fIG8diNEWSlD3ME3bjIe08Z68NaKIkwtT2FNIzddCIVd5Pmh8s9skSOywT+5DSaLo0ygxvMQeJvV6VkL8xTT3lFAU0YDzvsrRNEs57hTNiwbsUyq5STlnkO0kHHxNkfiHsK013cy9KgeHAtG9KYQknbIhSDeAsZyLesv8XMNJ/1qhv2ntDQHSekB9hBDyKuhLw9ElnhmDTD4CM/+fumJSrAjBMru+WJ0RS3AT91M6W1iwY4ebsFt8vVup8Zi6gPrzfexPzx6G0SK61OTKhw5UFFbDvek0jvgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdboxQLVaR27T8BG9eBSuzd9Y9tR0TtYYbzvJb7q7V4=;
 b=jv3RT4txygphLyUNPFVMG1cOKdyW/qX9uCT0gn/nKeMvPhx/D4/flKQABjJ8MzB1xaIu0h+Tk3O3FMqMXbQukc5zgLXFL+MZeX0l/AnFTqfY842NBdeMElNe+8L98kyN/9S9QKr0XNbb6WUwfhGmciKzRGptBwIePJim2qkjW22Xe5rzHRoT6XNvO2cOI+FOhRYQu4wiE81SQ1nFZxQ46jDbmkJHwBjeQliST6fS0ahURw2L4EYMpMfEUYDP6SN34hs9nJk1LeE88tR4+sxvCbEYzFEFa+n5E/HDe5cvGSmMtK6XsX9VHmpYBnhejT/JcTBt4BNzST6g91I3oxHrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdboxQLVaR27T8BG9eBSuzd9Y9tR0TtYYbzvJb7q7V4=;
 b=At6WB4awgvyk7RQbZngShW0L21XlsI1ZcTJbeqMg0lHh4QnalZUXvaK6qZER5blFhoRK9VYFOu4qHqMUuDJ/MZz2O29jmMjkG7crbkUsWOYuI1UOgfWXXABNOSx8A/WtNvqA1lkhYcAe58ofSt3IBAMxkRuZ7eUTxAZVMfankZA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB6577.jpnprd01.prod.outlook.com (2603:1096:604:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 21:31:35 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::9ce6:72c0:21b3:155e%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 21:31:35 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Thu, 21 Oct 2021 14:31:05 -0700
Message-Id: <20211021213106.315-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021213106.315-1-alexander.helms.jy@renesas.com>
References: <20211021213106.315-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
Received: from az-ahelms.na.ads.idt.com (192.48.119.236) by SJ0PR05CA0161.namprd05.prod.outlook.com (2603:10b6:a03:339::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.10 via Frontend Transport; Thu, 21 Oct 2021 21:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4b1c6b0-884c-48ed-0d63-08d994da24ca
X-MS-TrafficTypeDiagnostic: OS3PR01MB6577:
X-Microsoft-Antispam-PRVS: <OS3PR01MB657713C8109BE68C1C8EA2B7C8BF9@OS3PR01MB6577.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPUu1B1cGnNvlZ8Hip2fYKlv8R5Y7tB+/zSFrQ8dGTqJpEB9t2bn5umVTAAK9U1DwiLUUh70hrbO346TFDg9huuLvgezajBjCvfu5mkzRNKzbrGgI9R+KCygm24ZlBNoR6bZpSmBSps52O8HA9EJ2wDfSH4+pG6dYsjGNUhOObu2nTzxjvwCBOVsfX1pepvdVUMjGBlgM6dJlCqpDbwT7AbNxUQpGXKNghGF7ZWyU1G3JXyzT8QjR4jkEiq4QrQgmWgm/Oaf2/2utQ1/e5ck+7PE7Z8bf4a3qyzNGVyRnupdcYYcs7wGyu3LEHpH2ujnn+5OEvq5aT6VeDzU8NNpKF2Gvb5vE2k4OD2VtHrEJ7i1DyXpqXUmZ2KClryAAoyeW99bfKgYN8K6Fq2e6xeo84MiC4BlcVJGqIMhzbiXpkaS4vLSJGMlx2y8m3reHSCCKWBXrWsByZQA8A0ujNK0vHCu7bTIIYqCYU0jm6XCyv87K4MkGIZvxjrJ8eL0FmOobt4uIcop3VJcVezJ4Id5WHU7DVzL6UC/Fwhkadh8mPfZSXN8GucaG+mtDFLShLSqkD2VwkSQ78dumwTX4ESGG5TuhDg8p9/Cn46+IXivFj2IDxRlUS/LxUSK3Ne9BDEtTk1FEFDUQzI+H3JT7kwy6t3TOrahKt3jch1FaEvsO5cf1bvI+FW/y1LbrCRb8IZh2NcridNWN+gROWNWODEgcoJvpQfdpvCggAVzWgMXsGMW+QR3VG8U/GS8OcGn2/dV/y9Lkt+pwFAlanh0Kga90R3xfvgIyKI5mOtbhzW8lzeZbjbO2XxkYHfmng65KxYsYAkw4b9CQAfJnxKQQF7ePpfNkmdI83CPagvUu9GsvK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6512007)(966005)(508600001)(86362001)(8936002)(6506007)(5660300002)(103116003)(8676002)(36756003)(2906002)(38350700002)(186003)(38100700002)(956004)(1076003)(2616005)(6666004)(7416002)(26005)(316002)(6486002)(52116002)(4326008)(66946007)(66476007)(66556008)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Svnj+VDU65fwwdxDRxyFxk/1QeXuNkUiNTrtSlQJ2woSiqAIQg17++1NsDZq?=
 =?us-ascii?Q?Fl7sp8nK/j7nvfptX67mINrDKUAgT5BPz1BjYmXBdN8JBpI9DS+xwLhwlrRE?=
 =?us-ascii?Q?HdtZijmglA23jWVqOHfhNJ7Wjof4CuIFuDbXa3aeFwE33s/Bizt7+39Pun1o?=
 =?us-ascii?Q?j52SxWy0pDIy27gJKSvwIW12/6ZYOP2EscQv54cOG9yysDPkXpL9TQwE2ZFx?=
 =?us-ascii?Q?CeeYoBIDfI823NjDPXU50zqV1yvloQ+/+bXoPhgeZMleXcCmM/hwBx9fEROB?=
 =?us-ascii?Q?jP+adwKEu8u9ncAq7S9kKjM2A/rNo0dmvCVAhW1591VLTw5wBwUBLra7++Zi?=
 =?us-ascii?Q?tCv/BzZrj7FrhP6n5w6izioG8mPlzT3OOt8/sRMMDDX0oXfDzQK0bKMd+ymg?=
 =?us-ascii?Q?JvVJieMCKA0wf7bPY85dXFuloByITQPNE5kKbELc/6Hxq8iF/RWzZ2VSc5mD?=
 =?us-ascii?Q?mnwE0IXFk5zuXE/31DQb4LXxpPYPyZBzXUxUkp7Wt1NHtTo2FIZUE/aBZFli?=
 =?us-ascii?Q?7pOKBWOvClNT0PR267qGwcGN0R3ULXa8sbl8wxuLoDuEjJCM6tG2Gz9+gHDh?=
 =?us-ascii?Q?qFJold2yBXy5L/8VhzJyDL2HD8ugpREMYCYw+S54Ig3uO0jbbbGk4wwICc9c?=
 =?us-ascii?Q?KtelJ1UORVpWdVWNgzh5meCwBV8IASQsI66ra69wIGq63UL3JL2qwhPot0ht?=
 =?us-ascii?Q?g3BtAe3mKyfiNj0u1RWgXIquIA3y8nLtwNk84dt6g3QZ3d8+dxsFgwRImkbo?=
 =?us-ascii?Q?DcvjOIHd/orqZBQERi3O+sDamlkVWmxgga10N2WAn0qtvKt1mvjiWax7SBpv?=
 =?us-ascii?Q?9TYy5AdtoyFUUXGbxuboR2K5iovyhs1EWzBcLtYESnZS/T/Cf6dQhA+aNixk?=
 =?us-ascii?Q?Qewm547ON1HLD1MRH3Cm59dRgOdwhmGEtHcvsV7vY0CkGWCSIJPpirrsOJbs?=
 =?us-ascii?Q?stK98LYJP/jFrbWOCQOO9D7SCGK538h2LN/OIvEWfVOQME8jSQ4EX7kw4msw?=
 =?us-ascii?Q?rJPeJwqSsIgyqhn0CgtPwK3rCA18JUVd/PGUO9EgbPichHNJaIQFSCAxF4gq?=
 =?us-ascii?Q?qwjgmRPMDuExsH57x5BHcyh76kSg9E8SeoZBfXhQD8FEOTivxuOuIlf3Vcdz?=
 =?us-ascii?Q?cdTVkMUXstW/g1Zh1jnKq/IXPGHO7thUpunQDcsHcWPRLfk9/yzN3XaisxUo?=
 =?us-ascii?Q?nrgbczwMkaVB00ToYbr41Y+PmJlLgViq2bfl1uwGa8d3QPZkk3wdce5fNU5u?=
 =?us-ascii?Q?rCcVXxfhCamXkQhs453Iv5S/evpONf22OTLLUrBYRx91wgp+vDtBhVvnFs17?=
 =?us-ascii?Q?mNhhYDCqj6qeaRTeGobRWUcB/BZN3oEEv1FodXRfZGrboWvILW7KiJ2CTkqL?=
 =?us-ascii?Q?XKeuII3psF1IAKFa1rMJI7kQWEaRmNlL0NOF/sR1YiP8yQgO/smgGbd+RYg3?=
 =?us-ascii?Q?4EA0eGLqPD5ECw2oOtkY7mHj4hKST1LVc7a+P5QKXe0xdg/7RI8Oqg=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b1c6b0-884c-48ed-0d63-08d994da24ca
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 21:31:29.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alexander.helms.jy@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6577
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

