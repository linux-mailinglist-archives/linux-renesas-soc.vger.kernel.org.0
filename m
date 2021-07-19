Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5663CED38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 22:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348973AbhGSRs7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 13:48:59 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:37952
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245300AbhGSRju (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 13:39:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtdihBFhaScCT9FSbHK69Dd+8doTPU/DC+8pdn4ZD7gbOSwCmAp25V4w0n2tVH28Y8olGue6AoWIWJmvR7YgcYhvy5bejl0mRgMYr0PV+dG/YTboEQDLhj+ahEeYvcynJqSheJhPtKDaB4dLPecNTG8v3HU3N8Py11us6OcSVKQWl8w9SCRxB2v8ihHsMDYhmtWKG+iaX7G6jMFmS7bfgAcJVCwtI6KVo8ffdP6e2sITYISmxuJSSyVVraHjjscJfjUErw7gtQNnw4bCQCAINGXwMBtfCsqS71ck94qmEuRBwotP5OvMtVxFsszKDfA6xia/PS25Hd5e0RB1THGBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiQ6DNTucrWanf2LUC5jFvynLbg1MMJPrRMQF9qMUow=;
 b=CMRWNg2CQgfu0VTCGw+ntcwf1pRIlrT1nkAtV84D1BIBnd4bVAGnHahw/Gc0nc3/TxvLrbPwJ0ETHf4P63mnDOMJT4j/fV98kksYiJJj3KLJ/s823XLnkW48QOlvpcy+QZmaa1C8bY2zTKRwGsTiSNH2jFdBrL1DSkS688XmofslfwDhUSWxhGRval/C+y8wFjVYYNWkfXzWG81KRNw0mB39LS/38wWW6LAVJiMDlRQjPNfXIImcTb2+x9hAglk8lMu54g2gV6nCpIG9YAxpnrJdiQrT9GIfHBZm+B+qn50Vf99oUqaLGtOJOFrKVfWXrxuqNtUv+Rx9+m5nE/uoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiQ6DNTucrWanf2LUC5jFvynLbg1MMJPrRMQF9qMUow=;
 b=tGjw/EajVBUjQxarMqp0kYeUap4Vori0MT1KYWaAinX5AfBhvE9YSkno0t6VrjianDzEGwnP6IwOYx7OqFt09uda4YBEUfuGKLZsLpqTWGiMvExTxtpaH7mgOygtNXey5+AZgGDf0RAmc3Mopwheghb9Q2SdXAKikggmDUmDTRQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS0PR01MB5409.jpnprd01.prod.outlook.com (2603:1096:604:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 18:20:27 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 18:20:27 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v5 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Mon, 19 Jul 2021 11:20:00 -0700
Message-Id: <20210719182001.1573-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719182001.1573-1-alexander.helms.jy@renesas.com>
References: <20210719182001.1573-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by BYAPR21CA0020.namprd21.prod.outlook.com (2603:10b6:a03:114::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.17 via Frontend Transport; Mon, 19 Jul 2021 18:20:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05896fbd-4437-4198-946d-08d94ae1e248
X-MS-TrafficTypeDiagnostic: OS0PR01MB5409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS0PR01MB5409AB1D3DE6C1977F89393FC8E19@OS0PR01MB5409.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6y1mwqPeb6jqoLc1ot8WQLWnZUQesigAnJj69LMBRn4fH8TA+2M5anWZB+4yuY3dkwhwwAWH6zp5myPLpXORV8PulvlBBpqKpRENjxenryapvj0m646IKKJtexeQ7UJFVGHVyWtrc1YS9yLbVf5RdrG5qwoWQbuGgyZ2bNVDSZS/xcqQDgTfOal8nWKXe4Ss0/f4/FZhJuNo0hHFiOpVg6mXLsxUolFjb+1tvWkh4+PLt6+a2ncs/PGKq+MxL2YlWI+HCaXR6AKhq1xRncCarNWWfCx1pMiwNPLteA/JFEyGFEWYovkcHlHA9B0pCaj+wl/vFMuKMrEyH+tNagWq3crB+grqX7YAHv8Lh6o++kUNLBV7RqSQqw1L4j7e4qVYr1GlznUk/AWq+TvY8ZGr3ypnNYJdD2zCszIAAYtIriwzXQskygccq7e++em9IJIpBhqFrB1/avHpw6qWDvDcscbHxBR8h2o+d/MTkj8XEWEuvK7w14g71xFYbxu2GwQ6PahR07g48zq9v+k3DiWD7C2NiJFGYqpVX1EMdUaYj8IAtJIMfc9OSTpOQtRMfsUVFIQlkY6oITtcBY+kfsJ/bjyubLiNrNy/2yDxdl6wuBhKs0zBKfPkzsk0tfQLei8mqzWRbbChPY3yO7hgJJTpiQGVm8jcW9Z65B6hKXFmIJss3ot+MKs5lk5NRfH6Re2M6CpaBXfB91TsV7HBqj6Jc1NQdC6tSac/yihzc+XSO9mHjgevfFvL7RnoW30ZEZcf+DMRo1eMrfwnb48fNP11tzwYDxPkR8aLeviEv/KNKoLxnLnmDmorDNLPN7oVWqkxmeB7ztp7tRhBAo7/fpGR9Vru3S6l5sqmMl7uKhACs4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(5660300002)(26005)(66946007)(478600001)(6666004)(186003)(66556008)(66476007)(956004)(6486002)(2616005)(4326008)(83380400001)(8676002)(6506007)(316002)(36756003)(8936002)(52116002)(38350700002)(38100700002)(1076003)(6512007)(966005)(86362001)(103116003)(2906002)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jpanHlJxycEjyqkOo50FWSg8y0FzPcYvKOnkovQUYIIl97/xWwS7BN0qpTdc?=
 =?us-ascii?Q?+yCn/cTqssbl0mzuHBTYUcR1WJvY1CSju3T+vSEhwu5OgmYGtumzTnaNCj4+?=
 =?us-ascii?Q?HIXf6+3Q2TbcVNsPeifMgzcFEkA4wE8T3e7UF7dDqj8KuVGjexhF/eS9he78?=
 =?us-ascii?Q?cbJn/eO5O6xI0A39MwWNhfz6S1haZ9pT2hsVZTntODOwduVQRCJGNgF7xxWU?=
 =?us-ascii?Q?qN0JG3pG6z2KtWW/x2tbhemKIOV2WLzrFIKeWUbsyxsL/bp4CV+VGV772Vl4?=
 =?us-ascii?Q?4SithKO4TNzUEipmcCUIsZ9JkgX+K0fn6WsRE2ODEjsfL0gg9WGpFBNrYIaG?=
 =?us-ascii?Q?ez8wPfiHk6a1ermABK6jlQyFXI2JZBSfXYA0AxsBqoGBk1aa9Wml/5rXRCrj?=
 =?us-ascii?Q?3MxHPpbQsJynjsG433d0alHOml6T4lKH6arNebvPpNT122cQ7SGiqmsEbFOt?=
 =?us-ascii?Q?B3R7PyOiXvX7QcCq+XLZywqZhREj1albsp8vq5Tw/s44uHT0ZJopCtsBpC51?=
 =?us-ascii?Q?fChKHp9G+t39D96lUeEflRfw4PnrhJwZMVUrOGD4pCgb5WPqKOYw9TmRTSJS?=
 =?us-ascii?Q?aXxMTi4eD9g9aIjRgK/QhwKO0kpHSs7qKaMuXmfZwop9XI25CJu17XUxKZpF?=
 =?us-ascii?Q?EMICBunMaidipSpUnEpCn1DPA9PgEBpH5YY0XA/2XxBVvENPs2bj8b5cCGgP?=
 =?us-ascii?Q?+t4iO8oWOq2y9I7RUc3GvKANDJZjieJKm2ycuMCSAzjVASYspeqQeD3arWSO?=
 =?us-ascii?Q?KhudyMaqrOFoxeI16F0dWfrOXhwbrljCD0ciMsRI9h+HjZJmBwWLG7tSZ0f2?=
 =?us-ascii?Q?zQpUJVcQ0v2/jnYzgnnrSaqSC0fZm7GvFA+ulo7KRkhek4EbBiniB2iOx5ux?=
 =?us-ascii?Q?a2FyQumdHDjrr/com4As+tHkWPH9MaHvo1EVEDqN//aLCBhtKeVEOl+ik+yu?=
 =?us-ascii?Q?Fs9Qc4n0/IaWhpGhzs6DILKz82UMzOiGC0IDD9c70mdJ9J0jwBGdDWIOKXpM?=
 =?us-ascii?Q?0/LJS6C0kYX9VlBkK3dqfxHMSl46l0MxPaHlxVuvQOkdhr6DHKa0ntff7Fen?=
 =?us-ascii?Q?x5W1et0dThY3z4qvmCDwnbt6ryyMB0pU9m6qubzgnSwFPIoNhO3uGawrTajV?=
 =?us-ascii?Q?v+6nPzC4PYVROnTyBvbAclNazqphW/9EVbbHtXoIeIF0i/HonsraDv2Af/3J?=
 =?us-ascii?Q?X9tsQhm/aA4rvQlI9HKdyuLhv4qnPKtq9qPH58bOxhU4zUHwugLrdoc8vt6p?=
 =?us-ascii?Q?Eb35lkfNIi5hrePoXZK1Ny3q11SuTconj4JRTGo5X9NhKYiIywo2UBXn2dLK?=
 =?us-ascii?Q?9SEDO0NTYkpQGYSIVeFnTKL6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05896fbd-4437-4198-946d-08d94ae1e248
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 18:20:27.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIQruUCyk223hRiAY/ZbF0j+JRw3WJ7Adw7Hw5U5b9ko8iS2cTnDikLlVwnou9ZEi09Xh0VYAhKjA/S6+USyIfEagEo41pH60JLQSk2OSoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5409
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
index 6c8be735c..55650e67f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15778,6 +15778,12 @@ L:	linux-remoteproc@vger.kernel.org
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

