Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174257B4B43
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 07:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjJBF41 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 01:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbjJBF40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 01:56:26 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CD5C6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 22:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrHUH6c0OTBvIoR3O0GEYaDmqEeTUW6A4nSfOpUMgZUqouGAve//vS/lj6UqmINqqc2G1WOFagJLJt5L3PcUsSyf626cFFg5yr0Z8FV4pFFStDp1IeboSexg5Mr/9W33rQKuE3WojbJDiN720dK/ynaxrD01WWRzYtbXH1939W5o1NQzMduWbFLs/09I714By5fqAbZHDNITq9WeIIL4mPcDdxrr/om1BcurQSF5lBsBbTJGq9b8j7q1KEWOdab+HcYooKdN8qwHxBTBvYr3FnMezORgNj8dVliN//3YYjpxhSRvawlPY9ZuKIGFtiE9k6dKuqvAhyBVU66LbzyfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvs8cgAEYsJvf2c5Miuq35rJ1L9ivlRUjmkgaC5ZYVM=;
 b=PMRCRMqz3wamUA7hNzX+ClgW4rnlPNuon8dxQ516xpB6ncJGGaTcCG9k9XQAmD9Wgo6ZyP24W6iS77WwAybJMscoKrvheModPLubkl2EDLMtumUVTTlJBQJ0ee1BJZTZIJSixvWL0wOww17TkwJfL99z3lvbieziwIy4WoNwS4LKeUZdQi2sY4UjOvfomrLQpzru9eufEGCdI36grho36xENAdWihYQ7a+emIVZOxoK/zNw7+NH2gaArBWtYH5qk6Qtz7JaWp4SlwYVoJia+YW0mcA7Qs2Mzxz5BjE4BV8NVd+kuaUEyFNPS9A5O0sDDeaeq5BR2nJfUaxIMNiWFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvs8cgAEYsJvf2c5Miuq35rJ1L9ivlRUjmkgaC5ZYVM=;
 b=bP8FMJ0eL5zFdajh9iarfy3Ek/XOyw+mNwpA6S64C9CciazmM/jzarFNZ+L5TOjoUjXTFw5bQxyV1SK1xLygy7wc191lznAE0Qn6XTxP9T248W5quRm9AsDQC2piP62lSUmDvJEJmWMTckRQiyjTBc80mG39gkANP/pka31F6GI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6307.jpnprd01.prod.outlook.com (2603:1096:604:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 05:56:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 05:56:20 +0000
Message-ID: <87a5t1efek.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 05:56:20 +0000
X-ClientProxiedBy: TYWP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8c7414-07ea-464d-3faf-08dbc30c4d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YHtRsAeyzaWRxbxT0SZXtffNhuEJUkER/ndQleaLcS22/vvPuj9K9pfLYB2ktuxvBvvaSYVxkeHE4v6WBzWob/bUuhv3B8DeXD8vdt4+PlAZBg+aIX0gLWZZ6mYo4bnJ3W41H19WcDeOg8Yog0+1kjUz55j96o/HO+c9uULoB/PCvDVgBTEDtMk7ikqRMqUUtziO6vDHXySVFS5ul8Xt4PCv7VY4h40Bm2VI4UOqfKLur0pcD3+bvlguOFXO8B3cLa3liST7gvdpuzWLp+NMqpSzl9Oj7ieUoBQ2Zw92PXhAnNOfasjOpoXK91j5LY5bqh7mmfE7x/UrOp1egiJSJ2J2C7LcG+0YOIPLgxUVej4XzK6xZ4MmJnfGboE9x+3+RpC6VBVtPPPjFJf/7M7XCGv+TZ6tblXt9eV6Oox5b1KorbZRrM/w2bvO+K4IRMp/duYEIfMM5Y2uCLz8YwYeCI6oCl5FWC7A0irybvqsANCmUrlhfG31zhoOX3Lp2YVU1LlJZQKEr5Smuqu17uxDcps9KEAKKENPADt/4gPmHH8BZj4jMLJtZQPpEBo64/MUPhodedN6znjfUZHKxhKRWk+uIn/kJXVX16PV2lDJbJf7DqlHn+scSrMVanA5StCy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(83380400001)(478600001)(2906002)(2616005)(316002)(66476007)(66556008)(26005)(66946007)(41300700001)(38100700002)(38350700002)(86362001)(5660300002)(6512007)(8676002)(4326008)(8936002)(6506007)(52116002)(36756003)(54906003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7u6NHlstprzVefbD4nhtQ6XLyDm54czrQRVdUnvMAPfR2KZi9+2teh30Ny84?=
 =?us-ascii?Q?5fEmMPaOO4fxbblZ8c0ENhtlOX/0kOuohbB/eBsFgw3EocdcxIArwUcTRROX?=
 =?us-ascii?Q?VDnUsx7PZEeue5x1Nqq2fv9mYcqpym46ojSVXGWui3iXPZArJGjEaiMkZx4u?=
 =?us-ascii?Q?0b4NlijyybMY5O4rrofprefj6uyohLqyeWvssh4i84qZQdAC8mJaPTN0FEyy?=
 =?us-ascii?Q?e+r/SnS0yv8SkOPWbMe1HOkQI/jF+LNFCZesAgAStTeKPf8oPP/DOeZiG5GB?=
 =?us-ascii?Q?W+22omgP6VyW0GZwAnQ4OMIQN8ZG1W3LHLGJoFubhV36hzgeYeapyTMHiQEI?=
 =?us-ascii?Q?eqzVLjavRSvnW1/oUqoL2qEYfogiofQ6DkUAtLbM2oX/uF2ls7xCr0XnS34J?=
 =?us-ascii?Q?Ms4gQXcFo4NdKOzkz6bCPYgnkL9CiBoNYp/oXp9QQYCN0tbKoQUma9egektP?=
 =?us-ascii?Q?nhZrA7Arbj4KfZzhU7tCIl4TuC/hMAnAk/pvQGQvuoYwUepUQoiqMH8QU8M0?=
 =?us-ascii?Q?irEU4b73llWuv13LJ2f16zytbYLh1bS5cvtWcJwBFHTGnJdvgS4rBA3HliJm?=
 =?us-ascii?Q?8umKBZZMWxNXl1BrX+mEtUwRHqdds8mkHYRjhLTT1t9X0lkhCQQnYI/qBUTU?=
 =?us-ascii?Q?GuKExNA4L5w0DWOC4+bJ69bxfADT3wds9hrE1+x8H3Q8Cm5hRTbOZWLx9Mvo?=
 =?us-ascii?Q?ExffjMMIandsVvW0WSUyUy+FNfIzHJ6N61IaVj+9v5mUNkaTWfwnPltuwlPz?=
 =?us-ascii?Q?cun3/eZgMvMQ8P63haC+bcHByM+BpliNfHGqBUkB3p+yvebhXKAoiRbgv1O6?=
 =?us-ascii?Q?UJm8sjoepCPnrrR7Kcl04tBNrJri9rDCX7KpE8adXas/xG4pajpAxqMxZ/Ea?=
 =?us-ascii?Q?twrTG85V1lY/b7/Xg1FMd/oq0NHMIwZ+52moxFJLh0ow8d1fl96mB78Huv5s?=
 =?us-ascii?Q?XSG0NUcTYSTNr8Qb/TY7iYVzLEW3bOtBLfcRAd/hOMFdmTJ0IBQX+c8nPv3Y?=
 =?us-ascii?Q?2bkjP/5H5IO1XYDbgxmByv9AzHE0ufmbUmi1x4vWi+xhnHVCgJYvj+2LURyt?=
 =?us-ascii?Q?00JRXftZcO18ZCwRynSduz9OpHpert8gEBjfVfsJ4O+l9fcBkYg5LmPfptwA?=
 =?us-ascii?Q?fNFUYzWuWZP7GigOAp/ZIkMarsS9GaeaneeTce3HW6chRzqHYCbMPcVB8yFE?=
 =?us-ascii?Q?bHYU2h+LJw1WnlQAUT5dsr7P9YxmWXtqki8PuJ+bWjdlyJtHBcIXhIdvLyMT?=
 =?us-ascii?Q?2sFCX0QIEhHf2PWENg6Y+qiGWctG1KqlfKtXQj6IFUkOf4GVY1zs/PPMKLMq?=
 =?us-ascii?Q?LiGkH58b1y5Zjnsa85TrOyPq2XOOHFfU7yy5iI7Qv/8gH1IlDUrT3opX/BB7?=
 =?us-ascii?Q?N/JXlLwshKLLXF2i6eTNYNE68kJZJZxYpQ+/RUPmqC+mff8n2j5nGxXXeJ1y?=
 =?us-ascii?Q?yxIivB2eJD8aGBY3N1fjnhwQ3X3Gz2fpwofMaafrpQAMurpiFJuchOcRDPRQ?=
 =?us-ascii?Q?w2Vt7N2tH7E0noC63MhN5PRQ49VSaovfCm8o1fghyJWYeBRH7/1ymra0fT72?=
 =?us-ascii?Q?osy/9mBGZLQtbwFLKBO0bEFetVBJznPpaJxPNTaHXTZ9ZDQpyrcA2dRUqBov?=
 =?us-ascii?Q?y1IPz8F5Qz7VouqWr39QmrE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8c7414-07ea-464d-3faf-08dbc30c4d24
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:56:20.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQ5jjhZ/O3woEb7S8DcUIGS2M4rDDmb18ZtuEOCLNDoxkgufp3zDhv2xsgqAkMcLrOL+b6EFls5YtX/PoBdb6hpfQRbLVvurHT9AHvpOeor9ZjfQ24ft8XYfk7NcwgIR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6307
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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

