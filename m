Return-Path: <linux-renesas-soc+bounces-8764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9255796EA6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA53286A9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C957156C4B;
	Fri,  6 Sep 2024 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="PE32EeLX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2055.outbound.protection.outlook.com [40.107.117.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033DD14A4DE;
	Fri,  6 Sep 2024 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604075; cv=fail; b=Th2AS1KA1ZW71teRZ2JHMRYSg0fCwjaE8Pndz+OfdPadi5r0KqdJ9gHjYjH0e8SmtbCiRgxhmc+onSwMOWdfbTWH2Mew0wjgT4zcKLhmOH3ZKFMslb415o3i3CMjuxyA4/0rtZMC+j6l0jYtGsHUA3ArQa74Q9+CrosdFuUkKwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604075; c=relaxed/simple;
	bh=WC/dcjR1tUqtqDip0Xs2AM5RqTGhPS8rf/xSzw8zvQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIja8IBhAUklNG4K0YHzl2l1AIObiA6hf073m5KteDhrfiHchYEuUOH9QOf6bvnE+a29MWXvuyEG4ONndrNFEzmulWyiFvE655qN563nJaw5QeCFCk0p1FUi75H8oyUkS34w6iCrib1dKO5zSL3NO/JiL60hn/qfElu9Bs/oW5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=PE32EeLX; arc=fail smtp.client-ip=40.107.117.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poRyYiiY1U4/ePhQgbW834xNrT6mlCVyyFnVjzGZWwJTii9X4vUmxxqnBx/zUfMuajJiI9KCU/SAemfz/58NlqsKPmNGoPoe1YUdqnajNKNct3cjJBR5kkpSqUf/Pof9Ny4f29f4tSzDxZYeTicYuRvjH4BxZTt8OzA8MUStHxTlZaUpvL5k8B0g4WuTJ40NUm6xeMrHSSmMApwlMon6i79YIYbKDyI6vEJbf1fHVx3pn3Wr2jozgZ3+TCWf/cJIs2560quJMNlz1nOwkrGR2+K41NjRqfRFiTVjXuo55mDJkrHuraLRuo2H3JNoEUOoA7hyxO18vaXUNTqsob/q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=k/iGT1rPh2YWxW8S3NnH1fWxKB8zmDnn7gFoogMANmGOP9fPdPisTEsLIuLY3v4g3I8HUwkfLKpAW3AsUiDlWhtqQudMRH03qjUrleIMemBw9SXr3d2rPTWNfKjP7LcL7xdKK39aZAVGJCg6DNNirjuQvovG687ORvyI4nCM0hGXNAwKhIc3fKcrWn17RhStbLFCtvq99rAN2a0RnSpI75l4o3Lhnmf4+U6DdASBSrWJJWGKZJl7OVhBcmxH8zXD5wdtWDiCxGjyfM7L/dZMz7Xm2jT7wj4R4xKIRPYVMxh/iVEyQrFDBfEn913Fa/vtIRNNZZs985RwwMmQJusQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKZ5ogJ9/YHI36u51f7OMva5yJpzuLKM9pz7+UUgD64=;
 b=PE32EeLXZMehtjXdUkLOWbQRc9Z2pDjYW45BEp0iClCgt1xySTjyZYI6SEvRSMnd5q80DbBbTyK/NMOWsal5bgmMbXa0iIQ5ZBPVDbW+17As8sbxhI4T+Bqd+F02yVH3L4a/QQYs4q5hTwiVtSdp7M31PZqJv/onwz8nUj1UbUNIAbVWtd1yipPXlfSZ9L7CoSMQWVJI0nnSdSSIs6QBK+jxTQLOpF2En2yYh8SrNfKjH3XPmYcQB4OEtEaNGBvMXUZRTP4APdWr1VF3y8do0aVSO+xLBOr5ra7gIoTpBsuRVanv57qfstcfPX3Xj/rBAt1PQMynhPr8PTT/fFROJg==
Received: from PU1PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::28) by SEYPR04MB6726.apcprd04.prod.outlook.com
 (2603:1096:101:df::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:47 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::9e) by PU1PR01CA0016.outlook.office365.com
 (2603:1096:803:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:46
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
Subject: [PATCH v15 10/32] ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
Date: Fri,  6 Sep 2024 14:26:36 +0800
Message-Id: <20240906062701.37088-11-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB6726:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37d996f6-f9b9-4f36-d4fa-08dcce3d061f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dMQ4U9KbGkUcNb31PPOzaRWn253SrXF+o6KC/rW4OB80Y/O0ui7YG9n77aGw?=
 =?us-ascii?Q?zpS1JRo33EXhUJFhzhxpx6nrR3F/3TbSWpIq/b/lXG586zdgy64SHj1jZqmQ?=
 =?us-ascii?Q?k/InWIKwGstRNj/uOtXBNfjBORotwcJtybrC8RsP/PgrWRnU8aDrmAk5eEde?=
 =?us-ascii?Q?6YYt2jOEIQsy93D0p/egzSpTB71rcpeqPD0HF+nHD+Pqp01tYog9rjwourgr?=
 =?us-ascii?Q?totMmxfa/T5xIb5SDHjmuDnsjfqqrWumprybbzCURcdHgU5dSriSbSV+uOc2?=
 =?us-ascii?Q?Gh3zU/3AV8Zel6p2JYHaV1P1Amfjzl8+pETGtwl8T3q8yUz2mal9wJp/1hRC?=
 =?us-ascii?Q?61OdrfkmqGmM7ukq3iQ1WQh6ExkS7622cKbYMadDMY1M7TR8bejjakCzGpyF?=
 =?us-ascii?Q?Ilx7W0TeyzTLDroAtWuEl0I/xl2AKwvwmlIRF+lmMnsg4PA8avKFVGHhcGI8?=
 =?us-ascii?Q?um8tgA1dzDTlsBtgLmKAFIj+kMz2RuLGMHNKGlYq347eg1efpM28RxbWZVdU?=
 =?us-ascii?Q?LUwWlM+cpzYaEGbsdlNMdAp8SvPys2rM3IfoF+aYF73HKllBVbOpVe5SrU8p?=
 =?us-ascii?Q?Vm/yzj7m9EldwmGAcNcZFysryP6CfBVhYbB90Xjc0Hp0UAmrsHRpBRwLc7qP?=
 =?us-ascii?Q?85O60S3M96OpHMsT4EwQedy5r/WchrgMZo7+C1h6YzYobEBTdDDMfenuRrcc?=
 =?us-ascii?Q?kUU7DDRzT2YrKJ++Qd0GbeSIHJKrvex3ig6SuwREGVrWL1FyW+fZYeL+2b5S?=
 =?us-ascii?Q?LTm3GG4sMMKThthyuzL+kCQE5/p8INhu0VKypDFb3MztVpqE4IbHkVFzTqm4?=
 =?us-ascii?Q?KwkZkfDNZQF7ohserFKuCkDd5wOhpb+tJchOIIerlE19eJcmz6bevbYhKnt/?=
 =?us-ascii?Q?cMCJTmXlW03LshMu4q1bAx8qUcHGD73JpiGSmMnD/mpi6emfWw/AZn+8UVJw?=
 =?us-ascii?Q?ivreYdTXEhs/v5XODzPDaqytPmHRJ6753W1OummDyNglq6oLKYLa6J6taHDK?=
 =?us-ascii?Q?pio1WnEyFw+foFmjMeA4j8pXc8NfKLS/JNWYDxptGaAsM95DF+czYyrvR8SA?=
 =?us-ascii?Q?qs4UvNKNI1gbQGBUWcEjR1LjA24sH3u+daZ1cI9rqxs3CNw+5us6wPApFF+v?=
 =?us-ascii?Q?er8+KeM0rR3n6JzIarfNuZ+e4c/u7fKN2eMsPv9wIHTtey04ZEm1yRvIxvLM?=
 =?us-ascii?Q?/8LWhG1EHh5nXtwjGDCkdNV9M0F8A71oVD8Bad++bOyFF5zPuwBL26oJRIyd?=
 =?us-ascii?Q?p6t0lP8keN+8l3qIk6TJ71pVzIJ52DkJ7FB9EINaDeuvo+XYrqti4oojDYUa?=
 =?us-ascii?Q?zeWmsZ8Y6XZzzPaVCHoRRWbX0T3I/oaw+/1f2CS1y5n0air1DuKk98bx32Xu?=
 =?us-ascii?Q?xxNpSXKHzw6LQGwnDtXCGTbEkBfrZ3Ic1COT3e1tZpeisEgciRBZ5WgJIew4?=
 =?us-ascii?Q?2w1TGFNhUvV8Q9DS3C222tVagBEfD/E7?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:46.8187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d996f6-f9b9-4f36-d4fa-08dcce3d061f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6726

Add power sensor for power module reading

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 09bbbcb192f5..139a09de24cf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -906,6 +906,11 @@ gpio@23 {
 		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
 	};
 
+	power-sensor@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
@@ -930,6 +935,26 @@ eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.25.1


