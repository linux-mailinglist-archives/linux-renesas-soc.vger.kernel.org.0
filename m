Return-Path: <linux-renesas-soc+bounces-22286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A8B9833B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F59B3B0FC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC5F3C01;
	Wed, 24 Sep 2025 04:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kls8OASe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A6B28F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688259; cv=fail; b=kdTRxhgVIqnXtGGqsJrtwnQUKepa5CJUvGb+8DDmFeTpPU09Pf8rntJVAtc+olt2WU4Eiv6rEtbq5lrJt3Pj+0uZCI91Eoe5qPD1lRN+8BZqq9nY78iombTc0avfR6pdn31BbeT1NXh/3ZGnlroF4yRqyi7kkxlHXMZB08In7u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688259; c=relaxed/simple;
	bh=gTRN1h06ZYgYLGnswHw9zXuoVgH7MHMHH3rXA5hpFb8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DJTMGwuyhwTHQ5eEB+TMPL4Dj++PC7LZz2f/XaM/WionXL//kz3dFRoRLwLvmrho9f5Ay2Xb99QDMatLtsvMhu71ANTBbA4rOTUsNZTgMu0O7QL2HZc1Smi2ne1Ro8lATHUQUxQZTeRgML+hg1ak7CdGXXUBdrfBBCRgszzfdrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kls8OASe; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8QwLx60vN3tpoxpcjCu9B4LuroJfT1d+8VebktDhB3REe7qfMl0UuSvziWvpHsf/7qcdkJA8MbIN+Bi2H7Q5DrEfy6W+lb1xNb6HoWUU5b4c8Qfc5f5iP4FOvciJZYmztzd2HPZGnPeejel2k6ir8YDl4Y8FahSw3BZ5a+Ccizuk7fdjeVH/TnkuhLQc0A+JOSkbPp3kwnZX8Y72fxVyqMWNwECImOmL65J6hRrEh4R0eSdAdLfwKgd4z+MZGrJ3j/bwkLFKio3Aj33PpVDn/UMu2lGJGokPsEwq1r/1Y1EfbIQ7RZyoVnqJIO8O6NIVU2KznNp7KNXMLtc6lWRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0QfpfPf7asvBc+GEIGcKtw6Q9wrempgLA/hxHhL6Gc=;
 b=AvVuHbrJDGvaQmvfIpBnQgz1xXxgZDr3SgDTazmvabikxRTcScauif1ZHkEyd3PXX5qUYSxt6nB8wfrJq3DlBMnBjGfyrnGSSCtrUPh2RpcGDd2x1o9b/Ttsd4h+As8BL1yTPKAZYTA12Vd0WPfcypteJSy72j1W2f/iDUt5iQZ0wJB5nKGnH9hypxD3SB4RrIXRsLVfQZ/albETEeqjh4GgMOke5mGajo8FTAHorL3joFkNFYrDNkr0b6UVPaiaSG05SNnT0GcCFwLogFZPoVkaXtWYb1Co98Hz8vdEENDkR6FOwpxv2V3xKEqFG4VKpIIsWzw7T7XOeIOLxmyMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0QfpfPf7asvBc+GEIGcKtw6Q9wrempgLA/hxHhL6Gc=;
 b=kls8OASe5eY9JfHO1OVzYfnwneoMbT2KoeTdmxL8aGFJ3cpnOFqEq24yprMhZS/HYKB8UCMBhLDlzmukZVY4tUHxxmizvwwBJ+LTCstmFcEwkxOmbm0fijJS3XvqEBV95TONnU9S4GtFax9W1ur1xceKOxHJ/UQ3nyVG2FqRLco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:55 +0000
Message-ID: <87zfak8oap.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/26] arm64: dts: renesas: r8a77970: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:55 +0000
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d748b1a-999b-44d0-0e5d-08ddfb23270b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DRYJgpp/uHOW3o0888VY/wcfrD2vq8SxZ3NUFfzPxp6xJna4GqwUIKEvldCF?=
 =?us-ascii?Q?mKO0NvgHlKc5TNMDgzZJlxtgFteo0I+RYcESPqPt/3y1GpZcpRy1I2m5p/Pn?=
 =?us-ascii?Q?a6ooD0TjLm3eJGUc2m94uPeTyFlZR2sd5M2iYpYBTSI4KGrNVwqA6IpOuf3u?=
 =?us-ascii?Q?QEOG7S8SVMFRRHfTLi11++ke0Sox543o2TC42Sx6iVxVbvCrB+OqE3cMHoAC?=
 =?us-ascii?Q?V7dUIhtf6ivuKPBv7yjA6j03wCIs2m6rA1PQouIKB+HcI/OTyTXNW+Q17kE6?=
 =?us-ascii?Q?wU1wmUpGODMud7/3DiWZeaScAutx0jQa6ubaFfJPps0GlYTFgkzqw8Rz/jxU?=
 =?us-ascii?Q?Z2sBLJXmUTPBKB0pu+OqDKjBNuiNUdJ/J56XsNZ2mcKN+fPZWXejMkrZSXiz?=
 =?us-ascii?Q?xvCBpsC88OVe9HRYn73q1NCh9oZV+9oeJfmA3Dq4QL/uSlsr3c1uekwtekZO?=
 =?us-ascii?Q?qajOm9vWf7OIdd+kQrao5hL08UmTWDkNAZ6yhy7PnjQXVCr1vpSWnkvvw3DZ?=
 =?us-ascii?Q?xc0UrkCIqjVdMu20WTwIhpwV0HjDs/n+GCfXBC+q1fR2wQ9rRVVed8b6tG8/?=
 =?us-ascii?Q?RYuKT8oi30Dd03wmi7MfolR95hrLemUz1lDfWydsoq/5Yuf2F3b513kPmtdC?=
 =?us-ascii?Q?q+AYk+rPUML3kw3HCxKASNbtZfvsRzypnIFzgyWo+LqQa5TOw2XlOH3uOZ/s?=
 =?us-ascii?Q?4pkPjLEh3ofmIOdExUu6T96bOks9cYi3MPSFn3Sr0LgIrORnAzYXqPvs3SuE?=
 =?us-ascii?Q?H/Uvykyx9zuCuutHE9+R9uSmGIayN49biw7zAxKbUKqC+eJkGLo86ygfi03u?=
 =?us-ascii?Q?L2b34XN/Dujr7K2jEMlLSmX8V2N2I9Pixm2B85PoYPK9eBleHKz+qiEmBu7E?=
 =?us-ascii?Q?qPSmmO6WWToBfoZtY3YOkKCO8R14/DJxphlw96m39CPD0LOLjP84sdUagCXt?=
 =?us-ascii?Q?oWOdgnul1rpwydp2H4Lu2wrK8DMrqac4NWus891cZNcCI1RArWAEB3JrMwqr?=
 =?us-ascii?Q?BklwaRrAt+z8emZbJvAblLrCK04p47aD4syfmbIBrawM9VX/UwzapzIMcp6D?=
 =?us-ascii?Q?+vaXEkBS0Qi2erAezwJgLbwXecA+pHJy/efN98KMcCf8jgI/Rep58wy30s0x?=
 =?us-ascii?Q?M26zLLiC+tUmiBcxRplJYGwMoopMwvzDpAhYZZJOeTSYPsvqH+ahw/0FUk+W?=
 =?us-ascii?Q?5WURvqGCiA1kD5xUVFqEVF4fnEIy9dfFHKIscZaQ0FaTZRJW6ciBILLp+wlL?=
 =?us-ascii?Q?ivApkCD9+UQN0w5FRCCeGnb0FvV4T/RIjYSfqNqqz45DoLEkhjpQGy9avFyU?=
 =?us-ascii?Q?UnhnrHYEBx+hE8W0MN3omjrkxuN4tH+XBOLyAj28gvrNsxjwvsLwqkBbKKfP?=
 =?us-ascii?Q?EbOOj3/0LRX0qg6WA0+gZ1jzwe8m2FL/POold4dyAwSvMc1FOYIvP2HYqW2A?=
 =?us-ascii?Q?kdGGzNbMgLo889zXBh06mgzFmuTyR5OiJS7qJeVw4cF1fb6ExzZwvCGZZ1r5?=
 =?us-ascii?Q?xEbekHBpG73Mb9w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FF663WJsI7vTfm68qqPJ9R8ah9qHSlStB8cAXLNE3sUztlSLXNKzR9z/zFft?=
 =?us-ascii?Q?40vJ31f1Hhkj5hXtkR7HrHNyrP7A5NGqN0XD82GzxZC1UrSg+oVfsDbW5BRA?=
 =?us-ascii?Q?DPQj5V/XsMqnfcE+QftVQj9fDxFjIIQTVg2V8Ao7Fm0x4pcsV3J5cj0NIXeR?=
 =?us-ascii?Q?TOetqZMM385gY9vwm0LI17AWkAlHjI5J0Ul5lX6u0OPLNvrj9PZ3/O7MbNwm?=
 =?us-ascii?Q?5dTgkEn3P4EJuGs8bZxjZAWMwG+N7VMf623HptnJ9SPalRrs/6pDgGXyg9Tm?=
 =?us-ascii?Q?Swpq9KbT59/fL0SYWX99OPY6jA78HjjTjbrm8zyj6igx9tbSXjvpd3iUr76+?=
 =?us-ascii?Q?FzjcNqACLqaGNUcJ+UG8xyEspMRbIxPmY0qIyhnGkkEeYyLmmZRzg73WuVfZ?=
 =?us-ascii?Q?Zr/wFGb6Ue5p5whpSkbl/0sMWU55bzwU62JkL52B6nhSM2fausAg/bk1tL6L?=
 =?us-ascii?Q?2PfKkmxtms2ZfjutZ83/bL0wr3R3HvZR2ffyclxIBrFx20tlyqrfVEQJD4gA?=
 =?us-ascii?Q?FUzyADIzM+JYZ6fRrCLpD31fqZmDM8mLfd+mOyYJw2l5E6jhA0SNDxDqE0dw?=
 =?us-ascii?Q?rIwj4Is+2kBpCFCYepWvo2f9utV8TZk9BCY2UWO/1paSH7S1RkrJxkR33zIc?=
 =?us-ascii?Q?GGI6QZZA6oepD/pxF+BG1MuWiTjpco3u1GdMu2+Ou5fT3obreJ69uOK1n3Of?=
 =?us-ascii?Q?AsNxKhBir/5YaTgBo0kzQjpdREQ/dYzBZi7Tedk+i2WpZvj1UIHHFzoBBrF/?=
 =?us-ascii?Q?mbdRjPyHwj0W1bIXSH1L/govt49vElrsd4zwwvfzdJXHZac6rHBkX2XVLxyi?=
 =?us-ascii?Q?Xade0q1nBWJCCAv441daPNQE9j8MUvH9p64YaVrp/aT8FSLXcwNJe9itr1Dw?=
 =?us-ascii?Q?BKaxCEV6UkrcZIWX+romTWX541IgwqInWjg54Ig+zkaV1ZT4hTDGV9gzQWF2?=
 =?us-ascii?Q?ScF0RB66oEnd01o5RSa2aoLOXeiLXVTAIsaZ8ukGKQZyax0Hu319gLoaRJeA?=
 =?us-ascii?Q?TpxE0W67gpB+74vAJa/gNgEWfhzE0RQL7FkS46e+zZ4LV4u5jDX5W8LnpTpS?=
 =?us-ascii?Q?J8ZS9ytp08CecR0IVOMjGKZhl/cAYXKoCTlfzaP1Kqyq6uOKBIIEDGWS7xgc?=
 =?us-ascii?Q?u+sV3nQtBoXHi4t86CTfV/F7pgyWL2g8T59zohyCY3UoSDwmfg0leOVZt1ZJ?=
 =?us-ascii?Q?6rKmE4+VZhrUGq1b5k+BjlGPDN3n2yrTlHF24x2/+ogE86E0JRc+O8qV7FKe?=
 =?us-ascii?Q?vnAj7N/cToy3DA2RizpQQ+0bbgn44NJq3s5Zo5r+efQX1EHUcTMuVXiZ99KS?=
 =?us-ascii?Q?DtStNUSOffp7wARoDVPeJD88n1TNWRi8jSJPBjhk1FM/DIg9VsUcbLWdPG/D?=
 =?us-ascii?Q?HF4EdOd+FW6I1nzdK7pyslY42Gx91vf9ZsR5TUc4F5KeeZ/ey9wgZnxf/OEA?=
 =?us-ascii?Q?EDVV9wzRp3MU9v4CwwBI83Paaqg3kgTQrRIM/Jh0XyZczEMXuUAjVHd06ODF?=
 =?us-ascii?Q?Xp6RTB1nuk54yX9GPfAc2YiH72hXsYMZpOS3Z2rjXVOL1ptIGt4evqO0vs20?=
 =?us-ascii?Q?dhopjkr+bH/LIgEX/NK7Ldzl7ZgNHbCl8OrX+WgIiYtpzHzyTqnRMLBKpJjc?=
 =?us-ascii?Q?zE51LpBO777JwVew6z2+W70=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d748b1a-999b-44d0-0e5d-08ddfb23270b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:55.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcJBidKYPdQwew1b3OifbA+WiMfr/E/9U2IRPyfLu92NlDLwT/MA1L+asw58ECZqTjpDMu7OT8x9Ap3zOes1Nprkl6QdWFwt3HDjBf7+auufqIfATevX36wIYQcoZhsb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index e7a5800bf742..4e0caae3c9d2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -15,6 +15,7 @@ / {
 	compatible = "renesas,r8a77970";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/* External CAN clock - to be overridden by boards that provide it */
 	can_clk: can {
@@ -73,8 +74,8 @@ extalr_clk: extalr {
 
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a53_0>, <&a53_1>;
 	};
 
@@ -92,7 +93,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -1227,10 +1227,10 @@ cpu-crit {
 
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
 };
-- 
2.43.0


