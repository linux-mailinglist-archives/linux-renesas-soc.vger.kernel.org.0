Return-Path: <linux-renesas-soc+bounces-22298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8ADB98363
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508902A5272
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E693C01;
	Wed, 24 Sep 2025 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Mf/nQ3m7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749828F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688336; cv=fail; b=MFaYdqgf9tazpVCtmMV9RT0sQnESX8P7sK0qq9ldwtc0Sx21/Kb+6PIiVx4uPNf6i1Xzf6cFhprzoBSu6JukWI9EG94ctSNpkzEuDD2CU0bnUiwpWphBji0bZKPtgFeC5OZmhY4pjdzZd/XXYOWBheEgZbPOiAyTvIS4RDUQ5kY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688336; c=relaxed/simple;
	bh=Nn4ebXCrJzykv9g+JPFq2FmFld6KgRvQzj2NXySIkMg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XQYlfX4yxGMpCCaNoNQRJQP/fE8oIfFT9A6XC2YdA32dEzb5rOr+RGLn+uZkQm3CYQoWP/Y9VnSfq0Kv5q/J7XzkZsnl2Zu6xfA8LnquaKD7dCFKqfIpAOzsxkAXrvk8/tmLB43B3Tc6ZrWNFjNROBJ0d94XXM2nAQw8pYeY234=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Mf/nQ3m7; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCQxvMC9/Dr5PiW/mGZg9phsZ8v9uYffYjgsEOquRDDao0roD/DcwIE1sYCd76Egbnn9SCF8ztOR+Lf/SiOwBNavrPCumaAszskHbQFsnkNBciQev2EjhcX/kt/+blHLNe9oBWpnCaMwBwqC7WfLKL/PVvpLLvVdEsO7Kv8SrherrxsD2X7GPgimM9lvnE+SFIDPWHVxFep1HaWm//ptBAcb4toq3J6zcyjxJI9br06uTSQa+4w3M+w5+w+X0NNLn8WGYJhGi8VEc+bfc09KpT9mBFHVb0iNz7C5f+uuCM8cTn2CRaZqLfB0Gm0TM85IZj5YiBYrBHvhesjv5RxFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oR/5rna862SbFR523uttDH3t+gHKJLp9H1tKbatWbM=;
 b=GG2ZjEtLWPYsulx6P8mteq0cZrhPMEvivNCrurceBbbY68kUefoZYM/EuuuJFEyOIvL64KmdXcuywtdF0BCEJZlmEKgke5UpQ6rNqXRBlLYfDKET8m/CACWubcFQXlcXgTFz9Rh0uYjuRaFYJlToWEO9EplsmgWF9sJ0KD8qVq2lfGAxyiRxWX2pDjuj7iUi1ipV8j+uZr19I4Rh/DfOqGbFz2nWKt149n9t3YE6CiuBXBBDJkQ4HURzRgGmuuPbZEi7uAnH04LaCTeM+Qp/EfPDUt6Dofa/gBnL4kXhpofcQWE0MzYmUUsSX38zAlw2DKXdhAV+qv8ugV9kZdix/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oR/5rna862SbFR523uttDH3t+gHKJLp9H1tKbatWbM=;
 b=Mf/nQ3m7NaNd98qYi0OsH+UuO9dricO4H9jxNrnI/bjxk4rVDXke2D5QBZgXlq+Zfeg+RMbtEWavVWSTTGuAJpAerkweKGcPOnW3Xp3mVf8m3Fyo5AizTBbn+HNoRJ90RxJWkMcXcPevkeLhCMIOpSTsQte4+jLHqO2GuA4GQBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:32:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:32:12 +0000
Message-ID: <87ikh88o8k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 21/26] arm64: dts: renesas: r9a09g011: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:32:12 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a21748-72bc-41cc-36c5-08ddfb2354dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JwtDwxA5WizwqR6+4RTJoYLXvxQ6g90nO0dk+SViKPSBlcJmaX4Wlo8jgKfz?=
 =?us-ascii?Q?JUYaUAZabtyFR+E1eOINEJeVwtF3skIIvvNwvB5StfvU5dhbfwqDQrC3QdmM?=
 =?us-ascii?Q?nRL5LJZOqd5qstxXm+5DmwcFA6M/nrxp88eJbdTr1SDO0gtEyvC1h4WTKNEh?=
 =?us-ascii?Q?usj9Imk9+9IDAXIMcak7g1PuCm5OLPiNg/0G1yNNxAh2TlHSXDZUnt3C8lkx?=
 =?us-ascii?Q?NdGHpcqz1ycO3U551dLfc7JXCuKS5LcC6SoZRXPsG0VEFNqzyhNyvCz8ez4u?=
 =?us-ascii?Q?suW1hEClLHeC1IaK+faMHsUDskhRhjnKWa5KVUBAiXYsHHlKl5Qh1UBuu0XK?=
 =?us-ascii?Q?PsGkEEPW5E+uAFNKWsbJC54rVqIM8gvW7DTKH7boCnQ1kqAlW97uJ/uezp1P?=
 =?us-ascii?Q?wYjTbOyZN6/ItkZq1dbKO3p8jZKClNLDxgu8YcXXmd3CgdRtaMGPHD++gGKD?=
 =?us-ascii?Q?fBjl/evdWCv6yGdLno5BwUd5u9WtUU3/gxFxt5sOBwSI7RxSgP/7f/W9Orna?=
 =?us-ascii?Q?iwXgPetlV6Mzorflq+VwAddkFhe9BbjMDhwEMBEQsmMTO4fWSkRdCwKwsW+V?=
 =?us-ascii?Q?OlZLLOWvURxf/vzG0HmtsAj4tvixySOsxyZacqgQ0LL5HtPShmnLFYim2GVY?=
 =?us-ascii?Q?fSp1ijZfWsRASzMX4brt2rTyyhPF0f3pNspiOrqtcrO8uEHbn9qNXI9wASKO?=
 =?us-ascii?Q?G0m/VeJsUUSrc0iIF0BsbL4fYRp7HoDjugAI7W7BXy5rczmm2e9ZqYc1YlYy?=
 =?us-ascii?Q?498s2UOLWvJ1y+Z3HJkURfZ26kco+2c4kcbXOY0o6W9obNhoxhY7fPSNqVQT?=
 =?us-ascii?Q?ySsSnFihHDSZsggMHzYwg0ekRpdeGfEyDmCB52kHjUWYlKokUCu6K63OcdYR?=
 =?us-ascii?Q?xaw7E2P+ExW8444i/A+faBeFhsw/8eZL+KrGMwORa2S+WhdBw0VdmV9NCfc4?=
 =?us-ascii?Q?T2lSHlADl4AgYvi9Tr+A/2EbfG5AGh70AN6OZvMmFdKlVdwkfHG1GRsHt4yN?=
 =?us-ascii?Q?mksHUUIWU//s5v7EJ7sOKmK2D1EQDZRK57JXQQBJAwJo3RHklJOaV6Q9hqnI?=
 =?us-ascii?Q?j4Sg/ZWwol80gFQVWmhA/EuZsNe5ibrnVPaIIAsNv7TAkVcIRxKm4XUAqYhG?=
 =?us-ascii?Q?VnruCWQLo0+Q0ksv0wdu2eIi7wHMQ08LPn+vil/c5Je6ZsTcu9MFM5i5f4Kd?=
 =?us-ascii?Q?mdVT2l7EcTALAZWOuz65m/Nqp79khIwzqir/zOyY2LjSTtW8/mahKD4MKBow?=
 =?us-ascii?Q?WeWNf6JO5rOQWMvtw+qRSl2blQ7nKt7z3Xu307brF7I1kn2lrr9o9zhXBSEg?=
 =?us-ascii?Q?ZB7X+tCSR8IyE0MhNtSES5y9cGSS+KzHN3dz5yc3L4QNy8+l3L64EOp+xID9?=
 =?us-ascii?Q?VOlfUr+YqvuqnW3rbcKW9Fon2YaPttzS+kY3/2bl9MUC1NLXwyhrpkPc4jGT?=
 =?us-ascii?Q?TwO9CepVOWa1P4VD5Begy7GNSeczhPTZ4y0qzk/8Olti1pB3Kmb2g8DYGygP?=
 =?us-ascii?Q?DV50cTmNGbnNVAI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4kKDJyRae4PEf7s79BwweQxVANjGRSP0/4xHR96HkqNFrjYe9MvP204YZFu?=
 =?us-ascii?Q?Ttvl64agT/YHZiXbG1cxWC76dHBendX4QuYWHkhcN9ac6WnZG/gQPudOX+Av?=
 =?us-ascii?Q?Ttilf1kYEc2FLrJUXoeGlo22rfm26kfZHh+fMIYIG8B9m/B67TS9fec9xRFp?=
 =?us-ascii?Q?SLzN8Q0QKrTdF5qco9bVrL4XUdI3rqs9a1VxapC2qTJaHxQKvFJfOzge3UN7?=
 =?us-ascii?Q?McyZy1rk8pVHJfKYbV2mWA+yiNONZBn1vfnGIaYlP9AZrKUactPIdSqzsS6G?=
 =?us-ascii?Q?+zTU+aoAoxw3022pNy1jH8AQUHvHs2CxDU+gcVALxFGnN6nDg/aVEb3e6Mze?=
 =?us-ascii?Q?kaxAkc0gxJDABProtx2uYs3QNUGng3EbFLwht1YDqHF08+HJ1OkyPt5cNbzP?=
 =?us-ascii?Q?FZ+IUsx9dfWRXrcrib/FG7eZK873s6YSiliHFZK1MQHotezhS9cEpmlzSJqz?=
 =?us-ascii?Q?Zt8t1J6szyB1TkisllI+BZW6qjjVpW0KjbEr3+D3JG13X9wG6677FNIae+YW?=
 =?us-ascii?Q?wIMBn3RJWTqhHC7/j3+PfY30z+sTfRwURzY7ufLLnRrEXvG5ilDK6bvGBOS7?=
 =?us-ascii?Q?mhGkxf+HBw8/RY5nYBOhIqezNWqQB8xhK7Wt8evgg81T8X6Kw0efBALTDpQ9?=
 =?us-ascii?Q?07r3MdCrATB4A1tXnD6VHx6lHOgns47iwK88lYe3uj7j8HtMBU2uME3OdgwY?=
 =?us-ascii?Q?yruwQkfEFmBCcpTIHklveyvolNpRPPFTWmbYblMCMpiuy/lhSprUyCVrxjfW?=
 =?us-ascii?Q?GnEIG0pAHzd0kYIf5ivqlcV5ZO+3gNpOu0nO/pPrM7W2ECVdpPcSt0EMo4O+?=
 =?us-ascii?Q?ILKEzsSfMO8YEZIDNuyYyBp+vmw+M38VJ5k3NsMr7aQu886cH11A4J++xrEv?=
 =?us-ascii?Q?cwg0g7e8JtGmXI0DAEz7x1TfksG4FUvFiF0C088YJBPDNOHfgp9+IysA7Xt5?=
 =?us-ascii?Q?hjXEcfwONNB6SuuZQOQcIaTahOW3Sv6QlrPMKdk67vmgnx9SA6tvvGm4L0vf?=
 =?us-ascii?Q?JTs6zpyvO2tJNYUK+1i4EoSDRoGl5b8B7QR/gpwHykKu93Avr7F+y8kgnqDe?=
 =?us-ascii?Q?c3D3iLYFYVNrL2JVZZO6NEYInyTMCswZmcyBfpTkjZTITvz1R1xdiPm8xY2r?=
 =?us-ascii?Q?hgbhukt7PxIRbxMJ2Mba9StMvlHTrYRz/gxbQtLKnalkZ7ft9CKT6y/e6VAm?=
 =?us-ascii?Q?zrr93kHlaurbYshOme/mSMGxD+Mz0wv1+9G3Oj92Q5xMrQOuLruojyA2BBWV?=
 =?us-ascii?Q?iMPmsEvAKnZHeEcE2GhyF82MtskG4SMHycu3ieNkjHR+3ejYY+UBKlT7RaH0?=
 =?us-ascii?Q?kxz+rLqaitWl83C03Q4JeOAOeslGzH7r4Ih6TnGl3a87rdY7ZO4/nhszcefO?=
 =?us-ascii?Q?mBcMoBJh0MVfDocE7WCdhnWSaoT0yO/CEQcB0o0kAhmmpCYo+TsU4yQkkz5l?=
 =?us-ascii?Q?Lx6VyUDKPsfE/aOLteaMrp8GWGpzjdxTW2gmMr7pB9BzNHyPz0WN6FCjjy8n?=
 =?us-ascii?Q?GWPh8PGT2uY2uKZA2m5PMghrVCw6/BTr8A+TmBsytbJIq5G1+LlOCupGI1v/?=
 =?us-ascii?Q?iVcYh5eKt4TKSDosoEYQ5f1E/zSU1tHxcy0WxPuAOmAKsa3b+m58WBTP6q9e?=
 =?us-ascii?Q?uYk71N0ZlcVMf+IJBWfwp10=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a21748-72bc-41cc-36c5-08ddfb2354dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:32:12.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YWB/70pvboIHWEBIydDjckZXneVB0YFUP4izxQiuhhYtIhAyeZ4ke6USsmFwt+3UqUMdRgeWhYoTszVr4U0RQilpNhW4Rr938246danCyD5ZMl4EA9aPz5UtJcfOwRj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 9a4cbef704c1..42462c138dd2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "renesas,r9a09g011";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
 	extal_clk: extal {
@@ -50,7 +51,6 @@ L2_CA53: cache-controller-0 {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -368,10 +368,10 @@ pinctrl: pinctrl@b6250000 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 };
-- 
2.43.0


