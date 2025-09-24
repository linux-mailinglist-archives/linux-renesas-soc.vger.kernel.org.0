Return-Path: <linux-renesas-soc+bounces-22287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CADBAB9833E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA6B2E5C6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1854C3C01;
	Wed, 24 Sep 2025 04:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="My1uj9au"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38D28F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688265; cv=fail; b=VF1n46e53vPHIJuOIuIlxpUemlZdFQ9NslCOmm6ZvngyJQuQAdERzmxG9Y/lhIeRqRtUIiTNIikpiU7o/9KW60NmoscoP1QUCHWer4TWcQct4qHDeQQXiN9UdapVYI7YzwcPByVzl2Fw31Mpt3C6LMYsidOYVemuOkpAQDRDNkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688265; c=relaxed/simple;
	bh=AE3hnJYMj1PIlDvua1OdlqtSWU4+Ypc/uVJjNGnV6Xk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ip4jTD/3HfofzATEC7KV5TSSKS7p402iBJtnJ90nOmTIIAxLuwSxIj1YqXnw+GPomf44DSIVL+uUgZmKyv5Jd1T6XnCwLYxdkmP4NSfxbrQ0BujixcjXynN+Nx8y1DlOYE9tcgUfxqYneiyIejfizg9Y7ONvNuA4WNycmyJIw3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=My1uj9au; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZp0TGUf+f17VulGjnBfriJ5hUCC7K3etRHBCOeTsHeY0HT1rfLBZPSIPG1F31L0NI2GDECMMg363y7UypYuSuHoPWnATVhCubJdCK3IfDsa50uMTRs77xXk7IPi+Iyjb0UTq7c6pwPA9WNqH0lBwAg9L2vDvKzsLEn4lIk+ZXLeOvpOF6hO5ClD6yasFZU+6Mcq0/buyQomvoMAuogQFaY7gEpmZSBhUEZgmhBjQS53FfqO5oJiA3Zz76Mtpgk+oiou7SM1/RhYEa3kzQBZNPpDWNXdquYwS8+PCJYYiUayyEMtaWE/nbYsnHk+9d86zfTtCgKGRRB0zgcjkKDyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfR3Rxq/yH3elFylAJJpeWLW36ZTo9Pq/0jc06KhqXY=;
 b=PZPe/dGwQUqKX+iQTJb+rJUDwPaa29M0RUVaN4kRU2r2kpg/Y7FFjA0k0X7AgwMUOtWalewPzDim8LUQ7ztKy3UFFYMN/aaMPW1grQQ3nFsv3VE1D+c1tPKdZsXWl8hnFUVFKw310HXcem5exKBPquT/w1JWrQLLeKkqzDRi3sXAZWX11PCoHETtNztacU9QwkN0O1My2uiiYfRRh9JZriw+wSp94PsmaSeGdXYpAMjXk8Rb+ZM8ubAqwIsty+LaamqfD64qmc/PC7W3xtCim4UJu4KOUZ9cZFbzlhpeyzsaOJ5CCKMkWN7k86+kmuGNNVweUYm4tX+n5NjXZsNZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfR3Rxq/yH3elFylAJJpeWLW36ZTo9Pq/0jc06KhqXY=;
 b=My1uj9auyzIB3uwiy73/aSvPSHr66OQeuFVkt+7iyOaJPtm9wQQMa3vk696hT4pyiEo5jKkL9yBau2QqeivZx9n8ttCOXBg5WKdYyFWaTKICeTmn/fswvz2xjK6+zl4A7tAhWdC9nEZQaeDVMHU8puk0TBtXyy+Pz0iHVw3hXSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:01 +0000
Message-ID: <87y0q48oaj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/26] arm64: dts: renesas: r8a77980: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:00 +0000
X-ClientProxiedBy: TY4PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: a11bccf8-29e0-453e-eed9-08ddfb232a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0D7dNPbj4glZs2QOYrSP4USEvyeegeWMbL8dlhaGi4F4cHz283UMIGBn/OQZ?=
 =?us-ascii?Q?FBjeIFyWkmDxx9e96MT0/DWEevzAPcYmqqj6Bj3MaDIWZAcWsmGHoEfDLZtV?=
 =?us-ascii?Q?cl5CjxqgWWjVAj7F/fbIFCdQB7fjKTh8iLfWlaekVrSIueioQLpmRT2Tb7Fx?=
 =?us-ascii?Q?sbP5i3HdflXdPuMueR++YTGq+el7ysMrwQEe33TAN3ELTFUnKOOnK0DkyFOI?=
 =?us-ascii?Q?WZXgMT8lX1zMByK7iKrOyZQvwrwY3E3MZffOeDn/YKw0Q2UD4DmNuv6yz0Ka?=
 =?us-ascii?Q?rBKeQArZMbe3Sy5c1nXqrb++pZspH3yk/yuZnPyUMmbZmctwbm0iMyYkQVm+?=
 =?us-ascii?Q?WTZztZVNMUmLSJlYjcQ1q6h0IW3bp9/z87UEuiAmAMdE2mQY7WLlguWgqy8F?=
 =?us-ascii?Q?6UG/DM9xiZ6mvWeORE50NuF0FeYP9b4tjaDhXM29PT8+FrRShnPTlEMJCB+w?=
 =?us-ascii?Q?H92BTBlS3S5ANEsOmFgKl4TCDVQAEWBFqiiD8PH1bAU67GotDQIAtnj5tpHF?=
 =?us-ascii?Q?spGBhCdn5BWq4BWDRg+FxWjzlKYxHV8OzpCaUpmp1FxBz1AAsN30YvUdXQkL?=
 =?us-ascii?Q?/39zYSPD//7ks5rycjdxtabapoutiuJACPnd938xT6ObhiEb/zJujUfDDqof?=
 =?us-ascii?Q?uG3vbNhIxmCo03RjdjDCexh/eTHXNypwRgFIMeQVFyUZRRHtKEQuuJgSf8Xv?=
 =?us-ascii?Q?zrxQnQiEoBVybWdBmoO2uf2IV4JcaHRlR/ojKsF3a2Jf9a0TgH4A7B4pT5qJ?=
 =?us-ascii?Q?MD9NIwovB8qXoDX9xpjGdW2+QmX3kdHdel/ZzWItUxeo0Zzos1ZV/Qxu3RoD?=
 =?us-ascii?Q?kovzFFfjYIo1A5peEOPCfNr5Y31617MezlFgI3ILGo2lTfP9O3RyKZTQhOt5?=
 =?us-ascii?Q?k+y2OrmxK+mL0M/zUprqJRxoqZsVNa8b4LorTBeErMKpg4/DTNFwB72m5J8N?=
 =?us-ascii?Q?tnv+krOk09DtBFscMCcx3AsJcteZ4eoK+5xR/ETAyXJ+Cigmsd/ZQO9m4i8M?=
 =?us-ascii?Q?ReTylbJwZLmyPMi3Vjiu3DqwW6iTKrm7HXcWhjKm4rPoiyoYEDVIxpNnXYgW?=
 =?us-ascii?Q?rfb2rcMbnJ4GruHtDh4M8D+mkb94i0bbFPe/wFEdSn6lQAWN0IKORbJ9UEut?=
 =?us-ascii?Q?8k8FcxNQ7KgHyYf4XUHSXmrC3uMAZnD0mpdyWfoVSHX3jzuD08UsYQJsCJEK?=
 =?us-ascii?Q?Ytie3+cd9+FOHHuuPCyQbkTy9knLedGPVMgtKMU+czs5JaU56lExEWEBcMjz?=
 =?us-ascii?Q?kgSIJ1RLOg/eielnwnN205kfYtGLe7oyIBjWVSITUfb+hR3Xr1IOca/MK21s?=
 =?us-ascii?Q?fuYKkfqg6o+D26rv9LHs/8tskOrFlr+KP8f1ubouhaWV/9slvyF2H5LrZema?=
 =?us-ascii?Q?sMSdnPveigqkhX1REmW/Vt/4Ojwg/sBrzG0J/QK0S5DRwtTQvc5IinGHTTG7?=
 =?us-ascii?Q?r2b8+DP03D/QTO5gvOr7zDiieGKZYzi4x8H2lHL+MJPCtSr6tqdRGNlPPRFm?=
 =?us-ascii?Q?Tn7IQsNB8KWLIh4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XzHgr7IZnqV2sfs52G8kxl1Ei45z/nDN0foQL/L8xfCGXH0PZyqLiHKsOQDy?=
 =?us-ascii?Q?Y93w0p4F5BfJpKLgBA3bY6qPT9hwBoQ8njbdTYfv2TN7Dv5+vWYO3zYlb6B5?=
 =?us-ascii?Q?Qx9YBNDUIrWx+YQjLJ1bYpRNvSEz5c3T07nM1H5KB/hJhI6rG06+7XT3C+PJ?=
 =?us-ascii?Q?skj5cQVORxj2mlkxYQQrFQD/jN6p7M1p0HO6zAansJp1PADPNXvOnEJgMmf4?=
 =?us-ascii?Q?ih3gTohsbJ3/ccBOL33Yl62BuaB6CL/9rZ3bMojaOpgc8X1D+XWek5M7bqju?=
 =?us-ascii?Q?5Kghyr8beEQaLrH4iUYcsoM17lEIwVuNKuPzNoiKGvQiRlyxZZugqk+qQjxe?=
 =?us-ascii?Q?mA0FkIIFrIL/32WNtwWZwuong+4E7oUSpZQjrdbkyxUhLbSZuuo1w2O+axgI?=
 =?us-ascii?Q?LUVBKwXLyxgcO+Ym8dotGVusHlucFTPEx1biaFqnf9YGvJ4kLRq4USaBhb3d?=
 =?us-ascii?Q?FrQr3y7EHCoLGaqbieqzz+glPI+ugJ8CDy3qUalUNUucz3NGbEuQB6d5Us6E?=
 =?us-ascii?Q?+6dmRnCNltU0knNCAy5WGEzB5r+VndRemC9AqouQHaduoDteVlePV8vPmeae?=
 =?us-ascii?Q?xYuKQ9xPZRvvXoJdqyyGk5lYB0/gG021fD0iLbkbJTDyF16oC4oYkg+99O6q?=
 =?us-ascii?Q?3YrIcX/0qo+41cg0ZFC51vNNc1U3yJOdwqcR1WHJ4acWQniLsQm5GKQEDcNA?=
 =?us-ascii?Q?EdaJFb0THrQjXRuElophEMrz2Xg6Zq3RHLdgT8IvouFL7uUXvxhUno00fuNu?=
 =?us-ascii?Q?n6tavRiY9LY3zAE8gGj17hOQm3cc4ZaicWqmszz4fkYovP0YznhGPo6swGUq?=
 =?us-ascii?Q?IHwN8UqjobZMcna3g5/2buzjlpW0t0h49vi2cBDpvmLwdvoaNPo3U75pOAvC?=
 =?us-ascii?Q?kyN0U0YHuezscyKl4bsuFnxj58SjgKk5ayUDHQ2e+VMc4ODT5FEl7wrdUHvu?=
 =?us-ascii?Q?jfMc8tu3/4+Pc+Aqi4qiiGP+jJWxCFwJJB0kHJgwagm3RS4xIi+COMv1N7k6?=
 =?us-ascii?Q?iv4rRn7SotILMBR2WutN23SssFeduF+DQmLa6JFeR+yE7dr6FaQ8pYbK+iEB?=
 =?us-ascii?Q?d1WcfUu98qw34lElopus9ylW/DO/YaS6mNW72krg6b2j6ITpPXcKowY/4goQ?=
 =?us-ascii?Q?1sdCqf4on98mOr+B142PGqlQ2469rVRC8wht//MacnagKdUxpYCA0oCfkPyY?=
 =?us-ascii?Q?vxobEAgSRSHNx4vtoQhamokbKaxFnO0WXf7QzcaWn9/pKLGIYCmazU9nsrIS?=
 =?us-ascii?Q?CMnT7pazaO3k5STs1UR9s+SYxbitpksPhCL/2MoDscSvki9psYUhdCG2+ZY2?=
 =?us-ascii?Q?fHen3Xa1lsV8SRK4Rn7LxrBBcfKM3j7GpcMzN9a0V3d+wK2YuuJpPjx4PVAH?=
 =?us-ascii?Q?b06e0JPupoM01ELC4DLz2c5/MagttPzqAjZPNieAh0TdtFvl8j2jmEy8t4oT?=
 =?us-ascii?Q?go9SsV7w1SyzPnnEdzdjX13yEF0/dpvI4DEft3LNvPYoNoCsy5HXOESy4q02?=
 =?us-ascii?Q?USC3iiAmquKYbwfMZInvgjm4Ke/GaKFf2wiU1ms7DzgJuAFDC+1LK2QAiGAu?=
 =?us-ascii?Q?nwYo/VKKiuU+DGI5ni/vHlyXsB9FzoP5r4+KVFpP0qF+fwys0SkNgO6rx4/t?=
 =?us-ascii?Q?to25YwWibLWEJP8snbDuc2U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11bccf8-29e0-453e-eed9-08ddfb232a4c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:00.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWhv0ujtF+XFnsnnXhVuL1RE1G41Ssl5HxhLZxFcTJ0ekD8vleNvaqXmXO58DBUCBSfGhKtJr/LR/k6KuEgIIhhoMeJc+W5HLdc+2NKyd1V1X+NrBpfe7tB+kMOd4fW1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 964aa14f3e65..8cd7f68d026b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -15,6 +15,7 @@ / {
 	compatible = "renesas,r8a77980";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/* External CAN clock - to be overridden by boards that provide it */
 	can_clk: can {
@@ -100,10 +101,10 @@ pcie_bus_clk: pcie_bus {
 
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
 
@@ -121,7 +122,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -1631,14 +1631,10 @@ sensor2-critical {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
-				       IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
-				       IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
-				       IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
-				       IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 };
-- 
2.43.0


