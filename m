Return-Path: <linux-renesas-soc+bounces-22299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC3B98366
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63AC64C2B35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C7C3C01;
	Wed, 24 Sep 2025 04:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jE7q+NK4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696228F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688340; cv=fail; b=rqsPHvFoVoW/1UL10QFWhx0vkg8kpm+AE8t8Y7nI9Tc0y6piBjDzjL450aVtXga6JTGn8yGEsSJEq9QBWElAxaZrp4AHbNyS/0iJUtFJElOJulRTZ8CKB/G3gtGZUZhl5k3lwT6nP1Jc3MLV8bij8qkM/WJehQ/meEdKrQ1Tl+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688340; c=relaxed/simple;
	bh=zi1uIARhrKFZEsrK3+g5ML5xY2aegJfedE4xjj8b2aA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SWwiSikzsmEO7dp5e4cznGofY1jEf5zqVLq2nvpDqXN7+Qd5yRCX5arUe0ADpGKdfB3aKq4MhJ4og26eawNh62Xe+LSF0rGNMTEwFG7LPrJ0F1NLDBV08KcDwgtJDQCt8B4XHi0S/oorFp33O/21mM4b3ekX4lQd1aXinu1kzmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jE7q+NK4; arc=fail smtp.client-ip=40.107.74.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrZuobcfgGlecp1Odih+3bZqUOfIohe8+U34ODsQYjyyVOvYDfW4NbhFBBcBIPaQRGuoK+qN4qbLYR09m0xtrs6ofpbUkX/+FDSibCuAINVabfbsfZfAyB0fX52sMQH/w8itpxoBVbgxkyG4DI3eV0zI3p0bXoew1Alf8P5hYJW9jnLXTyoa7QK9gdX7d5cxolAx5izzk+fy1B6u5geaKrABjAIbxr+f/exLuJvNsfeyUPXnh10UkoDtZGTE0Tvrhd9SLAEB0GuyDJH+OjWarVodxvhQRbyjPdOeahc3DWRHbs517X+ggiNSST3jxNs0C/HqBlAw6ajvs7eqFMY3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5ACR0kMJdizO04LenCfqzviwQMIasr/nSyVQDvfN7Y=;
 b=H4TQHpzg4IYhmWleehKc3+Io4sZdn7WzNGkGJv0sngidLkLIDdLpuy6i47vIDl3NSpgE6hj9w13L4MKxDVwF9TbqhIhfEy+NTnRda1o3CVCb2MVPGEDYi2w0V635IkDSWEHqZT1slM5DXLakhMlugmyATxvUG/c2BjLYLiBGFqCL24Jf6hHEUGmsh9ZKzTvMXFGN3EBUBZbsNVRNh4SvZVQIoLhnZxhUDUwZCSuo6DYIux9ANRbXxgm84wTAc1Gz+AyXB6Gz98RW0rAa9UZaOOGBg1MY0Lfp21lwEsxOIA3S4f41uc/EJST2WTavErrmHqOGerYf0hzejAB2bHRASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5ACR0kMJdizO04LenCfqzviwQMIasr/nSyVQDvfN7Y=;
 b=jE7q+NK454UOyo/PzYxlchXor52HSLhmz63+o6JPA2xN6vYw9P3b1b5mix9Gsmgr0VGz1cytnVOBrczsLOuFLOrsBnNsTha8wBqKQjj6oc1eAaDr8sReeF2mtHgp/qQWYaAeDlQM4jFPp/e0Zw61TKXcBGe5CfNrY5SI/r3kqeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:16 +0000
Message-ID: <87h5ws8o8g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 22/26] arm64: dts: renesas: r9a09g047: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:16 +0000
X-ClientProxiedBy: TYXPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:403:a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: f1551fe7-152d-4c23-dc5d-08ddfb235735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1GvvwYbqciFqeZfXGJYKrKMpNfAGakWFUNkqGZ999WJuhWjeUKt38ffvX3l5?=
 =?us-ascii?Q?OZyFB1xU3jF/1CtRVqRwg2yIs9QwR9sOvM65DvN5xzzy3f44nOdhEPs3VgbR?=
 =?us-ascii?Q?DffCGXG+McyV6DZqGnKZWOEB50vsVTa+hG9bDFs+4M81/hd/Kmb5U6BwdZe8?=
 =?us-ascii?Q?BEYGiqFHog6Z7gRWJyBYnwT2WWklU1TTGJ079W3lsGPugbaJL98eDpgFcigt?=
 =?us-ascii?Q?rbWVixGJqSL2KCEBAKQsdz1Q5/FBfwn1uNdvWIAQw8aOicHd+zUPI4AhwNAZ?=
 =?us-ascii?Q?T7S3+Rud2sq2O+wKsP1Js3WM+A/H5C0r6G4YbNLi4/Yen6ZN7ZKI3OmSsK5q?=
 =?us-ascii?Q?lZPLaaigAHlQKqhmNIZvIZQ6Lb50mKG2uZZKUnoWmalOJkdm6wW68FEDzzb3?=
 =?us-ascii?Q?tU2DCZp7vcJnic+IWCT+9b5JKDLY4Vmk36jyXVToxXGnaIFapjtelKuAC4QJ?=
 =?us-ascii?Q?tLgtUzaDPmMyPgj7oRJqCHG2yLmgZpp0UT3epkAIREuRM73jtPfyfRFLlM66?=
 =?us-ascii?Q?xoeivvRMJEY98o7PD2iHzdCnpsht1YJ9ukJstjy+8VMJb/lWrf1NPzAyCPU0?=
 =?us-ascii?Q?zr+Mdz1M2y8wWZLvvt0Rp1KW5PYWkjkeqHqqn8861TO4DAayDZCvibed5U/P?=
 =?us-ascii?Q?2WuQMWoJeIePiw7p7Q5D4Y1FqSCVWPtC7FxfMw1AZL5VFwWxdtgcUqHdR8YU?=
 =?us-ascii?Q?+cTMbJ2twCPE0sglqHm6V/7NgDmBlUqBQcpqhHfEqCdree5Jn3CguJvBDOnM?=
 =?us-ascii?Q?0wQGZKkHcNFr0MagAbwZVOy5jEqEusLiJKlAqBmUmlyJvP8cPXC9UBRHE9Nq?=
 =?us-ascii?Q?x0gwaZoAKLgsE1uFL5x2e5csLfYHlIbP75FimGp4khN5oHw6nmwUi7rtRDPw?=
 =?us-ascii?Q?QuUn8HoHDPj+fQiYpppotuZ58bJmIEDdPcrEdWctfcal/9ei3Aca+SAAgQoW?=
 =?us-ascii?Q?eLzrr1xiXtqDNze3sFsfxTZiDI4a0/TL5ZD4tKEjBzl0b0ZGmz3/MpFPZM3f?=
 =?us-ascii?Q?9p4kc+bWMTRFATY1jhQpO7nIaZfBSXinS2S+u5M/FJBSlA6aDBR10cSbTcUm?=
 =?us-ascii?Q?7NqitMfuCatrJW1Fca5qm27qJgnJuyNTVhoOXF+Th5drpuzXAFGwkjlgYTPv?=
 =?us-ascii?Q?dpaVC2sRyY+kHLCUr9DlsrwXuyc75OI1C80RTBf4BNspwQgmwHyWLR4xFZNs?=
 =?us-ascii?Q?TeRB5T3YI+DDjdxIY65pVJQGCNq5Bq4iSFneIwTxXK+tkDfm4XRdp2zsxJdI?=
 =?us-ascii?Q?2ilE8irMYjaOziPhTa1HDpaQuLl4zBspzVXsO1txBg4EKQ141bszOw7TvN4k?=
 =?us-ascii?Q?u0MXjlyOzFH5ZveWwws8Sgwph8N2vnExGKzAfh1z4se9iMnH6dcF6YGr4BEb?=
 =?us-ascii?Q?685xDOPyToeJnxzIY0X0T1YWtXyHEEDImk+PWA5dH1tiZF5Imrfvwu/z3Mo8?=
 =?us-ascii?Q?p5IoddE68YLcbWRT1V7e6XUvRllXg6/tlGIPQyIWyoMgA25/vhL/7pF/mpX5?=
 =?us-ascii?Q?0pB4xWWkQOQ3ZNg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8fwTuksAb7kmN+UGX+ZFgtt7+LVBhRwL0egHm3E3i6Gb0CPlGAGjNwxqf5Sn?=
 =?us-ascii?Q?26wPMxJJVF7DGASnu7TB6wT/whJKDJ5oaLRGhtmF/PS2fabey67bPpQ8C1zX?=
 =?us-ascii?Q?ouAv9uOt6Fvoa9Q0XsNHfWMQrV+mftCfZXXReU9ZJ5yt2JsUYFx8/qE5G0ig?=
 =?us-ascii?Q?m0ngu3NxrqzHPKQRED2QTWqhGjspO2EsR/LWVFHOfhoFXPd4g67itTAVcrBe?=
 =?us-ascii?Q?vc3Y3vk1ioYPQAekjioqPRIVcSefMErBqDd1iqg2oq7MRAR+IOS/Uqowkf8g?=
 =?us-ascii?Q?7aaREdYrGFbQq/6JHkeQCPRwkZbEDF0K3Ckx9netvxpdq+KOg3OtjkoHcsIC?=
 =?us-ascii?Q?9slHgXoqJ8uweVU++Ls5jml/FmC6G9v9XSZpiOFTgY+4ZkEOu6pTkeECfPPE?=
 =?us-ascii?Q?0jsCRaAKEtjc3N44aJPIdkPhDoQLy/l4Zai9f4s4wv8Pp58xFPlyEcv0G4pc?=
 =?us-ascii?Q?S8ix9XERj+kfKs7WoYhYrlzRjFae16AwQxWty4ag/xvCVrYF6T/w4itHZ4l+?=
 =?us-ascii?Q?tvzBxwwKJmOa6mzzhB5m32r36+lRHmtG/IgoDf6IuIJeiLYve5GDIkJeT+r0?=
 =?us-ascii?Q?JivmxxVxF44OXbwHpgJRjt3cM3yIkPCsrRzlMkfJzhx67LZas0X3sZ8LJ8qO?=
 =?us-ascii?Q?5czi6zKUrOtzV+g/NOFG7UOrV57T7JJ0GpguKi0ygwOcDMYD1GhJMEfPwn2B?=
 =?us-ascii?Q?yz1DkqQ3sDf/a7fNKFxkVa22QxpHxsqwc/qEJDaqoD/AFE1XMuJY+DSELF2j?=
 =?us-ascii?Q?yMitw9kPV7/IPe+KRHxtUp8ap/6L3VfTB8+5xzPOgC3LLu/NdMFPHWCiALpL?=
 =?us-ascii?Q?r3Bg8llkRkzsXwacfBZkUwoPwaN9eKn9gZQzxh4/kuBXQmRkNPXCQhJEdyjN?=
 =?us-ascii?Q?KC2i6vePCzzAYfESddpbkbaeywTIvqbM87nLwSY9D9l/1sXt1tTtH5K5XDIT?=
 =?us-ascii?Q?f+Mm8Dx9t4MowVucmzDWdgWebLXr3X/fevSgydNELcw+tJnfm86oaV41OrmH?=
 =?us-ascii?Q?e7xS1ipSo7IooNaIOVy2PNYNxV5HDQ9bj7QuFOC7icdZ88kfJ8A31WX4I/k4?=
 =?us-ascii?Q?VKBieS41WJaUw7a++gXR1MIi00Z9uPzqdqyuN/mgFWPFyB4o9qo4KtHe4dQj?=
 =?us-ascii?Q?I7V/aV8GBJg4jm6dz6ynqjupfvgy/NbZ76hKzfCOH97Q1uN1qTcHr0Ui7YHT?=
 =?us-ascii?Q?iR+sLqbpoIYQfXS8o0WLdnrMTitFFg2n320brHD3Qy46z32NCcYlkFPIw/YN?=
 =?us-ascii?Q?8UEI36tmd5xDNKnxI+gO1/pWOnrICeT5fpFiisGagJXhPc0J9TyyEt0IrZty?=
 =?us-ascii?Q?KPNDKHldTvgMr3KWRri6zHFPdT7Y77vGOmG0sxOz+L1WY98mCCBDzaIywGL7?=
 =?us-ascii?Q?XLmN/JZQ2WTyeyhBFsGfYZczDmuF2UlpZm3u0ljnWWDT1KlaA3D1l5Q/ZBki?=
 =?us-ascii?Q?KbeNSdSrMPG0VsPVi3RKBE8PYQUl6wT+8/sqcsJNWLyEIoPRzOw5YL9jBcRk?=
 =?us-ascii?Q?DrAr1D6H3rEmfQRKvEpTq+eXZn3Kz477HzE76usJ5xmWYctUXe/tCPRuUyl0?=
 =?us-ascii?Q?qJJ0aqTJg6KJzcw4PDWWexgOOyovQby88YEL6KynoQtD6vs9dVQ4jMd1VjxR?=
 =?us-ascii?Q?lK4rbbbwQwF88+bYicI4VWI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1551fe7-152d-4c23-dc5d-08ddfb235735
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:16.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3T12FnnclwoevAAT2n45shtbOE2w8Nfl6I+jK2HXGushhQsprPPgw1MzDRzW/jLePsv/ea4VUbLHYgsM5sQZ98K8odqTNmKqvb0KFe6hdq3QQDNTDpe8B+nYiIvuvAo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 47d843c79021..c8cbe53ad4b0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "renesas,r9a09g047";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
@@ -155,7 +156,6 @@ rtxin_clk: rtxin-clk {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -1175,11 +1175,11 @@ stmmac_axi_setup: stmmac-axi-config {
 
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
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
-- 
2.43.0


