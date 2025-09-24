Return-Path: <linux-renesas-soc+bounces-22290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381DB98347
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9C642E5CAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D813C01;
	Wed, 24 Sep 2025 04:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oxd7TchM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46D628F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688280; cv=fail; b=orQvl/e0oGaO9ZJSxj03g/k4b9dM13m9uqptQ6/r8iC8DCZ+yNoQp0t4CWL1Jrjs5dkbm3HzrR3F13IaVODcakUHwahgHvMU+K/UtSKMOliAJY7ZJXLAZO+bJ/IipnPn1ILc556nT+bXcSl7xUv4NdCtXzpGR6riSEhc/MH+wEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688280; c=relaxed/simple;
	bh=WbFeBwUKsYOwqXpWWvKGG6bgG1Y1cyMHXPMxZX6Gacw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wrw8csvWCc7McuggcWVYva2bjh1PqSWrmfCSFHxFdhbBHy6COpXCO2/4Mfna6eDpMGMPD63YXh3DiJy4NG/OGYuV3sfCzz2JatcrCojjS573e1AnfIsvr1UZvSbIsfa8vWvm+Lgl7bxvKxkxAOZjqBJVePgOzx6D247JosZL1Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oxd7TchM; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YT36KggCKjnsl7JFL3XQdjTbN2lN2rx7bNQj6yhxPQxxRgsEjfHCYKVcuGdCYabUcY1NLC5GpnCdqoXTPwT6zrJYlhRnfYvu4diwlC87mdMnkOgBZeDak99Yg1q2dgx3/xf8oiglp+iSp9a4OVfDqXIjNQht4WAmPF276O4Y3Usw60NsvJGZgx5iWwI67ZyIV97gH/z/8xNnlQUgtSp/AsoQ7OG7y5rkckPdHQ8b77hhmpGGc9hxzOJE8Ot0nz77naEAgSzh98s2tsdSHAoUsc5WmE93GmQ13kjrjWgLPuIPCnNq7oZ7AD7IznO+8bifR+wR+SSPspKoxwfTaDmJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S3ojpW4V0uO4YkjLlnXUp1LBHx7RQPJFOaWhgyelPQ=;
 b=TEx0tVZw3CNMV4e+SOISWfnA4Hiu0fdQ6p+QBTS2O4k96oxMKwapl8KJPL/lZPvZsyhPEM991I08MqFyr24+oAF74UapPioDF0JCbHueSs8dtQb7VkfTt/1HWTFu5kj1vITWwKoVbjwFRaHU9f3BHOHksdXWjIcxFjy2pZHPl2RpzN8GJqHmaUXrh6MGloqpjE/C7wauFE7LRwnkxEfgZyysHugyPFvCmEL/SVJMJevKgO1SYNShzvE83vEtUsnyd3DBRCpyUVvQ/Dn6bzpnD0PmdC1LCEwQzAMq3sMLp8PKTxfjCYwovOpCIdzsZ9mXy9dZeZpeiY/sOmkJAzZnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S3ojpW4V0uO4YkjLlnXUp1LBHx7RQPJFOaWhgyelPQ=;
 b=oxd7TchM13niSeyCsUHKMH+z+B2IULrR5WDZVU+pEDhWiqWzKglLcPJ3WBj64PF47A79+C7Chv6AdnTbEd10+NCOhodItaGh8ebKr/boLHRgKkKlV98gB4c87bUkP2witgXSAVrNlk6VTnunYgqKjZHlJDL7dzS+qaIQ/Xdevrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:15 +0000
Message-ID: <87tt0s8oa4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/26] arm64: dts: renesas: r8a779a0: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:15 +0000
X-ClientProxiedBy: TYCP286CA0197.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: adf2e97e-c3a4-496b-ee3e-08ddfb23332e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cyC51h3yEBlgULfY5ZYNWpxa+mYllzRkH8sLoZOS/WHQ3XhL4UoaWtCgLSrX?=
 =?us-ascii?Q?0yJ/pyRX6hIU9h9JyBtUltJrmsuyeHRT4AJIf+cF3u5a/eFHezPwFS37FyAg?=
 =?us-ascii?Q?B97GSivf6os80j2FPvUeDAtQh0H4so2Lv+iPThfK3OgsSWEI5+StxoIFRABP?=
 =?us-ascii?Q?4VwJYqBu3ZX+/a6bYkOEY0Q+Dtcykf054oQhsXpoivLB8qt3AmnmflxlG90Y?=
 =?us-ascii?Q?UJGAcOxOINu2D0GDFpzdmkLPr4hmdZ4KWC+NlUKEHsoQtt1/EDO/jGl/Vz++?=
 =?us-ascii?Q?QVWwxY3jvKL+Do3/wmZ3qStO0me54I0OavhbeGLy/aoc8bv0yvGML715ApvY?=
 =?us-ascii?Q?j+P86/23xsOaQEXBoBYGwL1yeVme2fagdPemGAgMcdG/yym+rcXQlAe5+Ue3?=
 =?us-ascii?Q?Wb6kd50QodsF15plz7q0U8+lwd3FnUYQ/9wqTpPydPlbkCwqD4XPn+iyeYyi?=
 =?us-ascii?Q?+pIDDMWaaJHxw3KC7A8ldKh/9BFh9ck8oLDoDXN5MFG5vb2Jrppc3WmsJlTj?=
 =?us-ascii?Q?p4k/mLb88PRhc+SZ/Zeq79SA2L8rHoi2wFuRdKsRP208EjQE3xzENJOxkyk6?=
 =?us-ascii?Q?2Dr9FTagKM8nTJ+oaPSJ66ht8nLCb4zcXRwZKNU3V0P/C3FZejF88tmj9Qbm?=
 =?us-ascii?Q?Y5q7of0SUxf4Kv2rEzaGAxEmdoJJqTbnzBcp9eEjN5I1kFVLU1oMO/mN0WJZ?=
 =?us-ascii?Q?UL+v5T6+A4LnCW445Nz2/KFUK31kJOBY+6roSxqXGLGsq4YHkuNUS5iVLTTV?=
 =?us-ascii?Q?AxN4XhAnz4JoUYu8czVBGGpjrRpmUm6iQ1Mm5rj36QkPYQl0hTru238FB/JQ?=
 =?us-ascii?Q?Dx0rzfzwiU8NXQsbufoRbxg5/A23K6fHZzVBbYXTrHWGKzCcl47RlWd23s2K?=
 =?us-ascii?Q?rrbyMfDlfqRaJYzUiSDayisyfdKFr7/WNkaWpBy2DeBM0zvSCInamIKHom1f?=
 =?us-ascii?Q?VXa4N+OTzCJh5om1z2WZjro0fg/ghXrDCRGfnSIXhTGJB/kcDaF9MpnQ+wIj?=
 =?us-ascii?Q?U1k2O/n3ist+gfFWmNK+ARvqljpWxgK4ZXiCb4GnhX35M+fykeImiZzW5lLh?=
 =?us-ascii?Q?9wCfW2nk4kuUwMH1Jdk1pp5krYbAO1hbYb4BgKamCHUEA5fMAzLMVlcqlrV1?=
 =?us-ascii?Q?BucrYxvWYGx7WlUEmfcoOXjDQ2yJUgKyzX77y0Gww5rdTT96HugAxgtODFOc?=
 =?us-ascii?Q?w9N5bFxXAnkznEZKZGsk7VsjyLYt6S89DVOUTlWglKNi0HFIrCrF1S2ada1E?=
 =?us-ascii?Q?GxpPp4hi0J80AsOCsLnu3nd0LyNzhnplH+CCq1oSVrUqTAApySkvO2Xzs/O3?=
 =?us-ascii?Q?FgTBld2pAVGcKY7Py0BXVhcUhubLodQP7d6tKa5YXQ9DulGIGjPnO6YkJ1Vq?=
 =?us-ascii?Q?yylUumESa9qiaVhqPkgu0XSCJM7brH0qmFLh2c7Z8FzN3Nq596o67rWGNN15?=
 =?us-ascii?Q?es8c0HiLFgnxEDWRYRbJX9QIz1HLC1OtgZLEBrQm7umiKBu+OERCsyIw41nP?=
 =?us-ascii?Q?hzP7xjfMeQmsNmM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fZAjERnIOhqBkoKJ7eS3WXLTrJuto3rxfPJTp+VwtbGYrCDGsVXxDHwskTP/?=
 =?us-ascii?Q?nv2OUo5uLeVCr8tt/JBhW7T5vqKPZ4UhbBwNsTyI8cYpA7b3e4IpuwXtwAF6?=
 =?us-ascii?Q?dXnLiH5T9GtMtz6a3kFcg+33q8KkPqxvcfNjppVueraTVE8ls992iWitj7zS?=
 =?us-ascii?Q?siTGLIKR7HxD7aTRNCclOo0WwoiPKIqVXfaTZP2aeA5hS4nM0ulqGICAhRNo?=
 =?us-ascii?Q?3e6F2cqUx6CcEFAtJfQtrDEq7iPxWGqQjwQIhA2J5lipVyWMIsUWF4PiIUZx?=
 =?us-ascii?Q?lVIg3ZRTcpqPZD2GjMXc8N/nghThizXPOplKEBCIiGhqfd5ES0kqz19UlJb9?=
 =?us-ascii?Q?Xj9kswOAzn4hA0tjk0m8kaxNevW7LPNsGYWIkmRPHVQ7RJWUQVlTJ16nFs0E?=
 =?us-ascii?Q?RhzImQq8agmd1T8nNI2/b8UEKDqRCcx2A0XTffUkQ0GhCZmdSAevP2obASs4?=
 =?us-ascii?Q?653jxP2N7NnkHrl8mUZ0fy8tNSh02wNRGn8TReBcpOQG+7xTL7zx9HboSBEh?=
 =?us-ascii?Q?sLyWj9dt1fRCeYTZplwpnSpnMFPG1USGkVeXtuaROfv2BLMTAbUBapq0XgCm?=
 =?us-ascii?Q?opniYfW1SPN/eLn9KnvESABv582Mna8VIScAYffL+N2AzorZaq3EcBLKRsrs?=
 =?us-ascii?Q?EatM94tDmiZtQvzFQ358wGods6sE7U/tq2wdvhmK7yRj8Bfd7IcO7VBQDQHF?=
 =?us-ascii?Q?5ZdiLhc3l3OVTgGQ0uHUvtRK6Ikb1kpf4IHuXtHBYwkJ7qfXR9VtxZvG0n9K?=
 =?us-ascii?Q?yLJ+UpbqYkPfLwTz7p8rtULBMhol+tYB8s2JpEueJ42E5gciSBG9JVTL/+EF?=
 =?us-ascii?Q?0/KSNpbaj2GyQYKHVrPUUtFVHyB6ZLu577RDPPJ+ojyDR8W9Oi/ecRfJDPmI?=
 =?us-ascii?Q?bIxYHhIECsA8RtRubRl63i/JePJ3vqOb3ngBEeMBCd22Rulwns2vXj2XCFR7?=
 =?us-ascii?Q?6Ou7L+Uak5p3nR7B7+/wZdZpnssE/GWBTEZocR0HNd+i7+JJEF4B11ESwofn?=
 =?us-ascii?Q?pangxkWqT4CZxFGKLc3+myTjH9zbmzPcBV1ysRcGVC34dMFsWSKbMyTaB2N+?=
 =?us-ascii?Q?gtP8DZ0ByutqFlq8y24fXhtGVtr3lO0dolAMZvsH/+ZB1s1MEY93tRZwc353?=
 =?us-ascii?Q?8/BfUV+/ymvEGXGXLScjDNjEPWRsCW5ZeTlsrvd4uj30rltCqPBeu0slc8Pi?=
 =?us-ascii?Q?zmfCjm8NPvw1OZkZVzVYEer1f0Ikzwn4U0OdwzkR1Lc0b8D/rwgiCi9OHdOs?=
 =?us-ascii?Q?CKuq/z5SqM/H/fN1ylrjwo/V3FHBdsXAnwDWe3dY12d7a5IdU0xz1uFdJznJ?=
 =?us-ascii?Q?EQ9MiOEifQFMDcRLwuDyGylaH5/t4QLzhl1leBTWsgzru2DAg0RZTApJNAKI?=
 =?us-ascii?Q?b6B0trcIx5743o1xDU9xiq+5lKZ/q87iJfQsegbt/O+mah53p+MbBSJZLTxh?=
 =?us-ascii?Q?oBw5v10REY3XjiUqYbrXpF0nYnPSMM021ujhc/L+7TRRPijPhS8DYpQCYtdQ?=
 =?us-ascii?Q?7sYHjGMAC50mxY8m5xOl0wyo38FCG81ub+vRXXc8HbI72cmz4zVCj2jo00F2?=
 =?us-ascii?Q?RrO4bRBKodlMWpElWKsEdyUV50fFGHyWOFCnGA0rNKcI7haHCNvlY4Gr+63i?=
 =?us-ascii?Q?mwcfDrBtkIDoUBMEARXTGjc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf2e97e-c3a4-496b-ee3e-08ddfb23332e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:15.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAfWmd/N6BE5cYV6cgAk4pObUy+8g26QeiA5g95lSiJF7XWBFUXWr2bdPxPdpSgzep7onI/kbKm6aQKqt27K8zbh/m5AKPq8iFRcbpegfV54tHacsBb5J7gAfr3CUBhu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 2c3fb34abb28..f48b0d5c19e8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a779a0";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/* External CAN clock - to be overridden by boards that provide it */
 	can_clk: can {
@@ -60,7 +61,7 @@ extalr_clk: extalr {
 
 	pmu_a76 {
 		compatible = "arm,cortex-a76-pmu";
-		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	/* External SCIF clock - to be overridden by boards that provide it */
@@ -72,7 +73,6 @@ scif_clk: scif {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -3086,11 +3086,11 @@ sensor5_crit: sensor5-crit {
 
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


