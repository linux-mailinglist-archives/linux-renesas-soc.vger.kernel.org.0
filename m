Return-Path: <linux-renesas-soc+bounces-9671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC78999A64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 04:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8429B225BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 02:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411A31EBA12;
	Fri, 11 Oct 2024 02:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IafeLQPx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310C1748F;
	Fri, 11 Oct 2024 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728613594; cv=fail; b=j0TGYnYMVGD51dPdtYGtebr8bBmxutO/UWhTB4MkoHLg/DZ6OeVekRiiG1ITuakKF5LpZp4fwYurV0pECVZd2RfDzizvwLP+v3sO/H24vHl7g4oA6eS+7X3UHxuMhShS2HSM6e8cO2hzuQYrm+Mcj7b2yGTnef/3oDTCfTcfjKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728613594; c=relaxed/simple;
	bh=WWoD66CYTMSBH5Taf+PZGoIovl7I6wfZcDcjdB+oG9k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZcrPwkz26l4V4FGORpWd+93ViOZHdifdZAnEAHYTldnY7MWPUEEMpvsgjA/yG2dqWlKtd6fH/xIkAd8wP61xdwX4sQt/ZQIAlPvsFrRZzvfLLidDYCa5cXnPrH0mmnw9fngotsRj5G4t+qKkninBVsI+8TMzGnrqQBwZVW50MyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IafeLQPx; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvDUISYud3eRgZmCSrsx85B+U41NId+3wgRuDKgVf/9wgv33M7O8T6GwDMmgzntc+MPWgxZ6X8e1rybm1NpxtEseItP6VlxwbtDQ0i+u24V9url1SRZw6IUrn1pI2WuvQx99Tle1n6MVzTtBDo1HOfpuwOT655YF7auVP7W8JT1XJff6rtyLwhnf/eQkI7GZ/horB4EVjlXdJ4iIOENiwcnC2yv6aap9RroiOCAvdA2ouHuDB0AX2vcKr9DZv7BHEjjycdWdlCRpTwXbBY7BoaLg7TcVBRtB/uewn0dc++D/bg8IzF6rrzfPeEpd7vriw69DWUj9spEpzGd8ZdCthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6USLVkglsge8UC8kYymne0GcOeeocv2qEIY8Wr0HaY=;
 b=Gh8uQzLmaoCaXIgcKeQq+gqcdi3yHgRERtVtjgMEypd8tvzkhOCwji8cuHndkYgHOEcwgWQtkW+rtKX3hnbo6a4XXg7zuIpAoFosfjkJYoLBzrnPcTg/7IHCcgEhKA3JNpVJpi0MeduC3RSe6fCdFN53woUPTgMX6qkm9Cc9t66H2xnO9da+hnPsELjcp1kOqe1oUg/8eH3j+QpshLCcGNKe/I5M7zPUQ4TcarR3i4EaUEfqQqB+xdCA/rhreUkvQxcAtW7Awrb0JrEUd/1bPxCijhUqrO6Bd90J3x33tFuHGEsHPHv4ZzaHmKMMVS0xCgHr/8kbXHqkOqURGLHmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6USLVkglsge8UC8kYymne0GcOeeocv2qEIY8Wr0HaY=;
 b=IafeLQPx31hSAmmLO2Falam/nfRueklGCeHHip0hlt2/C+n/U6p6rCzy8JSzJnqboyGvMxE30lpI2PrUpZmcvnCURQ+sNEj13t/4QUSNZZ2JwIYdZzkfTkCxrzyG9azH/L6mqSWZA+5NKH33LdZ9wi9Dbc/xtdHqvKBpIaOcY5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8064.jpnprd01.prod.outlook.com
 (2603:1096:400:101::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 02:26:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 02:26:28 +0000
Message-ID: <874j5js7cb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to endpoint parsing
In-Reply-To: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Oct 2024 02:26:28 +0000
X-ClientProxiedBy: TYCPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:405:4::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: a37ea627-abf3-4646-14d8-08dce99c1cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E7YfgWAO3cKgHymfTDoCZZMobA8PzBlh0zUhiXO7ZDnKdypgTybHXeLbMq+v?=
 =?us-ascii?Q?Kia0N497ahEPS6gZ2ILCVQy0RleYlIAek8fNaleiK+4Gaubfm2dumU3ocRLA?=
 =?us-ascii?Q?KZEJXIk1mbUdRJF/KT15FmzPdrDIMfuuW3TvNU0JnCD9f2et4Lw5V9hsz5k9?=
 =?us-ascii?Q?xegrKf12fe0FD0xyg7e8mDLQL8qOMw7xBYh9uE2h7pgQLRdGKJ96PvYhjZdg?=
 =?us-ascii?Q?EaND1sNWqdsZ/kNYn1yTHHnjmi1nSEjb+pyRunLrKDa3Ne0cqwmLS7i9FwOi?=
 =?us-ascii?Q?8BYe0PHMfhiEz90FKLePFFPuLjhPQa7JzsVQ35iN7hLNxTRiDDSFDZnyyU1j?=
 =?us-ascii?Q?DzGxknHZc/+ByJiSxGuCqi3ZUGhOSpOuzqVr2znlHRKHocaQvVDsfMckhILH?=
 =?us-ascii?Q?yi9W38dnesrT97YEXIuX5n+oSOkQjSl+dd5Cq181ebZr59I9gBKAzgt+07/u?=
 =?us-ascii?Q?bQPWSdFJjIUOhDqDr5tnjHUpr/dsNgHQBIws/v42BEPNwEee+HpAMUYC6hVD?=
 =?us-ascii?Q?RWLYJbIPhrUivuHrPhbavjJjn4rXimZkHHchsumrJhNXXSdlp7aSzjUo1zmo?=
 =?us-ascii?Q?8LU++7LIN/XtkW51zaI+8OIfXWoy/ZcvNL3asH0pyYdl0Cd5OigWCaTaJCwW?=
 =?us-ascii?Q?FJIh77Y2eukhQGpYGgzHVc0kwyJbzwRiDMaBBQ36eVsODdTJ+FcWpOd7yUZs?=
 =?us-ascii?Q?FVKc92xY/RlslT1ilb7RQ5cwo1Mi8ULNxEqvY2TKq1ypMkwIc2nT/AQ+edWv?=
 =?us-ascii?Q?VUUmbl6ikTee5StWAqIbcf4aryMOA/SIV+WR2XFcXKv1/TeJnlr04y84NR40?=
 =?us-ascii?Q?WG8UMdNA62cpC5LZs84Pdf2K/kt1H3nwyhwgw2Y0Ba1v7hKnuhpLVzD/4hSx?=
 =?us-ascii?Q?Zq+JWo0gCxHF0ohmsMkiVS/gkxJzjUUshTksq3+8bJtYo6pohSzuD7To6r3E?=
 =?us-ascii?Q?HhA2HRSxgkHvQEemWVZyoSDtBnq2Y765lSZNs8M1N9H92CFwLF1cYQ3BIW1X?=
 =?us-ascii?Q?jZmpageffu+SRpVEhXSAUhXvauRD8NYDIpt25sNcVGCV789YnuymhEkAlVDL?=
 =?us-ascii?Q?ltkhodUza3m9oe8RF/FfP77tzxfwAItg5mcXmkIsnV+R5UVOA1BwEOlu2ZO6?=
 =?us-ascii?Q?qWLXtNeFxu53693wf6von/p+U3xXfWY7pczrgEWNuZ0fxHwZGOHXghKOPy1m?=
 =?us-ascii?Q?0v2XKNYFIAzxJp30vLINDFBjdGEdJ62MTmtazJt3cnbbdHZgRyHfG9Ixf5UZ?=
 =?us-ascii?Q?+bWiYgBfZUM1tJsJYwsDohIg51LYUnAZ/qWG6BLCZSD/VQiNzRgfgCbaXDRF?=
 =?us-ascii?Q?6S/Gq3krq7pFvhU9vUgTh10G/MVXNNnTbIPcZJyxypsNGg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MsHPDniI20b8bsIZkC1eGcxNcBUokfAeWFXFSeJ4PbxN/Kfx6utH9daWXiUH?=
 =?us-ascii?Q?zx8mVOFMOqYVNaJo9EnlskMssBkPHllp3Z9Nf4Pf3mFvpFQ4VBSieTHQ/b33?=
 =?us-ascii?Q?ftsF5ErQ90wgnJS47+EwAzcr/+TTASAgpnZLZrG+gtFyrm8cGTRn7Bgl2NfM?=
 =?us-ascii?Q?rN33LMY1r6PksN49CfBvEfcD/QdqpP65rIakVYmpFPqzJwIbhnq0M6xUK290?=
 =?us-ascii?Q?KvPr0/V9iaPUkQiP8r/0RyghBSHvxFr7IAnp13CGwCwwTC22hzH4qi0co4E1?=
 =?us-ascii?Q?dRYl+axMnqGUvxt8n5Z1uTzXjFiwtCkoDEVDkfq8IXIODejZqF4X6pUjm/MR?=
 =?us-ascii?Q?QK0pl4wnbelW1VtgjhUDF8KwAuwJFgVMeg7j/ZnVC7nfthTNI10XQMkPw5H1?=
 =?us-ascii?Q?V1pa6b4X+P/bIsGi8A/JZLslX+cwJnCmJgUNG3Y88+y/cShyWgIU+3dREeGL?=
 =?us-ascii?Q?eZy00TNjvkmlG6lPcUWeRYZRqLYVreMlnzggiqTkoD7rVwzJAA6XWbqAl/ny?=
 =?us-ascii?Q?SueCmH+LR/SpuOFYCJmP4PSfO73O/0Jr5FAMM+P2pOIIq5OkKlT685nMDRXB?=
 =?us-ascii?Q?f8r6hIQc0O2uGME53u3sLoHT0gllgMEYxzpb/VFFImJFXJK66yN0e0GAZPuR?=
 =?us-ascii?Q?9YfEp0B4PN1XWFkgW3xjhiMYOUX1whLU5fA06LXnuTQbHoZKJll824N4q8d/?=
 =?us-ascii?Q?yBMJeT5YvcKyYoWWnoBwwPfyNaXzrBLppZulDz4Fgjqhvk2udNBDGCJGwE+l?=
 =?us-ascii?Q?g0ktBMp687p/eS6A5pjsbmOZ043Ko7ahfDpBtNcGUYUvTWwK8/5CiAYle3uY?=
 =?us-ascii?Q?3oyINHBFqCXeRYldrWNaruCUkgyZ0qDRJ5dggVcTxQJ8hKTKS5oQEXdMiofS?=
 =?us-ascii?Q?fj5mLuBNEmA4kToSjqlUO089cSI+hIZ4jgAOrmluq8g9kN2f7fP1TgPePlaL?=
 =?us-ascii?Q?Jo6NahHAfndFd6M+fP+0aLSDggrQogXcqBdJ/nj1KpD8vtk24fbfVv2O6KTu?=
 =?us-ascii?Q?47FhOxtVNSiTys8pEaC9r2CqQK+uKg4mmwEkEaaINUQQCzdvnz0MME4Cgewe?=
 =?us-ascii?Q?K/DcDdZUhNS/JH7+MbKTtJwoQMyNXeABMxxdjSdQqfBcxGOw15O129xmum5q?=
 =?us-ascii?Q?gGdby3y0a4yJhwWXo5RpK09HtwthHK2lIsN2rs6CnpydWa2cXyWEb0z5WiBB?=
 =?us-ascii?Q?/jfCiZ5N1Q/10V7PIPop1XSxd1s3EcIQeRYct9jf0Fy7rKbxljWj/poiAR0F?=
 =?us-ascii?Q?IPzxHBBQAZZ9XDGYzYJMvp7DtIiciU8AYdwRf2VNwOFqylo0+YdiBYAD7I/E?=
 =?us-ascii?Q?ZvfRRisPToFGCQeTFR4uZjfxx3R08D3W471nOBn0AggCfCk4/ULCN+8c1XUW?=
 =?us-ascii?Q?JcUKEc7oySNL9d8L0Ihg+Lg0bnJif8hyBbmIA2HnvQSmFd/bbsDCFPq+Y7i9?=
 =?us-ascii?Q?kVapqrZ7xtXjDofFfOWnl0tOy0PpTxaOdoEbkdSz3iLxWYUjzGltGKvp3iuf?=
 =?us-ascii?Q?stuSSUhKFPrf7WifcQCZi2jUz3IVw+koqi2WBSeFZKQ1JrXiI9g/IGo6Oo4s?=
 =?us-ascii?Q?jFkhKbtd+pyMr2P7vfG4xox3eIs6eewvtIji5/oOPw3fAFSmMuJXxawHBeDT?=
 =?us-ascii?Q?EcaOXwMumXiMEzF5EoxYI4w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37ea627-abf3-4646-14d8-08dce99c1cb3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 02:26:28.6598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UF70nZXL2K4wf+mfIvpByP6ZI497WztLN0/Ao0l3T6o0ExGZo0sEPfKZYZ4F+sDvlAZfmHrkkxtxm+nD3p0VLP5cOvgFgnCESELwXKy/kWAf0JbTJE7VYVCKIY4Op2lS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8064


Hi

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the HiHope boards, we have a single port with a single endpoint defined
> as below:
> ....
>         rsnd_port: port {
>                 rsnd_endpoint: endpoint {
>                         remote-endpoint = <&dw_hdmi0_snd_in>;
> 
>                         dai-format = "i2s";
>                         bitclock-master = <&rsnd_endpoint>;
>                         frame-master = <&rsnd_endpoint>;
> 
>                         playback = <&ssi2>;
>                 };
>         };
> ....
> 
> With commit 547b02f74e4a ("ASoC: rsnd: enable multi Component support for
> Audio Graph Card/Card2"), support for multiple ports was added. This caused
> probe failures on HiHope boards, as the endpoint could not be retrieved due
> to incorrect device node pointers being used.
> 
> This patch fixes the issue by updating the `rsnd_dai_of_node()` and
> `rsnd_dai_probe()` functions to use the correct device node pointers based
> on the port names ('port' or 'ports'). It ensures that the endpoint is
> properly parsed for both single and multi-port configurations, restoring
> compatibility with HiHope boards.
> 
> Fixes: 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi Geert,
> I was intending to rename the sh folder to renesas, do you think that should be OK?
> Cheers, Prabhakar
> ---
>  sound/soc/sh/rcar/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> index 9784718a2b6f..eca5ce096e54 100644
> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -1281,7 +1281,9 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
>  		if (!of_node_name_eq(ports, "ports") &&
>  		    !of_node_name_eq(ports, "port"))
>  			continue;
> -		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
> +		priv->component_dais[i] =
> +			of_graph_get_endpoint_count(of_node_name_eq(ports, "ports") ?
> +						    ports : np);
>  		nr += priv->component_dais[i];
>  		i++;
>  		if (i >= RSND_MAX_COMPONENT) {
> @@ -1493,7 +1495,8 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
>  			if (!of_node_name_eq(ports, "ports") &&
>  			    !of_node_name_eq(ports, "port"))
>  				continue;
> -			for_each_endpoint_of_node(ports, dai_np) {
> +			for_each_endpoint_of_node(of_node_name_eq(ports, "ports") ?
> +						  ports : np, dai_np) {
>  				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
>  				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
>  					rdai = rsnd_rdai_get(priv, dai_i);

Ah, I had a plan to clean-up around here, but Of-Graph rejected the idea.
Indeed it will be issue if DT doesn't have "ports".
I would like to re-cleanup around here in the future.
But anyway, for this patch

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

