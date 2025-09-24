Return-Path: <linux-renesas-soc+bounces-22278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492AB98323
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0754F4C29C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D160272612;
	Wed, 24 Sep 2025 04:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E1yip+OK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82A1DF258
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688209; cv=fail; b=Z4CsR4BsbpxYlFQMEtcNd3wE96kdafUS63BS/DmUAF/zncHjDm94pN4uqtCJQjkdjMfyc2DggdNM4eMw0nFL1+LHETtGZQio+5zoPk+JnzOq6qQo0f2f4rKGAORfAkFKREtglkhljsYPI5bnR/eMsBIKilop0xxUZT4yk7oZX+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688209; c=relaxed/simple;
	bh=BlSv88K1HjQgjphnrhVjg32NuIRO5v+xN0pGMahxAQk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OabAPFP06Ktvrw5SBW4CYpCg6VQf5kye/cjdqUlCYN4/ByJNco3K0Ozl6OZ/Rwm2L2tKFIhPVgQkKNF1aGv5hIeQ1TCK2qdKOhkpTMC5EOwfpcs6FE2BFvHLXcoCMPgcW8EdQLBd2PKdZUOyBoKEz3P80FuYIC4szZ2eVy4ZI3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E1yip+OK; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmuTeZ2oCMMd5aibiA9kL8xad3RSTmVI0TZYk/1dDNnG/xogD0Xnzu726XQl1AFW2qehuQ0sxE20P+tHSKWG5xX4b1SMGVWi0efPbVTh+W4fsWP8FX9gKHLQnrzZoTfgaDWm1BXltLX9e9eC4Gg8hx5WnIl66VuSLyrF7eA8avKLP2n9/SPl6Pl51Z5azpbsUul+cyRD/dIebrwKoQjZvxtfm1D69CzUj9uGPdwk5O7ejAsmhYQy6KmB9HpDGsKpPrxGj3jDz1H3zJNalXR8hhkE7G2q9zGjY5CAV9lVLIqY+Cta6CwaBVhF1roU7mMIvxB9QBC2lgcGihCp1e/phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d69++PqaBgkMktmrNDHFalt5WHgXkmPaYF+5lG8h53U=;
 b=NxGbWLJfVAkri1upKbqyGsYKZTWHX+3R7/7SubqgdqbnzTiOvCCc0mL92llYjQu+3aGcep4AA9cEQrf780yjt7BrOKsuAZJ414aJhD5I0DI9CvB2SCQXWqxMm2r2Z18MB+zQ6uG9ISTCizWMpmCLCr3DBNCvVJs+NwjLDFNztez0jmlrRQDD1NUxufDTvWqYZL/XqnO9wj4iYJ3HSBl6duE7q3AMW6TCWA8AKW37h7MacHqjantHcF/xU1dNmR35xWoFkKFnRBN/sBmZQZC0r1qzpdQ1+Sc2eLsV9KCtJ/rE9WclcEM3aFlkQtHYa3ubWamsVxxPcP1teaaHSMTvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d69++PqaBgkMktmrNDHFalt5WHgXkmPaYF+5lG8h53U=;
 b=E1yip+OKKVgp+MJnCYEWFB1Ac8W79rUfkTFLATSKju3fh07eJyFKjVVUjlSz163OWqjco67pKnL0JZ5FCc3Hff674qUYhFCFmsN1NajHPdNMWsJ25pjCoP4EBAjzsvBfiBbHBwx7CzC8mMPz1ICdGw5dp3ejOBJ8U82P3dYiZk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10255.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:04 +0000
Message-ID: <87bjn0a2wk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/26] arm64: dts: renesas: r8a774a1: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:04 +0000
X-ClientProxiedBy: TY4P301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10255:EE_
X-MS-Office365-Filtering-Correlation-Id: 707967f0-577b-48f2-f89b-08ddfb23088d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IHCGkPYXN/DPhB81OrL9Yo1ZAElKB/Og1/nXpklqHYOnSZU3BjBggiS2Eom2?=
 =?us-ascii?Q?ELv4J7H+p9K3UJ4iMCCBVec9QmjPGYF9BRay8GsdAm2izauNT3Ko7BTeQ/4v?=
 =?us-ascii?Q?zy5c7I4wbefFwlPYDAET+PTQiUq4x2gSsgKnFJyEDssqq26d6ILlcQVyxNoO?=
 =?us-ascii?Q?4ePoJNWHAiGmhTJtNPLlVbMmkKKTVHED+izVWrxfbbEYq2BxnRmJjog2aRSN?=
 =?us-ascii?Q?XH5aA/Q8ackAJEcff5FUkcudAvuwfeEzNWQGD7CkNZvykMq8xjy22lFqUOZM?=
 =?us-ascii?Q?6G1fFrAPHXk9S0t+CJU1EL2yvcb8pXY7XGlsa/lChFviD2t/CrLek3Tl7iRb?=
 =?us-ascii?Q?lSssTAWxkoDGqLatoApurluq+OvVAqOY730dtoy0c/3gnV8TbgEbQG97P1GE?=
 =?us-ascii?Q?uMKlsBD1Q5pHPLSMJmgoBY9fGlxpddyhG5ChQjvbtJcSnIYhAPtg8gkaVDUj?=
 =?us-ascii?Q?PWB343a/tfc3QRtM1Ee2CnH6Mrruscalg2r5xk6/jL4L+awYCEqwVBBXFado?=
 =?us-ascii?Q?8GQE0AA4evRAXmXkj2xHkyR9t/OHJYnw/x9bBnLMkfUlHlRylEDv44XGDkUB?=
 =?us-ascii?Q?ELWkhYBf/iGIpTozSsthyUXjEXg0qQRjcKJ9qljBaFOGn/+0uD5x6cnfzHJ5?=
 =?us-ascii?Q?63Xr0M+05lwa5hcY8Lg9UQeLGBbvjPauly58/dxYibhVpQxB/6GqnwM3WFst?=
 =?us-ascii?Q?lGewKj3DgZJuera5A7u+su2sxL1QyIJQcCj0543l36xHa6bxmAISU57GxFam?=
 =?us-ascii?Q?nva6sNEbTwMXghAcWmxuEOtMoRRf7+UgKKFlqT2Dg/Iqcb/veAOMCmxRBijD?=
 =?us-ascii?Q?AYZ6H2x/FVox4TFvCYqvwllk8B9s6D1mYUs5247RYzwyKAtQgWegboXZdzWQ?=
 =?us-ascii?Q?wKL4N7bDWWeYvttenUMsLiG4eWx24sgr+K29WHEkDCuacCkc0qc7QNqRF5+O?=
 =?us-ascii?Q?ZI/IZPpQdm7HtsgUtC6nzu0cVq0ieTQps4TYjdam6bHPFXSHaGF3vN6dAJbh?=
 =?us-ascii?Q?Azvu2ipowc4a6g4CWh1w6KCxtK3nacXbW3yARta87tIYhPIgYPrmSMRVUE6M?=
 =?us-ascii?Q?47COGcpd0gnF64WnkEOVEcy3/L0YQFxD40ZtrYfDqtGys3ZYkpEry2iKFtCO?=
 =?us-ascii?Q?kaUuZnEzkl32ceJTSHaS/OUn8PlgGZZSeohknxKUPS0FHvAki/QFY/Nw2wz7?=
 =?us-ascii?Q?lJj6B2kT3JOPQAVdlTxGVeWHat8IQ09z/Ar4txXbMpdw4kDMJFcbSEehk9ZG?=
 =?us-ascii?Q?fCbuq5FZZXxJmAhFE9DMJwvgWR4vc7re0lydFOjFfnik7Udhhv4eu8ag/EWs?=
 =?us-ascii?Q?gEaTuURrzUtKOXBnBcTK7WIxrQL8qlq07Vy7jZz/lfUJfvlSW1xgpR8DacFw?=
 =?us-ascii?Q?QecToRBkEPFx55sJroOCJrrU+qfMLiodkSOGVmpTKqzvICWsBjqfoBri0hg0?=
 =?us-ascii?Q?ohTPbp5Wuzyd24qVhF53kHupoylKSrYz5MJy9KSg+Wsb4ZD5nxFsOyL+4JAt?=
 =?us-ascii?Q?wtQlxAH3hfzDoGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OFp6jhEqs9p1c9iXbO9Gg1pCuR8XM587J7LsU3itMQxS7bKPgIiVFiNuYtIj?=
 =?us-ascii?Q?8at8kianL1TgM+VN+stCkjXoCc/9hgqulMiTB/X2KpFIwx1z3BHodetyM2HL?=
 =?us-ascii?Q?ov8XOLEum+ZaMjgBpmxbv/3XXdMuzNOH8gj8j/U2XqHyfy75x5iQkWwjYvhI?=
 =?us-ascii?Q?xouyVo/dfRrvkszkL/+Sux5PnkDQXOV3i9M59I8QlSTJXkG+9fu9MUB0lMwn?=
 =?us-ascii?Q?etzmX2+1lLtFh9+f+c5fD1Xuow6cqVi6M/OD4IrCvmnsqtNc1UWs6rPAYPMQ?=
 =?us-ascii?Q?k27oX+C5Y4tf59tM8fDVzjpB7x0GWGJl1qTOiHkzmWDLrjp4ikW6e1tusQDN?=
 =?us-ascii?Q?6j5g6xu8JDLsUReFVg0gNe8WaeKKu06p91VcNCz29e5KtrhlFaD95aVnpImU?=
 =?us-ascii?Q?/3ShJIzoePvConcYtnM/Di8vBR6GLpb1v5gxloC+JGP1a6MJvoqY7eOa0d3v?=
 =?us-ascii?Q?mBpV3cwLlQPXsO9mmuLRe0attSqAfmMJ1+YBOqp0zLS4N0Ml3jdCukh5sCGi?=
 =?us-ascii?Q?0h2pwv1cWkiEGhNwmw0dP2ixkD2VHwGd+a2vZvi09UCJZnFefAeZmW4jIwPe?=
 =?us-ascii?Q?krHm3gWJMh1bdR1NpbUM2SiFoY3BfDRydNT2xYel8PhgNTS8WQfWGkET/mid?=
 =?us-ascii?Q?I2DAvPK9PywIE6IHM7d5+Y1dzBrpI4y3WGUHvGbTDKLZlioIDq9IxGKjzvY3?=
 =?us-ascii?Q?9DSeFkJPEtLANX7eghKBWxzr4qEzkgPFnQe+1QiQj9D2cJ16KKhfKmlupH0g?=
 =?us-ascii?Q?tx7J+UgKfKX6e6HpSDyCHEMUgw3eO0JH9wzXGcePC2N4VNrDJya6SLOxw3JU?=
 =?us-ascii?Q?Ydxvn38rn5CmD+WdNypisOz6aWYUFrq34t+jEFftoCSMWMabgCm5pzAgbU2e?=
 =?us-ascii?Q?JXcPlBBxKPImxXzSSh94yXkWeDC3FGOXhSphC4jQdMwWk8cRTpCHBelW8nWV?=
 =?us-ascii?Q?3zTi+MuiyVP6DNNzgt6TeU+FTg5XU93ncqCAhrwE8Iy4jgNl/WMWTBJ1m1wr?=
 =?us-ascii?Q?OwuijCbmGnsnyExWl/FVnUurdiit0rvr6loDKDC4yzFzxbNfjvRNsSPeuW/4?=
 =?us-ascii?Q?ipGP6d5KT/N8RGOalqGhK/h9W09wPiPazfL8noHWTbFV2QF7FXX7JPjleBsJ?=
 =?us-ascii?Q?jOu4xgydKL3eSyo/K0YFoMDc3kCcSNbO00JSgNCOQw176T1HUNRCTq+gt3yE?=
 =?us-ascii?Q?9aPZ124AMnxd+CeqB5GAWARw6+mzbUi3kjlDyAUm82JIJCYPu+xodAz9c+nY?=
 =?us-ascii?Q?dzYDvEe2pA7/P1+zn6uoJ9PTeKskmgypKzfVfRqCusVZAI8SXy2Vxd+rA+aa?=
 =?us-ascii?Q?Lw4RX/wHDcZmkijy8Eq9TjKCQBGGaBr8Ih2WdED+2IAvWq3amvIN+G3KX/El?=
 =?us-ascii?Q?Fdg0nIZXghDghxP8BWUN3nkx/nnwmzv9SKJxVdvoq33Vm0nyraXB68E034uE?=
 =?us-ascii?Q?J4manC64tGNsKPS++Pq7bIAROK0MjVvWjbQD5yn7KTd0iJ/rQ+j/JhIRh2AM?=
 =?us-ascii?Q?ImVyxGleG689XJR4u9rSvJQRTK7UhVcXIsLpTa3hkmBK7L8RFwleu7NE4kfy?=
 =?us-ascii?Q?8+WnptOCwf/WDJiee0J4gBjT+88ElBOsUckhUd+lpVdbWUg9ANeXo1K//Hv1?=
 =?us-ascii?Q?zAfyZCkYaJnR+MzkBiSWSHg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707967f0-577b-48f2-f89b-08ddfb23088d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:04.4080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Phffm+Oe0O968nW7S/DsuPJ3cMj7U7s6izrf6rKC10GWP3WNxbdVZpMyR5D+TBXP+91a8//YiTEp/4hlEbarPVynBdIJe/GoizlWwt27JQpA7WskxIce7vRvC4v0QjbL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10255

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 6b737d91b320..f0729a482cef 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "renesas,r8a774a1";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -235,17 +236,17 @@ pcie_bus_clk: pcie_bus {
 
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
 	};
 
 	pmu_a57 {
 		compatible = "arm,cortex-a57-pmu";
-		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts= <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a57_0>, <&a57_1>;
 	};
 
@@ -263,7 +264,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2863,10 +2863,10 @@ sensor3_crit: sensor3-crit {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
-- 
2.43.0


