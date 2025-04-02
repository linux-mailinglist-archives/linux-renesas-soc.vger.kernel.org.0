Return-Path: <linux-renesas-soc+bounces-15322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2819A78F7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 15:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673151892B43
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 13:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9223523A995;
	Wed,  2 Apr 2025 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sIPxWtOt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A380238D56;
	Wed,  2 Apr 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599561; cv=fail; b=R0t16HSi4aCVgUl+rMRhLmNfdhQecL9Sg2iONZC6+2/ko/otqG4/HFDrEWyjq1ADXXr1Ge9HDjnXXCSxYubrOXpaKNDj+9lUc21ymhyEfCKvwqsrlW+Q5JjW+1I+dRmCvKJgHcy6ApDIFSMDDB3fVL8lB0ROXoL7Fv7qRRcHJdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599561; c=relaxed/simple;
	bh=DRu2ACp4t8BlkX10WAXQ5Ji7awMY5WorE9tsrUnisAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TM/3ALqA94/F2+njb7wUHTGPlGEKHlN7kihsDD2083//eF+FiJtKbB3CHd1WQzOEFSSMP83reCFEriG1eRWuhT8H65JuoPp3/ogXQbFED6hnGOj0aiXZYdScn26csDTIugQlayojzXEg631bFUOMADj6dZXgJ2fQq6TyHVNwMKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sIPxWtOt; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oChK/WJ2mrRxdTeEJfae9tOqLznq0jB0LLGc8xHW0YKZ666Z41RGCz/0ChYzQ7oT45+NTdVezGIkLDGvNmjQWprY6VW1qlkmUEKMqFmSg6YyBgw53m7T1LULPena35tvk/GcUtz3o9QvMtKv5TSdKtmzh5vj79RXuH0dhFM9xF9PiPDjjkrUZfkn7Awgw4yuWbi+75XyPZ53d3IugFC+d49aGN9FMQtCtQ7seudpiy6jsbJkh689vPvVfYgOUJijRnpb/I503OS2XAPyn2yWbU8z6TCCJiPFsxbybaSIXXdF4dWASTjQyF3QL07uxdLfltXc0JujWc939R9OMD3kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWMxfW7ikBDpLLEiXj8gvIidVnPKw82wbb+qBWSzJF4=;
 b=eDp2b3tCgoBq9RpsnDfYvtTj7Pmh1GqE+56AZ0E/EpvBFuMU9/MDOoXFiIWCg2J7/0kC34LmtQMmNca/mSf7evgaJB4s4V1KmaVforj15S4qnuRn9wGsUYEujeYQjVyW2mwDxE4qqmj+L0vM41M4nCK34upcIp7b/LF4cIrmau1bkNRncukSUA2klQqaQFNA5IxRpYhVd/i0H97DoBd6eYfGuKXKmtY2k7OBnGfFupqL9mnBIoBOpqtoUll6BiTjmiaAG3M0gjtky/zsKeL5I4Oqsio8URQIF1W5TS0UrMiKcRsrNRLBMqTQZRWun+M5GF1dbZdZervyaC5lbtKB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWMxfW7ikBDpLLEiXj8gvIidVnPKw82wbb+qBWSzJF4=;
 b=sIPxWtOt15N/Qxjn/FC1E4zN/+uNhCHstBEB1ys7i4KvKfgNYxtQVVf7pMqZPx89iLUU5Qw0jqUrm+LdV/wbCnyr2w/p7dLoXZ5k5TM+xoP3HVJoBkqzy0bsdxi2Gew313mEkKfrgJNXN/z4N09Jafz1w/GfAr6QuUwdXAKdr5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6688.jpnprd01.prod.outlook.com (2603:1096:400:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 13:12:33 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 13:12:33 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] clk: renesas: r9a09g047: Add clock and reset entries for GE3D
Date: Wed,  2 Apr 2025 15:11:38 +0200
Message-ID: <20250402131142.1270701-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c6145d-3daf-4993-3b55-08dd71e80778
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wZkbph9Jf62czvAuIrpaiD8I9dFZzonoEw2VCimpGqFLL9vZnNeXig/bS/FW?=
 =?us-ascii?Q?TI2EKeAI4iORdba7zSR7NrFB/BBMIIDU/XMS5BXK0LsffQFdBdUwkhfySmsT?=
 =?us-ascii?Q?VoaAlzJb7vhGn5o/uzguwni5nsgEMObsGxL+gabxi9UDPWjgGyA7uZ5l+EB2?=
 =?us-ascii?Q?6ZSWurPwZukk97gpvweYNQNN0XSGO+HsR5YuDWbu8AfzhYxMcx1Tw1dP9Ixv?=
 =?us-ascii?Q?4mMgtBc7kPKrFD8bZqTW1CGlrg1LHVI6mA47UdEMPG2u9qSR7RD7x1+fni2u?=
 =?us-ascii?Q?2/Rt9LVcYCJA9PpmJcsT1KnTsjqSBDcU9jB1LXbfAMZFUSplDOjpBpgg5d8y?=
 =?us-ascii?Q?odg8+0fVd4bXMDlRWWOATA5Ohub/rk4xuLT2wYbHIcAbH4/xsu+zSjUcj9tR?=
 =?us-ascii?Q?va0FDP7V5Mf10Ei3CrfIrDe6IotzblCxIMASz7pq53deLqX2CWpodkHK5YCf?=
 =?us-ascii?Q?BeqkYmusVepVeZoRcV/OlshhZHlsP4PiODhi3DYpRP1se9L6ztPVeekus3JS?=
 =?us-ascii?Q?4a8CKGTlKv/pBsAXmIm3H5/U5qhSETz0tjA2LJJ+5bg68t3G+ub3f/ALOhKB?=
 =?us-ascii?Q?aDs1kVizanptYWyycKNs4dZg+I6BVBlHVeiasfdpjXyhxEROXZyYbIBTU3v5?=
 =?us-ascii?Q?N9sihidoCLgTLGTdaZfblHnGwV/ZnJCn2sKD5UEf8Q345lmPd79AFfylxlyk?=
 =?us-ascii?Q?gIwbfCEQnxXqkLQHBm9XZzPXh+xZC3NjdtVJXwv62I7P/gakGNqMaOkTSSXy?=
 =?us-ascii?Q?ccfNlLOtv1SWKrvZB+nW7N+mrkVUCc3ZDJwXeur/W84mF9BYmh3+RDEffTUM?=
 =?us-ascii?Q?Aj8Y2h4KjlCjJIyX1T+CHFE8vGSpb6t/E+/Ip06LnwrMnFQFdTimSbIgvNP9?=
 =?us-ascii?Q?f9lboKbLeqQ+ffncxaDNqHWRETJRrza6hJEnBzna0LF5/CMmbZ/k8VlQ1sfI?=
 =?us-ascii?Q?tzrWypZ0US8bibkbxYATa9tYH2DYD6qKdCV+HvKzcAger8Q2zO75pyV0eaPR?=
 =?us-ascii?Q?rK5HK0knE1KayIzL7wwPNcaYkGmBV4ixtCYHDHi7cLvCq+PL+wtZV132Rpjk?=
 =?us-ascii?Q?BbHeinOnJJUICgr0IlWV8sKTREMRT5TNKf1GUsHrVSTMYmgmvCc9ut3+WtBd?=
 =?us-ascii?Q?/ReNXwG5LEITXNuC4mVaNuyui9TpIt9Kv8/Qhk2qU6bOPyI8jZc9mp2gP/ib?=
 =?us-ascii?Q?2W5r4Wn0yubp2+LljS6LtfYFUSsmWcsNdub5U5sMKrp1OYflfRy6gIQuCMvJ?=
 =?us-ascii?Q?iiMUAXe6gsBBCRzhP3K1BDozT+9VMzjMZpKQc++6Q8fH7kr+iYOZW5AWVThr?=
 =?us-ascii?Q?6+c9Fui5c4vOPzI7W9s3axSVN/XJpnK6i+OZ8bZVeMENMgB3u4GfVNwsc3eZ?=
 =?us-ascii?Q?QVgjxJ1JXuOWEMSBg8cLfiJI2NnXZJV4UTPYKwkMp/lxLyqYLuBNyLuJPuSy?=
 =?us-ascii?Q?+WO/iIcuakdzuExFDzM4boletFUWv/2n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1QSSLIzpiGJ7MjJXbG1j9iyHPYuaadoiM4K0H/1pQpuRqXXtaamorUJ9nznR?=
 =?us-ascii?Q?bIQx419X9ojXn+1Xc3qb9vwYdnivT+F4I+Aes37gLUcuA8Ykf3AIKI78cgZv?=
 =?us-ascii?Q?pJsOWPBP+2QAKtKr6pMuN4lUa8JAH9P3JMWyfsGi3wx0HbNGd0I8XM7oS2qF?=
 =?us-ascii?Q?WQJ2uGLRvj1f7i8J8Djd670C+ICFxuWD/Po7PsB77+ChpAOypcKgyOHvIg6S?=
 =?us-ascii?Q?AmwfY1ceKnGq1yMyT86JlWLFDdbuwcvRq9xbQQplG6j2aEtyToXc2WF7nVCw?=
 =?us-ascii?Q?q2F4bpdd2C1NJQtlCyVJ6pe5t6XaIk6aPb8Dd7hDlOnH0ROjPttnenbOKTb7?=
 =?us-ascii?Q?VR1+ZVrV/U2E7adsarAt723rOtGLHXy9gViDXEsQKqlJzqKNdUveXK6cm3CD?=
 =?us-ascii?Q?8zqTLNtm5dPIz5jUgx/XQnwQ3tfGROjQrZmiTWmx9WhmPXtVolXTHWvVf969?=
 =?us-ascii?Q?J+4VKiAe8RRwB/hP9/S0zxP+ODYrNMnLORC6JuaouVuO4Zy9f0pLyqefCh+U?=
 =?us-ascii?Q?iu6uVwn6hDLReZdMKQubIBAmMNIJXdMZi6pzDDsNml6PX94mL7E6MoZdRb5b?=
 =?us-ascii?Q?dxnnmgyzAluabN6ALgMKxkoDU9AISSjlnj5TmL/vyPvNg0E+sM6IsUM1hHu4?=
 =?us-ascii?Q?iMfHBzjqsmATvELISrIHepviphZznVBNSrVCau0BSQfPFfG7L6Jc0HWTQwOH?=
 =?us-ascii?Q?BD3gaS+jN1iCCFgPrynOR9k5Cr5fu87VVnjZj+zAq2gC/OOF8onicUau3f9A?=
 =?us-ascii?Q?wtC4GB28kZ+7B3hrnFZd1yjc6RYDGNedzqYb43tdyCYq11/BfhWcEFDMCmtN?=
 =?us-ascii?Q?qONjHNe1nlvLiGTO5v1Kv9SkSFd/yVzwHIcq/tZnwJxUC9oTlPFsZQqRXbhL?=
 =?us-ascii?Q?BYlg26dF6x2P/JNScg9kR9ekT7nzAhlsc4X09E6tuWcNYSqm6cNRIbDpWaEF?=
 =?us-ascii?Q?6NxQVeIBOxINv9xE4/ESdUilsfht26qJw9bypR6KGxvbtYWeDNGbDj2dcLyh?=
 =?us-ascii?Q?g8QgAWG24KIAbLb8Oc8tXnInxWTczwJCKlSgvVvaKrWgTv4Q0aqiTEByzjfC?=
 =?us-ascii?Q?VTXWNfBIAXeMgDWVZlJuW8MmkOdY6Rwr3m4SBN/XPEgd0JA4UzP5angZTad5?=
 =?us-ascii?Q?mvw0dCbhocJKgo3hXSL62TD2ziWba5RtOp2RmWuQdM5z3PRQGaa8L7NL+pyb?=
 =?us-ascii?Q?SuF111mN5e9Jp/bhHrwEy9C3+ufZBZuhEzI8GA5KLyh9bXWRA63YEwYtUbAx?=
 =?us-ascii?Q?r2NBU7WP87wvMTPP0NOk3rHJodV6KHiFezLOsdzUDpaAqpDqDthnG9PG++8i?=
 =?us-ascii?Q?YLvY8qVRQTuiQ6rWelBQP0k6m+EbAzGustxFb8J6Ydl82BcYNVUXuTJWF/9t?=
 =?us-ascii?Q?8DoAIt0LwMkzh41bUyzh3P/Rq6lHGKv/hOki0S6l1/DQu9yVnsEPb3SoRhs9?=
 =?us-ascii?Q?q2MOeISUY85IedNBXCRFYWEMRtfp3xbnBsjxy8/OcVc2hQK/dyIJULfyQsRO?=
 =?us-ascii?Q?fgEOwTOWLI7NMNvW8L3bVQjyPAZQ8QpomKOe1v7FQsWZgBO7iUcaeaQVTCDq?=
 =?us-ascii?Q?Da29B48AcSgszQXdnEkIDDrtn64lkiITLeO0/1IHajQfqV/oW7qczXl4zFXB?=
 =?us-ascii?Q?OIj49CGIz87BoUty+rEGPq0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c6145d-3daf-4993-3b55-08dd71e80778
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:12:33.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS9UXgZOHNKxOsh2DZcEJgscm96YHwJz95ESreQtvUS6Oc9R99zUFAx37N57/ssKzLp+yuEsr6k1mHhft+do9FehWs9F88vmfKx8tJVjKyzOGGGP6hLM2BMglA3Hv7eA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6688

Add CLK_PLLVDO_GPU along with the necessary clock and reset entries for
GE3D.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index e9cf4342d0cfb..2aa1e0aa4d36d 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
+	CLK_PLLVDO_GPU,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -96,6 +97,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
+	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
@@ -185,6 +187,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
 						BUS_MSTOP(2, BIT(15))),
+	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
+						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
+						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("ge3d_ace_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
+						BUS_MSTOP(3, BIT(4))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -214,6 +222,9 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
+	DEF_RST(13, 13, 6, 14),		/* GE3D_0_RESETN */
+	DEF_RST(13, 14, 6, 15),		/* GE3D_0_AXI_RESETN */
+	DEF_RST(13, 15, 6, 16),		/* GE3D_0_ACE_RESETN */
 };
 
 const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
-- 
2.43.0


