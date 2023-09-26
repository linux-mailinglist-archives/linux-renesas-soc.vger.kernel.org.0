Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463E47AE49C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 06:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjIZEhq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 00:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbjIZEhp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 00:37:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A9CF0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 21:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ0kIljID4njyxj3p+hkkY8/MifmRJK0Y0yRhi3TMG8c/OY3vNgONdkNywt64MC7z2tOumMVVGHa2h7YzwJ62KTcmWcWIzlSTd5T4difi6/WGfV/2B7NZ21OYQ1F1JLZT/0PKMBPTkt0IRQt7kyiSJI9WAXpKnCAWiWWM22E0z8eZVeJijPlPDVn5j76XoD8tXvYK5n5B2SiRXVCAakYCfu9npYdsyC7s/eDbTG3+RnQSWoe5DJDfngCws/zt0hqfJl0zfhdsoNKfIXS7v7/ojhBP8fKYsZ3h1QfiYGsRB/sfXBdipBxX6mRESx/YsqPXCH+vylielAAE3k42lRqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpS+wT1kyrk044rw3FXXRU8TXzVPmW0z73U2IaNz33A=;
 b=jx53efbckomRKp32VTpWU/EuiKDdA4mhc+kpXHHkDhshIy/wONXjispA3v9NCwnL4gpuLZOSbrUmuibrV+6fPmwFNl4uSiyGNhctlYr0gkqvkCKWBEGDaJgnv+BsYWNbNtgTGA2mNCWY3weUKcqOtRw0z4M1DGYB41fCbuphjI10r4bMvbGJj1FH/L9tKjP0TgK+VqWjzB10DFueEdIhcCqQlcc4ZFyhteuiY0Vgyd/DkvRdme7ZfizLZNJe5m8qRvcck19tVHG4oU93j5bWqNjIDUeV2Lwa+CIvah5hC8uI31weiuuFDRc1Wx1EibKoHoy8mr5cI/kI++9CIsTacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpS+wT1kyrk044rw3FXXRU8TXzVPmW0z73U2IaNz33A=;
 b=jFNDpg861b5d6aNZQKYF28kn8l7nEc3BOfHms6Dl/uEnEcKrjV6bphI5karQxUii5z/r6eH2Z0UjZdkNxk7ijCCjQTGR3+9J8DiAtvv4F26QcV4CJHZv4VMyu1/M1e8pvtwML0UJW6LVENvkgmOFF+PkkeP8s2wQYtUq6VV7Qvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11159.jpnprd01.prod.outlook.com (2603:1096:400:3bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 04:37:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 04:37:34 +0000
Message-ID: <87jzsdim7m.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 26 Sep 2023 04:37:34 +0000
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11159:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9c8a5a-8a32-4b6c-9bcc-08dbbe4a4dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JVWsIl2gVNNrpULI0BMB9cFRyLG6oe20B6EXW8TjK8oKPv35x4OT+hHbrLmmR/exU5Nl5UPU3XRpunqIogPu/JEn0rrruPU82FLtKSUWchXHO7ezhEAVsR0wuLlasBij2fYrnlWtgQGvQx/XstKxZDciYnmM7cxYAt3aYWDmxRFwt+rF6s2A+qvz6t9+GtWUO4ghtZSL0bn9WtThmqU+UICR6u+KgO4HK/ZqD5P4eY3WzNFElsd7a61VOxQuNCPAbUdeCyxDcz/iG/z+W+QAMfDaZPGtf5Ulv7+hRc+7hRQUgaiZQalLWC+iDbBQ6IKyC3LG7yJctyMowy5ZrL1qpOBoPKZ7dLs/3eCvPIndI4/qsqKBFj6itLPyX/y2QX4X571cA0DPnMxmvbKHIOk48JuRPbcnFloITZ6iaBKz1ROSIAVHryz8gv2FC+dsBZYhYo5gZf3k+S14v6pUgJQZDZo+qjvgDfJI5WlwK6dNHhJPIYmKKUFpEroTQBqHWYm0J/eJXGcAKe5ufaSOmqHCl7K7R/gR9AyO2aepW3Z5UBhIvULb4fXTzHVw+8jOaFV4aNxd7c9iW4tMrlA8SDC7nbD1sf+7VjNgfJr0MItiQrEqxgfgv+ljRTGHcZN09IP2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(2906002)(86362001)(6486002)(36756003)(26005)(107886003)(83380400001)(38350700002)(38100700002)(6512007)(6506007)(52116002)(2616005)(478600001)(8936002)(41300700001)(8676002)(4326008)(316002)(5660300002)(66946007)(66556008)(54906003)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6DVcRWVq57Ci96fUdmmTOgiPzzaliyoaXl+CX8Zg9IAtd3ZbjaRsUWPCO5Z?=
 =?us-ascii?Q?+I4JQwaB/0G/CTDPuM9VXx9d5Jee/1S7gXIRj9DhfWTXLEYXCNNUsXH7ucSt?=
 =?us-ascii?Q?3Nu33uShioXyI9Ml6MCf5NvTvAseBGq/yUIvRCy9Pk/dIAq5sMNCCOUNhEcp?=
 =?us-ascii?Q?F+W0l6joVo6M1ZC3Yu2yGQHldBSLXue5NUzOo7FWe07ioKgQZOYWfIM9p0as?=
 =?us-ascii?Q?3FFaXT0sXm2UIsep7/vqNF8YoHQasnqFQ3NRQiCkeOGxkVs/qNKvwhSVV0U+?=
 =?us-ascii?Q?5pw9MW8DgT7cu+AseHVHK4+5WPB+Nhr0uV4qTWMZ6qma+9GiKdwvPBtgnbvZ?=
 =?us-ascii?Q?IcHd79BAMRj7GNo/IU37UVvoDmRDhRpBPieEXKUrQbI2zk/saAvr1DwBd0a2?=
 =?us-ascii?Q?D3VAjP2Hmx8fX0d8Reukrmt1TBZZtFiIJNpBrcHMu6AfFhkCY5FqDEVwxxee?=
 =?us-ascii?Q?MPkuEFP1LcQU9Lx73mnzqqDuYJCdAQlbR7tvNdhj4Su87AQKUrAu9TuKHRXa?=
 =?us-ascii?Q?huSfhriyVMEjzS+J1hoBWgkLLSh4HhgCgXBnIMQ4uBOFAWqtnI5FBbq/gsFu?=
 =?us-ascii?Q?Ukf9KK844EN52eCYquq0MQn3kNm8gMrBXA++uGNP6whND4UV7QTIFjxC0Fb4?=
 =?us-ascii?Q?fFv2gQug0lysSo7fkUhP6by3IkZSzIEL1Vvz4lElHg3sPaERLsnDyuc3pIsF?=
 =?us-ascii?Q?uxqYvwYyVdzSkf/zYRMgus8+TvVtqN/tmuY1HvAasXFtEhTqlaa7AAtv9Xuu?=
 =?us-ascii?Q?VFVQFu2tJI5jMIjuEyUrP8iP66XXgjnZG30qS6YDcLDHt+tpz2dd3w6aqEU7?=
 =?us-ascii?Q?jGd8xzjU/e9676tvfxZi6R0RCVWNeCeyCNWUibePOIexAb1HhybnfG2kpTRM?=
 =?us-ascii?Q?CHzXTSRwsR85dsJjqlUS/atgGxFDSO/m8ff0as3WeHGf8+jT+ETjQF2rp6aB?=
 =?us-ascii?Q?MpYo7IMXb3FtNdLwde4KSP9jWoN017Qym1PUD9zWt6eMgbiXRkNuiCEQyd8I?=
 =?us-ascii?Q?ALQzZOlytqxe1DJx0d6YKGa8NuTL33V93DQ0bJxnCvNTdy5r5TT5ioocywWI?=
 =?us-ascii?Q?mnxVWT0nD7RrH+n9mSy1ng7lZx4bwrpoYGioF/NdpF4w8ki9OVhriE4EQzQb?=
 =?us-ascii?Q?vVj5r0ESSbRWOW8bVF4RS0hnVGTXZWRl3vJij9SmpBIoS2Eff3BOxxuR5rXO?=
 =?us-ascii?Q?Dh4pyHCUwQyv521v+sVGKG/NUHhs3ycggXXaG4dvl6GXx/ZWQU9QwhPULodc?=
 =?us-ascii?Q?DG7cga0BBUzFd7Pjje6qHmDvFZy4akP+9iHZAwE4otzVA69iKhTGgR829pru?=
 =?us-ascii?Q?fM2UflMchKJVEnxVrpAtOS63lpDrTlNAw8TQv/dwJglOuswa+yp40GSEElNj?=
 =?us-ascii?Q?kgH9pNI9TCIEPcnK4U2Xm+1OJLUSEp7p/IP7oMKljKvpTUjksBCyvzIgNW+w?=
 =?us-ascii?Q?Q3UfuCvficlCVJ2XWTN5h+0PH8ELCRi2qV11uyGWDydr1r7UoM6j9T/kLlBC?=
 =?us-ascii?Q?pZkUTTpl/YjN0gAt/0FidfyIFZWjFzlCCvjXL2cXSnPzU6JzmwGg1/ceEjrd?=
 =?us-ascii?Q?mftB+IWlF/uaBbrcG10a+XIdDTNFUpf0W0cP1GGwZ0pwlYiapKeH3LYRm6z0?=
 =?us-ascii?Q?VDsAIhtmJ2IQWktMiwraVuM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9c8a5a-8a32-4b6c-9bcc-08dbbe4a4dc5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 04:37:34.5941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmzt74kxTG2dADlZ0efwh6qtlxY8I+zJhTQDmz7XHw74176Old7SOARzWPD/m17S3N4v7raXmDZv7kFvbAoBm06I5dTfuD7uJNmWujitkvEJ9oSQErmwn4XW8aX7VgJ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11159
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the R-Car S4 Starter Kit support
with R8A779F4 SoC. Based on a patch in the BSP.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 243 ++++++++++++++++++
 2 files changed, 244 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 7114cbbd8713..751cb0c65dcd 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -61,6 +61,7 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
+dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f4-s4sk.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
new file mode 100644
index 000000000000..9eb846caac63
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the R-Car S4 Starter Kit board
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include "r8a779f4.dtsi"
+
+/ {
+	model = "R-Car S4 Starter Kit board";
+	compatible = "renesas,s4sk", "renesas,r8a779f4";
+
+	aliases {
+		serial0	= &hscif0;
+		serial1	= &hscif1;
+		eth0	= &rswitch;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		/* The last 512MB is reserved for CR. */
+		reg = <0x0 0x48000000 0x0 0x58000000>;
+	};
+
+	memory@480000000 {
+		device_type = "memory";
+		reg = <0x4 0x80000000 0x0 0x80000000>;
+	};
+
+	vcc_sdhi: regulator-vcc-sdhi {
+		compatible = "regulator-fixed";
+		regulator-name = "SDHI Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio1 24 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&eth_serdes {
+	status = "okay";
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
+&i2c5 {
+	pinctrl-0 = <&i2c5_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	eeprom@50 {
+		compatible = "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&mmc0 {
+	pinctrl-0 = <&sd_pins>;
+	pinctrl-1 = <&sd_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&vcc_sdhi>;
+	vqmmc-supply = <&vcc_sdhi>;
+	cd-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	i2c2_pins: i2c2 {
+		groups = "i2c2";
+		function = "i2c2";
+	};
+
+	i2c4_pins: i2c4 {
+		groups = "i2c4";
+		function = "i2c4";
+	};
+
+	i2c5_pins: i2c5 {
+		groups = "i2c5";
+		function = "i2c5";
+	};
+
+	sd_pins: sd {
+		groups = "mmc_data4", "mmc_ctrl";
+		function = "mmc";
+		power-source = <3300>;
+	};
+
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data", "hscif1_ctrl";
+		function = "hscif1";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
+
+	tsn0_pins: tsn0 {
+		groups = "tsn0_mdio_b", "tsn0_link_b";
+		function = "tsn0";
+		drive-strength = <18>;
+		power-source = <3300>;
+	};
+
+	tsn1_pins: tsn1 {
+		groups = "tsn1_mdio_b", "tsn1_link_b";
+		function = "tsn1";
+		drive-strength = <18>;
+		power-source = <3300>;
+	};
+};
+
+&rswitch {
+	pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			phy-handle = <&u101>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 0>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				u101: ethernet-phy@1 {
+					reg = <1>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+				};
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			phy-handle = <&u201>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 1>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				u201: ethernet-phy@2 {
+					reg = <2>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+				};
+			};
+		};
+
+		port@2 {
+			status = "disabled";
+		};
+	};
+};
+
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <24000000>;
+};
+
+&ufs {
+	status = "okay";
+};
+
+&ufs30_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.25.1

