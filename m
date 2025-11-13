Return-Path: <linux-renesas-soc+bounces-24534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54066C55DE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 06:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 43D654E2D26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 05:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8410F2FF66A;
	Thu, 13 Nov 2025 05:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VBXhSngL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6432323EAB7;
	Thu, 13 Nov 2025 05:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013386; cv=fail; b=L5MvWMaf8AHGO7bhKj725CEn0c+I4EmZIRiEc6GidX1NVdO5huj9IuShHqmRN6MD2kXCRadDUboUlnGTZJiwz7z2xyZj0svsGuQvQst8WQtJdpxef/Ez1sql7BtWtf/Thi85dXsy7tqt0IaiZr5QWpAjxfeLJO8SkgwNh1D3rJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013386; c=relaxed/simple;
	bh=TVVIhL1rFVXyjD69Jag0sNwu7C24PjbcAqSDQlxB4Lg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qthYWPJ7Wmd62xm1C4VRDWyVPdSDB+IT2eRplB6oP3nPr+pOe6NYxLAkQkN+Ougk1F8Hn7W/5aA7bB8qWO9dNdVAQiz8wRMsTKxWmmusFgE2RwCVbWuaJTkzSesTBCcg/0e2n8SJwrBkax8D7v7nOmYahCmQxnW4kPG1tITBeQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VBXhSngL; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Otf6xkIQDYhFTj+ugszQve5jXUrHfb2SpH23QRSGUWy5W3F+eFHN3miZFaHaWcvIchCBBufzZVSat6uuDAMKUbbWeHtzabnZYjEdGdoEN+loaHhEqweCAnK+T1pbzghUL4v82FTUS6pjnoVtgA2l/6eCSnMxJhbbL/8TEkODqmtYQe88j1FLlao32FGdMCGxwKUzrrJEfJ8q7aJ1GwNRQq1gRxrmTYnB3NR+wYtTlevtcC/6EXPz5fjlL546C7eKWe0AIGSTAfCJ7wUcFAv6091TlQ4EY8w5IT3BUdV5ZVJAc0NEFXH4ssCJYdOK26n2drBTwevDmn3ZkkQePKyISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QG/Zcb8X0FGywR5dbbQDS4OXySi4R8vz93KPv1Z0iQ=;
 b=WRTZG7ca9lGo8hBO9o43Kc6gI/VAZJiFHtGwvcvJyuc0eBVHbCKLIBs7ehbD9qcbQ+d+7U036vUfO4aIOyC8v/HHaSeL/YsJG+RLnk+jTP8leeuxMA814qqhLxPKKh0x1DeUyRCilGjf4kGhb4yqYekZy9T9Y7vKLVrdUyq5c9qpKXENVRnZt7QcOPFH00PdVv4DlNuulZZ5U0/Uwsj4Tf18ErqyUWVNIxyuM3qj4gjz1V2WUMK0PLJUcDhN91ALMM7pKhYAF2ZXRxiM+1wditBbKvqDkN2uZUtwQuGXeyR5bibRy3oqZOmQHqx1i7gDlPo5apRFQuAkcnDMLRsaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QG/Zcb8X0FGywR5dbbQDS4OXySi4R8vz93KPv1Z0iQ=;
 b=VBXhSngLnNGc+ZA86yjq15kilGIP52+l4Dlg5HLnTQ0LZT88s4LVxQgXOkLJ0InyjfLpzEylBisnNWWnbiWzCeWahI7C2MFSJJuRrIS84aUirPZFfvL7zeadw5qlKwtNPpW08YK3/3i81/TigiDL0fbi+ofcysgil2/i7LqIEss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16454.jpnprd01.prod.outlook.com
 (2603:1096:604:346::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:56:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:56:21 +0000
Message-ID: <877bvuwk57.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH 6/7] ASoC: renesas: rz-ssi: Add support for 24 bits sample width
In-Reply-To: <20251112154115.1048298-7-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-7-biju.das.jz@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 13 Nov 2025 05:56:21 +0000
X-ClientProxiedBy: TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16454:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b98473-e460-4699-370f-08de22795ee9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cGej2FvbnlW0qZcbpRVDjK5RbD/CABW63eQN8yczpWZgCTV10urTx3efyHgN?=
 =?us-ascii?Q?LqGRrvKUHBdPc3pVBiGWjfSW3KXpuCt0yXIAGptPP1JrAuITgRr5/LWHboBw?=
 =?us-ascii?Q?25+afLwVI3vBzCC3lOZYxiLulB1wAzTMCg65KnTx8JXEkLU9IB7b24pHbY0g?=
 =?us-ascii?Q?6MZzIautCOhprqkxIW1+5UuVCwCMpur/b8KBGJSdYa93XIboHLZpMv9ID3K4?=
 =?us-ascii?Q?CWGNVA/dKGOLbEbIcUXWNkMxieqfSqA1vW04FlutBeu4bsDqiYjtis6j5ER8?=
 =?us-ascii?Q?9i47NXXB2CF92KruYnQXY5mKvU+BTOu57MZYrCkSLj25AcNFuohLUwDCmNZe?=
 =?us-ascii?Q?2ixN35Jt1KWJFUKX3wM+7q7PSVg/0Vw3/5WbDfzFUJWB/Wzdzq6/biMrWYwP?=
 =?us-ascii?Q?KAiK+EUzebbuAMqjC5oFxl7yiyw/V9n+8tfqo9HK+xaC0BJmr3gYCm1M3ZBZ?=
 =?us-ascii?Q?q9YFbhkhKKzDu7Ukr+bMIzlqhGKOT/n0daGQiDhygtBYU9L3Ekpu1Uc1s1tM?=
 =?us-ascii?Q?wyBeld5NooRcw9OihON6bA2vr04v4BBi2GP2q0GCe6GOPsHGZo9pktSYo95x?=
 =?us-ascii?Q?lFhj2TahfY+5rLgCBiURlkbUTVqZ8VeL9T9DnVQRHjkUqgksNCnSSpgO/7gn?=
 =?us-ascii?Q?GbRLkmy44frw1LfSEwsoqoU1D3+lRQ9ambqlcATc2ppRAyIC23GYS+EPK9jI?=
 =?us-ascii?Q?hBdgmxanJPj+lmvTPLHACrP3AqsCpxnwgSybhHHSSjxxj9AHXI8iTbwpovN+?=
 =?us-ascii?Q?j2kW743cUesf0ANL+c2uxTLDq0KouWzdZJGBayPl3YT61TqOdq800Zp258Vc?=
 =?us-ascii?Q?oUR9vQPA9cCeEhsQECiszGz0H3yeANXWFn/kLk4tYwcgbvXcWttZkSgs5EXV?=
 =?us-ascii?Q?BNsfsOaesIrBvW9RtnGYzpGfDDR7lPfooJvqYufxG5RLexN2deS1nhOeUUVq?=
 =?us-ascii?Q?6hJCHPzQ0mPxPEa0hHhnZ7jy9/si6ck2e43foSP+kUrG9w3DoYw7o6c7zN/2?=
 =?us-ascii?Q?DGx+pboJBZEmSEFE0bqLNsu2jPbXsutST32psraBz+/s9Pby/IGqunqAbRRu?=
 =?us-ascii?Q?apJotspwxEgAY8o7Z3CZbQ5MTGO+6GfX3zKwui6s2crzaecdxY929mwb7Un3?=
 =?us-ascii?Q?ZbByp7qKImS79k4YgflpIfhsjVKtLIsFq/El/wTOy5Dc+Pvh8R6lwGg/nyTs?=
 =?us-ascii?Q?5M6sAnnlmAfUVk7qxjXOWWTwQuOhTJlrCecxBxdR1c9lbcBZhRqnewazIw61?=
 =?us-ascii?Q?LeT+OJl5TqsXhtPDIQ3BmNMVI7WLkkTHsEkCw1L8bwzQPWvXOC1RN1JHnDVZ?=
 =?us-ascii?Q?2tvc7V4/lE91jNn74fA3rq1JjVmXRDr0Wbq46ayoZM/ju7D5KJvL/KWBCOPs?=
 =?us-ascii?Q?JoKFfFhvoYyvJGI95ngtx66LHzspmHgsOJltvHh6Dztg5+7EigDyh74N768N?=
 =?us-ascii?Q?BTpob24Nn/GB2M51f00ZbKuemA48SRRuCk7NesocAbQQW5kSUIVD3CDZNgHL?=
 =?us-ascii?Q?8X1dkKuziaB4lP4iKRsXtmJwcZjcgsvOhucM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wBcafdrFc1L/2DRauxLy3GlI4l9IP7IaRShhwKiThFPwaymL/PyeX7dPp1lx?=
 =?us-ascii?Q?1RHFK43n9b1nEt3VD2/jOvdOjlv6EiG2LlWnQ/04XW3+P1ewxRunMRXtvlSu?=
 =?us-ascii?Q?PG3SlM0JgCNyMlyq39acr0l4Vl4KQzoFGL3aylRaPKg9bM631Y9NqRRgcLBC?=
 =?us-ascii?Q?wCPPMt3QUFgqQW1pg4IbWsalizev9beIQOe7NDOW/d4BuCx4A43CAa6y97vU?=
 =?us-ascii?Q?jXWibKDDe8b1x5zciIdg7zBUn9HE2ydalLgOPGBuTSgxOZcSv3WYCkUb7i/M?=
 =?us-ascii?Q?8kuH0fguGSupmo07F0FauBfSzYT27uJs4hBpKouJQoIVeJ7p0EI3c2sO/Hir?=
 =?us-ascii?Q?f7r9b+sfYSkboynqqhQTkr3Lo+dHrLrJgWuW39Qf9d0HJUb+JneRsf5eVCAU?=
 =?us-ascii?Q?A87Hqo/BFzDPuDz5Jvc006DrWsUAaBBNhSDKI/ThfXFPHxgVp97o2fe5rzht?=
 =?us-ascii?Q?RMQczwkAQEy0O0AD7DPg/5BUTyGydATuMrie3r72q8Cl8JLXwidPK0i513iV?=
 =?us-ascii?Q?8sgTQBm5A4YNg/fLHvxvc3eC4rK4TBFLrA7y2/slEbryTM6vD9wFowyEef59?=
 =?us-ascii?Q?QYEHkeSO6xNH7NcGPwSRZgxkkIGrNrJ0J56Qq31LsmXzL1E1yN7LPQavpHx5?=
 =?us-ascii?Q?e2tXQgXN3UWrmS+K6+qv4dYPrMYZiQHCZ3XNIjpyNKmMWIgbcBPBpkOi/cDz?=
 =?us-ascii?Q?PMZJD4+KL/MPdwCGwlWdbdUr5a5iIGFzI5pCBCwszorAeqaBmbARE93VGEnW?=
 =?us-ascii?Q?GMI1fgrda5bQ/VDvitB4ECdvqwFfyioyef94aHeUY9uch6JAXs3owD5+/hCg?=
 =?us-ascii?Q?vkEDhyOAYmVu10Gudu187eIVeXiXxVVyoykfYI97XwYiwtCv2Xefjr+s76ho?=
 =?us-ascii?Q?jU8wak0oNsoqNEX8VRUCcs/UXyMNEk4t07OMQ9U4gDxqRlHRGLMY/ylkv2j3?=
 =?us-ascii?Q?fqnqJTbG5WrXVQmdLof4yxeiPQFn1/TqGrSLpNd6ejOvI6nFlYU4lvUrUTwd?=
 =?us-ascii?Q?6arH4WZ7bOnc29vzA5Q496+elvl/jUM2Ku2b/3PUgIm/SjwgKpIfM3NjRH9P?=
 =?us-ascii?Q?5rR5fKs9D3Ok74xjL4ngxHkDYhl8YPeHaqGJRS0NI1MUdMFXaf1O5Jiin1PW?=
 =?us-ascii?Q?/aMvrksMm1CKKJFIS+fWN5zsMWpuyzFt80ugpIyoZfhG6hi/3KhR/au7NRWI?=
 =?us-ascii?Q?jscftOumEgkd1cyPqxIkmPOgow95CdGnQ7qq2Gbe2/DzzYxhtjY8MbkXDCiJ?=
 =?us-ascii?Q?0Lfw0P6Mud8Pjwvfp/4ylc6fBL+AIzJtyr0bzLY2l5ALwfWJl1+kJZEIab+J?=
 =?us-ascii?Q?VB/HbXkLb3/9dbE8/jayCvNcbFuWl5FTDqP8yeyw/3Ci+FOb9thZG+jm9LWd?=
 =?us-ascii?Q?VCcb00SrOFTddi+fpzCpcgmjpCq3/MJ8o53ontbcjpN5ZS/Rfr1jHiaQs1MS?=
 =?us-ascii?Q?UTxkWbBPbklBUJ2kZyUQAAAxEir02Ed75rNBOVA4zOnSPnEqQ+8+HQhc4etq?=
 =?us-ascii?Q?hXh48WUXjuD205tREgKA3e4vNX2u7Z8bQkxEoC+znh4m1LTTuadKrw+FDxKp?=
 =?us-ascii?Q?5eKd0mzpr4+jmp6KNuQUSBlApdn90ITi20py4Zos/6DvkYmZExqgdv0t7t2U?=
 =?us-ascii?Q?uKfC65/xXa/VW/DaNqzCDH4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b98473-e460-4699-370f-08de22795ee9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:56:21.3817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4elGZn40NzoUA9Gil4NrSkX31nZBJXk/kqPyiFB1USzqCYbeInfRULAhaRC1Hz/r/4l0W8LvkdNuNqRkhwGE5dMSL3rKUe/jmczd2y3mmpNT6rCbXbypLXUaqLMkHmaA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16454


Hi

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add support for 24 bits sample format width for RZ/G2L SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
(snip)
>  	ssicr |= SSICR_CKDV(clk_ckdv);
> -	ssicr |= SSICR_DWL(1) | SSICR_SWL(3);
> +	switch (ssi->hw_params_cache.sample_width) {
> +	case 16:
> +		ssicr |= SSICR_DWL(1);
> +		break;
> +	case 24:
> +		ssicr |= SSICR_PDTA;
> +		ssicr |= SSICR_DWL(5);

nitpick
It can be 1 line ?

> @@ -662,8 +697,13 @@ static int rz_ssi_dma_slave_config(struct rz_ssi_priv *ssi,
>  	cfg.direction = is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
>  	cfg.dst_addr = ssi->phys + SSIFTDR;
>  	cfg.src_addr = ssi->phys + SSIFRDR;
> -	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> -	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +	if (ssi->hw_params_cache.sample_width == 24) {
> +		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	} else {
> +		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +	}

You can reduce extra if check when 32 case ([7/7]) if it was

	if (xxx == 16) {
		...
	} else { // for 24, 32
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto

