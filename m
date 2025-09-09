Return-Path: <linux-renesas-soc+bounces-21593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ABDB49ECE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 03:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2E5F4E3CA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 01:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D90B22A4FC;
	Tue,  9 Sep 2025 01:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UkczKZHl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A977230D14;
	Tue,  9 Sep 2025 01:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382305; cv=fail; b=FXld/LuPubRwyZNpRkM9/LU7GswbH2od0wUooumGqCCilAhUUto9CembRI2wtCYr3z28sQsjl6Ue1kwahlmf6HQxfXsRy4lwXCB04Fi+tbHBVlVEY5GQtD6T/xshWacG0lFndc7/l0JKC00n9jG/azIs2SsWuunc7O+f8SXa2DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382305; c=relaxed/simple;
	bh=orEti6UFnh3Vy4Xxwx2cANt+9qIW5y3OLZlrpU54S/w=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SM0ETv851FuUpRoE+jj1bNA/eLyJDSbNfKk5BLMPurtEgJwqc2yYN8Xnu6rOyT60tTAze0PEzDnX7V4O6/9fa3VswCdL1uJ9T7BcLBYM2nupdT87y7c6yq+Aq7Vpqdwbx9kj12ZdAkTHLnrbkDitrZoYDYYM+06oss5KygGIKDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UkczKZHl; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYfO4n8/pDYQ4+FeV037xBUMFC4PjULmWi7MlJxMsIYTDb7jSH3B9KgERWXTuvCu4E2iwyC23+ID+HbqBeygUSL63vZsPQ25u1tlpUnlLTCsGqkLowdRwt3G++O7gn8jdy5E9jebLT1KrbAYUL2fTtFG3gyqZQ8opFfvw+ojpoGcTnIxLdrt878Bx6nS0gAh1NZ74Ay2WfhpE8mtzX/KculUXUnFPLw6SZBokLfB5PmXOIZZ0MyIBruqjZs850DD3t3rpg125Xjjovj4Fqnr3p92cT9lApAIw8lVaRu8/Q76Zi0T3VN5GMSVdli4gLoL4mFqD+ev1PMl834NwZO0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFulX4+1jylpM+MYZN7I3MYvaLKrWUQAkcGZhIQaSBY=;
 b=m9hOeJGbFmCgseSUyMTf/Lfj6MT3ZH5YpZ/ZrboK3LpSOBOBDq/0i9L8g0bX7eiOy63eGka2DHrgEA3pOMsMUKbaDM1j93MCScYMd46cNq/y7tCXYrX3POhfgDNei4kDI/mJDngAorh90G+h6WKd0zuURDyjQQtytuh2usyAaseOIaiDJQmv7+4IclHOXm0FYpAUz9Dzq2ijGwKDmcnOY0WqnxffZ/Th6Hmuz+C7HKISxnfhp60v3uJbN5NIukWAFmnpqLOqKUhT8ag+JGkTttn+5BcldYFXB62WKEJTNpffJmpoChKnvnzDtcclqF97S2P1w2tzRj7rXySy//w3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFulX4+1jylpM+MYZN7I3MYvaLKrWUQAkcGZhIQaSBY=;
 b=UkczKZHleizpNIxxmHePAzUKxNNNCRFFAkyNGeARcsTeB9Qy/eS8nGUQ5cwC9elCbMgh7xCC13JUQnOx92TmDuYdWQqFVckLt8dz+EPZHJlHDmeG1L98GPSXaa6PfrLgx0608AfBEdkEIMVoj2cT3oKuC/nu0V3trPXJuxtbSFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11404.jpnprd01.prod.outlook.com
 (2603:1096:604:23c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:45:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 01:45:01 +0000
Message-ID: <87qzwg9z6r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] soc: renesas: Identify R-Car X5H
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Sep 2025 01:45:00 +0000
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11404:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da8bf7d-3d31-4663-4fde-08ddef427d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uhbkp7XFmln1JQHU5hOAMazwbp+2y29p0Gsw8ijYhgxt9lxRZ/QAcB+PDK+z?=
 =?us-ascii?Q?lJ8oMkATV2mvviSjsA3bIVlIFLM8e4QAFMe8erwC4zXW/U6qaGJK8mQw6Osq?=
 =?us-ascii?Q?T2wL0pmwn1Gzx5LFoqQI30zVS+c1kJsp1IpvEdXqzAsbssymKcrgDFa8IVOl?=
 =?us-ascii?Q?f96RYvRLBa33Stnh7e/7q+yjnqUEPTDK6flateARkbpcblDIQMhP9Pfp8EQH?=
 =?us-ascii?Q?7ImZJIF+ysvj7eiKsfWjAaki96JJE5LeKTvjD/BZ+UGTZ+RAiU8wVUI5JBB/?=
 =?us-ascii?Q?sQg/U0zEpJZ4JKmA8ovHfJnbk78eF078cM5s3g16jR+dmD2TyTC1K0Zw/iaA?=
 =?us-ascii?Q?VPyqVAJjYRe/zxZNc2llbf6M2oPmVmaK4Dgnrh5i9KzCBK8/YpU2M8E9TFNX?=
 =?us-ascii?Q?X7J5YZxXRnMJt/z0Q8H8olxWAOd+3mtMZDUINTPiL/hXl8+4h3HkX2cIJLny?=
 =?us-ascii?Q?28QhgFGjjODCkO8FXsS/kPvViDWbiSm2L5IUDFXX4WvLgPwrOK3mG10a+ScH?=
 =?us-ascii?Q?xzz0cuEM4bURROvMUtDTZa6GCoZ4XYCtIQeqaLw5gLMeWBm+LDAq88zRkCht?=
 =?us-ascii?Q?m2pIUvPfx9bRH1J/T++wPTTrdaIiuL3lodfnTNIW5MmWPiC68pJ919/wmwna?=
 =?us-ascii?Q?VWrznhAsupX57TfUxQ527zsvLGv1oXBxXYzCi+MIUdllAkb/WFM7yVH8MaBH?=
 =?us-ascii?Q?91YThmOg2vQT2SSpZ/o1q9WuPFz5+24F8He2nshTfnBP/km/+BEftrSkYGha?=
 =?us-ascii?Q?3+CQp5mM0qupm00fgat6zzdRx1g62L9cTJFfVopWzytsoQ7F8ptp1m16VyGy?=
 =?us-ascii?Q?VF7d0Eg/bvRHpZVmN6+FbfNBCe6wIXmHITaYeGtImPpppvCARe13OPzah4ey?=
 =?us-ascii?Q?LMmPyTT79mEyzMJGBGUsc6Yd+PzJv4npKfTrPaWldDehBvYYdALNf+Ue3HxF?=
 =?us-ascii?Q?RAWw963c9vtds605LI6AetYMAxW0cLezFQM63f5Z/rXFW7uVJQEqiqWjmEdE?=
 =?us-ascii?Q?TvIsAl0Z8D1BKX1fTVKutVSxTP+6a31fTKab8mTg2UcMY11pFBOhEjNsk3eU?=
 =?us-ascii?Q?kEzaFNljjCi6lt1fXTY9kz8ElWbnPI3BiyxT04MvkvEhahgIZhk3qcpTE9jN?=
 =?us-ascii?Q?dhFafIndc7Q3bliq9G8r/2jqyhUkdHbYb6/AgPmAx2X/DNonbRqQFnhslc4S?=
 =?us-ascii?Q?v5VZxvq/AHyLyxlooCuihjRkmUp91yojI/jO5LsWCQoicpyfO+If58ZqimIN?=
 =?us-ascii?Q?PeuUnAJHrfUMRIJ2HsoueF7UHQ/xrKdxn1uw+3RKazaPWIcMQ6d7WseU9j1M?=
 =?us-ascii?Q?PGYTrPZ9QoU9sR8JebWohGDhYy5W5FjJLOAhf41iqtwP7bl6+hitUBsiGBWK?=
 =?us-ascii?Q?RHe9deR3INStqbULgVL+wLqvMyrDEGZYWfTxStmd0LlroSqqz8vclcqlj3ut?=
 =?us-ascii?Q?wE2sns/VIjxd2MUR8+S4hZwEBMThWe2V0UVPAcdNK5xN2dTO4I/fgt+DuPFT?=
 =?us-ascii?Q?qARoin9Vtrw0dng=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sLeRnr4RuHwmHahGz6f5Xgzfmd6zmOkUsEy+bUbZdB9xd3jvMfnpK5mmZrzr?=
 =?us-ascii?Q?5OzhC/jI+4SfYj6/QLKLGZG/e9ZR3gWkZc6yMeXRTcXLF0DzmKRyH3/5Y6km?=
 =?us-ascii?Q?it1a9R6rapXZsY9/HYBvT/aYISig1urdKpD8UMruSz8RzKDvuwO0nsaA064U?=
 =?us-ascii?Q?9ElsRcUSaKuGu44gWHceGO8Xt70ACfKIprql2cOn35mAi422AfKns1hlP1bf?=
 =?us-ascii?Q?MpwWIWo9l8u6qOSbHFMJB4fR2Ulxwmo4iAVL5tBvBuDLw39Yb2Tl61C/3ECq?=
 =?us-ascii?Q?/5gGIr3EiQpeCs37X42BWwV0vTc+dfegI2di6AAc8SyYduJosrMfrM1uslH4?=
 =?us-ascii?Q?juHN3BynN/d9qyYzjkUSu1uG2JJZuqOr8knIgTLKMiM9qQeN11rt7t2/huvr?=
 =?us-ascii?Q?8TSW2Eyo7XurEobQdkgLuZcWzeqJtgIaSuBr8HVDBn2xgqsHx6fPYMYN4NWQ?=
 =?us-ascii?Q?FZ5zLSVB3k6x3iiYp/zX69AcHX/HnkKhIK+ds+ypthzwivH5n1p6d3wWA/hx?=
 =?us-ascii?Q?58OAxipjYoAFyDF9bWBSciSuu+NwogLMkfghfcl9Zflj/rDuXZypXxxEhwDj?=
 =?us-ascii?Q?84JFMgIhXjTUTU77kki18OTaL7T2z1rB/QMYTniITEvbW3aT0bri8ATYSOud?=
 =?us-ascii?Q?6TPIG2nBkyrF8m19Ta8AfazbUyAyEq3Gyo4/WOS3UbbJ7KaA3W8aUiWJxwYI?=
 =?us-ascii?Q?zKyeR9McAA7voJjzB5JSwrg055m2/Gf5tT1Oxu6YIbahjYPdRjyKpfBkOAXw?=
 =?us-ascii?Q?xEjDOiIwEMc89xP4A+j8KKaBdK61C2Eehzw3JxQ9g/7fTVZZZ7PBtLT1AuvW?=
 =?us-ascii?Q?Z10sKfyRRaTh+oV5Z6l4NUSeUYiuWcpHeugCa1XW8uo0PMolInCFA9kOYmVe?=
 =?us-ascii?Q?JJq8XjpQvRfeGjBQjyBFkEKH/EbbGn60d+ferKQu4eY6mVNDdjWZXLNYBjbQ?=
 =?us-ascii?Q?dkpGuRHxtQ0R9gSCNxbVOPQ63vXh2lxZEkbOLAvxfAz+Z5JvBvwEaz+fnpT4?=
 =?us-ascii?Q?rxb52Sy6kUO3cCpbENZ+Lq0w/MN/GDBwGZn0CUXw/EHkAd6uFpIrpQYdsBJa?=
 =?us-ascii?Q?VDzeIjj9GJRCtfPWAEBf45DpYHg85yW2+mJf2DoeUFK36t/VxxjNweVOnGVm?=
 =?us-ascii?Q?Re9GrV7RSbbUFxKV1ZPpIXUrrGRDqN6VMzpaBHrk828ScbwKpwKYbGNN9/VO?=
 =?us-ascii?Q?++qS8/QOgbdQRE8rSQXlbCBbpz/Z7aojREQA3ttFuUXTAds/vTtREtckZejM?=
 =?us-ascii?Q?5Wkz3h5CXM7Hq3Q7B8d3AWpR0tTcZONK4tXxdbNBlqoj/IuB/4GS0EBTzv+A?=
 =?us-ascii?Q?sO9nsBblRAQhv0mmnFlSz/vLZ73duPzAJR/4OB8A7bPJwUNsmT/iQ82gjl5w?=
 =?us-ascii?Q?0hnJtFnc1WGwacn5VdXg7Uk9U+jEcF80rELVmjSb3TgMdzaJXc7u0biClQet?=
 =?us-ascii?Q?xRiMvjpRpXdQ/JaQ5yNhFp7N6qQn2uR6oRb+InM0PJa6EPJQ9PkpQXj0t1sX?=
 =?us-ascii?Q?hnTXb9evuvIlr1puM4b6zFaGJc6NVaOmzCSZzZFHMBpdIgqcwcpz/tTdxWQB?=
 =?us-ascii?Q?H6QAcoz6XYoJ/ru2W49PWXhdGvFEnmjCwdsoS/D9VU7UUtRmQGH1W0tsBq09?=
 =?us-ascii?Q?KQrlRpKdepxof2yrqttCM0Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da8bf7d-3d31-4663-4fde-08ddef427d73
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:45:00.9740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tjwqtzd9X+5X+yslq+VI2DL8Uyv6RiiGc77fY4txYQ09oXqRy8B24vuTBYLpnJnU/ggb4scVRXlH/D6mJ2hEWffS8bnausgZHt6qoInuslWlrIxH0po05VBwRMHWiOA/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11404

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add support for identifying the R-Car X5H SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig       | 12 ++++++++++++
 drivers/soc/renesas/renesas-soc.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 719b7f4f376f..7229f4afb3fa 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -39,6 +39,10 @@ config ARCH_RCAR_GEN4
 	bool
 	select ARCH_RCAR_GEN3
 
+config ARCH_RCAR_GEN5
+	bool
+	select ARCH_RCAR_GEN4
+
 config ARCH_RMOBILE
 	bool
 	select PM
@@ -348,6 +352,14 @@ config ARCH_R8A779H0
 	help
 	  This enables support for the Renesas R-Car V4M SoC.
 
+config ARCH_R8A78000
+	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
+	default y if ARCH_RENESAS
+	default ARCH_RENESAS
+	select ARCH_RCAR_GEN5
+	help
+	  This enables support for the Renesas R-Car X5H SoC.
+
 config ARCH_R9A07G043
 	bool "ARM64 Platform support for R9A07G043U (RZ/G2UL)"
 	default y if ARCH_RENESAS
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index df2b38417b80..1eb52356b996 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -36,6 +36,10 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
 	.name	= "R-Car Gen4",
 };
 
+static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
+	.name   = "R-Car Gen5",
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -266,6 +270,11 @@ static const struct renesas_soc soc_rcar_v4m __initconst __maybe_unused = {
 	.id     = 0x5d,
 };
 
+static const struct renesas_soc soc_rcar_x5h __initconst __maybe_unused = {
+	.family = &fam_rcar_gen5,
+	.id     = 0x60,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -378,6 +387,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R8A779H0
 	{ .compatible = "renesas,r8a779h0",	.data = &soc_rcar_v4m },
 #endif
+#ifdef CONFIG_ARCH_R8A78000
+	{ .compatible = "renesas,r8a78000",	.data = &soc_rcar_x5h },
+#endif
 #ifdef CONFIG_ARCH_R9A07G043
 #ifdef CONFIG_RISCV
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_five },
-- 
2.43.0


