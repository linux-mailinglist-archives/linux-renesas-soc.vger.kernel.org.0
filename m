Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5508409A4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 19:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241837AbhIMRGS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 13:06:18 -0400
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:15904
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238090AbhIMRGQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 13:06:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9b9AZZrSp0opdll5cTJ8DRRhmT1nUHJnvCzJlzWhFMAybe6OQFpXqnP0luABpIdosJYphn7eCJWYlbDugWtUFLiblfmRFS+fIRIMag8RnZZTSQf5UnJwSzZ+pJLFiHLRr0WjauGodS3a5y/JAF/jvXwOew+1J37Y63dfOYk5jVos0e83AVoltfFcYPd2AV6V0n+Q8ouXCDVMoE0dAmXAGF86F3QJw66ByQ4sZqmltFbHXtoHbkQLLVk5VoRhY/ZgmAQGfGmR+kejDRn/NWC0urklm+atK7uwac5OoemdgQWVs7kkIxtJMl1H6xiDd8z2XVeewgcd9PujtFjK5+4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cCHTPkq8TkDKhh9jQbrHRtxPtDkOqIMwrqqeGCh3xbw=;
 b=B/2zE3ao+2g2gyXzC4m5C3eam/tvaGjrX1ndQ1HBc0Vq2h93B1NJYQmN5hIESD41yCrVbvAB6vZMJkT+Sn2Sk0+AMIyTrNUWslyGKolKbOFhjvDwRKEIJjGj2vNfW4I8qAjPLyeWNw+SDaOh2iiMPldoNWHvOot578AJAIF5ZXWsBlmVkez9/juuYh8J+SAmtXyCqm8l+BG0Cro7yilXbg2rg2/pjfQgG19piFW742VfFzJBcbq1Yee5YefJDFI0WW/cKMsWq9WM8LSNnCDcLjPmSSXwIUDO4dIhJ+wKJUvpv1VtA2Sqia/pSsYd7qCj4NKCXS2m+wgAM0CPFafUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCHTPkq8TkDKhh9jQbrHRtxPtDkOqIMwrqqeGCh3xbw=;
 b=N0vwvWCBL4nF4IhJNcTMYKahoad1CxBoFD1m1T9bUx1LN4lZ0cta/tiAb2rMcbpm5tOcLwJfK7WqSS5e0JMnb04nfPy5KxqhIjzmLnqtwDqHJ4wAE7RGm9VEupUoSWDiBPCNpzdsRMNwOf9vmG3I+dUHOLnyEyoSsuNG6B6nAM0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB5928.jpnprd01.prod.outlook.com (2603:1096:604:c3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 17:04:59 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::f:1671:816e:bfbe]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::f:1671:816e:bfbe%5]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 17:04:59 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Mon, 13 Sep 2021 10:04:35 -0700
Message-Id: <20210913170436.243-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913170436.243-1-alexander.helms.jy@renesas.com>
References: <20210913170436.243-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (192.48.119.236) by SJ0PR13CA0094.namprd13.prod.outlook.com (2603:10b6:a03:2c5::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.8 via Frontend Transport; Mon, 13 Sep 2021 17:04:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23236f69-eff4-4f4c-d29b-08d976d89e48
X-MS-TrafficTypeDiagnostic: OS3PR01MB5928:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS3PR01MB592889CFF670BDA30504DF38C8D99@OS3PR01MB5928.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7s59NZOZbyF9MNpU7A/gUWtUZJvao/QodGrFiqaY1wv6LJesE+R5nrrbIvM8R0ddMHyKbmnIyfKqsPjdgdqECTkthUSeLEKmWR6DwhAgG6FT3MtrAnC1z1e6jqV6YWYazYYdCrtQUaX0ciZnPIvhOvi4+q5hu85JZOzU4Zjnre2maG5uOSUxR0SlCcQQyoaV6MT86K2pe1WhWtu1ocXuLcmTUNjJNvN9qc3b24rkJrBDdL5W3Wp7XN+gVx3UhoziaaFAObB/Oz7NnXOVe2gOzNEreErpsKtWp0nxpKT5/xlSpU+7h653mAbUcw1PJgitOs/+I/d2hfmjNvHW7AfrNNYDP+IgsNC8SRjrKK05oMSsPpRlWqGP1FrBDo/OdYNKBngBrDoUyZznmLrp8n5+qKVd7ENNhCMssrwsUejsT1T8ufHZTNLNRfSnTv7aU+RFH0ger+i5Csx18368dqcQhtsxtlw+BhuurfB7jK2Bj/7sKiXONyLB21wVAWbnAbtNAv25Al1zb3il0qJ3xh0dhwogtYEbsZmo37lNJ9XjSqHA1TedDDcGpPIVckUc/xQDQ1LBD3V29UYdKJXDqKDzZkPIV6JF/V2MqpWGFBruPBtLjY6GX42rB49x28AIWKEdeTBlafy9xfjzV90WFMESt6yJQwGDcSattFFHMPYzOnMOyXxZBaJu2/M048md2O9RzAQr/Q6698f/FZGaOXzHKxRHZFldSNd4wDf3SKEe6djcTUGvfu1/J08OrAEsK/qhjnya7/+T9GdfC1zJrbilBmxUX7DaIjEeMXFj9RcsdYP8JRJtoJNroSUcWC4//Lv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(86362001)(38100700002)(316002)(2906002)(8936002)(66946007)(6666004)(8676002)(36756003)(1076003)(966005)(83380400001)(38350700002)(66556008)(66476007)(478600001)(7416002)(186003)(4326008)(26005)(5660300002)(2616005)(52116002)(103116003)(956004)(6512007)(6486002)(6506007)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jltXGUadf3/iIjeq+Snt/l1PNAnvtGG6ILJanYzZ7O+Atsb7w3GGs545NzTz?=
 =?us-ascii?Q?Tbgae3zD25rUuNvMbRnjB6dF8p04Lg+U6jn64txU9kz1d0H5a+mwMHblEfcS?=
 =?us-ascii?Q?9qefCjsykoKWiH/JmIzatAZNo5poazstyTVK+QNYjxXeBAhgcnIQlhTA2Y56?=
 =?us-ascii?Q?XipNEVmeRu0tq39sGLNO/Nwoj1o/U1tc//FDkl1rLH3hLY5sLbPsUYfUxrJC?=
 =?us-ascii?Q?pAaAruixuLTpN9RpudtskOWOFA3OlkehDWasQOeDeZLFZSCRZUCmay+lbpgg?=
 =?us-ascii?Q?ZIzSfM0a7h/5cbWj4PRE/28xdrvAvqBof7XUY6s2EvmToMzt2Yk9ejJdPkRT?=
 =?us-ascii?Q?RKliEegxJntGN4OBmxJYIkqqsqrxQ/nQeC2hbYOdoCi5go9sc/cLjDkF7lqF?=
 =?us-ascii?Q?AK/rQuDAQbkNfzXJGiehsNQ3eYBo+bP6/tsCpZbgFSkT1b8wZDkduXBVs4NW?=
 =?us-ascii?Q?ugKcORzKlQAhIlM/j1PnhnXmiWpHK4i9UfuZY0455WS8n2TlvHviGzgddHLx?=
 =?us-ascii?Q?6ZiVaTPcr+xHHby7MaDetrgmwUDRBKHKualeNsMjDjQ2ctkhEMevCgeHFLPG?=
 =?us-ascii?Q?cgI3cuKhuA0YTZ7XQQ+oNTk/1y5qMbsGqAcEq9C4CRMnL9tj9uYARC1630bO?=
 =?us-ascii?Q?Av85CvjomkMGzfG/CYE0gZrH0cfj9oANhGhtIALY25VdkRh7KcAUlnijPG9U?=
 =?us-ascii?Q?yM5v4nm4cj1itq1HGwAeOID5GqbTWQFhplesOIx23Cq9gFxOd8tlXh2n7Vmn?=
 =?us-ascii?Q?zUXSNo7Oa65RJEZ0Uzi4kpqCEa6ohfg/vfsKrxb6eU33xdB4knFU1Q6be4cW?=
 =?us-ascii?Q?1gjp+KGJ5BnmeHgnYwkbXlOeyFjZbNDssU159pgCyq3Oj+kdT2mAHuNViTaH?=
 =?us-ascii?Q?QwwXum7WiutpG07FT6BmkBgWweIlRts2h8XDSXBzFAN8GjUmhHsMGpNguB9d?=
 =?us-ascii?Q?FaVI0hsgDKiP3/o5kZImJXvfH52fvX5Jjffeh+SC508PUFqao+RvcUWsqHOX?=
 =?us-ascii?Q?BMj9JmpNo1nXNnyFn/htl4ZxoP+8DCdzQZa9hCTZzP77/lSIL9zw+FEHOggv?=
 =?us-ascii?Q?K49Dzzz1XQfISYXHwCo05kK5tQTtC5hH5tnrG1kvECXO23gGi2JutiHzyAkj?=
 =?us-ascii?Q?quIsDew0C0IARioZ1TD29wvlWurEDbLAeMQsI/fLpoqXJ8me68JSjb7tHdMp?=
 =?us-ascii?Q?OipyBui7hu4ic6yqFCAoP8uJxL4zxZLAwXeaPlLpuXiRgI+JFA+Atu7ZYwwg?=
 =?us-ascii?Q?HkxhgYB9kEINPyyixoH4J9ZtR8Ee0tqjRxsu0G8Wf8y96CSvzrm/DwkoKeDg?=
 =?us-ascii?Q?+gDML5eoL8+Xs5hAfClhO724?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23236f69-eff4-4f4c-d29b-08d976d89e48
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 17:04:59.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kT0Uz/fFZiyD98maUG9oe8fWtn8hPFGLKJsCMJw236hlqlGXZSLwdBqFl/4HtD3aoAcvpwOVeCRoJGZGSk8OJZcZYQnr8OjaS5wGagR+pMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5928
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
index 000000000..586dd6f5c
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
+    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]
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
+            renesas,settings=[
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
index eeb4c70b3..3b470d369 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15934,6 +15934,12 @@ L:	linux-remoteproc@vger.kernel.org
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

