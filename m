Return-Path: <linux-renesas-soc+bounces-22301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCEB98369
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D28D2A701E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2991D5CFB;
	Wed, 24 Sep 2025 04:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k1Aumlgv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B958428F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688348; cv=fail; b=OmPb2hr3zZM3HKxX/KgCBI7Y3AIwFdHD4xoN/nWpywLHQPBTmPop+mSdOtO1J5LZ5tCdoaYFDu0sGPhNwWY2TBG9sQ8oCnleEPPi90GzH2EkmnrTnhIjSVh8acsOWbuZIh43OGjt25n2ak7loR1dM1zNMEUJmhGS/8041+Sqgis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688348; c=relaxed/simple;
	bh=1A0THddNmWsGOwqks+ai4TPDO3nLR6yEqqAqQ9ZBArY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KjV5szF2RTsY8lWcojpEg4nvO2deNnTjSlf2aNym/7zjSDXI3cQS93kFKwhdS2C8Ft24QtKg/JlOhTutFr6LAd7dvAsiWHv0Kl3nh0l3eYFHLE20rHZ2AUd9cW220a6b27US/4U1nd7cNMmn6w/QDT7UwSmSxehdzKRCTAXAfkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k1Aumlgv; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJPnpCUE2+PZmm3gXunpBrczdEqig1ybLmaT7vwTjaVKzn+RPq0mrfD/O1PrAXg+WHk+a2STp7qPzxhSgLewcJ91jAJt1eKVsCE828Jr4mfCVbaKDjqnBYO1M0k5Lmcvc6AWYxgJzVS3B+/1EGQalGm52seUcNZZQ+80zIjeOHlQ751vblFgNMeGsxj0Y/OTxljefqT1m1s65BqbcIg1Xv3LjdaMW9DMx60kqZqtjgK80YtWYOQ3u4m/boNQM3srSNPkVPJtO+OzklSQL27McwTQxIAMkkLzQj7SlmgJPjkSKmrgZ4+4gruMUVLu5suaYnvJgDKuuqN5V3h3yIdD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fxyzO+lvEOiBR6seXwFyEjscA/Pc81QJgUljMv07gI=;
 b=S2jL65JvlY3H0z4/CCr+4zJ56/pA+kDmaL2KDZroTCPgOJ4TOVuWea8iahv0e0mgqPg6M+y4D4gVQNVckVIcK81gxr7McVVGpkZc9Qz/WlC63HbsGaFZCxpzpQz9SNXpACub36NuVJ1RC6KgKpAY3hE042vlBPomhZ1e8uvvPCxVfN4Q/4uHeetgpYe4XqcE4D/GWKFpAXuOSfn/0G+25vn1TXptK9QMllMxGLlpNcSMNxFj4xVLyIFa3HdT2LzEUWGhWzunoeKacqSkEupGv5LqDGSw88iDa4aPk6z5Atkl7Pi+wnhcbBmhQdpnBoUoN2cqAxuLC2LaUDtoR3wv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fxyzO+lvEOiBR6seXwFyEjscA/Pc81QJgUljMv07gI=;
 b=k1AumlgvxDHKZd/r+khXMMwRQyhvFNejwe11yfCRTpPj2tgQHsL0nYA1BQMIOfMO5M18XLfhin1VB4TrzpSACoYPfz//BEsYj4Kcmr/66Hc2Fi6loC7UL1mA8ylEeU5SUWUVKL3RV36I+E28I5Y3DheeU5HMgSjJIZtVyMkcnuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8177.jpnprd01.prod.outlook.com
 (2603:1096:604:173::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:24 +0000
Message-ID: <87ecrw8o87.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 24/26] arm64: dts: renesas: r9a09g057: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:24 +0000
X-ClientProxiedBy: TYCP286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d9e7a5-adbb-4b33-bdde-08ddfb235c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vv1tujyfXJjImIuZ8YLDdhG/HWlMNAgWpryUMtu9+z6TcX93njJXeg4Ei8dk?=
 =?us-ascii?Q?IvHc75NJ9/E9jBFGntq3Hdq4x2WngPhu2sjknoPJA4fb5UXmLOwXerytfj/D?=
 =?us-ascii?Q?VlPmZfCFW97SOorCZz7MfvkKYqS1gY5ysQK2j+uASrHfixy1pEOXIWy4P6rP?=
 =?us-ascii?Q?Ab0Wgdcpz5S2/HDSxLv7NhcDEn2GUD8YQrpcFTSLUlXJg7h+UA891VSfC/4l?=
 =?us-ascii?Q?X5eQgKP6F7EM6+BNAQTd4BDwzgjbONuKtVP8innK22YScsXSoIMLlBaK9Kyb?=
 =?us-ascii?Q?qxKmFBsS+NgJN3vkSPTGewSYjI28oXFrqynJhCPbmMSc2c1KOzspqiOT2A5h?=
 =?us-ascii?Q?lU8KyazscHCXjyoQDW+pPAbQbJzD8OeUjHPB5UA8U4dcVlo5Mx+z6PI02TDl?=
 =?us-ascii?Q?dPuE/Ckc7lmh7YIZeLCxsy9pVnA8iildo2MhE0cl8CPxAr27iSklb9jhHDi3?=
 =?us-ascii?Q?wXAhfITs+m0QSttgvV/kQ+WNTdQTkzB/9/Ck1jPxJUMzAHfap3rAktH/hpRH?=
 =?us-ascii?Q?iokMtlLjOHd37GdLyY/AQsAJd/m4xBeyHCO9GzwqomzPuwJNhlfNE3zbdW5K?=
 =?us-ascii?Q?MZF8z1CrZzIAmst2Mxj1kwcNp2Nc2URRWFWMooGiNqjDOZENjpPS+8DMK3pT?=
 =?us-ascii?Q?Zq43QQPm9GwF/cq4/Nye/g7hOy88ZEkGfeBW1cGxKKTDLh5DJTdErqyhjWW/?=
 =?us-ascii?Q?tp9Y3dKFmNPRG4E71ejHq1gRqHl1I1EH3SZvuBF4EHjRp7R/32RqwJs9n8EA?=
 =?us-ascii?Q?zx2TD1wOIR3lzbaWPUZG3sIYBGYJU0Vr7gvxtI11PAllTWY+i/TGYJbL/Q5L?=
 =?us-ascii?Q?I6A4SJ8/aNM/l5HemyPEXXxdubb4S69ua7nNtI+bsaauI3XABvOwo8p6CL/L?=
 =?us-ascii?Q?9YekniJE2LjgJh6Yovj4PhvCnvM8c7QWJZIbScRZi5kCwFD1iDbdR9wvWlcm?=
 =?us-ascii?Q?qBskDoX4jLVTykUAxs/Bq98EpOylUjDSKk1aVVqZ2cII2tyTnVv2nJTOwVGZ?=
 =?us-ascii?Q?V/TsLa63rtOL+FVM4kzZL2RHuv36R2tmcDJxLZ/mh3Mjfnm4tYl43w05Xu/H?=
 =?us-ascii?Q?fnOKMVchOuKo0H1ullYRJCL/9LiODzV+25o0kgGAh2fEyLgzHDPg5ofNukeY?=
 =?us-ascii?Q?BXQgYjj+eQq8yLuPKKVbjEnflDWqUGkdVxd3CcqarpHgRsV5ModiRn905z+M?=
 =?us-ascii?Q?uvlIW0mqHqpzlvv+Hzj/LB14+GtV32nG8xMc3hw3dha6M+cCnAHIxV8zwfz4?=
 =?us-ascii?Q?ogPCKIfHB/pzkqWJQzjdSeELG1Gdwm3AKA2Q/jPGCw/MCH2tTjG8XTVWqOTB?=
 =?us-ascii?Q?T/WLjyfR0oITCQntEIp4ariXnkqJDg96xlv0TPlg9X+uSzEHFFlAGXmCJceh?=
 =?us-ascii?Q?DkEh6Fs/FV3PQhd61IwSRXAqML+UqukpLhGY44Bb74iwZtChIsPEG0MtpLhX?=
 =?us-ascii?Q?K9AV54gmQUSfEzfCZyIBUVkin+UlQ9pxYs/lK0pNpQebFsH/w4dYZ1JWYIUA?=
 =?us-ascii?Q?e20CShKVRbkIdgo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5vlaCJr73aB881MRFggRfU1OWbiBrgekDK4ss9UwgVbMfm6zIM4PBwg9O+GK?=
 =?us-ascii?Q?xxijoZigW5inslEWyriKq8pkO5CDxBN4H6XkD04PJsBB+5D3+SarTrwNQlDf?=
 =?us-ascii?Q?M+O6QqbEOuhNSgQ+vVk0JCmYi1SbAdicL5Cpkk/ILFGQWWT0cm7gMoxliYZP?=
 =?us-ascii?Q?gwNBvvh96TbwRSzfhA8+t2KLTiWLXshRnI9XhwYBVEBAqHMdi/xuveF9KKOP?=
 =?us-ascii?Q?zbQjyXyrQ5GmOz0TEulwgb+CZmtD2svGhQmDIDBfdgjzHb20HapW8vI3o+kK?=
 =?us-ascii?Q?IzLT5xA957QciTPYJIkvB94rx+9mdmvr2Y6WclxqPa24Eqa7w4dKx3FCcqzL?=
 =?us-ascii?Q?RmSQIBRR4Pbil93/SbvRZ8FwQDiC96Ww2q2yQCOPzhit4U/7v8P6+Nox4AAf?=
 =?us-ascii?Q?Fc/2v3MF2zZ8my4fSwz/W0p3mpZ/GdXemDg/A1BbSPSAWiXhHIPthXhEDeSf?=
 =?us-ascii?Q?X9Mc5oBvCqXtIlehKYgcysHxTXNnylXaChmb5uolhEFwR1kCan4lUwwpq5xl?=
 =?us-ascii?Q?nO45Qyr0/+A5VSOHunUjMg8gkrXUIkkPkPD0/n0KsF8wmQNrLIUw26gd+ob3?=
 =?us-ascii?Q?Cg6kvjOZqrrniFhDdjUJ5fiQWPE6ql/SgSo7qDu/dGmV8CNz3wAMHCZ28wjI?=
 =?us-ascii?Q?ZPRxgV3ql7r8v/u5OxFg5TmLeHoYsuopD46doQzWHU5Bye0R2F3+WFft8AGx?=
 =?us-ascii?Q?E0JVGLibx+R8xsM60fNk2+lmoMmRqMv8+26gwXDDXierFX/zCwCvAXDej9px?=
 =?us-ascii?Q?lmXOxVVUX4fFlAP7X30SVuAdJD4OB6/FPDlNCy+AwqhasYpuI/WDD6ZO9fWx?=
 =?us-ascii?Q?3F1iC8bqhDjyOoAzfDll/88ClfIMRmcnOOK0lxI0PRVDEaduGLcghs7F6is2?=
 =?us-ascii?Q?w+YgmVml3eldwp4f2SboZp2QTNN4ag9gKBZuoyGN4Hfg4rYeERJJRlL+IC0h?=
 =?us-ascii?Q?XNN6RAfKL4/Sso3NxkVXRgR6A+BVJ62zgn5tHacI9fc31lAb5LmNVXpe3r5q?=
 =?us-ascii?Q?U174BmaB/BItUn66jEac+ZBg7HiQUT9095ZITkp+qan8Urnq/2x6ufLZibUw?=
 =?us-ascii?Q?B0g4yC25DLevD471OTcpi4+yzcNqtc8V0b2L/BLhVu+b4Da+T7lORDOWB/9+?=
 =?us-ascii?Q?9IjxYhVJfJkFOHKiKsH155g9Ebd+cWgNZPh5Ilcc/8lEwTbDFZFpmAK4jAzi?=
 =?us-ascii?Q?NjZbYDphojyfHqBLkC5vIkRW1A7qLjwlTJWOFO1nOTvUE7rvj+1szwlEExv9?=
 =?us-ascii?Q?HErPs2vFAhxw3pXp9eKLqrP0+A5E4T9/S58ZUV55lqP5XDtzqXA5HxLroWo4?=
 =?us-ascii?Q?MnVVCaEUo+ULc/HlSdfwP4SeDGA+0NrhVIvp9Iu0xnWsR6GUz9KwlnllSxxI?=
 =?us-ascii?Q?TgiJKaFRNi5xVwKSyh1XuWa/a5KVrpddym4amK3HKmCU9vSBT2f5fGT/Hs2w?=
 =?us-ascii?Q?gcRYc3ONszXg3KeZWki9PR/x/9pAkgL9MnISR/MpvVYqS70T+fCx6Qbdhzmn?=
 =?us-ascii?Q?5HupO7fQoxJ2CW9y8QjhYWG97Es5Pfgw8ZxAEKZb7L63fji27Ti1KkITHJ9w?=
 =?us-ascii?Q?buqjKg2WL/6/zwGIY6BUCT2EoawPyyu8UjgiN//iomaZY9Kb17jGEq3lhoBp?=
 =?us-ascii?Q?Z7FxEfn6ciEcxJdQwynSW6c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d9e7a5-adbb-4b33-bdde-08ddfb235c3f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:24.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYPYhL/wCEiybq2gBDam3JMDmD+2zEEJdyxvCs5Xb2l9m8ghk14kfiQijZAqIYZybgfi9N7SqjBNTFX/IO0neOIqiS8VAXQ2mTfYrS2wss69RPxmOTMm8mD1PzHu2bAV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8177

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 630f7a98df38..267fe91b31d9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "renesas,r9a09g057";
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
@@ -1309,11 +1309,11 @@ stmmac_axi_setup: stmmac-axi-config {
 
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


