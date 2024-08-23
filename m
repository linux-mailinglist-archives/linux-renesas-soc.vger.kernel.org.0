Return-Path: <linux-renesas-soc+bounces-8099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD395C61B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22D781F22127
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C1813BC0C;
	Fri, 23 Aug 2024 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Te6xy79Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2046.outbound.protection.outlook.com [40.107.117.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272813AD37;
	Fri, 23 Aug 2024 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396794; cv=fail; b=U2N/IDLvccZjV1ELqLwCAGZw15GZHgupix8pZ80CcmVCVNOpMK2okP/RWkIzqmEvZ2ZqVDrQGPG6/kXOB2NLbPAqcKR1XgF8kK4y3qdYPTEJNrxrbKFHS+BWeVzGvCeEjir5zaWRd4LNM7tvM9rKGYX0FqUSi93pOiBEPBp1MUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396794; c=relaxed/simple;
	bh=iJ643tR7zH3ZBtTySjCVJyQlQQK4LHdROae4Wbgdk88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L4/FwfbhA/a//hw9VfTJ7VeuaigBOOeVDBTDdLQb+ciN3dKHe/ajc7Oj+rkt0VmMz6Xe3tECoxT99ZC4NrIa8JYA+mqFFRwpkTMNQ7xtSf1K+29OgIwUUa1fGQNEqrDQZid5Hqu/zNJKKFJHfWFHllsC95FFMopLC8xWGUrJ0z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Te6xy79Q; arc=fail smtp.client-ip=40.107.117.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpaawdUAvEXPIgdV2Yk0/2QCee+1wpUzvAgqk1xvRKIn3kVLZYEHgE7dMAzY9BQdnv43JeCldXIqwZwjf4cD5Q0iC03m3FyXBUzpBPkZ+bA9ve/l1AhDsBZ2q/bzuwQrFWoFXJ4YbgV/YI4jQeKMSYhrX/ZktLBQaToqdCuIhH8yNR2Avavc9TncZ+4cShV9qQ+sTwZq6mi5Q76K6/W9z+O8hdjMRwZbHyHDT85U4zEU6aWjGhFaFovFehZVjIVwW5RUz3v6E5TwMI4YQEis+w/jcnrTzd6XiPuLOqU6IxdvSOtwlv0AgvueomTbB9kwA/q+eJC8AmuN0hnFzQHcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIMUzEZdqDpYsZCHo/7JuWKu2sl4AMxMk+gt1puAWYE=;
 b=gLoA0LuRsS3HN8S7Q1G6r4RsDxVt4pHXlpmFWQFwwzwu5Lz7bAPQ5l5Svn6urHw3IdyqamU7nPBUk+foeUGprwMNswGJswQuAl7rSjTjwykD1lAwOwMjxbhQoI7sEoHfS8F7c2PCDnoLobgiPvlAAd2JWvf0p7f3+OgHXJOr3EAHWij65VO2t0g2e9Zbi8bKGnCyIncHDYGbYVK1IGHnoStIUh3tsdDr2i/oNRQO2mkmsfC/ewEaCGTx/5Ppv5LNLlxQzCyK538GflyZIhplihqzp4K76vW87g/58x/TCNeC2qnGfopzLtG4cmBBesR1xM3kIaP1xsRvjFEQtFXIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIMUzEZdqDpYsZCHo/7JuWKu2sl4AMxMk+gt1puAWYE=;
 b=Te6xy79QjWxKGdvn09njIZCpHyDsTgwR1frEgkl2HKuYQnau62TroQgEhBd7xtqUxlJsT5NEdU0Rfc9caj9rCiDnGayAzZwBjDW+/9hTqU3j+bOoj/iW/o87l36pme6c5EeBih9bxeYZmGGkhUcm2ZyPysPTxmPbm6EYZKNiAy5RyDK5jKKNzS+Xid8lL4tvJsccvbqE7xb6VK7yfIVvy+W3bZz344de1oBSygMTofK/EEgFXA+60GpyuU+B3BaeDdPDT8OcfEZ7AY4a0lmJKjs7LkNZD8JlKiXzvh68FbvZJUpwm96Ce5c17o5+EcZfsQf3VGJKNuK3Zq7UAXzrAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB7069.apcprd06.prod.outlook.com (2603:1096:101:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:06:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:06:30 +0000
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
Subject: [net-next v2 1/9] net: stmmac: dwmac-intel-plat: Convert to devm_clk_get_enabled()
Date: Fri, 23 Aug 2024 01:21:13 -0600
Message-Id: <20240823072122.2053401-2-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1e2002b7-4a63-4d66-6a50-08dcc3421d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YfgT8ccWrFUzAz5/l3D/B6tvian2DNvzAqOhoXbDBBBowxxEwl/DM1p/ZQ5D?=
 =?us-ascii?Q?mTR24MyQ/3ahjZt3UpfUauxUtl2bXgNzv0ep8bvFDOMfie6U2n66TiftxODW?=
 =?us-ascii?Q?JDZ5Kox00dR3I8tK+JvydwXueecBzPxMM1doDLd4NUbjkfkelv1qP4QZd4nX?=
 =?us-ascii?Q?vm/2Q3qS8jFBkqt277/VeJcNKd/TY1fxCjaIgERznEL+MapZpLBbxC6eH2bv?=
 =?us-ascii?Q?N6XyCrw0W1GcKvXNIL+15WSYSuBzaHqTsli+bXrk1bvrjivFBmSCFT8gKwqQ?=
 =?us-ascii?Q?rwtxeBnZH2c96Od4wJzG6DoG7ROpUvzvQ9cD7FT9GhWUCdfw7Yc/gKz3iRWj?=
 =?us-ascii?Q?nH+nSSHcJx1DnreCVa3lpWWmz77GPWTsStgO+asZBTkVelZQiKraGWhZC8rV?=
 =?us-ascii?Q?lUgNjyIGMfxoSA27ErXzV3Xo56BMV17J2GWoBE0cgZU5b+r+9jWEFvQbmPA4?=
 =?us-ascii?Q?MCx8SQe43fuOHuzgiY1OGP6b06z+XqIIDsPnDQABDzW2Y+cGFYxItKYUOoO6?=
 =?us-ascii?Q?LdNP4ywBiyPkghgp+8MswcnyLIU46J8LIjOBZGSCyD60oGBFPf48zkcRiDad?=
 =?us-ascii?Q?RqnA2Im+oGczCr6TRpaZ8NB3s/S2kDX7DEkq45yHD7nrn+f8xWDqIVlIQjSd?=
 =?us-ascii?Q?Lz5I9Ko13BTZvMEJQ5VXWz4OduQMT8rq32+0J6ypwz3oVx5i4agwnxqPBxuY?=
 =?us-ascii?Q?oKBHg5VvrjjaxnPNOO3GGwiseoFgCGMsXS8WaHxaSsBJXYZuDmEKTsBpDMFk?=
 =?us-ascii?Q?EDvCs+MhzPxUjkKXA8CO2vjEgqOa9aTLCXTFDeheCl88CUQolpvtIdtlWbIj?=
 =?us-ascii?Q?T5tnwjsPs0AaQE8ZAjrrninMqTVM3218OQDEYWlw/XJFGlx2Al9jIieb1ZCc?=
 =?us-ascii?Q?e98ZKYq0HQuhj26bhT3dAGHWR4Vrya+c6K/8shymMr+Rflfrg5VXt/x5d3jd?=
 =?us-ascii?Q?inzXDNF8OTeQjYJIqPYgLbtDnNiIyT3uzc6yIOEqddyeBGP4/aGTu1BJi5pe?=
 =?us-ascii?Q?7661Y1FAkJTUVUEgOMPW1VP96Llzg4gdZE2criQIgvUnTpLMG2j4dzSIQOmu?=
 =?us-ascii?Q?5R+aF/IPACFZpk3lxF+feAaw5ndovCG6ttb1/teBduLeBh7/eNvRLJTqUMYM?=
 =?us-ascii?Q?MHSaFAfQtlLxwke6qDCIOQigBfCLL7rGz3L9C9/B+3fomcb/dZ+VD1jArI0l?=
 =?us-ascii?Q?BauECXNJvdTERGpnVnWG6+dHUjBD0lxenL80pgKxElnL/L9hFytCZNs4uu9i?=
 =?us-ascii?Q?yg7VJOeiBFm6TT9T6023wqx0eY+OA+EfA+tu1YJbmQD02vMLjwJRdKRbj3tD?=
 =?us-ascii?Q?TwDM8xEh3k9tQaQ8Kxvs1VU7ZZMjd5NbiMmtiLIL/ILzaC8fczdIF35qfwZc?=
 =?us-ascii?Q?r9oR+1LoqaI+CxGKSGrHV4wm8TgWrz8Vfo7BB/8AyBFUAhqguOWEhgeg1920?=
 =?us-ascii?Q?PS/BwvbA3zc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LghRyacoJW+eUJb1XtTx9vYS1qWYzuQM+hDqwXDa+k7ZGSgYQ3pCQVMgJ9Tf?=
 =?us-ascii?Q?l5nJ69IDUY6I+RXqD5piAeIkDgvBjqqDJHwfe7Xk3fyG5r1+WR+7MAv//9Ko?=
 =?us-ascii?Q?E2IMgM2LAkTCk5xAqztSLxI6Dc6Fo5kiBGcfPMbJfpk75ZZ65GsBR84k23++?=
 =?us-ascii?Q?4bdfFeESlSJkVWXFxvUoLKizv1oDM7nd+bv3xWPW9z8Q2OqqD/HfRRRkMZAo?=
 =?us-ascii?Q?J/1XUrf968MQbmMSX2OyjyQ3laEObAqjbmKfOeamFJA7xm9I0BnktkvVv1ee?=
 =?us-ascii?Q?4S2Ce36NhQn+/Hnnxc1rl08jElNJfByKRUxKyK982F1waxETMrQOue4wXtzI?=
 =?us-ascii?Q?o0NDJa69L0CYRz6Il1f7UY2uuafDftuG1zu+ZWSSNTF8U1Pv5II2kNzonDYg?=
 =?us-ascii?Q?nUxIDEI4YAwzcInfcfJ8k0UUpGq3vEdxBkjRARH6Hp3dEdcWN5xBKlzYCFYz?=
 =?us-ascii?Q?rGSv2NuTW0LgA4JfAxCd0jZnkl0UzdOIGXkjr5gdkc5mR2ousYLTwL73ua0s?=
 =?us-ascii?Q?HzV4ES90RAxph3SHe45Qr3IDy9y1lfFXFtnbyxkQ2hH1Z+56Bg2OeOASDRF+?=
 =?us-ascii?Q?E/9zVtUGHY3KbeS27RXjjnwVNC11D3GAew1MTt9IliGyK4hN96rUYaNGFShJ?=
 =?us-ascii?Q?ZV5pVM4Xc/mGZGlj/3GxndTdx1XRhAltLIqn47Z9XdK3AFJ+v5oh9ei9/Bzp?=
 =?us-ascii?Q?1X8JYMH4vWluuDOZMRokIYAtiz+UvokHlpZ/Pk8xs2YYxcLMYyUNzSa04MXZ?=
 =?us-ascii?Q?erxiMmVY4dKZLfXyCOhqSm7EUOtJEDyK+fp1HO+OH8fORVKQqslwXbsKkxL+?=
 =?us-ascii?Q?mzX59gyMwRlbiPBlyC3HGfFWrGntWJK8XHfCI4hL7K+xLRQ9pll5f5JHV1HG?=
 =?us-ascii?Q?3l4ww3xtjSNfDXzPtNWPOPSa3fUnDVl+aKOJe0HhHPLUsvbDPX8IMhsiMixH?=
 =?us-ascii?Q?ESbohN59vLCFJPCNODuJFkzU3ME5IkiNa2g7A2GBigFfWBVmv/wJjYFNjKkc?=
 =?us-ascii?Q?6a4r+YKiLAPe8Km7lg5IA0ttj6ZvHmK+QqKHzOLEu7l0xlBtrkaVyF3uA9Ph?=
 =?us-ascii?Q?be99FPFVk/ZRSeAItbubhVf4SeJK1s2A+oSHHMkGN+GpN76EaipfJX8Bb4oN?=
 =?us-ascii?Q?9IqZRze3Ng7VIAlxxOSrOhiEz/RfMkxspqGbetu86aDw7GG/ENkVEXlVikxz?=
 =?us-ascii?Q?ILxym6s8Z5d7bbiyKBB332Xc3bTfXuiYjevHP8+kyv8KI5zna+sHBPvk90gP?=
 =?us-ascii?Q?Fxw0AY5eOVIFb16PGbPK6mKo8UFdmvmSV4w1jDkxa8lbjHBh9T8KCajI4XL4?=
 =?us-ascii?Q?4MKXN+2B4+5F6FNWIF87INIs0ya7bYYd81imTKHiB7M1nQ9GbbpYcOiuo97s?=
 =?us-ascii?Q?UYuTudRkuXZzyUiaoH6O+T0KmGd1kgPjnN5+x4ZHOd85wOfBZY3FV4BDncNC?=
 =?us-ascii?Q?tD/nb2515XVICR0nn8ZaYnkv2s9ZBPmxWHYqFY7tMEPqlLQOpurr40kjWmo9?=
 =?us-ascii?Q?vZW9IUfP+53dy0e9wijiky+tECYjMR2M05LJxGf6QoyGlyXxNz7os6hM/MTI?=
 =?us-ascii?Q?C4wZV4i15VGK4cdwoyztR7R1sC6unIweAPldmxlm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2002b7-4a63-4d66-6a50-08dcc3421d1a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:06:30.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFZwju7BaTjroZ5O9rKJwORXPK/mymwM7MZtS1MsQ1sNGxzYc8KzScyoBtTlFexN7cDTIsl2hPZd7bk1hw4eeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7069

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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


