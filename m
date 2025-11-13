Return-Path: <linux-renesas-soc+bounces-24533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 57706C55DAD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 06:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA4FF34C6DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 05:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797343009F1;
	Thu, 13 Nov 2025 05:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SfsfMcUD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC42FF66A;
	Thu, 13 Nov 2025 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013102; cv=fail; b=a3TVzL08xq1uQ8s+Xubh1dNjczHPquIm/HgtQc0UZfeJmxR+c7oZPXvd5G/GKO1ZdsBzIe4+M+1OjXGg9mMic70YjdyxL0xWEeTYFm/oU3kFXEBEOvGMP3xdfNuDy4bn+Xxa9ptRTIl/1XQvUc3M8rxR+gmfp1cwKwrpsOvnp8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013102; c=relaxed/simple;
	bh=QCm04qTWYqyXRVH6ND0wMVMHf/2WL4HTslEZSp+tARw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=domMePUGoxLrgu/W0wgww+jmRGp+q+I38Gc2TsFd/C84pWhj2xkbSzEXI1ce8kIK1F14MlPNKBHPry4IN50aIZ/Nbk4kfDFqX3Nqb4+EIroxK19TdYIt+2qsDYkuZ6mZYpG4ExNoWfkgjOoJVp83H2akfOezYtf4tX0nks8H4Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SfsfMcUD; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVpYjxqU06qcjMebdUq4bHAzC20gev00CMq7DtdByNyn2bVBke8dg8baTMchYD1mfta2BHVvzaD0pO/GJ+UFWaYFfgAc66EHqj/73sR76txD70eQalXVKDpdPv/1G6EdO5NuA5HGnFJg5Hg4dqD2xajK2jEl2Ff3ZKKUtXSbUmtEeHSHosgSYQmihxqoztzOsWLIDc8x9R6nkjgtJVFDjcMred680FrXSpTXO8EI9ZIk6ETefUvTDQ9z0+4qpFV1dgQwlfNhEhpEBLUGw3sqY0Al7CNhu1cRS4vSU7pNsEgHzC/w9G3k8mm0wOcU8Qq46XmpiD+9q6HuoPg9T8ebsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se9OBva4H7tZJ2QhZ2fEEnKkBO+ypDZPTHAg8mXidqQ=;
 b=IVy/fF3JWnrykpX+oysqTmp0UM6B4iK9oPTsELuFm6ZTO7uVqcXJUzo3IeZe5OJvvYK29o7hFas+Yi/i+ji+pBYllYkw7xljiE/+wxYv11SCEQatfrhry8TcTdW5MPJLVgZX/M/bj3aRhFXta5iE185nHzvBOEO2Ay2oPMyblIx03HygFf/ltUUcCA4bYjOD+lpmrzjDb5seQaXAiJOD8VJxsRtHVUv4Dj5FncgNDRAlS0oKhBLU+UbF8uhDogS8+0T+X9yyMArwmFB8H+Z/P1Nf41mLluJqfZmJsb4iHXvviKxtCBsG0A0XJD/kDj6pX4tuFxBbN2JAw33TDaXX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se9OBva4H7tZJ2QhZ2fEEnKkBO+ypDZPTHAg8mXidqQ=;
 b=SfsfMcUD+NalH/s8EwTQZsVfmOLQgHXk/B9QlXNkdhgL8kS4+NKza73wy6Am6ip6jj9iPlcuhRiX6qjMxwBvvQbPFaT8ZAdk2YEg13A4iMslCAc0FzXbaa0paKQOJRCj0cu9KunB+ZdwnqXYiBo/Mv/zZZwmTN40z4Y4kGKfgb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11731.jpnprd01.prod.outlook.com
 (2603:1096:604:248::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:51:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:51:38 +0000
Message-ID: <878qgawkd2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 4/7] ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
In-Reply-To: <20251112154115.1048298-5-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-5-biju.das.jz@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 13 Nov 2025 05:51:37 +0000
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11731:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d896cd-0d13-4226-f3ae-08de2278b5fc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jEFAfIcmUXedGwIhvtL+tZmUxRmC21wUQGnqJ87lT8pcvIICp4cORYFcBBtP?=
 =?us-ascii?Q?fq1iHOhlJkx6LuGR7vx4yYnyQbOxai9h3ZWhof4u4IgwirZOIwBHRVZjrvgI?=
 =?us-ascii?Q?qfOhVoqZlntWhWAXG7a1QnKNVRP+DqAU2JCHxbPrdrM/GcdjFAh3LjUAyrk0?=
 =?us-ascii?Q?rvIGXqD0QPuOrqztNmIi/W0iL3mJxqVBoOGSNl0y4WPEPOCTi+kAf2yS2ThP?=
 =?us-ascii?Q?AePQ1PGQXf4fpM0++7Gq/SnuBYOszMXzJSTEIMhXT+twFI33qlOot9ZJbQ/p?=
 =?us-ascii?Q?V/p/otmGqy52MOqxDCKox7+0K3JsjHtESIR1zFnvho9LT0QLYkS/Z0dvhd7v?=
 =?us-ascii?Q?KzZYAbQHKTD6jluR41IOT8WVAzQKaRdIT0PyNBk70rGzHSo0t+ZxEwItQwjG?=
 =?us-ascii?Q?hRqBdFcSUt71WCivqYgiGdOGM0/naUX1+cHxjYpFqbSFnMv+E+eWeI3LDwxS?=
 =?us-ascii?Q?FVMxdtMpU2fJPtPkbOKwZ7dwJ9apPxH37QiK5HbyrxhQQc3xgmUo6V6PbJ93?=
 =?us-ascii?Q?kLkdCXyIJmNkyNHOAj2S2hpdPMW/P0iMWe+fIokdswB98vrN6F9HwIiPedLg?=
 =?us-ascii?Q?vw7lFbLYKReUHJvSUAlqE5QqVz4Lsz2wb5ErrZCVaz/AEtA1g4NnsOyP/vfq?=
 =?us-ascii?Q?Xz+7LaKqx+H77ZVRKNEC4eq/j+Cstqw0+51Uonk7OHX0J3z4UCevV0+V1HTN?=
 =?us-ascii?Q?NfkZ2JxxeJT2lvR3hdTlDHEyM3MJ/z0xtpkw4f3vlr9gn6ZEmcXxP2VCxIg9?=
 =?us-ascii?Q?lGHGaevS0O3DBEKkGYdpP2H3Fz3clQzaTvwRbn6cvyhxE+Wi6Sv5iBve11/r?=
 =?us-ascii?Q?dV7q1ikHPVn6wF35LC60CIcTBJUkR+OY+RKvt747M37xdN+tZOstPzecKOvV?=
 =?us-ascii?Q?zAeDW3SzCobP6hb/W5Y7wGZHL/hF6arpztxjxx04wrGQFD91wgtjL7XBa7/p?=
 =?us-ascii?Q?0p3ZlKdoA6/TIpNHKaWUWB69aSRHiFNzitfAHTArkou8IcdMsfioBkTVHfoC?=
 =?us-ascii?Q?BAHjd2p0EBYwL1o1N8i3CuDG8ji3Kdfj7qzQQcPstorHBvlnJv2cYCMLoTps?=
 =?us-ascii?Q?pJhxiNm/ZSWnGKP8cYFE3CYXZbOykTGXarwBHSMX5lLW4KSYY8/rlf1Snerh?=
 =?us-ascii?Q?NYRFZ76McQdsPz5FY8KWl9SE370G97R5iOQx8NiuHiWWJIZwSroTTrLk4++a?=
 =?us-ascii?Q?6oInDvpy/LG7B2/wLYUoPwulhDC4uw3hhop4KPea9p8cb3kPXZdGM28zhqbD?=
 =?us-ascii?Q?dlsLMER5Fn+pk9NAx+sCuDDw3AG8fmpzC+BaySvnpqh3hiwVq+9zLVEmYBiT?=
 =?us-ascii?Q?jT1fpXay627N1iBFpNEZi4VDTU4zIU9OGwgjwH17yu6nk4CfyhTSnJoHz0UZ?=
 =?us-ascii?Q?L3ZJejZmergHMaINysUZOFTlrH9wwBSAHT4zTlb7wvzqjqTnJjTVc8Bv0jHK?=
 =?us-ascii?Q?ph0YeSUnMXQkb5VA+loP3L1MplbJOnJc2ifEcID0CQ2arkOtAjvpp+L5foN3?=
 =?us-ascii?Q?iT4i2/6q1jdSq1exl8wikT0QnvXYSAZN3pKL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/tkWxwaqqjoczPp9n2Ni5n8VCi7yzu+5dwpInOn4yvgqcAUuEjWZV9g7U5ri?=
 =?us-ascii?Q?i7R5n2BKGhLYgRCx/3hkU2FnAqf4qqiGaiJyBuynOiuhI7a6TVGG8hkWd34x?=
 =?us-ascii?Q?EMePUvCF4DgqFiTKiqtIMMBa8vplq9I8yxGcWgalzyyi0EiwLWEnoSqSnsBq?=
 =?us-ascii?Q?k9CanZs4dcExegO2U2KP1gAZobwSwlLRwlafZjD70x9GquB3OR89RYWKPU/2?=
 =?us-ascii?Q?rV+2Uk581L8GCcaGOgcpuHIfRgrsEeM1E9ojsGMmjQHb6PfaICPMe40Nzcnr?=
 =?us-ascii?Q?aKpuLX/uhsCmLsFfyFCIFZbTkfyw0if9i2mulgdsHXyastW58uH41elTB/A+?=
 =?us-ascii?Q?YQtWsbnKY0aNHxZQy34EDoMmXEsepKN15ZQF73FpW3+chL+TKz5OV+G9MQql?=
 =?us-ascii?Q?b//QLn3SnfMpBKReauh/LHAZxQbERpV7cUNf8vVChC4Zq1yIqChPZKuPM6VE?=
 =?us-ascii?Q?y8XmwjxwJT1laS/AM3j/T9bcErZlAXc6YGSLlji8ZcC3ikY8CJX+hxS2yvcZ?=
 =?us-ascii?Q?LmiF7+9YkQKN//xurZhqEeucqmTDXMJjzimUkEu7LpRtUBS5A3n8kcKqgUl/?=
 =?us-ascii?Q?YIoRS6Nz3GgX6qEYhv2RR/1AbqllbIQWqLpgLSD0ZhkTqS6H7dOCz+Zrn748?=
 =?us-ascii?Q?wOD3G8ypt04dNDN+ssvF8CQd5sXxXmO1jAUXOue1e7ZYXAfVi3PFr2pTj861?=
 =?us-ascii?Q?HnhmjY3WL6L4vmjwFukbjkA3HyvH3BaUe3zxB0StA4oJMcen76LlFwcu6l5u?=
 =?us-ascii?Q?fptR19gWYCJWMQOGy4afDcrBnZZCACbczEA5/kunKALTLALRVYWlV7TleexV?=
 =?us-ascii?Q?6qEk8isl0PBWGYwxcvM5b+2UatnmAwL5CjOOslQf5JeJsVc7p83Bd3NJzvwV?=
 =?us-ascii?Q?zbV0c7QR6pSLrHm1adfpGlbA+k8yuz5fXU+rBSoDQotEOzferMVNfXpPg1fi?=
 =?us-ascii?Q?/fQdj1DaurkFTRdPvU7BxU232QKFmCFGL6uL/2PiMCGTxzDkKBmvco9rUVBK?=
 =?us-ascii?Q?t3eSq/GFa3GH23/WLfS91arZW2Tkfpr37PIOsdFTzC4rXjW8lQ0UcJRuGbgf?=
 =?us-ascii?Q?kNOvym5Hgmfc8f/yp+0AMQMwMuXs5ImG0V6/YgliIYpnM6AyMLiW6p4E6DKi?=
 =?us-ascii?Q?qpLudSoDIedJnlc52sYHZ4I+/OGVEek8nkbCkwOBM1bauLw8+XniymYizYV/?=
 =?us-ascii?Q?vnkTU3T94nrse1segmZ7bCZko7DDT6/WnWAruXKgAUwdyuQfJgkkGR32JokI?=
 =?us-ascii?Q?1wI9txTJf7Z+Od9KUIIVvUYo+ulcNJ9sTGMG/H6PHzaImdCojun7WqReFS2J?=
 =?us-ascii?Q?UgxRNdM8mNGLGZ6geJZ0ds9vLI55GtG5SlPRc7InX2unB+5FpJEnn7861C71?=
 =?us-ascii?Q?y4jHU9lCWXoAoRDHabtg5K6Qh1iLuL9kj6SQL5umVUE88PijSaSvbkbPrVMi?=
 =?us-ascii?Q?3dPbFeBG49kUB/Eyu5KdA6zl1z4SNmwTW+QQMgGapFeCCPEbkFWwUaan4yfl?=
 =?us-ascii?Q?SfKyUsT6DkrmVXxz9ryK20S9bmstdfd41X7PQX9cJBpPUiWXe+cxdsGiS2KJ?=
 =?us-ascii?Q?b93OKt/xjBHKw0mhncsYFkwuXBLysTnNYml8SgOFZ2y2hxkSaR1DMSSY+7Nh?=
 =?us-ascii?Q?qdeBMh/d3+qpZ5zQwk+dvmA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d896cd-0d13-4226-f3ae-08de2278b5fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:51:37.9301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOAaf/pjAOpLN5bWVcF6yKfCfY5b9o0VA3qbE3mZuUC44vcsRCCpL1lcrBakUNSi1xS41QuUS3rqe4ShlFXJ30kw8hxEwDvXvFoYyZcniq3MtQACp+hHDAQvJMLLCXyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11731


Hi

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Remove trailing comma in the terminator entry for OF table. While at it,
> add a space between the braces and comment block.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

