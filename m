Return-Path: <linux-renesas-soc+bounces-22297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B914B98360
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6A22A49B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1A328F4;
	Wed, 24 Sep 2025 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oDFbUqyi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162922AD25
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688331; cv=fail; b=t1od5K1dwBTkT/wsMxi4xaOWBSwP5EwLD/Ihy/fJVi6hMwc4cENo4/OZW1fM5bEOrbl0ReJ5wz39hMKAR5XPtEH0PxqxOOUKbnp0NoR2MCrAroAxolH8iCFRt1EyZGC+tDJYqtK1iXsEZDJct/V5s7cfzVmoVunFkXhZYcjTmhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688331; c=relaxed/simple;
	bh=fXlIvF0LZLI+rP9GxN0R3UZoHbejmIEOKGQGjGMuE7Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Rjl/wLn34UWGdVYLD9qxDAdfqT0OJ2vEb61/hOiyHqj+sQJOW1Pqz4LHV8GQuX2iCCj4X3Eq9NfePcqTuNr0VfpwhMLr4jxYtwaZrvOWeCpe3B2CbgVZhEq/J1JpwnPGajtUrFXzFDx0MDdJcNH+SG9sHzbWDLkv67K5qGaJBmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oDFbUqyi; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqncKT3XLhLxpx94YjkQy5/az+ycQsNlkPXdgXm/ZztnB5wYsA3nh4GWxWOWZ3ySb3hgfeamsoZtV+2/1R0dzf38BUjXtdB3wddYYtZ947Ix3c228+movTsnWwaDR3mV7vqXVkVP3jBOhxNmlOI7Hz7kwkNyBDUGMtp5Au4yDF74LoAHkbXgL+GiQaxuUA8D6pRMDqq6reKqJGQTMT29BsADGJ7Lg07KwLrkuuH3UpFD2KdZTaL1nX5fWwIhw/yaLyg7OLnGhI9ZiW8hD5ppkB8h/ULwwigwk6XODcDXS5682bEc16bBMox+ga7SKDngsLy0gwQiJhxLaRNdD1/afQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17Qd0YYK+GG6XKwP0WA9RQJG6P7cDjzEgDL5yR0kj8g=;
 b=vpW2c/ohVOfCqYRZMcZJkU52tfHuL3SW9PeHJRBWVW+HvuPDrkSKxjZ5cqDbgekJyy1HZjpcRam6JBSZ3U6fFJMPakTzgMc7CorGSG9Is+/lk3lD0ZhEKvl6lRI1qV5ui5/9YCcYYCF1po9G/WsKUDou8l8xYPOCcavrC5pvniRY+j7AmgzKkH1vNwy1fB6rpNBUvUKxjzknNgXCUjWUG0nGCJt/X+nWwCXkSzfu8y2QMBx2zhZrFrw6e+8Il/PXrGGRietEaNtCdV8CDYLYDVcOcdttn4vh0Arh4b+J49WpoqSn0FHyOzdnwkQSTgGYUVJDwUfUCIDkxavIclnsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17Qd0YYK+GG6XKwP0WA9RQJG6P7cDjzEgDL5yR0kj8g=;
 b=oDFbUqyi8sjGOdLHuPBMvdkMGzU+NMVM3XK89CQ2GTpOEIli3tI3kR4QmHy2/AYWRaut6OQIWLd1LoIJxUTju2j7h3uIFyLveTr/q+ImixQSipT/Mc4RbUyQ3To+0SnJ15L5JWKyT1OWWoxYwG0wr05ddSK49m3TEKpqMDP+ZTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:08 +0000
Message-ID: <87jz1o8o8o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 20/26] arm64: dts: renesas: r9a08g045: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:08 +0000
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c70c81-0272-4ad1-3122-08ddfb235263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F4MDnY24Ra6lwLEhJuyw9g4CWTRZvEeiMouqke45xyJ1R4QWSmzKw1OPt4y5?=
 =?us-ascii?Q?d2fTGRf3oRC7tNjZPclaNtlIp59FHIdOxoFggnNMDnA0LxmAq3Uc6NgiOYlE?=
 =?us-ascii?Q?AHmVWX68fY13NJShx3h+3Y78/fDpx4EpJd/kGSIOPtkDnzcNt9KO4cv+ITAX?=
 =?us-ascii?Q?cZOsGvpWec3ox978B1+z3oh+Q/2mAW5WS3hILyRDLkhYu4ZR7euV2WsTStXb?=
 =?us-ascii?Q?ya1jDCW0a4Xmyvs/zoXKd7Dw7V17/YtxUP0tO2YK+IwEgCXQZmZkIETqk7o0?=
 =?us-ascii?Q?En0UIDkHQrqB794y8xypyMhMyLFYp2DVvzrqLviDEvnD4mdF3i+QJ+9I34su?=
 =?us-ascii?Q?gVfllXbF1rEJYgxaX6bKWwXbndaTWml5Tdijakv5EqZkfhj/CjuqawTZuW/f?=
 =?us-ascii?Q?FqPZJUk3v9oC+0ku0HeP+VCdWg4KfWWCl8ZWYynOBTXLqy6lDDZZf0TKLq7i?=
 =?us-ascii?Q?nnsJJRQpHfVyM9SKqymSFL/T3cgIJh9Sh2aKk58rxaI2PF8YgjIEK6nY04n4?=
 =?us-ascii?Q?rFa+qxkuhYvLsTl6vggrPxU4MefR49UzPN3rWBJF5tZ8G1SPxB8w0BPGdGIq?=
 =?us-ascii?Q?r2IbK+0DOBlJk6pfXN1ovly40tNL2Tsjzy/+LKjMZy6O1XxeYKcRmydaz3tT?=
 =?us-ascii?Q?D9wWSp3VRelR7zDtUvkfSXEvXKO1yW/7ImsxaykijXkzqma3AqmPbynNKqHq?=
 =?us-ascii?Q?1QcwGdhQSKq7MHug31P37mLFdke9OH//BCNQPGxm//+VHV+Ff5J8WZ3rcTDk?=
 =?us-ascii?Q?hDDiFPwsQmwOUtQJTK5AmgPcv1rGijJltxRWa+/cTSuc/LU7QCtJR/B0rAdp?=
 =?us-ascii?Q?CeSZEw9IxGPVKsxzEHWi2C3+of+i6eF3Ff1UafGxuc2l2yU99OLkj8Vz0lvw?=
 =?us-ascii?Q?w1aJQLZ4l5bBgIqqCy9dG7pCJcbQZJsnw2UTTfZ0qeMrj55CtoENp51DlcwP?=
 =?us-ascii?Q?CHWGHvDOler/TqHnJvTIUvtCRPgLrDtRyc0J7oANKrVFkjsKXXsWt/pNFLV8?=
 =?us-ascii?Q?SgpyzDYXEEBoY3X8Bnh3ZTfDCrjQcDWKamFhgqd1V016KzVaws8yWVGLo8vd?=
 =?us-ascii?Q?i/zWe0tXyLWSKRYxdsb4Vw/8us314BPWRu2s/eUXUDHh329bHy5OR1V56Cfp?=
 =?us-ascii?Q?YbsIt7xH6fdQe0AUapFkw9yBZiMTnYyVgJEUnkxSThmMpLwayoCPZyYjG9U9?=
 =?us-ascii?Q?DAuBUfOaXlEtzg1Df6UfrFNyUeATAA8NnCL2YIezigjUAQSg0UxwLhWHCo2k?=
 =?us-ascii?Q?psKKgzbLokP0dLWqLHh+aoyO4vZSfUmA0KloLQ86OiaJNasEVtkiY1Rt57OM?=
 =?us-ascii?Q?6Sezy9Db8Mg1pzpybUSlavtvdevg5lKoNv/avHrkAAL8G2zK/1u0KqCsNeS/?=
 =?us-ascii?Q?3eQLzAzZy6L91n/UK9MOnWhGYXYxsjez4bn8XITPDzc71XOfwNgWNiU2Fb/Y?=
 =?us-ascii?Q?bkDrYuxhASlyffWd7CA2dwklUXXH2WFtWBfDleaQL/cwVJj+gCQkL/iBU9/h?=
 =?us-ascii?Q?foxzaxM5SC6KGCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lv/1RRh/YvqzF01W4kBBTpwc1pidGDeFgPh4Fi5SqNoEWW9R2hkwhTUVEbw3?=
 =?us-ascii?Q?OxNzOv/g1prjLGrBB1+nGksTi0nrtwhqAYlQhH1Pyf4EOos7KRvpU4a+svjt?=
 =?us-ascii?Q?Kgv3EaVvSsdsJldI8Kk6FBbRev8Al3Bk/4RHHRse83hrp6Ue22KkgP0imxF8?=
 =?us-ascii?Q?1IUkGKRbMglhMuH9rXdIjpu4aYxkXPYK+TZnnEjXsTYvYxTj3sHVz8sxjDTe?=
 =?us-ascii?Q?9C2LyLRabl5wPF8a224OxYFh1v5v7R+w2Er6O3x5L7iICpzmhxX3HIVko17u?=
 =?us-ascii?Q?dAQEfp7FXdXQSD5jyL2X3pEYouKZnc2Go9sYTDLPr+zy990Ewdzp/THpVnM2?=
 =?us-ascii?Q?YqG7Rd2kCulI5DKFmYX4yvJ8NKqTT+tsfygBMwJmOd9pXptWLtfpCYOciM8g?=
 =?us-ascii?Q?9iXBW6GAU4WH2wrp0rSS4w/cz3MbsAQcBuJz0a+b+H9TMi9ty7ZD16pYz3A0?=
 =?us-ascii?Q?A9iq31P8t0P8Urqt4KJu7J277ELFi3MpBHebEw7eztgib4jxFIJNf4EQtb30?=
 =?us-ascii?Q?vmUbWp+Jao8SYWTHFB5cdvxFxOjN//zIJ1sP7nMUH44m8PFsefZwARYRkuZJ?=
 =?us-ascii?Q?9MFWzyezP5JPRbDQJv2nEyGTw3JPNF4IFci6A+38XHfnci7CKnF1KWz8SWH2?=
 =?us-ascii?Q?VE6dBtb4MDh4khEmyWf3HNKyDk7rWb3yHECavQ0uMUJKLQjUsdPLCierWzw/?=
 =?us-ascii?Q?TCxFixLJfXcQfYy40gzyD3U6UeUBVF7Prdw2pVau+uzI3bozXCFdPPdNHly8?=
 =?us-ascii?Q?4Ib0liPyabS2sDVIYb9ihJlhSE38+Ph9Moz4Dq2XcaS/l8N1HnCoMeKmzz8K?=
 =?us-ascii?Q?dEavsPmMDFcRf+nmCjvBFeH3BD1diIzd9hB57iqObKfxzJkdvHKeg1JgL+l1?=
 =?us-ascii?Q?Zuz2XifDquYHoWSMhPZgi7cM3BLqkRsr1wgMwPFI/xv/DVIANnHVQ3NF5h3i?=
 =?us-ascii?Q?i3UCB+HMshZ1VhPzmCvNmzycy+LKfce74kT/4tKnvdgppglFTcDjWhrS+mRE?=
 =?us-ascii?Q?jcCsVb9k9p5BkJsjAWAee3salcNVAJiKd8RUJzoX9uE+5OOPF9EwHqo51gfI?=
 =?us-ascii?Q?eb/E2l45pSMcwFex0n+oP3PSXKRzliHhrZnN8077CsZTjwMLK+SAGUtzoEh/?=
 =?us-ascii?Q?cCc/Ts92Gs8a5WBgdSijeLmW73YyJZfE8QcxOMtOuDe1uSET8Dab4kh1F55Q?=
 =?us-ascii?Q?U9xC7i8vgF47r+V96724YLfDJ5OQXHchyL+27XrYca+EsKBS6Byu5CVTG8WJ?=
 =?us-ascii?Q?+ivKf3ZVtRYKg6uPOEuW4Np1wNJgQzGFGO94u3gZsr7hlXgVpu3DPnZ21d/I?=
 =?us-ascii?Q?aUXi2s9pBR+h+kZzTzLIymMH7tFniWmoBFbTvAZTPeXmvngB0DPf3IbirzZA?=
 =?us-ascii?Q?Ax2Ht+n1EYq/hRP5SIA2glHEm07NSn3cLeeEn1bfpJvAmddEOQMUCu/X/iB9?=
 =?us-ascii?Q?nNnLgDwbPanfmO97JHq3wu8E73NqOGGjHVHzxPncn4DKaGa7QW0tRbEmCNlf?=
 =?us-ascii?Q?H3WNZZZ3Ms6yxa6YiNpNQWURyTVrSRdInpCr/AmkVjwFf9YWuMd5aflYGcyi?=
 =?us-ascii?Q?9Dk3BUw5lx1YLYtwJaWGv3CG8VjpQKDCCd6QvAh3lxwsUvTICHQ9xGHSdWPp?=
 =?us-ascii?Q?jIrZUupiPKKV5ik0JaPXmFY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c70c81-0272-4ad1-3122-08ddfb235263
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:08.2132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9uC3iwL9x3DSEZSdlLt6wnDf8tRtwYwyG2Ez7Bkpe5c/YWeSbULyge2JxYmD6A9cO48GEanwf37pqeuCTq+zYf0PvhsWTAmovfsqUxSpBOF3WUCueUlfQAWZXaq71FG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 16e6ac614417..a0cd4dcdbad5 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r9a08g045";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	audio_clk1: audio1-clk {
 		compatible = "fixed-clock";
@@ -92,7 +93,6 @@ psci {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -744,11 +744,11 @@ wdt0: watchdog@12800800 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
-- 
2.43.0


