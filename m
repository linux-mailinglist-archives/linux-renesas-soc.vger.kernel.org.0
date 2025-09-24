Return-Path: <linux-renesas-soc+bounces-22283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD221B9832C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF2AF18915F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901103C01;
	Wed, 24 Sep 2025 04:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oDE1q8yl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776F628F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688241; cv=fail; b=X3OEiThbQl6hh2sM4F/w/Lf2ndfK5r9izfIXk/D7fxCHFlIRbL9XR1MnqEPox8JdBBcWpTNxVyb0l33Fd57vYKOmSZ4ZYS9P0hEo03ZBas03RlnUODX8XcQynr5RLZEXB/3yry4La6x4dPNEqYXxqsA3nxt7NMNWq7PJMzdE13Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688241; c=relaxed/simple;
	bh=eWCRa78gyM2M4wrhzlwAQCzlN7YV0JCY8nIywrDXcHc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YBIqqtOsbWJ+SO6J3CHdaWcFrXJ/yIsAKSZugrpPiDwPXP7H9K7p0CniuCUDSnbgNFmQDFwd6PtoaAn+dsFFti/w4vVprOxEcd22Jzk6ZY48Dh4zeKuBoE/AjjTW2tgy5G3u7GQl1rB1FxBCF/zVLPL4ewm7vicjUcr4uxckqmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oDE1q8yl; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLz9Y0Gab6AsBHjIn6xsYR0nFukbF/ngIjbyq0fvyOEyACvtnvkXh2Fyoyt2Hg89AOaUuFuo136ON6UIVOz2uFloBO2fmpChjlv8YRkF3mNUW9bDkN/dxphNTAHvFADt6LA3iFeO8KKeoW2Zgp3S6rBYrAQ3ebDWNP40M+VY+2sTwOrcxscx+AMBgGTZabFTz3s7VEVADc9mC8cwezO3BriWrrn8NldAdI6SyS/CUcQFjgk5UEBeNPpNQu6D3SZFhVM5oMIztEpZw/3JmaFDJe77qBjUQrQ2OlUdO2kJtapcID7xNcvOuoToB4jNtNtVhEdsJVthmcYYNhxz91I2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbHFLMSuO9Zyk+C3JO+hBTXqAkw9k3SE0I9BaUXiAOU=;
 b=l/JV+mPqKmNKO6o9nDtEY1FsKfHgsQH/AHlwgnVzeGqWi/hlxo8X5aFxlSpIMRnxIBOSWgVxUQvkL6y76ldRWKXS5xlflYbP1c6vueYaxI3K1TMFCwgj3MzvRJAFdrM2hVCZ3D2TAOsBYdOzu6E/+o88KH50ZUjQEfGnv/QFC9K5ILe0IkpeuvzvN2BTCsOx0yk56j/lZ+24iJWRelJqoXp/9nYutoWWUXaQ+mpJdQmOPYtn98DwUVyA7aDSqmJDqINuONA8161a1S4PBgrVMTBy6dDo2SCSK8Zpx6DAaki22gysagcjqM1R4p95H2ggu6fy0mz+w8+3jHQunyH5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbHFLMSuO9Zyk+C3JO+hBTXqAkw9k3SE0I9BaUXiAOU=;
 b=oDE1q8yl+8EjKen3TjBJSbmbjKuJF7O5Z7QmuyfcP5dCkQQRaqHLDNqvcdSOd9Z42vjl128bw91g0asvBtpEBL3ZG10jXHd0ILrkbrRI87zCplCQzRB3hgEIzrdCQ+3NPxi5tM2s3Q3FF58TqmzpsNnfrJjmB7Mpoxlo2kyKtXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10255.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:37 +0000
Message-ID: <874issa2vn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/26] arm64: dts: renesas: r8a77960: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:37 +0000
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10255:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a066ef-13cb-40c9-b982-08ddfb231c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dlo1JhcSrwm3zHRra6lsviU2CpOQiiQb+UFWfYFSFZw7rEB68DXDVYMyF1ke?=
 =?us-ascii?Q?zmjdYEfejc/QcsinWBKsCCsFflt3mqTNHsjZlsdloJEmdiZmBKClYjWBuoGy?=
 =?us-ascii?Q?QU3AdYjBwoEbsygUhbbKRPq1azpjmiF5qB1qSFfeTIR4VhFtdv1Lc4LrMTxM?=
 =?us-ascii?Q?1xPIqcK9lTvRTjfDH2JTFY0d63bsHjXmHFYLXEr9NQmuAZ8grEWj2ICDuR74?=
 =?us-ascii?Q?4AC3kwl8lmaRwFvJrzKLalxvnP6PaKurgTIiKeWJH8oHSgpxV9dWTyoFlvuy?=
 =?us-ascii?Q?aoLnrYfT4C1+d3MN4c4S9khcqb59kB7duPTKSy8cMQNUVsubfRxCPcD8btZg?=
 =?us-ascii?Q?VQ2mTvYWWh6IlHJvz2yQLd50JcVafcbpS4oSuap3AVEyrfKO2HHwmBt4Skje?=
 =?us-ascii?Q?dvWvVGjo8PB0NAp7nRa2vSzblhY+c9j/RDAgTEzPN+87OUPp3tbKK8a4UhGu?=
 =?us-ascii?Q?kdnwXU9As34kMGnKkfL7NX5HRYJMJLEsmQUUeKqAwC0kB8s3kdSk0GQ8kd4G?=
 =?us-ascii?Q?3d/7FTPtj2p4mWuHO9BHkwWJn9AGhKiV5JCVYAIAFJVsQRGTJdczGOSu4BQA?=
 =?us-ascii?Q?MQLWcIHPKb7PTziC/x28fngozsebA4tGwRNMw0cED0utOB+FFmBdwklSB60A?=
 =?us-ascii?Q?N6P4DT055PQ7HrozFq2059IXy3mnuk918gwuo7RImHw/P6Q25n5p9sc7ioiL?=
 =?us-ascii?Q?NyJpnhucMGoi/7+i1/GH5zOfRwo26MugGGKxHIcCop+n4CoIo5nxFCgyT7E7?=
 =?us-ascii?Q?gv1VqrNu+Sr302PavdZ9WntgyPbgNgFHL/U4JJds1aDz4pCa7e4k3GnHb99X?=
 =?us-ascii?Q?B9AYvDDkTh91FvuLyp6tcL8i3qCCeu09H0v0daTU1BuRWtDEkgI+DewtqRVO?=
 =?us-ascii?Q?FfqqcNs5s8pRvmoT+Uo0ukakrLcRAvqRnnz8/z+4ajr82Ua65zgxf/x2y5Io?=
 =?us-ascii?Q?VG0EGyNxnuop7p/3OtQ6Dczn6Xxqv8qGj/UvvpVUJGzfXYX7+79Ct0kT6CBR?=
 =?us-ascii?Q?CLEnQLl2D88g/1FcxixC74ve7iX1rSlSYXuuECMgeQ3AIMnr+qdvZ6JnecMF?=
 =?us-ascii?Q?gpIbp4+zqDYzRgiFMRKcPlZtdoWvOQfAWgogVTpZriXKNwjd2D3HhxX0xTKR?=
 =?us-ascii?Q?oy/a9MTSCm/F6tMnAwJRZWG7kZZ7ETAXsohMA4+1U+uQl73RVlEwsNkMusvt?=
 =?us-ascii?Q?io3mGDbe/suC9xQntqerNd8HCOeFkchltBOUyp+4NGl6Uil0Q/joLJAVpOQV?=
 =?us-ascii?Q?guOH8jYuIcgEQ/O8FmGxYgst9tfrdhetjI69qZwHm0QJfVMs1MZEG9qL9AEQ?=
 =?us-ascii?Q?vBZE9u6BXh+P4kLvEg1Xek5O5Ezb4J+u5QDUDCm3pQvqdFkycm7NKfar0iUN?=
 =?us-ascii?Q?78L5prChUNw4hkI/FLFVTPXpVST1+k0Ru2VgIjI+vnks0cJEA29vtDloDKpF?=
 =?us-ascii?Q?qhls/1oKsXjtwja9rqnqqNaftj/TlMmCfQyt31EXFDA2h9Ic7aFXIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d0bzkjqxlxl3CdalbMSP2lzuJNEEooGGLh5xTXlnH2nD8GKkRhgLvU9qcNpS?=
 =?us-ascii?Q?18QrKOIFOK5D85LapAJxxoasHm74wLotu6bkoYE6WTCyPbLg/i2Htr7k+uBh?=
 =?us-ascii?Q?Me7g2IXov5JlcZ6QUNGD14gbAV+OKSBqfiiQ9Xl9nPKTX0ToVMWWJhP7AlEP?=
 =?us-ascii?Q?VfRCRo7zOciJeZC5WDbPox7Ay+gN49BNjp02X1dMjGPgw5d4Y8WIh6v9KBSY?=
 =?us-ascii?Q?uLnXXYQlCEFgnoerShDAKD8aIiKBzfaUhzNspiIsgLeOO7CAZR/rjcAyoFAo?=
 =?us-ascii?Q?pyqLdh9zNyq8FfqO3C4PkZ4jiGLz13Ehg0LELIVKrx2FFY0IW0JACo3BcUEg?=
 =?us-ascii?Q?4cOX+J+VZVs6lTN+pFX7CcDt/r9c+5IIPfWAnm2Xr1h94knSXuU1yX6+LQ7x?=
 =?us-ascii?Q?ANHfHIBEyV3BPSoU7qKkGmpKT0SDvJWtuygz+bJtZWz3ztk9/1ZcKdv+dmzU?=
 =?us-ascii?Q?/a7CN6/rQvMxV/4B8A5Jxq/kNgqO8OqPvXoUQEyuw14tFnaB+Kh7Fb41Gpnj?=
 =?us-ascii?Q?6SYXOZjkoGG3ztqmCDUM3yS8yFjm4nO2Y1RjhBRkNCgXbSbhGw6tlR+389Cb?=
 =?us-ascii?Q?xGnZ+5CboaKsDe1AeWZKPi1cnLv2edWezaDzvE8YnEfpJaviPOm4Bo2PSsgs?=
 =?us-ascii?Q?wGLz+SOwalZurL+9HdkyIuIAuV0AMPBQgvVgsbTZMDdg3oFhIc9JBKVraKXb?=
 =?us-ascii?Q?J3biRAFupACQ7OASfX5DbZzvsgTYiFKe+QFI1sXfwU/ZK45cfKsG4pXCPrCw?=
 =?us-ascii?Q?AZ6JM1QxIHXXIahXj+Omr4ADd73KVdPLipjOg4jtWovQQXEmhT2bMXXncTbp?=
 =?us-ascii?Q?E7f2WCWiHC0V0mYJuqsLwOgu2iIuwLuirjyi+mMzxVWC6RF3G3VcO7bWuTrq?=
 =?us-ascii?Q?MfFBWW8e0lOF3EuvgRZjjq/lnIY0V3qWeptuUE1+AngJxSZ8c85KUJbWpwk2?=
 =?us-ascii?Q?W+N0m4jiVEHqTVTVIhpcx90xC6eU1xfXyGUgwGXeAUMTLMNZJtu1EZPRA3Ha?=
 =?us-ascii?Q?wuoXbIySAHBJ7ZmaWOs+U01Yoj5KG6uoQm5pnjVAzBRmY8oGnkUapURxXPbH?=
 =?us-ascii?Q?VEZXFTWGZi/4drGe4p/3tsloq0MXcaIUIj399aVeVZO4mnwYfkibjyAwqllI?=
 =?us-ascii?Q?HBxDhA3hkPPZ2zk3TtyEva3St4mDh8lsdU5+JSl9NB8xya67sd3EiR7OYtpi?=
 =?us-ascii?Q?8xMP+z9pLfavLjrC1BGJuhPYOcC2Viq/mPDMH6C2d53zSaT4PWbkKs1Ot7Wm?=
 =?us-ascii?Q?DgXEzvFdcgiWQhx2GBrkVEPz4xa7VyELmB6Asoru6Qkmn3Mg+R8uE0fUcccb?=
 =?us-ascii?Q?EAQPXOxN/H6MafQ8qzOjkRpsOwgNBncAko9SJ0hMXpfMr4PSV97KSdPYRG4h?=
 =?us-ascii?Q?PtAA/KdwUhJuvFTO37uUxSAnDlOW9yMK2jjBJQTGfMXqHogayc6HW0U9/6g6?=
 =?us-ascii?Q?Wn+N/PGvd+FfOIZk57eKdFQaJUZ9KJe0tLra1Oi6L2L6t7u77ueSLmYrOW7R?=
 =?us-ascii?Q?6Y9u9SA/NN/axfbWp34ctGE5W9mSuSALaxMe7jCLOuAz4tEL8T9gYhw0IITK?=
 =?us-ascii?Q?shbFFhSJimhlnr3s6KYxuAH1eP5zJPYLpsSyai1IpGR06pN2ne5Vd6NMZcjC?=
 =?us-ascii?Q?kDN0EFlgXF/Zc/XhjeRClWI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a066ef-13cb-40c9-b982-08ddfb231c2f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:37.3465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7NRF+fgIXP8odC7aqP80KYIb18WVWQlvrpEjbwJdVQe5NwpJfb8P1CtqKKas8Zmac7Ap2BrmLtTaJ5mO2LTz+/+gVatVKOtH/guHPCtQVEXsfdLJPsXTbgwIJdaQFcC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10255

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 6d039019905d..ff4d01adf4a1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a7796";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -284,17 +285,17 @@ pcie_bus_clk: pcie_bus {
 
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
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a57_0>, <&a57_1>;
 	};
 
@@ -312,7 +313,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -3074,10 +3074,10 @@ sensor3_crit: sensor3-crit {
 
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


