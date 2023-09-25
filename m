Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194FB7ACD53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 02:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjIYAxe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Sep 2023 20:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjIYAxe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Sep 2023 20:53:34 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B29C4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Sep 2023 17:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFYp/dwGC0dad+xWg7+75XXJzN3lWVwoG3Lpt+ObqSCt9pg3XXu/k4flnAUaxsWLnUlaUgv+lWFNxfwm0CCOauCJXP+7RxNGNb2x7n3ziP6u6mIrTwsKXjl5rZKRlVsqJLTgzEAOZZhYTxGDpU/Kg3xZf56r+NArn90/rIBdke/srZdLScUE2HrR+GbZIAGJq98CTluOIHv0XiF+7B81QxHVKqrG4VKd6E4iaG13KenH9pTR26u39mlpkj2GuAA4jffv0LK0IBEyTD6+1pk8P+18+/8GMBk9lZhvJXRJc44GyRtPNDIVVpgXgaLclaWLP1T1OboGI9WQHZDylPwW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osU72FZrOyh446Tsy9Rys4K1C3/hEELcPHPhCM8GmOs=;
 b=NN6r+EbpU32Ka3QDC92hsLJgKbbvan3eoZBRj0ALTaKFwxFHcxKbywtzHJkU3UI8XhX4KeoBGZw6ZgAXCJDtFwIQ9upkg/kzO7Q0ZfqgmTdLdcb3WoLollEZ5QEGrascGBtZNZiXmRgeyY10HPCg6AYUNXGzT2gQt3Z0753qOMCeJErvhG5mBJfxFzL5Odb72Dkvs7p3ndUyfYNDzOU8/2fB2b4ywF1EImvax5NDpchrZy/mWChRtUwHh0Qh5DZvl1sNXKeNRJ7iL3Am9IN23FO80p7VlEIVkIZ3vRFWxBt8fcXAttm2mVa/78IqiUnkXaFt5vbIJYjG4IEZQ2PGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osU72FZrOyh446Tsy9Rys4K1C3/hEELcPHPhCM8GmOs=;
 b=BdUKrEI+n77trYQdzI+T4aCYS4h/bu5eNXYtzvAmB01vpveHxhgi2TAPOn0+ukxXRljAihQWXaVq0O8V5g7rVo5iaChDkPGOj7mvUJxCjp0TS/gtnaig/0QiaNPfYmbhhXIJhd6ueq8EjyXNNiokEQKFjXWpe0tWu6OUpE8ZV9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5405.jpnprd01.prod.outlook.com (2603:1096:404:802c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 00:53:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 00:53:22 +0000
Message-ID: <878r8v845a.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: Add Renesas R8A779F0 S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 25 Sep 2023 00:53:21 +0000
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f57427b-5e45-405d-4c62-08dbbd61d0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktNW+rnpcPnB7aISzlr3spd6cFTh1EuoP5ryEn+xgYa8N3u7mCfa6sh1brn5F/amVZrMsJ3oUlxntJY2KfCtnQttD8omHJdsS1pR7tJ1mTp8PIm1B4Bb1jppptKpuyJupbQGqLGp5N7PVrk2WAT7KX5OwL8pjXfL8LqgMnz1CauQGRJXg44a41K51CgZPEU/VwluvPk3pqANUZONlXbrs5VnFUyT5/icQ9R0hNBOmlh1pFL/YNGxlFYrOLLEeVPnIlGaOL1ZEeezc5P6vn9akPakRBadLpsdT38UCCMWxpXKHU4IkH8JGpfrxv/zlPpFs5BCE1e5e5rEghonb/bSkfA4GHWIwZw2KH6SgG0OeZSWqGH5OW59/6yGjTRsuWn/JEE3alaT609AppIPu+rn2mThLDjlf9r8FEJCY4kqAHh7YVkxKaeHsnhqCApTq+VoK0KysklGZQTChtRsMJTj5u1m4G4hLi93KRLYM84TIx554lwvGP7DTZYpqUo4b/QWFtmIHwQC9IW83x69ju0G6VXBh5OD5sawaguCRwDSkFnpgfLSMcK3S3YSJa4QXQ6LS+CXg2S78eTxrVyrU1mB5kd3cMbNlKA/7IA+LYC+STGJrj+pRKHA5LPgc0/OnypC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(83380400001)(107886003)(26005)(8936002)(8676002)(4326008)(478600001)(5660300002)(66476007)(41300700001)(54906003)(66556008)(66946007)(316002)(6512007)(52116002)(2616005)(2906002)(6486002)(6506007)(36756003)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NpL4JhlMPHNqRA7Y3tOO8ys21AIA4wbdnEoLZYcGbzFfz6LbVrCTyNBqyCys?=
 =?us-ascii?Q?+ECmRYKTdCMyHqKh/uYI2MTz4/ZS8OiAWONYAHgiZFN9i0L36kQcdMLDqlbS?=
 =?us-ascii?Q?ULggOeI/r9QHubpo7NwzrFBXudaJx75Aae1x0FnethneWFFOIllwFJbigRQb?=
 =?us-ascii?Q?8CSE7zpamc6DajsPnaS4AAa//yLOIwL0WCG27JPZykMa4rrq7vl2ezZh0rQM?=
 =?us-ascii?Q?q9LR6hrBKPQKoky1VG9vSgWIyL6drlopet7nOKKMFCXGEDwisFR42G/Qp9A8?=
 =?us-ascii?Q?br/EHSkQsCw8JmD6wKuxMNvDqBVzkHsN7n0WbGXgHcWTdeydasY5vQuySRtQ?=
 =?us-ascii?Q?cxDa/6B33tLmrc5/A9NSXeCsSqeAYvvlePfPY/MmEDiO25X2zNQvIVEbn3Cd?=
 =?us-ascii?Q?kU3mbY1Ai5jNoMIchj40AfP4ghqf69GGUUfgtxX2UcRsmpu+or9eV61PHmFl?=
 =?us-ascii?Q?Rx/B1Qmj1sy+hb+Wjdgh6D708H9g9At3X4Y8Gepc+JMHaOGRgmyMtFFlL+AV?=
 =?us-ascii?Q?QiJWt3HRWxnVs82fagIkQlzIO+F4tx3frURcFhjB3cVn31TiAXCRdEbaRFW/?=
 =?us-ascii?Q?47vNZ8fg0R5gJxYLEmD5VDI7HxEuoazopG31775atjVhPxzzQDwpjifdV9um?=
 =?us-ascii?Q?/Gm+TEHQ7qySUZR+RBcvI1ygNby1cmGohoQz5qxKjxJ5kvcIS+0zTMlxQ2mi?=
 =?us-ascii?Q?e36EZCSxQjtdRhB6y/OEfvmYB+HcNqcouvHdc3wv+RNI/0lsva2ItSjv/9Vt?=
 =?us-ascii?Q?XnpmB59CfO9S6ZTj30hdOZnG3u4wBmkGZD/fPzExVMe7fn12IMXpRbDHuB9Q?=
 =?us-ascii?Q?EwYcpLKTcVACtwwgOl96YqkSdTdt09mqfo8U5fD9qIQasRtPI5MJhJKltE8X?=
 =?us-ascii?Q?8igRL2f8NihtAu5pwATn/1sroPsZfd2nY92qDMurIbhtby/mCXCslMpmIAeR?=
 =?us-ascii?Q?sPguzMT4Q78ebdKLyqNiFaF7b2CRlblJsFvzR9YRtVk8Tf7yqttKcf0Br9dp?=
 =?us-ascii?Q?t0r/E7sfSYtiw8iXa6mk8aBBX3UOlFmKoN9UgYWIC2EvFS7y624mJP/w+G0d?=
 =?us-ascii?Q?hjHRyKXw1PqEaWNTtjB0jkG4+SgOod2nivVUCXtdljai71uUn8oglG1ZsIWo?=
 =?us-ascii?Q?ayvoN15bpaGDp+gf9eKXHqbFjhGMNM9xHsrNA65Y1WTZzTfNkkwoWYOPng2U?=
 =?us-ascii?Q?yIP7sOFRsUDAz98E1ee3/kukH8sliMA+LAoLdMP2IhPJdL/0LhZxaLHMrCNY?=
 =?us-ascii?Q?pb3ls7SaGvFvlsphkcBpSxkF6F1k4sq7hg3bTxnPcSuRa4i1v7Q6uxuyvw/1?=
 =?us-ascii?Q?rFt7z8LMQDH8qLMb5pIqT9u+pDHOiyrV3nh9oCH7HI2i085xxEd7Gb1hB089?=
 =?us-ascii?Q?BTBem+8RdzTAGSwgl9ozvzrYuSEQOM2XEQCRUidTw7+ZUjprlvyVoqWTT6n5?=
 =?us-ascii?Q?HbL9dO2DJw3BPtBNUu+Ghs/J7dKP2Eg9due+zR0WEA/I4ZI/rPts+pbeuh8J?=
 =?us-ascii?Q?JERmVWejNC2dXjnLMHotXY199emwF4c52YKnDLN+y3P8uvJc+WjwHL4H+JYW?=
 =?us-ascii?Q?+nM0tWA45Y17h48i3ojI2EXVVZ92MkkSsPEXHH+d7K+gHgo+yLvmPOzNsrey?=
 =?us-ascii?Q?fIXbCLfQ9dRAT4qv4LS/Lg0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f57427b-5e45-405d-4c62-08dbbd61d0fc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 00:53:22.0317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTOUw2gLEEQxeE1a4vbhSqYH7msRyMBI/gSsirJs3wPREBaNStqAyvo/k/KXlMR8+w2jOKrlg6m+lvl6AwWKh+PTQNK2QlM94SO+Nlad5YmVN8kF+13xctwBrGwNWhci
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5405
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the Renesas R8A779F0 Starter Kit support.
Based on a patch in the BSP

Signed-off-by: Michael Dege <michael.dege@renesas.com>
Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts | 257 ++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 7114cbbd8713..33e7f2a827e7 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -61,6 +61,7 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
+dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-s4sk.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts
new file mode 100644
index 000000000000..26fda7d4f6b3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the S4 Starter Kit board
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include "r8a779f0.dtsi"
+
+/ {
+	model = "Renesas S4 Starter Kit board";
+	compatible = "renesas,s4sk", "renesas,r8a779f0";
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
+	vc7_xin: vc7_xin {
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
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
+	vc7@9 {
+		compatible = "renesas,rc21012a";
+		reg = <0x9>;
+		#clock-cells = <1>;
+		clocks = <&vc7_xin>;
+		clock-names = "xin";
+	};
+
+	eeprom@50 {
+		compatible = "st,m24c16", "atmel,24c16";
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
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
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
-- 
2.25.1

