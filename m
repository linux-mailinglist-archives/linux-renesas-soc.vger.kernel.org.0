Return-Path: <linux-renesas-soc+bounces-30806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDt3CY0Sz2nXsgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:06:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8138FD0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0570A3018BE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C050264614;
	Fri,  3 Apr 2026 01:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dYRauVUn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54523909F;
	Fri,  3 Apr 2026 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775178378; cv=fail; b=W625nsa9OZVBEgAhPjClcYEFdyPIgE/GVTHJbVYj0andekonwIRs5z7dcS2rS6GENcsrt+JODL2PkQpcyeQjCVbTFJ+5g9KcVpiABIZggmca9ux5jaKTBMY47RK/5qpBlDIgrCe+VJmmSUMjypmX7ghwX034XW82HSuzoAY5YGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775178378; c=relaxed/simple;
	bh=1Tk2nc42xBVJsiHfQlEIGLB6pW2hSqej65ieCMrFm7o=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FcCxnNtbURnhAOPUG0KcD06DYiH8/+/+x+rwEjquvwin/elI2jMX/CIYjEn/zUAkPjcEM5tBDOGIU/sXVnq/xlKDkCH4WCkbaNVffLGXLvT0ofTAfG7dq3IAd6K6VUADK48DJylgGIY+7skmlllMKoBdsUkkKxdsNaUnSNluIbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dYRauVUn; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xH/G35nIttCc03QtLDiBJFjbmGEzUWu+cGyGy1bc2Jd712PuAYDZSZrq59BiOyQM8caTgRBXtnSFeeK2a0SVmJQFlsnaREunw154zdUNLD2rUXY10f9uKCDHsC38Bw3b1Tzn3VWQRRJgBz7chNMp74WkP4dsgEPaiW7imdrv+sjQNuLyUIMdpMeGWZZdSAnE5uoeKQXhoy1hygIAPPAa5GuyDq3qx3jcGx8PgMxiQDs1pTg7/6GjLy0ns0y5idDlTYDWbd6kcC3vHXceVoe/1eu6FnHlyh137I5UR92r2mlZB2knfE4MSFZLbM2/heA20BnvRJKJTUoKoI4kwAhxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VVGZ2YzeuXoohzH9kAU+YBFqr9qTjTiVTGPqVoR2Yg=;
 b=AC6W2QZT+GAEmEnBFjP/X0wmfFrCw+TFQRn9azi5w9P+qAvy0VEsDZAmIDXIodP9QSrgSwtMxXWYlzz3JHieZctPYrXDwQYTkbsEwyEuWJUxgvp2mbu7NR86qM7YFkB5ZzduQHNs/sWKtZYGc2eyonRh7Fc/Kdp9wCTxECiRzwkRPzL59LFAyK67E/H2cbz3LWBcFTT8OngXbXr+eZTgd+bUdX/pt9GuYFRCCRJSd7rs81HfHcDbn/8EN2eguQ3i5W4pMFB+fD2WthXtVW3LdvQyO2wAXTWH33xNbTiFFU3jWwYMmyCYZ6IhQUJpSltMy4Lh/PZE4wiS3daU5rGttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VVGZ2YzeuXoohzH9kAU+YBFqr9qTjTiVTGPqVoR2Yg=;
 b=dYRauVUnu9DLOUMvOz72XMeBxBnLNU2/OTp2fjkinomLBokDrlOYf7zjNlk02FUB7k68x5SBV2dVUvGrMS3Vv2xiM45E1Lq/4MvitVoDAU3IQzsT9VWvQ4cQ0geEdZL+HwgXDzP4I4Ihe4NkQ6Co7iYlsi0xBVWryjjRYXoAmo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYVPR01MB10798.jpnprd01.prod.outlook.com (2603:1096:400:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 01:06:13 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:06:13 +0000
Message-ID: <87o6k0g8e3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCh v3 05/14] ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
In-Reply-To: <20260402162436.12059-6-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-6-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:06:13 +0000
X-ClientProxiedBy: TYWPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYVPR01MB10798:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c62a511-85c0-468c-67de-08de911d332c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Wu3mFetdMVh34VlHCCngycMWulOM+xtd+jgCrkesePDFo7ZuEkoYmMsHDAgLkR79OcNpT/HBD0ecdipr/vGptPlSuRgWA0w/Ms/ffvsJjJQriQlF6pS91jMykXlfm/hNS42O+8gXdGJ2Bl+TT0TTeKz8NXedPR4lPwldWNXDvOUIhxAh/ohoFwsY2NfVEA96+tnW+ZHIlHpZ/VrQ8E61xL7NjF47oNIZ/16CB/+h0+Vr+wy+vJibEPb9xGnvcHSwY8a6YYUMwWQEMDNkS9rBC0tFdCeVJHsOHtySmuZromPsQScTUUjFdNe+ZV5zPVaOuh+LIserKFOr73pw+OOseGX6md8u7X8PgkYg39Uexvj1qS3wSMtCrt6TDzu82nj1CndT/D8TIk/t7pfZUCXgznmf6kI+O8D6Rvj6/T1AUqCimWgvl0bJtigctMz/9MV4jrHnc6uegDzHoYdemmGzPJCX2iryOENbwaOXqg86ROUB5iVYOruA7cv1Fp6rSL7pmyqt/bJEh7aq1thhhVS9sf5iLI+0rFxSSeaLSRqa4Dtlb3gVLZ1Jb8D349n7L+uSgWH/pd8Ae3Yse2V7pPoj6OpI44FfTKcFmaFDxwdOkouBQVWUM25XY6sYcrfTkchkxeq6j2JUjf0xg9iNv72CI1c6HgaJSbG1LW7NJXcPwZo3CnXip8TNX/2OQ2FP7oP6TmpibJgCw1W9fctxvXqVgxAuPTVO0hFuU0WziBKlxpl1FG0up09jlN9MFmGPioiAwI0+xD88uQwwT+xce48zuNNlyLuHiM3krRDX5xmBW4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ecjkyr0uwHHIhq7LXHlKp6LtCTD8LqyoT15UIPpfXJiShB1g9XVckKebjBiZ?=
 =?us-ascii?Q?o+sWeKlZgjpwj99zE3dPKzD4uBeLZHQoc2+UsiXmds2Ilb6oEmJvHvHgZcd6?=
 =?us-ascii?Q?RfgX03BMEg6lVY7q2LLw9OoEQ/c9rrfCXEk0AhTRcvWF1KjkFdFNOod3390J?=
 =?us-ascii?Q?dgJOpVGjyQm8AeM8IsE9TdbWzlRA8tXokMCeviGxG9PL6BPS9iCGOdGP9VS1?=
 =?us-ascii?Q?CuAnbXq1SuygGEWFyeWAI2bcSztWgHmkWAoiTxXxrKXeCgpGBcyT3rM7DF9v?=
 =?us-ascii?Q?oo2A2dbBGHwMrRUQOAcMrwEzJFh/vrnf7Z7HJW3H6G3eS6T8WnOjVqAdxtPT?=
 =?us-ascii?Q?E15wRgh7WfLhpJK4nfStbtIgFEcbfjEMxQc89At5emU7pnFYSzQYZIdR3mug?=
 =?us-ascii?Q?kE4PT6WuUieHywpTBEr1i1yQ3b4JWXHTD++amYZt6aBe61w17yXIf8DswyaO?=
 =?us-ascii?Q?ttb/bE3tKWvrvmVED9KS00oMQRqzWlLwpY6X8X9sNnLzb633IFhyZcUYrrHx?=
 =?us-ascii?Q?6PruHZ7ECnzv0GFlLKcMDV9RxM8VNQx4TqY7hZgpR+X3LMpzJbeqddlCE4fR?=
 =?us-ascii?Q?N4SQ5R70akpe/hsjV5bV+FwoheC/3zWo+YWyXbyY6oRNKSGnFjFSinY41nRJ?=
 =?us-ascii?Q?7flfxjKeoFMNVIgWodbO10f03Ypq2yo7mbxfIg+bcqkscRoWc+8GZsxpLrqi?=
 =?us-ascii?Q?OGtMW12o76r4VobPs/POwSrlm4Pi45u+EQ2+RpKd0a0vkQlJtZpEDzniNqdS?=
 =?us-ascii?Q?VLl0NBloR/39qeuhv342al5dDsF85w5bXA6MkM1oE0UdHm5YRHAc/Jy2xh6n?=
 =?us-ascii?Q?h1UuytUFIrUD3H96yGGj6Bg03BkP4BXlj1Nn2UJ7bMwW+BtBs5PMn8VOXwOa?=
 =?us-ascii?Q?RuzOrvaruGxl601xpbj9tQbvGrufthbuSesn2RHCf9GmaQbOOrxQNr3XmRGQ?=
 =?us-ascii?Q?Ba7pSS+yazWLr7v8bOBd98jaarn87ejmbDxpfM5aVPi0zC8My7UqBOkXwrUa?=
 =?us-ascii?Q?GS2RQnH/Dj/6iDyN6xcTvUATmygBIGOL1RK62RxtMbF22TXYJ9rsR5f20QDz?=
 =?us-ascii?Q?0kPeAWJTfkxDroEaoke4X8GatYnaLR06R4Vbfy+tAZX4PGR6qaZIOlr2uH0M?=
 =?us-ascii?Q?NfzsI0Ta7OGo1gVcClt7pLIRq6Zv1iLtDdOzY+L0Xj0xb7z01yxmap4/oE3R?=
 =?us-ascii?Q?96bvd34US3fazq2y+k8S33hhqvxhnURzN1srKAL0MvYRi6ZTz4Ad0PTQmwg4?=
 =?us-ascii?Q?sBB6Bu2qjfcAzem7gfpGmD52sUNDqjFAg/Hnj8HNmDoNXJeLNLL0MBJaojQi?=
 =?us-ascii?Q?r88ucTOfwmunJocaJ1toLIlyRdmYYgqWKs1rbLrDxhIXIOLhYqUaqW4O7c14?=
 =?us-ascii?Q?iLQBK2NOU9cQGjXVXgAKehBIAy5eSZAMAQabp6P7ij/vevtuLJZzUakzO+Vj?=
 =?us-ascii?Q?szWGTAMiz/MeEQjHtPRq+Njinh8K2rWrQlaHQ4DoHxcMd3hv1I4Wg/SMICAi?=
 =?us-ascii?Q?p6NIU3y5EETBr3a/AKKt1WpAsf8I6jt57WhAViyAfhJ1aWZZnqUTVojERgSp?=
 =?us-ascii?Q?QAXnlz+fULnZ0+nYOIaezYCM6IMHQgH0IlQuVn3nuDJ6TfR/2A8MyCOGHQl/?=
 =?us-ascii?Q?oWqo/D1k/6qjd0crLU3HIUoA7jTb+2HFPfjONwUJNmE5hyzkdAWtkYjtIM6w?=
 =?us-ascii?Q?XHlRYKLkAjtXeLpJVznmnPlX1k0+twJSxjamOgyoMyQRSh02cHp7PXL5lzVF?=
 =?us-ascii?Q?W0a/Ut0FuRg9vs4V8Imt28yEv23jDLlP+5tKcGBA1uCR380XlnO3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c62a511-85c0-468c-67de-08de911d332c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:06:13.3051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgKMHqZnb3XDbfwewPkQdwsDTUeMsSIG0bjZkj1tAupXW8iJQNy+hI5ayzbyiG4eE3B+y6DgMY+gyR9v8YDfFChEVVho6CDvRAWa2tf35vZDtMJLbbDeGobzpByRWN2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10798
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30806-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 79D8138FD0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

Thank you for your patch

> RZ/G3E requires additional audmapp clock and reset lines for
> Audio DMA-PP operation.
> 
> Add global audmacpp clock/reset management in rsnd_dma_probe()
> using optional APIs to remain transparent to other platforms.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> --- a/sound/soc/renesas/rcar/rsnd.h
> +++ b/sound/soc/renesas/rcar/rsnd.h
> @@ -623,6 +623,13 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
>  struct rsnd_priv {
>  
>  	struct platform_device *pdev;
> +
> +	/*
> +	 * below value will be filled on rsnd_dma_probe()
> +	 */
> +	struct clk *audmapp_clk;
> +	struct reset_control *audmapp_rstc;

I think it is DMA specific.
I think we can move it to struct rsnd_dma, instead of in rsnd_priv ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

