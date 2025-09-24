Return-Path: <linux-renesas-soc+bounces-22295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D533B98357
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A8617B070E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7585D3C01;
	Wed, 24 Sep 2025 04:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kXUYZc13"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D87428F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688323; cv=fail; b=CCoIOTEo+QXf4tNi0A3DD1Krv7X8LPAllzgwVI2w2rRpISD1ZZuz2fb1ULOE7ahVCdZHaLTGa4c3y5iKneb72JUqk9CwKXPn/bUl4dxTktngnEQF7i1OonnXOkxi6O6JnPirNRgnbxC5O0wvPyaqbh297o3AiCYyQtyN+VMxx6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688323; c=relaxed/simple;
	bh=qqezQpeHss68+qSxHzKOd5MxujJDCigrE6kuAYIwqKo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s7wvI7J/8dlq0VKtmPPSIUE5Z6xIx3rEh8igg389Ivdiov7uXxKj4jVNt77Y4RwEasN54Zhi4pLvm5h7Fvet4Gf+WNvCMXAo5FZFpvROSkGlR3MUV6GtXBayHnpzJbuCwAay2LqqEV+Pue2JtiG8oyE1W5wmJJ7+u4/Mwf3EDpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kXUYZc13; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I23JTZSSFtr8EmNLGl7ovIQQcXD1T8Q2nqn7kay5+lhzUmi5bNwCJ+fkHIqa8iU76aqORxe8eOCNXaKJ8asJsT8keoE61nfTu+RHcozaH5pgfCO04KeNOSc56uGWebU7+RIGgf01eakBx9iXDdtU/8DHZQnKEpBRnnZ1oK9rB2cD5Wxah2S0e8ladBNYNUDv9cLrP05kkcVpBBl2GKIS6o+5fCgxFIw66S3jR+EnLQBsuklebHVDdXGuWZyXAirjWCkbQa+oLzlLOlKS2tW7Vi+RUzUZFu+k3ZBoF/qT05GVu+T+stJKwSRGHro+pqZ8GHRSeS9u0rnOGcbYE8wRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qM3V4T8DrKgiaJ/HR72beQiNI5taeHjXVJzNdR6dHD8=;
 b=Dd30khVwiMfwFVRnnjJdHm7JNe3akXiOB+aFttpfZHaPSBiQaaWbAwvzS/pGV/+jA9IWvpJL8mry0zOW621zACHDD57WXUd6QIj6VFjE4EdHe2Tlr/Lt7C7baDAybXpWIiCcGRjVuWZrGsn2cxTPgUZcV0KC5fbdi03iWnq0GKrZxtkIvLz8KmRdK0n7wOYxnmOzRJxD2S9GR6Bc6k5SskHlgVQzV3moNnkTxG9Ipw5FWLMvMftWa0Qmg20anc4jCv4bvXiWKrVzpr2VoGq/0IOcD4Aq8Jrt5mgnqZYeZIvDFwzf0g4NMXjvIa5/YLmgFEhQ5f56KneOZXVGgq2RGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qM3V4T8DrKgiaJ/HR72beQiNI5taeHjXVJzNdR6dHD8=;
 b=kXUYZc13sk3lzy5Kr59WJDfkyDk1Wh8IZb6MYplq07eBTS9KDryuv3EjaZoGz5R/tUA+pF7mV/Mh2JpOFugxjc9TUVPyrjxgB76OThS0KG84Ecb8pcyeRsyg5S2WyLKO8l+quP5780js1rwlGlNLEoi2wJ7/p0UOD5emU+fhPBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:59 +0000
Message-ID: <87ms6k8o8x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 18/26] arm64: dts: renesas: r9a07g044: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:59 +0000
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f16393e-d965-49fa-bc04-08ddfb234d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vx80MKEWl67VCdCTURoh56uLUARxGzibEQljToONEBQSYAO2ZSWyjINsr+cQ?=
 =?us-ascii?Q?1bppVJeKsnRiqxg8UGnfBmmyhvY8pOSRbE4sD0rdkoybmGFntL2aRDpkPJym?=
 =?us-ascii?Q?Y0OmtplsVd+kZz4WYQpH7xU2Egjt2Mac8SoJOwYC0IvN9YEXYVHaKq77sZno?=
 =?us-ascii?Q?f/uzuLWsg0qTqWh3gZKz/PFfD4tyoV1kfsvripH6TZstTigvBIo0GSsR0kX5?=
 =?us-ascii?Q?9LrGT/h4KyRGuVCTa8ZOGRIM88RIA5hUlhSQRlgGO08N9fdT2Y7qoU6lwaMw?=
 =?us-ascii?Q?kmsCwNNYyVBzlrbchrWQctRqI01Mhd0wUL1f4Id8tNXzRbh+D8tARLMWbEmf?=
 =?us-ascii?Q?iROuC03bkS/6PjErcCpkwaFNKF8i+DJxgWw+CSS92P1TINdz7mgacTSGN1mw?=
 =?us-ascii?Q?t7pXlpMiiSfdBC0F6NHDI7W0c1Yw+als6t7jACrpfSd1i7RSlpkX9aHHpt0S?=
 =?us-ascii?Q?yCLsvFQ0gpgxIyZuBZQ5QbRLphJUYoRVJO/HhfP4jjGES3g4UbGVI0/QzFbi?=
 =?us-ascii?Q?UkZVa3ZyjazEri7ITeJT2UnC80nYT5h0nHKKFdULFr8m7T9E/E1xjhJ0ij2d?=
 =?us-ascii?Q?LwRWTG5kx2Neu3KXEleEiLwpfyKouFvhcnKMLIuIxTkSFFhar7bAaNDJLubU?=
 =?us-ascii?Q?v8g9IRV7v+9Ejz8fKL1pVXWACwneyg1GOItNVEexY4RBiwGD/mvXa6wQcQAB?=
 =?us-ascii?Q?b3RjARhqHbJDJuUKor58F0e3eBmEhngh1IiDIYF2TJ2MPIq48JOTt3Lycoe8?=
 =?us-ascii?Q?hY4SVw+xHAdslF3qw7ShuBjEceVYaf66j+42cP3cGvw4nedQ92yns97OEH/4?=
 =?us-ascii?Q?GAZ5N1pr/FPGXvFbie6NvlTjmQG7R0n5NY/VnVrwOtsvJq6QHYivYHfrsT8d?=
 =?us-ascii?Q?2nFFrWalGUQ56TSTjeZLKBTGQzgBEhxae9nu3i9jNNwsqCS5M53p1uUKkw+4?=
 =?us-ascii?Q?BRHdlRm/SVOt65FbPcIjGmZaaTXBckIyC2s23FKYwaVW/97DmJHDDknDF2Hj?=
 =?us-ascii?Q?xFspbVPhrnzSj/tePJOUogyKmMvQd7e/ORspNT4rYaWo7Hg1gF8RMjN7bF+2?=
 =?us-ascii?Q?t/Yt4B4OinRECqMDaBgmmv9N0g6XCkGsix7UvuTsve4EpqttuhMa8u2wWohP?=
 =?us-ascii?Q?vAG6yhqUmfuDPq+OEPvMhvNxVK9xY3X1r57v9Gqv7Ek++45gXtWkAL+qk+op?=
 =?us-ascii?Q?1DiyxVfiPg5V8fXy9Fa9qjK4nGi5rfe17F7tAEUUKUxaFoGMBQSeU3uks/kb?=
 =?us-ascii?Q?NzH+6cvIunygWbEn+C32xHjtzQ4gP0eAVHTc9gnKNcfHS54aQele0obiBSCI?=
 =?us-ascii?Q?VfAVC1cTZHSRQbzcqBmB99cFkqRfG3n3asnKofQtGun4dQBoM+YUu4qvkuFc?=
 =?us-ascii?Q?6rDF0rpNQJ6XRzxo1uctv1Ga+biJH6UpcpEGSiOnuNtQafMk6H+m/0kaFdTK?=
 =?us-ascii?Q?RCqDnAXPIRQyBRLA9ri36pfj7ULygl+kMs0qJbWDwaNedha/o5xIb4Bq054e?=
 =?us-ascii?Q?xrYRzNZpX7UzA0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gSfkNMH3Q+4lMRH+PODILIj9yYhnM5+cYYa2+rOV6d2f/Ogqfya8nNwA2YkO?=
 =?us-ascii?Q?YkduUejNhmJDJtP1VQay/dGMcb1+v0FLt9sqm2DqVI50Z5098IABayfRlYND?=
 =?us-ascii?Q?L/wM2BdCOtVl5kVwNYohhiMpLo+qfUbxCrzQ1iBt63h8Uqk5hzibqt/IWp+B?=
 =?us-ascii?Q?jpAm5Vz7wV3To4iQpwghGGbSsmgle9duxy2Xgg9qmFF+qq1/KU6C+erMQGcZ?=
 =?us-ascii?Q?esaZiCnmb1f/rpIwD80ZUtf8EoqXGHBolH1R80TplZJWsYK8IxoDUSoeYmoT?=
 =?us-ascii?Q?4NQiUUecvFQnRMsN2++lgs1sJALZ4AwB0gVJE09NKKF0oZNte7np+Hipn0gP?=
 =?us-ascii?Q?GyoilLXFEifRSNOgHVJWcPHHon0HyD+KOBzqpexsEFX48QsfFSsDVXYytbHr?=
 =?us-ascii?Q?Xo9Kj/QTQADPpLOL06zvqmPe2KhWEf6T1ZUWRz1+9Z7Qo4wsmHpLYBYliAPe?=
 =?us-ascii?Q?c8GdM2KvhnKl/y7g8ypRg1BAfzIZ3gy2ht5WLWUb28UXSihWlIYYiS01MujP?=
 =?us-ascii?Q?JjiNCFI5qfVpixoKRf4yQJuRAiIWdS3llMKLAIVf+C9BdQnUakFFNcyfDOu+?=
 =?us-ascii?Q?xP2ZRUS1U7mbdWB0VDH2us9ft8mQvlTQQ00KdweuhIO5SOlixK7XeL77aYwl?=
 =?us-ascii?Q?Wz9VR/PyG8+jWZsdVfvKwP91tmYeqMXSDfeikuoWzUTUriJjr+Q5oUt0q5r4?=
 =?us-ascii?Q?rjyxlC2NDm/Z37O4femMDW2h7C/zUD1AZrGWakQiA4LG40r0YgXe30CR3Emy?=
 =?us-ascii?Q?2iPueir/L/ecR3U4gUi3RyXBXtBwuY5CuulNCtiIaosY54XaRpZnGkJQS169?=
 =?us-ascii?Q?DankspNeluXcgr41HuEK6dofgVWJFcIViR4Nv0Y3H/xFSb6k+xyaKPBkOZRZ?=
 =?us-ascii?Q?/EOnfTFYChME0miprvCEqs0vZPpHE9Mu6kMEiqbh2f8xnAzkfxU1eX31mTz2?=
 =?us-ascii?Q?4fC3QOhPQd46YIYHJ1odmVLeTN4rqI1M8uLUf6ULObzJBXsVKxmfWGFRs3I0?=
 =?us-ascii?Q?erf7M/T/GeZ5PqAyINC/Bf/TcLyPTXulj4GhV14vsnglbjheov6UxMO3Zrcm?=
 =?us-ascii?Q?z43VVE+qcYYpSy1gLx4+EuJDHKohz46RpEe7gJSKSX+JffTAIj39376/doEf?=
 =?us-ascii?Q?J0TdyIDIe2B/mxpSjJrnSOybQOwFnMDZJxa5Mijq8Y/WCx0u60o1xUUD5vJw?=
 =?us-ascii?Q?+zhQLoqfs27imtAtqQB3BGLbylV5q4MjwUy1oSrHU/qChMVfjgei6QV6v8L2?=
 =?us-ascii?Q?3pPxcoKt3vvFAE8mo6DPA5yL1V3xptPof2b3RNo+j/HJJ+XDjSdtvxgtmr7Z?=
 =?us-ascii?Q?tzk8eSBUcvvzBQZwCq7rdL6hgCw3eZ+p4NQWGXBiO2huQwrhS1kaKC7OqKi1?=
 =?us-ascii?Q?A3XEOqkoJ9gBjHgCkKq18gKR8b/FM3uWeQrN5/DFKuvD6VNIFu9Z1/+TefMJ?=
 =?us-ascii?Q?u527QxEApU4MBSlo4n18IJb6IoWl0vSRQZa6eFlul5vuF1J1KrAdJvhWzO8W?=
 =?us-ascii?Q?x4ByIt0Y8qGr3rnAxCH6r72nnY6+haUvxnRgB4MJDTg7gaMz+Lg121zEFqQa?=
 =?us-ascii?Q?qNaEdY3LVWNuItVcS5zU7HkyO7TDgNNyuf8DcR3ZYT2OvJDe84t/QvZnDptO?=
 =?us-ascii?Q?yOWIpddItlSWu7Qi3+2qzs0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f16393e-d965-49fa-bc04-08ddfb234d45
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:59.6590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9SEnO8i+ZXC5NI/Y079bQ9KKbmBvfxunCB1gnsdKLjXWHxvXkV0xgQppY6FHM96cEmpkfp6L+GeQ/KGt8qyv/XhSPTJ+la80TdAhDDGZ83rtKoy3ilpWK96SzjlQcJh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index ecaa9c4f305c..bd52d60bafb9 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "renesas,r9a07g044";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	audio_clk1: audio1-clk {
 		compatible = "fixed-clock";
@@ -159,7 +160,7 @@ opp-50000000 {
 
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
-		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	psci {
@@ -169,7 +170,6 @@ psci {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -1450,11 +1450,11 @@ target: trip-point {
 
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


