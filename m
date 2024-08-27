Return-Path: <linux-renesas-soc+bounces-8336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3139605F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 901F51C216A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C434F19D8B3;
	Tue, 27 Aug 2024 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="EEwrQFCz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2067.outbound.protection.outlook.com [40.107.255.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B819CD08;
	Tue, 27 Aug 2024 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751740; cv=fail; b=KnbEkr927X8VID2rgp/IHUAQt/4n/JnA6H0yp2IHrAWRY0PumNOTpY9uy3pViahf05x5DI5WuLM/2ocRzf9TEHPyTuDAt/XSjdIofPEFkNKngZWDEa3WKJ/QSIYeVvkjUkCBJd6cJH1usARmjnKiNtOioL5Y5/yN84Rb46LiARc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751740; c=relaxed/simple;
	bh=iJ643tR7zH3ZBtTySjCVJyQlQQK4LHdROae4Wbgdk88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lzLNfzBcY3LNP4XNe2XTgUj9OUlY1496RiqIVKCrW5SYhTqpAVAI4MAXdnOecZVOIQ3RWhoINGvv7G+P3OIcUGIAYGDFrWykk4ObbxpxcH7RjzOejmzYm/olxQ+ujdyAvn9DThdm7SYu6Qu6U9VqdmZg5nVB/Rm3E+qMxHgz37Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=EEwrQFCz; arc=fail smtp.client-ip=40.107.255.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rg3tRNzRfCGF+wktlBltOoKmcRuD1K2aHp4bIIzSBUdWrbHUxai3FeepeiZw2oJOppOD5kldnvxRIJeuB+wZzi5vwWLBEmxF4Q+4kDuwR81iEv0aRuWsTWUuxFbGSSVtGvVRD9I56uwQL/1wTR8g9fNs3UZE2s8xahdHz4ehAGGi/xhUbQELjjwlyeqtcqcwmF0VJkSC09HY5mHhOj26wXfxNeIe03rp6szm3EDssUFqIMPuSRFt+V2qVUw/4wSbm4vBFEcdAshCyFAKNiRkWwY45ApuLZEqx6wALfI7iFOwTmh0TB6OWVssgTny41dEhZgvtUdkISVn87F/oJQyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIMUzEZdqDpYsZCHo/7JuWKu2sl4AMxMk+gt1puAWYE=;
 b=R7VopJFEezMaFlB3+HeL/nPaom1tanOnkXMacJ1WbQVrXfULCscj7weWjYc4falxSUhTT9BSdm9kf5FBY5wEvu2kl63MyOw1jGN/mGQ3bE3/YUG9sLWpQ3wBBvXfOpRyl0O5EXsuQEjqfs1zqX/RvF7yBSXfyBraTTWvgwarBkMh6Gp4/kk9nyK6OkEFzlftCvd5eC7NA2PadoKvwACDXdrS7GNToNDwYvIvlG5igaEHYBxmzlNnulNW5jX+ZNprevbUPSAwznanV1HSXwUO2B3J1EoKidVb97KyRwGAnynD5x/YmEiQ06KyhispiiyqpFl1xhw75UL33K5thRUjcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIMUzEZdqDpYsZCHo/7JuWKu2sl4AMxMk+gt1puAWYE=;
 b=EEwrQFCzufPhNty0gzzCWEFJhRadwdS9PH5fqY1pClBRTcqBoCwAaK7SdBmB0XT5qb2BUw72eDQr+p5AQ/kpooCd9GhkLjll4ufOofHtIeSM8WdBGsweiUWeWDPzvPiMUCmO3HUcBBlsPx7HEzmqbWijJMaJMV0B4kN0R5qxOSSrTD6Bn6DNSNatiTtH7rvzIX3uXL7yuJpGNfszZERVC4caLnPfoVp97XI4RWC5SWCNk446pEN+Mfs2BpZ4NFJXZbbx60EOmSe2Aw8RXp463oAsiSYlPghi/chdC8goysiNLDx/sVEsfe6GSpV7EvvgsASAeRNpuSbn1/DGFUhIBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:16 +0000
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
	Yangtao Li <frank.li@vivo.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [net-next v3 1/9] net: stmmac: dwmac-intel-plat: Convert to devm_clk_get_enabled()
Date: Tue, 27 Aug 2024 03:57:04 -0600
Message-Id: <20240827095712.2672820-2-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: fa1ebd7a-673b-4617-de23-08dcc67c890b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yGz00mUNiiJnj5C8nhWddEg0JtD8PllI11HXWtLBJ/uzXNf/tRBQF92+iYeB?=
 =?us-ascii?Q?NOD1SgatSMY8qqCRzjgkALWRQ8GaOOJjezXhS43Qldn/5G9+kvaMhyjSzP6R?=
 =?us-ascii?Q?mCyGTlMe69GZrXjM6y1yWxOTwO2zjugek4sU74lLwryjOC7eF1qtjrb0utWK?=
 =?us-ascii?Q?2R/xE+263C7VD9COFRBcR/of4BehL8E2qXvlszqh3RbunDCrB2L/CggJxlti?=
 =?us-ascii?Q?LruV/vC9ITxsIV6nXUOklmjNnahc9sBJQZdE21gs/jKkcztRd9TvGuvr5HzL?=
 =?us-ascii?Q?lDfMESteHhSNZJgE8NBTFe+4ONdV1AZCtqpv3f4WOH6M58doUq9dAyfq3UMB?=
 =?us-ascii?Q?HQTY9O29OjryB+MaqnVXTnpBGa++ebjrJeBBUcsiE+WL5ibiTPtYbc6e192J?=
 =?us-ascii?Q?AvhzeCMcqXbOYrP4VF333a4wrtEIx6FbjZA5SeQZj9+839yvm4zdl+PBNi2K?=
 =?us-ascii?Q?Eo1PM2XcPwYQgPlrH9tN1aJBCwUVa44WVL/b2Etp/i54NiZ1zOEPtpSObKAX?=
 =?us-ascii?Q?DFBHETwnud49bbN0A3/P5cJb0t8M+mEeCdKrHdwYBBxis2S92CR2bajYgW5S?=
 =?us-ascii?Q?sXEw8Ee5JhplMqn9nnbdZbyT5BL3fVtPe3wcIi7pQOktaqjFAQLWX42AxnPW?=
 =?us-ascii?Q?g/syYG+CfTN4nX72CmN55ZaausAURO4Dq0MzVURQqlwBFheJvY1dphc2CYKN?=
 =?us-ascii?Q?oryzYZg9PvT+zJ3mkn+Y2+smKW2ysZwrIZzEvh5moZcr8xGN1CtLSUxmopgO?=
 =?us-ascii?Q?EcIWcVKG02McdOgXvYrbBa3sTCjN4FxEICGGtwmdiSRyjZFJyCL6Key7nue9?=
 =?us-ascii?Q?+bPKjk7Hf4/jejQ+PxpJVaMYzvMxQSEjqfhTTt4g62w3eOJRzbYfeDJlEe3w?=
 =?us-ascii?Q?v9Ui5SAadCxBHnmYjiNoGZSqxf3iFHyQKCBwkPfm1ythsXsGvPFcwHk8cxBf?=
 =?us-ascii?Q?aVbfrFh/9K/D4gk5LOuGI3sbXjlpWIdRH6DCEgUbBV4l9+yI03JdDvPCgal/?=
 =?us-ascii?Q?3ldZhgsDDbZP4iagDLndjtnNq1yNq17Diw5e3SpAZHwQWVAnAYm/JbcCKb0V?=
 =?us-ascii?Q?ThCPhzIqWLS5fImfudfccyN3ZWc+xsPIXTjQFlOKgQCOwnK+45uz5Wm17wgU?=
 =?us-ascii?Q?uqzidYDCmfpWXXMGiVILwZoF9zTkt+lami7X2E67RWlSS33410g0s3NoRb5H?=
 =?us-ascii?Q?KBo5N9TVv55awji3sNcmRecsh3TBqSr6cmUgVrB1vzfMg7OkKxjrwtvoGuy+?=
 =?us-ascii?Q?+YDH+Q9bZaZVO3wzPg1/djd34KflhXXa0SdhjK2rRd2LUmvNUyp4qo8rm+wQ?=
 =?us-ascii?Q?4FMsatTTo5DcbXZQiGfolhl0qrM02l23LUhIT4GgExLTww6C/W6gDcfDmHvZ?=
 =?us-ascii?Q?UdXfKA95mEdAngOJ/za9eT0OfOd+Bh1/IytVPLNa8tESLbNEUPSNcw9Wno4a?=
 =?us-ascii?Q?EftUlqokXMw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xzG+585GghLmzoTJDhgs+Fhl2tILeUCR0+2vNg1r4p+jgKTpBWgnhvOzUpTa?=
 =?us-ascii?Q?bJwF24HmaWEd+Ohw0QnHTdy96AVIaicCFD3XXDuVPDlDLhO5BuddO+VqAsf/?=
 =?us-ascii?Q?XUB0CaHRzwY6jPSNdeBK/SZy0OYFN/KBxe3PnK7Rd1jz1KmTw0kdpZNj0Xpb?=
 =?us-ascii?Q?DwBPmtllBzIvBizJ0oczL6SpDThG10Cydrj60T/oYqGVh2F/fPVDJb5GKxl1?=
 =?us-ascii?Q?6ZvEuHO42tfOzRdXoziDCEyi4J6cM2Nu7exNXeI7vz+A0awyyJQ7ot+A0IVO?=
 =?us-ascii?Q?46Hv7pYZhX1j+p9kYkbo2fNihlO1Ff6BQ3KizU/VWXvZkHAVfPZAABQSZC5z?=
 =?us-ascii?Q?eSATbNS6TgGW0zlPzA+um4pfcxW4TPGvrX+Yki94cfhVd2gE92h88vf8mNKR?=
 =?us-ascii?Q?au4gbxVP8ExNiMUTVNdzSMPuwwdIcDl0iK12A9sdK2ZvWWKQxIdK3jpTr2JM?=
 =?us-ascii?Q?vsd8BGqK8py4rBbfIDY7g1cX2jmSlyNFhKSbEzc4jMCjtUBwObpvBPRpYcqd?=
 =?us-ascii?Q?aa4o+aPPbwYRtnol9fhjPmosqX2gxavSe04xoD0kCdMAfv5qOdleE1Z8tO3S?=
 =?us-ascii?Q?NqthotXf8kBYXGHn3ZprNyVned40skPO67SK5rxUcnfwFmC296Ys4qGYxvEx?=
 =?us-ascii?Q?ii3Vw5rbKuJ9zhqoX1vJjUSu4xuuQAtndlM6urPH5349XnHhkFJyyefqo/qu?=
 =?us-ascii?Q?6YXwcGgfG4ivAySmABsb1ulxFQVYJj+qweJMLTqfQ8aSzpmV37d1meyVW7Km?=
 =?us-ascii?Q?Wv8Zy+srcW9tfgW1cyLosia7eIq9IxzWjYVqVRzhwHdYRxPI4IqZfDA+mjSI?=
 =?us-ascii?Q?T1ac8MAJA7ovPcl3ZPS6GYqkpGfaGaYpSRsw0KzNi2BeNfzF62ayE+4y9L9U?=
 =?us-ascii?Q?tirFzomhXC1wF3+qGnjQD6i9UshyWlFnSn4AR0dVAz82DmQ/948zcQj95b1R?=
 =?us-ascii?Q?nZLZ7oYPsY4p8TQrcZiLhmqPsVdh0ByvtHzAQtksbhR7qbU7RnZ2m+RIxWYh?=
 =?us-ascii?Q?mVwmAFcDlDVU/M96bJhErTQ8mclRw0R0mGiMurhhvxwc5gdZ3fV4qpJpmitF?=
 =?us-ascii?Q?x534TnVaVdiio9/DyT2VAusQfeWg2hceEBiTrPsmhSR8bzUWqcLmPogsF0vW?=
 =?us-ascii?Q?aeGqwBDBTOdvstaZGbHwzlp1HJasRGqREFAesKQZa8Fm8HyVYZ7Ig12Dnjkp?=
 =?us-ascii?Q?IfKmZJvkOJE+sIIL80CibhAeB3c/ZLm8/HuHiqvVQNx7heizAe7jTKR95xTg?=
 =?us-ascii?Q?ugbzLar+aoKVOnTmjS4J7a5/T3/pcdR6jJv3VgSr4Y7THXXHizwVFEhwmf97?=
 =?us-ascii?Q?AyrEvWRP9WrPax/GE9TsrF04E9cFYitT7KmpFxOK5e4md/kanT+X59pqGRfl?=
 =?us-ascii?Q?nI2s7Zo2jvaEcphe1sXhlO5RQg7tBDzr83QFAw4DOlNJ1AgiG/ZmM8pYqz6N?=
 =?us-ascii?Q?C0vVlS8AnPzkAD9ggM2AY/z1uRcD+60+7fPmd3qVD1z2b4qnL8QUwkMVxws2?=
 =?us-ascii?Q?QlEkIcfXrZsSBga2D80seCkAU8BCM7f40At8/W+qtEtM5ljiqsgmZ2WwIv03?=
 =?us-ascii?Q?iq7fCinISnE30Mvmz4a+gH0bDR4BqotA04JzgYev?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1ebd7a-673b-4617-de23-08dcc67c890b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:15.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D70F11+1TrOtukYzmG6WxNCwmEnYVqyK4MI8ecwLzwRV7ZfduWSxLu+edXbNei48jDgr06weq2oyY7WCvxhWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

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


