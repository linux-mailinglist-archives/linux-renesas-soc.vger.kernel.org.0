Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CFF3C7921
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 23:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbhGMVoo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 17:44:44 -0400
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:35925
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235534AbhGMVon (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 17:44:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaEITpGgucwj2z6RyYZf3KWhGO1ukk8isZeB726eNKtXKoLO5q7a4FJWzC6cDpk+rc5UqBTL0ICqXHefCI+zo903h5Zxq6RGf0AExB8uFySd9SanHS20e3zyN6yWOnoz35rfXQTPvpUbkoFNmZr2bXGu6xpBpSEIA19o322xPq1c9kb6bQPU3K+w6VaGUcN0UHTgk5uGH5rxyhAPY4LQdbgaxiCJiwKBX+XvW0LQAIQXwYl07HEaZskIq/K+kG5r8JPSr9pJDpfysSWHKM1wejsAulgN0YN0b7MG0W22LSYvw09Vofn39mN7XYQyhO3NSZVKoxKR/Dt4pHRWsY+rTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GLcr+N7VV9tPG4qJ1Oh7woge0rokUqDoaz4LefC8SI=;
 b=e/7LfPdrnp0OBwtAXjvZ7Y+tuGPZXw0ifktAJpPlW21fyln5n0gH903ZZ0eY25Mbdse8EB+PiLkiFff3iSb5b3Y984PBzuHFKieEtOaz+s6qKz1Ap5zhYJBnoe8+pmmE0jxfs/a3i7CFvpkZBcdMyHgMBuqJvv84aBzcWX7SGgLmeLYLo0YSjtQyKoTAX7VYukIivfg+xKRYx0TmVtFjszFFcKQGHSBds61GzJ43AKakGo3QMkv+y3D5KCQhK1OTNKeQO+LHPYAj9jaZrvR1/pziSMKqEwbQU1yOs20/iM7W1Dk2CBh/PlnOSmfVRDSEzikduo0w8hTYOK9lEIGXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GLcr+N7VV9tPG4qJ1Oh7woge0rokUqDoaz4LefC8SI=;
 b=SOjUUAb+20d3J6YWjK+H2VfXQtC/xUfQXv+I9dsS4OfrX0cQT3NYPgiPbYtU5XlsaDpe7WZJZxDOL2vwnmpRMgmCShyXLpgy3Qv4UNbZSKnXtjCIDpT1ZJw5TiwzmzSDtH414ppBkoBcfUAztKm0i5dYdfzqRKKK56jsET18lEA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OSBPR01MB3576.jpnprd01.prod.outlook.com (2603:1096:604:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 21:41:50 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 21:41:50 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v4 1/2] dt-bindings: Add binding for Renesas 8T49N241
Date:   Tue, 13 Jul 2021 14:41:25 -0700
Message-Id: <20210713214126.2278-2-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713214126.2278-1-alexander.helms.jy@renesas.com>
References: <20210713214126.2278-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by BYAPR07CA0080.namprd07.prod.outlook.com (2603:10b6:a03:12b::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 21:41:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dac9974-791f-4a29-ced4-08d9464705a9
X-MS-TrafficTypeDiagnostic: OSBPR01MB3576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSBPR01MB35766A2DAE9DFB55C572BE1EC8149@OSBPR01MB3576.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+/xcZNMx14nGGzU5mmtckosoJEAidyHFOwkSV14MvEwVQM1nvjqQ4yQiYEhGVP8d4EHh8Gnu3FNz2dyb6ROZdj6gsrATT3g7dfc5y7dAE3pKkCxN/SOKieiEHMxnehmZkNIma8EqGiyB6yJLhbMBK5fULSv6eDPyndRD4yMvfmRsqyzOyn4RtLCeyj14PyCxmkOWWcVAANCbwHAorzKZgnehRy0NfeqcBdyFnoIIFU35ka19cEc8A5nVVA4JOBzbTfYWo2zDWlPBsV9cDpAWU3Uwa1udZ+KdMISfEAtWXrfyx6AvSzsJCtmu96sxvCBDlzZJzIKPuqKD2JIhj6Gsv0wbwrFEYNkM6UvFo9lmwXoEMOFz0AKRozigxVJmhD10/bEzlIiNqj5R7Gww0G/ImtQsL1RhPIORt9pyu/ZOGjaHYEdOMuOjQWfulfELto41O2MPCtraMcWegAS1boCEwChhty15trBlnS2xlr/NJa3bHunqDm1WD0Cv3oahDg23AQQcsaJnAMYSfy0b/BKE7Rb5czgQDMKjPKPfIt8p1J+wuZyOAeWvKOdLqkqkUAUdqAv38MOvQI5tzEAn9d+8+Ul7IxKyjUj6ZIvzOlzKB6ZGxJWB3ZXw2ENMM0lqOnwTvfhUtorqXe2t8x88bxxU8BmlR4y8E+FDcch5MbNVIvEyMLdppn/syyfnhsptJx38i8FeYl/LNOIiEB1Est73emXr69/XCLT2n0OY+eFcX0zMMwWS4r7kMX3CpQst71qWo34njtsGAAsIvDcxC/rqPk8ZvlKIkM/5uc7riYzPgvaelpAFIoQZefgmR8pHE3agczIFKtm+BgYkiVJ097aGmZ74pJlXKw3ECzUOyJnx5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(478600001)(38100700002)(2906002)(2616005)(6666004)(6506007)(6512007)(6486002)(1076003)(103116003)(8676002)(186003)(4326008)(36756003)(38350700002)(86362001)(956004)(5660300002)(26005)(52116002)(8936002)(66556008)(316002)(83380400001)(66476007)(966005)(66946007)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?APLWyDFxwhrAB1Fc1ssMkUqMw68D/Nez/2P0w05/Unml+0RaSSLjA/X8L0ca?=
 =?us-ascii?Q?i7Ov/mp7VaYEitMdpSCzRjYXExh8i/kdnL1bLhuTX4TMWxAhR0cdv0PCDatU?=
 =?us-ascii?Q?L6PoTm9FcDwpQvfJENJIJm/plp2BPfZxxpuT41u/xayg+DuByNYaUP1pv0Bq?=
 =?us-ascii?Q?voFDKrTNMu/eC0ytd0xLi4dg4CTMG5mYA595KvU1CE6mj+WIWqH0YbvcwTWL?=
 =?us-ascii?Q?stYXwvkQj65qobCgo96YtKoA1b5OSl0fXztWxpXEykXV+a3yUh8jcrVdPO7c?=
 =?us-ascii?Q?XxAKCT/1LlAXeoN6sgEfltKfm2jQp6iOIUSPTK3f7npcosXpn3Xe7lLgo+Sp?=
 =?us-ascii?Q?Dkfw87uytyItcMLj25GrsoSjPqiU3isRqMlz/wmCK+8fLyOZoO3lYF0fs79/?=
 =?us-ascii?Q?dCTV2eJfIXZNh5Zs+GV3/x8YeaMhPvXrggLePCOmHgPGWf8OpS8KVERCgRdy?=
 =?us-ascii?Q?3YQULXUTJtNT6v5qiFTX5H6Y0F6crL6nVGVPy9yMRpqE1ZTT52fL751xqp8N?=
 =?us-ascii?Q?OyfNr8i04jjguXcIbgdPS+KDGmv1goq2fUVvs2nOwI7scEoVNZlBXISP/5U2?=
 =?us-ascii?Q?7PXEwsd23N6JdP0w3rjkGP2Af/KafbfS6F2Bz5uLJKg/xtiJpjmOSKAlm2D7?=
 =?us-ascii?Q?k+W6ru4be6gGpsDzCQX6LIiKkqpAO9PPALPCRt2j1h6EVMWmWDc2UDzNuED3?=
 =?us-ascii?Q?gTih0zeTnyaHneDWZhVr84UgifUgGty6PaMkUyA/1gneFAYefRU9HpuQgg0h?=
 =?us-ascii?Q?P5vYe494AV2B1xPpDD+EikpQGetQRKwKMbcuyq1SqLJxOPqOmXZCIrt9fs+/?=
 =?us-ascii?Q?AypTyB7vqH0/PhQW4qX6evvbyszxx+84IvcSlV3Me4aPbDSAJX45GOVhHhGf?=
 =?us-ascii?Q?1jEGiuSF8MV3kyK8Eb35k1dSLjcb4ERcSIJ1W8ZgkvABsM3c6aQ2I9LpORs3?=
 =?us-ascii?Q?gwcGlSGBOsfbsQrcVYcxE2uSNlh7c+bDEb3SlfnlYqDrPHvQ38qxoBSsw2an?=
 =?us-ascii?Q?0lrrSYdhEv+nEICRTHYNzwGbWP2Wu9GzJmXnFCiwP0YaS8qULz/c3fay2PQH?=
 =?us-ascii?Q?IVZOh2gmH8WBV9ZVL+DahdLlpCtPT/+BSmPrJA6KUQcXlXtCaep6ftbV2MdY?=
 =?us-ascii?Q?UU1VphrGe9sqlDTtaZQeh0G4OZKzgVAJdWKAnD3oGVcIf6CW8zNLjWESGxov?=
 =?us-ascii?Q?t/2/g6ZmEdtdjxeCt6An4iAVNw1qvSM7oVwY10IPd9x7+fWGNV06+IDFj++0?=
 =?us-ascii?Q?3gbw+h5Wq+g1P2NkumckWxSQRyuJhPI5C+1tYQM1lNUSteb2XHnplEFvYdoO?=
 =?us-ascii?Q?BDMSc72P5gKqFL9LVfgIUAVy?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dac9974-791f-4a29-ced4-08d9464705a9
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 21:41:50.4620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqE/7Y+85nRnmeusHT+GXWFANaQB7i9ohDz2xHTVuAaGLUEpL8yQRouta9iyGHigwTgAz9WU/8WSRh2yXpB220eYMrTlG4w43+P1M7dv9g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3576
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

