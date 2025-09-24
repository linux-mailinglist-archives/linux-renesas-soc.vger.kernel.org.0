Return-Path: <linux-renesas-soc+bounces-22293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47308B98351
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034824C2B2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AD63C01;
	Wed, 24 Sep 2025 04:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Zrfikj9t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE09628F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688313; cv=fail; b=hiXegfoqmtxlrTipP96QicCo2ntLbsHv4GTTNUmZTRLYcsS8v13G/brlZJClbKwG/e2GzcC7foT6HXnqVLHb0znSe4B5EhEBcF3wFp1dD0sww99L1SOGBmEcO9OPvhGhEEqIKmlPJ/GYAVHaP7F0MayTJ5UBnD15zDLjahasETc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688313; c=relaxed/simple;
	bh=cVKW3CBSMi2b18Z25xqEGFXhyEMHTPmt3q0nU9Kvmwg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kyLDYbiP4Fr06Nxa7ycHGpYwID8WzLldwfz1V1Ku67LxzWDoeIUWDsbf1JhWQQ2xEVHo37kNKx8G43Y3EK9B1ZHaSH/joRrAgIxVgbHBghY62jRqCgJ+CdnGR69qDvknpPJJOfIEKTBOVnfM8kkuY9h5UxwOyuRuaCD+qcSwtyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Zrfikj9t; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXYMzO5HtRo8dM7XRRJ8aWYM0YeOL9ujeaTgQjQKf1jN4C/fpUWpAWrS6ghf/SlWMclVR/Tz5HugRRPXD3cKdatJqwCTJy7wsNR3sOolOyXmn4wDJCDZdE0YIYbakX012YOkhovy+kKgvqMGNswJF+ZNz3j+G6Epvhj0XCmLPIWJ6Yqy/CcIskzsStnq7QkMuugNdxuNqTlKDEJR2hiqCXMN2PMC1Xm07acaIvD1lCTPnZdvbkl0ICQOTRSvFa5nAAGovK5R4E9gnvxlQ8KhB/VZEsIydzlYjWHPL1uD4C0M5gscch/YSH9fhR2hGh15mRxRlJMvfiKZTuucHtMHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md/FZlHBspHU3V5cW214wvt1xs07a4iJaqoNd41TzWI=;
 b=i/U6giPPn9MGJorJK29Wov+9X7eTCHCI3R5kiA6oA8jCzFUGBwE1iI9LK+s4anwuD9iI28nD47oCXkRlKFiL0y5NaQnjcOGXPYVKl1p6/0Glcf2ZvmDkiMAClAbLG09LPKQar/vKKgXT5QzQo7jM+0jSkDhDCIwYJf3xLdgU54krcQaJajBQTFESclHftY1trBP2Uv1zWzgoFgjHY1Dce9dmOujzNPMRBRLcgrWjRfe7XLjKoYFJolzNXUugeT7ZRaqulLLDeNZ+L7Cl2DgQPmZwTOz1GNO/mKEs+NCwBRtjJCvzrg4RjWh6XEUTVZYLl+AcEI8w5veWPI7KhwjUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md/FZlHBspHU3V5cW214wvt1xs07a4iJaqoNd41TzWI=;
 b=Zrfikj9tDCCPIgeR1IwoPOhTDArddWWc8Xpr86OCFqzOMq8uwWzhj5+8ODj6BheTTreyVgK+Rm3F/nrsf7O+UIG5FtCFJvIOWeWwsA0sSzI/Fd0gtot5N3Ycm/HItrimmqdBPw66jJojIIHv9OUaPN6qwGNZOa5a8vBBwU9cJYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:50 +0000
Message-ID: <87plbg8o96.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/26] arm64: dts: renesas: r8a779h0: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:49 +0000
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c1dbf4-1948-4439-22b5-08ddfb23478d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hNIsAqf8QFUJWUojOw+gTQVN4kUDFkIVAfsN5iFig43qaMv3lQ0JvofD8ANK?=
 =?us-ascii?Q?PbnvpNpk+7vOkyGxO9GuExiiSjfwkoA7F7NM5B0pQjHbQ9oHNflRgBzbJYU9?=
 =?us-ascii?Q?D5/xRN9odCpxSptXsA35pexHjywNxBGFST7CYUtur/QpYs8vYYWTOXqTqGGh?=
 =?us-ascii?Q?my4mw+PRNXyzUJey1biKFiORsY6MbGdf7LXqkpcVhlY733hJzPr7THjgtc5W?=
 =?us-ascii?Q?58QIwI/qlVhqRFDcrTyNzzATEdHbgt5UuTb46DLoP5WlsTMK23m9JNFvIubg?=
 =?us-ascii?Q?4nedPqXFFc9+IIUpCWiPvuiWc7NmMGc+DmcMa9BzoUNXbQ2SujDP03QoX50F?=
 =?us-ascii?Q?N5jz9RTvwsICU77CANB7e8qGe0KmirNuZJNi+C+MDQi/xBO6lw8For6dxxL/?=
 =?us-ascii?Q?XZ+0uijZjboRsq0kic4gm1xg8YTh9fMrE7chTRwo3+2dOH8EQzFcXuoETLoJ?=
 =?us-ascii?Q?ysniDiMrMS5wsCNLgvvGxolfgJMW6ltjttcrc8z+3Lsb8PB5H8hK9wh2amR/?=
 =?us-ascii?Q?TLzwSjREdU8xWzLyKCAuD1Itr65GQHwf2oBA6N+etR+wChW2Ms+h8i9GejLD?=
 =?us-ascii?Q?ojbOztKbH/uEWW1Rt0IMK4V3zkaouSPW96ko92ZHuOuFRNo1UP5S/93TE4PD?=
 =?us-ascii?Q?ADq/OrlqX0lCAvZblnWDIt/5tSY29j5sctYY5p2pgqeAVMn1vN4rveq3XWUm?=
 =?us-ascii?Q?S7lYSVm4K79Gv5HAV9ZuZHxaUF5lOTEX9Q6iFMaYGSdd9A5ZJVZNwJIsLieR?=
 =?us-ascii?Q?N4M0g1VsJzpzbtv5lx3RjIYZFiyc6W/9ZoeZ44FKNbrR4JQa8O3MLyMjwIdT?=
 =?us-ascii?Q?0VhiZBxy0W6ka9/JL+d6YD/cW1zw2wFwrwbXI96ehZG+Fn2Xqz/EEuv+mOzj?=
 =?us-ascii?Q?mcJXu1HaubI9lq0Z8iK/kxkVu2q1MRUngqMNvRXICGy+Xsk70FaIm8f8GDZ/?=
 =?us-ascii?Q?zV1m15mneCX24/FLrRShimdBrS7mlXGWz+7ex20KPH+Cgrb2gLhmn2nOHJEd?=
 =?us-ascii?Q?Rz7aOOmC5F66kAIxHihQ90nFrNd1lb/KopwGbJS/ez4kvo70D3Fi0DmljfgT?=
 =?us-ascii?Q?5zxOdHO84Yy2v8hxkitAcSHI5mtdTPTeA1FC8igKvgYtMPvQifspKXm4hg/C?=
 =?us-ascii?Q?m4hB45GpI2Z/bI6a1m/kaYz2/EK1GyXa2uMJ4JVS1GslPM8P7Bf7nY2NIaJJ?=
 =?us-ascii?Q?JryfZPxfh/q4CuIg465nCDGlOjy09yODd3FOB3dchavzXa78eyFXe09mS5/X?=
 =?us-ascii?Q?y83iopxmF63G3c+Bw0ha/RCe2f62wY+R8SxtmBKV2mpsgVFW30IGUd/WSvAU?=
 =?us-ascii?Q?OGicWLxFbeQvcvwKXPaIwrzVEw+yItngV/6dmY+oCo6LEJCpP/9rMpJe15ia?=
 =?us-ascii?Q?043k8dQEFA6U3xniBIEglariOyjvxYeQbHGSC/UKlBkf22f0Zbohoo20OMXv?=
 =?us-ascii?Q?5ZB5N9vO84v7nipeN4HGxAJh3/kk7Qa2NV68hqiHzwqv2LAKpHcrvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?daR1YPLpFVtG3NqvynYEmb1WeLlthZTfpGXJd4P6USTaAdK+G9fbcKSEa1GU?=
 =?us-ascii?Q?ce3md6/pkVf+DDETH2Q4FgOb4OnN3Mf+H1mCPmj7AyjSQLHjqUeWIvi6vgvu?=
 =?us-ascii?Q?fTbh4X1V6QbcvJAsILjQPlUVwRV85eTQU0StGPgfHPQ2R0oGPrV96MTpn5ao?=
 =?us-ascii?Q?7qwq7BYYmVol+tTkaMk0IL87Msz2DQPtiWCzRa3Nxc8eWGrvuM3+ojz0hblg?=
 =?us-ascii?Q?kYpucT9nXhKm7VnDy+dbcoARMPIzHEpH5uQWa2QUwn9RyAX4W5BmC2DTWFq9?=
 =?us-ascii?Q?FPBgIpDSWfo22LEGJt4EFJDSVQRH/t+D9hZ2aZ5D7sPf6a2tbmmVSlsXZpVw?=
 =?us-ascii?Q?aECB9tXx8alsv41HZyQMO5DnLjQACZur2pZ4NLW1Jw0oZZiusA9TqS8qtQbl?=
 =?us-ascii?Q?81cTUwElRJ3F5lDKLfLdbeE4UA/hre0Uw+kWoKqbFvyOK9RIG4YjxMuoXfiP?=
 =?us-ascii?Q?Kx66XqrY7HHvRAOVH+UL8k9wPXNky7yC3yZHUoc2TKQ75tsGfzVqU5PCisyW?=
 =?us-ascii?Q?eBzZXfSV+sypF2a50SuIddfL0yHVZW7KB7F/IWK3x458mBzxNVCfbvEofPbd?=
 =?us-ascii?Q?qVEifQ2MIV9RgXpgXSR3dZ5B/fwqSy+7SpXe46hv4xCH8S6qHPl3EtzhnBAr?=
 =?us-ascii?Q?Ul97e4lssgXQxw5jPy+Np37NrZ+x1at9Sfo3O3MU6bhe9ydqYyNlYjVFgFjA?=
 =?us-ascii?Q?8cQNFv1Wy6aGQrC9LMgdVvkPa8WbHh5YrurMmCJxEEToif0cGm6NinNuwL5V?=
 =?us-ascii?Q?qu8YEEkS7i4soidMiNeJK8+syexeEPqTBYs+EP/+6Tl4Zqmh8o6mWLUgIYQY?=
 =?us-ascii?Q?wC6iBCFk2fshDJ9U8ZBcQK95PgutQDIYxksdL1miMCg11HRZQPD/gtOKX7hf?=
 =?us-ascii?Q?XCwpx4T64XjXrWYVWa+oeTg6k1OX3XqenDBH5Ftlnk0OwR1mKPSbUuu/w+oj?=
 =?us-ascii?Q?QX5dMt/oVUc647+Z7VNMFBLbTXIIrzeB9afHCU9OXA9rmNlYrwf4ktG1Lk3T?=
 =?us-ascii?Q?o6Jm0w+cM97olgmHOReUUvip3InCIgG+1jJXxg5QYN/9AHfy4CSIcED1qvxA?=
 =?us-ascii?Q?68s3mioPBFlsCh1Q4VAGMdN4A4iNl6M5N01061sqb8CbH3+sxWRfyHGqqLj+?=
 =?us-ascii?Q?k6thIevudEnBFgDfZ5T/qPB3Dh6shr4Bi5cGjdTd4XP9g4zdaB8wns59Wi61?=
 =?us-ascii?Q?7UBXMovK7MrC+kxmXUX70oBVA+Zo+fJN34yPwvocp7BVcSROcdJMePwXG9+b?=
 =?us-ascii?Q?jH2uZ13on9k8HDxfUdbGPCHUZh3SEMe6vkZiSaEte1sgsFMuilGu2aUj/vlG?=
 =?us-ascii?Q?p3UWkZItFegf6HEVYzHD9/Cl5XJsRMX+huP3AQGsGiGboLOIapsUomXliVXE?=
 =?us-ascii?Q?ZE3eS/xiv8Rh3zsHxZSM1aH4MboSrG3czMQzCSw5Wr2Wd9H2HeanVQbni6hD?=
 =?us-ascii?Q?KBpZMahE4MyYDy3U6DRg3+lDGdGKcXYJsXKmTlutbTdC5LMuyl4xKO+y9cVP?=
 =?us-ascii?Q?tHxqP/lUVMMYDu2LkGtq22KiX6oxdpJiI6Prvr8Eo612jNdimchQ0spo+EXy?=
 =?us-ascii?Q?4x+jOFaiwC7jBINs45dLEdjAfqrRXflulHt55tIXY28bt8jVj9i7BD0gVntT?=
 =?us-ascii?Q?PHedhwA2ebQOQXjpKSkN0mk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c1dbf4-1948-4439-22b5-08ddfb23478d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:50.0384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LCH61Y1/pUGXA9dyjugfsXDikvDFHoQT5H3ZVliVTN2gaHHkwdmcE2aJCeTkNUxsVEGJoPoN+s+j5vJouY52lU1oCnf5ERs0jMX2ASHrqCupNoXLeEgWpKM/CeWp9vV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 0f20a2d23983..b59e6d858d29 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a779h0";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/* External Audio clock - to be overridden by boards that provide it */
 	audio_clkin: audio_clkin {
@@ -158,7 +159,7 @@ pcie0_clkref: pcie0-clkref {
 
 	pmu-a76 {
 		compatible = "arm,cortex-a76-pmu";
-		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	psci {
@@ -181,7 +182,6 @@ scif_clk2: scif-clk2 {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2212,11 +2212,11 @@ sensor2_crit: sensor2-crit {
 
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


