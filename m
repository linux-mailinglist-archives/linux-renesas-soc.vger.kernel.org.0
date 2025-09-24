Return-Path: <linux-renesas-soc+bounces-22280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA8CB98329
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6491E2E5C41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13AF2AD25;
	Wed, 24 Sep 2025 04:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HFJECZFz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C733C01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688225; cv=fail; b=p/3WAy0FBdgcCwD6x3prShu7Jfz6t14a9pmDjgRzn4/6QxXmN3O3mNYlCJoNOaP4tKv893M1FLSsru047rt5b9/u/iGNaFhl8mUkcG+zQC7apjtKCPYy/Zu2qwdHngqtpiuE+mcJ+g+ufiksTUEboyTnGpEjpmFiYw8cH9jIU8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688225; c=relaxed/simple;
	bh=hO/26aQSnNOXQu4YeE394abpl2xzth654kIaz10XQE4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=T/UQOLza2PQNAH5PRk6WjyIinfejsVisNj8vN41KvCylMNoFrB/uBdHTt4opZanZYTLY6yzLH67zXaVx64C7nRY7P/Bs2/Hveu3H5wSiWsCP4DFIkKqEum0NsGjIt+0x4k/F729IsQFpIAmS9Y9/JjlbC1FyRrCwzf/ZnbzM3jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HFJECZFz; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5ut4WjoNTRIFHf2b5bq0SNJZ0sFzxQiGPSmgkkEqdVDlMZTufXAEk+7qWV6qEGuqJPI3TpH5JdmQY02R1zNgv+TPNBDOjb8tx8dCMduq2XKXTCEa/4EjVRqSjmDup3ejrAPDVUJ2furzAlhrA82/d9ALE33INqukViNcReQ7F2pbWqF8ZP9py9ZmhaO3ebo3Hz2F/s8z3BRs8hg3mFjL+B4cx1kfJkWJiiuNbI4HOqX0/8c0y+QlMj4UJOt7iCVfUwqicbH2PyjV8Gtg9mojxCu9QCimi/lGGwKlR/0HSmgCqM9v+2wypjNvZCvOemH4L6Py7ZzMTOPFa9dvZLUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5Wj3rsbEVjIWMHy4m9iuaBg9EycakgVDeQFtTKQ1VQ=;
 b=XkR9ZvukI1Izt/eS9tEh+9dNLrjqrkG62tI3iX6Y0McCApdk52jMPhnYEnppBOKrmOUBBuKVn/c49ofqhhOzgDvvc8YSsWQgGTU9l6aAWKUL+6t6MFscj9dLAgXpFBCEiQwKHtXwU9Cvb9RNCGMrCsEOwU8H8uhqZxfMmHhUm30Sf4ZOIT6MbCnLLvHEYjoFq8l/VPtDiWGrmJyRyUJk5TsiEqy9stbRAJks7pDjQdMHstw1TP+xXY8K4wc1uc+NM7tGsnjrLOF7ema2my69cWXZndgkZY74pXU+rwpzYLWm3EOc3Ch8yTjmHzAXjmickaLlg30xEjU51SiB1KBykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5Wj3rsbEVjIWMHy4m9iuaBg9EycakgVDeQFtTKQ1VQ=;
 b=HFJECZFzIhz4og2de2nFr0Rne59zsIzxc9VbuvqsX3uXE6jrIrP6J73B9Ul6IntkyQFSVP5LcYRTt2YcnKCNAE4lpnp8pfiSrhGCuHjlV5CTkLHYlPyioC+Ck2z/K0VcQyL6TjhzKSP7vHGzCq2kbSf1GGk1yqVoaPY27DRCtTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10255.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:20 +0000
Message-ID: <878qi4a2w4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/26] arm64: dts: renesas: r8a774c0: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:20 +0000
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10255:EE_
X-MS-Office365-Filtering-Correlation-Id: 2130cf51-c318-401b-c3ee-08ddfb23120b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U4Y2mlJnxnOuE2VzOXnvxT4qQ6lmctqIj1MIL7g2VSB1apOVGSpkbJO++39l?=
 =?us-ascii?Q?BJNYQCCucgohXMZKvaX0Lbb6SOsIbua0FMCnxifLhOE/hYWzHiE3zbHcFZV5?=
 =?us-ascii?Q?6A1f+V7I8RrIMuX1Ql5mdyBd8dgWvfqp7uGbG+4pLQ3X9/T7kG8VVK2WlJ+i?=
 =?us-ascii?Q?2QKvFfbsNWw0HpJNlaWb+jj9fX4NWwxZHxhmfl7TkAtUZvIe+9oIahAlu0hZ?=
 =?us-ascii?Q?mDExJ9QDnV+J5lVmGETwc8zeOpr1f9rkWyG8Cv0zfkWwJ4PZvb4Ut+yveSad?=
 =?us-ascii?Q?+ND2LTGNFudtPoew/nfooRT3VWhFa91I1o0OtGeJMxleAYDoxphV89FZn8a9?=
 =?us-ascii?Q?ivuj4HTZhH3ZA+hUOuhJv9N8B3BaBYJ65qSFMwJrdLaMZv1A9Tr3axSaT/q2?=
 =?us-ascii?Q?DK6E1cCK/WGVPPxPQ+RKLlsPeN9nt7UdboAJ/3Ymnr+tygFpcRUCkTJca5/O?=
 =?us-ascii?Q?RRCJ+wle1yJnXGtUERzw6gpQahs3/dIcRgC7B5sfFOjAleMGhGb8ttdP2SAH?=
 =?us-ascii?Q?S3oZGn6CmNesWgeZyp74qZW/KmNKD+xIf3obPuw5vaAxeaEb/0eWtXZAbeEJ?=
 =?us-ascii?Q?2cDIbtrkQTW4FAd8ZZdPyK0Yi31V8T/5/RI1D8w0DDhF0GwihlAj566AziDQ?=
 =?us-ascii?Q?jg0RF/r+jaiLxKRv7KfRO8bqRaHKKH1qD6yCy/nC2JPcyn+qfSstqzMbsfCw?=
 =?us-ascii?Q?1R6Yu9lbhOGHROkq/DOC4eqU2t27D6a8NPp5jN3oJPElFrz3wLWp97MC1izp?=
 =?us-ascii?Q?TSzG0XFqKBNTPyMRA9yHKwJh587WZEBhWVMNFEAMLphAR4diO+XLfSSKYsH7?=
 =?us-ascii?Q?jWjGhxlA0PelsIP5mEapb9TaPkHk6MgO96P+gl5LDC8gSu+zx4TkOrVuj81i?=
 =?us-ascii?Q?SFTUV76bTZheoaaDKO4h8TwubmialqYVEMbiVQ2OLDY/IOdsZOAMeWx5AUfR?=
 =?us-ascii?Q?UXsm49GcPMdUczEHtqH5g4s0ebI1ONMYk2I1fLODDl2wY6/TRhAoc2uad1E4?=
 =?us-ascii?Q?rGFJvOcvUkZzrSeiENbA9zDdIxXFCoTL07C929uiHB7S2+Z6ilPuKJ6xyY6n?=
 =?us-ascii?Q?LRa/K7iSgMifN9sTPVPrEKH3S7xhwMa8U+k9WLqeTr+2RV/vk0aLYnJmfLgb?=
 =?us-ascii?Q?H6vx2LC3W5KsNqTEpnD2Uag5a7F6PuK13Vu5hF0y8BH3DqHk3waOMquCgBa+?=
 =?us-ascii?Q?vaMwAJJeInppqx/7XGUFAwVjx0zUFX+5z0en9N2L7LCj4IvHSHQ5hPGlQKot?=
 =?us-ascii?Q?a0NEN5n9fLfec5ZkLrZHDghuV4Pzr8UxgknZd/xZGmABQ/iSebJQP0si4Lj5?=
 =?us-ascii?Q?hBEHHCIJtujzPCi8FwII9SYnCy5G/eztdCfmCnNWpgF/E78kGM/xUPvZXCzQ?=
 =?us-ascii?Q?sMooAs0MVGyVwqVRCfcW18oRbXk9JYzh8Dqkaxh85VNmGdUEaWhpbT44Icri?=
 =?us-ascii?Q?5Mc1Gm//dNEJY7ULn5e7Qgsp+vF7On4pbq4vh73Tm0RkOW0qwmXRGOAMTOP9?=
 =?us-ascii?Q?Hw6QlbspWWCpcVY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bVywmDaQC/lqenS4G2TeHfR+m0R7cXxJXE+oh/GKhIHX/NhZCH8a9vkaNBwN?=
 =?us-ascii?Q?BIgQobsmYuPE1Pp/5gLsC8gD7K1Do+YW15e0f1vY1mtDikeGxhEKRh7Znwcz?=
 =?us-ascii?Q?Me7RDx9Ce2ygNiDB+5nzWxmHdJb9Ra/eEgW5e7efeHvG5wGkbOIMD/z4OcwX?=
 =?us-ascii?Q?LcCTkh9Bje1pzGbp204rP5xrrNYIrFy7BLCVSrU11wFEPsTXwdH1jOfsJJTJ?=
 =?us-ascii?Q?szI3ucITUt7AqqMPZY8wceYK9YxO2GZlF0NhPWDPjcLFG27LVpHxB5pnPb16?=
 =?us-ascii?Q?wN65JMCLegykBQtrd+SK7JUSfAZUBCOmaJbSSDE7ce1QQr0/NJAVQClALUqS?=
 =?us-ascii?Q?vDsUDbLYaXuJgdAZba81sjNkh0K+AI19BsSz1yaLd6QAKaooX4jGog7eEtk5?=
 =?us-ascii?Q?NEJd7GQ6vz97LfD/Git9uv/Wnq+qrPNIiJcW3PeLGdiF1tkWtw+o+OZOe9On?=
 =?us-ascii?Q?i3EqsC7rfUxfc3auXNDF6Ty45seC39oDGopjqFwiuYAptbqQk9PMPaJW6Qb0?=
 =?us-ascii?Q?M5IUVjuncaKpFcFRSx1w36zauIzLbWfnhU847RvJK9bit25KVniFk0fkaUpf?=
 =?us-ascii?Q?eMxQOKsICwXr3GdpCdEidi4UCt3N7cKXIt9Nn8hBkO91xdmvO4LOfZemiWVV?=
 =?us-ascii?Q?zH7egXchPLtTmkOb2pty6AVjvaYMz+z+OP8fOE3pZriwkwsHcPDeoYPNgI3U?=
 =?us-ascii?Q?blt5Vc/1+YVyMFE2XYuFRM1ufMU4fBmHv0wXGbpl3eV9/zxz9E5nIiu/Kvty?=
 =?us-ascii?Q?PUbfqxDJLdS2LO2menMYjbTkXruw9z4H82G8Ml2b5tJHgdBUG72+yd0jt0/S?=
 =?us-ascii?Q?FRpn5swVycjOBdokL1+zdm1eLcuYkNQBogjybu6u5WRmHPyAGGrkBQh6bf09?=
 =?us-ascii?Q?QjPrYHnGqYCQRfn70zpkyLEkK0D8KZQeMy8Gb5wMypr0mTcYiww0aEJCnPiy?=
 =?us-ascii?Q?rmq7TKyRfONlfopXxjuaZe81Hbj4bxp4MEiJdapVxFZ3zBkMJ0iu58x2LTrK?=
 =?us-ascii?Q?r74KGsa3eTBlHR288irjf/ddWO3t16dlh9Oj4aUWGXHOaIbTsRfOVcSZBJDd?=
 =?us-ascii?Q?06//V2WazHiYsP7fqJKNIh1GJu+1GPafPu35T3d2ETQ06NGJ7w9F4wngvimI?=
 =?us-ascii?Q?CV7plcKoITzNHSp3e9lU3jgoArcbMPGNC0OqNTPoO1UFWdca2+Rvi621syx7?=
 =?us-ascii?Q?CSrkSjF3lnHpne3YaMFeyHiCWhYSDEPdX42Q26Kfmlp8h3z/oWDLmYPWTugD?=
 =?us-ascii?Q?62bmQ4sWHqzBtlcc85I2S9eMV+wOilIjouWs6X3l6iXf2vTJIXEy/pHYPxEB?=
 =?us-ascii?Q?o3RShKOGxulJb3FSrnu8XvsI2h36qzJKv0BbIaRyY1wdFbBHHeG0MOKWJZua?=
 =?us-ascii?Q?91XoNPPaYjEdqwV7Ece3dUuO5aT+mDfKdMnJlGsXSrrqXgZ5S58tgZHyX0DE?=
 =?us-ascii?Q?olV8p9jsOySnlSrE9L3viXmwcNlPAPNbsVqlv7Hqo83QBUXOHLhbrrBR9X+u?=
 =?us-ascii?Q?jHJtQ0p7jiNKnx2Ri1aaIpNUHrg3BgG2z3nF7h5L1r1bX7x4VcCyfjh6p5Bp?=
 =?us-ascii?Q?IBfRXhI86DjjT36o5JbBXhSJHlE+Gm9yc1lKkOLD4VIn0IwoZ90UWijo2/2B?=
 =?us-ascii?Q?QQp2/GYRmPaMAF/Hy5CIBik=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2130cf51-c318-401b-c3ee-08ddfb23120b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:20.2912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/SoBa34LUXX+UF1caABq8b+qUyTS5GONKNb/0+NoFuWh4px8seuOcIGjwWMMs3mYTOeZaE+E4+bWw2iA2ZAjvQ/s7KD8P3J7TY526dMy4f/IIfq/ZEVpqHta7IKSoLh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10255

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 55df063cb323..3858f4328e96 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a774c0";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -119,8 +120,8 @@ pcie_bus_clk: pcie_bus {
 
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts= <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a53_0>, <&a53_1>;
 	};
 
@@ -138,7 +139,6 @@ scif_clk: scif {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2000,10 +2000,10 @@ target: trip-point1 {
 
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


