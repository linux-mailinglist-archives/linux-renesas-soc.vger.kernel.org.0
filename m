Return-Path: <linux-renesas-soc+bounces-22289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B197FB98344
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69BBB2E5CA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EE53C01;
	Wed, 24 Sep 2025 04:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CEIUpiiQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C129E28F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688274; cv=fail; b=aA4NZOJc9rmtg6m7ecCPBoVgK9WDkuzkHYwCoBK1xJDhuKwvfh8jdpLZRiF61TRIt/1pehIBGVnCE/iG0jODvkWISBU8IXdhRn0wVMLFFb1VLscqT/lPJH3lK+6/Czb4Lu1b4novS1FXzL5411+Tn15ymwxdDf+WXXA+GU6ugWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688274; c=relaxed/simple;
	bh=bLbWnEpnNm4GT5x0uy137iVR80FKjK7ug5kTG78nXk0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s1YswQFfjaMA7iR/czCr7G+6Fxk1LkN/JYRDCHcTF6JzRBjjdGhwwDWhqajL28EpHUMhVQcXE53MMbEjxniDgEA/vzhAjyy4r/Kfg2akIEtCw7FNXCN1+cXTTbqKU0xrkff72+vNf6kR0jT+5CKTkv6Jv4B0++b5SkAjfL2a8PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CEIUpiiQ; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGpS14LlIAbUHh58wZgNMgNpslOXD5ClV2Vsq9DkmJe+6a5rMiUd8SpXny4zTwIKtXWWwn9N1T8tVQk3EsL0dy/9v9XhT4BVYbwqShq6lbEzvxLDKeaYwyckjD/P4D5CH8DKAYnnt2IvubQ3cqSpIos7aImZyYvMeIxG6CnRPtndG9Fl6hBTKUfoGONarp900O+Mt0w4jgSuKX3oOJ4Nbm4ZWRMmdZ3p1QRJw07lcqVAktaIOyySzlJU/0KufRdUJZublntzgWdSCmR/6yZTVmgHMACSJyWzqCv4cGPWC6NWqGELnbAUiw0swUOiHok960u/rslg05YNL3qZ1SzH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upg10DvUaNEoyVCkg+nDpo/j9hv6VxScZnpJ+CB/Z1c=;
 b=W6JtKjINAOzIMaSJrzin3i+qm+F2ZBqu+l1rsUBDLRTQoLfIpRIzRkSXfefn6oExuR17k1gONTf3XZOR7z/zuXOmIRIVV76iq4v/g4DOrLB+si4DDU2NvTg7V9wWOrhUTwmTxZhBWfmY6Kzw7UZ1jasqQg7s0/Mh/sbZwZtsWsMO9SvtnWHjHWgVjeyN4v40zYeEhBKg3uGiU6AkfYq65Fjqj5L8UnVgAXFKush3Oq/Vnabx3LgOlqB50lVT+On1sZwjX020A+Kkl2olhqVNpgyQuPd0qBKmjLo8eaJfCJ8KDxY4N6TEoQY0mrZt3cE7gA77N+MNwxCmVI3Vz7CMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upg10DvUaNEoyVCkg+nDpo/j9hv6VxScZnpJ+CB/Z1c=;
 b=CEIUpiiQdBgGqCx9OXUXqlUKyjMFG8vKBGk/cWiByJAddbXGXi+JmkuDIOSUttn8KfDr5+VJCaI9Iu0XeSbbBxhjz5PT8M7z0Iwpr8ofIJMTlKYWr2WRWFM6NIEiIQS7Ef1zqJsMsiPDelARyK5topiKP6y4D5wj9/CtOJpmd8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:10 +0000
Message-ID: <87v7l88oa9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/26] arm64: dts: renesas: r8a77995: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:10 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb0536e-322c-4cad-52af-08ddfb23302a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2nWaTErN2xcqJMPKpPdDCh+7qdAltVki0JuQr8rV5XtuwW9Lk4yDW/idVhQH?=
 =?us-ascii?Q?uXw7Oy3kYO72PyFRqYlf0V6B54pbMgfXPyXrSr+vdTZ5sN7Xke4NzxX3LR3r?=
 =?us-ascii?Q?Wjc99OdlN9fBp5EVn58+pjofHFpDaaSNWDrsGIUsUX3wenu3pEwVPDxd4Nop?=
 =?us-ascii?Q?Xckb8A2LRS9bVAgyQgMn0RKP80TrfEJD0gVQBxZodM2LQJKLEZyUeh+dGGg/?=
 =?us-ascii?Q?p3jtFYOFshkb6iP0JC9ez9ibQo/9nuz6E+XIjdD+D0FyKmC65ZuYtbApPz73?=
 =?us-ascii?Q?qYg2NLWUVblZxFai0S0r9+5qP28cEM4b/76jeoXjTHyQ6MddNcL5q6HiESrx?=
 =?us-ascii?Q?MZb6SkLUD2pTkarS9KgiZeF8VWzle+kHrKUYKjnoDRlcCt9femRjtUFHP4K/?=
 =?us-ascii?Q?LbIrt7s6GfnHdJ8c6gQq2DBx3Yx6l8K3hEZy27FE8w96Y6/igN1H/xjAy7uW?=
 =?us-ascii?Q?+wl82wW6xkbPq7eaRXg4MBE4bEncanIoMQyll6uvbaxCD5FWxMw/0VE5AFiS?=
 =?us-ascii?Q?mkWBw2fhTkpcePQcYqXAazlmpXCXfvT49vQEsgFrL+kIzyyFPbgBLbb/AOBb?=
 =?us-ascii?Q?gD9GL4yp52kLPhr8X4ROtDOyem3T8xB5ApsxYmrufS69xRnSkkjz+D+Z+/2R?=
 =?us-ascii?Q?p9ffwNEVW5dMdv2Zg0WoPPyt0yxITO8bUbmlsYTRKoHOYDhLwrHNnpRl/wBq?=
 =?us-ascii?Q?yen4aAHPs8ifNFrpejT4ph0U0DVAiJ6oPN8q0rYqYIbxhkoVJLDRaYxQgVin?=
 =?us-ascii?Q?K7E2rjDHKfzP5ctDJcj/nZj8TCXAWwzoqfnB/tg7hcyCfSlUB5NlYgmO+emN?=
 =?us-ascii?Q?IP0AxrLtig9+mSNuHG5/q9PekWiBYcHVGpazGkXVObG4IX9GUWhrCmixCRPz?=
 =?us-ascii?Q?HFBdZ6H53Mh0FHv6T/fqA5/p+PMDc1SAAsWB1TB96i3FIzfPZ4Fa6/8SFffS?=
 =?us-ascii?Q?ph6gOT9RrkkYUgjhLwxF3FaQDJa+FbGEVB6wmh9RzQH7XYsPjThdWarNG+Ko?=
 =?us-ascii?Q?cojTE47UDnLq/uEMVXR8ZL/HZxKv5PgK+RKWezE8vWBETYY4GCLzDeq1kYN0?=
 =?us-ascii?Q?Uqxyo5sBiTtrjnszXulkrNxwZqIJGcFf5AhRHvMvIA2edxDhAU/Alw6H9Byb?=
 =?us-ascii?Q?7S58ZEBo9OUCoto9+7H/uXqIVjhlJLM1PKKqQK+tzPrsG7VzaHyPa8s+3DvV?=
 =?us-ascii?Q?KGd4fKUorfHip+8r+5MCycT8YCsDx4TUFRKPksMcInZHPpX1Wy+pVwrlmCw4?=
 =?us-ascii?Q?XONyh/Guq/vJ7gWKTat5gWUa/4rO2m8NaB+14Se3+cPwdFUvttEvojSAApaB?=
 =?us-ascii?Q?SUGRCfvFqj7nb+Kn4UmqX58oZDaSpYUKN4yy1HF02jIIiRkZN67DO/BUBeCU?=
 =?us-ascii?Q?jEixHcxJOQnrsqWzkJlfwckkeQ+aRco2DdiovA4MeRakgPxq8wdEGN6xo0iu?=
 =?us-ascii?Q?IvrU+TfycDbBg8T8LQ8WBfTZ3ULAI8IrE1+SSlX9XZqwmhZ+jgbC77Bw/b3y?=
 =?us-ascii?Q?9/r1M0VO0tQXyWU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?14rnxJEPVIwSqHuiemT4LNCEP5ur9KJKyfjGJv/Id8AhfjQ+vIpVvvC0VReS?=
 =?us-ascii?Q?SgVjSKU3J9Tvg5szrqdTewzfxveLkXdK8VXn7pSQ4RWYS1ukntv15AEpvcyu?=
 =?us-ascii?Q?5pGI6qi4COaiDMVY5kXYArmmpYy+PCn88tmMr95cUTLZkj6rpwgWWHhXyqw7?=
 =?us-ascii?Q?D/yZT5hMwCesZn1Sv0IDx0pSJW6pZU20/rqR+LYwgFre31XztnnQAyiAqdCN?=
 =?us-ascii?Q?SyovAUklhJ+MqqcbobXpqXB3p74UEs5DvaJG51eWdm8+0Qg2GnUKbIG/nNDD?=
 =?us-ascii?Q?idekvhHjtLREq0GsknMMybNbubh0TJmhBd2IKaprszlS6XsQYoJ7fF/txV9k?=
 =?us-ascii?Q?mCMNZzYk0S5y0XJksG7wLWFeJM1qw0UNPsCL8Hep/3lB2IwahiKWLRzRQdzG?=
 =?us-ascii?Q?pTbCrTZgDuf5rWLos1D16MLUo+KGzHUqQpqllvwAjD4Z8xRaMRChTR1Jburb?=
 =?us-ascii?Q?3PZ2pkmKpOsQk6jj8EjBPLN1TU90OwEqKB5H2jh/Nv/t4ASiIY+JuT/Ne5db?=
 =?us-ascii?Q?kDK8zbayThYwkVXTe01mAnhSPohjgdM5pviCtD0myDDKsJCuhGJFwedntLGv?=
 =?us-ascii?Q?Li4N5p+pcaBovlAHcnZ+X0lvQI9M2rt/wumUUh7EDsP0FDaUx2QygmmZOtj+?=
 =?us-ascii?Q?Ai1S7oTzQrX078/VEMhzJKgpXawK3aBT59Jv94KOQyRaWpwsKSanZez9gXVF?=
 =?us-ascii?Q?4HYTPXhBXlDUShKUMO1F/GceqvvVTtSdt6rDq0+y702R20MnKSa9UhxkaobZ?=
 =?us-ascii?Q?Ln9EcdEgkOWf58aCOi3fZBiyMKmEN2TnEE55sxzgCzpj6xTzP04wUmr5t9No?=
 =?us-ascii?Q?0NR4+R2AzGpsf3SSRT8hiPDhpaPUF0uNFd7TxyiT5iRONA7ziMife5gp6RCT?=
 =?us-ascii?Q?d4EfanJ4M+gMX28LxzzhvNzBVQsFClgOD3sztJm2z9ZE8ja/psUz+eBVeTDV?=
 =?us-ascii?Q?IoZbr1vXHVomvzq5BNnMbVLrV1EVyvNIUY0i/dn06G7IMQsW64t6LtbprO8F?=
 =?us-ascii?Q?H1wVLa5GTB1GyoEFsvbF3XRq5G3R2fUpxy1XOKUXlhid7i2yoncyqIo5Iewz?=
 =?us-ascii?Q?X9VCu/CkhxVE66QY4/EXuEVhAOAZxg/tGV58lppbibZ9VFLW1IzTVvxPFk3E?=
 =?us-ascii?Q?Ijx+2+Am+5wLp89QIiQEKeV2r/oPNcutj4VWVeMqtILkbBUYOnolsVZ33DlS?=
 =?us-ascii?Q?qRokfmxduq+XTeeVX0VENjsnZjQhJhccSAC9o7FAXF/5h4efinGyVDUTVRVA?=
 =?us-ascii?Q?Q6l9wb87Rce2je0KjkhDrQkVDbk1nL+1opqDAYVX5IdwrSWMppZyWEYuGPNk?=
 =?us-ascii?Q?PJ5MBGEEyFd0mEJUADa/uY7xm5emAfSOoFeu2PYp/mkFELXHtxHbDEyX0g/K?=
 =?us-ascii?Q?8rZT2+tJJ8eTSoMT3uiyEafqdGo7++/OztV9p9lIrcHp2rlhXwt4glG/Pjlx?=
 =?us-ascii?Q?v2Vc049FZMgxwsNkz6ocu2eIvaNeDSNTFjOOQloTRBkxZ68IMECLYGf3HI9C?=
 =?us-ascii?Q?77GBsAMXVQKfc0CEq7cHfq6sX+Cw5oX3DegL8Pge4cXY42DgCc4EgSECbRbL?=
 =?us-ascii?Q?mftrsnpzte61bukMNZVA0FWzf65o4gFaCfU+WTGR2lnriJZ+r8yD52Adqf9+?=
 =?us-ascii?Q?gzRQQQDT4G/Agxdl04TkP28=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb0536e-322c-4cad-52af-08ddfb23302a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:10.8201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYXasInnq3mn5yq30ZHbpAo30FKM3OhF+hFPYxtIupHAHFDxSmc0bXOtbZFPCv7UpnRnLtHzD7y4Y05KDfzdWMleXwMtn0CN5eJ/mRzybgooZG8gKCXuSwOCV1+Rem/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index b66cd7c90d53..8a0b482dc8e0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "renesas,r8a77995";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -70,7 +71,7 @@ extal_clk: extal {
 
 	pmu_a53 {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	psci {
@@ -86,7 +87,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -1479,10 +1479,10 @@ cpu-crit {
 
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


