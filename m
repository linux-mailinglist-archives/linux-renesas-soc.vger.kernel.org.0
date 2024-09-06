Return-Path: <linux-renesas-soc+bounces-8758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D890C96EA46
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 383D1B23781
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B29014A09C;
	Fri,  6 Sep 2024 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="u1frSGK1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2053.outbound.protection.outlook.com [40.107.215.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B214B956;
	Fri,  6 Sep 2024 06:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604049; cv=fail; b=etnIwQiZEjtGNlDER5yget/ImtlGQYLXEPWr/EeviKez2OwB7W+Qc1OTQF/AD/Iix7a1FUtV8eY641WIeg+8KwDvmbL5xPPna0ySV0/Pn5VRHLfwhwZtYmLMQCrlHgYU5aPKry4FgskWQBNhEjmolx4BgZrzorEWM+jRYqjJIoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604049; c=relaxed/simple;
	bh=FOb8jOZM6I/Yf4bmbBSziNy2HqRVQUfHDF/sd4v9AWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOdnRM0NApkj+t+eUOkByft1KCDD47rSzKKd3JHT6r/lgYgZyaCAiAVQoUJQgVkJAeCeRU46iT0u0zFITM/mf4hiDxBvc4gnyuX1mTkgNU7EWfferrZBjoTxGUVGGdrxVVcSdnqM0M7i9G3CDKidJ5ZLet3WMwIu403KciGplVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=u1frSGK1; arc=fail smtp.client-ip=40.107.215.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAyrnyysd2R6sNDDnb67po+Z5YWj/Zt1fgWeUEcwpX8ZCcIYEH9/ZSH6nNND6Lf0lp5XBFl0BZ3jgS8koe0pfmmzZBNRNeGxWft8a6hIJfhWwAsQo7v3RgcwTSxTAuXKTt2jDMUJ4qMXCz+K5Y3T/gy11TdDrXhpOnAiDNt+KL+f7RzywZBe5mR8jYzsIb7pRkrUZJzomhxouq7JRFPvDN3NBxx8J11HfreeBr1pXMm6lWxvyfNhXgZVjUYEGrtVEJq5Y+laCpSEqvl2XpR72q6W5quuuP+f9F1w1vWyTJnloliHPsAFaIxCADmL7nwM5vG2wmbVh3OU/LjA/jAzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2AzjfJFXFA/0WPUqtPxoFn2BZSzzb91uVzc8URhJAk=;
 b=N6BfQzQ2j8+QHX+aw5TzwsYeOeXzI4mucbVn+VYJdGXlUGYxiXkVDDMHpjxWv3lssfSgRxaUcFFFMNO9sSeQHt37hcpx6r4cUumqj7TAa06UHLdZ9STXcKY+K+Tf3+0Bqza+gIyrCxfHNN3wmIHXDSgM0Bbj0adl8Hu7TAhTQIkr58J3jPk7QH0iQ2mp4a3vfb3BHZAjhOrHkBJcHPGhV/cEUtv9Dkp/sMeotCjP0iiQmQd32qbTz6af54QVTgJyZVWFzLabixD/BvkWdVVceVOYoGMkVFLJ0J6G4JzKhcA/2TLVV8bpZCgIAJB3tgtPmWPZ8Y5Rv52KZv9cWNJdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2AzjfJFXFA/0WPUqtPxoFn2BZSzzb91uVzc8URhJAk=;
 b=u1frSGK1oyyYlr4N8oLAVgVLfOVggs9p6UipXkGrsQRZrx830F2Y5OT3ZnbWiZUTEcLM8fY4cp4qQeLaaWM8peuyYUXDz08gd+0+uRG5g/LfjqjCzCj1T4k7z+xYeCcTv0j9M/ppjreGKuCaeCmNSYLdX4S4tJ3olTZdTtOsR86DxjodrT3CD0BgqjiUxrpJNz4yQ24s6i/+ic6qsRLwy5YnbUweZpGKfBOUahGDzcJP7Cr4lTTkj7l+fsxSRlPTEJR6nDh4nmtXP8TKviQ5rXgQ8/ARcMBTk0zW3yt48QoXwdRGCDqe8lYlK1gKr3hJXtQRozRh+OYRj+0jQIom0g==
Received: from PU1PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::36) by TYZPR04MB8255.apcprd04.prod.outlook.com
 (2603:1096:405:de::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:21 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::4f) by PU1PR01CA0024.outlook.office365.com
 (2603:1096:803:15::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:20
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
Subject: [PATCH v15 04/32] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Fri,  6 Sep 2024 14:26:30 +0800
Message-Id: <20240906062701.37088-5-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB8255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 708d0ff0-6a04-485b-073f-08dcce3cf678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WqhAEVGhX5hhm5+9tqLwt6+WFm9M9opjcsKDpoe5ujitHfg1RcTJpqSroiF3?=
 =?us-ascii?Q?mJJ+o3fxxKWtWizuM2z0xPyGPspqKU6gGGFYuj7XPjwJDT6AFxj08WEFx7FA?=
 =?us-ascii?Q?tjQzyOKRd6AyPzUDnfMiMfBTzNeANzz2HPkGu4fgFpwALQCDEIBFHubUPrdf?=
 =?us-ascii?Q?YG6Q28Bp6+tHBZdQqQcdoN1TjG1Ip92+5HLNMHlShlHVfvytpenyChDfDfJX?=
 =?us-ascii?Q?m4XZjuaE8SWyROjut51+F1Noqx9oMbJtZ1lOdjuATxevqcCTX7NLM3OYBNN2?=
 =?us-ascii?Q?+AZ5Y41k7gEgniYeT29Vr2esjO6tJukHECCfRxsoK/AstobC9AnSS58lWXqc?=
 =?us-ascii?Q?uqgCZ+pvLh4/3wZgQjE7/svbbiXHJbZeEO4Sr4u5BO36JP6FpwiUTnx8xDwc?=
 =?us-ascii?Q?sK59BAgPwP6ti8uoZ7B0OCjBtBRYrOFHxLHbk/WyqcT8P+BgrR0Po2lyYHu0?=
 =?us-ascii?Q?7JnU2OaEowwx8A/0fYUyrXXkWlYTLEAv0pqo8/Yywdw7so+ww4UAUwExlJ1x?=
 =?us-ascii?Q?PztOJb6blYeZHyz7tLBy7LqRHBjEhKfjOgEMs9T8+q4k+hGjZlUcQFpyJQlf?=
 =?us-ascii?Q?4eQdSLN6Y4geyxvFVGo3WjxfHtVRHdDTDsyXdA0EJbh6RP+SJPpyOhBDM0C8?=
 =?us-ascii?Q?rhAF++e4j1B7Zq/wjfkDdcm46jP9XaIQYWB/mvZ7UnQ+DXrBXljvS/LYQBcR?=
 =?us-ascii?Q?ak3Nvw8FXtujkdQOUhLr/RA3QusARdESCnc/FzYk9+rHMqdYz71pfKRuHOnY?=
 =?us-ascii?Q?tkREYS1PApPjAP+SNqx0+lELFO5ZhvpJMmeCBis2bjmjxkcx/Og3FkDkB5w9?=
 =?us-ascii?Q?P9nXqXPsXghRFtQGorNeQBE+YOAWc9abkKXipPvf8GMa4cVXxub0CWB934W4?=
 =?us-ascii?Q?1h40l2pTq1AcvCDZNQd8aU9WqJRxbIwX/MINYB/knHC5l/CGdnm656WPo9zb?=
 =?us-ascii?Q?UXZWM6PGBdQTSomToSZqT8fy4gk0n6aTmSbwWLUgCT/bAcmHY0mBROBi5A3/?=
 =?us-ascii?Q?xWZRBs8ugXS7dT7j0PK7LAlyQHPG6NNZNnu9sW+OHMixd0TjwSl60VPkVHvv?=
 =?us-ascii?Q?j5J3r1peycgSDay4Vkb0BGpanIzfFByTxXgkx0ZJ/hgom7fGsEHTHdy/gxwm?=
 =?us-ascii?Q?jKYeuBYQyj5HHKum+/LOKTKLQcDLnKN7LCnVUAvz8V78QRz5qAPvpi7ay6Ej?=
 =?us-ascii?Q?MgVlfw3YrvOeceoOt0FqNJU1a6AMWtruQE8Z8XiF+O3eYWG27D86Vwx1UTsr?=
 =?us-ascii?Q?1r8xOL6TqXL/ttUdYEgP+Hi7pzhR+4RNCUfv7TCmI5ly7EvBvHI07dweYUkj?=
 =?us-ascii?Q?vySZvp4C4S/ZJQxa5ITLJIGcRWYRgGscNW+vHhFaB7AWQ7rGHQHyqRV/IDvV?=
 =?us-ascii?Q?OaD0yULhIgWnpj5MzYM4Yea1/W6mECjOkGJncYetfxIpCfxrGdx6I17ihfRq?=
 =?us-ascii?Q?hx95IUJz65udFG2sKthSydTi4YqvBLi4?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:20.5532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 708d0ff0-6a04-485b-073f-08dcce3cf678
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8255

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 575abdd530df..51b4e9ae13cc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -120,6 +120,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1


