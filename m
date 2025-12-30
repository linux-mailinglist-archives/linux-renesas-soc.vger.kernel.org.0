Return-Path: <linux-renesas-soc+bounces-26183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F5CE96F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC82C3005316
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E4729D28A;
	Tue, 30 Dec 2025 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mwCXGmF8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7F71E1C02;
	Tue, 30 Dec 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091230; cv=fail; b=DWOeP2qNrF3hXdlO9ijaEbbqKSrB6Mcdvbytw+aeTGk/JVZVdY+wyPiGuf1N18GRA9QL0hY/BRv/j65w8sGzKUZwWDfM+iWaf+g+Q6yufgKmFi2vBZLSgQRWaM/3G86OtU5db17wkIzzypC2jLPdmWWbLCCQprzGqOp6QWAnr0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091230; c=relaxed/simple;
	bh=XDlQK7M9nJN7C/L5Wb4lIQVllCr7SsAvHZ9Nv6ILuI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=prosaBA+Wi2JO5Ry/RYHOH6qT5Apd9Kk0qDqoAhQHHY94gdsLHPqtrB0HCYv2UM48TVX+IQwhWw1zSPupAM0XySlfxsS4SnB1lxZ+lBtlMxyfNDZzopslPQ8mNW18jgF3ow0XjL8qxFegCqIvS92Q5hM1ZbFBCxl7baF+yIQKsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mwCXGmF8; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMKv+ZT9eysgYVTBLoVY9SZbLOC02cWuj9xA7NPWaiihjJvQipD76+rz6aEkWcSttlk1Uhi01W+XApow2f3mLWZ3EQ1jBmo8hWf4iSjMCllzruXOLzPGv/oK1MtSxeEepbnvsX7LvcQAEzsoXKQSc6bxM0DRJ92yYi5bSE7u9L4WFcAZSinSI5Le+/8SwqiLAVrCUiCUS6Og/lASWhA73/bA2hiQdoM09vJOlvTBPcbN5OQwQNkytmj+wFUlgeqahFsCZ/QobIlPEohOA6Yha93A0E6NnuPtY6u+IZ4uJpCXiRHicl/xRtgsbgtQ/kZwefbFLr6xaoZyV9YcnycoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10s4t7+RtFTAcdQODx67YIZO/ZPHbH3TmNS9M9l8BLU=;
 b=B4tUcEKXVKbkKdkJCdCGD/K9gNks//3KM2HS881ky7aI2QsxHCPvHOA7iQESTM7V2rhf/Pp2S23TsQBJRYiJyqY/5qyvSsglcyi9Hkll0RZBQDXtk4WyFJoxAgzub1dF1UU9jdUO8JSlEszU7forsU4dYuIZ1/IxCk8/B/fM3KXJvxgELza0S/poZUwl8uRqDdkNok4Gq1qsy01L5sDazB3IyOAjmLIrQGZv9dyl4KoEIBfuUdVS0zKDfsd3UdqyutLZjC1CiIV969MA8yBaBOcZR3mqg6DzFWTcb5U8fFWbe/8HYP1+QLuAchL4R46qTpur2L0oxVF9Uhdcnmy7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10s4t7+RtFTAcdQODx67YIZO/ZPHbH3TmNS9M9l8BLU=;
 b=mwCXGmF86YcWAzHvZA7Fe1Z0//6tmOajJOEmdUmuxSm/N1uGYZLmyUQDW5evqzPYbkLjbQbKS9Uhkpb8NELd+G5kaCmcPi2wmrQoDyGTCQ650e+vTsVFmqE0FMrESMUnDF3CfhRcEIyUEEX4pQKXO0KXiuNLd+wJVmYsvX2uZzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB13563.jpnprd01.prod.outlook.com (2603:1096:405:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 10:40:22 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 10:40:22 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
Date: Tue, 30 Dec 2025 11:39:36 +0100
Message-ID: <29d6558c381b726f53c22088a5a2ad5adf9fe142.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY7PR01MB13563:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb91ebd-820a-44d4-01f1-08de478fd56d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0btH1Zu6BzDONpmx5ySbiZ6BSTH7GNy1ilM7Dyfuvsxw4goO4Zx54YCLNFrc?=
 =?us-ascii?Q?zGJrfccxTkSQgha5VZiSZU3suw8o3cmc7tyESoAd8Rg9XT084j8GhphvBOWk?=
 =?us-ascii?Q?Az1R3K4TAwbvmmrVYdEPFrE3u58Nf+xqqp+B+fClI2h4c6GCAXdHqSPDfMer?=
 =?us-ascii?Q?I0C26BkjEDUyhtOiIkqvz92t37MX0jV8EF57/K21uzfGwwhSji7N1HpHB5bv?=
 =?us-ascii?Q?5Bgon3SjwwhqnpSoLdMo7sOTQjXVJ9t0gIwGvVlZZ9S22/s4G9Oxxw+6RUno?=
 =?us-ascii?Q?yHqWMcshhuZ3WjEPmVW4dfKIV8Vo/VQPhq4mhsqgOCSy3TaAubUUo7e/DtoZ?=
 =?us-ascii?Q?4T/rmsKtczV7dmMYz/uEI2R3EkxFIfPtsOurKXBcIHVYv4/SttdUG0vDeoGO?=
 =?us-ascii?Q?rZNPADx9PCgiAnczTgg6Cq0HEzRDIxvHFqvZurS55ojd75il3sOiEawNbCa5?=
 =?us-ascii?Q?Ro5TDcFA61OyvF4BvugxPhc+fDFPq2KXpLLzHthndHLNZVy/tkmAWNEcotW8?=
 =?us-ascii?Q?QqeBxH5h0csQVeApOjZRaCjxruqwkEq01XPl9r/xBIaWTd9ed4f+eEsZKTZh?=
 =?us-ascii?Q?DgtH+tp2yv3C8g8PmK7DV2CJH3OQ22FLaIUsUkEIh11jfrb8hNCFy8NHwhOu?=
 =?us-ascii?Q?4jab5EP25aN5cQLtic3a1mK6Xc5/GYuGYO3B9kW554hO82lNdHpjKWNArXNs?=
 =?us-ascii?Q?D85cu6HrtqU30jHMyHju71v6H6+NibGQAX1mKHSjkNCRmgdG772yB8VF5MfS?=
 =?us-ascii?Q?CLBpz/GvMM5l6AmOaTfnCmdHhPh/A3W2laK4FXOfyXSKCkpEF6myIiogunAQ?=
 =?us-ascii?Q?3oYOYNhR829qkdzfHcm1lO4XTDbrnvy6aktucHsPncgYSyst97mfrwD7b5z4?=
 =?us-ascii?Q?v+kEzbvkoOTf/G3yTlgJmE9Omqfngep006VmNHOckxVXs1oLoTcUDEYkivug?=
 =?us-ascii?Q?dyqfvJgFCyzp8hl0V1XDkYXrWhmZnCNOgq1iVvl2goVB9C7E95TcNmYI9hXE?=
 =?us-ascii?Q?s4lM2R928K9vOfTMg2JYpY+OtEcRWugF9jNqHoYv9hUePvb53gjc0gjde4Fe?=
 =?us-ascii?Q?iyeXQCnvCwXQrTVD4f5gzww/HNYcIxOHJZXeD6swfzrPXjEiaXtwL6h1Xgt8?=
 =?us-ascii?Q?86Mxa+0tHzJfG1ZQPB/7tVSSYJJju+TEVt/zsRr5Ks/twROhGcoGcmZyMig1?=
 =?us-ascii?Q?3VxwlaYntqM4ZUKE5PinboHO+wm1j0BDDxyiKvT24zSAGlaljcQliEKzn/ha?=
 =?us-ascii?Q?HH0yVkTQz0K+v24+YeY8j7yJpIL1AXWjRn4mZoJTuJKEB8sigQvCOEYwekQG?=
 =?us-ascii?Q?NF34y2g7M42qOnEqFDqjK2cm1O2X4oLs3NCA0zyN0GLEITAOjF1QsfI0uTIM?=
 =?us-ascii?Q?9Af1qQgk2CGulz2B6PWXeT7R9Uypv5bC8oQQMj8vhg1/PMzimGnHQJpLkuTT?=
 =?us-ascii?Q?yXup8UvjImgAM8SBaLE4ZKPbpkgQhU14vBD6ff9Oh3yoM8DJrWJ3rk22v6+d?=
 =?us-ascii?Q?HvFyMoNUj6iHyTL/zx6qebRz67wvF6VHbr0t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xfrlXhvthsPRqLP1WNk3JzI5l/StuDRmI26YbaMQgNtbkJoLF4COOkViDlnK?=
 =?us-ascii?Q?OX2hWK+R3MpnhuT9mhurhmhKNOUJ//xwjpZP+kCXXTH1hNMZywX209pq5KZX?=
 =?us-ascii?Q?cpnyd4mANVVQvuyvbkAeg2Jzt1iF0DbCMRM7q7FmLtPbTo7T/QBjljcmDuVb?=
 =?us-ascii?Q?mUeZx0fJtvgui160e7osMzx0MH9vjUG+0E8kGEBsN0cJFsfRn3DdXUemLNFN?=
 =?us-ascii?Q?9/KtaXtZB14qnJgh9iJ7xHSS0773S8ZymDXLKBWe4dTJT8FJCh0cPWwYeG/x?=
 =?us-ascii?Q?0aR43lZ6R1I6hCQse0iWE6M6W37PVCv8zZCXh0i4OyWa7UJQ3S6oI+5Upy2e?=
 =?us-ascii?Q?9RRepf8s79iI4gk1OTvbPoVbMuIirZa4H/o1pZGKOOalJL8QzZKfywKJWGwM?=
 =?us-ascii?Q?1uxIln1ng6PFN8JUTTntUricnk3NNzWSZHnnpckQcnhMMNthIJb3rRi80nsQ?=
 =?us-ascii?Q?I58KTn2+zi5r4HzZhsI2csmmZUlJNbNhcVOz+hNPaeYXys/RH4gwFw1fl2bW?=
 =?us-ascii?Q?OY+QSKES+rA8dksKgEqXaP7rctIX9gVxV+9G+m2kHbJpIw9HiIxK37iTDSTv?=
 =?us-ascii?Q?mxIO8qS2ICbFyiZPHNE0mCMet0ZzDScp4xt6p026ppc9E1lrmod7YZBp5r9q?=
 =?us-ascii?Q?+bdWiQZSrC+s4BErn4XucFyyiEM1pyLNrl2f9m9kqbUJign67FE7n7I8DOHE?=
 =?us-ascii?Q?tS55Eq0supuK3IwMS3d4MQytRdkeoXGZuZj8rIJKX615NKdNFQO73rx62v3t?=
 =?us-ascii?Q?PkUKL8D3aBCj+xr21iC6TPpwdhPJVo26XPa2Ic1y71Sm9Q+Qtcx5tAsDzM7a?=
 =?us-ascii?Q?k0f6DAU3vOXJp1RFhEjAgkhREs512PnFnUiHYMPp5TZTWmFgFSo4a2AMPFjC?=
 =?us-ascii?Q?BKfxEf0k4ATM2ouebDohd/BwT7FoRiiaJKoOBMw28fPQv3uNDRHoSVUk80ds?=
 =?us-ascii?Q?UFacV6FHf4NOrt/30yPL5C07UIxgqb9ysE4vFFj9SdjSNHz6Q+rvAZ/z1pIi?=
 =?us-ascii?Q?sHbX8I28oaSErs26hXmQuQgTmyznzibzuPRd8VwG54YcRS3aq3ZAst+WfjPG?=
 =?us-ascii?Q?cTEgLdIGygiBzwxJmABNODCiuDf6enSUU0+zKIseq1q/qrquoTVHRm6uIpmA?=
 =?us-ascii?Q?mAMOoREhTSiW1yuFlYMnh+ietnpHwd3WW2sdyPioD6n3iZOstPRGUJn5n1Qg?=
 =?us-ascii?Q?8lPZJZZIBBhoX2yEz2wrQBlXc9y0ouVn+ia9jYPpZKtRD69INO8EEEh4wOJ7?=
 =?us-ascii?Q?YLiRuayl0b89SbaCyml5E43mRRyHJDliAGjP2luqORSgl8JuWD6PfkbD4G4X?=
 =?us-ascii?Q?aTTsTM0JozF8mgx5qNAgV1rnZ+T3hfs0Ozau09wcCvwVOdzcYDm8oBpKJart?=
 =?us-ascii?Q?BJ1YBjWWnQq5K8nn27aWCfp0Uw9lZMotEtBvpmVIGGx0QIKoLc27WeAml/ej?=
 =?us-ascii?Q?d6cmFq4PcH3IUccXC6/U6PdTSnR8ojqMauB7z4Sk/Q2DmQZObvgeTuVNiQfm?=
 =?us-ascii?Q?1AniBTYH15BLAEO7rWlwUBYhj0aL11GSdd6a54N1X0pzzv/MBeka3Ct5I59G?=
 =?us-ascii?Q?qeUuxx3QpJsRKHBre2SKBWHRH3/XfbM5iBOnemyYbkkrX8ofz9QWDSo7VXUJ?=
 =?us-ascii?Q?fbYiEpthz32i192LlNwzcMuj/oA7+OUXqX2fK9BB6NSpWcAOWaX9jdJ08GSp?=
 =?us-ascii?Q?4z80BO4BlH0HAyToVgTdnqoNcBVTea+h6CCF6p1r4knE8tqJ9g6CdaULZ2mQ?=
 =?us-ascii?Q?ytv3WgundHEb9ACYoWFq6VlrvF9r1VEoXGiS/aRcFjpZujmxj4bC?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb91ebd-820a-44d4-01f1-08de478fd56d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:40:22.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMtNKdUm2aBLNkpOEuQ7P9UVzEoffAZFz4xq6aiYagVo2tSyYDOQx0nextVBXNliW0yB0OWPRBcwzZoh269xlRyGsgxuJYJFbRG8dAgBOPDCyqM1j2bSZqb066pfigWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13563

Replace individual devm_clk_get_enabled() calls with the clk_bulk API
and store the clock handles in the driver's private data structure.

This simplifies the code, and prepares the driver for upcoming
suspend/resume support.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 42 +++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 426a418f29b6..8ef6ff06df90 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -259,7 +259,8 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	struct clk *tclk;
+	struct clk_bulk_data clks[3];
+	u8 num_clks;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -276,6 +277,10 @@ struct renesas_i3c_config {
 	unsigned int has_pclkrw:1;
 };
 
+static const char * const renesas_i3c_clks[] = {
+	"pclk", "tclk", "pclkrw"
+};
+
 static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
 {
 	u32 data = readl(reg);
@@ -489,7 +494,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->tclk);
+	rate = clk_get_rate(i3c->clks[1].clk);
 	if (!rate)
 		return -EINVAL;
 
@@ -1298,11 +1303,17 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 	{ .name = "nack", .isr = renesas_i3c_tend_isr, .desc = "i3c-nack" },
 };
 
+static void renesas_i3c_clk_bulk_disable_unprepare(void *data)
+{
+	struct renesas_i3c *i3c = data;
+
+	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
+}
+
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
 	struct reset_control *reset;
-	struct clk *clk;
 	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
 	int ret, i;
 
@@ -1317,19 +1328,22 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	i3c->num_clks = config->has_pclkrw ? 3 : 2;
 
-	if (config->has_pclkrw) {
-		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
-		if (IS_ERR(clk))
-			return PTR_ERR(clk);
-	}
+	for (i = 0; i < i3c->num_clks; i++)
+		i3c->clks[i].id = renesas_i3c_clks[i];
 
-	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
-	if (IS_ERR(i3c->tclk))
-		return PTR_ERR(i3c->tclk);
+	ret = devm_clk_bulk_get(&pdev->dev, i3c->num_clks, i3c->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_clk_bulk_disable_unprepare, i3c);
+	if (ret)
+		return ret;
 
 	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(reset))
-- 
2.43.0


