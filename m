Return-Path: <linux-renesas-soc+bounces-26184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF217CE96F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE5A302AFB5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932E3262D0B;
	Tue, 30 Dec 2025 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mSmVGf2C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0112BE625;
	Tue, 30 Dec 2025 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091233; cv=fail; b=ns9ldT4m6P/vCOAqlzSXD1Q1Q7Qek/X9l94JJPV3dv/f/jfNWwAWI3v2zhERjPEmoifjFaXrQWwqBLjA545Jf3GKxhRHp8yMK4pDDZ5jc12G8DtR+2JAyPbA0pku+uOJWzZC/nLBTJ8R/jodVZEcP5raKYx4+WiLjIU79blgRfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091233; c=relaxed/simple;
	bh=gmpHAnzFNttwDhhDXbpSJaAvBr1cCtGuyW9NxeMpnSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gp4f3TaaFJ8fLlx9usT4JIBA1fEiyPgu6n/6lB/j44ijtfRD8FM0Rk/V+O/zHTotU6b+wY0PmZ86MDHkVYQiPT3BX15euUxkp/qXsw8Y0rh75IwX+1YxBDDQOVOSQGeqsUD7YOEajLyq9kEpxYcooQ9ligjLo8LP3QnqRRmmqnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mSmVGf2C; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li0iGx1Grm+Oz4CtsvyJj2pejTC8RHvuP57pwhlVZV0RejAMzk+n0y8S6n1ZindSb/x6ARRjC9z4kySN1G1SQNfzaomc3Iy3+xqHk31qHShiNKqqXC8LS3xhIllunxjt2FCiAGk6uIWDsO1JuRPaIguf3kDaj5bznFzAGQY3frKMeDhE+eTSs8d1teSkWRgGMm55AC/10pbGMdF1QB5mjY6XAbhZYBs90OmPrUksVanWxYrXVKg+8E6O/xZzN7VVzwAQGOk08GdHTnufu+Sc9KuMuqMpdA7vLHHpGAR/VHeI94QnrFY28zYhavzsHmovV8Hu2bVA0CztArNF3X27nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIp8EuxQxPL+uPvHJFY60QB2b4NVaELOBeJ887qthWw=;
 b=qyHIc4wUk2WF0FUWnjleI/tEv6UGmh82RpPQa4V4Ek/yLMs8IDY0trS2fWtuqx4nN6gKeF2yiX32oQT/jyF3a61t9HbxWwGuCgWZkN47cOrMtIQAVQh2F7DurrN1Tw0u04v4XPMJzcvVhBpGGgvWCbzgfLc9ZlDVG2SWzNM/BNk3PwwBh+MylzSAvFldZotZ9nIpm4qKVbdTJkueYgjjgva3ILHSqmBqpg7mwwFeuxLNFN97bOXA+rW6uefpDH6GkxnF/98AkWXEmq3Z/kaARoiTQ1dErrFBSElL4p3PkyRGX1nMmGV5Q1T4zcFhn4ZWpGRSUKxiCQEatUuQPNLD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIp8EuxQxPL+uPvHJFY60QB2b4NVaELOBeJ887qthWw=;
 b=mSmVGf2CHMZqwNE5w4l18TTorSKdzR5A/dplJTpk+36utDJE0UtTVuuZYcsiCP3nHBhn6k2xG3eRVchuTqqw7SnJrY/4ccr2kHzBd2wo8VWtMbNXaYE8xgCYtzU39wxIOs6ZIWT6ARq4f/wmEbbRXFNEvzC40eVVr33hFR7Mqio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB13563.jpnprd01.prod.outlook.com (2603:1096:405:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 10:40:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 10:40:26 +0000
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
Subject: [PATCH v2 2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
Date: Tue, 30 Dec 2025 11:39:37 +0100
Message-ID: <d335f1986e23e75b10a5e9f39adbfbef94c58a38.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1277367f-4cf2-4d8e-abcf-08de478fd7d9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X0rfRLnMvBIhSsVLoh6U10FFS0i0u+BdLZUP12AMbrWUn6YbeFRJSAQ/5MML?=
 =?us-ascii?Q?XSCDFPPJxA8EbIZF8D4dY3MoJUC6BGM1wGJGowv1bn6w+CcBORo4hlaJO4ZT?=
 =?us-ascii?Q?T0ARcR5dxhR0JgWrIlUJGOkOWzQMHB+A/wWAngkg8r1rxJpb9KjzFbmLX/CQ?=
 =?us-ascii?Q?yFUqC+lEEN+A/9v85Sj+1P01MyXnRwigmr+pmrqAN8diYqgXoaLLZDnB7101?=
 =?us-ascii?Q?k/0nIKITaudC5LDZ9Hj7eBeRP0BWq8Ss7nvfHTnK+/8cWTAcI04PfxJ977xb?=
 =?us-ascii?Q?t43gkdV1BBhtXl4GrIR4gV1AGen5gM/1MvLe6Y0XCil5ASlMKHeGPKSQ3Wum?=
 =?us-ascii?Q?MoijEoJP+dSFKFEaPS3ju6a8M/ADGOGUKjJs6siQgEAAUE/oOJlz6GnH2VxW?=
 =?us-ascii?Q?zirmMyLxeWjygbiyGoFXIs9czFeaEUy1BAOENHuDBSmjTMvxMXlH0N8h2sRR?=
 =?us-ascii?Q?WBJrOgtFavX9z/z0QH/tloi5a58Tlzzs8vClJAOchIdOMN+XmcIYd/7jbCOY?=
 =?us-ascii?Q?mQ55VoUB3WQ5WdZDRK2wRTUSu7eRtl+xjgHYkAoSsut+cNdS+FIxLrzQ/C86?=
 =?us-ascii?Q?Oxpknv067fWWE0PwGvGapDw6BHHj+Meo4TbJUfnJV9B/yR7366SrpiXrMkLU?=
 =?us-ascii?Q?CqojjJTAiuHX5xU+ve60JIH6rEsnlAiaeTxaycY/a+tjpugxdhe6gthR/SSh?=
 =?us-ascii?Q?hMbw18i3dEn1dSKhOlU+Shdp/qLUEMkwflYnmLUxo5GcWzbSaBObtLMP4DTA?=
 =?us-ascii?Q?SlvsB4Ed5E0IWPZFWCHMcUQ0sm9FFNl4isJbaDjaS2MxLhD8G9NlLhr5O9q7?=
 =?us-ascii?Q?TF8O0NiXOxygx2VtKPfknemryMCRgC0n6MpJ3169/0jCfeHu1ReoXIMr3mbr?=
 =?us-ascii?Q?lYEM89DV5qNBuZO2vHcE1zwlEMbyKeQn4EDDhzTKpuw8vKb1wK+Cct0m6r8E?=
 =?us-ascii?Q?5A3m9kiTs3fYaKT/B/m9oMTI2fqeklaYMQYFlJuwhhMQHUP9J5BdiyVBNjkv?=
 =?us-ascii?Q?eJSUxdHA45QAgcURo2V9WY0W9B2Ms3I1PxlLmPfwhHOipwBndEnbEQBidnSZ?=
 =?us-ascii?Q?5uZHe/G35RETx6NpIWhEsqqj/z6dqKDViNwaRw12mrz28jTsEs9dR64TWMCb?=
 =?us-ascii?Q?iEuHeta7yJUCKwr/s7z01OJaP2uygaG2L7DKnyoYIG7BQu0tNylvKTSXIxEd?=
 =?us-ascii?Q?CSv4SLMx3djx1CwnYcInUORyfiahcXqoCoQEpsuqZsjFPmUFlNvIugF4Zieh?=
 =?us-ascii?Q?E7tsfkldbisL9jdZq76tTq+n86exVGUUek3+RkbUfjlaFvQYkjRB5DkjEZyD?=
 =?us-ascii?Q?BPUCltZYj+rnRTSOWKTa1PMAUT2v44GkWK9hapvXganehTJBa/SRpCHKc8Xw?=
 =?us-ascii?Q?nTQzVkDlN+xcdecmMlVOJ0xbE/mnJM9rCsyZ8YU+V1wE6//kNp0fTL7a3K/U?=
 =?us-ascii?Q?CRI9igL6D4nrJwU1P771dEuQQhcHjfOdyPSGzgeMaSQ3rmEqw8fNVoiWb8EV?=
 =?us-ascii?Q?Pz+hT+Wtfuv3haxlJU3OyNgH4E7KyylvBq7H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qUtFifibVA/FVCXlefgpoVeVKYcXXCQ5b/j1agP2F8JW7U1P/oNZyk0rOlf2?=
 =?us-ascii?Q?jL5BAj8asuu9IGYtzzEX3Nx8rD3c/zcxtdGdTTmDWSnPZfGlmtwa/BOnXuTJ?=
 =?us-ascii?Q?rRV8yy0mtl74+f3bhghSk9tZ5UYNNGy2JoUBDLNDI05/1kzJrQmPjSiDwaZi?=
 =?us-ascii?Q?DdolBCvjlxiosTVm19bEU0wt58EUrftSLRhyzkEz9rXCsNqu+SMhgrciqBd8?=
 =?us-ascii?Q?5Ltfm3kYk68RW6d+ht4MGKCkI0CI8KYgJZcSkMFnay/FSRAk5FyWWj7dPwS5?=
 =?us-ascii?Q?VuVtUPtcODwwgh/bt+PP6CWqWXU4uI23QfZk5nAHl0EA3twVydJFW0EUp4/4?=
 =?us-ascii?Q?GHJv2JREWzB8c2d/RAFqR19eDQJ0VVpkhHvvY7dwYlINgXfh9G1p6SS5vjvs?=
 =?us-ascii?Q?ojpEBLCrGyCWGDeCu7zFTpxEN+hPDU8HSRXbpct6bjaRs2/ap6fwbxQJPKRZ?=
 =?us-ascii?Q?V8oDZI3E+ksy6N7SANdCvcLuN9/yRx9qtMU9eJaxxxRIX5bJfcKsb17b5Bj6?=
 =?us-ascii?Q?IDsborF7Fz1an+r5C4GW/MEqHTZXGtYy4cgnhHgUBbaN5bS4FcgM0vI3C3cz?=
 =?us-ascii?Q?Z8tECwX3hbFJSrhkn9ED8ms9Og7kjhtRs61xftN+mbatRauEO9mbnzdyBSEM?=
 =?us-ascii?Q?EQpOJpA+F5f4qBGmcVIqanIYJ5yQ8OkPaPMB+cUNbYz4gCe1xu+U8LoLRioh?=
 =?us-ascii?Q?Vfr58oQ4JS8EZPBZHBDb/K4vJAFOYS2OrFsniVp2EWwZmLmZ1AQI/vO6YNfp?=
 =?us-ascii?Q?8h0sdUWZ2kc7uxt1cgBeFe9o7kF7rEhYAUd3qwoJOjS1xOG0ucQZlbaDG3D7?=
 =?us-ascii?Q?5JvYt6wSDFy+i6tp2brtvTMFJBIHEEWAiq9+ICMCAT9hErrV5ZwPMCw6Rbto?=
 =?us-ascii?Q?bziYn/3eyDP+wLcUkILmpa+QAa+eOBbMtxKw1Gt34LZtTH94bwjbwdldIlU4?=
 =?us-ascii?Q?oRFlqBGERK1SwE5/6rFScVgUP47pctRItg61XfrcAHzfn3Rk8t1fy6KeOvpn?=
 =?us-ascii?Q?flKh2TexXfUGY1cYikgXtmrPP2ZZlAp70dh4wRlOWh/sn7B/B0h1gKT7u9y/?=
 =?us-ascii?Q?2ijpKvbEX18APYv7OhpJfOM5MRTTyjzO0MemfHxIE6chQyMozBQwfIZm7lzG?=
 =?us-ascii?Q?d99xB3M3HXhMp6Dta2zwmJnUQ4H8u2+Str2q/OFLWrhIwdkIXMeuxJgN3/N1?=
 =?us-ascii?Q?JlbtrPnjhrajEPe+GusOw3oUglt7m8klEJyaUlDY6d53zcF6IgPZSmifMoZL?=
 =?us-ascii?Q?zUnolFfZAPfDR15MdTywcOwBFfPuSHsMYvt9Jk4SbsJQT5MxKrWtiVBdRtGB?=
 =?us-ascii?Q?0GivzjksXlaI16oREyqh3MHjV+BFoHriV2Rj4gTODq0+F/lJCGZNCVvnAfCy?=
 =?us-ascii?Q?G2BVt/VR2MVopRslClDKAPZEGxt+c5M38HHWlCDduJqxsN/nm568TtnDNRTo?=
 =?us-ascii?Q?S65GmgV6C1mkoiGS4fzjP4haIBeebiDEYeQvex/2Zw1FUALQkF9Tpyl6KNYn?=
 =?us-ascii?Q?yzVus7evk6h/XVCPaLqWg9XqNJwvKOn8ZSQt81aD5Phb+pz1sxA7vgBDxt7w?=
 =?us-ascii?Q?zbjSfd+iUlsAINo+O+sCqdTvZWLZic4ij16uXjlZ6/3gURgftCj7crrTV8P3?=
 =?us-ascii?Q?k3KLGC4eI3gwIaHLW47WQvcAnMAjAbb3XuYS/rELp5lw/IOlhE3n9wVvAYIi?=
 =?us-ascii?Q?c42ED+xSotgBqfgC1jqyGVZ5DFjIaZk2KZfsRoLsK20pUWN18s0xbrvHN+Q/?=
 =?us-ascii?Q?BpdXW26g9oaIQLKWbb2K5ICr8LdaSxFFUNfppikzHVG3jgG6hbjU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1277367f-4cf2-4d8e-abcf-08de478fd7d9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:40:26.1299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgUjRohfxsgmkpg15xtCPsjdef1PkzKu2huAvWDLl17zVPIrvpXC37P5NYCqB+9/nLi2GhcsLvRYQouBKNECr7J4N3E3SdaP5IpIyOHT5kK2nlRfblJL5KjR2edijE36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13563

Update the struct renesas_i3c to store the clock rate, presetn and
tresetn handlers. Replace local usage of the clock rate and reset
controls with these structure fields.

This simplifies the code, and prepares the driver for upcoming
suspend/resume support.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 39 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 8ef6ff06df90..2736363c9074 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -256,11 +256,14 @@ struct renesas_i3c {
 	u32 free_pos;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
+	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
 	struct clk_bulk_data clks[3];
 	u8 num_clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -488,22 +491,21 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	unsigned long rate;
 	u32 double_SBR, val;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->clks[1].clk);
-	if (!rate)
+	i3c->rate = clk_get_rate(i3c->clks[1].clk);
+	if (!i3c->rate)
 		return -EINVAL;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		return ret;
 
-	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
-	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
+	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
+	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
 	i2c_parse_fw_timings(&m->dev, &t, true);
 
@@ -516,7 +518,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
 		else
 			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
-						     NSEC_PER_SEC / rate);
+						     NSEC_PER_SEC / i3c->rate);
 		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
 
 		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
@@ -524,7 +526,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 		i2c_total_ticks /= 2;
 		i3c_total_ticks /= 2;
-		rate /= 2;
+		i3c->rate /= 2;
 	}
 
 	/* SCL clock period calculation in Open-drain mode */
@@ -545,8 +547,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
 
-	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
-	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
+	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
+	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
 	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
 			STDBR_SBRLO(double_SBR, od_low_ticks) |
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
@@ -597,13 +599,13 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
 
 	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
 
 	ret = i3c_master_get_free_addr(m, 0);
@@ -1313,7 +1315,6 @@ static void renesas_i3c_clk_bulk_disable_unprepare(void *data)
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
-	struct reset_control *reset;
 	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
 	int ret, i;
 
@@ -1345,14 +1346,14 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
+	if (IS_ERR(i3c->tresetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
 				     "Error: missing tresetn ctrl\n");
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
+	if (IS_ERR(i3c->presetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
 				     "Error: missing presetn ctrl\n");
 
 	spin_lock_init(&i3c->xferqueue.lock);
-- 
2.43.0


