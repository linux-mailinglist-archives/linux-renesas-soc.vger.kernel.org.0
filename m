Return-Path: <linux-renesas-soc+bounces-8762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FD96EA5E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42BE02877C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2896D155336;
	Fri,  6 Sep 2024 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="CvXPgkHf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2040.outbound.protection.outlook.com [40.107.215.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306E13DB9F;
	Fri,  6 Sep 2024 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604068; cv=fail; b=IVdHqiaWF6IJAzkKiHTpd0p15pCPQVveW7hdcpKHBfAjm0p0o6XU8GNbChTDlLoAiIfw4sMdcN9s92mGTg55iv2GS35h6XX+Wpa837GsL73AeYx2/QyqhhD00qx0VogXOZb8iTnghrf9TZkWMXC43IaYiH9A+F1yoSsTctTqjsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604068; c=relaxed/simple;
	bh=NPl1LaIuLqsInjrJcLDVPdw8RVKGkEQ+SanwCXdYN2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7dH0b+fxW4rAYkRSIh/eGeHxqzSlGfcaS+Szy54nBtsrz6zXRt2GTA/gXCfSoDRg5WKUaAVIF5rww0pllv5c/EiY14b4AKcJdtnthrETOalhDcJ88ITKVre0JYP9xCp5w5723fVmYH7bejMZdH6O04ea0lfZkNVFIAkuNUWmW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=CvXPgkHf; arc=fail smtp.client-ip=40.107.215.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI2+VJLugWbFRTa90b9GSzDAWrKDJvnsQX3aWnxbloojV4l2DwLrWKyTKpDPukGKsWjXlfIFaojtg++MTpSG1OPeBCH+1oa+UR/p/4VI5FTR8Mt6hBOCAkIz165BkyWCifIlUEUWeCQoJnP0YYEqkTAgT0Q7TnVIam5N25dIqiigu49RSDXBwEzpt5LAXDq4QZkL6Ne64XTV1tHeXrtRFbSMzCRsGS2t7dK7es/sjtdceOlZnUuQxy6+lj7RNSPQqqHawEhp0Wet6uZvVh8CvwNByQCikCDaLGRRmPpngsFxmFwmVO4A45iJewWd1VEqWemKHaoyJ8deT/1xLMdPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwPnCRRMIs7FMuQZx/G2KDCYulqMsDb1BS3wTt124H4=;
 b=t/xJFS99BnozU9iDSE4iJO7lEcXvyVMTWaNntwU9pvH0E8UicDT09Ol5+w5mGzcMT+RcIhnRK5oaL7sr20uXyEWty8eC1jEql4ijFQKE9KjfgqasNkiK/K+CSngK+w+lYmKpq+/lgPGDWx2UfLTuvfSexvxsq27Z0ms1Qqgds0ArPve1YGXrQA2wfF8tFx13CqRKTFpFhW0R8F/tI78Vq2cJI9XTbD6N31RoyruNNMf3cSyPwxlp0DJyQTIN5hpw0Ec3mxIoK+IfKOYkEN9m0F4c68nOJ7eWQED//xj5H9Q4rGWzpI1SEj5pFT8OXM0L4gZE3+6lp+168jK7avhBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwPnCRRMIs7FMuQZx/G2KDCYulqMsDb1BS3wTt124H4=;
 b=CvXPgkHf5kMuqmS3P8DIz5lkGBmthzkROm6ROgLTE7cx0UB57Fj2PX2mWUutqXLuHm5VI4aHpPciFv+TNvt/EiXXdx0p5SRlxdQeqVqtsPOdXGzDrGhYdcsdOGKTrl+RwG+9PyGWSVfLRx23Nunwy6GLu5cvLS3i2jGSIFZeV2fymD015Txr7/9rrm6Gb75YPlamNxvzf2Mp/kAcF9XqBNvtJFsQUBKfHzsa5QfXousvQ7nlVQDoC9bJ/kF8WzccSigXrOrGfzGXjFy9WNqCeONF/8dPZHX1Dm3uS8Bjo+ojCucog12ytwGPs7r0LI9Kbsevt7kIo/SzeDfknkCCvA==
Received: from PU1PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::18) by PUZPR04MB6583.apcprd04.prod.outlook.com
 (2603:1096:301:f1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:27:39 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::a1) by PU1PR01CA0006.outlook.office365.com
 (2603:1096:803:15::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:38
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
Subject: [PATCH v15 08/32] ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
Date: Fri,  6 Sep 2024 14:26:34 +0800
Message-Id: <20240906062701.37088-9-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|PUZPR04MB6583:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8652ac88-b840-45e1-841d-08dcce3d015d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C6tDq8JgZT0sumtup0AnR53sDUGRzE/QJ/DpcxYJGQpi16C1H9io6NE0II7s?=
 =?us-ascii?Q?A03+N9wHz0nESV2HfE8CongUWYtYgGO08uw92bHwjMydurFRE2QBq8ASkzLP?=
 =?us-ascii?Q?wDeou76X+7KIQbx6lsjs2M0KHW32I3Hz+zRUwMxR8oHlyeVLrQUeNNJQTEvp?=
 =?us-ascii?Q?oov6eqxR7iQQKbOWuefCS0oEuY14Qf4O1cY+8/ScHiQN8Jde9kWSS8EvNAz/?=
 =?us-ascii?Q?bVNzPrqbb1gbvDsBSdN5HCgPXCG1d38OeHT74goL3qKt0s/7Y84aeWNPCr2d?=
 =?us-ascii?Q?It5XRhBBGT1WYRSCM7/nnsSdkO1PMCTiUbkgvX2MXM6XgVYOm/1fj8tLau6n?=
 =?us-ascii?Q?Eq5xKYj4/Syre3+05CGeZVpaCpmMxMfrzV0/sAj5rdb78/7d6TuyLO1cVFhe?=
 =?us-ascii?Q?r3QejGClPrkXV8pXRVFRSXKVIxEW6NWRh5TKGuaCGIiXoWIbyb+UTJiW9gWN?=
 =?us-ascii?Q?J1CGONNkf336XEegzu7cvZyBhZIE31Pb+BP8h4j0Ovu4VyO1yMWOsZAd7qYX?=
 =?us-ascii?Q?dEBu6m9yAnrICq3Jlw8uGI8MKcUU96i0/gCSa/16vKl8rNv3QcqwO5z6NQDz?=
 =?us-ascii?Q?86Pf94JEFkctAkv+TcYpqvhXFOzjS0u9n/TTdHm6nySY/y60CujUjkZocg9F?=
 =?us-ascii?Q?5Y+TNP7BiDtRPPrXPjkFXCJPemOaCNLjJhoe/ZspchmWTFp3bOY96iwUKszW?=
 =?us-ascii?Q?//55+FrG2k8wDHcgbyOup7ya7MFt3fLiiN7zPKfCVjS+39zH3H9lYKKRy0li?=
 =?us-ascii?Q?9KwmaerP9XcZA5Gk4bi3DDEGj5lznTaZM5Yjw338FOOqLBcwPT+PEhfLGSD3?=
 =?us-ascii?Q?pKZjR9gpYY7UcdBuWZ3IZGnot8sXn/8+JP7K74sjWBNhV3Qg536cWHwYqljK?=
 =?us-ascii?Q?cJHeSyYe0lCo9cmftqwvyZHHnQFpaZcnVjTiSGS6C/P9whdu9nZ9lOLeWTsF?=
 =?us-ascii?Q?z4AxAGuhnDiURWbYEMcFBGoyrZjOaW7bWwTopyI7MDWLCOeW0/hVLLV6WYgb?=
 =?us-ascii?Q?GyijHh4p+zK+iMm6RaWuijd+2ZmRRrwP9GaNmfLmVOBNG9xHvXDvGRfuN3V5?=
 =?us-ascii?Q?p6ki5H0EuXWS9yF+iWRPfOhVNmlMq9T3aKlcHAgDo5KjEMT4ZTCePURlDEby?=
 =?us-ascii?Q?0+irpC/KvEGgB8oYHlsg+pZXAj04K5pIjYtn2i7P+dHD7y5+gUuWOvetkJ6H?=
 =?us-ascii?Q?BVKkvfSOnOQjtmy0sttcPSX0Hxl+KJMvU+zbl94KpGEHSzSRsmyYDBTaq2Hq?=
 =?us-ascii?Q?wCEo65lmuM2CTHNisPElIoyGiE76xqzZO78OSxi9TTI8LNote9IYB1sdx8j4?=
 =?us-ascii?Q?aRnLmECo/66SatMY/UZOgz4Ixxm+5HgoTAQ9NMQ+Siefnv7jP4DwKDLjvkRy?=
 =?us-ascii?Q?k6pPnUFMyGGFv/nSkPrNaSp72B98n6WKU4jIfewHZUT7YyEEyn7iZgv6ZvZf?=
 =?us-ascii?Q?OWyZiZyjNo0mDbiB4xZIV0sumaJ3fnDe?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:38.8188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8652ac88-b840-45e1-841d-08dcce3d015d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6583

Remove space for adm1272 compatible

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index f4d27f1ffdb8..b11951c2f71e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -821,12 +821,12 @@ imux29: i2c@1 {
 &i2c11 {
 	status = "okay";
 	power-sensor@10 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x10>;
 	};
 
 	power-sensor@12 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
-- 
2.25.1


