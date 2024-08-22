Return-Path: <linux-renesas-soc+bounces-7993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EB295B07E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5949F1C222A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF93517BB19;
	Thu, 22 Aug 2024 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="RDxh+p+g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010048.outbound.protection.outlook.com [52.101.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676117BB33;
	Thu, 22 Aug 2024 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315568; cv=fail; b=r8Fiz82jvX2i3fzH1CqcBcvsmVhqdlbdHNw+PYUP7NhLJggMgENCWDnIPyAnNRtt+JpmzA30apUzEJWPyldL8qlmRf5nqlZD0HVEr3rz65x5EoVuZJJxaxiwpCb5rbv7TXXxr0OQ14Zlz+2eSZ9G7LwpjSqYLTcz1E7MmBB+yG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315568; c=relaxed/simple;
	bh=q84ZdESuhdwF2N8JsUlh3JTg4+0UeH+JICFuIdKxXSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S1K11SQ4j3mn+R3Md5o7GBv4utnlMnkM5JMJGsmI70k2M7roaL8VO6h/WQ+p8L+HB1xPydBOl6VngoN4+dGBVxpb66X/lKd+aLWGwO1j8KBrAI5Qdj5lgXziGaPEl8ieIVVYIKguTeLL4uz5SpfzUqSAndH4Jc55qOXCkNZow4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=RDxh+p+g; arc=fail smtp.client-ip=52.101.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB9CtMrRKL81PFbgVcGuK7lb66u3M5ymYXWBVsAADDzOzpBnQ+iTY+IBMSyyquRes9i3pJMbTB85h0xHvR7x6Ur+abDn29C72pjzVRNIHwGfsHhPyYjr1xhij8vdlwv/mzuYKToab/k+INxP2HCNPZqzb5PB3WovdFR5C8xg32djmB82nfpMbkKB18Aq90PzX/Co7ey2Y0uEcqzIB5MQXY5vxUvOgOvIgmPXlIpYe3niW5SnPanli97KY+4YMwwWEJG2EakirdCxY6j6wavt9FaoLIB9pRo0rQYWTZQaN4cmwZ/7wKBYHyMkNXagfGFA6a1ItwU2RSOmgSTHTfC92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3GiK6ODgsx/PiIlszUN8L5lGBAXPklB3EdsUplc/bk=;
 b=JKFsqbpSSd6BYwrd0IPegrF2JoJF4rHqjYJH8VS84V8+T8nAA4mFQz/RUYTyDI+5QtrxD4MSarH0lSi7rEeB6kQepHHfwWzBcN0s6lo9qCghUnt9OUf8lEXvJFtfKvUyXWbgdyp1LEMjQWFRwNmvWQTTRt7brAWpkoIhKMLEF6cGFQ+MIJki1/N/AiXXzjUp1jPSoFkJjn28cluGYLNIt6df6wF0wP/+PrjMoGTjlbnWZn/aE7eG6wnehgs5SCkuRzGVtNdO0mteGC4M7b7ASbPvKc35cv6O3gp+d3vrSxZjoKfyBIa8ViyzATZjV+V9LQsU5RvIpzrIqoChAp1vCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3GiK6ODgsx/PiIlszUN8L5lGBAXPklB3EdsUplc/bk=;
 b=RDxh+p+guYURaI3dGbpBnOkzDUkNA5veanbjGiBhnKUhp5/8m3yQOyKu2MfEbPchQVoSyWdHTHUQ7mO6o7UB1IR0yeLlq6xtFvzZTP2DohzJM7mZ0XYE/RAtEH2wHEp3zRS4aTMnsmfWuAvp0thku4WZYLSL8JzQusajipY6MXTkM63u4+JR0n523yLkMkUYPddU12zzGMQwzL6TYc0HVGnZTF+CSlx9Z8bH4ivPHtKPeoATx1W9mA40fVzDsegpwEK3p308x0LboCT3KASyTXrpGQ8eiP6ytxeWtXU7RZshQqqJzdtlLU67DEwUitypkoP3zNbBt5JwvM2ZDgyDpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:32:44 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:32:43 +0000
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
Subject: [net-next 1/9] net: stmmac: dwmac-intel-plat: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:47:25 -0600
Message-Id: <20240822084733.1599295-2-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: d426b2d4-df4c-4984-7803-08dcc284fe4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IWrC71DG0TxpHxX+7a0lHdbPIekW1PGSkw8OkqiDqmHt0tR3h/+6MsgxcvIU?=
 =?us-ascii?Q?WU584ZKQjKs0rJ2D8jnWrJem/iT+fjCkr8OR2Inwv2h8eIfcFtBZMVKYSWMq?=
 =?us-ascii?Q?xqDBl5E8EcDkj/+A8/d2JKjfTBlH5G2jcCX3nBZKrEvuCbJLMluC1ip4U4nu?=
 =?us-ascii?Q?yn82c3ykz+ue4cbltc+LvC4URW17r+/J9JiSTpTJALOcIPuHvY1saWB3sMZx?=
 =?us-ascii?Q?mdifldC7bBtx4oB3qmVI475dEMk+mtkhNh27ayHoxT/nZmcSItsM8mtVJv0U?=
 =?us-ascii?Q?+Mu4QPlKujwGVcajF9AWJYeM4JwVWGKo8+xHI6QAmLy3OiJpGXlAfAnBj7hv?=
 =?us-ascii?Q?vXLthoNXpDh50Tnq2tKYXb8tTcTShJ7g8TaATh8To9mH0dQZUDOLzubYBFG1?=
 =?us-ascii?Q?ZsBxwUc1P55CRGEJPaZ4vtDFTuwrjwiG7vHvzWjMcXoI13UKcblrN3I5sItJ?=
 =?us-ascii?Q?ZpULaPqTW2nHepClZfTGWCsbTaM1E+UzvyW10ykwQup0xQ5mKGPg+EHvshvd?=
 =?us-ascii?Q?nP/eVC/3I9mSMU7Gx/8eSm/xFn47vOX5q428xRGSOeoX5rut6lX+ZgjzMb49?=
 =?us-ascii?Q?DJS0KFQZHFEOfq3/SWPEMCwcXe8VAIFpocUv5Vfy7Ckarj8Vl9QVc+tN9bMW?=
 =?us-ascii?Q?1tocqYQ0pb3VsnR7oqt0AuT7lBCk+Bg9JsKcy8j9wAyBDUarCLlvdONgXuU1?=
 =?us-ascii?Q?G4MfULDOVdten/XB84Y1yle2WwVEwCf1Jo7KYmqM6sa+rb9UcZy8R1Uq2ZiZ?=
 =?us-ascii?Q?sgk5t7ZTcPF1sW46VhobF1ccR8rj/pswm/H8Eyxhkrwk3H2biHBPsRZ9cCtI?=
 =?us-ascii?Q?7FDWoVU9Nf9VF4rSqRMxiG4hXzQhpnsqsvBhnJIPEt9mel0QOKVJxaJ8d+IR?=
 =?us-ascii?Q?7WOGZ5Iu6t1SprRZRG7yKfgNHdJpK6c0Uqn5fGFQ6w39KgRLBzVXh5q7TFZA?=
 =?us-ascii?Q?RZYapjwSiq7EDZYdVAvURTUwC7mcKcpnH+MFoSHsn2/fD5fkPELOitcb1aG4?=
 =?us-ascii?Q?K23ghKcGgWU/6QUD4ovd/eIHXOOEGEry1c3+16pOrUhPq2nNiKtG0sUJd7th?=
 =?us-ascii?Q?Mz9VK6uEPEK9sFRnvzcxF9JW5ibFgELFi+0fhNj0/VKHqwMRMB7qyS5FLOuk?=
 =?us-ascii?Q?a8vTqzqDwwAwNffqDpdd9CojMRkTKLipj9290La+3EuYO5Ve1pupZ0TNOXu9?=
 =?us-ascii?Q?xsSmJYZn0WH7P+3loZNO+VhhGzf1BlcIkiVMbnkzdvZz226rY1tHF26h5PYZ?=
 =?us-ascii?Q?XorQgnkF7WL/FBsDQGgfXvzGaPYZc+d0wXaXFVgJ/5cM7AmgsNn/3Qmy95qB?=
 =?us-ascii?Q?hVOSO1bbRx+9/2V4keMxiRi5h1st1yJW8+8No4e7hJy20pHpKOwDepochJpF?=
 =?us-ascii?Q?Sw2cCkCSm7FEncGYO8XMJIjSqW94F9zRxalIqMZW6dN3YoM1gz3VOXdo7/5+?=
 =?us-ascii?Q?KQryVL3NnKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WkNoPETHxXtaeRgYbXK3BQ86hvGret3Ep1hXG4SIkrO5I12gFBHxU7qv7pvm?=
 =?us-ascii?Q?xTQFVOeWnNsayTigB0o6mgYc+kj2CW8sqmibAzyY6OBWPF1aLNEt5kQRoZx3?=
 =?us-ascii?Q?bETNNGO1tgVyK5CGm9umr4e5gqgAv4J7NHdT2m6td03i4IV2IhPdeY7INN4k?=
 =?us-ascii?Q?P+j3EOnOFKEcDA0GzbfkP3/23038/yR2llImZJiCQxdv8ikGw6ZB0eDfAQ2A?=
 =?us-ascii?Q?JVTSpbJ7OFBtyjS0k0HH9i96aOocUYE0WsRgqdY5VTW3ruuF5TpAldzuicIX?=
 =?us-ascii?Q?K7+zyNbeQf309ii+wJAkyPRi84JLrXHXAjJgNMk6cjuNX8NoHisZFRnup1so?=
 =?us-ascii?Q?hOh1XMFg4HRGZ1g3vujcwqfYDA8HrLGG8nprjcFl4u4ETP0vQNXiHXf+VW6q?=
 =?us-ascii?Q?luJ3l8mYFkg5ej1dkYoBXisJyiH2usR4pJ8omXGsDRZ3M32uU4ZdjMPiffc2?=
 =?us-ascii?Q?+eliQvhrWAZ3m7KjjSox1/FJ4dH5OrIZQ3q9SuLP6FT0QaHG0LKXPiBYkoVU?=
 =?us-ascii?Q?kP8bsQcbGwTSUEWnfnRf4Bg6Lo4T8PvXHASqYUQ2b1aoE0i9ZAAcvJU9Jyjt?=
 =?us-ascii?Q?YlkULO4uYUs+4paZy/xjAGeuGnJ0cE4bLsc3Wyu1/vf9GpSWyqxED8fA4E/4?=
 =?us-ascii?Q?6fAg8Z4uAE1dCpPuFffI5hIs4dSNJQjW+DyNOebuYsTEKIN8W0zDgbblP6qx?=
 =?us-ascii?Q?F3Eh+inkM7AVBVdEaH4cn8TUvyfEirL60FvSA6GGI7p/qckOiwGR43Dr9cnk?=
 =?us-ascii?Q?XLPTWocqFXiiENkccV537FyUYTbonQRI9wbaxV1i+2vA/emetKZada5jKHGz?=
 =?us-ascii?Q?p3ZTLdsKxE7IqIW1X2tnNCyCxK2AELxMEfLg6hrvNaFefbnfFEYqHYbxSP7L?=
 =?us-ascii?Q?1P3s64nXZhkPJASoc5uEyTSu3SfY3RTJlVzHJCft3uEofLMDx8tazCLyYArj?=
 =?us-ascii?Q?540xEK0aDTxfDIl10pmbU3A0XNd5Z24hTcrRR4FBXJSAeF1YQTYPeGczXHSy?=
 =?us-ascii?Q?8RbOIbEyjmaBnbUkKb5dXqitZsSHExU6Zza/n26GlqdMpDW7VWlp2nkvOWuK?=
 =?us-ascii?Q?8OGOxLcrgZEG7YYKgwypSOz7I5nebISnMQPjbdAdNNNP/N36YLM7D7RbLnN5?=
 =?us-ascii?Q?ntDRjzoc3cB5y3iT+w+mlQXQGDkjT5iVJdTEnmHYFhdnJ7pPfobukkjvH+L6?=
 =?us-ascii?Q?MCysFa7dWMQECYvw33V6P4RlxcdUr1hmRpvVGCaM4g5CMO9ppKM4oFKOIjQ/?=
 =?us-ascii?Q?QM+9KNI7cQkP3055/Eh0m7V3j164V0SGXUi1DQxw4UG04gwP+j+d98vpiJUG?=
 =?us-ascii?Q?+vNo9/RSff925TLh2wSOzVhqPT+dy5yvnobZRwCJdyf4qSCL1e9HCPMaKoLL?=
 =?us-ascii?Q?NzHXt/j/ulJzHvwLw6OV4791MowYAuZlkyvv707GM/6aNcoNMGBOtlMUDDxI?=
 =?us-ascii?Q?ANTXw6ACxlYk4zqeqMTqA2XEt+jxKJBaMbJ/HOUAuZWZzzKLAAeX4gS2EqWN?=
 =?us-ascii?Q?pBBP994p2yEg566dKfRZRXyRB53s8EHbm34mFXmTs6didBmT/drz/eIRI3Ue?=
 =?us-ascii?Q?t/b47jTdpz7dAJ9jamW1hvQWLnpOiJ51Fm+Sqa24?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d426b2d4-df4c-4984-7803-08dcc284fe4c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:32:43.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJQ60OkNI8Ipnts6vRf7mzqmYTHTGM8iSlMlXxgZgl63adA0VJgMDIPcQiM6l7jEB4V3D19Q1hmou9rCXjpvAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c    | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index d68f0c4e7835..dcbae653ab8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -104,12 +104,10 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 
 		/* Enable TX clock */
 		if (dwmac->data->tx_clk_en) {
-			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
+			dwmac->tx_clk = devm_clk_get_enabled(&pdev->dev, "tx_clk");
 			if (IS_ERR(dwmac->tx_clk))
 				return PTR_ERR(dwmac->tx_clk);
 
-			clk_prepare_enable(dwmac->tx_clk);
-
 			/* Check and configure TX clock rate */
 			rate = clk_get_rate(dwmac->tx_clk);
 			if (dwmac->data->tx_clk_rate &&
@@ -149,20 +147,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	}
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret) {
-		clk_disable_unprepare(dwmac->tx_clk);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
 
 static void intel_eth_plat_remove(struct platform_device *pdev)
 {
-	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
-
 	stmmac_pltfr_remove(pdev);
-	clk_disable_unprepare(dwmac->tx_clk);
 }
 
 static struct platform_driver intel_eth_plat_driver = {
-- 
2.39.0


