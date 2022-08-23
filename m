Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFC7D59CDCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 03:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238819AbiHWB0l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 21:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiHWB0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 21:26:39 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECAE5A173
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 18:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5rQXkDnZuD/nx2e7YwheK64GdBWLYQOQk0i9NmW/+a/icyuQ9qnCE7ZOKl2NfCGRsnaOWDUkfYDdRiVXBzO4lhu/Rk2LJkMo+Zks2boBX9bmklrCqUI6sjsOwVFpP1RGix4VHn6rnOhYhsi6dRjGhDebxmgnHCp7wLslB+KYOSySDKSIzLHD2vPuUbsmnrjHnzTckCahgOXBJMSu3abtR7buayVW4ta1ZqzlkGHfJL6uEf4cGvNe4g4qnrklm9EmwceaGHVG+Qq1DMOzlJpxsoZSzd+5S4JGw/mgfq8lT1ngaqCkJVT6mmDEBbBeFNisemoNINXBYOnvkL8bpAxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTzJ3K724K9WxhmAMdn1IKPAemK7uWvvmBimQOvgQSk=;
 b=ijEIgV9RU4O0vlthGRcjCYsVX9B/BbnG6NElQPr8AvsnBfAzD6gzHfonS0esjf5HywVhfWvss+ABk+919stLtxxql4QQgnxIKDycs5gorAgl1TYPIfE36i7NlgnSxb8kX/CJmsTdCuLcKOJSZW1dlEvADuqn8CTkF8jisLL+P0184jNqblnSvXJvqzd+N/FlDhY1O/OFpFL1m9A4gzfinok5WsK7cu5w9IfKbX/3u+tqkS3yHiRetThHWxQ4RHUdIHMn+k36PFvDc2IDS3GzjHRErweZNoFklx0k8+4JEpgU4rpgVz/Z1QN+3ZIQMrxVyS3c352/M+94DiAwfmF9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTzJ3K724K9WxhmAMdn1IKPAemK7uWvvmBimQOvgQSk=;
 b=kCNGQYe4kOXfiRYs8WJy0sDsJOnH7gOLfr16r1jnaenzegK/MGUs5B1jLsbMLRnZb7cfsZIhI/WIiC/TIUui/3ErDULrv6jN8AANjnRKRJbpUwVTjaVYPcwFN/jDxxIfgKyK1lIoLJVgatd1jimHJJOGa1UeiwCOgMc0iOJ6iY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY2PR01MB3147.jpnprd01.prod.outlook.com (2603:1096:404:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 01:26:34 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052%2]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 01:26:34 +0000
Message-ID: <87wnaz92d1.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] arm64: dts: renesas: add condor-common.dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 23 Aug 2022 01:26:34 +0000
X-ClientProxiedBy: TYAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:404:15::19) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2685fad9-aa64-4004-2e80-08da84a6842c
X-MS-TrafficTypeDiagnostic: TY2PR01MB3147:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71yMy6zsvgLD2Z1aR0gpSwDEPedfG6sGwykBksqYwTgYu5Za3JmNHeRrC2G+C65ogmR3XsE1L1wObtbtPQLDD105BejSsdD2U3mb22Tej4XuH/v/IJJtuKjFnC+9+ZDtlzoQQhNuqeliWjCXzbzqJAjTSjab1azIPAZ1j8sYnB5sSsmwp7aptG0ZVYg1e+9Rzgiu/+MEL3+4D+Uo1UfQE9wId6O7CSYmEZbVWVC7gPFM7gD4RiVdFWGqW9O34s26Vgxs7vKzEWL7tP/vmTpIROuMtqBXZ63W3MAw1l5ErO4CGmfVclNnrcBH/savklzfL307IJ0lTocwS3Om+5fyQTLKLiHxqD3kzNwBBmFUVleChAXvrk+9JHaQ4ZfHqJpFRbajbbOXiCyGkvtAsKC3cGQ5+rzyr8cxMeSCItJz3lu5Bgp+KnXQcyIiADRHF0L2Tj4jjIEv6gEZou8MznGCauypLAyqQw4XfdWSNf8jiYl3RAuvtef4zUE60BYVPFF7cqEaR6OvXOtZTK2KeDEqBru44Esux4P0j83vj5btX468vvrGuXTe4ieOlT39uqeRgfCuA0y1jffH/1dM3yIYxUePA7rxlofb7Q9szbO53bwM51LwAq5fydDlh9sgZzHv7AsAyUtfLtccQRdcNvgBHWpgDNbryArgfV2kIR9UqQaMTiLAlUoOh256/9SyZ2dU4g3iG7ivf7rrFDtHTGSsSkqHro4sjIHf6FEgDSbEwMHF6Z1OSo5J0J6g+3mQWm75cKs1gV8NLMPqyo6+GmPg+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(66476007)(8676002)(66946007)(4326008)(66556008)(316002)(54906003)(5660300002)(8936002)(2906002)(38350700002)(30864003)(38100700002)(6506007)(36756003)(41300700001)(86362001)(26005)(6512007)(52116002)(107886003)(478600001)(6486002)(186003)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KAw9xFi5SGCy1kBbnV775NlM7Pcd8rwNXYOzzJQNiodnu5r9I5yZATk00NLh?=
 =?us-ascii?Q?4qdrmlZeXbjIkkO6VZxopphbTkDcQE7KSRmOmw4RoNcthoB4dXzYQwwf8Ees?=
 =?us-ascii?Q?w8tD4/rLPedPXT25gSwxwCh0pDQAFrJ0uPmExLvUe0Ik/JQCRHeEmfPuYj6s?=
 =?us-ascii?Q?0lZdJNDjaPTvnChkxQH/syCIhB5qlOpA9XIK1CELcvsojjleXLXbbp0n1Apy?=
 =?us-ascii?Q?vOkg8Pef+rV86iHhS9dLlP5ZrsPRL0fCJ7Lk98MFmMnqH+36IjQv/DyVynki?=
 =?us-ascii?Q?1yvYOsDW52k4+NQOjfUx9twp8iyVeKGoJn5NruLptNEWNoSdq7CuykEh6h8+?=
 =?us-ascii?Q?aAe3QVVxxINriIzMj9PDi9r3af74iwtHJnQaL+9F6dwoKBh4fjPEkMYp0BDM?=
 =?us-ascii?Q?ZxR2nbR8w6iQLwLzgwWn3u8EyXOIf2UAs7yFQVZDQxxjf9Wx+pQVC28s/LBD?=
 =?us-ascii?Q?vsc8/v66yfHqwtlv/f5y9gIybz+VqtV0p2RsO1lVLCVkbK0sUpmda/I2G+MI?=
 =?us-ascii?Q?E834c6wmXQgnE2/uv6xXcqWmgr3tGX+csmqZcEMq+qNLIwsIHbX8ZGBseGmJ?=
 =?us-ascii?Q?jR6KhH64rO5GN/XEaZPcFQ9kk5WNSEi8syphs0Tt7CYm2mTl97eRHuS5t+ch?=
 =?us-ascii?Q?ZKdcz/whNud67O7pFPJmoTuM2Iu2dBWL7bE07UVgL4Rh8oPctInECDBPIqII?=
 =?us-ascii?Q?tEt0tJgu+3Az2yNupaOwY6CJJQtH0MucefFjQRotfMwMMGfWvs+1xLBxFv/q?=
 =?us-ascii?Q?pikpOIVB6BC09IB4iMv9pS7st+0nPVVQAIGVdjdU1AlunM/U7GglegEzRMxN?=
 =?us-ascii?Q?FlFQv4KlxpfZLQpw71sRvu3Xc0cidE5xU5J7XjudgSYUsBg+TYOJoBYNq/+e?=
 =?us-ascii?Q?wuQhznW5UHiNdb0XRkRCKUq+iLeddFvgwd/gznuO1GDDdYClKROqzuGYoyww?=
 =?us-ascii?Q?5CgPkSB5st7pe9c3dG1TIcm5qyFqejIWv9YawqkKb+2BLnGwWY6wwCC3EjRE?=
 =?us-ascii?Q?cqPcNNTFzx8veMIeEac7VHe7Zg+WWFwAREdWKfSI8jjbXo7r9JOLn8oP6EL8?=
 =?us-ascii?Q?u5i0O+T6+EouBu/3If3fDZjySJ/fCVJX4hjNAQ0A5fJ+wKHOaDEACY/YocUq?=
 =?us-ascii?Q?h7SMvvTm9HcZVbE2BWvuunFu8o9fkUJVacWWi7a7a6QagH3XjNGkSNZx3Bmd?=
 =?us-ascii?Q?GXVmFln+mgAssq3LatXvIm+VD+L5kn5fIJ/R5OW0u5GF+12/JNPshHcsrgey?=
 =?us-ascii?Q?zFpkNyUw4JNT3uRxWoF1NPeau5Cj61I1cSyHKAI3xqyzB4ySfVI6MHo6E6ov?=
 =?us-ascii?Q?Ze6/4GW8hSeFp6E/HN+tPMsxCOwP0Kvy8rbBv9S6hWTtCQfdutYo0mi9iynz?=
 =?us-ascii?Q?rdfj4zxcntWJonay56Cx/ZxUPda47AfnBEPhlB3aqPQB9XUk/afDH7Fm9x6d?=
 =?us-ascii?Q?l6dH/UyIINNF+T9F1IPluWDzlT8ggh/EyqHNjdkQgJE8EEm3gqXgtH29Geqm?=
 =?us-ascii?Q?WeORvq8b4tKhec4HQsSjt9SErLtJVsT5se4Zc2iUb0jAHxkuuXSlw6wU74Tn?=
 =?us-ascii?Q?+BUpwgZOjB0QIdAnvCSYtQs93m/o52J+CCxI2/EiOdXxAEjkWKU+9fIxCrr2?=
 =?us-ascii?Q?p/cNcqp+hwJ9l7vtNTXJKS8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2685fad9-aa64-4004-2e80-08da84a6842c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 01:26:34.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIn/KKYNF4l5wDIyDBk9nfXQfieUk0SkQSbmMp2CpHYiLTxA8SkNcGAxgFy81Xdzu69o98Md/CYpm2xDd5UOSSM89LdXY5NZnZ6Fz3ZWeRVPo8gWnoW4v35KGAL4qlEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3147
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

We have V3H Condor board, and will have V3H2 Condor-I board.
This patch adds condor-common.dtsi to share the common settings
between these boards.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../arm64/boot/dts/renesas/condor-common.dtsi | 542 ++++++++++++++++++
 .../boot/dts/renesas/r8a77980-condor.dts      | 534 +----------------
 2 files changed, 543 insertions(+), 533 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/condor-common.dtsi

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
new file mode 100644
index 000000000000..ed982eeed2f2
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -0,0 +1,542 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Condor board with R-Car V3H
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	aliases {
+		serial0 = &scif0;
+		ethernet0 = &gether;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	d1_8v: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "D1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	d3_3v: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "D3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
+	lvds-decoder {
+		compatible = "thine,thc63lvd1024";
+		vcc-supply = <&d3_3v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				thc63lvd1024_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				thc63lvd1024_out: endpoint {
+					remote-endpoint = <&adv7511_in>;
+				};
+			};
+		};
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0 0x48000000 0 0x78000000>;
+	};
+
+	vddq_vin01: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDQ_VIN01";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	x1_clk: x1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
+};
+
+&canfd {
+	pinctrl-0 = <&canfd0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+	};
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max9286_out0>;
+			};
+		};
+	};
+};
+
+&csi41 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			csi41_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max9286_out1>;
+			};
+		};
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&x1_clk>;
+	clock-names = "du.0", "dclkin.0";
+	status = "okay";
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&gether {
+	pinctrl-0 = <&gether_pins>;
+	pinctrl-names = "default";
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0022.1622",
+			     "ethernet-phy-ieee802.3-c22";
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	io_expander0: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	io_expander1: gpio@21 {
+		compatible = "onnn,pca9654";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		avdd-supply = <&d1_8v>;
+		dvdd-supply = <&d1_8v>;
+		pvdd-supply = <&d1_8v>;
+		bgvdd-supply = <&d1_8v>;
+		dvdd-3v-supply = <&d3_3v>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7511_in: endpoint {
+					remote-endpoint = <&thc63lvd1024_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7511_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gmsl0: gmsl-deserializer@48 {
+		compatible = "maxim,max9286";
+		reg = <0x48>;
+
+		maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&io_expander0 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+
+			port@2 {
+				reg = <2>;
+			};
+
+			port@3 {
+				reg = <3>;
+			};
+
+			port@4 {
+				reg = <4>;
+				max9286_out0: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+
+		i2c-mux {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				status = "disabled";
+			};
+
+			i2c@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				status = "disabled";
+			};
+
+			i2c@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+
+				status = "disabled";
+			};
+
+			i2c@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+
+				status = "disabled";
+			};
+		};
+	};
+
+	gmsl1: gmsl-deserializer@4a {
+		compatible = "maxim,max9286";
+		reg = <0x4a>;
+
+		maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&io_expander1 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+
+			port@2 {
+				reg = <2>;
+			};
+
+			port@3 {
+				reg = <3>;
+			};
+
+			port@4 {
+				reg = <4>;
+				max9286_out1: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi41_in>;
+				};
+			};
+		};
+
+		i2c-mux {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				status = "disabled";
+			};
+
+			i2c@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				status = "disabled";
+			};
+
+			i2c@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+
+				status = "disabled";
+			};
+
+			i2c@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+
+				status = "disabled";
+			};
+		};
+	};
+};
+
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in>;
+			};
+		};
+	};
+};
+
+&mmc0 {
+	pinctrl-0 = <&mmc_pins>;
+	pinctrl-1 = <&mmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&d3_3v>;
+	vqmmc-supply = <&vddq_vin01>;
+	mmc-hs200-1_8v;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&pciec {
+	status = "okay";
+};
+
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
+&pfc {
+	canfd0_pins: canfd0 {
+		groups = "canfd0_data_a";
+		function = "canfd0";
+	};
+
+	gether_pins: gether {
+		groups = "gether_mdio_a", "gether_rgmii",
+			 "gether_txcrefclk", "gether_txcrefclk_mega";
+		function = "gether";
+	};
+
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
+	mmc_pins: mmc {
+		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
+		function = "mmc";
+		power-source = <1800>;
+	};
+
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
+	scif0_pins: scif0 {
+		groups = "scif0_data";
+		function = "scif0";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk_b";
+		function = "scif_clk";
+	};
+};
+
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>, <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 43ed033eb512..1d326552e2fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -8,541 +8,9 @@
 
 /dts-v1/;
 #include "r8a77980.dtsi"
-#include <dt-bindings/gpio/gpio.h>
+#include "condor-common.dtsi"
 
 / {
 	model = "Renesas Condor board based on r8a77980";
 	compatible = "renesas,condor", "renesas,r8a77980";
-
-	aliases {
-		serial0 = &scif0;
-		ethernet0 = &gether;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	d1_8v: regulator-2 {
-		compatible = "regulator-fixed";
-		regulator-name = "D1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	d3_3v: regulator-0 {
-		compatible = "regulator-fixed";
-		regulator-name = "D3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	hdmi-out {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con: endpoint {
-				remote-endpoint = <&adv7511_out>;
-			};
-		};
-	};
-
-	lvds-decoder {
-		compatible = "thine,thc63lvd1024";
-		vcc-supply = <&d3_3v>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				thc63lvd1024_in: endpoint {
-					remote-endpoint = <&lvds0_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-				thc63lvd1024_out: endpoint {
-					remote-endpoint = <&adv7511_in>;
-				};
-			};
-		};
-	};
-
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0 0x48000000 0 0x78000000>;
-	};
-
-	vddq_vin01: regulator-1 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDDQ_VIN01";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	x1_clk: x1-clock {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <148500000>;
-	};
-};
-
-&canfd {
-	pinctrl-0 = <&canfd0_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	channel0 {
-		status = "okay";
-	};
-};
-
-&csi40 {
-	status = "okay";
-
-	ports {
-		port@0 {
-			csi40_in: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&max9286_out0>;
-			};
-		};
-	};
-};
-
-&csi41 {
-	status = "okay";
-
-	ports {
-		port@0 {
-			csi41_in: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&max9286_out1>;
-			};
-		};
-	};
-};
-
-&du {
-	clocks = <&cpg CPG_MOD 724>,
-		 <&x1_clk>;
-	clock-names = "du.0", "dclkin.0";
-	status = "okay";
-};
-
-&extal_clk {
-	clock-frequency = <16666666>;
-};
-
-&extalr_clk {
-	clock-frequency = <32768>;
-};
-
-&gether {
-	pinctrl-0 = <&gether_pins>;
-	pinctrl-names = "default";
-
-	phy-mode = "rgmii-id";
-	phy-handle = <&phy0>;
-	renesas,no-ether-link;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0022.1622",
-			     "ethernet-phy-ieee802.3-c22";
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
-	};
-};
-
-&i2c0 {
-	pinctrl-0 = <&i2c0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	io_expander0: gpio@20 {
-		compatible = "onnn,pca9654";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	io_expander1: gpio@21 {
-		compatible = "onnn,pca9654";
-		reg = <0x21>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	hdmi@39 {
-		compatible = "adi,adv7511w";
-		reg = <0x39>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
-		avdd-supply = <&d1_8v>;
-		dvdd-supply = <&d1_8v>;
-		pvdd-supply = <&d1_8v>;
-		bgvdd-supply = <&d1_8v>;
-		dvdd-3v-supply = <&d3_3v>;
-
-		adi,input-depth = <8>;
-		adi,input-colorspace = "rgb";
-		adi,input-clock = "1x";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7511_in: endpoint {
-					remote-endpoint = <&thc63lvd1024_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				adv7511_out: endpoint {
-					remote-endpoint = <&hdmi_con>;
-				};
-			};
-		};
-	};
-};
-
-&i2c1 {
-	pinctrl-0 = <&i2c1_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	gmsl0: gmsl-deserializer@48 {
-		compatible = "maxim,max9286";
-		reg = <0x48>;
-
-		maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
-		enable-gpios = <&io_expander0 0 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-			};
-
-			port@1 {
-				reg = <1>;
-			};
-
-			port@2 {
-				reg = <2>;
-			};
-
-			port@3 {
-				reg = <3>;
-			};
-
-			port@4 {
-				reg = <4>;
-				max9286_out0: endpoint {
-					clock-lanes = <0>;
-					data-lanes = <1 2 3 4>;
-					remote-endpoint = <&csi40_in>;
-				};
-			};
-		};
-
-		i2c-mux {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			i2c@0 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0>;
-
-				status = "disabled";
-			};
-
-			i2c@1 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <1>;
-
-				status = "disabled";
-			};
-
-			i2c@2 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <2>;
-
-				status = "disabled";
-			};
-
-			i2c@3 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <3>;
-
-				status = "disabled";
-			};
-		};
-	};
-
-	gmsl1: gmsl-deserializer@4a {
-		compatible = "maxim,max9286";
-		reg = <0x4a>;
-
-		maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
-		enable-gpios = <&io_expander1 0 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-			};
-
-			port@1 {
-				reg = <1>;
-			};
-
-			port@2 {
-				reg = <2>;
-			};
-
-			port@3 {
-				reg = <3>;
-			};
-
-			port@4 {
-				reg = <4>;
-				max9286_out1: endpoint {
-					clock-lanes = <0>;
-					data-lanes = <1 2 3 4>;
-					remote-endpoint = <&csi41_in>;
-				};
-			};
-		};
-
-		i2c-mux {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			i2c@0 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0>;
-
-				status = "disabled";
-			};
-
-			i2c@1 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <1>;
-
-				status = "disabled";
-			};
-
-			i2c@2 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <2>;
-
-				status = "disabled";
-			};
-
-			i2c@3 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <3>;
-
-				status = "disabled";
-			};
-		};
-	};
-};
-
-&lvds0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			lvds0_out: endpoint {
-				remote-endpoint = <&thc63lvd1024_in>;
-			};
-		};
-	};
-};
-
-&mmc0 {
-	pinctrl-0 = <&mmc_pins>;
-	pinctrl-1 = <&mmc_pins>;
-	pinctrl-names = "default", "state_uhs";
-
-	vmmc-supply = <&d3_3v>;
-	vqmmc-supply = <&vddq_vin01>;
-	mmc-hs200-1_8v;
-	bus-width = <8>;
-	no-sd;
-	no-sdio;
-	non-removable;
-	status = "okay";
-};
-
-&pciec {
-	status = "okay";
-};
-
-&pcie_bus_clk {
-	clock-frequency = <100000000>;
-};
-
-&pcie_phy {
-	status = "okay";
-};
-
-&pfc {
-	canfd0_pins: canfd0 {
-		groups = "canfd0_data_a";
-		function = "canfd0";
-	};
-
-	gether_pins: gether {
-		groups = "gether_mdio_a", "gether_rgmii",
-			 "gether_txcrefclk", "gether_txcrefclk_mega";
-		function = "gether";
-	};
-
-	i2c0_pins: i2c0 {
-		groups = "i2c0";
-		function = "i2c0";
-	};
-
-	i2c1_pins: i2c1 {
-		groups = "i2c1";
-		function = "i2c1";
-	};
-
-	mmc_pins: mmc {
-		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
-		function = "mmc";
-		power-source = <1800>;
-	};
-
-	qspi0_pins: qspi0 {
-		groups = "qspi0_ctrl", "qspi0_data4";
-		function = "qspi0";
-	};
-
-	scif0_pins: scif0 {
-		groups = "scif0_data";
-		function = "scif0";
-	};
-
-	scif_clk_pins: scif_clk {
-		groups = "scif_clk_b";
-		function = "scif_clk";
-	};
-};
-
-&rpc {
-	pinctrl-0 = <&qspi0_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	flash@0 {
-		compatible = "spansion,s25fs512s", "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <50000000>;
-		spi-rx-bus-width = <4>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			bootparam@0 {
-				reg = <0x00000000 0x040000>;
-				read-only;
-			};
-			cr7@40000 {
-				reg = <0x00040000 0x080000>;
-				read-only;
-			};
-			cert_header_sa3@c0000 {
-				reg = <0x000c0000 0x080000>;
-				read-only;
-			};
-			bl2@140000 {
-				reg = <0x00140000 0x040000>;
-				read-only;
-			};
-			cert_header_sa6@180000 {
-				reg = <0x00180000 0x040000>;
-				read-only;
-			};
-			bl31@1c0000 {
-				reg = <0x001c0000 0x460000>;
-				read-only;
-			};
-			uboot@640000 {
-				reg = <0x00640000 0x0c0000>;
-				read-only;
-			};
-			uboot-env@700000 {
-				reg = <0x00700000 0x040000>;
-				read-only;
-			};
-			dtb@740000 {
-				reg = <0x00740000 0x080000>;
-			};
-			kernel@7c0000 {
-				reg = <0x007c0000 0x1400000>;
-			};
-			user@1bc0000 {
-				reg = <0x01bc0000 0x2440000>;
-			};
-		};
-	};
-};
-
-&rwdt {
-	timeout-sec = <60>;
-	status = "okay";
-};
-
-&scif0 {
-	pinctrl-0 = <&scif0_pins>, <&scif_clk_pins>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&scif_clk {
-	clock-frequency = <14745600>;
 };
-- 
2.25.1

