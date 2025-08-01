Return-Path: <linux-renesas-soc+bounces-19828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E31B17E8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90DDE7A76B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 08:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173A021FF35;
	Fri,  1 Aug 2025 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X9aa9PhE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989651FBE8A;
	Fri,  1 Aug 2025 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038138; cv=fail; b=VQxlKjL+d5o9ef5imH7yYjsejf0+fuGpF5soR6jy5KbbsDaU/+3mVmpiHcrzloJHMQ3regM38JTnZ23yTuHvYn7Vs5+8Jj2ZN08AUDr2DyUwjyGtlWW4lUmtzGzORGLn8BaeVSB9pcaKCFIAMtPgZAF3wVuGKcX51sw7LcqydkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038138; c=relaxed/simple;
	bh=Z+hyFhODmYwP2Rp4cZwvCScYabB7rRYn9Os3muDpZPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V8eFbMl1uLxi6oxdY4pBLD8kRWNiXzQ0sw7+3rOK1dldl/B4uq/bq9mgvQHrusDblbqH4QmpDkU/INeBr5ZHd6Ewxnq8Nlqrqqs4VR48yHs2iC+KktPADbiiKDkk4dFTEwgixOtUjHaIiH4QOKEYPvUgPnPs7ZO49sTX1ep5alY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X9aa9PhE; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTdV2x0/RUZAesZ1cAwhkwKyssht4y2taz6uUE4qe5Am4s2922ZX9hrKnAVPq0pKqr6Q1f+lP+knR3UX9qbQOoGrOmPmpOVQKwQFTxWDYeQb+2VU3o0mMOL+AE3/b1/L3OT4wyBSYLFs8u5j0g8BuEjBGlD2HdzkKnZZtwf/VgVcEaHLVXUKq6/vJ6+ZNb6uBAl23vAGmlCxnb9nAPOc4pGH+mdlw1myGMhDDqip3CabjofsEnX04orwmJeRicjf7jjpD+c1CH/YtteYOOcNv8FL32CtBjDrGtCAsBnv6vlaVlptZPp3XxVK9D5Bsi4Hj3VGR+QxTVaET5CsxV2QHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOJOQBZDPnNt5YTuwk7kSUtI2dQw15yBqor6DDoDtNs=;
 b=KVrkwc+I3GJ/70j41EbC8Z5kFCN5WY9DZ3hhbIpTljXlpW4ZmIa9F0sJOulDHM9r4raHfZs6R0khAAJghlYVAqr2qIc96kFiKuvp9ZcFCSO9fefS2MufZHGevtY86pWJCrj0buUpzX4HPIv42EYT2wsJ9kwfPIe4ZBFuTWXkT+LDOmXhm+W9rKOaeNWHi7sYN2WFp6OzqHmKeGCcXYSfEmXLTxS5bV4P+qnTG+mxnB8UKwkSUyFrEj589+n6AGU+R42yeYj7Wc58R+s8F7ivb7L+gur9pwQHvKBhePZgTR5LR+wfTczoMgmJzHhw69JtqVMPaxaVm79REV35wA53rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOJOQBZDPnNt5YTuwk7kSUtI2dQw15yBqor6DDoDtNs=;
 b=X9aa9PhE5C9Vy6C6QiR6dXn+Y0tXacTQDXBzKuQyz7X5/iX3d4fgkKKqCimBZuZ7XWgR6UvqcrOQFtrf5RiRQBh4CNZtFung2R7g/FjWQ4dXHlTs1zunzjpQrGaVu9YawZVZChzjcroGp7s+L+5OlOPhdBwzWPwDjHhDTVJiVX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 08:48:51 +0000
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0]) by OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 08:48:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: renesas: r9a09g047: Add entries for the DMACs
Date: Fri,  1 Aug 2025 10:48:21 +0200
Message-ID: <20250801084825.471011-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MRXP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::21) To OS3PR01MB6657.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: a43d0b7c-ae0a-48e3-ab0a-08ddd0d83d0a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PyAiLCB9JALh14WqOpux4HVXdET3OHqyw/+kMSCtDDKioThtFOl/9Y7xS6Pg?=
 =?us-ascii?Q?MvF0HarGoC6CVtxIXxwxgVdD7AFpOBLhSlZBMlA0Krake6OJoBS8d9s6BYHG?=
 =?us-ascii?Q?KdRdMmD2Cl/oQnV38lfHz8shmqw8RC+/y18oW59/XCLlHUpBOqsOZ6yPAfHw?=
 =?us-ascii?Q?zOcWXSNg4Qrso/n0WhQjQ5g2HE3eR6D+4LzAFA5l3LRVHblXHOquKnXzMLby?=
 =?us-ascii?Q?XfekM9EdK/SC36QnjxIbPYp23X2f4Ps9sa8Cn4RyQAxojyTJut5fWUmshW5R?=
 =?us-ascii?Q?gcsTWdc//89I69zbwvhZlNMiN5B5EqVwpmMyyKYYER7QwjFxBanpoJffMe99?=
 =?us-ascii?Q?zW84FGrqhGmQFBWEvjZt9yPvkg/4hwzLvqNc37FicQmDMS05bTb7fGWSI7DH?=
 =?us-ascii?Q?tn5x34hKZUXnDlD2fv3tgBXkgW0D4nGRwE5z3YSCRSEYqm9zAePvMVn+moTn?=
 =?us-ascii?Q?jsVRqbrS2DiRx7nPB+A1vWY6QIRRlz87zVPvKaPS8AA44ER+ooc/mrKHpI3n?=
 =?us-ascii?Q?0r+z+asqNQBOIKSuWdnUAvJyaJxRnz/X3AJtoHIQVJ6Xz0GjRGXdmViankCC?=
 =?us-ascii?Q?u+8ycEKMjzzWJ2gisvNpC6/CPpMN19mMi2nUp5iNriEyzfA+yGi4q73FfGeD?=
 =?us-ascii?Q?UsgKZUaPdZ/yWsLO8DKC/F6rL5w7HteQSJBRyueFzMYO/m+i7gMf7nB6bRnN?=
 =?us-ascii?Q?izpUdUrAHegUphqPfERQieAf4kKtSt3G2sp44R+SU7qWBmc5LX/3yHsqLYoW?=
 =?us-ascii?Q?fQalEqiSc6BVWqdayrbRDpvTKL8NFI9ob321hSYbGGm7OBaO6wARngYZ1Ybt?=
 =?us-ascii?Q?TNWHcoSVQl0GhI0/gHwCvjdZVJJrKXoeTutqeKXMsC4OUsd4bXKutNsnsIFU?=
 =?us-ascii?Q?HiuWftben7ZfIlgaStRL6rsen09qy8hX4+VAvcCjKFlFyFDQVXAjGCb1OTUy?=
 =?us-ascii?Q?VXXG/f2pHDlYnufsLOJkL4IvjuBdsG1VqBY2qMOg/KVF/iUfooCi8eqbwcZC?=
 =?us-ascii?Q?wFf0rMi4mxpdeGyyDnZ5EyDMG9pyoieTU1LCKTefD6Bcm91TF4yE6UQvGQgP?=
 =?us-ascii?Q?ehanLeL33+kMWFdAhu06G9rUHKShdzZR/2s4baApPaW+QUobyuK1zxN/hN3z?=
 =?us-ascii?Q?GL1uC+gme0/x6YxzEmziTcA5fbQrFA+0Po3L14EyWD0KvvN/t02D85DsudFz?=
 =?us-ascii?Q?YGzcgrjWWnPJUtf1GsRalgzJjYuewyaeGl67wMEDarSg3p2NJ5IiVXjZuiqD?=
 =?us-ascii?Q?+a7Bp3RfjqU4BVLwS6aK0gPd7eg6lDjAk74Hh97o7CW/7W8D3al7Xkn7czl+?=
 =?us-ascii?Q?lukNb4klkUy/KJ7XFu/FzJxSPfxpRauGwtvtqo7S2Wy+z8Q8KMAgJoHrQm6n?=
 =?us-ascii?Q?h0cXE6MO23Zty8Oeg05VkC1dTqOqR/hVa+xN05LVAfkeF0iYx/S/DUuSXubC?=
 =?us-ascii?Q?QIoLafc5pCCHbNsffR/NCxKOXVcOE4I2WBrMKhzPHFE0is9ys0HwCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6657.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GE2/mQuqIIXi9iesdjM4XNJLHkUfeweCteUKO1FUtf5tKztp+ztTRPrUPaB1?=
 =?us-ascii?Q?c/Kqxd47EWQ1TzSI5TlYBL4k5KohaGZjrT5/SaLIpPv1dCIXsoA2v69fKIH9?=
 =?us-ascii?Q?HyiYGLXWRoc2Rz5D015H0pzyVHAlNoOxbLyjHPGL3UUpCF+yIt0o4IIJrrk4?=
 =?us-ascii?Q?unAdNTqZ4KID+c4pzA+lNv4vRO72fu4ekIEgBpnbH+7wdRzF4VdgTksdymur?=
 =?us-ascii?Q?AOZgbTc8e2zhWfQTwRN2ZJ6DRtjqR+CDm+aCDsMRf1b9SKu59GRh05oojCQi?=
 =?us-ascii?Q?oXlFE7q9NyT0YVXNGDmqBlmF/pf4X1ZgO4fCB3CtW3FE163BkmvZTPsnF2kf?=
 =?us-ascii?Q?wWVzeFF5W/2PoAUMqlEgw9v5KxrzRxQSVmgZ6zG1LSmgF3sqOxEejK4n8e0K?=
 =?us-ascii?Q?W9kPDS3nUaCR0WoNYKHc5S1+3OyUzlVnyBVDKADE0L5xbpezvpzKEuGdsA2h?=
 =?us-ascii?Q?LfVMMBuOLtqeW7Xzn+u5iRkHWOn2bTQlExiVoqdr1otJ+H8QFTQ7lhbXfc3Z?=
 =?us-ascii?Q?DyID1gv5rIVosv9e3XBBiRnNILPgpJHvf5Ea+19a9fkqhl3WNebT6Puax+ff?=
 =?us-ascii?Q?ngHr0iO31LtnfayXEDLFiHxsnsdP/qZEqg3wFbMfX6aQVquC5gbt/8MWjKuU?=
 =?us-ascii?Q?NKK7HLnzajleKFKpLe09KeS96uc00WZqsVsQa1x8MdBFLnvOnThlc4V/MA8O?=
 =?us-ascii?Q?N7vQDUsjtsZZVLkQNfduMKNRlJp3CTB5WduZ4RHD6L12YOjWkzXs3lUTqGeQ?=
 =?us-ascii?Q?fIG1D4DBtWa3pcm39+cR1VxuOQjUOymgcXq5VJkKBTrey2e2BVpUIsipz4vV?=
 =?us-ascii?Q?VrY4VBJuqgXduku5tqs/AVxLQurrFKzL1RNOioYpmnstq43KrqYsvZlfOPx8?=
 =?us-ascii?Q?MnrBvkLRH/Zzw3VsHl7zt/e6c39L/MH8Dzc3Nu2874wDxNMJyjOcgqPpDhir?=
 =?us-ascii?Q?j4E9j0JSP/sjre5KPSdnX15Pa+v11pSp+m0KXBaLzvt0aFqAiS0e6ZggrCJP?=
 =?us-ascii?Q?oncjFtCvBHy6hn4UdqnSpHAe6XoCU/XVVFiLUom8q76ZVJIWtyF4jlf2YQru?=
 =?us-ascii?Q?uGOckuFUbx0WAOA32NT0KUI9XZKhF6JBXO2ELvHt9LClXGyXOBbO/87oN+Ix?=
 =?us-ascii?Q?/DG0wPETKzU8TABfbtW4mIFZN11DmpVXQhGKQHxh8C0bLO/BixreJKpYKYP/?=
 =?us-ascii?Q?vG2X0gnBopCHJgQStXB8wwRa3L7aRr7kOmdhXjDUUjMJ50gtFP5eiFmfNDK7?=
 =?us-ascii?Q?z3pMYN1tKEfNMKqF1R+0qeCtMJG2awihWEk6sfIezzyVREqFT8G4VaOepED2?=
 =?us-ascii?Q?XapIOBKbuHGkwrrFchwhpzYrDoH2S1V3scI9u7SKXOx9+uWqRgHMuLEPzRPB?=
 =?us-ascii?Q?ZiuKsXUgNB2vV/fwx20vHxS3q9AKeDiHwLoSjycavmcRRZsLBx6aut9dgF47?=
 =?us-ascii?Q?ntQ91h9ZSTPd18INQ6VLq8j1PVzIpC/l/W+6RuryiG7cH/fvL3smYyiB9hsG?=
 =?us-ascii?Q?f3AXQyuYYXPEBdjag7ulMLxMmOpTKLBNx9TWdVNxo0jnye5xh/Xr7UPnJy8X?=
 =?us-ascii?Q?xTGNfQ7Iid/E8vmZ/hZd7WbB8IO+R0RXwdqZSVYJL5ZtNLWSdNgFaIFNarTo?=
 =?us-ascii?Q?f8/xmBDoFMEhU2DPKVfCrC8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43d0b7c-ae0a-48e3-ab0a-08ddd0d83d0a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6657.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:48:51.5492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huuItZSBSYZ5Vj8aCmWJqBRdK7vS1DxZPjvvghNgq9lvzw70BhIqQ+vqLKV+y6uiuCgBgdrTFBJSLrASiXaYHrV30zdRox3eL0EaKI7lADiFXtWhkqunIwFpx2ZfDbYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Add clock and reset entries for the Renesas RZ/G3E DMAC IPs

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 26e2be7667eb..4e8881e0006b 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -48,6 +48,8 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV8,
+	CLK_PLLDTY_RCPU,
+	CLK_PLLDTY_RCPU_DIV4,
 	CLK_PLLETH_DIV_250_FIX,
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
@@ -157,6 +159,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
+	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
@@ -180,6 +184,16 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
+	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_GEAR, 0, 0, 0, 0,
+						BUS_MSTOP(5, BIT(9))),
+	DEF_MOD("dmac_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 1, 0, 1,
+						BUS_MSTOP(3, BIT(2))),
+	DEF_MOD("dmac_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 2, 0, 2,
+						BUS_MSTOP(3, BIT(3))),
+	DEF_MOD("dmac_3_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 3, 0, 3,
+						BUS_MSTOP(10, BIT(11))),
+	DEF_MOD("dmac_4_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 4, 0, 4,
+						BUS_MSTOP(10, BIT(12))),
 	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
 						BUS_MSTOP_NONE),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
@@ -300,6 +314,11 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 1, 1, 2),		/* DMAC_0_ARESETN */
+	DEF_RST(3, 2, 1, 3),		/* DMAC_1_ARESETN */
+	DEF_RST(3, 3, 1, 4),		/* DMAC_2_ARESETN */
+	DEF_RST(3, 4, 1, 5),		/* DMAC_3_ARESETN */
+	DEF_RST(3, 5, 1, 6),		/* DMAC_4_ARESETN */
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
-- 
2.43.0


