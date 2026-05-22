Return-Path: <linux-renesas-soc+bounces-33032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN96EKaqEGrKcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:12:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9821F5B948D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67B14301017A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D11379C22;
	Fri, 22 May 2026 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CSQlT28g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672FB2BF3F4;
	Fri, 22 May 2026 19:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477090; cv=fail; b=FMCDl+5JTQMlTAYYMuXAc7bF+dZlUcFvk8frPBitlBjVGwHnM9n7g8JE60pWi/FZpQ4LCR46x7AE8MPqxOecemgMCqcMf2jlJdw1KvhowF14I5b+NufrkboO6HULwt9nnbDB5Y72YqkuQXZqJO8K3zM1+eq2EItZMCPXfEJDPaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477090; c=relaxed/simple;
	bh=q7F+Nvr33OR/t5GsI37Z8quC4TPkCueL5RW7kdFOlRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fRZIfFyUtlt9PwoOmYnMICftIJd+hRiIeyyyK2g9Kr4VXzMyUxnS7g131Oa+0mT4kSzSCe1vL1Lmy3t6xbaSNWC8NRHm1hTC3+BCeiMKRlU5hXV+aE3tTD2jqd1BLcvsylHupB4qMnEJmCCBkX3x/KF04Pov8l/bM1adm4kGgYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CSQlT28g; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ih29QXDvM2iD7+WHTTBquSQzUoP+AGGILnfts+5p6cYDG1ANWt4K9L93lMAEKC3K1438tO7WK/JJQuuklJyYESDk7Q5x41qnJsHtCYNNwn+1OCbFu9WvtiKmqtC4GyeJkSe0oycC0CqYm8RJMHKagomns4Fv08rFt01KG+OBB/XCrZwx4iV5HwsMyiECSPcTUltzULg25B0Vpyte0Jduceq8yIv8N/15YrfA2KrWX5StL0kEy2MRs7YFtSfSBkvAFzV4IPEN4HvGwNSH9ng2iIQpiuw651g/95K3nnEA8JZNCOEuHNB64bZqTTheW42uX4ITmumbsoevKo+aObbvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbncGWTYuVAT+iZMRao8S3m9b2JF9eQyAAb3VM8KmqQ=;
 b=bQhZA6tdHY+2bXg9QzCZJCT4IaLa8MzfNTRKznoPoYTSFCAdRu8M4dbF8pn/WfMzNiarUTz+fJWNtdKrh3axxQtM48aY8bgfipj+zwc4FasAcbrGMNhLiD9/lPeWgBsHZqs8OiV90GX//Lq1Qyb59nmT48oy35IfpAWXO+8yuk0Gx8zsXDXskTlrtiviQfhhje+WwkBGUVyuZe/SaxaEdLESHBaiob/hKXuAuMNAmNRIm0sCMd8CNJkMwXN99vwQxpJAqfFMSj3lbWL341ZE92Vmz370s1sxj6zxzs0mRwxNE2w0irjsWeODyyzy1X2KOHz4ufWZrJ9EXlMFxovBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbncGWTYuVAT+iZMRao8S3m9b2JF9eQyAAb3VM8KmqQ=;
 b=CSQlT28gFKQ3nQT+NBSfSmZx8jVXriE8yzC0uJs/4sThWJRTaIaq3uMx1HbiU3NM4k7rJbJio8shmuCCyYeIZrJuKwy+mVWNbchY/CFKnYSXh6EKifAD16ZCeQL95r31S3aHEkDo/yxU5QwKyWTnQTmbiZj9Z+9LDkZjbTgfZC02P3TXWU5G509C5Ve0Qk+ayQFEDJCbwb1NKndwFpJUyk5jb8DvhQwBisvNtydHU4liLiA4dF5iWH7K8vNb8Y9tQGmi7A4Bb1c2/iJq/qunSLOQpEiQNtbHLWN5wVTy3Gf/iikYJdyY8Ofj/NcWiYB9w/LzC4gXdQMZrZWivHoVRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10300.eurprd04.prod.outlook.com (2603:10a6:800:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:11:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:11:26 +0000
Date: Fri, 22 May 2026 15:11:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 04/17] i3c: renesas: Follow the reset deassert order used
 in probe
Message-ID: <ahCqWABV7Li4ZqSq@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-5-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-5-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SA9PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:21::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10300:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae73f12-d92c-44bf-ed3d-08deb835ebad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|22082099003|56012099003|18002099003|38350700014|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Xl22BjtownezqfADzI2bDJMTqEhBkla4nBnwCBIg0beZktTp8GDbwWkJCzf3A1m/LtQ0XuGEt+g7zNtKbvPP8fm1mdR+0iKMtK7MoOW54hBi3xSMKYq/D97DLRnv6ET0fChX8CfplUjusLzgFTFou/B7hL5g+fXEQHLJ58xwi1ZBdhI8pZg5joqJWfWFpJ8PI6LgGsjIWZ4RUEt1HB688PZn5doaCmGwAXKzCIa8xenZuBKUQsn9jM8jnVvuoBIsqu+j8gHFwouirr0jDarzI5UIzuywFVk0ebfcjgsEo8jy24qjK/44rXvzL82TLMrs2w8u9cjh/TD2pEBfDNthQtV78//26CBwSEuk5ef3mkozvUeuLmfhSXTXrO60TiibtvJwqTfyHqoD3pFJzuRlUvynCMnEqw+SbE4IJv8rMp7GxRH7BTKF7hglluyJBPhkBIdHGVztRuehvrHVtok6OEJYNF3GkuVfKqjO3ShKkxqrglT2G4h4OYxmrvIERrbye4lvQc5YOBYBBB/rOQS6JM6Trsto/XS3Wvxb67JPeWajOdSe5LfzmPgomExXLATwfk91MaQlkjnaT4tKkSRR8Ady4V/MqowU4KTM7TwwkER61aOEHjdLfVbKWToe1LpwN2dMDKCvWLfUsskLrxX3UJXjoDyocasZSNumoX3f0KCNkqjm6d25czXltRnL2meroNtlXcbmfVS9ZtmLljVpPfLBCNJ9ueXDPuKbMtckV07bIhUN2cgBgGRDzVPuJokZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(22082099003)(56012099003)(18002099003)(38350700014)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IohoBjhc2ftW9HbJCeVJ+XnGufaNOdgiI4rhTflvHUTcLvBGkEYVu2PV0c8+?=
 =?us-ascii?Q?SvkbSiw4j8bcAP6sXkzzoKdxOkI21Au9/KRVw2QToB4884z5QjJGUkZ2uAVZ?=
 =?us-ascii?Q?0YKEZYynceMxK9Uv1wMBewgAUSC3PqFVaBHDKc27roSfehPvSpUD2P2UO8bg?=
 =?us-ascii?Q?gDHClXMJyJ3N8oGYOK5VeTF5ldNwbIj8X2xeXuLm8ghKghGXJDIYdFaA4wnM?=
 =?us-ascii?Q?QaSpHnoJrI9a6GsRsm8hnt/bpX+oxXo/+l8ql/ztiBSMIp6+d8EqOE1K2Tq7?=
 =?us-ascii?Q?hO6GgyR7aTJUhWQy13txxWnx7MMXkrochTlBG2flDhX/uPCAiCYeNa3Qxf0j?=
 =?us-ascii?Q?D+gHeZG9f8w0Vu+h8nAQ90repb0jYFwxSpbPPqHlbNY0A09fsHQZF2TO2m03?=
 =?us-ascii?Q?N1iYTi3V7MC1LlhfMq0vDYNBUOef9M1FEzf7HIc4AoGUxwBwRjJ+7ryEAJTN?=
 =?us-ascii?Q?UBqOpiA2LOlHcFWzE7Mv27z5RUqwgII+wzPUU49VD2cbGkAeuG87AzsjsO0u?=
 =?us-ascii?Q?rcWs99W95iqjOz+xXluWJclkdV4gsfXQtYOqJrhpwlXtS7lM+mKCKRsHimkx?=
 =?us-ascii?Q?5GCnSVKGmW/Skm3znY4HGibFwaPyT+J7HZOzgb7SFygHAvMp3vhUz7DewOaH?=
 =?us-ascii?Q?B1NNu5Z22mFynvXR5bu4CX2B1+5caJaNUNFlTXLAWBOU2EWz+MD7pCTcvE6P?=
 =?us-ascii?Q?XaRz0cBLERgmfIMHvteokCoEnctEjaS0gjtOYEy5/wamlAyncWJBeYuwvmWw?=
 =?us-ascii?Q?Mbrzvx/DSrR7qyNfHizL/lXMU8EhCTd1eaVOC0zU2pbf0ISZ2yEqUdQtWVsv?=
 =?us-ascii?Q?3cib29YvgBYnLUZP4AiSYyZLNtrYHR1yfcNAw9hPw5X5C6qXqg0yNvC+5ATe?=
 =?us-ascii?Q?1mS4769Luty/sxWU3WXzguW/u4NPJuk6QxB4JvzRyN+sHvm51KKy4zgHTVaD?=
 =?us-ascii?Q?gX0cgA/y5keJyQISF55wkk87TgxecbVbDpHi7K65kINyDR3NdMHhuye5ci3D?=
 =?us-ascii?Q?oCOuQU5xTHYwJje8U62ce/+tJBHYMi13HHUJailowUkuxAZ6mQ9pIr3hOmIq?=
 =?us-ascii?Q?RN3dfkoijT4PoLZFWSNCDvNh16feWl32p9eaHMTwn4woyZis2WbC1mUcRKCt?=
 =?us-ascii?Q?XFd3mMoRNeSKuwpCGvy4Ns+5LQucwOhjCU11DgaYWJ25mrH52qGVJMOSuJCh?=
 =?us-ascii?Q?qZblCRK13Vh+PLQGO+tYlUs9XU8l9amHIDecdw1nEH3sEGwtMjuZ7RsUaNVE?=
 =?us-ascii?Q?r2C2l3KuVgQRwSJWzT5yXlmyjkXuSHGLlIfnco9thO9DT6l31vrIN+W9JM30?=
 =?us-ascii?Q?5QHRZhI+ywiern/kK0BvGYpN+eWH1sQiWbpz/Lc2p5nG/G7xtqX9HgB+IMTU?=
 =?us-ascii?Q?Rs/XOi4PzjyEZL4RujbuAY8y15OOhLckwsWbZ9LZWos+ki7KOS5uKIZmkszk?=
 =?us-ascii?Q?8VZai9dLo+8/cEyIXTCB3oCz/A4LTus4R7KeO9oi1V25BS61yPxfslZlEgR0?=
 =?us-ascii?Q?jpF+V0opZY0R82xcyeVXWsFVWbXy4mTbT6j127pwUz+TLvpEsO6jgZAQkjlZ?=
 =?us-ascii?Q?T+SDS5+tpUGtNugCT/R2/WDk+o3teHr2fycmuMJ63PgH1nLTFeuLIp7ta56g?=
 =?us-ascii?Q?dM81acWmOgMp0uIN2B8oi3RsimQkJEKwAvlfM8uN08AlTATDTN8AiG22komr?=
 =?us-ascii?Q?99ty9vQBv1GRdd1xcRwBhntN1/FoVk3CECvc26OJL0mSqh6k6DOtY9Nqk62l?=
 =?us-ascii?Q?9odmyw9AFw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae73f12-d92c-44bf-ed3d-08deb835ebad
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:11:26.1180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ym+AtHqts58qJq2Z3FE5pfRRLWcFsenS/YmzkPP4E6GfVz/fh+SU16h7MAWwmgYxL1nNGK8svI3l1+aHMC3wHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10300
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33032-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 9821F5B948D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:02PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use the same reset deassert order in the resume and probe paths to avoid
> potential failures due to ordering differences.
>
> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 6c23f956ad2a..d2f29ed0b6ed 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1434,17 +1434,17 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
>  	int i, ret;
>
> -	ret = reset_control_deassert(i3c->presetn);
> +	ret = reset_control_deassert(i3c->tresetn);
>  	if (ret)
>  		return ret;
>
> -	ret = reset_control_deassert(i3c->tresetn);
> +	ret = reset_control_deassert(i3c->presetn);
>  	if (ret)
> -		goto err_presetn;
> +		goto err_tresetn;
>
>  	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
>  	if (ret)
> -		goto err_tresetn;
> +		goto err_presetn;
>
>  	/* Re-store I3C registers value. */
>  	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
> @@ -1465,10 +1465,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>
>  	return 0;
>
> -err_tresetn:
> -	reset_control_assert(i3c->tresetn);
>  err_presetn:
>  	reset_control_assert(i3c->presetn);
> +err_tresetn:
> +	reset_control_assert(i3c->tresetn);
>  	return ret;
>  }
>
> --
> 2.43.0
>

