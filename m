Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87B3C5A5830
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 01:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiH2Xwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 19:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiH2Xwi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 19:52:38 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::719])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C277275
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 16:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYy1Kq3DA8dkqN/TAnC4HcleMDlWnWowLQaqdKmF7sMzF9eo1zJ9bIUrv6yh4Omat+Te/K1DZ1mRPQ9Y0imcmrefcvm7/s7MlFftZEr+q1qFnqUA3Tyw5Yv5zhI1BenMYtEpPl9dsXz9BMyVX7hOgGhq7GBJhCl+xcxzzi+56LCeZw94cH6jQySLdrOLDJc5O1ZrMQ1+gadEVNd7kkaRwjctN3YPWoJMj6H+TzfZq9tqf7zJ8mfV0+my92v581sI0DDy8M9mZhvZW0xJqGc48/ZJVQjmYa84YB7WZUa27jkQAUCUgN0Xw2jAndTutl6dE3CdMn4Lv9LkgFeB10+Ssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpO9EHxV2OPvkQJAemA/l8YOoO724CATiMfd4rCjFFM=;
 b=Tg597SQPg5bYF55UbF+gzvrwzowPdlzbSH2Katd4TWWCEtMsbXC1YXxu199YFFGldt4jyIp72JfN9VTajr4CVOo94Yjk7CM0o/Kcm8ao5LgVsKujFvWBdbMUaClyvnZ8EeLL0SmqYjCmsrYSh0rIH4aPzoPBru7/j8w3eSbnfmpCZNhgpekq/kJGvodozNvrWCMwvdQqHAponoKsLutomcC9ZF0cu52UI/jwUWQEwn0izHffvjlXzSfo8/Qy04qc9ZtWKwlXwzr5WO+cuteoy3FES2MVD3SZ53hxLTQfp7k0hjp+cYjpgmIne6KNvjtCaMEiOdk7maepxLu2XEIp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpO9EHxV2OPvkQJAemA/l8YOoO724CATiMfd4rCjFFM=;
 b=PB58BO1XYEv6YkvmnHNc6lds8Brmk1ykiZXJVCr2ETDhU0XRPMDFGT4Dt6+HC4UZYb3tkRWuN9bo6KaAY31NeP7WXyHrg+EcnNkHwAv4QWpCdp9KPDx5Cmn3j4ZqgepoZsfjVsZb2gsOGcg+fzl6/OBtYuGA5oCYkHnlQYt+tNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB4218.jpnprd01.prod.outlook.com (2603:1096:404:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 23:49:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 23:49:42 +0000
Message-ID: <871qsy625m.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/4] arm64: dts: renesas: add condor-common.dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 29 Aug 2022 23:49:41 +0000
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 731f4ae5-888f-4f0f-3fca-08da8a1924b1
X-MS-TrafficTypeDiagnostic: TY2PR01MB4218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+g4gGP/L/rCfbqRCzhnhJfW6zR7MZhYlvjqiMYsxVN1B9f2rCFpNTVhVHi9iKFsL5TJEgjYyMxl8u0amdu4vbaWIGwlnDPo2mOq+dM3sJgQfqdCjFvDBeEPJLdDjRBVEZBQ/SJ5EVzu8ytqtuGbR/3nOXMe0ivV+oeul7j/JfaCjs2rMO6xKRxq9hcpxy2J8wpFrjESpLaKonN4/OJ0c7Uwe1FKjvKnBEaZq5FInD/EVsYV2EwGbintzrjjp7FJhKwwiIRUrs/DeBMS3Ay0ws6/NxmrAB4oMfv7eMJ7nr2c50GszIqXURpZSUu0j8caT2VlFCch//bV0D5IKa0Yfkom22VtuYGt7TY7h/Ij8VcZZrbEqDljqMCVDzISv52+Y2zHdGBcMkyTfa6n6T8NUbQ4l+ExUVST/d4fmbC52T38PNTMO1Kkp21atIWr0R+YfEH4800hMTSjYGdp0VGUKb2PbwKruTHqxoESMoLiNcdrNoLjtSaQRNdLyjUqh35AdRTyLT7xKK17a/zNxEvBJfBuRnQ34mN1kG107x6GpI75AaBjzGmhCHMFY/xSlo9fpfuX307uP1g1MQEXGCnJo6bYqXJ2xWQmNCsSXtF4eN7m4wPNRaFLPDMOvkYykyImkbG2CxG5Y3tuCQHKwQ77W7xx5kVZ4tlYpG+TlvnSjjXK+P4Y5zSpmLJVqMqX9STfKSaHchfdhgmEFaJxJrkWlrLNc/usD8qLN7VVP5i9Ijn8M5lTz2RWwWeK4FKiB81YIkTUt6m76alrqGY/XyolFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(186003)(2616005)(83380400001)(2906002)(54906003)(316002)(30864003)(66946007)(8676002)(66476007)(66556008)(5660300002)(4326008)(478600001)(6512007)(6506007)(52116002)(26005)(6486002)(41300700001)(8936002)(36756003)(38100700002)(38350700002)(107886003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d9HasqHqakpVR3mI1XSQccVsYGemXZi66V1ooIYR53Nq/n3i92iNZeseA/wi?=
 =?us-ascii?Q?zOxwBozQWtdTlJQkj6CLKJcJ/5ORJReQU5a1jClv27ZU1zxiiHQYIXwDiCg6?=
 =?us-ascii?Q?pUtKyN/tmIouVGsltqpTqrk07qE/mWUAX3vn8gO7YxrmsIetvradUP9DjkF9?=
 =?us-ascii?Q?JNHmOfM6X/AX+xGPu3KncEgS4Pq3AZ5A1bqvEYax/El9HMGEPljha8sXc1+t?=
 =?us-ascii?Q?msYU/ChwoOr+VBI3KAbgZ2ihziEDrR4adl9KNLdVzy4lKnPS/j+PmHau4LBr?=
 =?us-ascii?Q?oCL7liqxMqY5Ifo2enLx6q7LAALbCMZ3CQ/XLXWBjzkoPh+BN8LvBVTHsACJ?=
 =?us-ascii?Q?SRv5T2i7QFU8ZNRiTMgkIoKw5iNuLyL0+5ZatQCbbUg7GKFle8RTJ/4vurwF?=
 =?us-ascii?Q?LEAGB7lag0+u4dceJN3Z274jqVQaShcjH+MLqEVjz4JwQVc8MUdAVy9Qc6Vy?=
 =?us-ascii?Q?in3HN5om6uLyPWSA0Lry6IVvOuVTQXgmI84oFo2OM8zAxfQ/TEwJN1k1cRpy?=
 =?us-ascii?Q?JCp0ByFTQ8b0H19L43IXDa+CwGsDS8iP6CNVokNCiJbYpDILoXGATiZh/WTO?=
 =?us-ascii?Q?bizUS1yEPaiJnl9ERSTG85FhIvjtSQK63nhQts3/RJNLAKoo3xypSRfKIx2q?=
 =?us-ascii?Q?xkaKcoLECZkF2o6UEU3TVP6Ik4TBYRV9MrT6rfNO3iK3dEiCd/Tr7Erx7t1w?=
 =?us-ascii?Q?SK0sLiEpc8JzaeisBmG68TDfoRuIlQZh1+beXibQjGaCDpOw92Mx4PeujZOi?=
 =?us-ascii?Q?LIg7MQyX+b1fcVuUjSgIxjG6vrC2bgIyC7cFd2Q2V8UcXZu1qUhDQubvlg/V?=
 =?us-ascii?Q?tCn2zTBQCB+QOHpj6bfB/5HHz99i4qux5avhSokh4gj1nIaFFWRb230L0jE5?=
 =?us-ascii?Q?abPLiEizNIXIotzmczMc5i9cTo1nCOdt2/QL/VS9Petq2mjMaJa1OSi2bFwy?=
 =?us-ascii?Q?DTR7ttO98hNdAD3Mx/8bTKsuxk+tSDtTvFgwu49+4nzi/5MLVe1DwLxzuexG?=
 =?us-ascii?Q?EprwD8INavKkp3erdSyQ0mTPUm0fiI3BBoZ58ICZn7hm6453kWZTYWEXz/MQ?=
 =?us-ascii?Q?Rt+AB4VPjL9+pee6MbG0HAh4XWhyyjR5r2BTqgmDqxyLy3VPd7DGyZair7er?=
 =?us-ascii?Q?JucAyyt+brdJff6Zlp1uEqP1qxmmbPegOZWkNnDVwKf2JDH2Ej813RHLLZt2?=
 =?us-ascii?Q?AM3MAxJAkScMMbvOxJ7nS0UeDmiEFtGCVHOSSSm/Cx8oU7zSmIFUQR8J7sU2?=
 =?us-ascii?Q?I6vG7Skc/Eqbuelrow0Fd/pUxck0wUxIgZywRXPWNng3k8PTClcXyXSJ+U59?=
 =?us-ascii?Q?faLp0h2TVcLlWsLpfSMQo5G2sYN/gqm7xCrlHqFMTrYUSYtydySPnpla93qO?=
 =?us-ascii?Q?NHv3F2j7ovttRVMTXIUh7zO8puGDisjIQVjFQjbl25cKKUQI3tk/lZTcZ4bv?=
 =?us-ascii?Q?itY5iiMbgKsakEQmvueYm2YBRvusIi5pNG00ASlg8ciWqBAaGPEh4G71VoM2?=
 =?us-ascii?Q?2ktRFc7C1y1I3tYJM3f+n4h8WNQLnMv3bq3mCnepKFTj6/8TL6pdzlRlw/yf?=
 =?us-ascii?Q?s6+pAEdSm17vZCDnwv0GdZAGPJo7P/NbHrLWr7uLWECf1nP3JRc0YpgLqDNa?=
 =?us-ascii?Q?sfb4eBA6HoFIoiXUi82QoKY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731f4ae5-888f-4f0f-3fca-08da8a1924b1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 23:49:42.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sffsEdSZWyu1uyzS1NilNRrepyTpSycbTTbDzgJmBtlfswNinTwCrJ9WosV5mY8TzMrgiCHBxBAzAAtuNesI6yzRqhvYXTR+PfxaJScMA7fH8TVvEysz7eX2GcVaCt9x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4218
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index 000000000000..3b6bf516518b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -0,0 +1,542 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Condor board with R-Car V3H
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
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

