Return-Path: <linux-renesas-soc+bounces-22303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A39B98372
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E62B2A45BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0220E28F4;
	Wed, 24 Sep 2025 04:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eSUlZZw5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB503C01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688356; cv=fail; b=sVZchQ2iATeGiwOqRQiOjjSkn6FdygNpBM91/IKvrQKc62fG81xLPHQCOWU+u71DQY01j6WYL2f5BoErkrhaS6Lpbqp/bfyDjkAQdtd8/VkNItlH6ZU69CwypIOySsXOQZcX/TSVjaou7YJ5fdeg1dmvBm/4TWrDUaLUgGwX2gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688356; c=relaxed/simple;
	bh=zfojYqcUkdNk2OAqZixRzT6NCY6AgjeOHKIZU6+3geA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HLXpt2sCsSDWQejDU5TpVhJru/8s7sOEag2PXXznxmpjjnGnNIKAVe1eOihDr5gZnptu3fe/ZfIC8uSErm0NHYu1JxxloA/nOpoO2Yxzi+AzN0yXErqqVz/o1EdLT2LFa8lnhLgskNvI0Xafau7Dsdsid4b3XYZt2CfZaedH+6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eSUlZZw5; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hif+A/9l6ufMswpg/JrPZWkrKDHA6FK5QQDkQ3FrnrggKQTRRq+gce940H4/aOAZJT1s8/5j8PgRtQakjp0l2K4snXTPLpmvj79YZKcjLqDmvwMWae+qs/88w0z6/x5n1nyE8Wh+YoHrnIWYXkhZeXGuwXZqIJsZgAiOev1Aqpm4OGLHqccXfqEhHR5arxcsyeyLuQ4NtcTNBSEOb8ZpTnho4At7mb7Y3rVvNLdg7jcWJguSFd8raoyPe3g5CLR/Nu6NWuE7uhXe+aBNz0MrNOToVXMq37yflkUz//a8kTYZKzMwRWYpsjUVreROTJ8kuKeGRv3Mirw9DhArfhUCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvVmW35E5F3FXiVqCFgjMJaP10raZJ7cbP3V7gRllQM=;
 b=fKJ82pjKLPAeROsMzn5b+Isr7ZQXdBF4ftFa7MIUdx0Akg5iKaruMB6++h0vCPOLsGSHnzcB9WzX5oJFP6+9p71RWywcAn7z2IOfwiwfql0v9Qt5jdfZ01THcUuZn+HiZRI4YLRu1Fmu9uY5h45D1v7jM8sTjAlk5hkh9PAtacNvLVLWNZzvrE6UxB/3/bjv42M8aTmggzaya1Tlmht+xzTrEEeb8NaHzH/LuOSvkF41DoFmvRkEtJqxPa2azwvsMj+GnZam8T5uH/KhwQHP3ThnZgPtYhVfGNQqsOI1cSXoL0+X2UL5BI3Dwd68ft7MNtP5AHhh/y5ZrCQ/PlMp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvVmW35E5F3FXiVqCFgjMJaP10raZJ7cbP3V7gRllQM=;
 b=eSUlZZw5EATL6gdAjlF2sHYGaP5V31Lz3w+5+q8oqjjDJrDw73QI5k8Vc1rcxrGJS7+Z/5YGNxMxlVfK2v0ebbko9GBEi6ri+WwoPR5zCYxhYuTEcy3UhOZSRfpeP5hqFquqABKpn65r+3iLnNl+VlI28RufGusB6E5PH/1Elao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8177.jpnprd01.prod.outlook.com
 (2603:1096:604:173::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:33 +0000
Message-ID: <87bjn08o7z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 26/26] arm64: dts: renesas: r9a09g087: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:32 +0000
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: c96524f6-2f27-4b76-f3c4-08ddfb23613a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XSi8rOsRMxW/qfZLS5+aRekNS7Rt4hqbo2IKZj65dJpWzmAVSZuVGyNmpF1d?=
 =?us-ascii?Q?+awdBFrYvhg+CQ9osqaBBws/yHqFpL0ykQYPuKCB0JmJgyp5206Te/rqypT6?=
 =?us-ascii?Q?JE6kZdD/m8ZOPdyO2yE7xLr30IYG9vUsqjhvOAh2tLTaUb4pnkDn5eVCz16n?=
 =?us-ascii?Q?2jADzap3BCHSN1gcfNCBAkRZb//jXJPF2+En/xhaKpDTxRff04eJW2W2y3NO?=
 =?us-ascii?Q?xbiWeagYysAe7XIgxVAy42EukaAtD7CdhRJEVJjFlR37oKPYbsJMjPLGACRu?=
 =?us-ascii?Q?OELoDj4EeIG568t20JcJXwkX34t056hS/Bw+n+9LIQmJK0+AyN7SF+p9yFZV?=
 =?us-ascii?Q?0+yXi4gpw+PjWkQM1wNRn+oDrKpynLsv/i3LWfdWcgeZxMmy/zSx6RGwdf8D?=
 =?us-ascii?Q?/b2nYOJRMGVQgqMCeNIhbFnfinf0y4kE4UvqB14hN8eYNw04saGHp6mtBDqv?=
 =?us-ascii?Q?qpMWICkUPSDewvXt9NXkmzMEWSQngArmchtpzfPRQh0zT8GqXCHpk3vAh7Ia?=
 =?us-ascii?Q?7aF/KFEgJHi7OamhI2Kcl+tsvJuo83059BcQ6vZ7tQ7GgOSRbnvXXtEs0cs4?=
 =?us-ascii?Q?ShZqZOK0k5WuDNCuDnrHg8pDNzP3bfrJgnsqEbFqHIL1Z3phvNM3iqLUXrBk?=
 =?us-ascii?Q?yBRMibmEgYe+zIhH+Jbqav6DlQMG2jAQ6NOA85XoRI++xcD8TAorRXT0LmF5?=
 =?us-ascii?Q?H3e7Ikw27loyaRyFD7w/Mx+HVMDZbUvyMLsKTOGz5FbArLwlDB85ZAay9CEx?=
 =?us-ascii?Q?GDYueBcpo/KRiwD8ogNW9Kyfo9o03dFhVlK3lmNCg9AUk35dT0FfkcVavoBG?=
 =?us-ascii?Q?6TV0d7TwHXxN48OJ7QtXG322d2fFbbRo8FRsaFFLYhXRzyu7ILdpaczjKB35?=
 =?us-ascii?Q?E80n5mZ+SUzSBsZEn8NGyd7iasmvAiwseaBBDHqSaTGbaKhPvRRoMIDPlFt6?=
 =?us-ascii?Q?8jjPmQ6eqxAeQB/Cgptyf7YNk+bhStRoWRYSbgy2YHBLe4YkcFAI+rHjvkAg?=
 =?us-ascii?Q?167QABIOdgYYEdA/tO4EzL+PKAXv9b3tCJt2HDS1BDENRCAsm2CdU7S0Kvkl?=
 =?us-ascii?Q?5kXqtCri6dzWqm0+xopHo5bPK+ZJLG6S1ieEGzk2HMFgf7DkzPep+D1151ns?=
 =?us-ascii?Q?WnWVPDGJlnlCaghK5SYFjGfMLX7vBW7Q/3EWlbkxveX79JcIUwys19DopgPC?=
 =?us-ascii?Q?QDgx1sg2r6bkgW9Hxc2hBPDYDXuB7GJwU+ZJOkCfIKYoDX8LWLtt3NJxT1t6?=
 =?us-ascii?Q?+nXcrKgxC0MH7amHDsv+xFBX++9ILRMOFdrgF3yB9d32wlmCrsTrw/S6v2P7?=
 =?us-ascii?Q?84K5djUoqy3lkBf31BFOYP+d1gY68Si+7d/0IP8HUvOHfoyLUlltSLLVSgHu?=
 =?us-ascii?Q?cuFy+wzTNxHrgdvB0GhTavZHiMY+c8AsjisjksiO2nFFoO49Jb27YMRxDWpb?=
 =?us-ascii?Q?Dm6320mbkHph/Dg8CTzOAHdmnfAges+CzF8HFGMnik4k0NQbaKZn6UAnV78l?=
 =?us-ascii?Q?otK54NHvj71t/Rc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tF8cn+0lRVY5NskzCNoeik44U/icszMqqjsSyPMjTqqez08hhXLMAtxU4DcF?=
 =?us-ascii?Q?XtMq4oYmiGSHFNQ6On2lthua1OTnr7BRSzWQl07Ixs6Oxgg3IdZ4CooCiwC1?=
 =?us-ascii?Q?1Zfo8+iNHjg7bgTU/HaWGGbEqCgGDPFAMtShJJSZUbQx4nw8xd8wPKUMJ8kg?=
 =?us-ascii?Q?6Bg7VcoQdlyHHoDCdRsrGR+aPWiw4wPUv3zdH4lyGPjKoJohBmc1z4ZcSMAf?=
 =?us-ascii?Q?+pFWsPXWpgb0HTqxYv6fdn+k7O+cLwPgMBU+Cm4BXWGNePfj/DW6CsLZygpc?=
 =?us-ascii?Q?j+rtp0LI2tMy1MY8EnWeBF2KqUTxNKWVuxM05ypu6RHKZCIVS+siJ+ECurqZ?=
 =?us-ascii?Q?gDfxqdUa/fbVkl7rMKRFG4MnBuGLfiJdwhDIksM6MqCNNFyuXfxMrs19iQfK?=
 =?us-ascii?Q?QWxeYL73PQt3e6wJolo28ifXlv/hxo1IYp38mbOgxDWNxsAp4K2pEGX4w2BS?=
 =?us-ascii?Q?AtBtxsrzxTfemqSWmSJcPS1l5rP3xL+sF76BPXRC4N0790tsSG1yuY+t3mxH?=
 =?us-ascii?Q?s55aL3IOCMdYXGrNWgRqj7l/aVVP5omj37xCR37SkPkZE0+z17sVoJ+pKqL0?=
 =?us-ascii?Q?FNyN8FtShD0biM+KkK8rxWDJt6wYa6Xgnd6cFsiSx+V4IwcTKJWXI6dSqkrR?=
 =?us-ascii?Q?6iYIGmbeAy3P5u8ggWhc6+X9TcmKNrAqi9lGAXtu6n+WAuTCf/1nK8cUFIRN?=
 =?us-ascii?Q?MbvKZ2selxwy+75FMt+VZB1G5kJHMm9txlkyprD5H9ZoPTP35nfZWplh44Dc?=
 =?us-ascii?Q?MSU1rvhI9R33t5ogb9L5S8sbsdIg0yexUvo07dZJGCcaK7TzI2Bu2jU2del0?=
 =?us-ascii?Q?WfNQ9hTQ4GQcrg4F2sYY5nEbTCFWLdDxiCmzx2TEQLi87L/5ms89jHVqo8Z2?=
 =?us-ascii?Q?wLX2p648k9uTwtYmluJzATqY0udlE0hZwgvvZVJenV1Q8L3iyVhvDleKCbUw?=
 =?us-ascii?Q?65Z7nvwiE0CFDHe/+0WzGLV2PvvB48qHS725p7qWrZsQIbbaSliePWdTWj89?=
 =?us-ascii?Q?kITILoXexvr90BIwNYuStJ4JUgl+6Vel7BaCRoxt7PqwhO1IZf47yHZELRVh?=
 =?us-ascii?Q?T5whEjPeiwWs7KfZ7b1AdgvICunS2uzsf9Q0OHl20T1z6zCKLncjUFvfmzFB?=
 =?us-ascii?Q?9whtIR+bYeQ1t4F/ekQ3KWNXDx6/HqGNCZ0skoBnQ6n6CaPjwswipRtIhio+?=
 =?us-ascii?Q?8vHyWUlQTNVFf6MH/QPSQgBT9mA0o77/QJ3npkrAnwF3MS5KeMritDpa7Ryn?=
 =?us-ascii?Q?jJ+bGW+ulUQroT0B6qyBHxTKrKkiUtMI5hJGQeWsSm6VYcn59ItC7BfqjIHe?=
 =?us-ascii?Q?rio0lrxr7WExPABP4RmdnaQ0AaIRsvmI6r6/JC9p/+u83VMZrdT91Ob8u527?=
 =?us-ascii?Q?HbUdcxHEibBpJsijv4UGytrR7ensn6CQTTCkoKYtQoFhsMwDwPD2XuubAHkY?=
 =?us-ascii?Q?CJS5eVPgWeoqQ4WEDfPfIaCSX1yuysch6wh+1wcGJkVdBXZUL6xyADYHfXTI?=
 =?us-ascii?Q?/6pVZa6OhBohYHc4rkQrc7IWRU4Gp68XrfioBSq2wglgKM0DId2rhoplNnu1?=
 =?us-ascii?Q?GihHxTo78DXl/bNE42YSXMucXFFlox2VYagMiZmIUWtcFpJ5kqgsOx16nrYc?=
 =?us-ascii?Q?RogqDlz53ZZ9u3YgUzq+iYE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96524f6-2f27-4b76-f3c4-08ddfb23613a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:33.1481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nph7M82wqwLw5Izcbmm0DA8JvUnHCaxT0yi9xZsx/XuVfsEtRwDn0NuEKLJ6nJaEh2LzjeGV8mE5NNgSi0k127k+AB3HYgnV+LwubusV0D/3YBUmz/KnW3FfT3jrnh5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8177

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index f06c19c73adb..8144d3781023 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "renesas,r9a09g087";
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


