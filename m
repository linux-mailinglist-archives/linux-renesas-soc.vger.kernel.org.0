Return-Path: <linux-renesas-soc+bounces-14448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F7A64599
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D4E1893E0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 08:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480A4221F18;
	Mon, 17 Mar 2025 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gnU3dR9U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232DB221F04;
	Mon, 17 Mar 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200388; cv=fail; b=Q7S4GOSLjr0TTeOnbuPoO9B+cxbUKF6j7ZR50HJoFDdX51v8/Ee85PsRKPxtKiDNrHPr4Q6+1TDQ9Jm4mOV+p9L6e0h1koTjbPsHgnxqhsPl09ru5lGqAVYJptNrAs4Pb7HaYnNbreLxXNz9fFHDz8AykI6H2XUFUqW3oyCu6sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200388; c=relaxed/simple;
	bh=gifNC82ceshT4UjRcb4Ua8hugGtELF8VWLbj8crBcn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N2hvt03hVhHwIucwNDLpduKNdJKkuDHe1xGTGqquXTVPHF1uJVtxMyOt6zgzAM0GoWkGuZU8q8vZ/zmYdjHztVwOghH5hFZJSNGIKv//9MdzW7fMqL1Vi1puxQErVu9OdXFNZox4WpM1tTmzsYDwIx7gb3FfEr7wvDxC6TAk4GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gnU3dR9U; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx4QotAI8e1ZKJlr7QnwbGN5OPoSwTb1/5pUh30KQUcGZEMFdTPv13KIfZlB3YQrmFw8EQltDOc9jwQ93DeV7Gzb30HWC4regZN6m4NXwDyt9kfPoaMh0P2f17Hw4M0FkJjdC1XPy60nGwVts1OyoqHK9ddK6IckysdxeTDnzSsibcgZ+QBoIRUPEmhYD0CcWTtEUSOfuMq3o13edcAMfC42ggu0Zj3YyFNbM19diipRuIOSJvcxhciYzeYLgM5l72dM5Ozq6gNlHwXsP1s33jWCz04im+I0fhP03C70+Dh+Ydsa6F4k9PegXBAqTaOf6+5tHnvwVdzM0SkLyuvjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/AGmSHfMPj5sp77JN7HSy4yxuaXHCVm/ZAYQFSpVCE=;
 b=pn5xSgD5e0k0R1malIA0vnVN5yyTUGzxGKPq7f2z1tQRJcgOSBwWLUo6ZJm294z3VwQrdBr6uwSjDHeC+NgAhafo10YX3z9J8D35YgyjcUlpcex7dk63btVz6OKDA5rRwvh98g0LDRkA9dyslZNx/dzCA5FiqDcVruS1FfL7Jj0/uIDU7qn4LZ9szvrBjeaUd//HFBTFh8XKd8rS5EAEYS77ZGC6x/sX3uS5qf+3LSubkG+e+Y4zHhwvvE5+YPJEPSjMB359jozDQwWOpXjL6iLYv2BXwoY65hLMTSRgWQ2L1zpow1uCD2fVsU8a0qd0GFNFpu1YioWiJB2l3tc/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/AGmSHfMPj5sp77JN7HSy4yxuaXHCVm/ZAYQFSpVCE=;
 b=gnU3dR9UPpQxLel81Kvqt8pxl0b+ZWo0woDvFtBGCNwkgGTRmq+sBO0ofglBkOvT7lwT9AqqY9PuLtb3cEx3k14fjtoUN/IyiHps8dOWKg9KP+sSmLXpFMUUZJaw2Q2hyhQP61kXlIChQbW/qXDolKbBf5Gs08AxWerAQ7pfvRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB15407.jpnprd01.prod.outlook.com (2603:1096:604:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:33:03 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:33:03 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Pavel Machek <pavel@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: renesas: rzv2h: Simplify rzv2h_cpg_assert()/rzv2h_cpg_deassert()
Date: Mon, 17 Mar 2025 09:32:11 +0100
Message-ID: <20250317083213.371614-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB15407:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ed2208-0d20-43bb-c882-08dd652e5575
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mYKCVjec5oirVjo99evUiOlXudk0X8t9FMMZQHVVG0+E7vjlNzydAGMNUt7A?=
 =?us-ascii?Q?PrpHsqqfRGrXSrvjYwUBFE7Is2GZ8HXizXelPW1ugJtKdPupwVhi/CoTwRv+?=
 =?us-ascii?Q?vFkRucCNR4svZd2mnsaQHj8Vk269hrqUlyGyEZiBeWG4WMwM3VO+1dmD/s2k?=
 =?us-ascii?Q?QhE4rf0CWeGUdzOt/opbhdnsGB6AxeT6MmQp/SfVoTh7olV2MAulHO3f0CpS?=
 =?us-ascii?Q?t/CAyY7SBQdvx0wimgjWIyytu6WHZJ4RJHbZIZIl+cK1gpqguCjMCRmyuJse?=
 =?us-ascii?Q?4cSf42+bBb5ZrJZt0RIafv5me/EBZUZ/kTQHMifYmbMDZbhCIh8OH5rkk2hB?=
 =?us-ascii?Q?WIX2pSZzqSa/FGHps2iHeh/lF3ZoWB5hGai8xQNVilVzmTyM6nFaOYvHqDuj?=
 =?us-ascii?Q?DjVfK1ryZl/IuDwLy2pfivW3HJHTwYKGMmVplZXlKqG5p5qu9pP5OqynSizA?=
 =?us-ascii?Q?4qOA1SFt4wYKJWr8WQMfz0xlzSuLN3jnnOaUYBnBzzBq4tlgdvAy5PvTUafb?=
 =?us-ascii?Q?kjsy1oIw8mNab6OjKmPwnU0qifs2JvZDC/fzP2aAQ/8IAk8zxAF/KX3c5Z4R?=
 =?us-ascii?Q?sesMX/UQMCpZlli648XQkZYmp104Or1vwWcp7OBiT75bkCfVlm7fuKy7nkpf?=
 =?us-ascii?Q?68R6Lc0rDV6Tt91uvKX/ctHFn7vBAUvp6x5HO0N20pJRvsl0GNbniQ+p/yKc?=
 =?us-ascii?Q?sG0FlzrQJBBVvYwEZxVXnnFn/6MF3f9OKrKiyUjRytzx4WeLHfUjW0ZQt5ax?=
 =?us-ascii?Q?euLdSm3al3ON917VMpSJcNyTP58sxqF6v+6Dh97V2mxROiUEmV96heEARhXh?=
 =?us-ascii?Q?4hQJceUgXfXzz7TxOqsVeslINZDzFbEs5YD+x5fgFqMJP8DH3o8byv8e2EyT?=
 =?us-ascii?Q?noyDBpHfNFpJhzk5Cn+iMhdxNN6hZKYvAoG/pZRr1wPBa/78IoGWlg/ToerY?=
 =?us-ascii?Q?kQcZ+rGD6KruWk0ysFu/ku/ALhQpLjgBnTlLC+ZW9FulfPTh2NSY9cKVr9vg?=
 =?us-ascii?Q?KZlVuDRrrJxAtKa1gw4z2O9gg6AYWOAaeL1qN7m96AWRWgQFpBq6rQaTias6?=
 =?us-ascii?Q?8xSR8cnm5WX9Vv0TTEbi4mJhOHj2X8QP0pcbjLO/g8xUMhQB7vj+dZ5IKsV5?=
 =?us-ascii?Q?DHJsbhFrkDmFJblQ0yfMvqNaTOXFNwGiQhOzwaF4QsJGfYtVvAZwcMIZQ17X?=
 =?us-ascii?Q?t48fHflk/za9EhZTmn/iM+2MQ0dspSV6SFJGOOeIew63by3mYxOYEPrNuNHq?=
 =?us-ascii?Q?BEeRZ3zYhn78t56bQMr7I8Q7DMWZZaZDdKTg8NowKQ1PXwUsvcFFYuBF+QPM?=
 =?us-ascii?Q?iHu4yCW7QgBruSxVWK5xyMF2tA5RAki2FyMWbNAIgUaFDuzUkPLRscp79JaY?=
 =?us-ascii?Q?UtePPk+VupW9UwrON/NVClzTkvN6NKLKvHP09ngX83EREBu53An+ovZXK5mG?=
 =?us-ascii?Q?qD8k9K2HIiaV5F2F4mw91v0NuKO5nY7v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EB5zIk4J+WPScfzKM9GEn9A6/5WWe+KTpBdbb6O85gXOS4g1n3pB8AZurY+1?=
 =?us-ascii?Q?IUCQRuOdp3fyMKRLvWeM6oAtCQfEq+9zffyuquAMN8+Jqs68ZtJ0FrDZvxh/?=
 =?us-ascii?Q?gaQn17jRgjXpUqrlGCCaMRtoVJASR3LSTA2udFKfjBtaMqpr2Va0PLGzb5/+?=
 =?us-ascii?Q?DIDczis3Lm2+HRc4Giqb880XFh47q8ctnSNk+Y0CLChWEBeXmOwhLUIwXFHu?=
 =?us-ascii?Q?hacjZOpxE3Ap1E7brybHKPcFuZvxM/oRoW4hN94vfo1KCPpTgjFsCypwYaJj?=
 =?us-ascii?Q?gQAk4hrxydlq9qjRBczwO7bRctmYBzGIZ/QLxC3VJQglvefrpD4uBLuonotj?=
 =?us-ascii?Q?uCkZW4edlVM31ceHu96BZKF30Na/lmUDOZ2XX2FdsC28WuwSHYGjDyQAKGcZ?=
 =?us-ascii?Q?3xnyCF7jFMs03QClxoD62r8floL7Qe6mHYiJmqUmXBeRVEb154xxO0a8P+5u?=
 =?us-ascii?Q?6ixtOt9j215uA8WGxuR1Pbw3wWOedQh/dczkFeGIN++2U9aHezoKG5W09yea?=
 =?us-ascii?Q?WvCgmwp0/2NqXCBFpq/FVgrdpW9ygtpKJuvQOJptnCwnP8IVMX0+eHumeQei?=
 =?us-ascii?Q?53NrPiM6A2HIld1sZS5mFk5Br00nUh81yOZm0k+bTqhZSAyv3o+bcZQqO/vh?=
 =?us-ascii?Q?6XnFCjxgM2Ynm+Sb2TcFlkqupTiGLHx3tu3lF8MQjm4JTYH9vicyzmw+9tZL?=
 =?us-ascii?Q?4T4OQdKkP/Yr7I/RU/d01VfNBBtR2CJ2bEq4x6GyNNZ42nfWNtViNCu7qoMR?=
 =?us-ascii?Q?Hg5gd412vVv6tKU9lbDVFPWC1pK2AyrDc67Z5tTdThzCNhGz6c8de2DGm1bD?=
 =?us-ascii?Q?HOINWilURUko34PIq3yaIyj+t7JAQh+CK9i+PIsKBsbQm5pqLS8dW09fJTZD?=
 =?us-ascii?Q?bSFu83AJ8NPp8RMtICJ4dxSHiHQ6qBsGkI/B62cdTy05EWXfIVLjvyZkrRx2?=
 =?us-ascii?Q?Cm3/mp1azODCikWpdvSJQJr9Yoe91mIbbvL4FRJCpABLPnGDt5tRBX7gCgka?=
 =?us-ascii?Q?AvHVCHq6bco0tpQ3hR125VI+bnpuBH9KRoBdpBM/Bu8mtmiB5ZD39e9E50li?=
 =?us-ascii?Q?0N3NRzQR0CVMb6JBTTxQkR4q/XNCJvsxO+gHEQDRiI7RY2T2SUKxapDh7dCq?=
 =?us-ascii?Q?QNNfQVLNnr4rSlDZKRtLeYE7qLq3JtIm+wD+SUlpfmlrkMRRLJL5ComOEW8m?=
 =?us-ascii?Q?CYdiSS+253hVW53icEFO/9QBOvUtVjinxVNxPsH6M9/pYh1AjVTm9z6ESOQz?=
 =?us-ascii?Q?6R1jzDz4hzUkFxps/eHFSR/ltTU8uk97RE5g8nNPEJLmeQP5xm2zKtEkrX2n?=
 =?us-ascii?Q?/wCR7pTLf8XGVH3+YO6ZP5vfSTt1v9Qq7+BEyDkTFTX3q2LJ2/0VadbfswMb?=
 =?us-ascii?Q?ZNrWQyK8/RrzkoA4WsPEfYA1VrbssUL4OGnJ1ckhmQZctTv5XJMtnTSvuhLG?=
 =?us-ascii?Q?/+tJjFEQHSZqZZJ6bCdxQC/dcceoxdF665rGwcbC+/miOJ9/BccDKFsHsyEx?=
 =?us-ascii?Q?gbNAZ9yCsX8FW+yoSI+hHzHiw8LshVANgRBJarupIW5euDg6iI4y+7SRCL8u?=
 =?us-ascii?Q?SUogEOqMQfduWy6UEG8cSMcu3r/hKhY0w+KntN5uQzkllwfTgOiEolwayOMY?=
 =?us-ascii?Q?DIyzmZDa8mbMr1EbRITYcsA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ed2208-0d20-43bb-c882-08dd652e5575
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 08:33:03.6765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZbcoBGd9ER1wLMk1SkQWneuHgUPeH8E1VD1q5SgaFKJSEvjtWiRm71xa2Dens+YQQKMNtqPUcsWhZJfDoNSveeD6aOYWRVYj8/+/v3H/QFvX74WNPJW3I+N3yB1ifJn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15407

rzv2h_cpg_assert() and rzv2h_cpg_deassert() functions are similar. Share
this code via __rzv2h_cpg_assert(). This avoid code duplication.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/cip-dev/Z9QA9rwuXCuVbOXp@duo.ucw.cz/
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 34 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index bf3ccc0522d5..691bfe37ec1b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -652,16 +652,17 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 		mod->name, PTR_ERR(clk));
 }
 
-static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
-			    unsigned long id)
+static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id, bool assert)
 {
 	struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
 	unsigned int reg = GET_RST_OFFSET(priv->resets[id].reset_index);
 	u32 mask = BIT(priv->resets[id].reset_bit);
 	u8 monbit = priv->resets[id].mon_bit;
-	u32 value = mask << 16;
+	u32 value = assert ? (mask << 16) : ((mask << 16) | mask);
 
-	dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, reg);
+	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
+		assert ? "assert" : "deassert", id, reg);
 
 	writel(value, priv->base + reg);
 
@@ -669,27 +670,20 @@ static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	mask = BIT(monbit);
 
 	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 value & mask, 10, 200);
+					 assert ? (value & mask) : !(value & mask),
+					 10, 200);
+}
+
+static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	return __rzv2h_cpg_assert(rcdev, id, true);
 }
 
 static int rzv2h_cpg_deassert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
-	struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
-	unsigned int reg = GET_RST_OFFSET(priv->resets[id].reset_index);
-	u32 mask = BIT(priv->resets[id].reset_bit);
-	u8 monbit = priv->resets[id].mon_bit;
-	u32 value = (mask << 16) | mask;
-
-	dev_dbg(rcdev->dev, "deassert id:%ld offset:0x%x\n", id, reg);
-
-	writel(value, priv->base + reg);
-
-	reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
-	mask = BIT(monbit);
-
-	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 !(value & mask), 10, 200);
+	return __rzv2h_cpg_assert(rcdev, id, false);
 }
 
 static int rzv2h_cpg_reset(struct reset_controller_dev *rcdev,
-- 
2.43.0


