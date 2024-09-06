Return-Path: <linux-renesas-soc+bounces-8786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8909996EAB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A57E01C20B2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CD115532A;
	Fri,  6 Sep 2024 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="Vzn5RriG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010025.outbound.protection.outlook.com [52.101.128.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24F31684A2;
	Fri,  6 Sep 2024 06:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604165; cv=fail; b=iK+wpA2+LRiYtDh0+H6YA921B9MputOnCapJZChjoW7mDibJlB2Aqc+gO/Z8fLE/Q4bnna/p8cJzAQJXtHWJI3hZrUD39hVNvK4Nb/ybiXvKFjEBnHGr/4Grlx+jv7EawtZ/zh/O5JgrI57A2biwtLCZLgonkVXV4IoZlFVPgb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604165; c=relaxed/simple;
	bh=Vj5r86kZZjWqZAoGVax+5aI2ZyamKvx5GqKmfCR5sq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTWpOJxxhwuYOdwo19iRSq6ySDK4Bm2N471pFmxe2o1czuQGwv11bpZYHylpfjlA33C4T8aSEJ51muugfKNLPuM0XOYVWJY28ErR8UvKiVbXOsk653S299QF1vVx+4JS7JZRIm3OrR7tEewC2aDuZQeBGQWy3/aPG1M8REzwVhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=Vzn5RriG; arc=fail smtp.client-ip=52.101.128.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB2Bx9H/25ohE/6l9si9kqsLTnhxjY38KFfp0Xl3BctlY56dVXviMn5rnCnxvzNjo2IEdb4hqlb1j+ghAtYQYPPSmBHVKYUQxyrJ3InDo4CeF0lcDZEN7SwMya8jIBfbcJ6cvRdCWXBGdm3VprRTERD5/0Z3wKqexQC30NHiRYCpKOvH3A8ODxXBSmbNEkn6kzMWiGN/9fwF95BRKeBSCdva8HCCLh6kLpwxbqqUNR7FqyhhpnUoBXMtT15fy7KK0IRl9RvdDqCXcYQRavzXOAf9SIKlu0JpwUPOmV90RGhdcbPGmmnX/Y79P9H86o+5YYyuEU/Dg/6Yzjj86f4nyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JER/NX2UhjnDDNBj5f33z0uFCbRT9/QvpzhQON2sExY=;
 b=OWeSvW26dPwk9jubuLMh28z+Q735hK8+YKP7UCYBDE1krRp2gmvzB7ITlyrLL+kZpylaI2LyMj/AmJgSzWZXXHRC0ia8k2qolehEQ1fXsU4Fq0L5w48R8JYjs3Oc5LboyblNy+07f+PMlwXoh0zsG+qDqRSY/2VIiB1mkJq/pd0EybZspAleYqs8NiOBxy9qJQCsfQxHys1rLzRdhA0yJ53L1dH6yjHsCRErGZGvrt84vhOdxjC0xoH2NYojA/+WAFwF5o/NGo82Vpb7sIIjucUfrE9dIfalNRx/yF0Vv64FdXir7W807TCe7qbqTnFIABHW3jgjaHTw18u9aFoTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JER/NX2UhjnDDNBj5f33z0uFCbRT9/QvpzhQON2sExY=;
 b=Vzn5RriGukviiVkw7tEvXviFPmw+LmUQ6kdiCsHEiwjXi2DsgUtjR7EIrjxqcVfsz/MHIoTl4GYoo6PK+X8ZQnOZ8M1FiDO9THMZzaLBV89ypfbBMOXtt6HfFVn3kNJ3Hp35Vo/rnMjWmSOfb4aPJXbU7GgNPqtDd6Ubzxe4lnb3e2JIWPMWX6FkuSZRh1ks85ddmg+AyaPU8aYfUAZFhD2LVTo5/w35/dFaskn6b6xM2myDvonTvA3hUSZk1S1irzfcSqu0xDro5bRrhE+C5LPMX40/iC35gYQklVyvrBvYYqYWxbnqQOrMniHi+8UFJ7k5e0i2f/BYl6saQVKKjw==
Received: from PU1PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::14) by TYSPR04MB7640.apcprd04.prod.outlook.com
 (2603:1096:405:39::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:29:16 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::9e) by PU1PR01CA0002.outlook.office365.com
 (2603:1096:803:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:29:15
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
Subject: [PATCH v15 31/32] ARM: dts: aspeed: yosemite4: add GPIO I6
Date: Fri,  6 Sep 2024 14:26:57 +0800
Message-Id: <20240906062701.37088-32-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYSPR04MB7640:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b646d9c4-33d0-4f44-1e17-08dcce3d3b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iJQdG/6wa8Mkt3G1wx7qk2Qqiof6FcdsuDzm2hcZiob9uJ5dzU0ZZaEA+3/p?=
 =?us-ascii?Q?oxIa43WZRwSaR05v6ENQuyb7vsYbeTkMj8hSM77dXmTMKj3YXS0WDfrPoqUU?=
 =?us-ascii?Q?liagOwkGQ+FZnBQLt7MnZ9BMhd8lWZeHh1EiW44Z1aMXZ3xinjlchnx3VQI7?=
 =?us-ascii?Q?08WoSWpsM+RMbAA49MNTE/pAzSFF7hkftvRMgpe08OvW2miS8BxCLQ2imlzQ?=
 =?us-ascii?Q?cywsiwe0TN8L7FTViHH+5hQS9UZlXHzfz6kBg2GC/IUYQa9TUOIQSuluuAQf?=
 =?us-ascii?Q?jlO9ZKzxv4MtFa8jxQx3ixfHLvT4aqizl0zstuerTnYmC/PD1Zyvwe4AL5LA?=
 =?us-ascii?Q?nwjndkHJK9w7zTjeQJDr+Mn/KGGmiZf4u2UKlwCthwC+Qs719gvY1OHC/QsD?=
 =?us-ascii?Q?eGA1tyndsAeKsw7JCGpXo0nF0Ho0LrF0wAkiLC3rEwkEMCT0JHyu1DI+CzLa?=
 =?us-ascii?Q?+Q7ydK/P+t+Lz+FMWUQkza/DRNfh3itk3+lV3WiJ7jqlduz69x1b3zMKTYCA?=
 =?us-ascii?Q?V17toVtCUgigBi3h0oE87o/LObaqQ5Mh2wlaofVw509+fuUPqmuexnj/oIw9?=
 =?us-ascii?Q?PFVxAd5wdezPpC+FhrGUNGgFRRpNHOG7hoOIVbf7pCY9mSIWxktI0s9LFTN4?=
 =?us-ascii?Q?HXkroj7sTWDAlcK4tVcd44oeT7LEgA3nwA0yGuNLNvpveRCWhFsMIjhW7ss1?=
 =?us-ascii?Q?bazhLrnVQqV3Id+VMnco3gVsevD29S/x8CTQc6zfc5g6QnbgSgC5/unuDr4h?=
 =?us-ascii?Q?T9LYzHLt9EocDtqYngJ9T8dMyrMOSwOI6YKlNo/GJR6GgtHRtoWUz3F4vulB?=
 =?us-ascii?Q?jTJcEwgkp4iyENQzlU3rhBCtE+vmP4AtU1QOcynpX1i5wUV3ndUJhPiJ5phQ?=
 =?us-ascii?Q?vliZ0tszN0oXn5y/xO14Ycpe4pd02m9MrPa98dpliY/euCimnkOZyMnv4WCG?=
 =?us-ascii?Q?9DpPYy3zC+NR2PdsOPUwi6amfF0+02/2AfOMfhOm4KpqUaUvzWc5hPA2hsYR?=
 =?us-ascii?Q?22hcUY+MIOlxlgYFOTY2l4ZOZ84TSxPDn2lF3GQP3Xx65rYt8c9iY4U+Z6o6?=
 =?us-ascii?Q?WFNoGB16TTvO4faCCnirqAQo1dwDHatvpYjwJyh+zy+tC5hWMJ9lNRc0/Ree?=
 =?us-ascii?Q?MO0fTSNq7ho4fUjZEEAltY4vQPjnWNH7qnMdRXy6+UVOBgd/zSV5Ghw9HPVY?=
 =?us-ascii?Q?uKd79n8/DKoNI4UqUX9WpQ8TUTk3FkI7NRM+dHoPqW1gmdyIHcQGGyst/TzM?=
 =?us-ascii?Q?VnY+xAUcn9n8UwI+gqTuTVO5ua6sUW9uUn2vFDsdLJ6KC1IvQmnpO8WyqGzB?=
 =?us-ascii?Q?xmttG8vufG97FEEqfvWpLjIfEq4ES9oz49zx70V73FfV7quc6aatxLu7Xz2X?=
 =?us-ascii?Q?w1amlqmQBwFQX4p3gdgfav91AVadqds/gxksV8Lc0gDhhbEsIcsQSAWTpARB?=
 =?us-ascii?Q?xiTdyp1n9poH//0+wJBudXcl27EXAHxh?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:29:15.5528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b646d9c4-33d0-4f44-1e17-08dcce3d3b0d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7640

Add BMC GPIO I6 for ALT_SMB_BMC_CPLD2_N.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 04aa428f94b7..0341b61aa1f1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -2011,6 +2011,10 @@ pin_gpio_f7 {
 		gpios = <ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
 		input;
 	};
+	pin_gpio_i6 {
+		gpios = <ASPEED_GPIO(I, 6) GPIO_ACTIVE_LOW>;
+		input;
+	};
 	pin_gpio_l6 {
 		gpios = <ASPEED_GPIO(L, 6) GPIO_ACTIVE_LOW>;
 		input;
-- 
2.25.1


