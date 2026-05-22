Return-Path: <linux-renesas-soc+bounces-33043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE0uECS1EGoUcwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:57:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A965B9C26
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 918BC300FEF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF88F37DE8D;
	Fri, 22 May 2026 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R5NwjIcv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E322ACEB;
	Fri, 22 May 2026 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479521; cv=fail; b=RJw/kU4xv7AkIQE6GPMHp4lUYffIfvS15gNzpvopcl/IHuGAkvc/Iyn7ui6FS8UlIGDYZma9aguNJAvAynN4bI3Xfu9RytAzxk8hLtxIumvDFLeOt0VOh2jXH092rYiGT5ZiieoFPd7i6EmWNL3U7lTFAoq0M6r6uCBs4rEA/qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479521; c=relaxed/simple;
	bh=mER3dG/YMxTpvgwRxkJ6j7HL9tmSdFG1seZC9f8is3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KUwxr8M54sr3M9ckuNKQSnpc0cxGKGTjEqHcWv/xmf5RQgkJ1XzKmCVGUcaetUT+YNLpODquYS4hYbV1B2NWJDdWXDIt7MF4S27s4sLS3YsrL1ZOilkPS2iHZOcQMF0heF88E5IVXieit75d8nKaTPHGZrYYjn5IvdECars3mqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R5NwjIcv; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/4eO955y9SHw1J5kyFzfk2bewE6dJkWhDQ/BAvsLtCtI6Nl3Ivqby2JM2zYO6tuOkhI6D84PplJ4WB+0R3o6Saedc0DHvlFjnKnatwx7qEiSiu3YaK+/jt1WTjrzhh/s2/u9tGxZhrKypBrsWhSJdCCUtfCOYpH2HcxBibeBsho//1GyOHtCs49HrIudtFSZCASL2seOwuVfuzEyWj+ENJ4sdYe/6QF4n8+aCvZGYqisBUm6ZVWsfY9nMf2wo6GpxCVr5hXThdQP6J2T4sOBuWIWbHP8DRk+idTw8L5ag00RMYRMDknWH1vFezn8sfBBV0WASBe7d3Pyei7MI40Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GILfI3anGHlRwzK+89ntv/NL592uOeivN2QuJLiC+5A=;
 b=nVG+bmhMYnJeqAu5I6cdSOtQHQlLigIj+5A1pArtLfrswO0eMSJHKPNzJUrts30xMB0SgRySrYu94Pbn2HzkdUN/fSKt6iRozchSaXQoe1BSmOZKV3jKQ1OpPxxyr68mZr94M6O+kBLSewKx8LTqMsCP5Nn/LthyieVRSXuyl8sFQC6+ixrgvR1fumfa6pQteWyzhbJqj0F9n+BX+kF0vWsdv+BLEULWIf3cQsvXfzsBUCqy9wU7GY1/itoRo+7LqvyYhaLxShp+d80xOeez84dLj2DN3cnwl8sTJmr36m2sZB9pbcriEHWbj+Hnkbk4BdTSt66/B4/126ugA+bK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GILfI3anGHlRwzK+89ntv/NL592uOeivN2QuJLiC+5A=;
 b=R5NwjIcv3W7N60sB9Vvykgw4CvtRPcYqokoBJnFZfAtBTsOkT4u2MxC81Ypt5/jd0DLaqnkqDT92xqN9vAKs4UgvQp1KA80L7pYD6/xdEf8+qXP0chjrLcHcRXdkXTE8QRp1g66MVvT5sBeP0tgG4buRrOdfrDVIK821OC9SwNVvS4cJjBUKaWRbFoMBSxKXy+YTuCmEUAAIGaFP+kbOkbHK7B/BaaZ6qdDASy60jLK1NS/4U+2CgcXYhcGXc3Hq2S+YDPpOt3OuLUHcTmRJu38JSdwzc05mxMg4tIPrGa9VK00LTBFc/xx/zk/9cq3FEbkuIhhUG3/7Hy6sSnfx0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9906.eurprd04.prod.outlook.com (2603:10a6:800:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:51:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:51:55 +0000
Date: Fri, 22 May 2026 15:51:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 15/17] i3c: renesas: Use the "dev_name:irq_name" format
 for the interrupt name
Message-ID: <ahCz1ExvmaSfwizc@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-16-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-16-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH7PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:510:324::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9906:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a6756c-bec7-44f6-6570-08deb83b9397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003|11063799006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Y3d3hGBi2QRKlUptJeo4fWOD1rNASyBKlNMBnHNlDG0vQKl/fBqK/tUmpnPLbJl7W+paIEdcwALlpirT0Cco23d9ml+oPzhQQuS+uNWKjArDMJiq4dcMeXkAse/fxr5bTRkpRcixR7Isvb1s9Sk2GtTjmGKZgAmh56VhoW3AXSXNkVdlUwFqrU9hh3IE5SdO4S4xwqWvukxi48jPLWvEzhYLSOzPcpVJwr+70I5YDmu8amjUeuv4ow+rsgdaD3/gP38L0AADf55Tjvydk7qnfj5fsnZM9xaBXbvdEvTp+pHW3Ghvri8y2dAawHVkDLiCRvkpu5SHxR+nxdKJC6c19Hr+77wBeCYwV0TOBKWprGuy7aAh1LoNu0uPwcsa3NhHVH/S/09COaYY1dbSQ8/k/mgn7Xo1GwfIOODUAi2NFaUaxR4aJfkAh5jWgvrIDV9wb16vMEscthmg04URhfdslc+JqrLJLXw+sMMyZRAkLu44ofUbsuI1xw5JGYwlEya/27pSj4JTQWaD6ID4RCRWCFHdoWc1GG6likOeDTVurflzKzm7vq6rfLeKDfdi3+/owbNdWtAJ8gKH8vig+/ArDADuXIOYvnFlfsdgOCAuxg03BkAoOizdrV1Yqv7X1PWCz6rlqNWPS//j01Dqz8au3Hid39NKsbiODUq7EvnvmNuYCarMEMHdx1BlnH9AM5x90ZQxGq2EjHn19Kylc65d4W3yxjDr78MpEUZSHXvG4sokHCTE0xvZ4wwIAiYVyWOE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(11063799006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ki7lHgHXXHQ1w2qYC685lhJ1QW+qyrw72V1MA5Z588IxQFnycxlQ82tND0mV?=
 =?us-ascii?Q?/7wypOH091ACtFW6yMnuc/c9/XTrJpVUH61fdnBd0vaXUrrHewtn8mZRgk3K?=
 =?us-ascii?Q?EaefFy3dzAYQeyGYJ9DduPDEyY+m487fF/QKK7kmBg8rgBTawEpdOIEQY5my?=
 =?us-ascii?Q?5CBFCTq0TO6mlhMgbXwsznAlYSfF15aisq9Sqn3ZmxWClYkYT27/CJssoN76?=
 =?us-ascii?Q?ce+CcUWGPmbnrR+SJN68LVkWZrFSXYiWzxfp/gaUIX+UOG+CaqB5+m/+piz2?=
 =?us-ascii?Q?AogRo/oJrFljMVqDS2/BFhfx9su6PN5nVuSz0/9SpPw1qey9WTffH5O7lL2p?=
 =?us-ascii?Q?kf0kfVAS5gA8aGVcchmfAaxXs7TpG9Ad9Q85A15X3mY0Kpfo9WMjOZd5cG/z?=
 =?us-ascii?Q?vr1ltv45r5CoME7Oe+mY8NZ+l5/KaHn3JRPmbb46gjZBgcBcQNtBsDm6s0uM?=
 =?us-ascii?Q?/5wKFxg2MJcJlm38n2oYnAOaqe5sfjRU4oU9ADw96S+lOegjyNS0W15hirJ0?=
 =?us-ascii?Q?JHxRrpu/Urn4XiSecvUh6ZfasnsonGOOgXwWjoSTCEiwelIneGXjFuBlPP6Y?=
 =?us-ascii?Q?FemwCIWeaeVPUvN49CAtr905SHltA4espF1MHX3An8rKM6sfGWb9DE84I7Hn?=
 =?us-ascii?Q?MY4c9C/oNjlzltY5SK3u2EysPdZI7KpAktguVqUpIzTR7nEdcMY/08+SWjCf?=
 =?us-ascii?Q?B67CZpo3xQJSZWophslFt3mXXzbuTz4/tYGL7hpJppihIOuJINaEOTrys6hX?=
 =?us-ascii?Q?TxB0+H2fUqPffpAojC2lzWscZYJWlgau1iCWKmuvK5rIlgrLqZYaFGhaDG53?=
 =?us-ascii?Q?Udv6UOfTMokh0Z4Hn0bUXJUlagTB7hcF4Ciua70LvuUhDcAnyB7Rn2pX/h7y?=
 =?us-ascii?Q?kBO9TFTBBTHI9D8w6IawUPLC6GuHqoDI/41bAozkCV4bp2GstBUJsAgZQlBa?=
 =?us-ascii?Q?JvyK3MVckikYLjDf17pIIfDJxrixbxkeBu7T+UtUdPTfQCVhH8ti5cU+MPnB?=
 =?us-ascii?Q?VmQH408Fj23SCOYildCszK+OE34oXkt47awWUpp28U20rQJ+E4p9beS/WM1P?=
 =?us-ascii?Q?NK0+vUH3WtGA3aacjGmrUFUVIu1JrMd6qvsfbBM8cJDkTXmSIuMWoQTV7/iX?=
 =?us-ascii?Q?RMpVAt3iuZwEwjpuXzC3f76DlUiBFvHjVjWtWXmUINHaZ+kKDIdEfi1/YvfO?=
 =?us-ascii?Q?TNIkqIEEOFtP3V8LSYMdHCafUhRST1T2O6Esxy/l4Tox/15AnPeFrc5FfI1F?=
 =?us-ascii?Q?ACwU6whT9QWFgmH5lqg5hiF1guIim4RS9bcmDkgnJnnnIJ6ZCWU3kzJzi7Um?=
 =?us-ascii?Q?zeBZipL8rwzGxAJ/ZFdEAU0xH+zNX5uqBdHboVOq20iH0qy1DyNWoW3eeTI0?=
 =?us-ascii?Q?C29yTgHrlb9H015XniidVBBfapCK4jXO0NtnLwFmRH9RwdRbL0UMJP9KpD/v?=
 =?us-ascii?Q?okZVcKd4NtJ6NYBN47BtLELfZdIgYHPH+waevDLIZYeq2C3+ZgmNgakyEeTj?=
 =?us-ascii?Q?FVQg0a9Pu7trFiDMT7y7WFI+s7C7+DmVdWPgt22d6pfYO53fq1xNcfyuDpZk?=
 =?us-ascii?Q?58wIr0C9WWVCdGn40VxNLQtFoc14Laeu+G5LbNCNBzuLX5rXvoXjF7eVHWna?=
 =?us-ascii?Q?Y147nxdFZuwCeg7jLwsXXKIalzetrvseg6G+pDP23Vf1yYGGxlllWp6Cbt3G?=
 =?us-ascii?Q?pr7zLxwh2cTgKkB8u6uNTCZVJa50hansGyK/ahc3HO+JmdOHYBU4RgfoK2bT?=
 =?us-ascii?Q?HwShfJDh6A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a6756c-bec7-44f6-6570-08deb83b9397
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:51:55.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugk7Rn0HDQRY94K+8eXTOQSL/mLPWGgnzZAVZZ/bb291dv5b7a931faUOoco9cqGToe7zuUWl+TfkSSyoPv7hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9906
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33043-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B0A965B9C26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:13PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use the "dev_name:irq_name" format for the interrupt names. This makes it
> easier to identify interrupts in systems where multiple devices may request
> interrupts with the same name.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 5614ed99553c..e6e05ac03082 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1385,12 +1385,19 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  		return ret;
>
>  	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
> +		const char *irqname;
> +
>  		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
>  		if (ret < 0)
>  			return ret;
>
> +		irqname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s:%s", dev_name(&pdev->dev),
> +					 renesas_i3c_irqs[i].desc);
> +		if (!irqname)
> +			return -ENOMEM;
> +
>  		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
> -				       0, renesas_i3c_irqs[i].desc, i3c);
> +				       0, irqname, i3c);
>  		if (ret)
>  			return ret;
>  	}
> --
> 2.43.0
>

