Return-Path: <linux-renesas-soc+bounces-22284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC189B98335
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34D977A8836
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0983C01;
	Wed, 24 Sep 2025 04:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RwQKwRaY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7446128F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688248; cv=fail; b=nKZgj+bWxeFchoZKXeMLz8nelceoub/GpFHPVB7Yp3SsPawjX3l3zgXYdabFZCUP6kaVjEiuFIdwJABQNRp+ss1e5Aow4o2WWeQAJ9M1tr3zcbTJg1QodrtuSdpUw69o4E/tPC8ipFNh3J1C4jz8e1pn9HKZwsA295bnQGz5oDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688248; c=relaxed/simple;
	bh=IVAY8D8gaqFhXqvvV9UfxE4FVG8iYoJ1ZVNKf4nPiH4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XunqkkDqfps/QQo9OeU8+9shv2Sf9H4fuvwSKBOELp/NtTc29sbUQgQQ+kqOqTmVevgcfEwNsq8lpKHec+6mPuIWAKTyvqttlyJgy76NRJYrTPNO51kxA9KoSUrdUhYh/7PJS4V17oFIlmwXxbrp92hZe2IhS7TwQBxYbCERXWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RwQKwRaY; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn3hUxxe2MyVpjYAd2ClPXnz7vFJBr5BIbAcM+p+RSubCVtcRRsKaVJglPBkit/NecGZoyqB2wiYzEucK/cUvF2owUP7MPOzgJkkpNtJySqAOfK6mamkjWejWkVx5/6NavvG53niicFaPyW/bVtsVVcLR1MzRj7qAUWoLRpeRAa1Egv+rt4T3ZizPtFr80tyaOy66semLrVaFYOInWaUXZ+4ZECDXO/E276qARzWHnz7kVTHZqFnvYmJadqrl98xtcU8UFnzChJtLEoGOt5ZPcPA1VP/vHnjd444mddesyImBWPTzkxyoCeHRIlEu4GsZKzF6aHwM0aMxQE2L8Cphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4dGfpNK0hIMtAu+vjhSO5z2dg+qzp3pZF27XRmyUgQ=;
 b=Qg9GBj3sJLVyWXil1EYCHx2tWuzDEr5hjoDJW4MpwhfLnF1ih6JFRLRZwtuOUR8mcON8kpZ0uSsDyz+WDEGDpSpujkTuEViiDykaEjWHsanrrSYZofmTnyYJWJt5FMXVZvOaICwLlCCciC/cHX+EAsxs4Y3pfWWqWkleZM3mh+sgxNNrEvsJH1M4oPAU5gaR0Xe4dbm9L9dCG2DOxMDv+HWJGIhc1X0ipYJ2GFNXwVhxZMKSW+lbzl73j8nl0mqFAiyjyLu30agJJcQaNiG67ulkZ6MqWRvtUJIR8kNDJg5VDQx0ITyswFvJnM5gzu3BEjnpCLsi2p6B3nteNGQluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4dGfpNK0hIMtAu+vjhSO5z2dg+qzp3pZF27XRmyUgQ=;
 b=RwQKwRaYp5+CiwfAdfygUUXAdZGxVLuonq7F2lps+HgXMLNx3p7WaVxvYtxJWfM6t90qesxqI6+Rub41wEN3RZ9FxtQM4SEynGFTgmGpAnok893iLCZD/veQsdaL8Wf8F57yoFp6hDE0npLX3AMt/+O85fn+EwZjoomYzAE89AU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:42 +0000
Message-ID: <87348ca2vi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/26] arm64: dts: renesas: r8a77961: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:42 +0000
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: e340cadf-7cea-4245-d023-08ddfb231f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1NAg5OHr+fdqtMyUYkBXgmH0UyuyCSt7NKJD+RJb4247IOY7Li4q7l5yf5TE?=
 =?us-ascii?Q?+28ogMgOp/cHXRMEdT9W1vpjUsj0Ce8KnUU12jxXxMQr5+7oHjgd6vQOSMoh?=
 =?us-ascii?Q?X4ztOrBrd3WCyLKqzyOkG5cR3uGbbcatJadARNHhVwgnqiceO2DbrYQ3/iIY?=
 =?us-ascii?Q?0c5BAP4hhi2/NjEtOGFfSN+BkzZpxE+TcH2DPfGuA0vwr3hBSinyozme7hvb?=
 =?us-ascii?Q?YQYN71jFxwLBbRg0AZv6fFakYGhF65CoFaBkaWUl3p0K5c+oEvHuZiD+XuFW?=
 =?us-ascii?Q?xfA9t0GgDj9iC/5X0Lh/0Mkxq8wmNQ4Pj0oUWHIurp02cOip6zo2v1fi69dB?=
 =?us-ascii?Q?mG4FKNfjuTvS77zOQtJdoiNw+UFmxLxb8lnPjvVc7dmJ8vWP/ryxG987pdVE?=
 =?us-ascii?Q?X0PMCsnGngxeC92k+HojyU0nuvImlV7HxaCpJBt3TjDypf7jdju/mxorV+8X?=
 =?us-ascii?Q?Kkwptc/k+hMwnB3pEXRqHp/HemBhgqh7Qw0pIot/AtJw6613jNQoqNd2pr2j?=
 =?us-ascii?Q?R3IG2L6Cp5cgMHyIu3MbDytXrjOpfONxo4oRRWHxYPFH9nceRnNJWheWOfTO?=
 =?us-ascii?Q?VGGIBZIyf2UNoiNGVpr6HjfOX7tLcC8HeTZlUUALs9Ed7lB1P8S1Z/CT0rGa?=
 =?us-ascii?Q?z9e6DzEdrDwZiqjAtMn91FIRcz8bYpkFJDlyU0ES4EB6cSvmLpaYXWAFdSV1?=
 =?us-ascii?Q?xX1HiHPDAEUt5eRb6xoZJFx/aGCYA0q1nOvY0WoNbiTM6YF+tmiDB7rdA+00?=
 =?us-ascii?Q?/sE3mI8JIJ/+acg5ipiAWw1oaqWb6aK7Vf72fBGLJJSZrz79zBqqjoZWE/ad?=
 =?us-ascii?Q?WTG2o8CZHkSIkdwr9mJOcN2zBvYqgtcdyFRBfpSSQfxoaY2h5ajOFQMC3z0G?=
 =?us-ascii?Q?b9b1jV8kzHow/ZeM67wa1waZzUragkQV/gYbZEjFIFaUJes2dSC+nqDIc5Ws?=
 =?us-ascii?Q?wvT30prunBJEUKQnbM2s2VAjeIzy4riosFbpNFjxNigyYzn+NDhIpV9y48B2?=
 =?us-ascii?Q?DWWfcbgM5/JsQx6cC+CdVu12K3PxitSsuu9Pbi3455/vCqJ0XX/99t/EpM5k?=
 =?us-ascii?Q?FM2CPfmCpEBWhmtsUqzIXm7tKob6ErUuGbPvXZmCKFZ0UUh+lDIh2VqhK8li?=
 =?us-ascii?Q?vKj15iyuLfFO+p7kJAlOd/l8I8Wy74J4LUonjgVyjxsoBwVmg63s7RIaB7NC?=
 =?us-ascii?Q?BF6dpSbDxvJZpqUKq/yuWBKoxrKnNuR3hKaZPVDvpGTaozriXiAEM18BwjhR?=
 =?us-ascii?Q?qHt2jOxlfB1Oh28EHmKPaazjYrIXGwDn6dxV+5rIf2ypEokfZPA0RnKARKUc?=
 =?us-ascii?Q?bhW+D9lzWgjMmKPuf+H9kb6nrKcZYu/f79MLlUZL5pW20PihvtzIJ1nNy6BZ?=
 =?us-ascii?Q?2W4CJGHq+KRLWIlhPpZRZVvwFqb3McFWdqzUudHEPUwEWMDqE8VFIrkO0JT4?=
 =?us-ascii?Q?5+TR+izSGemGFk8ufy9va/3BDh9QWif1MB7FaAq5YNCDpi9lBXqO06vE3E5e?=
 =?us-ascii?Q?wdOFmpowjKqM6aE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S1erJT91Mwh645YWTaQf9JfadIJ59i4v9kGsjJSHLAYvXTYdWfbfVHkjDgSz?=
 =?us-ascii?Q?KMTgtLR+bt0OKHRLAjx/dTl2/7KG2o7c9fGdRncmbxiIQ4fKu6RgGmbJqG4z?=
 =?us-ascii?Q?HfTUmU5F30hkDSyCI7j2ersV2zVD7dgJq0T66d/9sEeQDZlUWnGlBUtJUef+?=
 =?us-ascii?Q?SwP6Y8rkCmdtswro+B+UiHmYo4s+rTRbqC6vLOcHQGZ8uTrlTpV97Tws1jJU?=
 =?us-ascii?Q?6QkBQXDl0a4b4tRNScF1X2HquMlaJr+gL50FzGbKEtlNIFsquNA8YIIkHFg5?=
 =?us-ascii?Q?lomio+wh6tA2IF45iI5g/oVbhC3s0pKyBUTCloHIu6MVD2s5vitV9MKvc25V?=
 =?us-ascii?Q?LJ8rnkgKQqhISWzKGV/F+w/V1lDzRD22gMgvUkthDRGyGTSQKYG8mQoS6T/9?=
 =?us-ascii?Q?C8/0h5AJJU3QKkpNcb+zy214+Hqox1nUaISWiUKXnKiH9yS7VfP/IssDtwP2?=
 =?us-ascii?Q?PqmLHyW6+3IwhpTZc8aRTQHMvke/lh73QzwV/MeqKjskNWMEjw4TM6OPefa1?=
 =?us-ascii?Q?ybIz02HfPm9wmz3gK21uY2AN4aRBeVq1Tt4YlmCl9CudsKr0DJuAyduhRzAA?=
 =?us-ascii?Q?yhkUTovdxcNYNfta02Rnt4PuTs6R1q2xqGtwfR8MGOosBwe1EgrksylSw1oa?=
 =?us-ascii?Q?cSKGtZtSaTQSLL54CmS7TVTVJetIUKmptm6zAFF0KT2SzYFsHV36XIThPGK7?=
 =?us-ascii?Q?BAdv6qsDEpOvS8yoS+wLxwzohe2H30XtfizCxtzoWBB4RTsBMruTAXxrU5AA?=
 =?us-ascii?Q?wrGywc5vCDzxCYaFI6SUm0nh9uCU3kCGG1PD6MU+6GRMgJxuoOe8PDePZFe9?=
 =?us-ascii?Q?WqUjkw1kOF9WJ06MU+gPANFcmXIIyEqRJ5/fiq7fSuJbQFzz6pXLwwfGcIM/?=
 =?us-ascii?Q?JtnKQ0G5m+rI5hagccFT7EWETCp6bfDL0Icj7vE+UH2wZ562q5QEc1E9VLAu?=
 =?us-ascii?Q?bjPfDO8/Fit49PI74Sx+iQ0DJJ7Rxy+/dOKgR2bXNyGMGku4oxUJwzOJ4pBk?=
 =?us-ascii?Q?W6PANOcOehzBNETfAvssSTDJLop0+Rsl08o0mTp7BAYAi9CDfVhNp1P7vLzg?=
 =?us-ascii?Q?tQ8EbaPX6JZYbmCkg1bmhFl+2zYJvfDn0Zl/CJkTc5xiA0ONkaRToUfWES0A?=
 =?us-ascii?Q?6ErYV4h7shPyOajlrjvDNlYmN3q4ROfqK1eGi65d6MWtzV0Sz1+75AR5/BXh?=
 =?us-ascii?Q?zNmTCyU4ku5oqKiWM6QVfUAqPFv1sLV6kQd2WvXFxqNcTq88oyariTmK4oaq?=
 =?us-ascii?Q?Ac7Io8qIxZZNRJIKEE5piLG1eYEBDrMuk3z5xbGx4+5YNje9yqVQmN8otDoy?=
 =?us-ascii?Q?EfttVzjH6NT63vfu2AaOnn5lHKccpvbLF8henhh1AgC5ietOwBF3ahD/gfYX?=
 =?us-ascii?Q?1XtoC/T8SATi5HIYZnahShp92VtKLp1Ux4C90dpwNvqsinsOXDALIeG2ETPe?=
 =?us-ascii?Q?DrTYqIAoGTIYB0bebqHdfRIBCBzYRU25vlhl2H8jEWV2ld+BzkBNPu5QUm8n?=
 =?us-ascii?Q?bk/640FaQDLck464/Gg7t1P49t8anlvRgbKcu28fjTrthAOjCmeBpdnk3N22?=
 =?us-ascii?Q?cgUB3lBEWchO+4pY9e92U6RKP6yr6y2BH/0CXp2iTJUVOkOjIbTDMS/xAzCA?=
 =?us-ascii?Q?sL+6pa8/GKklsWHqHPVnMeo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e340cadf-7cea-4245-d023-08ddfb231f2f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:42.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nadRq2mQMOlCUvMlt3qcemITxA2oArNPs/LzkOB2Ln6lOmsMddhrtsFsNb7IwUU8iaH2Xo/cnKZcIXakq/wgd5nY3K1/p+SJX0fGSa2jaiEuypVDGmIbr63I8MoI8D9v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 1637b534fc68..7940a64a30a3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a77961";
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
@@ -2895,10 +2895,10 @@ sensor3_crit: sensor3-crit {
 
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


