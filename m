Return-Path: <linux-renesas-soc+bounces-7995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E968295B089
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EAB2B248B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C246917DFF4;
	Thu, 22 Aug 2024 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="q3mFEKxd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010023.outbound.protection.outlook.com [52.101.128.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14717DFE6;
	Thu, 22 Aug 2024 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315577; cv=fail; b=Ctg0uHbSlSjuM5ztXyixIobBL1542yy7QQW8uHd85U5zW35cL5VfxX6CADoY9xoKW3lsyJxRzvq29QLTBo+pVBoqULklEWpxUdQuojOyKY3+FDQu1qkb3j4BJlmAs5IpUVlkGyTLbUbikLVOiD1jQyNx8V92WBR4AmwcvNDBxjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315577; c=relaxed/simple;
	bh=bSCOSjEz/rydInwi6wkL0kzgSk7IzS6wZ9TVTel0GMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/Dr0Du24R0bA64TCLYZwdt2Yq/rRhKRTmrKLg/sSxpMN94h6mjmLbUi00qE+yu0YgVbzYRZ/MVLk6fqyDgp8aoWT0Tc1hSolwZAQkRGZKJSM2qznJgQfjwblcaF9/u5eeozR1IvQulew8sty3rh7ei7KW/zDo6xdIdbaEv7bEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=q3mFEKxd; arc=fail smtp.client-ip=52.101.128.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd1NuKQWdm/nNRA60r3ZZ70Nj5Cd8ENshaL1CwJIGSSwXsKeN8lvx4SclXajw0410pMSJG+DqTNiyF7YUE8aq8rfXWQqOBo61eEV7i02sIncJjehlwp0evPHtMvXpWDahQAyq9Qe7Qw9fojHdvc9Dnwar8s4k1DduQWOumboPohYnxCUBrWwbZBP2dd0VS4dUQkaJHapSRz9gYzGkeShmyIA2UyGVLuE8zla6v3GWXOMQQEiWc4utnOf/C0U7xfFOfMom0J4SQ9S9BqPUSf2UfeU4aKx0VrpxNkSs5K8VbLiBL7He6H58sqzb9EGblEDmA5/8wmlSVhKdg352ulfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d+6h7KOTyM+MD+Oybw2j6gPuao0KsZVAKxbqYJhA4c=;
 b=GzTGNUCihvDjPb8l/Hg7pWDPzhCtyF9FnNhHzYu/e5h5Ds92ToWqFAj+2Cexhlh0dhC4sJNUxba1LAqz0lu9SzFkckJR4KnJSDUuINMGQ46bYurHzKdXtRLf4C3uD0Kc7dcty59K4m7cZSA5/aDbErPwU5Vv5tc4QbzhlFKyKsDtu4a61KMN3BIK/d89aBXcnkeJxjEVYh5LKJ0ctY+9mcLNGcb+8YhtaRrjbAL1IIpPKNNoYjoAPlK3qPyWXsQNREbuHpQxcmu+WUUp/xY77giUt3zBaAxxWOAMwBPmmuphlYJKeDOq/jLIqHsyR9EzPmQvuRbwoWgTAQxIDtMksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8d+6h7KOTyM+MD+Oybw2j6gPuao0KsZVAKxbqYJhA4c=;
 b=q3mFEKxdImf/6eYeZWUjbKwYpq9ezPOqM1hybTalNObyg0kD24pRH5yS0KE+9d/Ub3HdcapN8k1PXOO5/gmedFM9qwTSghEtTmAhfOev8SORgxk/3ta2Sw/jGfJQGTm4bOP3z+LghZDikzcsHHW0ipa7TDisYFmaie01TMZXcGs2EEvMKAua9IG+nIhfC0ux3wQvpMnJR2JvZ3czvepa7iqAQ1Huyo+/w7Q8muyeBbEazGaKta53vOHXiWu8zuTt1vR3SEoh81mP9LNvLZ8aWbN4l+uP//8XDeCK/oWg9C0pIcccYSGAXPBymSG6eY5d04zKjczfbUb7ROXsQwNWMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:32:53 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:32:53 +0000
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
Subject: [net-next 3/9] net: ethernet: cortina: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:47:27 -0600
Message-Id: <20240822084733.1599295-4-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2fa632f3-455b-4003-6672-08dcc28503c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?49wg3UAqXAdcjgyGqiM5CvanMqpsgoy1Aj3Dfet7QzAFp+EvFixOtFB7LSt2?=
 =?us-ascii?Q?fsHNG7Fn/zNsKao/KSoMM2WKn77c6sR/86JObyvZrWfvqZRog3m/ZO1Vzg9q?=
 =?us-ascii?Q?iWFeBblwtK+4iXZ1d53t1nHvWYB/p6iuRxPymcOhlqPpe2SNLN+L3SSXOdx5?=
 =?us-ascii?Q?J2WwU2pyIWPH/ZalpyKJadZEqhAS+rAyIjkfamTIaH+3cjYLxgDc+RZHPlCF?=
 =?us-ascii?Q?5OeBNRG+JNzKa9y/9OrStmzyS0dlLuqQMygeOgleFZ6gsXZ88b9kJ2pLH74/?=
 =?us-ascii?Q?w2Uei33T7R/YjeBk/tCjLNhgMTmW2Z7p+ktFU1UrHaaNBl3YMUdr4i+nojmD?=
 =?us-ascii?Q?Ph1bqxpAPImCmLRDabO7hOOOoJumR94b9FX0c1S7DI/Tj1AkYaPINPVb6htw?=
 =?us-ascii?Q?YvXnj9RezPoWnSGjpSbngvg9w7xmFQYZB1ULZjVUN41s4EgwLCM1AmtA1myG?=
 =?us-ascii?Q?BvK7JzvE9gTl7I0L9Zed90rJVEScUdkLwYPpIf7A7DATaVgFz1RNYEcFh9Pe?=
 =?us-ascii?Q?kDG4xSYsXLMTSAn+eKjo+5wRnZFmKbATNiWGlOL0ValNtj3/Drs0TiOISoHi?=
 =?us-ascii?Q?QDBWLZiiSyipp3SknbgLJxm8wLPYiWDriCPoZPuo5k8WgpgG4gclhyhhTB0Z?=
 =?us-ascii?Q?gSBWDaejUl1v1hlYMWzsFJAH6sLRsXJlX76AcMg4X/vBTpiujCnaruGyGnf1?=
 =?us-ascii?Q?NPYNEYJFGelRaNiiezYQVemFuAgBX35CC/TlHz3QN0luMyfC4qcgY01CBZzg?=
 =?us-ascii?Q?rub1mdZsXFwOqtNZ6jbGEmZvzh6buFGvNcpyvUCNV7ByEw1B48ekvDtTgqfP?=
 =?us-ascii?Q?kKJDzQKFawQihZ6gd1zS378pdPSEd0IW5yH4SvuY6mODRvI7gx/AouxVcyJ9?=
 =?us-ascii?Q?x7I5U766awYRzZnCvGYwXcbdYxcU8G8TbiDRL61lrYNmEP+ALJ2wXEHW3V76?=
 =?us-ascii?Q?dHVHu095D4IUX0v5p7LWY4XaqiMtrOwa2It9HRkgmx7CR/1fB3bxV6fC1Oq9?=
 =?us-ascii?Q?sSqhjoqz8qRC6keh55tv3eAdQLmpJUOpUfJ2dAe1WBwQtdmT5hVyAPe0//7a?=
 =?us-ascii?Q?m2Z000yKGx1hEIujo7xPqjI+3hIXSy6TWdStejR3mB2Tq2WZIWZemzcFjEwQ?=
 =?us-ascii?Q?F7xFiNMAcx6NSpN6ooPIdVl4ShcQNDXOJNmLyKgUmgdIOQvaRgnY23Jiv6hY?=
 =?us-ascii?Q?Qzl6Nn2C4tTi5+I8c/kpDQFB1ISaKwmJeXaNDIj3EOW3kfJv5jd9BTM/KWk7?=
 =?us-ascii?Q?mZHe2Jnqf4/5Maz5rnZ7HcGc4PpAAP2hXcDgv2z/P0qkwK3hwTAMgs+2mten?=
 =?us-ascii?Q?EFfCBBAqvB21cD+zrdO9vkTa6pTHwzwBRuIc9PAsa3VyFKFNvcLLYQ50PopN?=
 =?us-ascii?Q?CPu/3nS3KHy4SnAx4t9B9IVow4wEMfH7zRjsIsWBF/hg/xl/dcL6NaVPnlxo?=
 =?us-ascii?Q?oixHYyzP7KY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJ/FHPcCHc+qeGCrGfJYpa4uIKcwQdEQitF+MWUuMJEVq95jboLLYIevUmGS?=
 =?us-ascii?Q?FlVwcBTgl86dzOeoK9ut9KgulalPUyh+5O0AYP/7Q7zvoBu05PlaMA1O6OFT?=
 =?us-ascii?Q?CZb7Qa2LgE8Un5SF4HGt3jXm0O9qmoXGTKg0NNxAffXDOmmpA7+SfLlnjilx?=
 =?us-ascii?Q?OyUmBWydUAgndcnRzpAsAQ5GFeOwgLQiI5Q6stZkKj04MLVXLHdb+51Djz1A?=
 =?us-ascii?Q?oELAS122kS0UR9P68XmhB4Rhe/irNJEqiWd1fYLkK8joA55xKJ1sNDh01bLd?=
 =?us-ascii?Q?4aePyH6hefsY0VSg7iXG3njgEOxyEu6Z0aQC5IUvYLHLL+KvREW3GstorX40?=
 =?us-ascii?Q?p4Go/8kHAQJmjr0ONQZN0GdeiyEf69kc2s8GhdSKWiLOinFguFHti9M0QK1R?=
 =?us-ascii?Q?NAYJYwMKDPp5VV3mkWp/hBd2F+S3cIA4/rPoJPvQ3tFUmvgDt3076mOhAy6H?=
 =?us-ascii?Q?vb7O7wPs9OgNAZte1aHy1SDxvrQaVeo6Q+EyFToSH1zTHQpoOgGcnA/W6AXv?=
 =?us-ascii?Q?rm24jFSVvMuK7biCB5aSbmOYv9B+7h/X9hCSnCmZLlIxjDM9btKy1jmhFpkB?=
 =?us-ascii?Q?P/Kcioecfvp60GKpDXGNkZrFyEJRPuUF7pyewwLFH9TxPqVIAVZZ+XLBh3Ga?=
 =?us-ascii?Q?N9iiWNDsjJWmuqANEh1wDsY5ZOBgrLt4M246d6neSv56xBhiejfPZfTo2VXv?=
 =?us-ascii?Q?Ov3X5tjjzw0F+DDYcHAwOAC2uUNm/quXl3Bb7E1Ub7emWlBzWKUkx8WxlRNu?=
 =?us-ascii?Q?K78qcu6rCvB+cmIzSPMuDNjQYQc1QQ5WQ5PsM2A7g5AuxhL7OjOMrdKHGsNL?=
 =?us-ascii?Q?9155DsUzg4nln2v5lWrOuOXfK3SqiWwV4jKCPj027AG+O7IHKEEh1Q0QfN1O?=
 =?us-ascii?Q?t0wyoSskyopvQcBxkW+EMN7mzi68dfK31RN6FGo5KPcPK1sODMOLkn4lrro6?=
 =?us-ascii?Q?f9xQ7l+GL4OUv7eAfF44f9i25aI9xND12ZNVb83qM4Vk1QF1pVMmS8G6w3MK?=
 =?us-ascii?Q?UWhUw0NHmsoUohDEZ5wfpMm0+1Bez2iH3Mn0lVo1b76Gzbvn2xYdoi7Vp43x?=
 =?us-ascii?Q?mPu3Ux0AmOBDV9O2/bX5xqp8vvjIOzlXi+jnjBwXYc2C1B8ZB7xDzEi/TMpq?=
 =?us-ascii?Q?ql2323YTrPKXQ9eUspaQdwSB+TQGGGEeZgYH2c6MYL9MkBIuodorxUTRn9T7?=
 =?us-ascii?Q?qa5gBC1ly56vXjR38S14C2OQoSqFZomUJgxr3yAhHRFhXwYphOaWRccK6mhn?=
 =?us-ascii?Q?pfeQwtmlacuahUp/wOFMD94pvZBdK9ImuKsfwRholsJ6xFCN7Wbl4krg3+G5?=
 =?us-ascii?Q?G/o3+kJwfD2ynSY3/Uby0C1PbXvQBZ3V8DHX3Y48KvnJNMjbos0AqN7zaf3p?=
 =?us-ascii?Q?LrFCsRdSSGPfcypxO7fbhDyd4DIx0qgPi4amsNkWSHjLu9eJw76LMEJCoQsJ?=
 =?us-ascii?Q?r52iUF9gocloBhxAUCVhy0hUjofsJMPTWBtvtPMUEqhykIGmYJPSqBHZgiyM?=
 =?us-ascii?Q?w4vkZ3kaCE+WGKB9OdijxzMuQcjsTRJmWNG0If6fiE3XL1A8/oSsYYlR+sBv?=
 =?us-ascii?Q?t/mnJHlgkx9qLlUC/8BMBLKs5EUoMhhQSQdXb4Zt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa632f3-455b-4003-6672-08dcc28503c0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:32:53.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2tmFtKJKIbkTWWWb/FiwAKHYtuz58CO9GlqU/AHyQ18X5oYw+U0bY/2Xuf23Y0SeSAvaGwvHdkpiH1LXsT5Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/ethernet/cortina/gemini.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 73e1c71c5092..90a14e03a782 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -109,7 +109,6 @@ struct gemini_ethernet_port {
 	struct device *dev;
 	void __iomem *dma_base;
 	void __iomem *gmac_base;
-	struct clk *pclk;
 	struct reset_control *reset;
 	int irq;
 	__le32 mac_addr[3];
@@ -2326,7 +2325,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
 		phy_disconnect(port->netdev->phydev);
 		unregister_netdev(port->netdev);
 	}
-	clk_disable_unprepare(port->pclk);
 	geth_cleanup_freeq(port->geth);
 }
 
@@ -2403,6 +2401,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	struct device *parent;
 	u8 mac[ETH_ALEN];
 	unsigned int id;
+	struct clk *pclk;
 	int irq;
 	int ret;
 
@@ -2453,14 +2452,11 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->irq = irq;
 
 	/* Clock the port */
-	port->pclk = devm_clk_get(dev, "PCLK");
-	if (IS_ERR(port->pclk)) {
+	pclk = devm_clk_get_enabled(dev, "PCLK");
+	if (IS_ERR(pclk)) {
 		dev_err(dev, "no PCLK\n");
-		return PTR_ERR(port->pclk);
+		return PTR_ERR(pclk);
 	}
-	ret = clk_prepare_enable(port->pclk);
-	if (ret)
-		return ret;
 
 	/* Maybe there is a nice ethernet address we should use */
 	gemini_port_save_mac_addr(port);
@@ -2469,8 +2465,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(port->reset)) {
 		dev_err(dev, "no reset\n");
-		ret = PTR_ERR(port->reset);
-		goto unprepare;
+		return PTR_ERR(port->reset);
 	}
 	reset_control_reset(port->reset);
 	usleep_range(100, 500);
@@ -2532,24 +2527,20 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 					port_names[port->id],
 					port);
 	if (ret)
-		goto unprepare;
+		return ret;
 
 	ret = gmac_setup_phy(netdev);
 	if (ret) {
 		netdev_err(netdev,
 			   "PHY init failed\n");
-		goto unprepare;
+		return ret;
 	}
 
 	ret = register_netdev(netdev);
 	if (ret)
-		goto unprepare;
+		return ret;
 
 	return 0;
-
-unprepare:
-	clk_disable_unprepare(port->pclk);
-	return ret;
 }
 
 static void gemini_ethernet_port_remove(struct platform_device *pdev)
-- 
2.39.0


