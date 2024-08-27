Return-Path: <linux-renesas-soc+bounces-8341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 257B6960609
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B0C1F2214E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD4519FA8A;
	Tue, 27 Aug 2024 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MCywYtJm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2049.outbound.protection.outlook.com [40.107.215.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E619FA7E;
	Tue, 27 Aug 2024 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751763; cv=fail; b=L19mrSa9v/cQNErgxBuGXhW2Ued5FIAQjy927KhaXHoE4GIcTZjSsSD9u/lXVb8UNsEnm2B2ItzOmjF++qvso5OHCBJo2+Z1ZC+AZMCoqF0RasDac5z3zekgQV7xuXjM+1Hs80d2yCS+VF/q/Nl0JYZJge87GAz672PFSPT6zho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751763; c=relaxed/simple;
	bh=STOXym3gHkt/hMtMCZWJAuxn5xhgY5LkZ+BjsW77SRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HsH9LxL6enWT0QLAPcMWZ3gfRfRnlC9sbvv7k+51sLSe3RXa3jnP2Im+WzlhZXNkh+zAeJQKqgibmHxeOjxPwuBbSKsKBkWgllYbxj9SexIdG0IBITev0n94ikTIST/nKHWx8ETmb0FNFMoD+MBLhh5c9fCIt5LSXh2KEBSwtns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MCywYtJm; arc=fail smtp.client-ip=40.107.215.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ag9Mw0X8gJveqgj5R/jXwSPN3tRPP3T1qAjDLakpur4/h8sPPg3COfpZdEPWR+UDJ7ydrGo5NJzMh6h6ODytIgM80pD6L9z3I5La/8GB8f6oudAtIOfmEdElwhDc2ADH0puZNfyu0y+CL5rUjS/SuDZkN/pXxGaJyKzxkVUJS71GxIzgHi2QqN11jtqNHgpEa/A8IE7eMa+9SXpTNH9IxxGXKtMOpkKqMupb96NcN7QqaE87ZoZ3GSH57uWztLbBM8Xwu2NghbdU6NLgCY9XWEvhGDA0JYhHP682FG4Mnn1lGa27DtSfKb7TVFl+q5B5hodPXvn0WqJwDkYRz2U9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzjQUshltpAgBJf5WxknJnH9rd/dbwSbfbQLEIRtPcM=;
 b=UQNe0RcM2MFOHV2QZyVC+rI+bXE7ibF7Gub4UVTn3O/PxTZDYfZlr8S4pL+YYxUAw5ceYUxYTJPpHtJtjqzZGN2BBBgE5QgvN4mgVYEnd2khzq/7xKUvsLkAmVGiMHs6156AUpDKGGgNChKuauDjKnx5HoW8bY6Ovs/ST2dQzrC4FJylKcvZgrUZdjb0AZd3Lcgjy8JyxM573prta8HcgyG5/UIoHtLTAGPwJhrOu+1N/MiL9faF9EbHCnjmhsIWnI7Z9AYB3tKjBYGlZowsvx3yReSF0rMMS4n1NvjnfMhQtbq1JRcr33wkGpqMwQAoRCj3wH6rl8SU7GDFK2PLkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzjQUshltpAgBJf5WxknJnH9rd/dbwSbfbQLEIRtPcM=;
 b=MCywYtJmWjNR2UIhLU5ZazVyys3szkmy63eu0vEYCZrfGFlViuZ711S+nBCdouQ4T/KEXN+0fD+dxRwYvjbOMe9J5uU1M0pSj0hwcOS7FMD1+mlfEcTz152EtkhZPxsglanDwoD92wke+2glN/m4oEptsSdAtKKC/PaishBnaG59s1b6C3jd663tqo0zd+F0l7eAcgQfaqkbNd8Qtxhu04r8ip76RCj+5zcC1PNR10OxmcxFhTQBVqUnuvpo2h93Z8n0w0UFHc7OSSm6WtMdfhXphCSZEBYx0g08bxOm9BefYRqOIbCR6mii8PYph4N/S/h1lXJuG9b7kohoitIVYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:39 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:39 +0000
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
	u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com,
	justinstitt@google.com,
	sd@queasysnail.net,
	horms@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next v3 6/9] net: ethernet: broadcom: bcm63xx_enet: Convert to devm_clk_get_enabled()
Date: Tue, 27 Aug 2024 03:57:09 -0600
Message-Id: <20240827095712.2672820-7-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827095712.2672820-1-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: feebf581-a8ad-4544-d577-08dcc67c96e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AGZwPnDS8aEhKyxTs7gHwvtHrTjdTjyUjqJa3RNoXmTOdrEzWHSZe8UUN+4e?=
 =?us-ascii?Q?s+8o05oWlzgmWJZHX1ScsgMFu0r94/Be5XyOtpVz955ac0fFLpVFofoiDh6t?=
 =?us-ascii?Q?EsWwbXmjE0mLZKYmOhw/pI7+8wc4GsfVkvPP2abU13RTmZ1A9kufMuk0+63b?=
 =?us-ascii?Q?YQRHTXdh260ASYmVbZMpkVWuPVe2/XGHgwx9Z9kuU8JjOGRAuA93Lofcetin?=
 =?us-ascii?Q?qRZzxNZxk3tGg+x6PnMSQH6KuvOtHYbgc1c4U58IrkyzBNYf0oM/0+URxnQ7?=
 =?us-ascii?Q?JBLPstcL3BAWgx4qRo5vrCY7cHP6hcSR7ONJ99EPbQJnzgD61nwirRzJToGd?=
 =?us-ascii?Q?Cyc6eSD8eS5pR5Q8FCQ+A/qWJN6HEOrM/OAoaSHDEm7qljAlXe2GUL+r+UpC?=
 =?us-ascii?Q?EVIVTEyXnevIBKq8Wpl0Vq1EY82u70kxqnZl/yjRjSqWhCciLc+4oEj4i8q/?=
 =?us-ascii?Q?FWV6478/3pBrBmwApHEo3q5ZYS2oSr/2GBvzHVkeq1A+0wTbfIkxjyvop3eT?=
 =?us-ascii?Q?6/tq0mkiqLA7zm/cr2FyEp2y3BPmgCL7mfhknLM8UNS1Ozmsh9U8KVJpDSLv?=
 =?us-ascii?Q?WAJPVkILVJYrvJcd+lUMFcxSe8xQiv8CZJZIVbgex/e1IkJ/GeUPJX0Dla7C?=
 =?us-ascii?Q?ZIqnvt6KnFgOvc4H8rBzrwEqKpfyMn5vKTY47blhlAoLL2oaAfOU8xeug7x8?=
 =?us-ascii?Q?GRgk3jE0s3UypUrb2N9kOZv8g5i1cA0yD19gvrwiwoVp29GvnWhkO+YDRdcA?=
 =?us-ascii?Q?x7PeglV5G2sZOSZhtPNn9MhEO8jSeKLvf2XmqrBqIoRflXA0kk4KkNr2Ki/+?=
 =?us-ascii?Q?YNv3MHaRw4jRQeBHKzN9Sc5fMdiCsG9DwUkemxUGhc2GCufecdDoDznL+w9R?=
 =?us-ascii?Q?ZtY0WwsGaATCP2/xH4sdaFZBSImBtCUJHmOJtK8oEuw3xSugQM1HQ4jRhlO9?=
 =?us-ascii?Q?W68XM42mgPqTcvBUqvnxD5rpRAFG5iyRr9KyCX48v+4rpJxFQ0ClVIydaOeS?=
 =?us-ascii?Q?ON6Eejxv9N1jBciHrFpimya2Cz1qGjUDS0YhfD8WmyeFg6vaNR6cilVpC7wI?=
 =?us-ascii?Q?IKuGKItDeW/Sty1EsyfakhSrY4qwf9mifbYBjYD5Y3oPI/AGeOcS5mJWDmn7?=
 =?us-ascii?Q?GfABwgpAy0FFH+HTfn603lwBi9F1HDbrG4pAgPxIuyPxu8IrFEzRQW8x/8jv?=
 =?us-ascii?Q?InsgB4DN1wexIIK+sUCNCR6miKuxx5pMwjSFoiPeykTHhIXh+GzLmTydh/d5?=
 =?us-ascii?Q?Fa2PzZmNpnOxFrQRQpHmKZAL8SIREnyhOERgWNHymP9eEf8trKXDcfe1/zER?=
 =?us-ascii?Q?tOtuNar1w4AofAg3QrjtCKub9j3AV/YQ5BUg7WNmiTBP4YjpV4QGmvofJmWL?=
 =?us-ascii?Q?B/BVtLg13rvCKqamkscuU+qV+zGqPY/01m+yBD7m+GHo3W8yDzQzVbet0/3Y?=
 =?us-ascii?Q?H3leDUtPEjo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wkY0l3mUO3JqFTpJizVHwk5V9Shr1rjngHfFYFErwCQQZa1NhjEJQD870Nny?=
 =?us-ascii?Q?WvdWmpUzceRyAWte+QF1jGMeNQEi4TZBtJlAbF2kgaloql5KloDdy60uazCw?=
 =?us-ascii?Q?h8SDSx5e64mXkrrMeoVxhJH1qlFyB7JNRSjF8Sbeq8WPkpxELiv5YOSb839Q?=
 =?us-ascii?Q?M0vwYvpA2dtF7DcVcNDKOOZh8R1ED/V53YlaIZfoTbnCoNv0j+8//u8JZMJf?=
 =?us-ascii?Q?d/n3Z0KMv/wiSB7fGJIUMPkZU9dDgVERk564MRgYbeOshFU9xcSiIHzt8aGj?=
 =?us-ascii?Q?4SnbcnQswRJMxUEcP1eEO2Zj2sHj0sQ6q8c5xbmogCJSmVyHSDPfUXhjae99?=
 =?us-ascii?Q?chPoW7lxpOYE0/xyHED5HQD2DLMieHmMFdh5U7EwG/0Hq3NzLbFFsp/DrcLL?=
 =?us-ascii?Q?2tcwV+VKUgsTNjfq0nXPFpESwe5AoULF9XJxRKiOuSR7ajaAdcE+17MvlYt9?=
 =?us-ascii?Q?Q5bd74YIGM0DE9hgs3lrvaaNTz05NFIDls7HiqEg4HgBlTKGOqnmGVXwP/tP?=
 =?us-ascii?Q?6verI2KJ5uAbRVwI7b8tFgW4pVTFR98/BuNHhRnECrLRJdY2RKd3jSk6tGLA?=
 =?us-ascii?Q?GzVf1bqibV2TVZGMQ6LphAckxg28xwGQe5ynNVyLK/Jj422yHdcna3SfleMc?=
 =?us-ascii?Q?+HUK41d90ZqyiBjwNCF14oPdBa4iIXTXI9mfcB5e/Li/ur7AUjrjJObN18gO?=
 =?us-ascii?Q?uaDss0KCZgF0FguoKq4gREml73vFbUdmAlZc7QB5ZU1sFrxsDFTtgvEBPIEU?=
 =?us-ascii?Q?aeJQxA1J8Gjr8ra68NH9cHrQPoGjNnA7ukDNwyB9/FLv1YFTKzcexq+5dmDU?=
 =?us-ascii?Q?FfWn9tzhUJyi6EcZPbV9QObQelgImZ1nF5q77RMEwO2ydzVhiqDijtsOG+BE?=
 =?us-ascii?Q?L3IcK5M87tG04CwnyiigFWi5xzOxzbGId6lFvTscH7to0B1harF2V3FmWlst?=
 =?us-ascii?Q?niMkqv/BaUhn7V3sptuZiXTuCALhKi4lA59KL7fDaUVZiJ6Na5lCShiwLIGK?=
 =?us-ascii?Q?dvh+2Uq0TbHKh5xL/MOwdtpl42r81KijvpKSIbCnkxd2w317sjjCm6khE9DK?=
 =?us-ascii?Q?zEqNh6ljfFTImJre8d9KRflt/Mm1GhsDBlzMV3Zf5Z4bCYeFTc6PVDLAOH+e?=
 =?us-ascii?Q?Av/MAaUxZ6bJWt+ENvZgPgWZenS5RKI+M8aOgVDp+qr6jIXWtYJpugxXl8RG?=
 =?us-ascii?Q?BSJQ15zM5bB06Q73fNE7HxyG7InSF9QEBYkJJQ1wS4dwJt/ewBWQ872nE97D?=
 =?us-ascii?Q?9KfTa9Jbvz5Oe83L7AXV7UqUcFsEeWyloXMsUYgRArFb5zLnjvDjy89nwiTK?=
 =?us-ascii?Q?45a4/O8wG2x0QpRiVnBWEOKcaT1tX4fQGbN20hLDwYbIeBALC7h9307kBwcp?=
 =?us-ascii?Q?wbhZYz03GbEXQ+nLpejH05FPVRiTMEJLck5yWaT79r43F5IerVLOSP3QRwnO?=
 =?us-ascii?Q?NaCyu7yQ7aYhT7ENVpanXdtJL72BnXNZAVAYhSTqi/B1lXzXvGXNsDHLOeHz?=
 =?us-ascii?Q?C8DpvuV/yVBPXyIm2K961D3+QcMWEjnNvJYvU0Gdgaq1Ms5zXLNWmLrm+lG5?=
 =?us-ascii?Q?8yd3OLh44sET59heVyOU5viLjiEJrcHj6589AuBf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feebf581-a8ad-4544-d577-08dcc67c96e9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:39.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqzvQuy0k58CMeZygGPCWchA05VC6Yt32q+2mW0yoEzckGh186Ar4hTpnAwImuaY6EPgv/Xz/ku+YTUxATzQMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-Reduce the number of clk variables

 drivers/net/ethernet/broadcom/bcm63xx_enet.c | 47 ++++++--------------
 drivers/net/ethernet/broadcom/bcm63xx_enet.h |  6 ---
 2 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 3c0e3b9828be..dcc741837d50 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1718,6 +1718,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
 	struct bcm63xx_enet_platform_data *pd;
 	int irq, irq_rx, irq_tx;
 	struct mii_bus *bus;
+	struct clk *clk;
 	int i, ret;
 
 	if (!bcm_enet_shared_base[0])
@@ -1752,14 +1753,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
 	priv->irq_rx = irq_rx;
 	priv->irq_tx = irq_tx;
 
-	priv->mac_clk = devm_clk_get(&pdev->dev, "enet");
-	if (IS_ERR(priv->mac_clk)) {
-		ret = PTR_ERR(priv->mac_clk);
+	clk = devm_clk_get_enabled(&pdev->dev, "enet");
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		goto out;
 	}
-	ret = clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
 
 	/* initialize default and fetch platform data */
 	priv->rx_ring_size = BCMENET_DEF_RX_DESC;
@@ -1789,15 +1787,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
 
 	if (priv->has_phy && !priv->use_external_mii) {
 		/* using internal PHY, enable clock */
-		priv->phy_clk = devm_clk_get(&pdev->dev, "ephy");
-		if (IS_ERR(priv->phy_clk)) {
-			ret = PTR_ERR(priv->phy_clk);
-			priv->phy_clk = NULL;
-			goto out_disable_clk_mac;
+		clk = devm_clk_get_enabled(&pdev->dev, "ephy");
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			goto out;
 		}
-		ret = clk_prepare_enable(priv->phy_clk);
-		if (ret)
-			goto out_disable_clk_mac;
 	}
 
 	/* do minimal hardware init to be able to probe mii bus */
@@ -1889,10 +1883,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
 out_uninit_hw:
 	/* turn off mdc clock */
 	enet_writel(priv, 0, ENET_MIISC_REG);
-	clk_disable_unprepare(priv->phy_clk);
 
-out_disable_clk_mac:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -1927,10 +1918,6 @@ static void bcm_enet_remove(struct platform_device *pdev)
 				       bcm_enet_mdio_write_mii);
 	}
 
-	/* disable hw block clocks */
-	clk_disable_unprepare(priv->phy_clk);
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
 
@@ -2648,6 +2635,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 	struct bcm63xx_enetsw_platform_data *pd;
 	struct resource *res_mem;
 	int ret, irq_rx, irq_tx;
+	struct clk *mac_clk;
 
 	if (!bcm_enet_shared_base[0])
 		return -EPROBE_DEFER;
@@ -2694,14 +2682,11 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	priv->mac_clk = devm_clk_get(&pdev->dev, "enetsw");
-	if (IS_ERR(priv->mac_clk)) {
-		ret = PTR_ERR(priv->mac_clk);
+	mac_clk = devm_clk_get_enabled(&pdev->dev, "enetsw");
+	if (IS_ERR(mac_clk)) {
+		ret = PTR_ERR(mac_clk);
 		goto out;
 	}
-	ret = clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
 
 	priv->rx_chan = 0;
 	priv->tx_chan = 1;
@@ -2720,7 +2705,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 
 	ret = register_netdev(dev);
 	if (ret)
-		goto out_disable_clk;
+		goto out;
 
 	netif_carrier_off(dev);
 	platform_set_drvdata(pdev, dev);
@@ -2729,8 +2714,6 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_disable_clk:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -2740,16 +2723,12 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 /* exit func, stops hardware and unregisters netdevice */
 static void bcm_enetsw_remove(struct platform_device *pdev)
 {
-	struct bcm_enet_priv *priv;
 	struct net_device *dev;
 
 	/* stop netdevice */
 	dev = platform_get_drvdata(pdev);
-	priv = netdev_priv(dev);
 	unregister_netdev(dev);
 
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
 
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
index 78f1830fb3cb..e98838b8b92f 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
@@ -316,12 +316,6 @@ struct bcm_enet_priv {
 	/* lock mib update between userspace request and workqueue */
 	struct mutex mib_update_lock;
 
-	/* mac clock */
-	struct clk *mac_clk;
-
-	/* phy clock if internal phy is used */
-	struct clk *phy_clk;
-
 	/* network device reference */
 	struct net_device *net_dev;
 
-- 
2.39.0


