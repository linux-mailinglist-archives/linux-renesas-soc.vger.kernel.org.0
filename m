Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4857B5F1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 04:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjJCCd4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 22:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjJCCdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 22:33:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D6AC9;
        Mon,  2 Oct 2023 19:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGUCq5LapP1PqCn34YgSU/RlLUBgnHYrhRfOK6Z4wA/KkM/Hr3DcaeE6T3ZrdSVBJI4o5mPT9/DBYoEXL9wdVKEkOYHDQvJ1NYBh/gfb1qwR3Db5m7J6XWd7CB2ilSEOG1LnFmQORPYEwii/2CPBINl0NJn1D4sbgMgEDkaA7iCG2r/207bCm0lVGUA01ZicZHxf0QLut3wAu1TK3nuHq9Eioeww1wy5IIG/yB1zc33c77Hnseiy1mv42A7ilcHZZLZKEsDmraEILn9WkkHHe609ziNuDMKSDyZkp8b7SKAO1CRaszctpb03lVV90okgljQfOXBkdbO+qF2ygU6i9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvs8cgAEYsJvf2c5Miuq35rJ1L9ivlRUjmkgaC5ZYVM=;
 b=HGG32Tn30FnA34Glb2yMvwCKuB5I9ZgVwRvL1DZR4cY8Jz8zR0iz4LaFZBqZS34EZiT+EbO4eTWsCLR2dpwdLcf/lDkEIgFSxfFSwkriCTtjrfVntpca/oynF+2J4jdC3o1bSa0jQy7tlfIK6FxLVCGn+bvyYY5RQ6rYOsSTqzYF0TrhODQQTkrqN/7O9CuZnUt/e4lMNRey2gDMo94eNPU+loixsCwJGo8QP0diuehEdvy/qyH7oyt6A+QHWFJjeUokXkfLbN5+o5VpwQCb67+wGuziCXt1ZfsWVaS8Ar9l065aCaZDCOphZRTZlEvtwSF0gQamB/wa6xe1bDrfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvs8cgAEYsJvf2c5Miuq35rJ1L9ivlRUjmkgaC5ZYVM=;
 b=U5R9XGi+EZ2V9SlRW4IVWc8fKbZgUEuCQRbP8SLEs670sMdylh3sQeYT4JHf8q0NNerjQkhcgGIbHmiqCuRyLiz2Rt2kF5P1NlobzxiV6kgvve0zcjUis3cPbyLsbVrk5R5Z68mXpBqgUKQVAgsXoeAseTnyfcendmuSxd69Ez8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8909.jpnprd01.prod.outlook.com (2603:1096:604:15a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 02:33:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 02:33:49 +0000
Message-ID: <87pm1wfn8z.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
Cc:     Michael Dege <michael.dege@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 3 Oct 2023 02:33:49 +0000
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d26b25-c863-45c2-ce38-08dbc3b92ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+rlNwiZhTfMihvxh9poA5F04SHf+aEbhFky1vkhsrDoJxwrFo1O5uwkqyZ4j1MktMBXdDqCifpEdVAyV3WRrBQu8IhWpEWemgf0v8KExjj36c+7klyzyoxSrzp81eByKdVdTAFsMlX5+ovtPOnpJ9frnD60EDRGQbGrW85PYIZ+WjMVRiggrmdvixRQLvgHpCVxPDvWtdpHR9gF6dl2ValcGClUr3duh+22j6rosAiRa6uHMzZtLES+s3h1SbUzE8lHTGmd5ig7cgZHK4wlszApxaF9JaardwCDuaahmU9jTko4p3xGq+4BY6fejeTh+ue29W3BH+ul1ba2FheDLA1aKVH+BTcbklsFviadcstKnxqhqqbNYtwSz7bPT0g4QtXLvftMLk8aJ8MBcLtW+kytrCvy7gFzlFnxxkc723VbKLT/ARX9II3w6B4ayA3bLjEC1HuS3Ck6ieVKRCT7NK0U6Wj2pI09Y9K5duXVSoEvS5s6+7rQTSFJ/BBgOWAinTaYLmV1A646LNgMzySR3fEo63n76QZZAxg3f3jk4utlMpdsDtjoh9oxoGlKuLmBzJ6ApeCdM8yN3hqYpczJLvN5Q4QI3xOy6y/xYb204zMIvorLYVcUOopM65qAsi9d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(83380400001)(86362001)(36756003)(38350700002)(38100700002)(921005)(316002)(6636002)(66946007)(66556008)(66476007)(6512007)(52116002)(6506007)(110136005)(41300700001)(2616005)(478600001)(6486002)(8676002)(4326008)(5660300002)(26005)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/OJkqhhHL+26rcX3nQgPeFgTX3cn385hn4Xoo63g4nCDzxzkXYdw3IPRnK3?=
 =?us-ascii?Q?FcYWSvA7FgKU94gVqAeqvmIa9m65izVpWfzFuhRePnR96hOd5DFjAC5pRAiW?=
 =?us-ascii?Q?6334BSjwzqGTKUHMPhOhwsT8ZHZEcX7Zm1tZZk8QCewfLUf1cgLRBICpEf12?=
 =?us-ascii?Q?JLT5Z8BLFxdkIJv+IFyJH6pKvMuE6vf21YX6zvQFHoJ9NXivmOTivmKEEtLG?=
 =?us-ascii?Q?yxNRadodTf5I7EJJTwtiwmx3c15JhhoNzuFYCC4bjQJ1EA4cjJ17DNpPwro7?=
 =?us-ascii?Q?iR8hnqvsgPqgp/JF2EdWoLfprvuROQ4u7DGvgCXYoLC5egjeiOLy9capAxaA?=
 =?us-ascii?Q?Ti7LpvrG7VMiObal2e3avshVAl3P40bP0mpcv6xEIeowTuiPXMqMkNwZl1rO?=
 =?us-ascii?Q?IMXyPy2YEy0mTmS++IUWexxmT0gQfQ3faMRx48g9xB+W+z9XZZSKQY7t4Dhe?=
 =?us-ascii?Q?+XC/LTDNwoyPVid5Czqd2EIsUueR26NWnlBYwhTrpoLhyYEck9EKf1qHVDrd?=
 =?us-ascii?Q?1khiW9v/M8pB1xh6StrvTrW35zxkoir1jypHtWgwhocejlWNdvKYqHxTav4Y?=
 =?us-ascii?Q?akV8kDxcG79VjtEDOjIIEufkr9cF6vNG43P5fL2UHLY0iItQTa6WXvM3PYnN?=
 =?us-ascii?Q?TwwKG40gA/nWBHDei6KjAyEUm1EplGrWpB3gH/G7tB91uYgPgDZVAa9YvRfo?=
 =?us-ascii?Q?VsY2z2bjA84XkemGl8WolP3a+7hkQcwmsNWiTl1MRFiFa9sdX2UYo3AOPKpQ?=
 =?us-ascii?Q?Xb4un6cjz7mdlpJn0kCATP2oo82hyjmSBeKFhum1gV49m5YEGc+PEjVip/CX?=
 =?us-ascii?Q?2tBOmTIwsyjdNxm6b3WYsCgbfIcSvwL85nC+Q59zEPb+/uAeRue0B6fnI6c7?=
 =?us-ascii?Q?oWisdSD04sEgr2zeeRPxbMvLTqichs8H/Yl2oWBy2sFBn/wjyc17lp5cm0Gv?=
 =?us-ascii?Q?tnJSzsEc9oY+8y7b1eZxlkXUGP1tSs3++cZk4TBSEjIcSOQ1oTttfFCd0qmP?=
 =?us-ascii?Q?YnOHWIOS65XpjHzTrK7boQQiMngYB/SAMKTd/AuTLXJhfAr3Hi9K820Zk4eM?=
 =?us-ascii?Q?Pmmy7YZe4K9yuutnUsIwBi1CPMUWfVANF7bS/fbVei3LoIQ/Ui35tzAYF/7x?=
 =?us-ascii?Q?/brgdLGWFNG2sDn3wsBN0IgOfTG7NkvzJdiIX0OCl5YCNvusH9O516ol0tNc?=
 =?us-ascii?Q?Y/P8wk46cSziwpOpW7ZeGP62o0a9fOCRF13ZUYAGSvVCsXQ90zNavLzcuE8S?=
 =?us-ascii?Q?2yKz5HqsaFTyaMHddV+dwYQ5CMsFIS8dUgB+mMQXgWF1N4JOTMKp2j9H6A/Y?=
 =?us-ascii?Q?bF3pFRrWi8+wsxuM3+ZTFvxzEV2zOv2eeak/977PqvMKPdpdRLuYIXTABMha?=
 =?us-ascii?Q?Q9zVpOyFUPIwdml4Qo6zbsnXtQbLetpElp6S14FMgaEnOnpdNHUjMorTq04u?=
 =?us-ascii?Q?ghMZn34lzYxqy9yLXOYbCLtc7UvmlSTTcTfZfYlQpVSYMy1Os3g0klZ79J0P?=
 =?us-ascii?Q?N7wueOaYtXPlERoDjf8NcCaH5rdw4+VHGWAE///cnXuaRE842+bq51OUWfrT?=
 =?us-ascii?Q?dmyAnR6UxrMxzV1IerxtuMiS02KsHHevDmV7lkg+cYaR4MBuP535DhHmn1RC?=
 =?us-ascii?Q?BYHGUZYTQG2PQxc0xlB3JzA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d26b25-c863-45c2-ce38-08dbc3b92ce7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 02:33:49.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRWPGWoa3rstTYDRA1hOqo/s0CDQV+gYdc6UV9C6BsjSPtIUB/wffQjninVRvbFso0UQL+Eqeks4tFS5uQQq/eB8WNkF++/zq+H2msd2gqKasGFuLXOivxfcRpqDZRP+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8909
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add initial support for the R-Car S4 Starter Kit with R8A779F4
SoC support. Based on a patch in the BSP.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 240 ++++++++++++++++++
 2 files changed, 241 insertions(+)
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
index 000000000000..abfda5c6ca16
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
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
+	compatible = "renesas,s4sk", "renesas,r8a779f4", "renesas,r8a779f0";
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
+		compatible = "st,24c16", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&mmc0 {
+	pinctrl-0 = <&sd_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi>;
+	cd-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
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
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
+
+	sd_pins: sd {
+		groups = "mmc_data4", "mmc_ctrl";
+		function = "mmc";
+		power-source = <3300>;
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
+			phy-handle = <&ic99>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 0>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ic99: ethernet-phy@1 {
+					reg = <1>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+					interrupt-parent = <&gpio3>;
+					interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+				};
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			phy-handle = <&ic102>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 1>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ic102: ethernet-phy@2 {
+					reg = <2>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+					interrupt-parent = <&gpio3>;
+					interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
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

