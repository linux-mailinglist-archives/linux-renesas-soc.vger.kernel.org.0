Return-Path: <linux-renesas-soc+bounces-22300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B4B9836C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B85747B4DE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7293C01;
	Wed, 24 Sep 2025 04:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JQ9GLfZn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB528F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688346; cv=fail; b=BJWiHf8ZGUAftqBt/tZ4/SCIkV99Lkp5/H2ctn1orIrFTgsXBWbqQ71ZyTHmo2ynay+xRtHBfj/nHyjYv6b44ONFfXkwlxtYGFJimDjgezMA4JJ/9USBpgvP0BG8GkFwLBCbIQJ6fNgnQEMx1P0XKUWUizxbj4Q7NkP/T4dbJJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688346; c=relaxed/simple;
	bh=EiKrmZ+XtDvUBadvZeB3DAt2GXQirTx8yWJ5bIvPWxQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gLdhwrknmp8YpZWzecV5EYd4MGlP/jR9QLQjTPgNisQVH3p/iGjPl/8iy21mVC4JbCiedI0re1B0L6bVMwkGsT3smU33Wti6JxhzuRWZmzoH7BZf2BbDF2W4Ax6vnebmBEvckT5HOSAAMscozx6aOmg4MJ3VLSMR16iNzW6HBz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JQ9GLfZn; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYn4XzSO2je/Tr0x8/R/nh2CVgpQWoztRrjokxyfCsXjo3xyrvU3PPoYiP6hKo/mvkO7+oipyn3/Jr0jd3jihW/4sjbQqv2SZnsGBYc7iONCcSAphHslhKgeCotOa/86ikuapprqXgmr1BjVZ3+rPTMgxEIjtsKo4ISMuciCgp4/SNXmuFG3L2+7lyHysFmdY9ghLr/WgVGy+Id6hZs4V2eib+XWEzp+1Fe2IWJOgpVshGEN2TKh1bCX5CaqYI/ips4qCg2U12YQAKAskaNE55vFJkWRWaULoxekTrYEjaS9l5BNgloYTRvDZ+oRlAg/bU+Lq6sVOipQ6N1NlQkVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4caZfkpJiqLbIM+GLZdzAo+sXW4pWb0ToLmo65ZI0s=;
 b=sYMuI4NgTD8KLFEF9SkKDadUiJVoXhZCjGmD8/DT72vII/J408wwFRML3/9Y5AsnYESQIx0LdZzbb4RTk0xqU8grKW1eURUmaobZTJ8ZKM79L/q1HPHhtxd8sTEh9GhQzUnsCvWA4aqudN6egPC0jrQtVK4MnJQXRqqnKsMjD2AFCUVNU7UfiBoEKY5DcVusWx84R70wQIROC1Jqfad3faWuOWvRNGeN3jjpg0XrPfKEuX9PwPCfkikTYoeEAI71MoiNFLQFhsdLi9RFiD6BIc4TpqromDCR+jGq9cwk74f8bMO9zvbfzwQLlIUWU9zjb8YiFaejmrdxilCo2CVkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4caZfkpJiqLbIM+GLZdzAo+sXW4pWb0ToLmo65ZI0s=;
 b=JQ9GLfZneVbiEXMhGkqHPBHHQTRAQwmC/cbvR66rBzIMEVcxuiL/679sL1WFmlbWSy2wuBr4Pc98vFjTXg1FjrQGs3zGmyls3ls5g1KMDgPqiAnIXnnxcJYh13EdZlQ/69KSSyJUPTlbZMgXLhOmh7xOMYlfvPljB0T2f4tzQB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8177.jpnprd01.prod.outlook.com
 (2603:1096:604:173::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:20 +0000
Message-ID: <87frcc8o8b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 23/26] arm64: dts: renesas: r9a09g056: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:20 +0000
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b12cfb-12ab-4d23-b742-08ddfb2359cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aRr8irNyU8iaAuC86GqTtbZFFwgdnQXYDeUCDxUuWstho27UZ7IT1jhOIlpo?=
 =?us-ascii?Q?bKXwaV0T3bLqKa6bBweWfu03fUQZQP8fac0o2btP45M5o37iJ7F6g0ObzWQM?=
 =?us-ascii?Q?3aTsar9Nai7PvLttQthGopWiESIBUtYau/mbSqD6S/5SWdQ0APDqXDvSAPF3?=
 =?us-ascii?Q?2p7bxC43uAvNuiBP47wuI9WNsdq1xT7rXVZyvqssZPvz0IQ/8qd9DhxpxkmO?=
 =?us-ascii?Q?n/iuea6OqfW2gGuMNRxilyntdYdogRlnslsIPhECwK1HXAyTDQYNVYYmQyI1?=
 =?us-ascii?Q?EkkFFcnBntHt2hsezOukfM/+xJPOiR74YSXbkf6NRGZDxhN4JqY97xixTQqj?=
 =?us-ascii?Q?I2B/Pabi0VazQIRo2ndMjn4Bwu8BRi6Iw/KP5zqAtZuX2yTr97BKqrEl1FR4?=
 =?us-ascii?Q?pwVvKlZtZakqKjM+aWyN8xffC3sPgu0kMx4hp+QGmvLf/2E6qYlDS+rqbS70?=
 =?us-ascii?Q?bTccgCk+DfUZZvGnUJSecB/xE/NBnyLe2N0GXmunV7ZRuFM69V5+PrBUbk4S?=
 =?us-ascii?Q?ke0NYBhH+LwAh+L/JSF2B2tZPecpbAcCm2Jmr9r8Mcicrz0on/2xesXAELjj?=
 =?us-ascii?Q?KeOptsf6nKG3mw7jpYuCLv1ZX/o9okQpGT2lz3Xn2iCPYty5MfAm2qoioJBl?=
 =?us-ascii?Q?oeSFQzv/hWFEmk8y0kSgRtM0vVjEjPcVV925rSYkRRvDemgrcQ05GNeS0YBg?=
 =?us-ascii?Q?aQ68VxVE43m+ELdoKbf0j5ZpEFNziEOZUsmMwPquXJuTmHXvVf3btohmAEhp?=
 =?us-ascii?Q?Vv4RUKfPA+xabfVzZEL9BQApsrQfjuyxPZ3jD81amWio3SZMu4Iz5eOJEkcn?=
 =?us-ascii?Q?xb2FapLiIbzMDUESf3UOYIWO8F4m0Zisz5aCdo6hnm48KtOUxQZQtsh5365a?=
 =?us-ascii?Q?+b10/lLC3g726LUXVeVm5WDyB5pzBIdcwPpU/1+ILXwOjNE3D8d0fbQ5dpzZ?=
 =?us-ascii?Q?3OHyqrCAZgsU4xb3wtkuW/V79lNc+ggnh79YVLVuWSu6UCRXMSGLUb2sMtK8?=
 =?us-ascii?Q?HqF09uixdNrvQbecq2BMYB5jHnWgPAtM9aZkJqLNgHL/am5IYJZFVNMptUHo?=
 =?us-ascii?Q?GFxZSkquDkUAJz4v+yyxPFUK0oEog54c80/hP2aAuUjCEfUqnl2s4qMuXqwL?=
 =?us-ascii?Q?KQ7Rccc0qhnunLFSVVJee3gyKPbrSzszoYXK3Imq/pw3k1hi1iVhhjYVv4Y7?=
 =?us-ascii?Q?Vq57Z+ZSGw9qdgfKFoMnSoiAKqkbyyPAxw8fGHuVgjJmbPsY2yFcAvq8jD95?=
 =?us-ascii?Q?eLDBKxAL/TbKqP6+Fc5B2N70HvGx4KtaYCZn/1p9VAwrQKwyvPnOb9XNW+3E?=
 =?us-ascii?Q?wEzEcpjqMsoZdh/dGK3pW/Ers7eGH9lSFLloOKQ8fqh/lZ73C1OH2PABD2A8?=
 =?us-ascii?Q?DHmFM4BAPrgAD0CCedV5vpjO8Mvoy/We6ghxAsdhrNQSPvHfOf62uuQZALJB?=
 =?us-ascii?Q?mVx1Nyiu2++/cgZCqvN/0zgsTCo1NpwwsniapzQPrE6YbaxcAtSUduSQJj1D?=
 =?us-ascii?Q?7sF3RD4WTufs5IU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jsaxDQTvh9qXxQXHEfLvpfwMA0fdw7hvjmZUydvfvHrt4SLfl1VbDzEeag9D?=
 =?us-ascii?Q?ut4Cpq8kcl9S/kSEspmIxxWak8qiPmGfKpkhD9lvuEk0CajqJypGti68UpQY?=
 =?us-ascii?Q?WENVDvtD3Ya3CLomggo2bTBAG7iz1coMMKcxpwNZnYGUpuSwQIHR/44C1doo?=
 =?us-ascii?Q?TWC2zojry3xyooLCS0WspculdPzWkf0I0Ir8JLIrRxuFGUrVJWYvdD+ocQjZ?=
 =?us-ascii?Q?dQ/2WJQCMr0UMmw9/5KzmGfvyw1nM6VXFS0fHzXXTkuTkRS1jGQzT0/cB11C?=
 =?us-ascii?Q?OvSdvqsR2pV/r1WpZ8QwI7eStDmiBSdWMfinCSuWk0mRjceD7G6ySNAYR4gw?=
 =?us-ascii?Q?8UPuzylaQ4wve0w2WJFvy3frIaeWNTTVAW5NV4fWE1uKRVaHIxm/DBWs1wro?=
 =?us-ascii?Q?VslenN0LxNcWYZIS1XitBbnzpQzVDylOKv8PQ0UPvNggqdIA30aVVaxFfuyz?=
 =?us-ascii?Q?OsgPM1CHUhaEgCGyd5NNJRS52A/l2tl0PZjn6/d7K8vURTDQf5NhJIOQ4Ucp?=
 =?us-ascii?Q?wr9ys/dwZnuv9vwud+dIBqFWkjJc64vEZ7FlbepvvNWFIeqy9pwaBtltHCH5?=
 =?us-ascii?Q?ccRRgE0s3A4QoETX2Plg2w3Y0ol6vbFNj5AQ9H1IP4D5MBONhz40lhB2OGcL?=
 =?us-ascii?Q?hNC01o/vUD4mraZ/7OIwuhfKN4gUG5m3Pwl/xSCiiSdef0xJ6Z4+hLTg7zxB?=
 =?us-ascii?Q?ryfjNkaXLyukhM3Q6zNOrPmgFFoEfVf57AGF/BsLnr7NQitgN30WkiFvFbLC?=
 =?us-ascii?Q?B9g5PAIL6ns3v38I2qakgbnJ5d52N6L+SoI8n/F8WOe3cn/3QWQSFw3aws5C?=
 =?us-ascii?Q?g1peWNp6gTBWPs2ZHCbUP5Uwag+bWZqkiCldFG3+qyg1iTRtS+2z2Z/OgWj6?=
 =?us-ascii?Q?psqLZyJashf05aX+2uVrykwMMsC8W71aEqK/PSJaKpRYW7fSmioV+TF1KFns?=
 =?us-ascii?Q?NGMbnMcvdUyZ9FD/zrmrTm0X8rTR+5z8aL0LDhRx6sp/WfEpUhXUoHx8TP9F?=
 =?us-ascii?Q?QbOta6deg2DvfoLpDx0D/zzj29TVDs19DCIpLCmRDZwzEWNmfEkaPqW2t5PF?=
 =?us-ascii?Q?V1+Ele+2RvqaLq0TNgUozSUqQz5Yd8BtuV+wa//9aVVopCTVVfU76eCREXD1?=
 =?us-ascii?Q?ryUVtXDtgHKlPrWFQf1u43rvdeCPrjObBfhVvaSmBOapiLCurbksTPJg2eIs?=
 =?us-ascii?Q?8uW0pvKX7FeHxUE/tUFE41ge4iei2covs9JS4BSi5e5tn9qePFD+bJVXY26x?=
 =?us-ascii?Q?XHmL/TN/67rGbmxmPGm/9m6b9vbbC3YoPvE6oMYBx6n0TOhB7VY6oprdjZRH?=
 =?us-ascii?Q?cN90k5CiUbxbfy8745AZlzHLkHDKzb3vJrbU+JCfzYtym4eQRgyjtFlPhImn?=
 =?us-ascii?Q?LLr32poliPpmuizLgKJy579xcZ9/wj4+mEPUO16+GgEcQ3/2On/8A+OWipJu?=
 =?us-ascii?Q?JLBJ7Hidhxj2JdxMJyR9ZqT/WZaRDN6OlMMjs7SbVvUh4GJhjTPC+7g6fPvi?=
 =?us-ascii?Q?cCaYCThbicOv0ojvBexzlupP/EaCTWV4yFBbRojzxIgf6qR5uyhws6LFdR9h?=
 =?us-ascii?Q?rA3nybMmMebSPQaQ3/yWpSOCT5bo2VMoA7IGcT1yXfTsI+18cU8y8cAP1Txy?=
 =?us-ascii?Q?ljXXJY+pGIEeJaeeqGnp/Bg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b12cfb-12ab-4d23-b742-08ddfb2359cb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:20.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 555Gzq0FG/pyHCv7XsRebNoo4NixcfzL3wFZsMQCqCVTmjz+FonVDC1aHOdGKozyNDkPPeIKEA1CMCDSRJ18sEZZRQLRTXCQd9m17dJNBW582L4JG5LjjRHoaSfNorEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8177

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 887110878906..9d540aa4d10b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -30,6 +30,7 @@ / {
 	compatible = "renesas,r9a09g056";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
@@ -173,7 +174,6 @@ rtxin_clk: rtxin-clk {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -961,11 +961,11 @@ stmmac_axi_setup: stmmac-axi-config {
 
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
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
-- 
2.43.0


