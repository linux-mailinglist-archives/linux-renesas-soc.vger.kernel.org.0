Return-Path: <linux-renesas-soc+bounces-7994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34BC95B085
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2973B2485F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3991A17C9E8;
	Thu, 22 Aug 2024 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="nFZ+YeQU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010055.outbound.protection.outlook.com [52.101.128.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F917C7CE;
	Thu, 22 Aug 2024 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315573; cv=fail; b=sj7smJzgpiGwCSaaxKyPyXGWDW0VX1rH18WoPwXgHY+MKQ5QRLoQ+y9RfFBEUo9v1Ii4X5TMeJITI1O21hUda5ftq3iHyAfu5hh1g6BvmFUL4pKFwgAkUFXIKT7hqVUoPQitmzV+r+ieMgCKqr/xyktSvZsB71n37Nd7pUmvUxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315573; c=relaxed/simple;
	bh=t503dnBZaOZj6kU1x+FB75B6amzUjhz/adf6D6FdyfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DNlG9yARA/2CQVzc1QDX0fLBtWBVOAIpuV+JTJrBeEDLDrHmrVK42hIXusjVg5zfis/AHjsRm1QF+y+LngbkXpOWs7uzY5a0rkkbRDzNjeVH7QfHo0MUED0zM3UcO3mOIJxA49CoBNNJSj/M750XVvaaqiMbFdf7mUzWqNtwU2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=nFZ+YeQU; arc=fail smtp.client-ip=52.101.128.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACZSo5BQltenrdp4/zepKk0Ig/ffDKyfUjhMXBQtdmN2cWNLOjqNQMNs7olUJFxR6Qf7g18Q/k1v5HmgcYJUGmTH6tReDOY2UbEfTjb/9pxSrzeNBApYgedSz34GSWAkD99zgc+M0mrMKti/lj8pY57znYQIX49UMXBxtB5YeT2WKxppUba1ItAx8hIvJ/xiIcHF5wlDTtUK8II+GcmvAUehL6mc23hQfppHsfl5yEHtjlxgAqQ/nEh5kbptHIHeyf51prx+OMAygfNYeNLAeW3sTUZhJn5oU3PZ4JLz8snBJKpUsWyOD4mUyvmmSQERxy93uB0KS327wYUvBuDhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHKPfG9hdm+u/TzBm+4+OpJDRI+kGysmRTURtJJP2qM=;
 b=gGpjVLY0quIMawb+LkSscB+FnW+R/MJ/UPAMNEXuQf7gpCxLqlnojrZccKMqqdewJKVLLxarBG+ivqZ4ChZ+NYkfHM8ecFi8dwYE2cXfDm2/4WBeQT7XfZUl/6U5MumsaLNOH1eKm33ib4L+zkPFCcDnfxy+Kk44PlVjHpwl3xp5jTCy+UHKqiedAU+F1Okw5aecumq+MEnZM+/Dt71vnpEUEhXRWj+svPRMDxgA4UArUREFEaMT/c0pzPBE/46W1m+O9pGqlD/28rJzPnqPzupuhrjJ4P0O2Nu41+0UAQuHf9BXuK9RlUkKd2jh59BLJljU+6jZwmdsPuNLmNzS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHKPfG9hdm+u/TzBm+4+OpJDRI+kGysmRTURtJJP2qM=;
 b=nFZ+YeQUgr9vVONa9D7WPSZMfABfF+IRtx8/jBdidtdKlNdklomsbWJITAXIndghB1CWy4q+QaKY3kwOohI5bG7uDPbmm7F30mH4VYx0xs4fbVa2glsvddgnvizETzLY1Yd50schRb5wST9KP8T4OEIufpOByYhRegARr5Eo5s4QBuuZGGq6IvX3hbNiewLycHrJWLNIFp999T4VDwXwzFaKupaN5Ud/+6Xp00fDS3bJhPzNqdVz3Ou6nPBCpygkcXHdzfinSxIpovMBoLrwiZi5Y44g0WpDIB9ZRa/3pBA+1xKx1z1JUtokliSZrHndkqLUY0xl9DpbaZXCNwCfbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:32:48 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:32:48 +0000
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
Subject: [net-next 2/9] net: stmmac: platform: Convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Thu, 22 Aug 2024 02:47:26 -0600
Message-Id: <20240822084733.1599295-3-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 92ca2faf-43a3-432b-603a-08dcc285010a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jnAwyWMKqoV3sq6eqtWRhRU6XhSz5a8HzIrA8bpK0FtjHP8w+spHLPLAMS08?=
 =?us-ascii?Q?+7NU0hlL4D9jF9+ZiV2u+9Y1xY9XLYOkcyb5Ro04ohLNluPMog/63DZO8g61?=
 =?us-ascii?Q?By7CP4jVSywpMr0Tfzp76ZJP0WLJpnhHQz6D3HbXlgQ9CjfejPfv5tvaG/rT?=
 =?us-ascii?Q?Ywtz21tIdDOYzjc/PwMSv59KhumQR1mJc34eqpiMAJBCPmttQEmXA4GXeQPr?=
 =?us-ascii?Q?VB/iw6DDfpqsEtQYj5tMNNEEdiRO/6OSguNoZaFKgpbKd+h03xNeUKnftCBk?=
 =?us-ascii?Q?3gOtZt0y4i3fH0gSw4ryfrHN5m8n8WCzuvODu+CLMUVLOywcYdaRoZArGABE?=
 =?us-ascii?Q?fmq5qkompGxkgV2VumRnEW5Tz2Rj7HU9EY+5nq0891hXq8lpmtgdYw/y8Qym?=
 =?us-ascii?Q?M7rCqusi2bnFLtegzJBkNd45WQELLi6+WuziMcRzBN9NTOAwCVOFdqvcdAMw?=
 =?us-ascii?Q?gqvhqikiNT6fTa002UQkaOfBfmRut0tt4V4P7fAs9C1USLbA3mVBS0um9y5f?=
 =?us-ascii?Q?wBTybgFTyebffh0Y0rvTDYMjheKJjlpZP5BRPOS/LKlGdDFoYBAVl0DLdykQ?=
 =?us-ascii?Q?c4rTmGewsUsoRHOPrL54tMQhTo7jyvytFOjGZ6hp7XCEfBlFDJFjT6HEzvqR?=
 =?us-ascii?Q?ms0af1vQkJWu2HmvRzrRonvQUIWdXSHRwBqEUFJFA4cVbgayCQ2g5SOzE/J/?=
 =?us-ascii?Q?oMB2KML0j/bZrh6bEAUenj3ga7AbXsNJ/9cF7hE9DLkOTKRu7sbQxeL1OLCQ?=
 =?us-ascii?Q?hyilo1NUz+pXkgleztM9R+E5aP00BTlU1gV2bfSZMJhfq+5wjjildVWNURPK?=
 =?us-ascii?Q?rY5dOJrE5JYUmHOKFCNOBYgNM1TXYZ6CAuE8VX0n+Fwfg2d8aoRQDlS0ZE5H?=
 =?us-ascii?Q?1Q0nx4dKtOQizP9nY5TMlwG2btSQelDUSP+qXWBsT7a1rk4TGG2fuKzYVIce?=
 =?us-ascii?Q?bknRFVIHdyIZrXj112j9RXbBO76rVLP+UZ4sGaPvHF8CCfqSIihBJms2MaJ9?=
 =?us-ascii?Q?NUw1nKl0EoFxJGBMAWe57fKLifywV3CipS2Lqv8kFanjphCSyjQGZklsBWSn?=
 =?us-ascii?Q?ImrAP2b9bs6CTnq8octnBpnavR4FT7/2LrClRG7JPnbFyWwFTpJDq27+LFR1?=
 =?us-ascii?Q?L2ODdMG752w+RlHz9TeeXLPgdukTXu9429oYe+oXBE/2RSG93w2itFcNetZ9?=
 =?us-ascii?Q?RiDMKZ07yzq5hkuefE6cU1i3WZrpsXpEG2kVFagfGlBwthhg4pk/BP10qRjq?=
 =?us-ascii?Q?BS/58jLEtD9xmmGVfbXfihw9DIRY6A4dg+99drMVCg6JNkx+hPQxPgIOOmi4?=
 =?us-ascii?Q?VlNjsK93/rVgVlYa5xs+rBR54q6mX89WTWgqvzO9OVDZKHj5G5z/enQEU0Ri?=
 =?us-ascii?Q?kGH4Pes2POr8qf8UbPSwr/gWJ+YYJpxytBUiH6O76vRmVnn/kA//Zk7V0hqI?=
 =?us-ascii?Q?YiqPSpAH2ks=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rvxCyB0boD3YTLBNSoGbztmQBde2kP0yNrg0Mt3vFUSmKzf0KZrbcizz25vs?=
 =?us-ascii?Q?Af0zJgAAQqJBw9Mxwt/9P1iZKYXTV1ER0AH4n36RcJLOv29fbl6+ImH7wl/u?=
 =?us-ascii?Q?RPyTlZy9lmx/I6EXDOrYQeYi/Guy7VUuPYq+scz/INQae6EbL6WeqIdTDgrO?=
 =?us-ascii?Q?0dYtMmaM8xnyfbcQMg51WJ0FXDpXTEyFICmwbIuxhQQeyYRgNXed7X6uGGOf?=
 =?us-ascii?Q?WXD0+OMiRRy6DTZVXp4fD8V7i8qT93pjTIu+jyTW46WiNlxKI1gD0n+Ajk5U?=
 =?us-ascii?Q?s47sHIRp954AAaf2CUojsAsCLIROeOiirBpKA8U4Vh4TGBQJJVKOlFRWZ5qZ?=
 =?us-ascii?Q?hFEMHkfViWjiSt3GK+pVTO4XXHqluiYpMWx+wKwqzwvNpxOgwG18gf/Iq0xd?=
 =?us-ascii?Q?Bp/QaYIcfhvAFQNZSynYYiTdDyI4Cq+ywsv99ZFvNKjn1LGNaP2xIavTEJib?=
 =?us-ascii?Q?2bpjWNTvDv1/TRuGJI5J9PUpCd9ouWQqBk1A/8M8HTG6BSStqScZZDSdSHzq?=
 =?us-ascii?Q?bSGzIAQGVI3Bdv+Mfx4v7z8i4Mjsa7bqAmU3aHEte0s0S5QyxHYBPmSOPQw1?=
 =?us-ascii?Q?6iKlpyFZKdoOlpfwkN85W1qNQDrccaQe+oY0mb/86AobjU5pdbqOVYc2OZR2?=
 =?us-ascii?Q?lNhnCH0zDSDx+c+wry2uuLLU8d+ecFKt/YRF1QkK/FnFyL+2rpSahiHOQG+j?=
 =?us-ascii?Q?QlS6LTcU9hV1fjs2PHYOmpwV1ZYIcDPSlY9gSlmWm0nPPM2mgxk6+UpDUTRS?=
 =?us-ascii?Q?EZeJAhOPagGMJ/7oBXvB4kjPufVx6PMJ2BjVEXavkNSpZhJVyaKnweaMLeJH?=
 =?us-ascii?Q?mfv2NK/iRPQOQ0IuSXjjWXsMho9OuFOQkLz7/jDqUYKem5g3q5PUm9U83gea?=
 =?us-ascii?Q?x50/cKAclHgQYxnyTiqGMCP++ZnxGy17tSeBOLvlet+9v2IWtcAV0U7NMI0m?=
 =?us-ascii?Q?CueWIMaTxmSjSJnIaA8MqJuWotEltG5qxdYt5HLESgG8SagpeWnF7B1Ks2z+?=
 =?us-ascii?Q?YUKpW6RLj0IyzVIhjjPgHtX6/Wxv+6HaZcl+2MRRFjCrQ5BWJqJN/sdSI1eM?=
 =?us-ascii?Q?Be7YSAHV0q364HESoXDeRsW8aA+icP0GNQ1lm+vLgXp3P7qSQze07bL3Tywt?=
 =?us-ascii?Q?0uTlNm6cd1oiSBFDsJqz3afA5AQO5JaU0PfKcWYXE6ZHeLS6VCzEOwRSMqwg?=
 =?us-ascii?Q?0u0/zo546Sd1LLI/DDTuWmoLUFGdjK+MgHiaQV03mXO4oVZWiPrfIs1saQ5x?=
 =?us-ascii?Q?Xe8eUhnp8HjdsPZPpdVGD2A/l635tkBu0hlZfQkawwGT3WmxAjsznE1uhOlP?=
 =?us-ascii?Q?Rs4717jy4DoQirMLO7xBzcvHVCt0234/upxXblDSWAkCMKF+c8P3OUltq29C?=
 =?us-ascii?Q?JLhNgBtID4Y8QNvrgRmfUJh4acGsmK4ApENrXs6FjENc410gjEKwoY1B5hzi?=
 =?us-ascii?Q?6Jh+jdBRwmZ7GUTOqwOr6Rnxef6bztgbPlkNCKLwd+XxLRsBF3TZzrAkULB+?=
 =?us-ascii?Q?OeG8uqHMSZ00xliS/UPAsELo7tyy0/ko1LAWkKPAwDgXGkLPvZ5L9ckU2xFr?=
 =?us-ascii?Q?dNXxNeXvTUT78RbubnaClQ9B945AskwDrMtBD698?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ca2faf-43a3-432b-603a-08dcc285010a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:32:48.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOMAQG/0p2K4ITFdJ9kG76Q5fgdC5EA2TIPRBlCL7veIWcBVCWxUiyIZDfYhFfXhlSVhSaoAhMx9ZdhFux/CGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 34 +++++--------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..9aba6318ee77 100644
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
@@ -615,21 +613,16 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
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
+		return plat->pclk;
 
 	/* Fall-back to main clock in case of no PTP ref is passed */
 	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
@@ -644,26 +637,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
 							   STMMAC_RESOURCE_NAME);
-	if (IS_ERR(plat->stmmac_rst)) {
-		ret = plat->stmmac_rst;
-		goto error_hw_init;
-	}
+	if (IS_ERR(plat->stmmac_rst))
+		return plat->stmmac_rst;
 
 	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
 							&pdev->dev, "ahb");
-	if (IS_ERR(plat->stmmac_ahb_rst)) {
-		ret = plat->stmmac_ahb_rst;
-		goto error_hw_init;
-	}
+	if (IS_ERR(plat->stmmac_ahb_rst))
+		return plat->stmmac_ahb_rst;
 
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


