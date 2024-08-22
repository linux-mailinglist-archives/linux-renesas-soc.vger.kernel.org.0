Return-Path: <linux-renesas-soc+bounces-7999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E495B095
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF5881C22D11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DC5183CA4;
	Thu, 22 Aug 2024 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ad19l5VY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2052.outbound.protection.outlook.com [40.107.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57468183063;
	Thu, 22 Aug 2024 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315595; cv=fail; b=W8ln0+lmANIMOdgLmXcaEsD9yr50j9pPiVncAISnKR/zUMbnjJJjZjiKhGiZBW896scuAqQC689vfLgDEM9XCb/Y9KKLoNTLd/aBLSff8XjGjNQEeu/OtRsEAUpiw33Ud5XGCZfC8iuhpSqGwPMp4M//hwc/kcu9FVqazLh7b/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315595; c=relaxed/simple;
	bh=tF1/6c4FptYOvpC1fkCyunctJZIDcAH+jRIQKAomZYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bbanEYqf4Od2Kk69Oozn5lRGuF+3LDte3IAJ1D2S27MgNlo4kEFaxCaloJcpN3jNmSnSB8tHKXQG13z3Bd9E/XYB8pTogpttolOKQHvZHUJmcyd/bj+3Uydnj4290uaZKPVqaDbSN19RpK7ZRtN1Kd6+vRDo7jrEloYa89ftqJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ad19l5VY; arc=fail smtp.client-ip=40.107.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwfXHeUoMOC2QM0wuKpa5Xi+YeO+3cwhFm9+Bu8KbJmZfD1qM7Fdqqfbd8CZbA5PuhfxesU0gLtHz8TPqHeQ4oaUir2+MyQ2NvAe0B3v8wrHC9jxL0eRjhZUa/69augQ7W+S/MAKv0XMPHCscI3lpDiIJavlpqvN2Z7A65CWO7MdjSmnftvvoJ5tKb/mxTFmbXIU0OgI1FnRtg5EmKzeURZ5mz0YAgkVnAdFxwyBsBwsuOvG6jHKjDz5prbnITBh8Tt1jIPYTMoBh75pFX9+9hKNx2ylANBeV3NIq1rnYuKPWgc83J6zdT04qk4I5lEy5WFeq8wNLsX/F7sH6uJKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9ml6wQXYKRzKGJokBroA8S/s5yQ9E2DwJPNAgpUwEA=;
 b=vfvVCHpF+cLz3PHw9AD463oMs864wSnIVuJQ5fk1Kdeu1EKWNFfdzA1NdhZcY7rij9EauZwheZ02zlwshh4vAaJ26ngaBYT7RmMzFGhpmC6tNSBkATsI4qTgnvPHzFlfQUazLVlKFOXpexMK9pJZSLheEFVfXgYBOABYQ0RmyJnfyLQXey5f7SKhlDPcVzUPOO19kKPn5ILbxGIbRqOg83d/RcPdQWB6jKvOwmUkzw0yV/QWwNcILFTuaIeHye23TUZpLNo6EUYNMPRYiMHkK9v+CnZbWao+NIoVNKbbxgo+d1yws+RthehQ16+irf/DlZ3oQYg5T70JhPaBIV89wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9ml6wQXYKRzKGJokBroA8S/s5yQ9E2DwJPNAgpUwEA=;
 b=ad19l5VYd02IusaeG/GnNJc4QPdhUeVDf4qP6CA/Qkv3Hvfq7f8Zj5aNlJ0gIrevmXTLcTY2ze2Hw3w7o4Q5p7mp6D/hVnCvptqwOGYokse57w9vnrdvru8Fledtc+F4ycu0EmcIG6nTPUPQRcGFl0DdoNJ5u+FZv21SfXg1oqfUl1jMEbbZA+Ux7uNhPxDJI9FlbOXAB9REAvYfeslmXw7NeSZJJ+K1AwGpQuEmnb3mXxeZBye9mt0pNYK4CIinZxhr+C8Qo2TYgwqCr31TxUgI5bdm9XdQyDcpgaN0LQEVN137TsMrVhWuZWWdPmT248mH2xf0koPdtw6bhTjffQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:33:12 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:33:12 +0000
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
	justinstitt@google.com,
	kees@kernel.org,
	u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com,
	horms@kernel.org,
	shannon.nelson@amd.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next 7/9] net: ethernet: marvell: mvneta: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:47:31 -0600
Message-Id: <20240822084733.1599295-8-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822084733.1599295-1-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::17)
 To TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYZPR06MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 356f1bb1-912d-4b6e-14a7-08dcc2850f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lUoIurbZ38t4ZFwS0DaVY6dmjj8tZDnOfvbqo8Er1oBUbTUuY5C6WolLDzaG?=
 =?us-ascii?Q?XEydpaotw1Yw9sICZE+SfrPggNEZvAQFKpL/xqToakzV6IZeffFPpP1BQ1Ab?=
 =?us-ascii?Q?/K20rHxtst57G351kxD0nRnf4BMa84AKOjuYqfAnGS8gT3QQv9p/D76WJw71?=
 =?us-ascii?Q?Yd0ShCE79f0+cl1GsrrNdPo/CG2wpuswklSvh0/Msaw3dyqTG7ZB3Ry6/Ck0?=
 =?us-ascii?Q?PkfHXhTlVRt4NnWLaaDlmQG3JFDIJAWHfjlFHXAJeQe3Z5l3M/VsergFzvLO?=
 =?us-ascii?Q?f/3jb8ExTWp/OULWJqM71AOMSGBATxWghHBcKn+CihLCcCKiBzWYHJCN/eGN?=
 =?us-ascii?Q?MIBOoOQjKj/TGQj7Ej73MGekY0e/dr19DJF5I7KIiskKsrPLVfOsGj40tKh+?=
 =?us-ascii?Q?B6IDLFrRUOcjYxIVRwjVf3GtizJu5dQFeeRs8YX7FbuLGs7FrScyATq3u8OR?=
 =?us-ascii?Q?zIoCgMxnvvYEB/wWTlPQqcJoLKnXgIziWdEfW+5urD5mHr4N7zPLGKkk+XwW?=
 =?us-ascii?Q?jIcUiynzYVEsYcwE0m3FOjsw2lFPrRs6J8RxkHerFszPN7FBl935F9Gb9TKG?=
 =?us-ascii?Q?vw3ShTAJG71nBCDZpsEZ2EEMSGKzPZjS7MnbdZ6YibrTjWQqIqDfNKxNLdRp?=
 =?us-ascii?Q?xyYI79qjwNyDmieKEAU9gVe9mJazJPJ/5ejV8ZJmfEa9z5CsECMmNpb8LM4N?=
 =?us-ascii?Q?H2ifxPx/hUJSq4EERLlY2zecO2t9wRQleoROZjZUsOoAgK9p5ZL4Ynl1f8UO?=
 =?us-ascii?Q?qXa0B7SVXe4fLJNgqk1EXDO3tQtC/Ia6RlUsi6oC8cCS5FZdFVMaZib7qU6P?=
 =?us-ascii?Q?5N/xrcwiz8PnB0fj7+Jg4zcSCtJfoUiCfMTwAcb0JwnKmLfT21WzGCJCYqF/?=
 =?us-ascii?Q?Uhj+AQ1TN1X/vSgR49GJmLhR1Z9LiSvzOw7oI9DIuHGXfJTt1TOfLNVuTL21?=
 =?us-ascii?Q?P1ZVoPOOGwYx+p7b4BsY9y/6rCrez6M4ECdqtvA4TejRq2kVvX/5Hni7JCs+?=
 =?us-ascii?Q?tXVGjwqiv27fG96aEeELB8ec33Y6GSWhaCCD332CwXY12T38q39fypdp3GlH?=
 =?us-ascii?Q?l2FrNpiiOuAftA0Bnki7ju02USzBjMGVRZKoBF1FTLfiW9tIvcuzHoPf1q7m?=
 =?us-ascii?Q?wOV3nt4jDByvvCNxYqQWvRopIttpNd9kOWcDkvATVDT895hqWLjkxkHndnSp?=
 =?us-ascii?Q?C8jrZ6SLnl0NWKr6SvfKl6lfCp3CasYv3X7DA++LagffOZYrweH6gsE/O6yu?=
 =?us-ascii?Q?1H8BK+3CMtd9q1Ue7m1xQIMIvA8yKNX7BjSLbSniyye01GfOt70Y2khpEXyQ?=
 =?us-ascii?Q?nnxGv88UY+yQqJ1xKMma72V8ytHnnDVd2jep09rZk8BbPS44FHxGEtP/Hxeg?=
 =?us-ascii?Q?Q7LJX73w19xBPv0SrXj+tENvXIfSvH7nI7I51+ABJ8M2lDKf6szY61xIx1jg?=
 =?us-ascii?Q?v8feXWCguAs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B44ZHiyHn6Da/hWrs2NjE82okdCxeS8RO2LTBRYUzVSE54K7xWhQyJUJNlAG?=
 =?us-ascii?Q?htCD9KQ0E2K3hGHzH87Rd3UNb+eKx9oUf24iMFWUsqDR5xE0u2VS/Ope5VBJ?=
 =?us-ascii?Q?XYYO2oVNhR/s+07AKq+WzXJc0NgDQBpqnLb006ItEZ+ffUZMt9n3u/+vuQsL?=
 =?us-ascii?Q?ZvL0lXPkSCdtKUtSQ7+KdCGhgUZ1bhg2Hn5D7+Pdo2bS5o3zN5zEgJJ3A481?=
 =?us-ascii?Q?u2OjxMAjVVPL++9/paA4/VwUSZcCKo4h43rFYxH+G9006ELoc4rJu1lrnq5T?=
 =?us-ascii?Q?hJlE46KjXaFSiaBxUbJwKOQGrhtmSOGDd1A1fsOM5dwql1sTfCE3M7GImntP?=
 =?us-ascii?Q?iytEl6gsWltaNIecKJtYafiYBtl8nabEW5venk09C2YjayyPz/MpmK8Z4UxI?=
 =?us-ascii?Q?w0mFgUyKT/jBCluRmFG1uR9UqjzLRplDk82EgtlGpwqrGcmGzk+cfe4RT2LJ?=
 =?us-ascii?Q?Dj3c1ev4gFNw5r/Ti0KiskJDc7WpX6w7a8ZwnJRp25VXUOn5sxG5reiH4aXZ?=
 =?us-ascii?Q?LW82J7dq+38WSKULPYhdQv1+xUG+IG4s9qmPoST3jpe/onPbZ4t1ZLS1yWWs?=
 =?us-ascii?Q?VL3uar81u32cIoa4FDFpAokTHNU1/OIDgs0WU3ojKezf0HT9v2l+wzqUc4j+?=
 =?us-ascii?Q?unfRJzvpycF3ilWC0Tgv33rsypA4Yx7/wZV4U/jmCby6FbWp0d1YxH0I77JI?=
 =?us-ascii?Q?7JK4XWAjNbzOLchUVnYzqCxL9r5fHR06bWTrnHv3d3LhuTsTUDc7oL4I75hs?=
 =?us-ascii?Q?IMWU6N9XG+IDOTrL19amO1VkFTYVSlLdA7ps769+UJllUZSeRJTesIZIOjNO?=
 =?us-ascii?Q?lSE+in75ZA1Txm5wmvqya0bBs52mexZUiT7kVx0OmDzi+UaKV9+B0kLHh0LX?=
 =?us-ascii?Q?6C2+Kx6yD3z8A3Xb0KOOQpdF5kVqEUgb9JpWTNpS1XLJrPaQPLXs0A/NyHdE?=
 =?us-ascii?Q?JZnsCZXc4fMYTSiKlKx7g32+/cOlEDBw1JG4KfPVm9ARucnfMVGOL6DxBQWu?=
 =?us-ascii?Q?YyqAq7Y1Gdexs04YxqHexMiHRqm161cTMrWayVf2bbILmDNQphgnsEob732O?=
 =?us-ascii?Q?sJw9/j6HnB/Tp4FUpisiD2hDeI/YlYakxvpn6W7W/W3s8DfFh0bhvIjmT/AZ?=
 =?us-ascii?Q?yW8uA2sM4A+4dG2tNveACOK9PmzaP7qopn4p0l6a9uBlV3s3S35cLm/S+vz4?=
 =?us-ascii?Q?Ly1/RrQZb+Q/TXur56wpqBjSlhqRPX32TKCZuTuBQZXGznuBc0DRzeVxmxR5?=
 =?us-ascii?Q?v9UZAE8+ebZV8hZcMyt9laVxqCUHhxwGlOdGIVeyINALyAyUZdn+Iz7q4b8Z?=
 =?us-ascii?Q?Xg5uQ0KCjuw2tgYRPFwvEu41LUtTrGjoK+Op7g724YAmMG3IbHqUtKeZVu4d?=
 =?us-ascii?Q?pE0hgOzXZ9XwU+yF52PeURxzVXXSEmF/jsbsH1IaG3k0FuXFpXX35gXLfqdB?=
 =?us-ascii?Q?1GXRvUy4ZQsYyOs/iPJ/TXKzYHl3mnURO4JgtoXL96I/GIzgq1VXSbzOFufK?=
 =?us-ascii?Q?t9n6jvjNOAvzxiUGqXmHuWNK2QgL2lLu0GeERGxOOL5ISL+aEiHMCopGxUqo?=
 =?us-ascii?Q?hrcjdyXLTrcF4kWx5BJjenHHpv5z5E8+JecQeRPX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356f1bb1-912d-4b6e-14a7-08dcc2850f0d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:33:12.0014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYW4E/CVvl6GY3mUcmZPunm0QBMPtS9eIHj7xmuzzH18ZUFbBluK+Zhq+QnjakkSQ+LlCirlLaGl62887lOPSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
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


