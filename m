Return-Path: <linux-renesas-soc+bounces-20971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA7B34FEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 02:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888DA1888D07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 00:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C8E1DFDE;
	Tue, 26 Aug 2025 00:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LdPcC34J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5599A59;
	Tue, 26 Aug 2025 00:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756166786; cv=fail; b=U9b/NAOUrfD+EkTKLqyFVpKKo5469CU483Q5D9V+Uiz4ZUvxGeyOa5AZvFXYOKgGbNiXS7ZxHB5CKRaSPqUPZQ8dQSSZVCsgk6I+9BOw2oOju4ezN+pYNFKPC4Cl//wb9JRufEndKqO3TDeBfIwtEqzXRCs8kB4rYdlvd0W6T8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756166786; c=relaxed/simple;
	bh=J81fjsaIYZ5r5dAaxYBge4xg3WtDQ2WZ1kSm8AA8dGA=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=V+ITIf7gKibYZ0F38PFmBRUpj/qMEoJ6fqQ1LrQNti68JLsnZxN3Y0Q6Fgw4NIOLBHeTj5DWW9LOcmr5pG22t+DbDF7HkZdOb0Jr8nFe293IiNEk5PFlkjk3qJPtY/7LpJfHYd/pAQIXPdtnY2NJlsiUBqcFQL9qpg6hURdQHiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LdPcC34J; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIQBvCniMQOV7N8rfrR8033AZk1KefH1C1ctCeR4JNaXKkK+upNB832cMgvXS4lGXKIoysB6zC1leL1nxb+TGDYVro7LBZ7oV8e95fVEDydxqlAfyGj7DXdTGbiGey5QGMhmpczjNqW1AZRqXV405ImOJSx+mKdLh09OyTVlVC5m8bugrYhTFVavrUY/7mOtOlY8AYQvpDQJeA4hEkianVKPQTESFD09nFZ5Ik2tK+B2z27jQcVPQXTRD9Kb9w1c5nuwcf1kwofLJ0ZbckdI7RZILoVjGBgJgDTmgK3CyfO7N7i78nd3YIblvjpTHnt/uezFMcQgSk88UJV3WMCJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9bIGiJ/SGx0vmSEMitX8nFn5r3u9dkNhRBnbbU38/s=;
 b=Bwml2oYdraNOekStu9PHibz4LumqOxC9Q8AGb6hZCt8RM0Pa6IRfiTADF7jL/Enh2TND54C9lwWmOupyhB5OytAwuG20TiAGDoYIxUL0nq12M7hYsyJ3+h4aDiVjUJ4R23GX/C8JSAtQ4udTpQebeUK68hhvSRZrJfBoP1qtkocxY5OZcAX4u+7ZSXoDItekWdlika84rXCjMx1+7LtG7bPVapODlWLM0FVc+zetZ7NOTHlryG3xEIErsRIrIz6Df8LbCljk/jHurmjLoRelGt16wyjPt2PLbvNDJR6ALdR2dGN96tXUzX33DiDjSi0M46oPAM2BFixnh6cPRkowfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9bIGiJ/SGx0vmSEMitX8nFn5r3u9dkNhRBnbbU38/s=;
 b=LdPcC34JTbMhHcMut/FGA2Yuvg84qooJECcZlAHNo23JkaafbXfR8ON62htiyuVN3HHGyzJg96i3wK2SviLwW7uPu5bsSwTEgh8T+wa7vw0Pl8lic+o6MzXTovalXXbGF+Rm9CEiJE9urjHNqwJelG4ZIPaSU4aXwBRVe/HBLuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB8072.jpnprd01.prod.outlook.com
 (2603:1096:400:fb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Tue, 26 Aug
 2025 00:06:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 00:06:19 +0000
Message-ID: <87cy8jx7yd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] dt-bindings: soc: renesas: Document R-Car X5H
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 00:06:18 +0000
X-ClientProxiedBy: TYCP286CA0373.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: ea43e848-70a8-461b-ca9d-08dde43461dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JZvMU2lkxx387DFSBMVmGqbf8V1KvM+srsfDFpO0jgevKTP/3A6E4h1yUBAW?=
 =?us-ascii?Q?EvYOAMs1fPNOWZ2mJNOzToVLN3sSwntJHn+atlfHbVwQPQhzn0alU1Btj/Bw?=
 =?us-ascii?Q?cOGnXgC1dYiKK23HNHJYSAxDAbIj4mPJnaCdrsxBadtMd88iRQwkvKNqsh9w?=
 =?us-ascii?Q?0cGAwBlCkXHePYTeAHsWLxElwH5RJFXVKcdFJeEGEHCQF0xtZ0wwWb2MZF4O?=
 =?us-ascii?Q?ooTRVXspjoqGweabMzNGfbxrHH77pfiNbENakehC0imPImLl3pGFzqLFzoRx?=
 =?us-ascii?Q?sNf8d8QeGh3TydVwFenFyQ/SbAiD0Wgv3SO8MYuyEq/FDeYZUnA8T8U72+o4?=
 =?us-ascii?Q?Rvo/tSzH/5XECg+GX2uzXl08dmQK+wmtsNev6j47eJhHvrX5nblDwkl5Ofgq?=
 =?us-ascii?Q?NijtvJe9/EB68Uy1VYZVGARAwAvq3ZexIGKS0LcIYSfWlQC4E2/NA8y5wUQT?=
 =?us-ascii?Q?/F6bPdH96WPUdI48UbbGC7hIdWzx8aOPTwkz3TJX/ctTErMGZV3e3FNlOSq/?=
 =?us-ascii?Q?cArJ7RqKq4lk6+DW2SjDEi6qA1/tGngL3FtW7EUpAbF3gnq9H88sCNk+ntQt?=
 =?us-ascii?Q?4Zfu+4/aSXnqzOX6Gvdmh5SoGG3Km//vdx9uqPPNAAYlmjLGplGjmRUXV77i?=
 =?us-ascii?Q?9St9gt9mtBlRopu6vNOP0g3GBhEiVCWMEcatW5vF5rziEJ+w30SrbMdCSBvf?=
 =?us-ascii?Q?VtqqfKFO7MhuZye6XBFYofQY3pNkmPx73S/dhTfi2Cmpy08QKAvKCL+1QFpT?=
 =?us-ascii?Q?XDR1ijo/XjLsGPSJKTeGtDpP66KpB3QnFllqyIQB4lWaxERlNHSR7pgw6mxd?=
 =?us-ascii?Q?hxJ5wGNFvh8SHzyMr9trNJ7ObD48t9z1lpIuDkS1gUwasAEGYJMF9hr7QjUy?=
 =?us-ascii?Q?aIaW99ZndaNULdfQVkQXUIjfwWZFtFeg9HM5wq1Szf5VCy/2KmnX+tRIDA5y?=
 =?us-ascii?Q?7UWLae5WSRXtP5V+YSC+Sfx0NAm7JsVw1Q4XiM2n3aw1rTJleFPR76j4180b?=
 =?us-ascii?Q?SSrP6AW3J1UlBqY00mF21iOsa/dPGPfufS9hUKOPe7kIBfsCBH5cDZnjS9CZ?=
 =?us-ascii?Q?sjDVmleOC4+2BUxM0J8P8ub4EiXIcKc3yrBqRS/bPs4rZYCZEjf10ST4j45Q?=
 =?us-ascii?Q?mj2xzn/AUXB9+sCfh1hcy2bNSCAmit0KSJgYIvWGGeROaXB1bCNpGRVhAZmr?=
 =?us-ascii?Q?qx9TggLfFx8a9/SBTnvy8/jrjcxR1WNbEPy+REX+MaqspMWneLf8TD38KxZP?=
 =?us-ascii?Q?LPHYBzMh5dNJiIJeco8PuKi9IQu7U/JwhcFuCDi/f7UTgmDKMRtH+ZllIxIy?=
 =?us-ascii?Q?+lsmayuRlGgtHM7yf+gha1orjazq9DX+XREs2ZWnBhK5mfBq89TCwfb2jraa?=
 =?us-ascii?Q?PZsLzij0nMfSJ6L6VVkOtKml8jueDY+w49aOd5SNd9uyWSuMCu7dmQSFOFML?=
 =?us-ascii?Q?Ii9ilsNBR/R3VB9Y6ELjB+PtuaeXjWu50H73ahW3z/bXbOV6L0gr3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vLkuu054AOt4nBKDX9dOi4YkeaDla6DixKe/uwIBWlFsZ4uC8KE+5r3dPhmE?=
 =?us-ascii?Q?ssE6i9+C0Wa5iudTXPBmRQF7FcSz/9C7ow5WLvQhkEMtERWQiLhYlgmTiINX?=
 =?us-ascii?Q?udnTEGQgyHrBY9pIavpVI8LJZ3fZMStauRJXaLnp8xi0d+whTPr519nd/RkR?=
 =?us-ascii?Q?j8u707x+8U2NC+pCy8LUnedTho9KEKyBPwgyyUJRIfdSje5AJp7IXPGxXA0L?=
 =?us-ascii?Q?tl0I+hgNhCD/jqKr0+2WR4ivwi9oP8RlonUcsnMsXjlrO+H6CacNXSOJPBQ4?=
 =?us-ascii?Q?HoBVvvFRCY2PG9IGB5UfXrEUj0/iBY9VlBMJYQiUOHvr6ynbxYf4yAmvFjfm?=
 =?us-ascii?Q?9PajVs0lXeX2HwcOOiGI50pT1d82ksx5g7Vfd7ALMmvaTNFUuvn8OjFXcPps?=
 =?us-ascii?Q?/Kr6oXS1R//yepUSRBic613ROSVyDn8vey/opVLRfVo9gyImDN7rnZXg7Xaf?=
 =?us-ascii?Q?NlpuwPPvqcQwd4gwh+Aaiioa4WKGGonZTUiAit8wvSKteVwik8d0R/efUhLT?=
 =?us-ascii?Q?BXe4+O5jTJck0ht0FuIUtWqtD7DeuYntLJkDQIZ8mkjlrMBHmfDC+48Ppzkc?=
 =?us-ascii?Q?/dUhtyalh7rD0iDCPTwiNkMYz3CNjdMRqHpPSjFCdmZ/lYEMKfqV3hj9Z/Z4?=
 =?us-ascii?Q?KRjlFlCrvxQIyv+twLQMpKuoKa/WH76VS+7+g2C0fhZ76HnjwyGZxcdz6HUB?=
 =?us-ascii?Q?C+Lxtrzpf3n7fsZ04uLZekJd7eOq2zKfg0qkIy2QTqGfAJCmaGIWxrPQgLRi?=
 =?us-ascii?Q?CiUwn7PgryC7FKWET2g6l0IASpG1Qw8zY5OSdypGUNyLlymv0wCy2xit0V6m?=
 =?us-ascii?Q?dXp3okqb7VwwjeSOCGf+g154kMB9iymQqNvYlVTwphzgv9NM3TMv/Wav0Q2+?=
 =?us-ascii?Q?+glvNqWRUEYE61n+4p2m9rVZJr2i1coYFVxDsk4+8Ut50UedGghoDIw4zi//?=
 =?us-ascii?Q?SSHKLLxBAHOuZga+h3HkMnMycbvjjk3oHXC4YD5UBxKgd6KSyJeoKSZ9zV3z?=
 =?us-ascii?Q?FrANNthRZGf/6nuZC2YanDHrs0LMzpceeBpeA61glDEGB+p8tiIS5VzDYTwe?=
 =?us-ascii?Q?zT2Es77XrtRZFwQaj8WLDitUs7gOpV84wpOxSFR4rmHy05yLuOuGTkc7ppTh?=
 =?us-ascii?Q?vcfNYNevBRWTtY4QDlrcC+r6S5YO63TgGlLAnFHYH6T6Z+UJp5o6ub3V/wXJ?=
 =?us-ascii?Q?QuisufGG5GeAccDOrpoHeUze9sV0TOlEO5ZUCjtwsOOmBFQ6mFWnSFl+DfHb?=
 =?us-ascii?Q?OP8d5snl6Mw3ZzPS8J88swqpBJbClQVO+RdlibTZywdQ9KgXHHw/ioNiNee0?=
 =?us-ascii?Q?MHfffvS/q7YPnxFYxbEaGd7x+clxokbcMEPbti/WUb89rtHHxw7BcbeSgB3H?=
 =?us-ascii?Q?kcIPbv81hDAhvT1xdWnKd/bBHjmkEq3oroHIfaroTbhQ873WYqrSLbZ1CcF6?=
 =?us-ascii?Q?8f4L/zRezNfp1cScdrZ5nceALz+ukQ23JreoNo9SLFCtiAHCo+K+IC7G2E6+?=
 =?us-ascii?Q?oHBseBJO7WnirWE8sM4Ee/TMjsN4uqYCHUqqYPEIR0Zr2TRy5fgXnyTtVbtj?=
 =?us-ascii?Q?CG6qv7X0+qqOiAeZiVxxhaCJy7CfJh+5glb8vmjJgoZ2KKHjZNbXxxH4hbQH?=
 =?us-ascii?Q?57uacBw4vhsOIots3lZmiz4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea43e848-70a8-461b-ca9d-08dde43461dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 00:06:18.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MD39Yr/wQTjLp7bNsvpQWucETpC/IYWT3zqk+ZkPxmbDvDiE8M+pibiVUfAOF2ARmSDdzygMShpdkm84qkLDjepcAMCqMAfKQk3VQ13adajZvZI6E09cffkSNbr1QXgD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8072

Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Hi Geert

I have been mentioned that I will post DT-Doc when I post board
support patch, but I think it will be postponeed.
So I will post SoC part now.

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5f9d541d177a4..6838070369791 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -473,6 +473,10 @@ properties:
           - const: renesas,r8a779mb
           - const: renesas,r8a7795
 
+      - description: R-Car X5H (R8A78000)
+        items:
+          - const: renesas,r8a78000
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.43.0


