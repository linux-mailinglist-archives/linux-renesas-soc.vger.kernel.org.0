Return-Path: <linux-renesas-soc+bounces-22291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA473B9834A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910012E5CDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B54D2AD25;
	Wed, 24 Sep 2025 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HsbX6Hte"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38028F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688284; cv=fail; b=mfKm4+Kp/J7Dl29mAUkkbpAMijcwDF4t8ERDtcmCUQsl4Zb25htGsAurSWkLHIRAYVNNYAK9EAV+E9VqQHLESyRtmD6zdHzqg7Gb9DuB7ajUA/n6A+S3GpCCCNSR+ooMK2Tn9VoGwOIhxxH3T03u6tUXzHmmXEs8g8XyLmIPMgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688284; c=relaxed/simple;
	bh=KtCrCFJC1KQBcyh/UwidaG4l7aV4ftxT0NLwZuZwUYE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=u/y5ZlGwl97lYrtFvIp0nsNSmawGsoicctxfDo0p+h9LJi7nEyxf0RuQxlETBkgUzG+COu/a/a04ocZDENXIwlSaKvpg3Sp/psBcwZKHCCHzhUg3gxpfaccqNY3GWfd7fDTbED7aWxAdCIjQn4Xjq9DKSL5y9ufs5kFe+PD6958=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HsbX6Hte; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGRYgUHJN67pAe+gCjg5x0oEXe20qDdbai6Jdc3USa3Qf2ouEXQxRPDZiUi66kAYwWrVmeSjq2FIULuue8dJe0F81JzraH0OwLTd3Y8i0gmhk58+V07Xwi0j63LgyWcMpps6H4ZkoItKwv23yIxTlJZ07lHi/KLcSRuF7GbqXC8dq61/E8O18cslv6rlZbzW3YJCRPyrQPbNxqUOkzKl5Yjbo+yBDX/6f65GrFRP/qXEhZKKmLydvj0dXVAwjgtpu/UgQZ2+g3rLmlBRDXl6m8DRaCJiXicl1bbI/u1sgN+CH9MZPL/vRKmX18DVGs8k4dr1wEf4Y0k3AFYE0VA7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZC0Jv8kGm/5oi7a4GQiWSqSn3Bc7G9CjN5p8S6JSwg=;
 b=CIfnEXlX2V/IYU2liBv7YrQkaAqmXdqBYLG2H5xjYFw0YzyImmOQ6mVE9FUVcJUKUQvJL0YQv6rwpTqdABsqT+Zcy+DKdZAJQXuHBY5oCFeGZn60N8C7rFnKfw+jdiJqaLllnjVSJWQ7GGBOCyoAh9i0qYTGYEPTszzZ0ydqwQWNXwRIAkrZB8aQk1DNPsulxbsaexTDii5HUb9V0PW68xpHYwRqjw3l9Yp/P6fvpweikYxsp9Y4W1O7LQZclxlsPqaMAzeP7ST6e+GGdkpD6KobzSoRhemBCl7MelDT1q2ReIVKx3bxof0lWg4/oYGwUvj2yXvJTZ8an9q5Hj/NTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZC0Jv8kGm/5oi7a4GQiWSqSn3Bc7G9CjN5p8S6JSwg=;
 b=HsbX6HteAeUGfx4o+a+wz2r5kdRzXgu0LeKn8r4fr+7W2qmL3jwbKTSqS5nWBYC4rb6hb3GDI6A3k/3USCIpA9+ydkUnhVQMgS60GSNRUFtb+wLGjCeaTNmoZnmD1uspL4sSS8mAyMaQ08ysoOhYMi0480Hfc8sT4zIP49LyxGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:20 +0000
Message-ID: <87segc8oa0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/26] arm64: dts: renesas: r8a779f0: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:20 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f25895e-0031-475c-9044-08ddfb2335d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X7kq+dmWKcrq+5meW31eDZuDnokjfOYF5jusZ8iwSjAl9/+vMn1XqJEw0Pez?=
 =?us-ascii?Q?QLpD/93SHaRL3PzB3CkUTZKKGdvQF2DDdDGt5eFr6IHhbpI9cnUYMbZ25kya?=
 =?us-ascii?Q?NNRbAq5rYzj/w08C1xbuFYl8UtwkBnswbRI3li3ulQRL8SqTfaw7GKkaDPeg?=
 =?us-ascii?Q?e87008Z0Z1EKXtrJC/xUSJKQefJPOPAHUSBhctcAODJdhKJ3mn5J8WqNIqL+?=
 =?us-ascii?Q?GKv05OWXPp2JNoL5PN0OAX9ncgbSvcAHSoCpIsF5zPFLenIno4gb+37CCUvC?=
 =?us-ascii?Q?nDskayFgsi8T0e0Wz7r5pLj6Fpeb3CEgjihcCLFvy32H5HFaT4SlgXVDz6fC?=
 =?us-ascii?Q?Cb96DS7HHUrkUF4nBcCgOjZmxCJP5f5HX2FbKNfgUcrtKIVXIF73bbd9QJUK?=
 =?us-ascii?Q?+YKPZ2uAeAsr4nJRf+JtS/P+pNe5hOW7qUkYWZIixxgWpvRhgtCViXVTrvFf?=
 =?us-ascii?Q?CAAS52CQelpLg0yb/igBoNdNP/Vn5rVMGuVlgH/N/gxOkacAnlEebYR+C+pp?=
 =?us-ascii?Q?WXJWZbTMn92tzIcOZNxxxoAZSqSNesLQyFF2z9yd1k4ZlC3Dixh50IxOeIpQ?=
 =?us-ascii?Q?02yPn9yaEROUnxt0vokBXx/ntFjIKYqHk4vZvRoLJYZTjEtY5lb/VsY2yPDU?=
 =?us-ascii?Q?7+jIxUXghgFfT+lYRAlCjttf7qyyvUIpU+/+M6k81NQ7jGDrKioZJfx/IQvo?=
 =?us-ascii?Q?JYAGM8YaHPaVZQ6NIkH+wWhsddSPbA9g0EqwCjP9jepHedWyYPUlbpYOHSu4?=
 =?us-ascii?Q?U9OXYGkRCcZpgM+pakbVCFIxrAGWnrq+KMTh2oKNeOCZk6cEgAbY5mxEbC16?=
 =?us-ascii?Q?bUXVha4EOybger6jbSiS+C5zd3VpAgC2jOd+NP2xlpX8BovzoAE8YaRt1xB5?=
 =?us-ascii?Q?PNH0xRqrbazuE+UwgQiLf56qhnT9xPzEuC0Cd6E0xkXSP/UhMrAWLwky0bTT?=
 =?us-ascii?Q?VF4t8VDJZwKSvWZoZi1miZtlVdNTjQw5pm2AW+prDlGGbHFUUXm0+FGjrcMl?=
 =?us-ascii?Q?KZNnw0wRkB9ku03MPkca1VeMqdoMueDNhlxUdJn0BSTSAcFORb80c8qUpp95?=
 =?us-ascii?Q?oqdPxUKhz+jygpym5hf2ybIpnO2bfEKEJLHjJvMgW2/JBlSh1XHmCAhg7Xgl?=
 =?us-ascii?Q?xb/rk0qAVqzinoghOpeFX6aJXVXytdAw8JyjA9xpzswGIGNqiN1eSYBLE9Ho?=
 =?us-ascii?Q?9sw3fVuRUeGAU0WjOIsBhXZV7ZLDhNqeFmiURwYbronH+J1O+yHiMIwpFytN?=
 =?us-ascii?Q?nl64tsyVTrnTRQ9q7mYZ7fTDGLxXVogZqib/59Fl4Sugibh1Nyn52Zpp0Gms?=
 =?us-ascii?Q?Fl6oyk/fN7tFQNLdT4PCiwrdwklHGXtzUZzQVehfea5zqMBqL/VX2zqTVahS?=
 =?us-ascii?Q?7BVbB+E6sB8M7OtQVShDIUK5pd3KTDGrSmViFn4R1oAwU08+rwqsbDIgAuNJ?=
 =?us-ascii?Q?ZDlWprQ+w+MiEkphinsyjsld/JR6Mb4TgzCWoqei+MwJlql3+qtq6m+TzfJX?=
 =?us-ascii?Q?a2VoV6gSFXmzxJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z4ng+nMfISU0e7NUJ+/34NSxByrOZdAzniZoREJmxb2dS+kre4pYlD2DK7C6?=
 =?us-ascii?Q?PSL9/WU5UuJxs5ploMaUIii3xLYVZRn0VA+Bypx0i7M77xLFCSHrUJl9yBnt?=
 =?us-ascii?Q?z6R9aDsol5T+4qUnYtqSP+1eilOnxzymeYBJVaoyDfgCBD8Gz7JwM0s7/oRE?=
 =?us-ascii?Q?WBAyn7KtEVDAebZoyXQ9nWkrVM7Hxx2ujD7KnYz8Pt2VWVL3sTCzG5jePUap?=
 =?us-ascii?Q?E6e7yyGODdAsQBL5neO97rGBL0tp9sTMGD0mlMmSSJxvMUds2LKZLGg2fCiU?=
 =?us-ascii?Q?lk5//kAGi2aE6gsLRkgnnRXPN+9+MDvCGj1XxLErUHxu8Dm9P+SpnFgOQZrN?=
 =?us-ascii?Q?X017EyN0N50LBnPy8hVp0B/u968ZEDNzKzdlLZBmHkxboT9qN0d7MunmhIzZ?=
 =?us-ascii?Q?GATpbdTDqf5SAbDClo0ntpyKgzg2uXJaxWa4KSwWuSeElYq4ZzAfLkbdYASi?=
 =?us-ascii?Q?wRh4rkbp4fRwNuVaBd0vJ6yWgY0V6OLtmbv673wBHAW17KZ9yce4D+L6+mUk?=
 =?us-ascii?Q?PtNAvF1Q3oGx9UaL1P78oTuc6LN71BVcnncj52yrevwEpSB0aBlEfMHtuaht?=
 =?us-ascii?Q?bPrGeMOIQ1IBeUGk9EkPU3nbtag1zlIpnV3vz7UrG+/T76hiexY5Bv2IJmsF?=
 =?us-ascii?Q?/w854c4Yia54Ogsq0t4vrnwKgEDSg/n2LBb68Y7lHm8F5G4qDbcynmNABbD6?=
 =?us-ascii?Q?qy8AHpCDc/LKBZwVLO9+vmdcjwS0uiV6t7tnF/c+OFvB7ek0RkYMPvxkcKMZ?=
 =?us-ascii?Q?hBjrEYoPuANlk33u7AcAhjVL4Q4D3mBAkJT0V7m2ZgyDhledmCLj87YcPK1x?=
 =?us-ascii?Q?KMgD8useSFWFiUDNpVuJRbhmBdIO9LIxsQM1glJA/gaW/LDbtkSWoH7rJIzF?=
 =?us-ascii?Q?qU6z+PHBFY0WwSt8VKRlOWEFxP92wZ8KzEgo9qhfLET2DqzJVqBfxOiK4J04?=
 =?us-ascii?Q?Tlsm7Rcqr4adOb8AXXLjswQwz+Tj3LXiPHoz7kd/g+fchUNF7EFuKeaK+23P?=
 =?us-ascii?Q?0Mx48t48i1587MiFqWaHrdG7xU/YhXZrho5iwsUaD6+Rrdvd7zogeFnbusNA?=
 =?us-ascii?Q?fjSpOPe7BE6cQ2d2OIqSzpz+dvsDG7KPHwq+I6GAJMCGibodwHDw9kwJeYEC?=
 =?us-ascii?Q?gEUE9AVOdhxXKf02ZoPwV3eid26UFJgEoLSpq3M/+utAmWf/I9PFy7dAHms/?=
 =?us-ascii?Q?Luv0vaYxhGFiu5ntUQvUhaWargxz1N1S8jD0PccdEFZzIPGmAx1dmz6CKZAm?=
 =?us-ascii?Q?FEnKTWfWvgexF3h8F8yJUGJE0sPu5/fIotGFDy58NycXKu/7ncleioNXVXYi?=
 =?us-ascii?Q?dl9RPYrlGV04R8ZaIDMq8pU/UqpNGZUdz5v0Yn44PIl+Ox98CQUWunsUIy3f?=
 =?us-ascii?Q?40xDDhNTgAw168mNMPf7WosOfW738wzhIZlxOHTAZmWRWHjuLbVJHnRQMs1A?=
 =?us-ascii?Q?+91Y3uDToQ6I7wMjSi0mbbrrNG9clOPF7ObBKyyD3yp4A6BQgaZr1k5oenrv?=
 =?us-ascii?Q?gsuBAXL55RHeAZvnE73/ttBtxuck4GLQOIlFw1GWDakZlrw+82jXqvKENX+n?=
 =?us-ascii?Q?JF5muBV/yht0ea0XBhH3HjsIOCTzC7K2T0ufNpgYFHt1dwYzC5cxKtLlV678?=
 =?us-ascii?Q?LVCQM9hK6PjOa+ha7RVR18Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f25895e-0031-475c-9044-08ddfb2335d1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:20.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehdARr3FREOCZaERU1QrxdwwgprdXZ0vjqxKkKNgfHnH90fiU2w3cdwVy5fJYMCZEUzUGnufzMf3gNg/0iadtFc7NdarRxuYTOO+gTWzqXVzUjbtSeRmpD7kacO6tCgC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index b496495c59a6..76a0f85a50f9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a779f0";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	cluster01_opp: opp-table-0 {
 		compatible = "operating-points-v2";
@@ -280,7 +281,7 @@ pcie1_clkref: pcie1-clkref {
 
 	pmu_a55 {
 		compatible = "arm,cortex-a55-pmu";
-		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	psci {
@@ -297,7 +298,6 @@ scif_clk: scif {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -1340,11 +1340,11 @@ sensor3_crit: sensor3-crit {
 
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


