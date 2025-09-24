Return-Path: <linux-renesas-soc+bounces-22281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADDB9832A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B58A189F5AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B278228F4;
	Wed, 24 Sep 2025 04:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZlETvRiR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39983C01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688230; cv=fail; b=pK9jq2Y8QDNrbnzF7RS4/1WZuu5tUk3MAnY11b8ofFxu3BoYfjU0+qyc7ST7/hJicycH/MbheSw9D3u8NepIvchEptzczSxXaSyEYW+yT/74JV3frEYXpMy1qzh9Bx/kvQow5/MVGIIVuhER6vlSMfF0IVzzXAfhX//XEGGZWjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688230; c=relaxed/simple;
	bh=cUr0dHy4IwSsdK9mHjgyZefEzupCy3iIFtkgTbBdyxA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kWi/LyhTbBjHmUAtGF9MsXz9wdkL/4fOWUb3yQPSclw9nv7mcEOzPfwQsB/DGerZAMTOk6RIE7sb9OL39JJzwgHqKW9M2WVootSCUyij6qnKujMiIiRP9+6NzZcR2jx9EF4SmOd3Tltd9qe7MkdsexBSPuoB3Io4a25m9Jo2SWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZlETvRiR; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rieqx70p8JHv5nbPVv9plQlVxEJFndnwEynXxf8GTPtiH2XbA/zdoowkzAc8CSnDeosBhLgNlq/Ro/qxcQabxHDd/tLuDZ1Jr2LcgOQmucRqcvnGR0+uYAOiAL2EUU9GbpvoznlAt3cm6UXt+1HgeOFQpThMtNEtO/07mG35e4RMIHLq1+MlKjZurTZXzdKlbFjVYB8z9+nwJ3w0ufjyZDl2nk9iS48KiJ08cNoc6nZfh8fo9TrbMsQc9cmuW/PdVyzfUlhe+a5NI7Ae4XihhkBhjV+IRJdoIytcIPB76BiZF7Gb9CaesJdoR1+DLhiGiTqXAXLEF/9SYu5+Q2P+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNV0SLr6nrH21SNMWWd2oLbSS8riPaaQXCCroHq+dFU=;
 b=Wa9zVDmM1jD6vLnuy/lN48zSaV82hiYSmWGsRv1AZ9LenF+OLbsssQiLdz+wcxN8myYag4xR9+9n18gR7YmNhFNIfZjF4sztZYxApZIlwJwUVbEcXqGdyyu/unZfvOL3grB/cQdn5U7z0oQ0G/MTlixT5NWZBG6BxhnzZuj8eKfk5IkVc/rjw+8IsgHdCj1dyBnIkitupzAdmiyVGrk3Fd12Y87JsONIEvBkAHjzVLrvjOUfkkg+KPqVkRFYL/S5UsW7vFFCPNMF2m7OmX0z7dk+Y7HxgcawFqO3Sznm+Z9TtQ/bCYHFR4IsO6LoTJLvBAL6cMpzfD8A3tBBS0n7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNV0SLr6nrH21SNMWWd2oLbSS8riPaaQXCCroHq+dFU=;
 b=ZlETvRiRADvINKK1Ms2ugaRKN+cJFIQuuu16DEHiGOwLDu1CptTUSqRtfFWpKTY4eRde035uyU6stU2tXoK0o4nocJEQPMYz1dU7U+Z9HFXMsmxc7bz7xec618PDCBIrobAFwxDpnn6dO5Xa/SeNz8+1kfB7Y95khOcd9ln/TI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10255.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:26 +0000
Message-ID: <877bxoa2vy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/26] arm64: dts: renesas: r8a774e1: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:26 +0000
X-ClientProxiedBy: TY4P286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7063e4-f449-4b77-5512-08ddfb2315a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1vO/OdZaiehB3GQ5G/uh9aM1U7fGSq5BVHnB7AokCxr3tUCeF3o7hTcylZm?=
 =?us-ascii?Q?KN+TcL94Ab1lXm7K/HZ7uRJ5q36Rxt2Rwe/zg9gU1lrWSluDdTwyCz2cHCzi?=
 =?us-ascii?Q?deqCmaShoHKPzI7KiJ4RZVheRhqLiPc2MReCCIhad3wQ6UGTwnWfXErMKsAU?=
 =?us-ascii?Q?S8cpFXkpTP12LHrmJV+1RQ1rRrLZJjjEc30RWFZ05ASMUcTY90f4QmBPuD05?=
 =?us-ascii?Q?F6w6zE8x78tkiCW+8QlMxMUFWPt2Gl6jMyP9IztELcEHYRqaYJ7YnlH9grat?=
 =?us-ascii?Q?RrJ09bh/wqumQqO0AP92KJ7kXNaBTaubRr1frDLgQgWkjzhTWJq/H/3EzCuH?=
 =?us-ascii?Q?3n3I8Pz9K6QrQGmCw7UBLiBDlk69FNXXm1iLG89UP/r921A8nD8ZCne9ZMbg?=
 =?us-ascii?Q?ikH/3UW/yuo8cV7LZczq2qyZCevepPqKMiFurApBYtF93iAGoH9AR6FZp6L8?=
 =?us-ascii?Q?dIlqKim7dxH1SCZaItEkM42MQ99anH5sRbsj6Xkg3IRpjA82QryUFaYClbbf?=
 =?us-ascii?Q?sE/5bHDXJ9j3EEcPy28O1f7HP1FGR+Jgz8b7R3T/19hr6mvBA/+53h7MrUNi?=
 =?us-ascii?Q?C/6+hrxDIGbPnAdi58VxME3cxFGviBxwkRpyR9p2km2Z4ueuJ+sZ26l5Ospn?=
 =?us-ascii?Q?jSPfnH2Iq4dWhIZiWeluyho7gkd0f/G1n3g7NfudDb0dp2HVrkfR6lU0zdAb?=
 =?us-ascii?Q?RMJk0OVOUdGx2DbYSSApkplxBwKcpI8qy1KL/l2ObsZB1TFp0ec7C8nGTJUk?=
 =?us-ascii?Q?a+QNu0x7+DXLD5bYA6rOZ8SRorKMSQg1USGH2m/tGsah/2oi9FCLPlexUL3A?=
 =?us-ascii?Q?a46antOI+PQKnzIXn4mKTyJ43VEoE6NowdEXw1A0igN7j/qbRfoUt/xtp+nK?=
 =?us-ascii?Q?3FNTHCLEkhe2rg6TkijJDHMNlyquv4l0uQuRUVCqcLPcnpqUIaiYqNnfpLAq?=
 =?us-ascii?Q?5tW0lKXXO9Y8k9iRQ9Sl5MTyEtD4vQ+zmBQOiVVvOcAZtA4YpIEV8JKToaBg?=
 =?us-ascii?Q?Qw4BTiQSmpRZGKT4/kpvFyLpoe9oruPSQNPTIwkuzNOjiUqqjaZq+4wOUdN4?=
 =?us-ascii?Q?VBL0Q+xSkuQ/q32Ny0UkfNOATB2DhE1xHbfON75fFOCkkxYBZ91MMdvMWWiP?=
 =?us-ascii?Q?GwGhjr63mBH7sjYaZGWpILAyFG4bfRPxxxIHlUoK3T399r32wvbMjGvboagY?=
 =?us-ascii?Q?r2ESQg448zSI+jAErzv3F/Q522/ga0fdHZnb8fcQSRKl9Bq6WEuAZJjodBg/?=
 =?us-ascii?Q?lifPUWdl2abr8WznrrjtgqUajRle3cIC7B886It5fG434oAPmMBHOGfCf1p4?=
 =?us-ascii?Q?foKrmIMvw1HgcIeFJv5/Wq3jtKPkfTzQ2I50SO16U3YmrQPXguWuUKxkCqs6?=
 =?us-ascii?Q?KJ/rsRIbHaulDcsxrS4zD2f3GFC1xyDwmbUa1RtK4tybamHYGF4m/e35p2YC?=
 =?us-ascii?Q?026gC5h6aErAEll/rjdJnh/3ogF3Q34nhO6sZ2jD7AdmzXWYERoh6QMb0vfQ?=
 =?us-ascii?Q?F0JbM+XtYQdFwmc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8bTVpxjxxmB28lbMD1AmQJPyRYP4wEpGdiTuM6lYqxZhjZy22N/cNqnzU9Oa?=
 =?us-ascii?Q?ilO/j7wCkNVdeUxkwY+Ym51im7bvqQMmVo2/bum98t7WqOhU+3PueQ8csmpp?=
 =?us-ascii?Q?JaNYH3I6+gzZ+pV1EP9O3Qp448jsmLFjJKcvm7XrI7jcCnTcP+Yw6k4cO3lf?=
 =?us-ascii?Q?yPlD4RGG5J0uuUnK/ZQ96YZfjoX3jKQ+Y3aKvNrcm5qAVlgSRQyjP9nfUr1C?=
 =?us-ascii?Q?0on/xMc98x853FZT+hDufqpfm17w/gUlhrfWsrB0E8gX29zOo2P8M72EurZN?=
 =?us-ascii?Q?0AzGgCsVg+sMV4Q1mRN1SibQMv/e43hhCBIF2LStIIEV2XC72YUBZplqgrjl?=
 =?us-ascii?Q?fqWMFgIkFcnquH4L4cw914/zT9RWfMAGKieSpf2iuCxYUeSHpwEQECna3Tre?=
 =?us-ascii?Q?zBBw1Yvs1H4iOr7559XTrFXapIbZL4jD83qYAnUuQI83KlJd1M1B1WkLjRvI?=
 =?us-ascii?Q?R9uEiwzGynk0ODimH4UeCLJtJiZQIWiT2unq60g+1wH6E7Bsie+6vrXFEHtT?=
 =?us-ascii?Q?1uMwsMw7y7PpX8ST8IGxW7Re0fdZpqbS/EdoD3Mgf1QZKHk5X9pbl8hhRc9k?=
 =?us-ascii?Q?85+EseHpLF4NpYnqHpzedqH5YTb5rPwxXZgfvSfNDuH6ZpUharuFry7LHHdn?=
 =?us-ascii?Q?fJwGLZxgPXvRJAlQ8j4iyfVrYm8bAa24CKOHn2y6FFlm/GDzBKrpPwZPWasd?=
 =?us-ascii?Q?L1QYPUlrrubS95gAtaas4Pk42A0zhgOtB464k37RB5SrCrVWaSryP5wSxQDY?=
 =?us-ascii?Q?WaeFxj3FfYevQMg+iHCfU/1R1pG66WU/ugUlq1N5R+fMCySTPJOnBIcb7oKL?=
 =?us-ascii?Q?6/P0y+1zSc8p6eFy35wyKHu6cWXdOvB5ti6u3+w0B2G81SJEgmmFuVS/96M9?=
 =?us-ascii?Q?C57sK4YXz4hWzduzOowUgAmjExb19aooantUgJwyc2Ak/c0snxt8DcTA1FhQ?=
 =?us-ascii?Q?CnLi90RSbgW9K+YIun8q5Du6RQhl0vDnuXZnSuUy+1E6g99OcSpOm0yq5AaD?=
 =?us-ascii?Q?+bItPBd/zimOmKJ7QgAnW0rPYuBGo6cDoM/x22bTKHnM5yorBzdvYyMU/8he?=
 =?us-ascii?Q?udRAjBimDTaeW422fSJOrfw/UhIJq0N7MGZjmUpKfnqUoxotqUXrQVLL/ibY?=
 =?us-ascii?Q?bSemRh+/LpojxvagkpyEY+jE/xcXvfzDDZIs9e261CK7iFUWMMcLSg2ERnn8?=
 =?us-ascii?Q?5XpzHCtBZeA/mj6wTdv0t+BbAY1OmkOMd5GvbzaB4XQhtXhATBqVqJTZjhnE?=
 =?us-ascii?Q?CCFtkhnZJLErmajiQC8355nKFhN4ZrihIPRsiNaG4sJePzrbIO2WrVY7Pc4G?=
 =?us-ascii?Q?Wezucoj4olVB/Cz7WMRQzpmvA1WpUO8SAmzS8ZIbrZ1kfZjS5Sw7BHAEs66K?=
 =?us-ascii?Q?Qc+V9+yfS2VlfpWin+8n2Nzl+HpgujKO31a+U7GQgruVytdm3mvsUHVuLZKb?=
 =?us-ascii?Q?QBSYZjc1l2N3t7a1E1A63DSVd4BEtPjuOzxiBZtL7RCx6V1Mv/yRXfLSdlPS?=
 =?us-ascii?Q?OWla4PcRjyYwlSaEBQu87EEI+t6ji8d+LCyhkM2vpmXqbEwM2lBrTPaxQE6k?=
 =?us-ascii?Q?bGGzwdrBE0+HZm5ijj4daQ2Vo7Wc8KmpwfFKx6EUWZyw4laxNnf3JSErhkBb?=
 =?us-ascii?Q?dRFN3bdGbIVv1koi5+oOKrs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7063e4-f449-4b77-5512-08ddfb2315a1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:26.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4Bg3DdDBJPxkzXX/gDDyDQ+KqYkJ1+7VBVmfkeHmM/Ujy9l1ksAcEgMcLm90bSviaCGmsYr4+jpwI4Yrs5p5YsCidLrFm48oBqdiHH8QQJSr8t66eqQBM5+gV2H4mC7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10255

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 5d730b488d46..52920a6bf592 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "renesas,r8a774e1";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -297,19 +298,19 @@ pcie_bus_clk: pcie_bus {
 
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
-				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a57_0>, <&a57_1>, <&a57_2>, <&a57_3>;
 	};
 
@@ -327,7 +328,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2997,10 +2997,10 @@ map1 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
-- 
2.43.0


