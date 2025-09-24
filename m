Return-Path: <linux-renesas-soc+bounces-22294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD65FB98354
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A9AD4C2B2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5083C01;
	Wed, 24 Sep 2025 04:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bNJa7gJl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9128F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688319; cv=fail; b=W+LDYfFZQQ41FQbCfZHVgTLETUqVqR2fNFe+mOAPH+Kvbrnx2LeYgGToWkw3K0/hdWUfMCKFPuffGCY6SLc37TPS0h38DaRqoTbgCfwkxl5geVTw75mJi2g9wZEKzY7IAIq593S6bg8iKQeUXEJ2NY5yo1BBYgKrFyQsAZl7ktE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688319; c=relaxed/simple;
	bh=DHt+xOzEx+JGyhvcJ8FFIM/i8xE/PgW8L+j2iCIjHKE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nUj3Wx3qbDJUy8sIHjc///LiPOzD1dVWASsBqx3mSFPyVHneLTZBzzleVam+HTiaiIgUv3Ax92+al8Avlwd2JyDvwOJSdZ3ySn1ECndce26ikmAqkjQeCNCY5Aumj082rYinvJ6+AHGLEoS0RjGZVw3W1kAH03mJDT/6xfCPNx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bNJa7gJl; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSknSK+IBi6ewx4pvJDgejMAXLTBPyDW2yGGptyQnfJ+Mk3MDHtrgYP7NtNwR0ARP6HbVjFXjGAcIQzjTgaJlR25pf9dFvsQMcE4dNqfPYp3MT/37pc8X44katytLjMyfDeCtNlngdGLlTFr86yWRMbqQiV5R5dOCY49ik6u8WtwM7PiooiGDz/CT4HrkbxBibsLc1FmJ+P5MTaDiHVir5We2iz6amsV/2fJC0O8bZOjTh7gzdBXzjZ1whbVyunVrkVXfuzH5rQiHrZStQqpi//0tibG7Y+xAget8J20Jd7xCKBoW/xg9teuJCMfvD9hmGaUfYWgG0tFonExE6c9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdzVhtlx7vc1u1msiAxK4z3JZAhRFAm0mUHB6SmYPR8=;
 b=oYMmGW1Xj9t77Uw1T8S9TAVyKWZ91tkyafi5e1oMVfNRQCun8YTmxMhKS05IUWFC+MuQYHNa/d+ruDSCjW0L2h9ipU0H3p9KfV/bSNIg1Wqr4n25CvXzhVtVi6S25Ng3eZXYGLr2bcedjLz4KHCphtCuXZnmqmLjek2DHv4vq6Tdz95cAsRunCOglHpXa2b+BFvkkxkiz9V7Fxn9LqkatgHAMytkIyS2TeEqwnmt4P9y2+Oj+Y53Qr0OBbQJFiZUl6J4aAFluW4j+EEEWgC/SkUThNuwS8pfuRwlF/186Q1gzeTuW2mzMrUo0ebWDKwkCxBIu3x7K/UYym/v7yKJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdzVhtlx7vc1u1msiAxK4z3JZAhRFAm0mUHB6SmYPR8=;
 b=bNJa7gJloY1R1ylQfNu4Q+LEHADbTvzZMWx7QyW2NHWyaw2dV1ZtF//V/9rxuPUJwe3swph0MX26CTzl9n86skeMe5hGFBzfMBXzxqt6J3SA5KgqmZvjy2i6xQ92qUh0tAA43Ut1Bl4FVmwTchwC8/dQB8PxKliH3oMPS+wu8C4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:54 +0000
Message-ID: <87o6r08o91.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 17/26] arm64: dts: renesas: r9a07g043u: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:54 +0000
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cf5007-76fa-4192-dbdb-08ddfb234a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cZVCC1j0jACY7hdNOLsj6smQHx8sQKcigpfz48EqmX6RYbkwslUeyeqWxXvI?=
 =?us-ascii?Q?EFIn8wqCk/LYBGneJh7aQt1Fkt2Pc0wip8v1ltgqtL1SFLjWK4p2yPYFBOe6?=
 =?us-ascii?Q?7fPIMyoOky8pfobiAf69TjObiB8Aoq26rc6zx2kuuyBlPari8Jofd2t9ydBO?=
 =?us-ascii?Q?eTRM7v4OMWsUERUB3W7Wbdu/VaAVUIe4AKNyRUuCM6WIk/E4yrLca5D4mETo?=
 =?us-ascii?Q?Qr6wtdD1+cOLubihg720r37lkH/a1PD16cTE1v0Q2kGRlIQpa/7HrMG4OL6b?=
 =?us-ascii?Q?u23uVke9CMhOW5cfccn0anmFBiCfpwjRQE/i86APZ7jRBQm+80bH+BQiQmjY?=
 =?us-ascii?Q?yiYSn69o58eE+JwydlpMRTsFT24biSOsLSWIGPVoDtBdGYElARb5dxj3w9Yy?=
 =?us-ascii?Q?SRLSsa7prglLhmgSeurAnMkpLaa1VRruMFGKAt29jwFuRZ7Visy8BBn7a9Kq?=
 =?us-ascii?Q?2pCKPt8pC93L7nI7lh/Q3wF/udIL9U9EZ+w3s8cd1lHGmTNpzVq7nfVzLVl7?=
 =?us-ascii?Q?2nSS3x/vbtixpA89QuXxP5V5Tujz3Duw2Rv5H+2g+fdLoFtXVrarcS3oSM8b?=
 =?us-ascii?Q?iS2FeNmS1mc/WEopfx50876T4RbvL7VgSjtqAEdTQZJR/IsTOZobLwnycopI?=
 =?us-ascii?Q?wBgyiJwQeEahgC7pcec3M2ICqwJptpnvL3qORdCljnL+pkF1Wmyyehniuq+s?=
 =?us-ascii?Q?KueK+/abM2F8pfkYOE5fKu4nCysobuM4AlniHi5KY/PDYjpfhnCVRS2PSbyf?=
 =?us-ascii?Q?VnEBuSxEosAruuMpysi7swGFyHbBGbio5bQNUtxWZSzmR7DYuKxO2wVmX/fY?=
 =?us-ascii?Q?LBKHS/XljETxtiyKuOLTJOoJuaDWgk/yfiyw62pk2Goj/6haXfGzzxKae9M/?=
 =?us-ascii?Q?OehvOqmc4W0GWb1stA6PhyEiTm+D8zfQNMcKGv2fJOHcCRPujkBR8e5pA+az?=
 =?us-ascii?Q?DTP+A2Qfc8vLurkhaeO1o3B+SkWAazcR5ZGWmXzOwcqF6gSFkSd2C4mw0cve?=
 =?us-ascii?Q?La7VcGoDDXjqjaiFYKA97KwJczMCHRDl5Vy08MOQjlcZfuzd6+2aVs+ZaJN4?=
 =?us-ascii?Q?gwFQWakPbGbGeZGgXPBcGQKxRbfgtHq+zrlBupe1xjhFvnJ6mMuFOWUfGbgT?=
 =?us-ascii?Q?H480OarjwNOA8ZN6QfTfRlCdHlVFwjxe6U3Q/15ceVZ/gPcKaepzT6ASS+Fi?=
 =?us-ascii?Q?Poa4xCd09TgBn0oruCdoGzUfK1cGMjPtq/kte3AYsg5L7C3RXBvNAmw8piv9?=
 =?us-ascii?Q?vxUv+Lucy0A9sOjQEVQ7lfAmmOm2e7ZWvegOqdU/KZREWBeuyjP2HpIcerwb?=
 =?us-ascii?Q?Bmb3WgvmIrzBC+pZyvhvdqOcCERMv0rbphqiANSydh8hvsDWuerFy2ZcD5zN?=
 =?us-ascii?Q?/weNuYs/sz/vmlcDvWNWF5vCoHptZJ4FFdZbMdepRBI1Uvb/SWr866vg6GHK?=
 =?us-ascii?Q?SsWZhbfMNNMkVB5UYdYlwrAD01kIh/+wiZoiI+jTASVkHWk7oKaq9JcHjj1f?=
 =?us-ascii?Q?n5eulxAMdABXK+4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vy/9M5WwVD6hW4kBR7stzEv97tdlBa39NwuXT6MMvNlAaCUnfWqg7QAyAqC1?=
 =?us-ascii?Q?JnBoPZxB14ZbhhBzKR0X2uaQyHOPcV9kn27BPRsev6zmcjqqaNVLGDguTipK?=
 =?us-ascii?Q?/VhKxZQkThDLvyNxBkorfBtk9AGKuCBys+HQiBLx+MaJY0i3FnMpVD5oyXIY?=
 =?us-ascii?Q?A/3BCPYdi3Z+Yv6yb0C+fjOgwvVNxNkW2LuuoC4AhSH9c+YxP3LlnztOyvrZ?=
 =?us-ascii?Q?IhL0ILcChN7sVotWN4LSnWS4unYKVP4USSsG+2mmvsiX11rNaC6O2e8ikHa6?=
 =?us-ascii?Q?e+buY5ov7t3KK5bGW5w703rvN976ZbLSDHYg2CuYxxAI6iaDeOpmLUVNSJlq?=
 =?us-ascii?Q?ua5YIf7eYrqbNzNtPQqFSmZyRYQbPbkDLtF9y5IYuhXsY/tIYitBc7TGWZtw?=
 =?us-ascii?Q?EMDzKpcHVuCS6kK3V44xqPwCRDxMqJHHOWr7tjyHmVstBTgBJckmQlPG2alz?=
 =?us-ascii?Q?cKKupEFdYTeuNR2YQpvz+Jw/LdT9LgQQDzFTGWWDiVzxE5JP1D903557eq7v?=
 =?us-ascii?Q?k/9yTKdr4CjjE8xdvLDC+wY3T8xZ56YoWFsGqk4rm9Frp0xzYq4UkRPoNGPT?=
 =?us-ascii?Q?izcbfCOUlky5ALj7OfUWx4QkbZw19LDvP4ubp9NKomKiRUmAN9giz7QXdidU?=
 =?us-ascii?Q?aJUxZZ+OiV6Ewd3dQF0QnLjTDiJYH0vjcOwzyloY5sgMxJTkiqAbiKRJBalX?=
 =?us-ascii?Q?5fbMqDDZ6vwNKctBtHYGeBpy2pBhGGa2veZt4RNi4n+GVCBwMxJ3ZEW7C39J?=
 =?us-ascii?Q?SGHaUy1bjv9XHB33QbALPkeXQmaVelqUEkbciECFq9V5viriPyQ18fVEANt4?=
 =?us-ascii?Q?3kN0JOo+9C0YXtABRrcBAC59pE+/pgfWERINpwIZ1j7Du8aDbG3+rZ/MxjwU?=
 =?us-ascii?Q?nNBqIuo2o2Ct0yZEYHCu7AJJZA+vAtqhTuAkrk7lHERxiqmrMiTa8yNA7k7M?=
 =?us-ascii?Q?4EK5/1Ws1rw2xhdeKJP0yT8EQtq/BLm8+C8o0+jh1pw8gK5bOpt9rdFBVcNy?=
 =?us-ascii?Q?4puU1Y1E3Lm+wxMpwEuXdeAw+aoukmmDeHyJh9V8ZApXDMxrLF8LSX0POAvS?=
 =?us-ascii?Q?ls45s8I6HXXE0/EYtlc4W0W9xF/JAx4qGZfXTsxcrLm3+KL3Sb571o3AhiPr?=
 =?us-ascii?Q?So5iqG2vytpGcPJf1eVX3UYClnZqAiAnNHxAw7jbGpmckgdji/F9TFUeS6mP?=
 =?us-ascii?Q?uGKwGFojK4Ktptz6T149JgBAV/m+9amYpLh+P3PwZcuppRDdZrDoA7U4gWIh?=
 =?us-ascii?Q?xXDoLg2tIRfMxRuWQ3r1ejnYYtqKLMA7/dCgvVrd67LfJ6EYGK1JM7mT7Z/B?=
 =?us-ascii?Q?7z5OcAHI/Uu7NM42VbeWrgp0Xdn53S6qY7pq8ML/xHbfDhv4yHGb2B8HK4O0?=
 =?us-ascii?Q?WFirLLfKA9a3p+jtZo0pm8SkV1bTbBx1CbSHzNP8+Ge76tJqHGumK1gzYrh7?=
 =?us-ascii?Q?OEgN42QOrRRjrs4l0RtIM6vc/uWTPq4dY661DPfBKZeQxMZnMs23X9B8H+dN?=
 =?us-ascii?Q?fTsX0D2LMA576hTMkIyBK/syAeoJNn523kjEd9HNl0RrUgLecArA3e7ikTdQ?=
 =?us-ascii?Q?HyTrYvR5p31234mBh/wNje1TQCcMwWbGf4iUcM4YziJhnN6i36WvyMwNgePQ?=
 =?us-ascii?Q?7o3z7Sksh6DX+8zKXvA3m/0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cf5007-76fa-4192-dbdb-08ddfb234a73
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:54.9332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJt5Vaa70EYhVFQ4XlSFr/nT8Z9iU5fteEg1YBPO/u3DJPlOsJOrLT67jUKlJAb7aKHxG24xCBBBgwggNhob5np8Eb9FXv+urSXrsqIfQNuc/Bp4mv9ErPRqoYMwiKG3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index a3998e5928f7..5f5d1b0c31c6 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -12,6 +12,8 @@
 #include "r9a07g043.dtsi"
 
 / {
+	interrupt-parent = <&gic>;
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -37,7 +39,7 @@ L3_CA55: cache-controller-0 {
 
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
-		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	psci {
@@ -47,19 +49,17 @@ psci {
 
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
 };
 
 &soc {
-	interrupt-parent = <&gic>;
-
 	cru: video@10830000 {
 		compatible = "renesas,r9a07g043-cru", "renesas,rzg2l-cru";
 		reg = <0 0x10830000 0 0x400>;
-- 
2.43.0


