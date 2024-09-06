Return-Path: <linux-renesas-soc+bounces-8783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFE96EAAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D515281173
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABF3165EFB;
	Fri,  6 Sep 2024 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="lEAtsT91"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062.outbound.protection.outlook.com [40.107.215.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDBF154C19;
	Fri,  6 Sep 2024 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604155; cv=fail; b=XxxDEBOcW05/qDBvoHhTyNaWSkzcQoD7Jty866TVsPn5RA+svk6E85NR6OQUBzgAAKvw5IKy11VARSn10bekJSNfL4IcEqZcThLpYkiYuwU+eQOmwQHtP4/c+NkLcWZ4Z9Mt9JwsW4OXkW8vhBLcrBkSuNUUijlY5+y4M7lq3uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604155; c=relaxed/simple;
	bh=uSK7NwkEi13veaYDqGNJo2rL+lTSGlvtBXedPFbkvMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYvlW6hTZU/V3KLdXD/1fNhAhcfdm0JVAXwmHklYNVdoVXrbjJWj2zsEO9SSrAXPVp8+HqvjGaE3pc/H66hRRnkqJ1m5CX198lLVwi0uaU9zXn+YpapB8OOrUqEU9K+BnLg9WaeNN4JFrXBZMWztSWsnfZ/xd56QDEtsGAyVoic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=lEAtsT91; arc=fail smtp.client-ip=40.107.215.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGWybPTRyvMpKYHk7Vu7vLbFgZrfZmVVI8zNyTIlGXdE0OVFv0YDammNKFbmMU2NzGIYzPg0Oiph7Jtrs5qpZaYstk+gquoLIGicfPiimYcrYuLx0OZPoAF4ownBG1SzCE+cxe+/9wY1sKZmFNv5zEFx8w/2LYYgqe+iNBKR7MHEtGeeGQI3ztKQEnwNSB+QKeuaOx8Ff9t1mzJnzBVmdt3aka9HdzVbdjvq2NY1Yv1WNDDH5D/SiUqfAuNXjgVkrKzzfMm52aSK3w9C7Jad4uE/FVT9ECyW4IwYbda0hNAQyxH8DOIR9pcgOrgRCrqLheXoyoSaY9qeGbnDXeDCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+24Kp4KzLO9I4Hcd3hiuundM/PhwavSUaxUKYjbqNc=;
 b=Jd496vYIIXx19grTm+q7IlG5KQamK7MCxoqYuGXBH9HEcq6VlyvBYd+c9MYs5/DVlyqVHGIZ/11f65Cf3daUmHuYbunBLV1VA0Jp5Se0JZ7fQkkS6PgGWnMuq55esas9gCRT6uJKE3XQZ9+Ljj9f+8Fzwa/Y1cxnq48vpaKAi9CQyFvTD14mta2pDNbcP2drlhTLVjnh0I6rBL6ezW6/o5V5tq2atrM9n5Jlp0el/DIbazo+N5xSMQ9sUxdytWwU8vmEBF9LnYIqlmKNQYKkzmTvwBbIsCdsaeoK4EEMlsCYNdCXnMCi6g1IqHBDfANm42fuwzGUo/00GqbEcwP2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+24Kp4KzLO9I4Hcd3hiuundM/PhwavSUaxUKYjbqNc=;
 b=lEAtsT91HI6azxCMnVBgu1Bd6EfyLu3703NIGuedYAhJjoPeAcfsQ78yAQiCAavl/yQBx7iSe5jbwOwK4d+2kwXiLEyx1L/lXtrERzM/l17Xf/97Zq+7pqCFY9VQbweTN0dNWBq8vulnCXyMsXAXv92k/Gyz2qRPeTi/ZGx2XqMltzOSgoDt4xHdHmuaMDO8OGOnort2+0jCY7e4lr3sqnq42f4rFHm7+zNdLPPoABTTLGLu6ezUslVab+Iy8iEHzy3cFnsPSv31+jNImXDcijzlCXUJjExpKT96EIPVr7JYnK9xqdFYDY/Qg/JX2llvA1rwxUGfJbDRB2wBKzvk4A==
Received: from PU1PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::36) by SEZPR04MB5825.apcprd04.prod.outlook.com
 (2603:1096:101:79::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:29:03 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::7c) by PU1PR01CA0024.outlook.office365.com
 (2603:1096:803:15::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:29:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:29:03
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
Subject: [PATCH v15 28/32] ARM: dts: aspeed: yosemite4: fix GPIO linename typo
Date: Fri,  6 Sep 2024 14:26:54 +0800
Message-Id: <20240906062701.37088-29-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEZPR04MB5825:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 85365e43-9827-4ea4-2755-08dcce3d33bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J8UxXsEtDBa3EC2W9MYIHgGefB/qfHOMfBOcGBuDbux6KwinV1FlhQCguHWv?=
 =?us-ascii?Q?Vj2JXxuepJXzg/RsqTnlSLO/9qK85bEV/reO81DjSpUHf0i/a8Lrv+ZRFjue?=
 =?us-ascii?Q?lpt1TsQXPGud6oqPnz9+4pcOoS0RX90XEEVLvbP0YdWPkvjnCKAzgbDK7ake?=
 =?us-ascii?Q?gkyv/yueWeFOLShpsZqQV9VvTxpD0FF1+GVSUFH3edZDHdsNxWUYanrRcvmU?=
 =?us-ascii?Q?4cjBztDKzowQwBvB0Qh1caA/pP0oSb260xuxMXagIhJOnZYmqrFk4Go33lBL?=
 =?us-ascii?Q?BgSwIi+bQib5Py7kybUMEhAq0/FTXUgA3R3VCycYQp1wr//PbzEasAdw5E/N?=
 =?us-ascii?Q?2wKPW4WLyWbPko1OUUNAtJFIGzGBuaU7Yode4njD2IzDH86FDN7SZJLvq1z9?=
 =?us-ascii?Q?oMoNf5ITvZaTJFFix3PBhPbLTF5VJsaJGnYnRWQeCnVQaXlJadNNLPfpLXnt?=
 =?us-ascii?Q?Wzw/bAMr54H3aE6GREO8cffT3Hc3caUDLGWJAurtuq2MLJfxN0QcOHugXops?=
 =?us-ascii?Q?2sn5UHZZPJmdj7uQ9SXJPQfH2XpvJVA+QysT/PK4xnhxNUtGg2ypnRHPtfqO?=
 =?us-ascii?Q?/M9RwhnizexYR/n73VWnAr/lWBo7G67TCtgIhZmmmWiPOGqcXfW8FLFiS8s9?=
 =?us-ascii?Q?FY9hc/nX0jrUng4+aeM0fch99HexGM4fKlbuYMbP5xIE3hmgw6lJEtefz/kJ?=
 =?us-ascii?Q?IOR3A8PZ1QPMzt4OVCdRIJMEyFbgoceNcxhj25CwmDLDokBk9q0GKIMzx/u9?=
 =?us-ascii?Q?yBxujWe3RDqr97jRgR+iRkf0xAmQIXHIrXTYuRZon6qyiLe3Tk1+1x7lL9zw?=
 =?us-ascii?Q?jeafsy1/y0TXKQ7CioaEQ9I240ToOuQSAyAoCuu4LJc6Mdmhd8u6FIPdLW2j?=
 =?us-ascii?Q?RlwK8SwKOBFr0HVVj3l+y0SaJDbFAoTPjiNazDJdNiM18QsIKx1332+g+Z0O?=
 =?us-ascii?Q?Yzxa/DQdCA4GVCZnBlA+6miZbE7K969m9VIm0xO/xjJjoOb4fSmTDuI4t+UP?=
 =?us-ascii?Q?0r3rdIGLT6LCR4PxvDoENXxUJ6Od3Dql61JDst+vEi+HQzvLs/T7AN2yMpoe?=
 =?us-ascii?Q?5QBxM4NREZnh4vYsnXFrIlLse8dtFqxONceEpsPgrou5M/qVXidQuag6s4My?=
 =?us-ascii?Q?IsTPHfhwBt8Ok6xmZbwhJT7D2uye3ETF6Ox2fAmXnezF4KvhDEAMPkDhT5fL?=
 =?us-ascii?Q?VBHgw7z9aWrwtyChTiQZBUdPfG5XWJs/NcJNLontLh2QlHimF+CB7vuE0xD8?=
 =?us-ascii?Q?vHaG+sbh7Hw5Yp3ClYQsTDR4qqwR1+JIlFhQ+Yp534HrWbfJa0p9/wc97OYx?=
 =?us-ascii?Q?ckparayxIf/nVY0djfYIFxhBEUy33KnBjciF0luiDKbkORX44duZWI/XVPYh?=
 =?us-ascii?Q?QYzsBcqC0YO5f9g5I16XncgHmGU7vSC7seZ5ooon9pFattthI2nGdl5C8uhc?=
 =?us-ascii?Q?1eW5OCU/RwkTw/INf398F+5MApZDmY18?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:29:03.3185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85365e43-9827-4ea4-2755-08dcce3d33bb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5825

Fix GPIO linename typo and add missing GPIO pin initial state.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 554 ++++++++++++++----
 1 file changed, 455 insertions(+), 99 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index abd4a9173de4..4090725160f9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -285,6 +285,8 @@ &mac2 {
 	pinctrl-0 = <&pinctrl_rmii3_default>;
 	use-ncsi;
 	mellanox,multi-host;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-ctrl,no-channel-monitor;
 };
 
 &mac3 {
@@ -293,6 +295,8 @@ &mac3 {
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	use-ncsi;
 	mellanox,multi-host;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-ctrl,no-channel-monitor;
 };
 
 &fmc {
@@ -327,6 +331,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -348,13 +359,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -373,6 +377,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -394,13 +405,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -419,6 +423,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -440,13 +451,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -465,6 +469,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -486,13 +497,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -511,6 +515,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -532,13 +543,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -557,6 +561,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -578,13 +589,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -603,6 +607,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -624,13 +635,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -649,6 +653,13 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@24 {
+		compatible = "nxp,pca9506";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	gpio@21 {
 		compatible = "nxp,pca9506";
 		reg = <0x21>;
@@ -670,13 +681,6 @@ gpio@23 {
 		#gpio-cells = <2>;
 	};
 
-	gpio@24 {
-		compatible = "nxp,pca9506";
-		reg = <0x24>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	power-sensor@40 {
 		compatible = "adi,adm1281", "mps,mp5990";
 		reg = <0x40>;
@@ -687,6 +691,7 @@ power-sensor@40 {
 &i2c8 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@70 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -798,6 +803,7 @@ eeprom@54 {
 &i2c9 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@71 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -993,7 +999,7 @@ power-sensor@13 {
 		reg = <0x13>;
 	};
 
-	gpio@20 {
+	gpio_ext1: pca9555@20 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
 		gpio-controller;
@@ -1012,7 +1018,7 @@ gpio@20 {
 		"","";
 	};
 
-	gpio@21 {
+	gpio_ext2: pca9555@21 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
 		gpio-controller;
@@ -1031,7 +1037,7 @@ gpio@21 {
 		"","";
 	};
 
-	gpio@22 {
+	gpio_ext3: pca9555@22 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
 		gpio-controller;
@@ -1050,7 +1056,7 @@ gpio@22 {
 		"PWRGD_P12V_AUX_0","PWRGD_P12V_AUX_1";
 	};
 
-	gpio@23 {
+	gpio_ext4: pca9555@23 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
 		gpio-controller;
@@ -1070,21 +1076,21 @@ gpio@23 {
 	};
 
 	power-sensor@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
+			compatible = "mps,mp5023";
+			reg = <0x40>;
 	};
 
 	power-sensor@41 {
-			compatible = "ti,ina233";
-			resistor-calibration = /bits/ 16 <0x0a00>;
-			current-lsb= /bits/ 16 <0x0001>;
-			reg = <0x41>;
+		compatible = "ti,ina233";
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
+		reg = <0x41>;
 	};
 
 	power-sensor@44 {
-			compatible = "ti,ina238";
-			shunt-resistor = <1000>;
-			reg = <0x44>;
+		compatible = "ti,ina238";
+		shunt-resistor = <1000>;
+		reg = <0x44>;
 	};
 
 	temperature-sensor@48 {
@@ -1156,33 +1162,32 @@ rtc@6f {
 				compatible = "nuvoton,nct3018y";
 				reg = <0x6f>;
 			};
-
 			gpio@20 {
-				compatible = "nxp,pca9506";
-				reg = <0x20>;
-				gpio-controller;
-				#gpio-cells = <2>;
+					compatible = "nxp,pca9506";
+					reg = <0x20>;
+					gpio-controller;
+					#gpio-cells = <2>;
 			};
 
 			gpio@21 {
-				compatible = "nxp,pca9506";
-				reg = <0x21>;
-				gpio-controller;
-				#gpio-cells = <2>;
+					compatible = "nxp,pca9506";
+					reg = <0x21>;
+					gpio-controller;
+					#gpio-cells = <2>;
 			};
 
 			gpio@22 {
-				compatible = "nxp,pca9506";
-				reg = <0x22>;
-				gpio-controller;
-				#gpio-cells = <2>;
+					compatible = "nxp,pca9506";
+					reg = <0x22>;
+					gpio-controller;
+					#gpio-cells = <2>;
 			};
 
 			gpio@23 {
-				compatible = "nxp,pca9506";
-				reg = <0x23>;
-				gpio-controller;
-				#gpio-cells = <2>;
+					compatible = "nxp,pca9506";
+					reg = <0x23>;
+					gpio-controller;
+					#gpio-cells = <2>;
 			};
 		};
 
@@ -1242,35 +1247,35 @@ adc@37 {
 	power-sensor@40 {
 		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x40>;
-		resistor-calibration = /bits/ 16 <0x0a00>;
+		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
 		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x41>;
-		resistor-calibration = /bits/ 16 <0x0a00>;
+		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
 		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x42>;
-		resistor-calibration = /bits/ 16 <0x0a00>;
+		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
 		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x43>;
-		resistor-calibration = /bits/ 16 <0x0a00>;
+		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
 		compatible = "ti,ina233", "richtek,rtq6056";
 		reg = <0x44>;
-		resistor-calibration = /bits/ 16 <0x0a00>;
+		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
@@ -1323,6 +1328,42 @@ channel@5 {
 				};
 			};
 
+			hwmon0: hwmon@21 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x21>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
@@ -1330,6 +1371,42 @@ gpio@22{
 				#gpio-cells = <2>;
 			};
 
+			hwmon1: hwmon@23 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x23>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon0 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon0 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon0 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			pwm@2f{
 				compatible = "maxim,max31790";
 				#address-cells = <1>;
@@ -1393,6 +1470,42 @@ channel@5 {
 				};
 			};
 
+			hwmon2: hwmon@21 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x21>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon2 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon2 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon2 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon2 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon2 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon2 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			gpio@22{
 				compatible = "ti,tca6424";
 				reg = <0x22>;
@@ -1400,6 +1513,42 @@ gpio@22{
 				#gpio-cells = <2>;
 			};
 
+			hwmon3: hwmon@23 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x23>;
+				#pwm-cells = <2>;
+
+				fan-3 {
+					pwms = <&hwmon3 2 20000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+
+				fan-4 {
+					pwms = <&hwmon3 5 20000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+
+				fan-5 {
+					pwms = <&hwmon3 5 20000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+
+				fan-0 {
+					pwms = <&hwmon3 0 20000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+
+				fan-1 {
+					pwms = <&hwmon3 0 20000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+
+				fan-2 {
+					pwms = <&hwmon3 2 20000>;
+					tach-ch = /bits/ 8 <0x0e>;
+				};
+			};
+
 			pwm@2f{
 				compatible = "maxim,max31790";
 				#address-cells = <1>;
@@ -1493,7 +1642,7 @@ temperature-sensor@1f {
 				reg = <0x1f>;
 			};
 
-			temperature-sensor@3c {
+			emc1403@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
@@ -1514,7 +1663,7 @@ temperature-sensor@1f {
 				reg = <0x1f>;
 			};
 
-			temperature-sensor@3c {
+			emc1403@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
@@ -1535,7 +1684,7 @@ temperature-sensor@1f {
 				reg = <0x1f>;
 			};
 
-			temperature-sensor@3c {
+			emc1403@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
@@ -1556,7 +1705,7 @@ temperature-sensor@1f {
 				reg = <0x1f>;
 			};
 
-			temperature-sensor@3c {
+			emc1403@3c {
 				compatible = "smsc,emc1403";
 				reg = <0x3c>;
 			};
@@ -1569,6 +1718,92 @@ eeprom@50 {
 	};
 };
 
+&i3c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i3c1_default>;
+	i3c-pp-scl-hi-period-ns = <40>;
+	i3c-pp-scl-lo-period-ns = <40>;
+	i3c-od-scl-hi-period-ns = <380>;
+	i3c-od-scl-lo-period-ns = <620>;
+	sda-tx-hold-ns = <10>;
+
+	mctp-controller;
+	hub@0x70 {
+		reg = <0x70 0x3c0 0x00700000>;
+		cp0-ldo-en = "enabled";
+		cp1-ldo-en = "enabled";
+		cp0-ldo-volt = "1.2V";
+		cp1-ldo-volt = "1.2V";
+		tp0145-ldo-en = "enabled";
+		tp2367-ldo-en = "enabled";
+		tp0145-ldo-volt = "1.2V";
+		tp2367-ldo-volt = "1.2V";
+		tp0145-pullup = "2k";
+		tp2367-pullup = "2k";
+
+		target-port@0 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@1 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@2 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@3 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+	};
+};
+
+&i3c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i3c2_default>;
+	i3c-pp-scl-hi-period-ns = <40>;
+	i3c-pp-scl-lo-period-ns = <40>;
+	i3c-od-scl-hi-period-ns = <380>;
+	i3c-od-scl-lo-period-ns = <620>;
+	sda-tx-hold-ns = <10>;
+
+	mctp-controller;
+	hub@0x70 {
+		reg = <0x70 0x3c0 0x00700000>;
+		cp0-ldo-en = "enabled";
+		cp1-ldo-en = "enabled";
+		cp0-ldo-volt = "1.2V";
+		cp1-ldo-volt = "1.2V";
+		tp0145-ldo-en = "enabled";
+		tp2367-ldo-en = "enabled";
+		tp0145-ldo-volt = "1.2V";
+		tp2367-ldo-volt = "1.2V";
+		tp0145-pullup = "2k";
+		tp2367-pullup = "2k";
+
+		target-port@0 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@1 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@2 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@3 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+	};
+};
+
 &adc0 {
 	status = "okay";
 	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
@@ -1579,8 +1814,8 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 
 &adc1 {
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>
-			&pinctrl_adc15_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+	    &pinctrl_adc15_default>;
 };
 
 &ehci0 {
@@ -1595,6 +1830,10 @@ &uhci {
 	status = "okay";
 };
 
+&jtag1 {
+      status = "okay";
+};
+
 &sgpiom0 {
 	status = "okay";
 	ngpios = <128>;
@@ -1701,16 +1940,29 @@ &pinctrl_gpio3_unbiased &pinctrl_gpio4_unbiased
 			"","PRSNT_NIC0_N","","",
 	/*V0-V7*/       "FM_RESBTN_SLOT5_BMC_N","FM_RESBTN_SLOT6_BMC_N",
 			"FM_RESBTN_SLOT7_BMC_N","FM_RESBTN_SLOT8_BMC_N",
-			"","","","",
+			"ALT_SPIDER_INA233_R_N","ALT_SPIDER_TMP75_R_N",
+			"INT_FANBOARD1_IOEXP_N","INT_FANBOARD0_IOEXP_N",
 	/*W0-W7*/       "PRSNT_TPM_BMC_N","PRSNT_OCP_DEBUG_BMC_N","ALT_TEMP_BMC_N","ALT_RTC_BMC_N",
 			"","","","",
-	/*X0-X7*/       "","LT_HSC_SERVER_SLOT6_N","FLT_HSC_SERVER_SLOT7_N","","","",
+	/*X0-X7*/       "","FLT_HSC_SERVER_SLOT6_N","FLT_HSC_SERVER_SLOT7_N","","","",
 			"PWRGD_SLOT5_STBY","PWRGD_SLOT6_STBY",
 	/*Y0-Y7*/       "","","SPI_LOCK_REQ_BMC_N","PWRGD_SLOT7_STBY",
 			"","","EN_NIC2_POWER_BMC_R","",
 	/*Z0-Z7*/       "EN_P5V_USB_CPLD_R","FLT_HSC_SERVER_SLOT5_N",
 			"PWRGD_SLOT8_STBY","","","","","";
 
+	pin_gpio_b0 {
+		gpios = <ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_b2 {
+		gpios = <ASPEED_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
+		input;
+	};
+	pin_gpio_b3 {
+		gpios = <ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
+		input;
+	};
 	pin_gpio_b4 {
 		gpios = <ASPEED_GPIO(B, 4) GPIO_ACTIVE_HIGH>;
 		input;
@@ -1719,6 +1971,14 @@ pin_gpio_b5 {
 		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
 		input;
 	};
+	pin_gpio_e0 {
+		gpios = <ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_e1 {
+		gpios = <ASPEED_GPIO(E, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
 	pin_gpio_f0 {
 		gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_LOW>;
 		input;
@@ -1759,6 +2019,58 @@ pin_gpio_l7 {
 		gpios = <ASPEED_GPIO(L, 7) GPIO_ACTIVE_LOW>;
 		input;
 	};
+	pin_gpio_m3 {
+		gpios = <ASPEED_GPIO(M, 3) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_m4 {
+		gpios = <ASPEED_GPIO(M, 4) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_m5 {
+		gpios = <ASPEED_GPIO(M, 5) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_n0 {
+		gpios = <ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_n1 {
+		gpios = <ASPEED_GPIO(N, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_n2 {
+		gpios = <ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
+		input;
+		};
+	pin_gpio_n3 {
+		gpios = <ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_p1 {
+		gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_q4 {
+		gpios = <ASPEED_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_q5 {
+		gpios = <ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_q6 {
+		gpios = <ASPEED_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_q7 {
+		gpios = <ASPEED_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_r1 {
+		gpios = <ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
 	pin_gpio_s0 {
 		gpios = <ASPEED_GPIO(S, 0) GPIO_ACTIVE_LOW>;
 		input;
@@ -1767,6 +2079,14 @@ pin_gpio_s1 {
 		gpios = <ASPEED_GPIO(S, 1) GPIO_ACTIVE_LOW>;
 		input;
 	};
+	pin_gpio_s5 {
+		gpios = <ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_u5 {
+		gpios = <ASPEED_GPIO(U, 5) GPIO_ACTIVE_LOW>;
+		input;
+	};
 	pin_gpio_v0 {
 		gpios = <ASPEED_GPIO(V, 0) GPIO_ACTIVE_LOW>;
 		input;
@@ -1783,6 +2103,14 @@ pin_gpio_v3 {
 		gpios = <ASPEED_GPIO(V, 3) GPIO_ACTIVE_LOW>;
 		input;
 	};
+	pin_gpio_v6 {
+		gpios = <ASPEED_GPIO(V, 6) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_v7 {
+		gpios = <ASPEED_GPIO(V, 7) GPIO_ACTIVE_LOW>;
+		input;
+	};
 	pin_gpio_w0 {
 		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_LOW>;
 		input;
@@ -1815,6 +2143,34 @@ pin_gpio_w7 {
 		gpios = <ASPEED_GPIO(W, 7) GPIO_ACTIVE_LOW>;
 		input;
 	};
+	pin_gpio_x1 {
+		gpios = <ASPEED_GPIO(X, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_x2 {
+		gpios = <ASPEED_GPIO(X, 2) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_x6 {
+		gpios = <ASPEED_GPIO(X, 6) GPIO_ACTIVE_HIGH>;
+		input;
+	};
+	pin_gpio_x7 {
+		gpios = <ASPEED_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
+		input;
+	};
+	pin_gpio_y3 {
+		gpios = <ASPEED_GPIO(Y, 3) GPIO_ACTIVE_HIGH>;
+		input;
+	};
+	pin_gpio_z1 {
+		gpios = <ASPEED_GPIO(Z, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_z2 {
+		gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
+		input;
+	};
 	pin_gpio_z3 {
 		gpios = <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_LOW>;
 		input;
-- 
2.25.1


