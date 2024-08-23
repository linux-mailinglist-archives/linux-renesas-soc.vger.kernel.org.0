Return-Path: <linux-renesas-soc+bounces-8100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CDA95C623
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5A0DB24171
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A09213AD37;
	Fri, 23 Aug 2024 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Ijze0GV/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2075.outbound.protection.outlook.com [40.107.215.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488A413CA93;
	Fri, 23 Aug 2024 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396800; cv=fail; b=i9+cpO5UuUV24Y1DJtdw/Xqt+iSM6CBulOH3+wqgXrObkkUtAKkhFUqzBMubl/3arbJhhYlL0Yai2OKX2AcPo1TrMfcQMfPFYG1Spr4ggA2OaNa0UIDaOjFSkEJzddshfu+JcgtiOvBihzH2k7k/C8MIzxnC8h5AWBuoR+pQAQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396800; c=relaxed/simple;
	bh=nWesW5pr4lkg968KvaDmOKb5xtZz0YzjjvLlfY2/kNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S1WHMNLwxHNkAR64O1yUde4jWweB9/mSCE1/LY0i6M24QokdLSyvDHf58hnMschw85sGoZWOBg7bYYLWQeUGHQNd2rwgrCDmt0FKPyH0YpqK78yikm//iOAmcOkjSlkXnibZ/vtQPXUT6eVCnAnItzbhJ09Q0bdXGrQBvbgjmbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Ijze0GV/; arc=fail smtp.client-ip=40.107.215.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2XqJyBuiBaBqYz6lWfcaWt00Yypr2OqNfg4jG8lJnn3eNXck0P/eeP+lVZPpNTBOdN6zAET9pgxOl1JrBPnwoNpKP4xzWr4pT+YToUTimX3VsrQUpQWW3fGHnhxxtnqVGntuqecNk2YVWsrIMK5pTUQGDBEJ/ufN3kkQMiIm99XzWamgycSe6qSvu0GzfPekY8uXxCsu1Cv7BDqOerg5G+jt8DKaQ9SCPvQYjNGMf++ZbcT1aNQyyHtJNn5tvi9foCSKAXvUEU4ppxwOQOiqSdd7Hu2ucskzxkDBZxLQx9aR9ranYXklTjb9NpUVN/vT2Rn4mDkuKbsQ2Z2OBbFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mI0K8rSXqPnuSQqybgOp1bYWqZhcAzOMfVU1VL/kzuc=;
 b=EnRqHXtUl7BeofEex/GAK+XTLzGBTHGk50Zb1H/yYHdK8bOYIPQZaJHp2GWzWzjgt7HcZo4+wrIGp3dm1v2ZDUAo/Pm8Tqere2k/NJMX64VTMvmIJhXquKWc94r5rTYZXxQCL980j1gf/nWl6nVaETZov+u9a5BDuZ5hKISqgkth+oRQtYVTIGTgYTJI6nuMZehOKHUf0tBGHsTKm9ojvgrV7AIfyfEcVopZIlQp9R7tFKMLS6vOy8vEmentvu41hidj0Lm6R2ibyN7WviK5Zq1vIg9Oi3utr8EyWtI4eqcel+0Qs5D7LmTUfI8WecdtutB8/os6WZ4lomCviby3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mI0K8rSXqPnuSQqybgOp1bYWqZhcAzOMfVU1VL/kzuc=;
 b=Ijze0GV/JRwxE84JbpPTQdtc0dTu3EW5jnZpsMExVPUhff1Vz8l4j827uM6I9DU2VCMuYStacq82osSEncTy1PtToXj4Y7rv2zT8m2TsXXcK+nuDrEmsqQRLaDYpY/Keyu/HAoKZanF0LklTsPd67asKgjclQB6lAO+3aAkzyGEMBQX2HMym4Z7w/Ry+6KNJYVSN4wuRPtHPUE0K4ScxwV985eSx0n68M8ZGkfF4C7oIdQdqjEZJknclajFlCR0WjlPLr1Aw41qwDY0pfFVSIRmMVWm7DNAH3yL6cenejXktWCueIGISChOEP4YsSIpD6/XXNEGw0ZjXewxLaukdMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB7069.apcprd06.prod.outlook.com (2603:1096:101:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:06:35 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:06:35 +0000
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
Subject: [net-next v2 2/9] net: stmmac: platform: Convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Fri, 23 Aug 2024 01:21:14 -0600
Message-Id: <20240823072122.2053401-3-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 27bf6480-d3b4-49c4-f4fd-08dcc342202c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jkMcSo5NHHu2p9IMrktwdoUcchvuIQ3g013ybIaMu5JkilOnYEoQKyHM4Qxy?=
 =?us-ascii?Q?ivnclIvuECwKilOyS7iX+0BxJSZlh7BffqKNfPg9EDh35frQpl7FUYzus9kB?=
 =?us-ascii?Q?tdVknVG9HQy0UtoF4ftJwkBwXkJKAUdnjJsnZqigU9M+YfvQ/t3I69XZljZh?=
 =?us-ascii?Q?6VWjA1EIhWo9eKdYwRlC9L5k6aAzBxBhXeUprO+Prz/PAf/0RkIGLdRO9pr7?=
 =?us-ascii?Q?ZLI+l95hRgk2IuzZ1IW1noC8jgl3G3avN/vl8dujzd42uoNk8EFcerqg+dgY?=
 =?us-ascii?Q?7JIk3dyiZijm3DNk2Kx9nG1YBdPKr0IW2ragEw6ROazOngA5MzpBpz3/uQMH?=
 =?us-ascii?Q?YHkpk9MVkbBEiziayur69DcFrEWbhRBI4phDYRi1Gdu5QQIHY2WLFqVLDVt1?=
 =?us-ascii?Q?TXZK/e9PmzNsCOkbcQJO+tTJeVaykCqHn1pJFcowl4MTQW7h3+mnzcz2jQ/S?=
 =?us-ascii?Q?Xyqw0xRDyFoPeEqJfbFRC8jpe+s+LPvIdBW7xWO7Dnw3GlFQehboR9ESLCCI?=
 =?us-ascii?Q?ttQigv/bQqG8s8kLuA0dPZ9GzNdXQz4xwk+vsprrkmRW1u1TFj5XJ/XsUZyt?=
 =?us-ascii?Q?egHeb8aSHl1X7t2QvRW21mrKOrgHXUhlNqM19T11J93iie6K16m8f1UTcGYx?=
 =?us-ascii?Q?0TlN35S4lroexzE4h/tFyzto8KdIJKkOID49qrF5rl7TGyZjtyCxs4TLjRop?=
 =?us-ascii?Q?NeJCAt/M1OaX9aF8STrwB/kNFeNr5rHByI1x1tJAJqvWYioxvxiYStEHDWiu?=
 =?us-ascii?Q?jvBCEQLrODybmjk77iqR0ABun5WFcD8zhqn/9k8HRujssLm7qPzP+m2P6WPR?=
 =?us-ascii?Q?grFEyL/W9UL17cEuhTN/wmslFqgzM5yYlOV7cuOw0ywYUaUDekMVp8WrjfZM?=
 =?us-ascii?Q?kAmkf+ONGIfEoRmHsg0zdSTr6aRyJFxw7eehXtZuYi2sN7jYDIXp4Dsg9Pp7?=
 =?us-ascii?Q?lBRJ05i3U6ebcRhr1IYYyAQj3z7SA/6H1cHyRJ22H6m9VmPJAHpUH6SQanSx?=
 =?us-ascii?Q?s9eCclYpcTMOeY3rl1SlqQUVdS6+xZZSbgZJ30Of4veG7ivIAEl2VzRmU1cF?=
 =?us-ascii?Q?M/kU0dgz/dX9+wh1VEXJOojBYJ3NxzW3ly6tqyWwk87GgHpMl1m033RrNlkZ?=
 =?us-ascii?Q?7NRyLz411xxT0tiekRkIrmL7BH9ZJSwYguD0EKO5bXfe4OAnPB3Vkm6CfOLh?=
 =?us-ascii?Q?hMXR6Hcq5h3iZss4P6+v5xdu11mTIZcfVEbra0GfFDITM2RuRwVeiu7u9DcT?=
 =?us-ascii?Q?aZTsXRC91EZiflULzjyiyuFt7xKtAOlAjMT6/kgGqwIbMPL5Vh8O1UuvTb6R?=
 =?us-ascii?Q?j051tQoswWfHT8NCnPu/24WyYL+aaQA+rGNM4WzLE4vgLRSDqr+mj1TWMMns?=
 =?us-ascii?Q?YZO8fxpT5c4mGVAYQwBOJEk4xKOxgj95gEk6QR2vJzZQSKMRxnFMjSyCINe3?=
 =?us-ascii?Q?wNo3WfYOqgA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f7t1JkJLLWA9qGccmbYE8XifZOReHu8/CjhcFIIEzSyWsuurlsiYt5oPsBbu?=
 =?us-ascii?Q?ioFMwfesL2XB6brUXEG2J3S+nnoiyB4nfYiUjjF+yPp1CGmC5K4U7Ey687/2?=
 =?us-ascii?Q?DhoDiJhoCbMdVLKnVn37SvTnSIzewWHHVlMaXqTMa9FuPwxnAQlFyoqpL6u0?=
 =?us-ascii?Q?SlwwVgjg3F2YdvgcdVgSwXWCk2vb/HL/8stH+mRQyHHtvqm/TFUcWJegVFh+?=
 =?us-ascii?Q?wg7bMe43itKSpweWXvYNt1wfX9sH0ieJs1tfLyBZTqC/UkzlRUDcPtNGhLvu?=
 =?us-ascii?Q?97pcXP2eWlxIXxpwlL67MwUv3RJwvDaj1aNoWqoVvlVZnocLajtLPwV4lcpB?=
 =?us-ascii?Q?JPCKL8cQGdEmf9h7UjaKQrRWkx7ynz62UlsVddlzcRwEPMQSXtgunk8W+Rc/?=
 =?us-ascii?Q?7bvIgsP5zyu1qBYzeSmIqiZUHba6ayl/USe4yjw4xe6Kvda2kHIaXAMZvJmr?=
 =?us-ascii?Q?GkyqdFoFUHWGsbVIkkR4itLeWf6YchcojVzC+6LR7q1CcC003xNSfa1NhBHV?=
 =?us-ascii?Q?DMH++7GQwQUMogz5izzzcQL91gKzjw0+jL80JSjb7dmArE252st2qNBVj1Yk?=
 =?us-ascii?Q?gZWLaSlYVxdr8yRFmjoOM3KNuF/f2iL3I6Uzmgfp6KatMBbsGl1PIUoJxVx/?=
 =?us-ascii?Q?/0fKitwkNpYwg7SpzcZRVRv+1dyRh08YPdWQVqL+DFSmfdv/NQ3ig//K70v1?=
 =?us-ascii?Q?M1zaC0rax9tLzam2/VxfxNcvNbTlnyu33J0xFefyP0p3O42Z37/OJypxfyj4?=
 =?us-ascii?Q?a4rkFGUH5kEqw/GQLguFUWFdWfg3ikI1JweXDcym6B2Dq/Cts0bg0Rxuiuyn?=
 =?us-ascii?Q?v3m/tDRKq5Yk9CE5gL8wAcTlVyRrW41nAZnBonzEr+78mTJl+Imq/z8gz0VK?=
 =?us-ascii?Q?h/Rt1aj0oHUFUhbUgTGcJop+DoQvYoa365wC4hIBjRamrk83GeX8cP2Gotkt?=
 =?us-ascii?Q?vRPtWMiQhB6UHyxRfiPUbepxAE+803E7Em4krgIMvnFXI/ICLb2mM2i2rCX8?=
 =?us-ascii?Q?/AMLFHlIY1rUAF8sM16kYgXjaa5QDZHgycoitM6Xe5JO30AYzY/HWbrakfM3?=
 =?us-ascii?Q?WZlI4AJM2oiwjcrBmJvKOX1+3Gq2jRsfoBwrmVhvCsqpQPkE7I6fBpnnyzJk?=
 =?us-ascii?Q?6kADYnnkx6hDS6gZSCNys/wSgxtaZCOSGTnwNQNGeLvBKmqfLhW7mgtJbfAl?=
 =?us-ascii?Q?12L+910TbOHH9q72cQ+nRkUXnaiyRArgb/OIJWoBubQN+JR8cVkpTbGujzOt?=
 =?us-ascii?Q?M6QcSIfxdKz9vA/Za4+KeOpsChkX+PKXIHJTa4OJBpzKJ9DJVlEDM6yQ7iEU?=
 =?us-ascii?Q?ETksrNC9oT+lJZixkuWCKaw8zQFYQMsN3hkvcEU70mpNTiA7BkZisVFpfl0U?=
 =?us-ascii?Q?iw3F0WRGeFNwX+gAKecdBvnWI/jsM4NiBFYsP7MDOEScfSrYsXfsCDkS0LLG?=
 =?us-ascii?Q?xXNIOrthXXW8CIjDzNrCAolzNmpZdDmMIwvLCeZV6lxRa4ZGLbsCA/Zekf+X?=
 =?us-ascii?Q?axbCLMd/nMQOf2NTcEVvMdTn3BO3U6JrM1dGxGBKKm/VzQ6HWkMaYVQeOwFp?=
 =?us-ascii?Q?5UzeTeYdct9taxYe9OSKIfRERzOigNhgIZoANvwU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bf6480-d3b4-49c4-f4fd-08dcc342202c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:06:35.6439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6c4Zj9/d630eUn5u1SuLXVODqGG6GB84nZRtR6aH1esL09uZoy7VmgU0fSM3JOAifTLcc4Tdwx+WxGBOtfCeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7069

Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v2:
-remove unused 'ret'
-fix incompatible-pointer-types

 .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++--------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..1a66baaa4081 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 static void stmmac_remove_config_dt(struct platform_device *pdev,
 				    struct plat_stmmacenet_data *plat)
 {
-	clk_disable_unprepare(plat->stmmac_clk);
-	clk_disable_unprepare(plat->pclk);
 	of_node_put(plat->phy_node);
 	of_node_put(plat->mdio_node);
 }
@@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_dma_cfg *dma_cfg;
 	int phy_mode;
-	void *ret;
 	int rc;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
@@ -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	/* clock setup */
 	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
-		plat->stmmac_clk = devm_clk_get(&pdev->dev,
-						STMMAC_RESOURCE_NAME);
+		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev, STMMAC_RESOURCE_NAME);
 		if (IS_ERR(plat->stmmac_clk)) {
 			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
 			plat->stmmac_clk = NULL;
 		}
-		clk_prepare_enable(plat->stmmac_clk);
 	}
 
-	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
-	if (IS_ERR(plat->pclk)) {
-		ret = plat->pclk;
-		goto error_pclk_get;
-	}
-	clk_prepare_enable(plat->pclk);
+	plat->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(plat->pclk))
+		return (void *)plat->pclk;
 
 	/* Fall-back to main clock in case of no PTP ref is passed */
 	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
@@ -644,26 +636,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
 							   STMMAC_RESOURCE_NAME);
-	if (IS_ERR(plat->stmmac_rst)) {
-		ret = plat->stmmac_rst;
-		goto error_hw_init;
-	}
+	if (IS_ERR(plat->stmmac_rst))
+		return (void *)plat->stmmac_rst;
 
 	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
 							&pdev->dev, "ahb");
-	if (IS_ERR(plat->stmmac_ahb_rst)) {
-		ret = plat->stmmac_ahb_rst;
-		goto error_hw_init;
-	}
+	if (IS_ERR(plat->stmmac_ahb_rst))
+		return (void *)plat->stmmac_ahb_rst;
 
 	return plat;
-
-error_hw_init:
-	clk_disable_unprepare(plat->pclk);
-error_pclk_get:
-	clk_disable_unprepare(plat->stmmac_clk);
-
-	return ret;
 }
 
 static void devm_stmmac_remove_config_dt(void *data)
-- 
2.39.0


