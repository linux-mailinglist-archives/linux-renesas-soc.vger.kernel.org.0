Return-Path: <linux-renesas-soc+bounces-8773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78096EA8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05956B236E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF16D15B0E8;
	Fri,  6 Sep 2024 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="eGDLwyKH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2067.outbound.protection.outlook.com [40.107.117.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727E15AAD6;
	Fri,  6 Sep 2024 06:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604116; cv=fail; b=oziLlnUP3Q2f6jIVnpYQge0xFKd8D/bSATkZa9KTNj9/9gzjrPkzaFJy7tRIpFXz/OWrtTGvMa0WKYVZ1xOquRG+VGXgw5mtJNGtyL0RVDe3IJz0uCgUvNoS/7Fq7iQTKvJJYQTFSX+B/+0SK/ZoE0asBMkFnAVGIccvBPbAPUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604116; c=relaxed/simple;
	bh=cikm2FC6auBIaOh1vJuCHO/icFMbB2u/ZGK8PRDbfM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SK5WfrcESZpUu8ObUgqC9bSx/GWqRGo+sGmw+Jn4Clq2uoBYaiipHpwLSZcfPkOxElbnkhl8PC/NPxSBm+ymHqJspdz+JMJ0PHwcmSyXr+b6jrz/sFBhejv+e/eltdmV+uPe0caW/MEVDYAzFW0eKOTnhMi9eWUWpEqp75A1S40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=eGDLwyKH; arc=fail smtp.client-ip=40.107.117.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMD2HhUE5dcKla8Yw2mZUNMbRy0yqhExz4UrHWEGSdZyCCvXX+fcHIhu8CaHMxJaU24zquPBo0WbvbaAme+d1sG+Tq6Fx7Mo1jgGVwHyYK1R4a2ZjhXhIOmXJMEVqVsDdDZqZJ/TZH1lq6xCYZ1h8vmPATW6hRw5Z5bv0Afe0QYqONJsezQO+I5gZu9SCQeM/t/FYnvqrbMHkZ0E1CmFTFZr1kz+2q6+ueij2gh0xajNbfhGB7R358bzez0sjGFiB3xOMOv9XRRDHyGlKw18snkdUQgPdIhp9QTtz8omC4/ghTDGgCH4LIRbsydF5oflmMIjmB+0mLPPy0+9mDRbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOLJimcPeCpdCfRBtB9HXjhtSG89GuCrW23kDWg2py8=;
 b=AewkL/ZtcpGrzB26CKYniOzVKxt3HD+c+XXpI0069LVC/Y+v+5CVdOsEdydaYh7PzfAcard2+ffEJBBT+lzuGlV8dfClbS/34AqPfHu/dMtmZ8GOc/vpLYbfAIWOOT/gKtaC/W85XDehbtVlfCZs8+M6X9O3/j0C8PUHs6E5bhfAxTu35ZXeyuwNbOqkL2Dns7ngBf6GXXJcYlsF5QatE45zLcKVWNaFU4ytJS53NYuE3UH4CBkzyp/Q3etJrrYzyMra1lq2HmWnuox3Dkih3tvJIEYdYYfGt/mR8EvoWIKKJllx4eUVe4KcdSibea5GwZC9NOp+pE812XyTSGmbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOLJimcPeCpdCfRBtB9HXjhtSG89GuCrW23kDWg2py8=;
 b=eGDLwyKHvEYv5AIrBZTFKNcghGk0uMFYpzMWngiABJY0Bf4jwAWrcpjCthO9L6YoQjkKLtj+fkpYoc3I+n7SuOfXz1H2/YG77Dr5WpOwX76Ted78eRVua9qUPhsEvczoahrFOIOyXMhYYUKZwptTkyfubV0pcvMLuKXaIU+0Oia6byF2Kb7iOn5PRfkb2XAcKgm07CjegOYlIoSGmJSgIM9FreCG0gTBfU1yaQsugu6t0n+8ihN6F1JgGSsLQytfs92KJASa2ICFE28KE6d3DKH53TJT+wMN2qZrokTcspR1tAUdLNBS2BbHEkJIGAnuFv7DdG971KDgVwll3Ystsg==
Received: from PU1PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::17) by KL1PR04MB7306.apcprd04.prod.outlook.com
 (2603:1096:820:f4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:28:25 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::61) by PU1PR01CA0005.outlook.office365.com
 (2603:1096:803:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:24
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
Subject: [PATCH v15 19/32] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Fri,  6 Sep 2024 14:26:45 +0800
Message-Id: <20240906062701.37088-20-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR04MB7306:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8fae9c49-cff5-420c-9df8-08dcce3d1cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d/9XyLC5g/Fhs0jEg/Vofk+WnJLloNiDH6Pd6r3IqNktck3708Nd8ZspcoFJ?=
 =?us-ascii?Q?QCNOaVdu+OI2UJ1i5HHap1RQwl8057bDQwOJ4J7v8fdJ/PQgJ319kzHTeBgh?=
 =?us-ascii?Q?r1lqW+91Ll/GkIuzNm2s7j9lFzwSYaYi9gg7NzYkQCMTTQ3Q9ook9+53720n?=
 =?us-ascii?Q?PCYUe+qIDcnuCh4A03ehJZjlFRuFVqgGds6BzJuQ0ZmBQTkA+VD4jUwkK0yy?=
 =?us-ascii?Q?aZKplGM7FIrO+60d5+rjQBRbv8/Wx5VCZqyYYWOBwuSGDbed5JCmdVv2waAG?=
 =?us-ascii?Q?9fabBETZgf/Lv1xN30FlqNb7DfAgkAdfJin1lNTjd35/X4YG6CB5clpMGR7Q?=
 =?us-ascii?Q?Sl1i3aETMuNlvMBWtHsYDcen/Jk1mUFunIqpMY1+GSEy1/+2ZzseVIkjqycY?=
 =?us-ascii?Q?ajcYY7k8shlUVoQfm3ZRPsRDpaSbBCUBfGOAebnLjIiWHWUpQEHPVFKH6wLL?=
 =?us-ascii?Q?hVtzqown97t4qO9X5oz+gEd9bHW5C/Z+/2yrCle+CBSrQENZQgZLJDTJdevT?=
 =?us-ascii?Q?kU/Mw+aSB7bCsszsXD+zYHaN3tr781TXGl8ccSSF/EFbMWAgpPJKHnflHVzw?=
 =?us-ascii?Q?jIYhL/Mw5dueNVOxGGDqa+n0aOhPeptu8g6tFfhLW7movoGxBP6MAu2kAr4h?=
 =?us-ascii?Q?N83L62Z439DrsA3xyNpTcktuKew2M6jkN12+Lw2yy2N2cTSJmf5GEcgbzsej?=
 =?us-ascii?Q?mgYuCG2MvnAHDGmtOudt8BDfxZEC3bTJFXc8LTLGXN9eRAnsUZnz3FaRt07I?=
 =?us-ascii?Q?sp5ZFDySHmwC2am309Vr5ZA1AT6azuzhpsu/0J7ckoYKfnsQJLqci0xho9Oy?=
 =?us-ascii?Q?n07EV9XfWUKvfuMjGAwWdNj1V4Jowj7xh7PopWQQ21W53xvQAs4H+OWzHwQi?=
 =?us-ascii?Q?wfqxLJwNQhc5m5IgVZtgTEXgGfIyYNYSAQUnxrcXK+gfUC7Qo/TZdk7CzAAp?=
 =?us-ascii?Q?rHirbBq7agah7/oXXlncDCJf3svuxQEto2iiC5Rt2KQ5LqD4/rPKFCKK+Rmr?=
 =?us-ascii?Q?79hyly4/k7PmJQwThvgCeqmOBqVTN4BAzdDu3a2I9Fk19Kzb4bc1Ccurv5xB?=
 =?us-ascii?Q?gXWY7iXFDKPeGleJ4vdWQI5rIP8Dr3QbAzo2wjv2wKo8afjyqzGPQc5EkG0Z?=
 =?us-ascii?Q?uYE3vMxG6TCLBvaaD/nvP6GXRCOLJpCwzTxlLjgXbxhIEpusLJCleeWCgCmz?=
 =?us-ascii?Q?SpJ9ruNh6jIFhcbaIUzaoFxI+6Xk5jmKuN4lKiprxY30OxQfT1nFWA/rY2pS?=
 =?us-ascii?Q?DNdjk+X2SK7lQjv2Il/g399ErKrC1aRHM40BAj2mV3+W1AGTuC8vGRGy/B9f?=
 =?us-ascii?Q?DGdc928FON1LYwpRuSJYs0hHmYA1Xp5zBOPhm35dhBjXAXpjg72XjuJw8Owp?=
 =?us-ascii?Q?fL92L7gRopYrp8GUffxpHIRJyzFBuirovrWibAN0RTX5hZVqmA/SJfrOiHlI?=
 =?us-ascii?Q?y+inPSAybXSfT9DHWSL9I/xizpkeTw+P?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:24.7405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fae9c49-cff5-420c-9df8-08dcce3d1cbc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7306

Mux pca9544 to cpld was added on EVT HW schematic design,
so add dts setting for devices behind mux pca9544 to cpld

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 64 ++++++++++++++-----
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7b8a2384d99d..98eeee49b082 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -36,6 +36,10 @@ aliases {
 		i2c31 = &imux31;
 		i2c32 = &imux32;
 		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
 	};
 
 	chosen {
@@ -951,24 +955,54 @@ &i2c12 {
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+		};
+
+		imux35: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux36: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux37: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
-- 
2.25.1


