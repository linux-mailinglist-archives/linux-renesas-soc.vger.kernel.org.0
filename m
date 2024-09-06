Return-Path: <linux-renesas-soc+bounces-8757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59A96EA38
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 071C628277E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0A014A609;
	Fri,  6 Sep 2024 06:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="eBSlZztl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011037.outbound.protection.outlook.com [52.101.129.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125814A09C;
	Fri,  6 Sep 2024 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604042; cv=fail; b=bu9/3Zh92bJz5K0TLF7EoTIO1MwGQUlIlMNcjcknr6SxeNl8uUN+l4IWglVyx4JigIvTkvu25MTJAlAeY52zSPuVEr2lXzcZEPuJIS9IUeKQK+d1/62UvvDJTI3r7JVuDU1rgloGSglqbu4rW/ibag0EWzs6g1aq8UIbAO0YGTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604042; c=relaxed/simple;
	bh=8kUwonoYyYB6FHmWPqpT9IgUk9yz6V38DdWLkRxT/ZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1dMWTOmtLHObf4wyYI15bInKgdf94QqFvK/qD45O4HhfvEzMefK6QxXVpQezsjzRMeUX8rbcm8GOw0c/z3UMwhZs5KhI6ON/K1pbg22239viUxYuJoB9Ha0GJmJ+4N3SvRfwG+Lhd/aTq94SjEAl3pqiL1oKAo2v+HC3ZUje8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=eBSlZztl; arc=fail smtp.client-ip=52.101.129.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1yvAZx1LdLLqV94PdSilHmx7KJ/p0rLwU8OfFNp80gw1vtt4Kqn9kW7UccfwrdZA8g7cdX1vjyTwWxMchpyySms6O6T5NsDdLfRmuORemiAFbw4ng9SmVDeSa68/mmChKzjpgac8zUUE4lYnL39YHKIvWmGRIgHez06qYSbIcB1GnfOaDXaDvdvDIkeS/KIfNA4NIK6BLpIAtluwAgnoWXmNR2gLgKmUQPoP8g0ukJ8gBYV2tLVa3r1q64mSibMEt/VmBfVlL4vGotwRU7fYvXlUFg2xu3kLcvwYb4yjYB/AOhCxRE6c1BajaqcvaKuN7l4Zyj3CDfDVcBS97R1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmHAwAuLtww6S7Kx24cCQt5tMxYWDkSMHxAXTvM1SXo=;
 b=tqbkpzLmJ0div8MjzMcwmmselbb7dp0nwMXjMcBC76zHnDaDwBQ851F12LQFvxa9WXs8kctjCP9M4yLzreztb75lsoLwHp669Fk/zK07t2550Gn2qkx76YxCA5zpylRyQc6G8htFvLV9TQ142jUR+9/zL1HPft7mk8K9zT1InN1qRJ9K4xBsLY/QBU5yITaCDRftM4ym+6K3NGoIFV0GKPPEt66D09BbHbORbKCXXllkM2nNDErv1iGVGLo+5rgKrojID4cXSgc8EcucCVHKa8/OHDnrMZhCqawJdDBVdjBTdrQ4EoItDLXc9MMd3OCWSRyzIF0xiKzBo8ERBK/8Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmHAwAuLtww6S7Kx24cCQt5tMxYWDkSMHxAXTvM1SXo=;
 b=eBSlZztliPrLgAORIue/D/+C5OB9fk14E8IclYSmKF0qYVCYUs+XFWzPHBzliRt7S3GETyz4oQqfbSy4AwmaDi10/q/BwpKMRYdIaKnh7DWHVGPC0UDd9cng8faaOiT88ECCWIa8SfCwZIIjAQdktpTYEvu/hhxET0GlPoxcNjNdSIcZlLOzJKOy46gGReSQGpS26wgQEzU1iQUK8FowIMn67KrzN8swIRTYyjFGMK6+TNXg1F0bcarrnk4zKv8JpAPO1OyNc5A4EkEpUVMFOkRY1IABeJo+xi1UyovSxtjB6urHkJHaDbIzwHRgqHKqV1Z6004HkHp6csHYMfxQxg==
Received: from PU1PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::17) by KL1PR04MB6645.apcprd04.prod.outlook.com
 (2603:1096:820:da::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:27:17 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::55) by PU1PR01CA0005.outlook.office365.com
 (2603:1096:803:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:16
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
Subject: [PATCH v15 03/32] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Fri,  6 Sep 2024 14:26:29 +0800
Message-Id: <20240906062701.37088-4-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR04MB6645:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9c1bafa7-7d55-4ae0-ea74-08dcce3cf3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OZxXKkh1X3J1cmNjtSUY5H7qiYnJ0ENnuC0vJSt/KiMc+Ghnw5sltsP9tmqh?=
 =?us-ascii?Q?m6eM9Cl6kYCqEZWvc/myG+k2uJaG3DlDEOqObg/7PSPvOjfhgY39eBACd1Xk?=
 =?us-ascii?Q?A61tpaM8BmE1N1LCi5x65c2rg/ujvInMX7BdlTegdKWS3itQTbD3Fv3EnVrI?=
 =?us-ascii?Q?8kPjNGI/DKcS0CJk1ZJ4F2vj9yC2wn16+CiA3iGyRXlvlpQbUzmfS/6btbO1?=
 =?us-ascii?Q?nWbOvREH5tCfnvFbdo2uI+mLFcr1ijvwmscJ9CzXC+huHldGYRA6epWlaee4?=
 =?us-ascii?Q?3dGfXAIesKCX9ZFGbi4NhqWcI3VndTit5pUPFE5TFew+iofc+1vV9brP0b0W?=
 =?us-ascii?Q?ynRQz+yjd6HI8sySxe9SZHT9bCvfFmU68EwEmRvJvTbgh5WGT2c1t+KH4Qlw?=
 =?us-ascii?Q?QC6QnVjP1kuZPxmWKWRH5WMI7YpJuulQNj3LALUdtr/SY9jgw8xqsAP4EQIi?=
 =?us-ascii?Q?3woxdIghdI5fephANwiSU9QE9Ngdqf0G6HnaTxEMz9fG6GBn6yhYJ8+7G8fB?=
 =?us-ascii?Q?lcrixGiACHGSfOSeANOc/a63EwnglwwKKFzve5g954f2MvT+OpgHBBHWsQBo?=
 =?us-ascii?Q?WvqqqBgZD1/RNLi3sgEHKq4vsi163k3j99UgZxXphx24mnvMPOFKY45JTwd0?=
 =?us-ascii?Q?gwqH/SmCmlar8p622s8/9wkG+1BmIZfJim34TOJ3DliCWG2PARbr2JVGk2/w?=
 =?us-ascii?Q?wOB0vd4gSX95kqJ19sxWC8aPunGK3/e5vTKVR69p1UxJl1sleXP/p6Rk4G8e?=
 =?us-ascii?Q?2+141o0QhlWMc7yg5zsGSU98mzMGV/321IDx8CHmCYA0ZMSz+zw5nP1cDxm5?=
 =?us-ascii?Q?HmJtSom4PUoiT2AFlCj2bdR2xvL8M1pA8rHT7Zj2g0G7H5mBAaOBcRslW+dg?=
 =?us-ascii?Q?TNq8b/Yu8gNgHtBGugFpVOgczbk9B2o4rl74EZePnkr0ZDF+jLnYwQ5gjCVp?=
 =?us-ascii?Q?Cyx4kdKdE8F7i76CKYSdzdtlqjIbM1BcV31XfQ+9nSRXAHI6W14oSFYVR9+4?=
 =?us-ascii?Q?JZzbTC3M03CwarfJ0dWUHCOoe8bgDpff6GT3opMj+6qenRxQcSE8lQncztpj?=
 =?us-ascii?Q?U0XIrKLGzxYw72fkYifadkovH/PL+1HXvEhscR6wCMBt0+ju3xlno2ZjRuGo?=
 =?us-ascii?Q?xyow51OoqNduHU1UpjIWGa12Z6Ir02COgaLN4U8Kuseq6EZ8sAcQ32NVi2pE?=
 =?us-ascii?Q?UzihaLIurQ38JH2tOWfkRQasR2mATQRdPOEBlxu2HTDBTeAVcPpj39YtYhpp?=
 =?us-ascii?Q?2rAy6tl/uNgNd40wjOQ6dgwfEhevryHn8I1ALkfZpzzx+iMOEBf2nleW+4VZ?=
 =?us-ascii?Q?e6EA5Pmu/s15jDM+TGlahfA+fjpIlueU/F+2cKuJ4Q25jt6+YXQU07QthQYC?=
 =?us-ascii?Q?+5NjQa5Y6IdT9lBIir2Jd3xXTA8LLneXmKxZlS+PNgtedLTXaYzr6D4LKcoD?=
 =?us-ascii?Q?4pvm4IqnZcGNIUrwTi4XD2Jw/urwBRRK?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:16.2563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1bafa7-7d55-4ae0-ea74-08dcce3cf3f1
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6645

enable spi-gpio setting for spi flash

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0d659ee2bc19..575abdd530df 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -53,6 +53,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1


