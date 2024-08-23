Return-Path: <linux-renesas-soc+bounces-8105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C32F95C637
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B602B23FED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B461459EA;
	Fri, 23 Aug 2024 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="SQcE7w73"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2040.outbound.protection.outlook.com [40.107.215.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594C5144D0A;
	Fri, 23 Aug 2024 07:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396828; cv=fail; b=IU9Nt4ROf+Ie5oZKij7VYXZGb4PI9cBAjOqLB2Js96rnqnb5wta5thyxEys466C1HQDrp6ABE4ssIHKoSg+d9Dgg0ZHoN0vraQfN4pjgo44LSo9s+g/CFTJg+oxOX1f+rRVDrIq6XSjutDjNm9aokB28J+edyX4McawNSxz8kOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396828; c=relaxed/simple;
	bh=yoaScDT7AnFmMBiYnDTbztKbTwwuXKfDPrh5JkGH6+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HdyHYMCJOg1VYmNY+vSCIEQ5YZhmA7IfBfJC025SJa7gulZIiSTHsI7yG0YEY9XTRdlP6kMd06YeNI+RYgsrrDcxlQyajwtS6ptgqR8tZ0pDamH2A/RGtBO+LvbaUxmG0p6UOFU5ECGXJYdPUhrU0qWnulBRDnQNhlTKcPo2Rbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=SQcE7w73; arc=fail smtp.client-ip=40.107.215.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbpMXOwgz0sdW7Zu3+G6zu7nswabWfPo1nuMamzXglEccD2sr8S7HcybbWK6JsMbzUydt1ccjLgiOhkujaAlIGOh1lakTr0xfyz1XP9R1e71f+d1T4kPM1YGy2L08+1m44yQvls9q/EqZ6iTYHxs/19rmdVH8iH63Ag9O6wUoU8I7FYpZMlr56NortoqJtwBAOaGwfNtaycLlqrigYFZ3zTxiXToTw+6r/zZzAtjWmhBzTmHkDHxlvfQq8nIa6hxDEAQZ/e21N4BARTSqVqOSJjPPz2KIsvAHK6PlNWuNcoxTCikUBeOruhDG0c2wDqC/Dot9gUpw0i3e1UXxgLJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbLO/Cv63aNye+xBWZku4K2vXl5xoJ/bgVO0Zrqcjvo=;
 b=c2xTCJofNKllNUwV+vdLYP+XIsHdt1Vesj1EXe4kRCttYPoSyIVvnmKgvU8xhd1tRcULVmNsKbOEuGb5x+kEPJ6z0iqGngV6CVJLthDpxepsWZqS61PKD4wqQYH8DEzSUplps/kpWr+zByzKliBMQsDOxndC8vdxkq5IFn3wpcI+N8ysyJ6rOaGmL/MdxzFk6Gz6QPwEvBnC2QdDtdDkQNpoKUFjY+dOXJ89iqS3NC5CSb9CuGRcyHNoVU+uRSRaBvaaGO9YO40Viw1SiM0rEsOkP8wc8pPuN7j/cocgrf9OkN+wpcav6mMY4EIN+3ij6+o+r6UHe4nzlUQTs5LqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbLO/Cv63aNye+xBWZku4K2vXl5xoJ/bgVO0Zrqcjvo=;
 b=SQcE7w73hI/W6guJr5c4rFA6N5hAxhedGBTR3cB2se5FMWZgPWpHY8jSOiHBTc6ZG3RAct9bkda1Z8qUs59fz7A/rnVjXKcZ6qMir3BHKijeArGRVU1MeG1+sZRQmNhUdgkW4lt82fyRaDXb1HTSzaKB0Gw4rtySgbQCTjI8l2+mCBPYETtddKXvx5MY1T0cp4qKMJTE7e53e27fN46zJ8dkLSVQhyMTZwaes/aDoLAhLaaufOjhi8kKfKKqNYX0eFvkRLSfODJF3dF73cJAZoD5hzVO3gYIWxLfpT5l3P3ePCu+aOG8nK6aGNMUWrmd6tTYhSeWdWJHZ/kuZOakJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6105.apcprd06.prod.outlook.com (2603:1096:101:de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 07:07:02 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:07:02 +0000
From: Yangtao Li <frank.li@vivo.com>
To: clement.leger@bootlin.com,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ulli.kroll@googlemail.com,
	linus.walleij@linaro.org,
	marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	hkallweit1@gmail.com,
	kees@kernel.org,
	justinstitt@google.com,
	u.kleine-koenig@pengutronix.de,
	horms@kernel.org,
	sd@queasysnail.net
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [net-next v2 7/9] net: ethernet: marvell: mvneta: Convert to devm_clk_get_enabled()
Date: Fri, 23 Aug 2024 01:21:19 -0600
Message-Id: <20240823072122.2053401-8-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823072122.2053401-1-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: f0632004-2390-4569-33b6-08dcc3423045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qKRNDQ8IAye5iBFyYH4WxoVn457nkTSuxtgUzQLCNig/hWnnHIZZGTvfPCLt?=
 =?us-ascii?Q?dinB6aedRQfvNUuWY50nW5KmpYjs2N+X9wp3/ttU4G8WOvEyJ2QYrYlNSfrW?=
 =?us-ascii?Q?5oJElkia+cfYTKjAh488Ec7mo5jIwBJ8coFGVHLLro1otbA2/UyQppLBtRdI?=
 =?us-ascii?Q?t0XdkMr95lMqo7YiMgZq2SGZeEX/PBcCMn9+go5iEck3srSCKDnrmOkfgciB?=
 =?us-ascii?Q?BWTcjks/FbIvY7J7gL8DO/Qso8FtfH5//Q0SZNlLDgps9GYlqyK4Kvv07Jjv?=
 =?us-ascii?Q?wwJgTuHZ39szRH9SnePpuzRDl+ygRp2i4LMC0cQCzOK8H6YlNFw3GGiUF+je?=
 =?us-ascii?Q?h9kicZSFosg7tsabSNdstU9eCbP8gJ91uE7Yt1p1QK9MruxzLDHryOhfPn10?=
 =?us-ascii?Q?sfAWFNuU16IfOHiVspoAtT99F0hAoM7f48+glGqv7bwTFpJRLqowZt0n+TJD?=
 =?us-ascii?Q?zPN0LlLMV7k9oPSx35F6vgFjrwZOISuyUmH2cvrNCWjsXx4sKIhjaIVWg7jj?=
 =?us-ascii?Q?1sMirtTbxrMwyqMIHeHVIzX3ohwnLYejTeHjqts/xTnBFFJqWyOyGwnPbrhq?=
 =?us-ascii?Q?WSqfpWmWcMDZwYcp+ZNCEKAJpZExivCrSjoE0ZPhyWiyqsHESTqlykYDEv6f?=
 =?us-ascii?Q?0he9KZFgwDxKgAhCSXG3L8qQLPrrRJ4nMgbkLTuiGswHufDcN2pZv76sjyPv?=
 =?us-ascii?Q?/v3pXnw1fnjM7yT4YWYCNyVz0gkKRXs1lOHwRuGZX1/JUqcczr2Ox5qf2qLt?=
 =?us-ascii?Q?zDYKZllmDkrnAekp9MWw/5lgusBPZ5fczuRm22tGQ3YRSdEZNpU2lGBkddbX?=
 =?us-ascii?Q?NxRFxMpo0TqCZoqmXzkOlm3FVEPgOgmfCdBrjneUKwaBTAIK2Bo+F1A8boXK?=
 =?us-ascii?Q?BJOrHpjYjTSQX1w2WbHzst68cI1YsXubFm/1rGPweSXwgqp1Wp+h1Ra7dlZh?=
 =?us-ascii?Q?CMhJNYKcry78VK503p3A8gGoS4do+8Ox0x+j4XXGUjv9Umz2WNWUlUx6R62+?=
 =?us-ascii?Q?51SpuxbfMHG3uMpLq9sCybwWGpS1Bp87+sGKrNu8K/O/onDxWWhCu+kddlPT?=
 =?us-ascii?Q?R17Uh2DTg2ZMOxL2u2lAxDoXKARM+ic89stu5fMiMY8Zu9uLpo8iOsS8vkCm?=
 =?us-ascii?Q?lCSJ3gY8Seh5Z1ZRa05qN/kZxx8+eraJSOoT7n5sjZ/NjlOcYb6h+/GKxGrF?=
 =?us-ascii?Q?XJPNVCjCRvUklJ9o9ja8mchss+90LiimCpwDK2xPFEeGOA4pkwmmpkX4UGEz?=
 =?us-ascii?Q?gMW+0I/xZYDRldz/hlM/CicvzaWHVzktclFFFEqoQYepyECxzAp51KhkSvXE?=
 =?us-ascii?Q?KvclSx04RgCDQ/3VTngjnNNL28U1w+updpak8nykR2xjrHfrfUIpoGmCjDq0?=
 =?us-ascii?Q?h9nnZCpwL9lXvullG2zH45obsoPHojDoSlYbgjr8LMQu6soO4tJ6DD7j1n4I?=
 =?us-ascii?Q?J3Jfkee6+zc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2OlxANd/3jjSnzCHW+yE8Zy2iIxYlz1orjFZjrGtaQiH31/WJacLfzUy2jAN?=
 =?us-ascii?Q?/fu3/ukuwzHA31362uoB5qC6Bfrjq5KkNXG/cdiN6zjY4yTjM+Mk8PMo08yF?=
 =?us-ascii?Q?GuWVvtB6zcVt7niSEl8/ENsKvhs36p5/jXK8jYW5B6cWxmLJLWFFggiSoCj5?=
 =?us-ascii?Q?2XYW0xPGxb25/dMUpJecQA97B/VsRds2hU9BqIUF0l/pWRfA0klPXTT1QZq8?=
 =?us-ascii?Q?o4KRSMRh/eXCgum2AzXCQNDgUuxWHRk+8l/1BMKLMhtV+awIcTnRXjH53uNh?=
 =?us-ascii?Q?tllqnTaUebnUU6PdSFdRl8OTMNO5nvJioUef4Xeb0QDNJ2Ye6H4/p9/baRUz?=
 =?us-ascii?Q?oMYV82Q6dyooo0h+ghoqMf1F5gnmkgxjxbstW+LhTmPdwJHB7+U5cP0R1Bef?=
 =?us-ascii?Q?8J5fQE2NfD/Kr1MHDWBkyAN/YwEofASW1uoXJlJJrJorCqmQsj7cih5TCr6x?=
 =?us-ascii?Q?QQjfrY4Rec7UoLii2yGsVCHu8Br31yVsunWOjp7tUWnektJv3WUfiVHCoMGI?=
 =?us-ascii?Q?P8+1qt+1mupGyKa5/ZgrUAHnrXThdKOD7VvSVmaULMVEAorvR0YyYAJZAfdH?=
 =?us-ascii?Q?LxN5Ln2UOKnwbylRNtio1xQs/HD8anEsdja4fc0zw5pNa4WPIwTUaeuM5mLy?=
 =?us-ascii?Q?UZWA1gpHeopFrpPSsTpNKShMiF8dpsx6ImKCqQ6zO639A3XcJTdPzTHfUvnC?=
 =?us-ascii?Q?CAFKlmyn3IqtzczCyXCAme5Rbqb3QXNw6b+B/YnY4toDWjKs545ynlpn2qWC?=
 =?us-ascii?Q?ltA5KfaBVaJNOzBwhWxhQXV/Avd6nAMMe1bVWXx83Yl4NEh0TS2tZti27E+S?=
 =?us-ascii?Q?296JqxP1KABe8SSYjlZwF9I+bQPdYATAIFvbHsFFX7tl2pkjuWx+3nG38kzh?=
 =?us-ascii?Q?kTEXf0XHxU3aMGQIs4KLAVaxJjnQRKbkNQc7VIm+t9PBklPlnEB0ISvDPtmD?=
 =?us-ascii?Q?umly+TEqJyvm1xyHkqWEOcVk+eZMtwIhhNDcdmBSqE45S39vrAtIwouuq59V?=
 =?us-ascii?Q?hVmy9NtV4o1OUIPL8qelLzUDWJs4LunSNascBli8j6FoWfLgG8+O+nLDaiWX?=
 =?us-ascii?Q?+Gwojaqsf/9aDaqDW96HCLjU0QiUcD6anRasGtszIgCzM/OXVwMKUd0aGh4S?=
 =?us-ascii?Q?G1qQ24Kd9Grb0M9WG69Ic1MgcJ3BRF1CBO23+b6wSyRGbNEu4MO2u9mDaAbs?=
 =?us-ascii?Q?96OZaomRyqIc/78RjFNx1+yhi2zvP7JTQpzQQMMQrvUjctEV0M03SAxPMEHH?=
 =?us-ascii?Q?uBVZCAzFcUSNeHlU+IYf0s23RvEZWGI6kZPucLbgJ0vyRjiblfYD39rX2fys?=
 =?us-ascii?Q?wLBdjc2LRy9AQ1R9y0yMdpFtubSd1YGffGVC+tfjQu8mNrjBo7P76OI0aJqa?=
 =?us-ascii?Q?ucLSinujx6kbKx1lIypoY/x7cov85XtQxqJwVEku+8VPVBl+9zxCpTLCcl24?=
 =?us-ascii?Q?pnghVff3u2hDWRdR3jhtNc3LM7SICvyWXuw5YtYn/w+XG9TCZRK8psrPf6jS?=
 =?us-ascii?Q?QqX2/d+pUksJiAecgXf4Ia2h0QykZZyKecuNFUJDzITKtL1hPelzRHMziIFq?=
 =?us-ascii?Q?MfbzyNlDWyNu9ljed7mUdMcSklJEtNveMx654QXM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0632004-2390-4569-33b6-08dcc3423045
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:07:02.6982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSIYroEUGCxuVtqfl5Ar+XtI77q65WIaRtf1rtFde3w/hSuN/xkSJBZWMJtQSNEuB8/KRtj45ZMZHf5MgL8H7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6105

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/marvell/mvneta_bm.c | 16 +++++-----------
 drivers/net/ethernet/marvell/mvneta_bm.h |  1 -
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta_bm.c b/drivers/net/ethernet/marvell/mvneta_bm.c
index 3f46a0fed048..bfd1ed12d98c 100644
--- a/drivers/net/ethernet/marvell/mvneta_bm.c
+++ b/drivers/net/ethernet/marvell/mvneta_bm.c
@@ -411,6 +411,7 @@ static int mvneta_bm_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
 	struct mvneta_bm *priv;
+	struct clk *clk;
 	int err;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct mvneta_bm), GFP_KERNEL);
@@ -421,17 +422,14 @@ static int mvneta_bm_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->reg_base))
 		return PTR_ERR(priv->reg_base);
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
-	err = clk_prepare_enable(priv->clk);
-	if (err < 0)
-		return err;
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	err = mvneta_bm_get_sram(dn, priv);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to allocate internal memory\n");
-		goto err_clk;
+		return err;
 	}
 
 	priv->pdev = pdev;
@@ -452,8 +450,6 @@ static int mvneta_bm_probe(struct platform_device *pdev)
 
 err_sram:
 	mvneta_bm_put_sram(priv);
-err_clk:
-	clk_disable_unprepare(priv->clk);
 	return err;
 }
 
@@ -473,8 +469,6 @@ static void mvneta_bm_remove(struct platform_device *pdev)
 
 	/* Dectivate BM unit */
 	mvneta_bm_write(priv, MVNETA_BM_COMMAND_REG, MVNETA_BM_STOP_MASK);
-
-	clk_disable_unprepare(priv->clk);
 }
 
 static const struct of_device_id mvneta_bm_match[] = {
diff --git a/drivers/net/ethernet/marvell/mvneta_bm.h b/drivers/net/ethernet/marvell/mvneta_bm.h
index e47783ce77e0..396dced914aa 100644
--- a/drivers/net/ethernet/marvell/mvneta_bm.h
+++ b/drivers/net/ethernet/marvell/mvneta_bm.h
@@ -94,7 +94,6 @@ enum mvneta_bm_type {
 
 struct mvneta_bm {
 	void __iomem *reg_base;
-	struct clk *clk;
 	struct platform_device *pdev;
 
 	struct gen_pool *bppi_pool;
-- 
2.39.0


