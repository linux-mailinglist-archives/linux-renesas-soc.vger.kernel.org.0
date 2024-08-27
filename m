Return-Path: <linux-renesas-soc+bounces-8343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83943960612
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7AE6B240DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB1C1A0702;
	Tue, 27 Aug 2024 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="XfRcaEmf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2087.outbound.protection.outlook.com [40.107.215.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634851A01C1;
	Tue, 27 Aug 2024 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751774; cv=fail; b=QXqm/1cqJn7lS6t0SycVXaHQ7lpArqULqQTgxRhg+DntdZ0Go/Gw2zEOl6KvGa09DGsLF2FhUs8tSFRjlj1Ckk2OycdHnA5XJaG9ng0hsO1htYF67/9xdDujjpZ61iqMS7871FZhYuqd6sMIW+qg0wGzZC6pd+EPSJr8ZxB7u5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751774; c=relaxed/simple;
	bh=4S2RiJMzuXZAmky3qSUDWr32ueafShaSNeooOmzZpik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tI2LS4n2MwBTCe5FRtOn229aBlxj4QEw8XU42wFGwyIS0TBkahzt3oGZl37IeLvcvK9GCiwKCvFbj1tb8dyp+petn2w83UJqBNUnn5BJcfgv6ejTeJaNyaXuhTVoRlRRvWdQIpILOOXArq6/XcKQR5czcWEeHTGYEbrWVH+23IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=XfRcaEmf; arc=fail smtp.client-ip=40.107.215.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+v3wEcxM5Z9toxw6Rfs3FZKGH0jFEOUtLWyJFGnaJBETsrwoWLWOstC9NWH5mCgi/oPgS4383MdotbFP/Gl6JOBtEzNvx9HJg9cTddNz+9k39CKwioWLqBTys1/R9XbiA5qxZw1z4swJ0jwLduq4WTz1+M4KIY8Kbo9xGclEHU3iP2pQp8/64mQmJlLvSH/K0OX7Pm8ch7SD/ZnwIEH+2o7V0C2SGHMcRPQo9km0b7+4j9sRRwyhjNVximAssVcUK6hf7Dyfy659yEY8/xNDqYXYJfAV8T2lbGw8XNg+y+fGEHJGh8wYgP7FLwLPsgH502B2JH110NbkS0kHNGBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SmflboBSPhrF9rv3Jzy9l5/rAhNeMH5eUOtlPv2pFw=;
 b=xYCQBa74x8eqIjYnEGYBpBcE7HJuzMTHh1J7l0NTS9/CQOiAgo5ZZSyswlBZ2iBk66H+9uswbztEmZmwu7oRhGYTDOx20xzwxC9poVoi8wR+QBJb9j8kt7iVCNBF7lxsYsaSlL2vKNX7c5wABLsaXFhmeJnnKnD4tP5t4cysd5OqBhvX/DT10UR1+upRnR3J8H8AFTG6XrXjFLqxzprhrMvhFcxMiXjMpYblLONr6MFKevfIO4Vzw5Ec9f04hY5xeNAu5EEKWkRS3TJvH9RRvI56+Oq8Wsrgbzj2pywbHBwOnW1zm9IihzjRmZ++hV+OaIJbiVcXCn1n+RuYQYikzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SmflboBSPhrF9rv3Jzy9l5/rAhNeMH5eUOtlPv2pFw=;
 b=XfRcaEmfHbfjQKCLT2heYsspAxbLsAYFRXcX40v0oAv/mmejCFU/XSVzTUPy4FeJbawqXpJ0rMEwyslzGZ90AnpObYx0qeGJw1VlplLmZOjIlJSCyc//c5Ne0ezE9oxVIcnOMf/8EJvhId+hVMh+EqnxOX7LW+JgD9Zh8SOxdkOp1sQhEWf9YcObHYTs3nd+4IWvZ7iaDBt20vdhuhpCBCkhzLZvR4j0rnuO2TNZnYC05lIiQnQDOrjyP3K+hPYMEwdLX+zqwiRpmq7wCS4VICgNWnegZNLPQkM4hwOrJ1ZEA9xbL5Eu0A0Y85D7kmofnFDy08EktRIbJa9fzZa5GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:48 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:48 +0000
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [net-next v3 8/9] net: mvpp2: Convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Tue, 27 Aug 2024 03:57:11 -0600
Message-Id: <20240827095712.2672820-9-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 21cdbc7c-1115-434b-0225-08dcc67c9ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FEWMfciPU9TO2KFqnWwUTdtOPQKYzV6c/tyjBqIApzuex/rj0/lGNDvGTu6b?=
 =?us-ascii?Q?QL7yKhpeYfacseZftn6ARsHxR81dfbLHV6uI5FGuJjAwXzg6bI5qkM0LTo4d?=
 =?us-ascii?Q?5ZOu8LVPWGGkqeEWeIR9BJwbYyF6eJ5nsR8GKPMCoshi4RQwh5RKeFGihDvo?=
 =?us-ascii?Q?Ldm6JYrOcjmt4rN5MoVZn+rb8mKOS6ft65c7FoS7CzeRobGXkzRyRbe7VEGg?=
 =?us-ascii?Q?CaR24AUZXpzm1JkSQaTSN25H0bTQxow9f55TDRMSsoZTM9JQtNqwenPt0W7f?=
 =?us-ascii?Q?hY2LYRjHufs6tpphtKcYc2iSgbWAxSYSJIHyX5Vn73qHyysSZ5WltvljtmT0?=
 =?us-ascii?Q?SOtedWDgdC+LKDuL5z9OKeeDnufPfWny6xRXVHUCfYxhDvHI4Rja1ltGei1o?=
 =?us-ascii?Q?DcxR4WpUOYCafNuqcYv3d7E8Mr7lrBoWOwhLDACEe4A1aUwATtkG8btU0D+5?=
 =?us-ascii?Q?9GMx5bE8JLC4PnDlaL143m9uwv50yRNX1QSi6BuG9hcHGsAy6O8p+Q/Xva69?=
 =?us-ascii?Q?KuBf+W0S6FZqq8i6mjVTQZSFc4/SFjJLoWL5f3ZgcAwnL+5rgYqeQ+fvi3ca?=
 =?us-ascii?Q?iB6kdClDaeansBaTW1y/o/mfxTd+oYLb96if3pmEv5Dua9SqePzX6tDdnm/z?=
 =?us-ascii?Q?uKS9hsBjsXnQj/plbZnSi8qJUV/oR7frf+etgoD2VMH9/v3rfQMl8pxpjB0A?=
 =?us-ascii?Q?BCKOvPC9dEA9USanMC3tN3m5GP43a816t6lxGbXcY+BNAIHiQJMEQA9+SD8L?=
 =?us-ascii?Q?WlSzi5m65xLz/ngyipeH7wT88ykm9osxHFNDua6HPz37gtJub7cWSON1j3ZN?=
 =?us-ascii?Q?UY0UsEX1nheMCwHvelLDMkJPixg9aIvE9qW5ImvIwV/h8Ftcnu4oWBuvLaBx?=
 =?us-ascii?Q?jWZbr2s+E5/hrObsJZVkfTdXBcq1i+JoPpgGvGOy6Te7+TQQzqMJY5grmjSy?=
 =?us-ascii?Q?L6UZtOJ5OdUqQPqdC08PrDAAGOVO7gBzWF5GCntHw7aQGoRjd5lIunPqsvKo?=
 =?us-ascii?Q?07LqoJPr7U5+lc35/qjEvgg5Q1C/2R0JmB+PsunS1JkBS8oBoYDz6afsQGrl?=
 =?us-ascii?Q?GF1kEhOy7fL/+p326gVY3qVurK9QmQ/Kw+EZDl3JLpnUH8Z8MybC/1MhsibF?=
 =?us-ascii?Q?lYJJE/3mJx2lKCQ+xfMHpXGMz4/T4jwqE2nGTvyypfO3G1+yEx+1JBq65izY?=
 =?us-ascii?Q?6aQYp9xCrsjKo8cF7P2zWvKyURhoxxAluosFTHOFPBzVlyClvu/fzyryKY+R?=
 =?us-ascii?Q?w1Mu/JxiwCu79ZmySGjirv26YK1EEKs+wp2Udz06NRFGcHUv55QOXyBol5IH?=
 =?us-ascii?Q?uMwUVUnMXu0L9UqQQR/wyO9MZpsp7rfGei33mhsb0Pysql4lEGt4Kyv9aSxz?=
 =?us-ascii?Q?hWgoCF8p+ZJ4OznOg/odYkJSIqGkHOw8T81+Kp+tpYrkOzdcbtxFxX29uk8m?=
 =?us-ascii?Q?7CevTi2OCQc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UGKK7Y8X97Tts17kSjsHtB4iSj1K2YkvA1i7pO1zM2N76Kukof4qx0tKN7vH?=
 =?us-ascii?Q?BTdptU2Z4s3WitgsGfIFH2LbrAomEatBrctui3axmcDG+sGzTcdQKr1z5Slx?=
 =?us-ascii?Q?AR6mcLe2AJHAfmhgYjEUzKHKrmZwPwIIT9qE+DLKTs13dmrFzewcBSns4x54?=
 =?us-ascii?Q?TKr3ycPvAj3Ke90SVA1ByQPeScuQkxmkV+zdTkNDfq5b9om26/aGleJs4s4y?=
 =?us-ascii?Q?CD9gyvi7Hp2kpFphix34/Si16jZP5QTOeFo+2LBtEE8johw/pYxCFQfg1Kab?=
 =?us-ascii?Q?ph0IyJyrOu3UJvnRfcyu8S3I0HRiOyxJJQl7uXZjfpb6dUOeZjkdAomP6NXg?=
 =?us-ascii?Q?073FdOGNobpaTMG3/5W8HUA4EkHn7dChqO2elie08laTsJE/Ul2w5k4fOOaE?=
 =?us-ascii?Q?dc2GqLy/BC9ZSKccl9WLuvVfa4bp3vQX9DCtZbIDlGE5TGuMEcJ9V/3ANfg4?=
 =?us-ascii?Q?50Ak/UOKyt6dvRvVCcr+w8yp8UbXK0LauZjJuKDpCx1Z42g5yOD1Dub0XTzX?=
 =?us-ascii?Q?eFlMuqtyqanb8ky7Ch7iHOz55OsjGCP7Mt8+gdxrWVVXf4CpJmzZfjA4DqEX?=
 =?us-ascii?Q?KZMiMioMMR+xrdyfpqUraIEXidcgpnsBSyMTsmGUYljGui8zMotj4rUBMzNJ?=
 =?us-ascii?Q?vqGDoT/HkEKbQeUs7oZsmwiJoC4ceSv6suF0FyNlirPcW9J+GrEQDApWdAQE?=
 =?us-ascii?Q?sfz8JjRQIe9NNo8XM2o49cwBhwvWgm8p9E1w2GgrCePsktPvszKZCdmC4NVD?=
 =?us-ascii?Q?krva0bdi1VCpR0e65G85pmvpc1bcDom0D9jd9RyveQsBSrWvp5kMC7NFg4eM?=
 =?us-ascii?Q?Guj2zqlIHGpnUbnMGoyNpuPZckYqvcpeUytbwZnM6azzGT74byarwxj82GJT?=
 =?us-ascii?Q?wCemtQS+mfbT6FNWFDEJOuYJ6YKLkXUPfGWYrrYrFDY8bCqYDdiz2sA5rkuQ?=
 =?us-ascii?Q?ydNktvzV/aJGAOkyMIiwgbBoJ5cNQiyBGoSFCgogU9pp+oeOJMzHkgePeByJ?=
 =?us-ascii?Q?Tk5CWYc/b1QajRL8cEwf1/VzOp2icfstvGI5HnIsgMOqtG+6o/Hx4+AV8kuk?=
 =?us-ascii?Q?4UD7gxYyC5EkHGn84kzWulyGlSLRK3d5xyG0Jsv7Q3wgIkMwfNBi6evDGu1d?=
 =?us-ascii?Q?tVbK3zpn2lgl+YTwyU9E3zK0VJfVCEqkEBgSN4UeslYcDs+9eqjAjb3oU8F9?=
 =?us-ascii?Q?CkbNZoRqYwp2KTyDNxzG7NIzWMrPsog2pgYK4V3MsVNwmGsAnikFFgKoh7l9?=
 =?us-ascii?Q?gOD6RLRj1OJW8U06u9CnzP5LVSLa2tMtWW4PffxKJ8RHAQvx2sy9M+ruh0Mx?=
 =?us-ascii?Q?H2niYCNf5+QLXnsWafX9+xfOi/JOBwJcbUz9k/A7plsc4YPBxqtFMNrsv/YV?=
 =?us-ascii?Q?T/tlGnWAI9mu5AKHk99B7L2i8ko3sawO2Z7Q7bdVkhlbkzbtYY8NZoVtg83N?=
 =?us-ascii?Q?NW7Ko3TDcLwPU5rarj6fejMRXHLfc8MCHd8m2Jb80mUAEXS0+tV/1GEfipQM?=
 =?us-ascii?Q?dMOkMHOUNTxrjRdw2BF0unG+saLWHLVHPP4oYrieCO4sL5Z7+yM0irgf4+JH?=
 =?us-ascii?Q?WRXsngpiifKuaT+a+MH2pWezYOhkaiRXjkEP0Dd1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cdbc7c-1115-434b-0225-08dcc67c9ca6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:48.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2ClBlKcacsQDq8+xqKFr7VShscdJymuUlcrpXXErLbhWtKLxbLc+INGymePphlLFQbrrswmbFFceSQ8FfbOGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>
---
v2:
-get rid of amount of variables used

 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 89 +++++--------------
 2 files changed, 24 insertions(+), 72 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
index 9e02e4367bec..643a645e8097 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
@@ -1044,13 +1044,6 @@ struct mvpp2 {
 	 */
 	struct regmap *sysctrl_base;
 
-	/* Common clocks */
-	struct clk *pp_clk;
-	struct clk *gop_clk;
-	struct clk *mg_clk;
-	struct clk *mg_core_clk;
-	struct clk *axi_clk;
-
 	/* List of pointers to port structures */
 	int port_count;
 	struct mvpp2_port *port_list[MVPP2_MAX_PORTS];
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 2fe8bae4eb3c..0ca2daeb0f90 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -7561,56 +7561,32 @@ static int mvpp2_probe(struct platform_device *pdev)
 		priv->max_port_rxqs = 32;
 
 	if (dev_of_node(&pdev->dev)) {
-		priv->pp_clk = devm_clk_get(&pdev->dev, "pp_clk");
-		if (IS_ERR(priv->pp_clk))
-			return PTR_ERR(priv->pp_clk);
-		err = clk_prepare_enable(priv->pp_clk);
-		if (err < 0)
-			return err;
-
-		priv->gop_clk = devm_clk_get(&pdev->dev, "gop_clk");
-		if (IS_ERR(priv->gop_clk)) {
-			err = PTR_ERR(priv->gop_clk);
-			goto err_pp_clk;
-		}
-		err = clk_prepare_enable(priv->gop_clk);
-		if (err < 0)
-			goto err_pp_clk;
+		struct clk *clk;
 
-		if (priv->hw_version >= MVPP22) {
-			priv->mg_clk = devm_clk_get(&pdev->dev, "mg_clk");
-			if (IS_ERR(priv->mg_clk)) {
-				err = PTR_ERR(priv->mg_clk);
-				goto err_gop_clk;
-			}
+		clk = devm_clk_get_enabled(&pdev->dev, "pp_clk");
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 
-			err = clk_prepare_enable(priv->mg_clk);
-			if (err < 0)
-				goto err_gop_clk;
+		/* Get system's tclk rate */
+		priv->tclk = clk_get_rate(clk);
 
-			priv->mg_core_clk = devm_clk_get_optional(&pdev->dev, "mg_core_clk");
-			if (IS_ERR(priv->mg_core_clk)) {
-				err = PTR_ERR(priv->mg_core_clk);
-				goto err_mg_clk;
-			}
+		clk = devm_clk_get_enabled(&pdev->dev, "gop_clk");
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 
-			err = clk_prepare_enable(priv->mg_core_clk);
-			if (err < 0)
-				goto err_mg_clk;
-		}
+		if (priv->hw_version >= MVPP22) {
+			clk = devm_clk_get_enabled(&pdev->dev, "mg_clk");
+			if (IS_ERR(clk))
+				return PTR_ERR(clk);
 
-		priv->axi_clk = devm_clk_get_optional(&pdev->dev, "axi_clk");
-		if (IS_ERR(priv->axi_clk)) {
-			err = PTR_ERR(priv->axi_clk);
-			goto err_mg_core_clk;
+			clk = devm_clk_get_optional_enabled(&pdev->dev, "mg_core_clk");
+			if (IS_ERR(clk))
+				return PTR_ERR(clk);
 		}
 
-		err = clk_prepare_enable(priv->axi_clk);
-		if (err < 0)
-			goto err_mg_core_clk;
-
-		/* Get system's tclk rate */
-		priv->tclk = clk_get_rate(priv->pp_clk);
+		clk = devm_clk_get_optional_enabled(&pdev->dev, "axi_clk");
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 	} else {
 		err = device_property_read_u32(&pdev->dev, "clock-frequency", &priv->tclk);
 		if (err) {
@@ -7622,7 +7598,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 	if (priv->hw_version >= MVPP22) {
 		err = dma_set_mask(&pdev->dev, MVPP2_DESC_DMA_MASK);
 		if (err)
-			goto err_axi_clk;
+			return err;
 		/* Sadly, the BM pools all share the same register to
 		 * store the high 32 bits of their address. So they
 		 * must all have the same high 32 bits, which forces
@@ -7630,7 +7606,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 		 */
 		err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (err)
-			goto err_axi_clk;
+			return err;
 	}
 
 	/* Map DTS-active ports. Should be done before FIFO mvpp2_init */
@@ -7649,12 +7625,12 @@ static int mvpp2_probe(struct platform_device *pdev)
 	err = mvpp2_init(pdev, priv);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to initialize controller\n");
-		goto err_axi_clk;
+		return err;
 	}
 
 	err = mvpp22_tai_probe(&pdev->dev, priv);
 	if (err < 0)
-		goto err_axi_clk;
+		return err;
 
 	/* Initialize ports */
 	device_for_each_child_node_scoped(&pdev->dev, port_fwnode) {
@@ -7665,8 +7641,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 
 	if (priv->port_count == 0) {
 		dev_err(&pdev->dev, "no ports enabled\n");
-		err = -ENODEV;
-		goto err_axi_clk;
+		return -ENODEV;
 	}
 
 	/* Statistics must be gathered regularly because some of them (like
@@ -7698,16 +7673,6 @@ static int mvpp2_probe(struct platform_device *pdev)
 err_port_probe:
 	for (i = 0; i < priv->port_count; i++)
 		mvpp2_port_remove(priv->port_list[i]);
-err_axi_clk:
-	clk_disable_unprepare(priv->axi_clk);
-err_mg_core_clk:
-	clk_disable_unprepare(priv->mg_core_clk);
-err_mg_clk:
-	clk_disable_unprepare(priv->mg_clk);
-err_gop_clk:
-	clk_disable_unprepare(priv->gop_clk);
-err_pp_clk:
-	clk_disable_unprepare(priv->pp_clk);
 	return err;
 }
 
@@ -7745,12 +7710,6 @@ static void mvpp2_remove(struct platform_device *pdev)
 
 	if (!dev_of_node(&pdev->dev))
 		return;
-
-	clk_disable_unprepare(priv->axi_clk);
-	clk_disable_unprepare(priv->mg_core_clk);
-	clk_disable_unprepare(priv->mg_clk);
-	clk_disable_unprepare(priv->pp_clk);
-	clk_disable_unprepare(priv->gop_clk);
 }
 
 static const struct of_device_id mvpp2_match[] = {
-- 
2.39.0


