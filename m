Return-Path: <linux-renesas-soc+bounces-22302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EBB9836F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FCCA18915F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8D828F4;
	Wed, 24 Sep 2025 04:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SVP1FwDi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C461F3C01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688352; cv=fail; b=jqHNKR0tUbOBVUztaMOerLHV6TRz6/Vg1vl+aF/xeSBbRmJIFm9CFb7ulqGDghKmj7rJo2MjD2yzbEZEYIu/6JZtwKp5sM1u8fm4Vu2PFSmDST+2D9wtv6QeH6h/r8rqMYGdC5tialz5bDMVGnuaU+zW5vXwt3lIKgVWFygwK/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688352; c=relaxed/simple;
	bh=sjiDB5cVv61sGoSodINTADcrdIl89VrTYyhC8dfpxlk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V+YcIRvLRGJOumjtyWl8kiw9I9VYprdNlSPkPwt333KyOOsfwIs+TFj66b8IEZCEh2KmYxzJ0kExc06oF3Psnxh5aoFzBD11UtauiUX6e6H9099TJSTDJnLuEn3McdXDFD/bVAd/jXd6h8EDnOeIZOhiYVVQeRjzIFDutw3hCmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SVP1FwDi; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/w+1VHtkRke8PZSgGHTVdzxfSVgB0p/krVp9/zKSidBXlwK4QWnHs4fGony1xVrN+BEqF38Rol4xakc5MZdE82kfaY99RV3SwtjT1EExWc3pfdwV5dvwa1sfyoKIfFeA2LBEbfiDcOUhsdnpkqiqZvwjNrMNLdLDJzMUlFHF8Zy6ji72bvpTHA+K44B3Us5RecYpf6AoKLHKnr+JvXetC8xjBtmHO8DpBhSAHMEE1ne5USj4x4rBpnriTifRvKqyy3rABsfhpM9dyor43uS4jOsOIPBCIsdSnsp0dOMx5ysCUvLS5PiKGMUaiJ3A1mUm5U2RHE2ViHKQ5w0Vu1HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9f1XrMxQ9RGEHmrbF32DFmhlx2ER7vIDsdbGswJ0Tc=;
 b=OXrnH9cn5SyaXkKvQQSTM1J+qweUhvGbKVb/ySffsjbTEY+ZsrVxp3RChba597UNBPF3tnwiJVlH6LJIUx5Ys34Wuqhcvm2hZ1Yy5UHcTe9Yc9KhXrTXdcSFebutlmUVKYF5WZPXg2Hm6swt2THDUEPOtPewx0WrZSDgyF4OflxFYDx39+/G8vIwC54xsFAYsKZK3NqhzwQaqD5PqSZi7d9GokOurcuKesw43yLymPj/cu1xYN7nMtnnuRiuHH+rJjiADjil0Sr6uu0Av1QC4JJw9CN5BAuNBrfnLK2c1LHx0wo+nAZvhNLbGa6Eeaw45S1Q9eIgKxwfFzOHvJKWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9f1XrMxQ9RGEHmrbF32DFmhlx2ER7vIDsdbGswJ0Tc=;
 b=SVP1FwDi2MBNhcDOdX7UBW9tPDM38CUx3hZXcvDJSwRVsOD8RMra8RA6bE8Ax4pGyPFISowS4SWo2PrKQzpyRyyWzykUAFM5r8jr2b8sb7PrJ0oB5+DTXPkUx1Ai9O/N+6+khRh/RPVcGibYxgWW0Gxb2KHft7vp+9uTBeZJ5fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8177.jpnprd01.prod.outlook.com
 (2603:1096:604:173::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:28 +0000
Message-ID: <87cy7g8o83.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 25/26] arm64: dts: renesas: r9a09g077: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:28 +0000
X-ClientProxiedBy: TYWPR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b418ea3-3f53-4dfc-0108-08ddfb235ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xsCRs5l4F1osqQOsLvae4pU01OU9s0uv+JzfYkPdT70gRI+ndHdUc8bhi8UG?=
 =?us-ascii?Q?G1t4sp/DHqCOaNzh2Bszo1DSZkuQlXI+lNXuqajFkHwQUrFGVwMSm7yFrFwO?=
 =?us-ascii?Q?ShmwrnS8I+flZjs7+3B2UMCRI38AzwyONj/fozmG9/olGt3I+/JSEtUiV48l?=
 =?us-ascii?Q?kf4e6oRmO65gHZ9MDxaEWW1CAQ8diWBhkbihk6eBiExJQ4p0Nkr3O8QxFEaN?=
 =?us-ascii?Q?cgXXYwa3Qw+0wBtcf9ZT0UgC5QUy+CmtCwAEZw5Bx6lzO555fEWnnlw0lytU?=
 =?us-ascii?Q?ssCaJf0Rx6ojKSYuA+zAtaVj0cSD2PYA3yrHs06pejNku/7wnGl1wRG9ReOT?=
 =?us-ascii?Q?b6Iulk2HAEOvdaiBU+jvQA25GBjdXRxz5VbIiJL3WBL3aMrcDmRFIbeMtMuf?=
 =?us-ascii?Q?tPFQDsVjRszoAPK6pntc4wjUTF5z4QUXcW3s/fV4Z31B727wPTLTPyKXeCCs?=
 =?us-ascii?Q?X6TCJ1SnOITZd7wzq2wUYvjP0ztVJbCOX2MfjkZNrH/fHWl9TRwIMl4KN/oR?=
 =?us-ascii?Q?wnsaxi1ZgDZ/7YbZMX4VYFmjFzvoupU25U7PuDy8QQlyBZa4t6yRPwe5Fxw9?=
 =?us-ascii?Q?6INP4eZ6+Z2BdUB9ViCIba8QGP+yaSwnJWQq1iHRzvSiW4mvU4J2pAyBB2nz?=
 =?us-ascii?Q?CoDBso8V3rCUB7q5iWqazFn+TNbCGDh5cZzWPmCxhEJONC7kcXbKG8g0O2B/?=
 =?us-ascii?Q?EKA/Cx2ChB6Lh7er0+n2qW9OZyDAAn1xh606fbe0W/dmQY3MfJVNcdtrSXW7?=
 =?us-ascii?Q?bXkklKkTBcdhDPDs12dRsr6HSoUxrOGs35aqRLZcVyeUC+m0O6O00uaSjOeo?=
 =?us-ascii?Q?nR+fOEUWJYkvkLh/mnP5P5sCCviLqyCzSPMtaZAkNweZBXo6IYYOx4gXpaLS?=
 =?us-ascii?Q?HzpR64ddg7Kq+rprLlqhVTcMquAQvTFpBMC7elUlMkiW7xd7n93ebWI9iATm?=
 =?us-ascii?Q?1jzlvstXflFferDUmemxbBRdhtX3xxEXhB+nsxMiXRVVObMkSGEqlnRdc0Op?=
 =?us-ascii?Q?VWJryAyQVXSl7qkbIzgi5CiveeTWfCf3T0qqp2AmkKT0n5UVcyX30vvKuNwH?=
 =?us-ascii?Q?tI5v6JwgejyLXL7PdwLLhfzuHkjedsVFWh8o/nJ7wJfp5Dy3gq90fLM7/KD4?=
 =?us-ascii?Q?EkL0dZtG3kmDA5e0QjxYqM8iWpwomEsfW7JUZ3qv+uRgvo1BcXKrREChiIHb?=
 =?us-ascii?Q?GcLFY8HwXnoNipiFBv2NGnExHv3hUfKia14yKAfVacll3gQ1T8GmDz4vQ27t?=
 =?us-ascii?Q?vF+bLG4Y6FnqTtTPGCS5L5VgLfKsz04EuxFz2d66onKneZakn8Cqk57ZYPBv?=
 =?us-ascii?Q?Mp1kvWCVMcZr++P2ufxhpy6ZQ0sm+iOKRu5TGE3vRdpUO4ub+NQnhu6cBORk?=
 =?us-ascii?Q?/cxUEotXg6bQVq8YCuuQUK/U/T0nqLjRuIqXITfES73xWMMq+9OgjMJJcfjB?=
 =?us-ascii?Q?y+apZnov/zja/ze6nYw4szvCVA0ARRRvtFn2dedPabgPj7sQf8svSlms0hwj?=
 =?us-ascii?Q?e04Qj+GGiJs9+gg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RdYtdkEf8JDC/Y49CC+mpewgH3ZVYxvKYivD1UIN1jslm/BAjkdw0+X8ivJ7?=
 =?us-ascii?Q?Owhp3Hy+Fa3dsmjlq3VdrfR4S2OwAe8lRFjtpKtep3eezonPn+t6F2yXYW0x?=
 =?us-ascii?Q?qewQrNwQmrULdjDyLL5dQ7GlA3I19xnjFZZR50wRBIYGM6feE5OScC1m9Xrq?=
 =?us-ascii?Q?xIXAvyR/A2kBYMd4W7LkHTvH3t6m7brnrh7a4f6iFT1FvlVsvC7qB/D+xpY6?=
 =?us-ascii?Q?NEc/5YonC1hQhQTbSVvg6UpEbvrM3FRKQzV+gOtuCbo5HBmvv5KH2sJVw+ea?=
 =?us-ascii?Q?c5ql6/BRcXLBI4sjLf2GXeOh7pGRNBWnV6ulC6Kz4/kDCaoMEy8O4YMl0pWg?=
 =?us-ascii?Q?789oEAS7ZPh2OOnXnmch03YdxjoZTW557z6AKxDKpTB6wOVs9JPoWThdFSsI?=
 =?us-ascii?Q?V6II0L1pKUma/V8EBP1AcSGE1c7/RPyJ+gkNKzDzQEScRRe3zH57acMgtjsg?=
 =?us-ascii?Q?UjTjVYr5oZq+SD9OFpRjCXN7u/65Pcds12dRKx7XEQSn8a/Jz62lvdyLeI6e?=
 =?us-ascii?Q?Wr2Rj8PlYj6VFl7tlG+kl+vDLPKMmOVg+KqSVjRIXgS/GIYdojzAAmQ153Xz?=
 =?us-ascii?Q?kdbormCfKonaE6y5ORej5U3fj3Bi2Umyo1Wp1SybukopgFt2v9UpnB/E/H/9?=
 =?us-ascii?Q?ait+lKNuiaMug9N9DceTc0jgq+7QSjfVDwjVxczcGCF6G+Yl9bwLkaT69Dvz?=
 =?us-ascii?Q?8ChNPmN5ZeK8L2xQQj/2WkrkyZSSjfWuZibeCT1Y8l8Yrtmgkg+thnV7DeTz?=
 =?us-ascii?Q?mQHTpfn1Swgr87ZLOqT73vcYWEVRhTzoeGQwLkpJ07VAN+1aRZabI3fmapkU?=
 =?us-ascii?Q?VHykw/JUT5ISO8KW+d2aZaVBVEuZAS+Oc0NuzUFyZNh3kTlRJwu9OCucF/AF?=
 =?us-ascii?Q?ohJsbBDtgSEyOz0chxAvX8Er/GELmx9hzqOZB3t/Pnm/bn+KLCt2DVGXwcuq?=
 =?us-ascii?Q?x4GBWbrPmt5iWsua5HQ8QP6O1mqSKzYUvuQLg10UMGhCnI7pR5NttRMoawfT?=
 =?us-ascii?Q?aPJlRqYrlXyp2AYv6a9cgJsy/Jkr4VvjcGhfdyd1qheOzyESuwC2vGmebt17?=
 =?us-ascii?Q?poq1W9drIBqUew9yBwd7cTSS+p2HCHBYlCyO5XIMHvVPq4bI3JQIEL7Tzijn?=
 =?us-ascii?Q?XzSvEO9FFMOrEFYPOdfgyBxHlRQufZYPxWZvSPQjMT7ik0PajpluESecZTQ7?=
 =?us-ascii?Q?pLXE1uvWPlBy3totNusEtjsELz4TONokDRrLdowmEM8Q9ckRNjnsih4lF607?=
 =?us-ascii?Q?3MWkfLlUAYxuURlBlLNYFVQ91k3U+lFvCcZe7CFIaF2yf9H0+4q5V9CSqQjd?=
 =?us-ascii?Q?Cf3NBYQUdg7HsaVGkjr7e9ciUdjv1AedhShQrOJLEThgZ3ntKpxLUobWj0xa?=
 =?us-ascii?Q?KnvWkGV652j/6YjAYJHhAPqpF99Yy8kHn6G2SvKWDwXOqS9VDTo+n2N2/abM?=
 =?us-ascii?Q?ec/35eUI6fD9nOeBq2Doy89PR2MDmKawXiPC8jQ2BDxntLYaP6hwXh+Nv42L?=
 =?us-ascii?Q?5V7iqZ8rZCtNzte8FOHCiPzqR07Ya7iTef9H0Ybw0f0Lg6nqLar02dfOK/W8?=
 =?us-ascii?Q?TnK6GfiBivIJ+hVggxuQJhLLnM4CaZ+WbfzYxo5IyVXjlWgzBT2Xpv1HZ1c9?=
 =?us-ascii?Q?UoZsF8TVtkIG4kwkwLW//8g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b418ea3-3f53-4dfc-0108-08ddfb235ea4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:28.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIoMiE83D7Zikm8b2MFZopRx1abk5CAfuZ3Li3+dLr/PsaGH+hSAcaRBDGqcxZyH84HiWtER+CYKKOG1v0nMymUbCbDW7Hwxy+p4iudoY5aKK2x3nP0npTDXwYganKR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8177

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 7f1aca218c9f..cb16fe194208 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "renesas,r9a09g077";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	cpus {
 		#address-cells = <1>;
@@ -71,7 +72,6 @@ psci {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -389,11 +389,11 @@ sdhi1_vqmmc: vqmmc-regulator {
 
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


