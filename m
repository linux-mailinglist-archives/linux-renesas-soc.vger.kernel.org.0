Return-Path: <linux-renesas-soc+bounces-8782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0E996EAA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35471F207C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71693165F13;
	Fri,  6 Sep 2024 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="2SgE3DBD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062.outbound.protection.outlook.com [40.107.215.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75B0165EFB;
	Fri,  6 Sep 2024 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604147; cv=fail; b=FKwWQvXdLQUfEO5lnzdmzBzgAhWTn1f5VU8mZrZiRxcmvolmV9MpydQk9hukLCmzRp3m8D7FDX5O42ffBjqjuMzP3N31udREztcWi0AHAKzHO4/65IwC6O/3l/kMkrGzA+FFULGdAk81oOo+nOXPL5GiCrnhPKTAulAaQoz/m+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604147; c=relaxed/simple;
	bh=Zc44MPj5msfgVgX+6h+5N5exmY1yQ5xjfARItL8A3D4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Po1BchSvruPmCba+pbjCuUloNOTfennA8X0d7+wO+lKJT7FoLZooUpL0IotLM0NR+P/n8ECXL90Qq6HCJdk3Jes6D+vwGnsHj12crIO2ekVOUQcUX4AXuxaV6Ddz8X4Fm+BFBHHJBbh+dnwWcEfv3XbTkriUK6SQPgivEjaAEAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=2SgE3DBD; arc=fail smtp.client-ip=40.107.215.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ff2N7pnuklZlMNUlA6DZBHKGUTjMSzMXiZoeZia4bQq0fe6iu17r6qMR6/GVdwMCBilZnQ+apA9iocW98TReKdzB5LJkBT9rhY/rbbJnfRvLATmp+uzZF50Af3MK4scVwhEmLQPiWPZllwV6uzBRmLWrN12ueovF6vDYW5vbvF6B62fi2KQS8p4shqoPvIvyV+UcmLquui0vMXgMfuLOc0tkrfurC43Z60Hy3UtgdqhmpBJ7nqN0fWP5Vuoz/iVZCXnEH9bpE151oHOS3ZRiVGkwD5LxXc+tHAVh59LvMFRSKDVYXxrgEeBeVP06kOsQsgugdW5U3PxQb8qKOjWnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=k0iz/UZeHI/9hiGOhLm1KZpV7zhKejw8sIfHsRmu2TaZM61fi95cxyUftghQVo7Qnv6rq880w8SjY9n2TrY+zx/uuzYxUcOC+IMZjZDm8PC9lEJtSOcK7e/XRPwisOPRDoGSwlxBXJTXUsuZpjOhNIpuc8eZOg+GvvgHlmwLMlHqV37887AS6C1AJqwK3kS28VXq+1ANaqEJ/5HH5kYEQ/WMGKy4TCHYrV//kNNo2AC3U4O2d2iscHfM+TI2QGDXeYGiS3IL20oYkFbXi937VpKPG7ES2CL8F9UHvg1phLLBYqh3+cFM+tCQboCj22LMjgrlySxK9y528eH0m36cDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pXz7BSWZBdMOtEGyFa/mxHhT1h94fl5HKQ6bKEYhdI=;
 b=2SgE3DBDb7FN8nLkB4cu1/8SQ7e31KgYcOHYktgjD5lLn8rQIcFJI/ghpRid3jWH6fssVAMsgNHJDkswieQfaCOQIFD1h/a6LuNbLvN0tJrBm33cxT4oK6Q0phKug9c16hQ+pu/OowI1jz1Wc9oovusKmzlBthugBnTkw/zy3/AlWrwXWZECaahUkkFfLtIwxsKEb6atb5uY4yUEVc6b04YLQq0QmGORse/qCKW1gRgr1CD9eGz8GjYytE1efplvBB/W/JWasXUXJO+SBkKurU5UOl7QkkM8bcJto1O3ik1NbhLG0h6AfXr6Ff3GAycfx4iSSDUp3qsnWbf/35A+hw==
Received: from PU1PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::21) by KL1PR04MB7772.apcprd04.prod.outlook.com
 (2603:1096:820:137::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:28:59 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::c) by PU1PR01CA0009.outlook.office365.com
 (2603:1096:803:15::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:57
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v15 27/32] ARM: dts: aspeed: yosemite4: Adjust ioexp bus and remove mctp driver
Date: Fri,  6 Sep 2024 14:26:53 +0800
Message-Id: <20240906062701.37088-28-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR04MB7772:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33fa5be9-5687-45d5-c39e-08dcce3d308b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9t4zpGMsNMR6gLoUx2QPrhywa/7dMWkjQCIgPDyxoyLwGsN5H1QIF69IE/0E?=
 =?us-ascii?Q?wGpSpPmGgUbQHs1ImSLtADGEw22wh3Y+ed+DkG57s1CRCQcyf7N2UpqQ+RnA?=
 =?us-ascii?Q?lwLkcwdoeJJhC80DkWPmkNemhrSHEMdvMRdRh7UYbTe/OcVxrn5SM98Z+T8E?=
 =?us-ascii?Q?0PpJMytBPhKdReq47LcFfwr1ktY7LB1csfjQ0JitaS6RbOHn9TRMqIgy+tkP?=
 =?us-ascii?Q?AGHmdc68t8pNVqgxcMf1O3z4XYvFFHVZE47QX9Lj9eCIttnrapbZMhenMZq5?=
 =?us-ascii?Q?KOKMCoUC2yHuXr3Hw3Rr0YyIymtaPmPvuk8wf/EHO9DEiUwiNUJ8tMa/fOPs?=
 =?us-ascii?Q?+eu+KbpL74EnLppcnwhosFL4VBG36I7bfpF0pR6j2e/U9bdMSWRiicVYFCd2?=
 =?us-ascii?Q?3QI1101UO8EcYYM2c1JFQN8cOmsa8fi1IdEzjUxZbAGIGKMaDIWfOUQ6Vqzt?=
 =?us-ascii?Q?/nIpnHgCLVDdXimO3CPgkdoyjlmpJiYQjkRVZY0+EWzUjIw6KtRvjxWK1Fuq?=
 =?us-ascii?Q?LhMdMNKyXw9WCGTY4yM7kHwAYU8NK0Ou4a6eqzw2N/zxRzoGYhl98Nq49LFl?=
 =?us-ascii?Q?8uv3JLCOshOa1ZJQZKBJGAxR10LvfkaUwQCD1y8C8ODvIv5Yylm4FlyMg/1P?=
 =?us-ascii?Q?NNj2dP+8fsDE9shI45To+4JM8u7ZDlTyS/4Knd9qtAonsYfGFv6foF5C823S?=
 =?us-ascii?Q?LHxuJJVz7MHcfcvt8rzsHgYhjweFj/nOoqSsM+nvoXeyl8PP/+OCHrsm+1iX?=
 =?us-ascii?Q?Yx5Db/vQOR7T/pIMzFzsDNVGw9UblPr5GzSZ0t1rzJCKS2NSaAbs3EoHAMeE?=
 =?us-ascii?Q?4U2KyXydf34md65EZRx/DgfiPvlRnChlhCFp2JRIhTomkcTjjD6dU2l3qTiH?=
 =?us-ascii?Q?Jy8/6EM2rp01+3QzY6KijwfD0P/plGuVor8HrF6VhGeGUyJMuD2ym2XBkwbV?=
 =?us-ascii?Q?kAdV39qbI/ju4dSmVLT06sge6Y4cDTzODpqsqsHQ5V4PaIrUDMw0g2x8+paG?=
 =?us-ascii?Q?F5TnxWu1eba63TcW30v9hxpNZQvOJwG67AjkuVAc5sHgPgXmeaaEnLPROrsj?=
 =?us-ascii?Q?Ps+g0crAND8UpmCHf1cPfrECZn39pNJcR1wqsZ4XsJucOLuEgd3sxZol6oQj?=
 =?us-ascii?Q?Rl3tMnp5RBrot1Vkk4kFkTLtMRFHZkTF2zu7B+NKq9QtLB/CR4YF6mPfzpnX?=
 =?us-ascii?Q?MIjOG1J79wcKJt3VYeinZFHO1gnKTy255e+Zq4JXUqrN7SyXT9yKm2Xzpkpq?=
 =?us-ascii?Q?8p3XBKSaW1dQouzxbSTi/i18EjU04Qvz9x+JlyLPh5uI6FINJjIJU5iEYD66?=
 =?us-ascii?Q?RBz4p8ZP0DPtJTy7yovBPLRo091nIk+MfzEG3jyC86sHbWAX3QmNuQj0KEme?=
 =?us-ascii?Q?upZLJYV9Bw+A8D7Mk70CK55cwCb0A1C4R38wMkZVzgfZ2IDQkkKy1HvyaDc2?=
 =?us-ascii?Q?nvjr81uP/v4d7odMcJeVfCyjFUJWbXBX?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:57.9748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fa5be9-5687-45d5-c39e-08dcce3d308b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7772

Adjust CPLD io expender for PVT stage.
Add GPIO name for GPIOO7.
Only binding MCTP driver on the down-stream port of the mux.
Remove unnecessary driver binding since there's no MCTP device before the mux.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 59 +++++++++----------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f139f426099e..abd4a9173de4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1156,6 +1156,34 @@ rtc@6f {
 				compatible = "nuvoton,nct3018y";
 				reg = <0x6f>;
 			};
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
 		};
 
 		imux35: i2c@1 {
@@ -1188,34 +1216,6 @@ ipmb@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 		i2c-protocol;
 	};
-
-	gpio@20 {
-		compatible = "nxp,pca9506";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@21 {
-		compatible = "nxp,pca9506";
-		reg = <0x21>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@22 {
-		compatible = "nxp,pca9506";
-		reg = <0x22>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio@23 {
-		compatible = "nxp,pca9506";
-		reg = <0x23>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
 };
 
 &i2c14 {
@@ -1470,7 +1470,6 @@ adc@35 {
 
 &i2c15 {
 	status = "okay";
-	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
 	i2c-clk-high-min-percent = <40>;
@@ -1680,7 +1679,7 @@ &pinctrl_gpio3_unbiased &pinctrl_gpio4_unbiased
 			"FM_BMC_READY_R2","RST_SMB_NIC0_R_N","","",
 	/*O0-O7*/       "AC_ON_OFF_BTN_CPLD_SLOT8_N","RST_SMB_NIC1_R_N",
 			"RST_SMB_NIC2_R_N","RST_SMB_NIC3_R_N",
-			"","","","",
+			"","","","FM_BMC_SLED_CYCLE_R",
 	/*P0-P7*/       "ALT_SMB_BMC_CPLD1_N","BTN_BMC_R2_N",
 			"EN_P3V_BAT_SCALED_R","PWRGD_P5V_USB_BMC",
 			"FM_BMC_RTCRST_R","RST_USB_HUB_R_N",
-- 
2.25.1


