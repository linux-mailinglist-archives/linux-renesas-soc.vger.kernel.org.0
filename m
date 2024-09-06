Return-Path: <linux-renesas-soc+bounces-8777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2496EA99
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38FA284EAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3323015D5C4;
	Fri,  6 Sep 2024 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="p6l082NR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2050.outbound.protection.outlook.com [40.107.117.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670114E2DA;
	Fri,  6 Sep 2024 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604126; cv=fail; b=JJ1AArFBeYeRha6cf0q7tM97Et9ZJ0elRYEOUs18rgJ/k2gZgF0zhXCUHs9nckSpk322llQ9V9+e/W3WJLVoBKQ8NIyYEOGlE/c2wppdwehpxnZVCD+vmK4V/9LyfxSixbxGWwmaarU1gLWzhffr0DPRXwN4UrINdM4ixt0GU/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604126; c=relaxed/simple;
	bh=bJyTPwQ6HLIm9WpJFkRqKJv3EdjekWxcOSacyOXtKik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4nsVF9eUXY9WiUJUNL7gEEkh5d0NsCqUXg/STb3pFHC14V//aMQzjPUgN7MhJxBJomrvlKSP8DtUEKlZDm0uGiUtzzeWpVgDEClkbzf6/3oaElYZDzpFoMCnjhiNsMRw4HCGMS4+/9CcDRYcop7kSytrfbwJXljONJrzhA7tZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=p6l082NR; arc=fail smtp.client-ip=40.107.117.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWoMpZ+wEsrpBcQ3zYj/Vbl12yMvGJhV2epffm/MpCoGbVlQH96EV9MSL9bKb4wdrS6JW8d92C4hZmjM6RyQwM9E4WjkOzczw02IGifm1A48slDl72LJ/zLkTQDUf6Jo2WETxyLP+VgvjRPAJwk4dm1HT/Q15ovvlyvuP50SabVlyRdsyGRJ8+KtijoZHNETNcTDvK11ZP/W0sRVMTnO732x31bMZZ1j+axR/CpqCuK4GLajTLtfypeOw5zEj3y1opbfNxbDyYM2ccdytULcai7G/f7AJpI5QjE0LxBezk+hLcN/4cxgGXnai6UnlaOSu121EMnQ2cV9+M7eduoBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQFQ2bKjxnUV6R0l0iLzwvLwa8mKW3x6TIVY3QTprt8=;
 b=UIffsHucGi60lBimN2Y2YhFkkK8+86LX+R917IAkdgQC3CNfu++rrGfxVZJZCrKS5vU3ggWFp3NAMKpbMnD6XmCTbYlO8SEAOYgPbnqBJKITY700fBNA4D7RUGUv+cy9gZJqXtqkoZg7MQJsuxYO3CDXn8sD/PKHULPwRHn+4XQzFr6sp3jCzMdvdtiy+Bm3dgwkpOzPPgvGdhG45OxkZLiGf4KeuH6EUAQcpBkBsLXCxXN+ncttIKnp6a/wk8jz3A/RGElXkI1Le50Ihj5uQnpPeOFYziAkNPw2831ewF+U9TTvk+qHc4yEvrY+Ipf9X98yMbHEDOGDf9AREMC87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQFQ2bKjxnUV6R0l0iLzwvLwa8mKW3x6TIVY3QTprt8=;
 b=p6l082NRI3uv+gJW67CvV5Bhyre7QTpHLm1OGIsbVk9X9Ug0rdD/P5hJy+bvdyHTuBZwWifOrqlVLaWyncR7IgeC7WpCjJHsyXvxP6Tpz4mx0IkqtH9nHDKvhHgz/diargyfPqNYdAQSApxzzyAxlyRCKF1+p8TwH2kMQmKputeUJ451ncpJ7wl9yaIVrjJ/2R/Hnbro5oLOMsRtCJcGgzxc/T2ORiopV6vRBwfnlKSICByrV9C3xBT6oryv/HmSRuRi9jsN9KOWrqjK4nNh8ATflwoXr5UCWhyacaEE5q+xM+0Uxmr+Cli9DldVkOYguGzBmcsq0Hh7BBlp2ZpB+Q==
Received: from PU1PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::14) by OS8PR04MB8356.apcprd04.prod.outlook.com
 (2603:1096:604:2b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:28:38 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::9) by PU1PR01CA0002.outlook.office365.com
 (2603:1096:803:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:37
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
Subject: [PATCH v15 22/32] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
Date: Fri,  6 Sep 2024 14:26:48 +0800
Message-Id: <20240906062701.37088-23-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|OS8PR04MB8356:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6367426b-d031-45a1-6958-08dcce3d2464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tsaa6ScN06bqjF7XUUMbFf/ikulw+WVqy7o/eQVbDlvZI1g40M3MkFyUCbDK?=
 =?us-ascii?Q?qetvWGPHKGSlEcHaX+TL7ni1HQBE+T3cTrLp8sh5psSILcdkX7FJNQlOPPe3?=
 =?us-ascii?Q?ybgA8D/tszLMj8lTGyyQAMTEwvmb0fq245knLoAoLWZ7gURuCAxwV/WFBhzy?=
 =?us-ascii?Q?JEy+QyZozmBzQye82qXkXj8JFOvE1dUI0t+C3DOmchOToxOGqd27hfMjK0gZ?=
 =?us-ascii?Q?hIWttNgmNrnV9cMIC2n74OtGBpOCO+ridNMu1VJcpfi0vYluwQSduSQiht2B?=
 =?us-ascii?Q?OfkZ3R3oyzMOtsPDnIj3tweEeK9Iby38LwXFUxyRWv+oyeurA+g/qqvIW6dG?=
 =?us-ascii?Q?pmVwL+xBre8Av2jyhFxUe6h3v+4bzXUOWI8b4k4xRKih3UJgHent0wg4aLXn?=
 =?us-ascii?Q?UnitpZKY8srzKqHQ7FCAOtxzwqGPmMQ9faiXGadIUVsFrVbB5dfbHWNRFkmR?=
 =?us-ascii?Q?gh1mC45ULusschbn7W2nJ/HElqG74BcubRY5YWIZ+NbnzrjOla8GGw2k2bQa?=
 =?us-ascii?Q?MGdm9KRJeso2fDpR47DwYiE3PY/03baS0v/Kuea7FO8xIGSmYdqhcm0f3cS4?=
 =?us-ascii?Q?qhVTzAHHa+PGWCXZGMOxdQzmrY54JbviqlNETNVLtMJfVzBjqNMQz6hludGS?=
 =?us-ascii?Q?H4wArtA79PMva1bKNsVeaikWtiuDFFR2y2ZlFOkUP4g6+hgNqchOj3ekKZg+?=
 =?us-ascii?Q?s9S7rN6sCsuSpE002+t3Z34oTcJkBXpFmIEiaY1F7/nrHNMDZmVUXSj9mUvx?=
 =?us-ascii?Q?YqrH6ZDq9uRkovSpZek3Svo46CUz2k1dSCC7jpdZH6E9FAzCWqbXaRFTj40h?=
 =?us-ascii?Q?hEjddB6qNZC9Gv1gKy5+SqIrDuHIBSopI5BCMsbsprLXNvAfZ1cN2dc0NuIu?=
 =?us-ascii?Q?yQRKdpwUrL71RT3s7aXos04jq6X+k/RL8NcOQvLOjf7UvyjFegRKVu3Qfadz?=
 =?us-ascii?Q?Fo9E/DdjYG/XBWwXenimgoneD+QRiJX9KBUAYTB2KsNhy5skaL4paqyKyDX8?=
 =?us-ascii?Q?DWOTv2TEGJ1L8+eemv1Eac3uPkoBj+TFh6fb5CMnE5MEKGGK/hNM2XPqFhz8?=
 =?us-ascii?Q?eN2SCgOZNN59vkE3JmnIiQ49hR5nUDxhBmwpD1wbcdH7nIwOMOAYfviTAaum?=
 =?us-ascii?Q?gdqKoYSRrW+S47xKKLLP6K4e2mECYE0FsFqCah+3f1S+yC+5KjsEvl2VhInE?=
 =?us-ascii?Q?c//G9ujUL+p2Q7okLgH5phd9KatJ8t2qXMJBJkxtVDHW9/5bM/UYT2Dzm1D2?=
 =?us-ascii?Q?/PGFTgCsRIBZHSiD7i8rhcXkYPMUgglK6sCPNehHKvO0+VyjHHsCEcDKFJZz?=
 =?us-ascii?Q?4BZaf9PTrUhfej+YWpBQQiweKrcYIVF9QIKmon/BGNof+oHiUJDiuVUyaWPa?=
 =?us-ascii?Q?I+wwGWhKn7UxMp76/1v0jtskCRt8+5Uf1HQhZamWmEs2LTvY0SiWib2l22vE?=
 =?us-ascii?Q?3LeO3Pa44eADzWSPK7Lt+Tuh6MUZGVRQ?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:37.5842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6367426b-d031-45a1-6958-08dcce3d2464
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR04MB8356

Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c2994651e747..c940d23c8a4b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -761,6 +761,7 @@ eeprom@54 {
 &i2c10 {
 	status = "okay";
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 	i2c-mux@74 {
 		compatible = "nxp,pca9544";
 		i2c-mux-idle-disconnect;
@@ -1314,6 +1315,7 @@ &i2c15 {
 	mctp-controller;
 	multi-master;
 	bus-frequency = <400000>;
+	i2c-clk-high-min-percent = <40>;
 
 	mctp@10 {
 		compatible = "mctp-i2c-controller";
-- 
2.25.1


