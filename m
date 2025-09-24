Return-Path: <linux-renesas-soc+bounces-22279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE57B98326
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A1F47A57BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C60785260;
	Wed, 24 Sep 2025 04:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YzUjkZdQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C043BBF0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688218; cv=fail; b=k3GX4RkmS79eExwJexjN2wnXCOjoeBIxIXKewxRulpKBhuM+Jv4sZcX4CUp/x9WQUAoc5cHLy56Re0dbCgC2RDkpAElMM+eg5zcmt+moCcdZvtHMm+A0xqblh/xIQyhH1jZSS1192Gub8rldOa/clw/0u9I9X3OodCzNkQnI1uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688218; c=relaxed/simple;
	bh=fpFia0ZnBlb3E7o8RgjNb3n1cMRveSVJXfRQz9i6If0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RsaFViO8vQrXCt54ZGfjl7fJdYgDlnwzMMhQQ//OzDu29EheGh+vWP7dqc2MMrTcVJzgZHPo4mgESREHKtYvVd13dfLMiascZt6VStbaYJeZ/8Y4aJHmZmM6QRkyM90HqEbEjK+3ubXhK9klkBBchaJFocIEaVqEAOcYKlgyzbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YzUjkZdQ; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRSsushND9iBSJbkX0GEwu5G0urY/VV6W6ccBj+P3RiU0WrbCErX+xXAuKMSLk6i2aS5nsMVGDy15cc33Sx98J7bhi610rHH18Q05NidnoW27WEMu+2fy5mOP74FBkfP5IW1JHX9RfAFrTMGfQHgUJ0qqwp0c93lJ+DADULhy6531x9Onyd9MaTc9De2zQArIWMZ0BWRNhzbIuvqbQV7DudosP4bd1XUkEAzwSQf/dAGUPlbM+JkTqzPuYVc0P8LuEKL3j8NLvpQM6Jfic02/SMH87wjLwwNI5dreLGoKGa8IMaXva95gbFyC3UfDfv5J6YlV14kzSrxx7m9gZ9dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r75i0h9tSnKorAGxVrVRy3HrQTphKBmnord/V7hUN44=;
 b=pwLflLjwINAKYEmQj1BuucZcyj1m0h9718ovRhYBVVtTBABUYzm5CcLoglYgBTN4rfqooOa3olZS4E2m+lWaVI96tmIlwrTRN77nGooRq5vr8wvtvrvYo+rAfHrfSaJyimZQpwfgHdCa2vKLkANaPbnsTQ9c5ae871Vm94gs6zQWnJWSLala8f4mQ+G6u4x5lrPMyiyBcY4XZxY06a4a2vI/4g2qx5ychjPLintNV78ePA7VV9tibwhav9DptT73pKP6Aqbqe/zfGj25iNWqqbzZUd7AiR5WTo6eaRKQh6+8oIP/Pt3QJ9SV0T92veasz19fxts4dDw7ym7B3+Amog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r75i0h9tSnKorAGxVrVRy3HrQTphKBmnord/V7hUN44=;
 b=YzUjkZdQau8f696YhdXeDGfjHu2931575FWamjDSm4ELNnAU2h1gmLMSZc/QzaaHbjfbRmNWEZgPIlw+kIMSe0ujBycTGONDeBQYkYDIMqYU2VAq3IpOcnUSr6mVsIeEQdzPlmSY/dfIfp6L0acBHtN2PpK+bTsk+i6lvGNx8MY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10255.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:14 +0000
Message-ID: <87a52ka2wa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/26] arm64: dts: renesas: r8a774b1: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:13 +0000
X-ClientProxiedBy: TY4P286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10255:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da608e9-aa0c-47a5-9679-08ddfb230e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oALlecuue7TL9HCCbyFhx/Wwi2a65XiGKoD/z0PzxLLJHQq3uZL2Y717XJVP?=
 =?us-ascii?Q?n3F2ay/CsJSomzTW3Af7+WeskW3LvXBExrvJGXOouzaNjGsSnsVZ7AoW0UA+?=
 =?us-ascii?Q?v4h2FOf8v1AgP0lVCQNl031YtitfPdEemt789KkxvsVWQ7Y83CMHaH20IgRz?=
 =?us-ascii?Q?1Ik+bUoDsyNigxLcpkwtT5ACEztdwuZ95TbY+aL9vcB5ROgaDKrrK4ZhWlib?=
 =?us-ascii?Q?4cow4BNDyr4Gv5vCTyTRA/E2nPEhLVRTqjPMTdJ96VivKCRjKN7PHeb742SA?=
 =?us-ascii?Q?dO4pRiI9J3MH1lshk48NprNmFCnIuJd+mY4AB060+BS/PqTW8E65SdO8XhvS?=
 =?us-ascii?Q?dmXbYQ2DMY57AC0gWVJcHgY9NhHZyuLgduaz+265CWLujTyAxeS2LO8EEKVW?=
 =?us-ascii?Q?fXLyiPrKvlABr+3QRI0xFcgwIBEnNoyPJV7AwUA4rmVnU/nTucZtCw5Ruijz?=
 =?us-ascii?Q?dD1/SN5zVx1OBKnFeHcTeXF3xfdP9dmek35bK0PkMdfcj1Nu69U4ZtNHv/zz?=
 =?us-ascii?Q?Oc0fLB57/A0nItxCgGXBh/d6YzFh1bB3HX1xJR0i9Jz8vrKXi23+J+bA5E2x?=
 =?us-ascii?Q?Cykh3qxsxTxlPjpWU0kFxfnLVPGa/gzNX/nfR5EAzJIF45My2vU+6eu+Wj8F?=
 =?us-ascii?Q?3A1vMLGD3cqTeh/VfDx9l04auPpex1mAGsCwpNKjZo0vSD/4VCasbpaAm6VV?=
 =?us-ascii?Q?abxBbwdjkT+7hvdwrmEPJNZgmE+OOicfTTbicvuPQqBdsAkElYIqYzizoLdK?=
 =?us-ascii?Q?09tZSZbkcPPjLa1upxkRRRKi1uBmMWbFxjB2MkmkVOHoUmeJ47hCxRnfnyVe?=
 =?us-ascii?Q?4s+kuZrEONRNu3bcq12M3xfANM+LkdUN0z6qHIJWa5fQbdhhwINGECJlJ04+?=
 =?us-ascii?Q?92WmuRlCMy6DoUJNltklhVBqWl8Mf+MwRD/G2zszjdtSK67DlGQoNg2ytvsM?=
 =?us-ascii?Q?IpKmhOERLE1Q1XotZb7Scnbw5v2K7KKdvNcGUDVuztiASCfZSevnXJc+yhHF?=
 =?us-ascii?Q?MBS09uPio8Pb3gI9VbFlZucGe3hJI1GVh2wO0UI7OTvZ48BXe6wcXJGKZyym?=
 =?us-ascii?Q?GCH8szvQe/kzGVT3sFd/b1T+YkjlvTge16aJUB8S6abK1L59o/wpt2By8A36?=
 =?us-ascii?Q?xqwuY60p5OM+yZk53G1dpPvdtUlhI8lN+y4hXHaeTsM1otqOV070FvQAICxO?=
 =?us-ascii?Q?MpLQFe85N8p1ytHIkdb4O6rjWZ74EhlCyFgKR+15MEfJF2TSaa4OFRIM8VpN?=
 =?us-ascii?Q?KeEsXrINJdtjPU66HVOlrUOkRh2rI7bt2Y7VZGs5NoKfNSQ3LYHRB+KEa+pj?=
 =?us-ascii?Q?XMfm8RT8QF83WoQLISpVgeKoaEN5JxzYxUfdUnEEYdxn1LJi7rhUXc9SMJBc?=
 =?us-ascii?Q?C63V7afEJHU1SjzUXE51OWeriyvDXqbaS1jWdhLLl1q0zHjmALMGiO/6yF1V?=
 =?us-ascii?Q?K2OoHdmUuGS/XX4qwdSXTzMtdlAbJfA1PBw90DgJN7eqYVnOJMCYWX+fH58V?=
 =?us-ascii?Q?ZXdtX8jg7SK2E9E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?31sWBZ3SOvJfEumawxWRnn4046fd2LxZryeui94R9SkCF4JBAV+bCUFe4N4a?=
 =?us-ascii?Q?C+dHm8X0sANu2lbhY4ymJTRF9UoUw3SPcs6AJizOB7V/WXc9r93nKmjWDjAb?=
 =?us-ascii?Q?vTLh1yDmi78gBM07UjjMFtNgIbdmGPPj2SDR6x0/sF3ZHIyyXG53FctBeHqs?=
 =?us-ascii?Q?vLV+9gbs5IKrOmH4/wmNGMKls6LIwT6ktHwvMMfrDAiJByv5uEB98wbgpbTt?=
 =?us-ascii?Q?KnFMVlareMBD7S8dytjBGK0GlEZs5uAEvyeTadzeNKHcYp6m5rH74yFW3cbv?=
 =?us-ascii?Q?r1IbAbrBXPm8ZXlUmZT26tyR87XdSeR/HZJlSavVknfjfFIc1Xoan0PNrenQ?=
 =?us-ascii?Q?bohwaW/r74w4eotWfhauUhLW0KaLiPos4BpeGB9IBboU43MaAyCmjlgROmw1?=
 =?us-ascii?Q?6xLJ2HKcHUeFhau4jhJCN3tQZe35Uts+MNSQIcZD2mnuh8WMR82JzijNs6HZ?=
 =?us-ascii?Q?AvNn8ALz+zlb/heUImWW9gBc2R2skN2N8krLZzColmOFKyjya9LxT4ilin0N?=
 =?us-ascii?Q?jsFUIEuKQCNg/l/FBj020lhd4YQqSrDNAIPUDR0mm7kfeGjT/H90AYKQjLLH?=
 =?us-ascii?Q?AXb9lKswd81/iKxvcam2VI0Rs2aXsJRJCS7aQY+zTGgPlAw9crAyaJw+Shgg?=
 =?us-ascii?Q?ktrg2wvhe327QI13yITJPNe7TRus2cApSiKGSRgv5EPjLsCSByeItrQdxfT5?=
 =?us-ascii?Q?JGsRiDNVOe18fvP6T/rPUYmNGvaTIfB6CkuiUZjkMXieb2Civhm77kDdHy8m?=
 =?us-ascii?Q?UZrcEA2yGnsl6dJ8j6eolora9B1xHz9eIHUd9357Ut7hXeg7tIDJYrqsdGjF?=
 =?us-ascii?Q?UF4mgL+5zl7eNqS+n3lWTZGewo/mR+kC/ZP2FBeaXLeGNFhO09jwDriySsNt?=
 =?us-ascii?Q?W2j9U4wxktBboKzA2laP9Q3gOZnhVcxQ2rggWFZHer/+BeGl+M1RtxRraH3z?=
 =?us-ascii?Q?clyRI3XZRAJPqZUrfAYbg/SOSSVx6QLx/8Elo6kT2dXYSWeV38M0XbO8FriZ?=
 =?us-ascii?Q?NcWw3FC4foUENugriWKIdYc6dUp9BtJj8ErOIQBXfHyCAbiII9N9TRY+awJC?=
 =?us-ascii?Q?zleRq6OIhXIMpqH6LBfr97utsiwJMKmBXQSAoeYu7Fy8lOctCAEGyPvkKPNO?=
 =?us-ascii?Q?OA3OPmMuHYoBdHzHf6tNzMQXuJHlf7dCxUK/kHszMn8lzG8IdBPRfFlJLuB9?=
 =?us-ascii?Q?uKYhIEoehoVneJXsymIb3QI8ubUUAdaavgfPN/lFFNfq5CjXpWKPckCb3e/r?=
 =?us-ascii?Q?1VTIO80Q5Qd9Z0SvW8hAI9ouxjEZ041SHQlsrz18FAtZbM8Kwpf/DsDOYq5u?=
 =?us-ascii?Q?6+jDG+wZeuy3UDiG9j74TQQ+gOBsGYB8ITOcivY0jbqhPo9ZxeEBrS4RDYar?=
 =?us-ascii?Q?2LvezpAdvnXsCRrg6swnBGcOmwBfBWxXSqc245NmxbxrhdlUtSbPNiM58zDM?=
 =?us-ascii?Q?+WGN6fI7FXrMkXEdTDWXYSu/6/w9ohHu0XOcfySC9selbwH1MlZbYWpB4SJU?=
 =?us-ascii?Q?44P406myfhEVrT+/a73GQKld2Z5k7kNLzfls4QjbshN3I6Py6Nqel3t00c9j?=
 =?us-ascii?Q?Vdx0Whsq/O30pYuP/eJncRgkyWLl/5gCqQzWxI3a099l14qjw3v1O5y8l2rR?=
 =?us-ascii?Q?COm+NuAYc+el5vJyCVKPksQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da608e9-aa0c-47a5-9679-08ddfb230e46
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:13.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1x25GG0b8Cx0LcdAEVIWDrZxu2CabugptTBXKtG4J82tLYDnFQKOVYEHxnEx9KkCHjqfLO5Kz4roMo+MGcsuRYP/SivaGlXrcb+DryN8ZTemF3nZCxG8eWYgbFHFKZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10255

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 3f15d656215e..c9857ea944ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "renesas,r8a774b1";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -128,8 +129,8 @@ pcie_bus_clk: pcie_bus {
 
 	pmu_a57 {
 		compatible = "arm,cortex-a57-pmu";
-		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a57_0>, <&a57_1>;
 	};
 
@@ -147,7 +148,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2734,10 +2734,10 @@ sensor3_crit: sensor3-crit {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
-- 
2.43.0


