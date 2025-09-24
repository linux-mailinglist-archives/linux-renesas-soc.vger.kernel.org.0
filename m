Return-Path: <linux-renesas-soc+bounces-22282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B31B9832B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085EE4C2B02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F2528F4;
	Wed, 24 Sep 2025 04:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UZXjHpif"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C3A3C01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688235; cv=fail; b=PgLyEdDJgSz88Tp1bHdTPdcXoaV1Yf1DyjKWu+onmk6k3NYOCZ0e1h5OFmxNA7bVZXTIVka/4HVCDy9kuTkmIeBHKD5NZ4ykM9+dF9o1Tfmrz2kLMN7dKjsVhPvXMg4FK+1cc5kn4VwAHxxcXauiM/u04EaHNV8w3LpfyPH9Unc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688235; c=relaxed/simple;
	bh=i2Md9d5hoTAwgN585MN89tnVckH1sv2+vu4UD9HCkDg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MN1otfK3K760M55hXkERn+vBZ047nQsHfs36uJ2IgFebNtFx8H03FQe/RROU85ofvsY8yZ8uu0Nx1JMatNnER6jLvyoY7c1AwftFqLbNeF6dHpw2tMxTc09EA4+9Z5RsTdI8NYgozH656pEt84xLKJbvnKl5yuxCWfmc6BxjYVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UZXjHpif; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGsjwCkEbO1B5k3bi22s9/n0ipWqv5ujQSCLSxU4y2HdTm9BeUjIyGukc1Hds5ZGQGsAQiV7zFoBWmc/nY5Q+0EsxLx0dcElomYQw9DjYz3fP3V1EZNSQfdhHvaWet1rw4Y+Bfg3GJy8yI3TEvDUkecHcpsx2XVUNu1jbdlYOP1Vxi6rgttHvHmBU5JPrxYoqWmWurNR4qbuJfX6EZY68c9JUyZtjIc1dbB/5DYcarz66o/Yhxwt6zmB50nx4JZOFa+J+P2p2uhBuBGwk0M1pQ8rEIvaTAD5gVJCKB5S0ciZosxECBdL+L0a/AT53vH+Xz/EESR/5AnOXPfKLTtCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm5di9daBBrgFo/lXkLyJV46lsMmaIxdIjNC29/ebRM=;
 b=N9DaV9RTBBGadJxk+NMkbZCanK872Wxcwt9c1xavFrTOPNMCuxKulCtw2gnvshcI7pFDvCB9t29Zr1uegOmbu9q72Y8ybsgQhl5vgXqfrc7VPNR7PlluT/puquxB6fGP0wlxe3YvZh2ls/x3QXZm3j8D55Uvqgql6K8xsOLmlw73k2K/wymEFM1DMrb9e+gWPAg3d505UaKS4lOBGiKUFd6NJujd2yVTx6Jbe6QKjC+IjTglkS8dRzSLpwLoGHZS876/9eogTle8jdzUIpQurna83ogUiTMNARjANhT4K/CP6GZIjDYJbWtN86eRJ/somOiLqfml0a+B+musoWSzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm5di9daBBrgFo/lXkLyJV46lsMmaIxdIjNC29/ebRM=;
 b=UZXjHpifCbqFkTsLTYCU16imNiahBqFnRoC+CbATdM4yY+4kNWpkLw7JJxWwy5B+EgRX5PoYEJ9QS4F+DdfpajCscE1fc1vu93OY+IPOAa6oxVRJI5CoazVNBTE1iEYXi+BuFRLExzmaePfNgzzyGOL6rd8h4mzhLGA41xyWOk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10255.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:31 +0000
Message-ID: <875xd8a2vs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/26] arm64: dts: renesas: r8a77951: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:31 +0000
X-ClientProxiedBy: TY4P286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10255:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1a248a-9bd5-4932-11f4-08ddfb2318c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gEIzYNMjPN3a6mgdxss1Vh0QXAptRhrN0wIw+bkyho8yjorRBeCGba9zrXzn?=
 =?us-ascii?Q?CgcOmcWInCKspHVggbgRFWEjDrk5RcvJQG1ZccyGAsJQHtxGlK+MaAHWt4PO?=
 =?us-ascii?Q?z9IU11b+8u3z0xrkIV+JSSk1YvMj0sYJQcCMCD5IYlVMLCWHBSnjYbbac3YA?=
 =?us-ascii?Q?5JyeSVxLhN3867mxejU9yoe4Av3krrKnwPev3Z/U7hns9tyTopSHJj/6l9Nc?=
 =?us-ascii?Q?S2mTfeH0rOw+aurYxKiFhDOhNTLM2VRIX08865UXXuEDZuW22mXB24zZ4E1F?=
 =?us-ascii?Q?qoFxPoz/f+evYbccyK25+VejbTxxznxp4CQFHv0nq8FP2J7ET3XbvWQ7oMEb?=
 =?us-ascii?Q?Olp4zUO/TjCJ2Mi56UduXWC+gRPLBraBZeLHv9Fe6XiwEAJ9x8OJRKJbt+FS?=
 =?us-ascii?Q?xyMxOsvtJdyAozeNDy4Kixj+eYRtSTuQm3/TN9dk2jwS0WUSrYopPJzOZs74?=
 =?us-ascii?Q?eIn+4ODryfiEeFXFAR/iOHPoB00zelwLDyymBfWqCvBbFZBHcrivGCsf/clz?=
 =?us-ascii?Q?hB5D/wPlk0wdlXVUvprvob45dORo/7o3lxBMugK7omrdRpjLodB40Rz3ATVL?=
 =?us-ascii?Q?kkfJZKmdPMXK9jI4Md1bdRoxPDcGuft1fVXpwQG6ru0eRjFT0hvW14fip1O3?=
 =?us-ascii?Q?58XweMOr15Rrs0T539PIE7VVy52jDQmVsCRhQbvZlKLO+8Xud/yv0IlUdwrm?=
 =?us-ascii?Q?EJdzaLlZrthT0E7jgOgv/LOD2NUY9ZLWvZ0Bw2CvUMG45s3VWsM7ec2ad/dz?=
 =?us-ascii?Q?M4uWFMgZd2MjM866oMAILE46/fGbK61oMXkg4KNpZJod3d+aREvpz6HgAJQk?=
 =?us-ascii?Q?+OX+Tdpn/0MPBFsLOZKhSd0+csWivqk/dwbjLT+BVAY90BjvIhR8PeL2LtBT?=
 =?us-ascii?Q?P1JO4M4I+XZRgm5IOBEhuHSK1foqIMpJ6qpmUh/a6heUIEwcRqOTf4uSuR1J?=
 =?us-ascii?Q?BKdplmhIe+tgBkX5wHH9DKYcAb5nURCju+uVe9fsw9XRglfSQX7rho4ICvFz?=
 =?us-ascii?Q?eSZ2WDKo5dCK1IcsuPkf4DqNBhl8mdVmUHQrY71wH7kHPwfGSEUhZ10v0CXp?=
 =?us-ascii?Q?G+BDoirDxbBEppxqbnQX0IFl7dVUAbNZSmluyZHJJpKOFwEeocxV4N3Y5v9n?=
 =?us-ascii?Q?Cbz9hKWiTfYsJ2jSUGj/f0taNgnEkYVgL/kKn3opQUTL695XREMFzCQxlfjT?=
 =?us-ascii?Q?NuxnpUm7OOAEKnn2CIxjbe5SXJMzbrfveaxFP51rNaa2ZD/IjBCHhyjJWrZb?=
 =?us-ascii?Q?CY/VVh5cAS6sE8T9XqrTDE7r0vmjQiXDEJAo4UPe38CG85B+BqOs3pli6q+6?=
 =?us-ascii?Q?ER0o21d2QTAvWRJTQ63kcr2mjcwIWhHcT97Uq8by4zfmYZMNPcwXNZjNBlCd?=
 =?us-ascii?Q?surTGyemPl5DKBEbLkiYAFiY/9T+SRq9OIrqSQAJo2d47kGSDtSAdPm4GWPR?=
 =?us-ascii?Q?FOYFNsQcrW1V7uz7govqYZ3/ah0IGRhF/gE/cRq5WTU+tfyV6iLSDh20OOzX?=
 =?us-ascii?Q?pWGTvvucCxbSnE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aZsGqH8s7sxlEHpjBN2qvYD7VsNmzvFQvENOb5e0O/evypwoSIkUb6kPIiqi?=
 =?us-ascii?Q?/q1F/1PYSiAVHLSdRn/6pE54RRWPwMrcnJ8FDvzKxTJPF9acmFWS8Fu6+lqP?=
 =?us-ascii?Q?uO4CATuAvC0gw145QJbc7oeQO7Tm/eetCPxNat6O/0CiOq+upZwlnHg3dyhU?=
 =?us-ascii?Q?lrqrCoHDdW/G27arBTXtPgslI9PE3uJTJLdVJ9kF99jQzqXmnWPK7Y/lybg9?=
 =?us-ascii?Q?XMRNN0dERPowBNI8biLWNtDhsBtoC6PcX31GWfOTVewmFr2gJAVg7dJEjo/n?=
 =?us-ascii?Q?4kFKXnQhQlB7tGu1/nNErPmCfIKRXpVOwfGILpGwNL1BFoETzCNV318RNTtt?=
 =?us-ascii?Q?+kJUZeW7HUxmuz6+hq+LdU0NBtMEL9LJYoxwLK7Mx9a61Ye+q2Dnyz4IT9Ui?=
 =?us-ascii?Q?83eSOetFuPoXSaGO5tM3IiHNNHkxb4KwYBJQdX6gE4bzVPG/wr/lhcY2raaM?=
 =?us-ascii?Q?82cPj4N4UqRpaZcrBfHI3MjfRxLCFUBOGBnE7N0oU6PM+UvOS+wb1SzY+e8M?=
 =?us-ascii?Q?UTh55NSip6qjNMBs0q+rn9cYaMD+1+B/+kAxYsQohYKrZ79yIIEtyvOQA5xA?=
 =?us-ascii?Q?3tLraplCo1FBQca+2tnFW+qQ1omNye6TDQWmFOXPFjLDg2yKhFW+AB1O/9nP?=
 =?us-ascii?Q?9mdqntYUxllujVayKd9Tb7UK2/f2LqZLtpOt+5kTGahTcIKLbBI4p8kHNRHL?=
 =?us-ascii?Q?7BkiRxOUbEfd6pqjtcjlvCDVqg8QEurtl/wSW3oTQ1aVmOa7f8j0stfX5VZk?=
 =?us-ascii?Q?UoEQvVJ3SZCQ9sKXQw/pkuEEhv2Vk0g4Sd3AqssS9nqgDLNDX4BwkyhxR+/L?=
 =?us-ascii?Q?3OKoNPTpnhRg245URDx0vkwubHv2z0g/8olnDWdD6Awq3yti4YNesRbmyQlW?=
 =?us-ascii?Q?v0UcrXQmx//86ykIS5CYUF1QNk9GHXp6fAr1Ps/nyI4rzPnqjKp3NKRx2wPH?=
 =?us-ascii?Q?biPHH8KOi/FaWDhVKwW9Ic+ayrHnArJXcyK14deq/2wYmdf9kzAG+iMPOfFm?=
 =?us-ascii?Q?V45nVWkIieU9FCJEVof4WU6MjMb/6zJgRQXPmtKAtTj4sFYtniOearT4Mhjl?=
 =?us-ascii?Q?XWs1MdQdG6ayGC1MGyObHyM8lvT05uRbWNRDnqG2i/ku7HAA9Y74XxHclNeo?=
 =?us-ascii?Q?fQPIzxXDE5YNofRmvdGeB+ISQmJFrB4Fe2AgzjFTHmqrKs6cOxVshSrmMzUG?=
 =?us-ascii?Q?O25rHuESQlJOLlOkSUqcARa9BUcnmDpnKT+KJdoltfZfuXxD/E6+wGKTSs7e?=
 =?us-ascii?Q?38dyeUsb84kXXtU7tjClEDB8tHn+Nk25aVaRJgtdkJAukWtD8KpEe0cQwfBT?=
 =?us-ascii?Q?AuSFdveFhzTCyRDR1EuBX2yMkoupUYtWrZsew1FVoh/ymlQgV+CJHM9w4Xt1?=
 =?us-ascii?Q?Z0dpkq0l027Rtz/j9uNfclzQJ+YPuyacJeQDOwbpgyBETbHbdpLH+nEU8S6D?=
 =?us-ascii?Q?dmuYZdT+vEv64VlzVlq5cag4jzbZpkXX8ZXaIeATKWomwfnLXFrVZjY/lBlx?=
 =?us-ascii?Q?tGbveR5Xu/BCKUGlASRJrqCi7TxJWBhmmkFUGEgRjqn1CYP0+DOWQkdz0nhW?=
 =?us-ascii?Q?UFZM59fsVWQwwOA+cbZU38VSFk9MXVG9SmJcgg7Phb5b8E9QDS13GFpQ7Q+H?=
 =?us-ascii?Q?mUvT/cb9SExN0T8gCT5WXVs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1a248a-9bd5-4932-11f4-08ddfb2318c4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:31.5644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZcVYgLYeOiSGI9Dl6hjArVq7mHDQ9rwpXnCGdXCvoI7UuCc2PDecdv8jnP1BuefcyhjA+d3ateLwhGTQbsx5oNO9PJTkqKwJvrYn/8In/C9jR+jtbddgPC4kzcT4qLB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10255

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index c389ebc7e6ce..799067550f07 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -18,6 +18,7 @@ / {
 	compatible = "renesas,r8a7795";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -312,10 +313,10 @@ pcie_bus_clk: pcie_bus {
 
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
 		interrupt-affinity = <&a53_0>,
 				     <&a53_1>,
 				     <&a53_2>,
@@ -324,10 +325,10 @@ pmu_a53 {
 
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
 		interrupt-affinity = <&a57_0>,
 				     <&a57_1>,
 				     <&a57_2>,
@@ -348,7 +349,6 @@ scif_clk: scif {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -3476,10 +3476,10 @@ map1 {
 
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


