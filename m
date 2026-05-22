Return-Path: <linux-renesas-soc+bounces-33037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMSCCZisEGrKcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:20:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 296755B965B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FC653014B3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC74E37BE80;
	Fri, 22 May 2026 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h4GhC2ou"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0610379C43;
	Fri, 22 May 2026 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477575; cv=fail; b=XNoYGubvGFp4XLFeUG1NyVMMIpvK4Aq2U/XICT0RfsUnxBwb66YAQVWf/ZJrDw2qhDrsqyHV6kQULvUUqvPFJeYndmM0vnbc8VdL0aMchGx1Z+dKMFEQdl9eCK8NMHwjYChHj/R27uhh4+ojEGgMYAdAzE+8oxEmSA716STiNJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477575; c=relaxed/simple;
	bh=SzSJu3C3kDj/aNLrpavY8ilr9uP1y/vDpZPdGajwOTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M/1d4HWyV2Llo/ZwIrygN72yD6L9YSmf756vaQ7n9RVrqTdxsuKl/S5PUSfDj+Ruvr3TfYfc55W2M+/5re/S0qXiA+m2LM7Al+GAx3LWs77xC3zLVuM/BAOVtuSihTkXruWZ1Bu6SaKUEIK8gWslFT2jQA+11ePkNvLeRmVAWHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h4GhC2ou; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8DyGMCxMwkFCK9l8Y9LVGFv90QzGpm2SlToPrgvy5qygX2AGnDRBtnB+ZjqisdczjIIJ0jI0dx/Ri9uQKejvTzPpJ3zcvJCwpam9MuJvxbOQUtDWEJb3+tACHjhlT45DPMFCm57DjVyzx4Y5w33rUznkdM1FHyRuAnxV9bnGyjwDquv112IRBh5ElA0+ixSuzNvFTFtfwl6M0L5MvXgJoNy2JCAyGHosbHNuVlH6BQzvfrV800/nu/VXGOcwXaR8s0mabqmd6+sM2uBm3mrWm7+VLW1mBzdnq7otdO68a+1IP0whCXCcDCEK3GojXiJ1cxE374/4H647fi/s0zlhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJJLPQhsjTw5nAYaA8ZnixX/r3tRdzJr3nQVQwrnHZ4=;
 b=lOIcyh9QINkrmfsqMfUDSQEIRnMDh4Wj/ZGTWJ0PuLIyfbgYCExynbvSMgoEK3Dsz5QmM3GTyV+Dl2D24FlieGpuwUQh1dphdSy1e3n9XN7tvlp2cPKF0Vtlz4i4YyJ9VWR0+LpDIzdKMSvgpuvblT2NoQwXy3K0Rfqsu0Mp5hFSUB/wIlbeq4GROBEAims7G36Yj3u3T2ZHUSMJgwuXAnXxRPztC5ifPUGL8NwnWiW88BgolRRBPBZowXLtKUItsLQePW2O7jbQwFrDtdlAgHRXCTuSiIztLdrTfMQHTFLolk+40VTTo8aHqSTpTWz6kQF5VQAMhGSLMmIY98fs7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJJLPQhsjTw5nAYaA8ZnixX/r3tRdzJr3nQVQwrnHZ4=;
 b=h4GhC2ouXo+fdfk2aU8V2V88x6Bvwo1VqDvAkDaiR6t1RYtLd4PtbDqrPG/LBzspMUdfQx2JnfH6jOYqYRNQKM9CA47Tw9L8rRolGDWi7OBjg3GXwzsuije2XefjPGRK4aEQIuPL7SQH7UhRQbG1wilzRMWMKAsM+9BvY/N1Fml7App+s3V232je3mTBaZmQzTNX3CGzgDfE/zcxoub1SoKKGsrk4ivDNFkOenNax9s22iPDeylUpg+bkQsWXgIt9mNoo/Tx9Dt/7GlslRvEcYdBhI57De/YZ9m4hbt7jYjLwwrYKvJBC91OnJjglSIz7vE3B8ctQaZGkc6osFhATQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12323.eurprd04.prod.outlook.com (2603:10a6:800:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:19:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:19:27 +0000
Date: Fri, 22 May 2026 15:19:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 09/17] i3c: renesas: Use reset_control_bulk_{assert,
 deassert}()
Message-ID: <ahCsOZ74txWyp0OO@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-10-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-10-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SN7PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:806:126::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12323:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cd694b-5dc3-42a5-7844-08deb8370abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Z+Vt7FTPAo6jk7tObLxpYxpT2sC8H70NbeYtupzpxVE+hd9OA2YUPBWM6T80x3dZTNSBNrScXTs5nAZwyMp9BxMpF77mzY6cMtRgM6KzzJGE3EnmdzzbdFb7Ih6L3JgXi+3lldL52XFvUyJvOxNI4gGr/08/m87raTM1aNhSnOWXsYdJmPbkplqeJuuagaIHoyyJiayMYfczU56W0yp+DtT2/bggv2pbElK3G4Mh1U0QjU+6+8supGoGNP/sAbqLFJgWssyKQWQymh3CYGIdkxPHQXFd+fXtHPcfANN4z+Zyx5qLlsFhJfKTUg6CtFxCxyxcFjABYMEcxEZ/j9De0x8zrfMbGf7XW5K4spIgH75dbbRjgsWlOOxhnIOrY/hS2Es1eYwromTzYQlkvxefXaCmhwAqj52ZhDNIhcA0b+up8IpDIsK8zChr2D/jEqWv8HV2IQgJSBwFn+XcUxFEDg1I9V6H/+WNE/cZmkUFqMbZ68gLy8eNKgB3xa2Y8XnGkViouewOOVX3FmXnoGWO3L36QuRT6w1KHfrAKpluPFQj+wuBTYlDUOcEAkzy1sdptrjWuobnqQ2m0rCpPGM5QDHuato6rN7wXn7r+GK3Qu2RZmKVaOLNAlobCaG21KT3zaMteeYz3vZQIJL0ag6O28ReDG1HdBPS5DPcWh2waprfbUovJCiZA5Ilag2AR4UYGr8RJ6SYdP7+TMoRbbuFfIkzC9NeZEMEKO1hBOsDsEAXx72y/Nt+KyxlbjHWDoaV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bxLpIbgGK+Z6jFgNuChC1OQjiEHr6dE+aJHzZFJ5M5ykRAxqJUJnD2vJ/VD/?=
 =?us-ascii?Q?6DUnwxm8oCiay/ZgKENeFWgu8ipmLA2fO9+z2s1MjAblqcWSR7Aq01RtlN1Q?=
 =?us-ascii?Q?oSIOA41snlrYLVkWcbY3P+bVwT0HqbqNrkyAOgR7pLQOO1/F90lZw3DOtBgO?=
 =?us-ascii?Q?ZcGBqId4au3u86qfiNOhhWyKmR5YSns9oNbL/uVu2bweUvXaodCFo4omvDZQ?=
 =?us-ascii?Q?YrN2ZREkD+Ulhoq6s+KhnFXPDBFMa4vWH7MGTaTDocEOHJyI3BiLOIrGlTUU?=
 =?us-ascii?Q?d9Q/aXFEgFv003Ofz3LcD3HDylz/3Tytd9PJvBp8xjaWrGeXY7xgMstPL+st?=
 =?us-ascii?Q?D+O9POsDdZ9xUoCDnJLBR0XgwLRTzjmOqal0nKTXv3W+vn2GYvVCRXnn0Eq3?=
 =?us-ascii?Q?ASILtVt7Yr9CJkpHqzv+OIf3cl7Ws3+5bsd6fUIz7+Y1guDDg4n2ZG4V076M?=
 =?us-ascii?Q?1Gi1ggbYwQiaXBV6IO+p22CXA66KC5kGWMF9oZamPa/Iy1VPnpoCe278OdQg?=
 =?us-ascii?Q?ubsonvwFxP7cYtkE2yIXOwe6GIxlezBiizszZKMhMr45qjQoBPh7CgzcMXPZ?=
 =?us-ascii?Q?HS1E5wFakZJ4rZcqD/dMVCUlgvZxY8F+2JKZ7Rv8bu+6eV4Hn0+fydmSyWo8?=
 =?us-ascii?Q?1/B9+mcRPDJ2/CRl8EQdsZqhAN8z8zkxZmuCO2tGpYzehP4j4wYtZl6WdbU0?=
 =?us-ascii?Q?aB86kaPEdVHh9+ikCcbcN0Iw9a8ErX6VvU14/zVQLTbtqbsb6mSzln2p+k8v?=
 =?us-ascii?Q?tA5GUpDi44hC6zsJqVkbSVBcumFEnQWyeWVvzVVPdGmNBZVg/DSsGDJDg2Ij?=
 =?us-ascii?Q?s3PyD33K31tirCqYeqCOcie+BGjLJGGcDr+sFbRlTlXaRQ/QTNVcGdSy1lGM?=
 =?us-ascii?Q?qPi/2eICyorGybLLxcfo4iwsKFOUSXH4No2WSZf1jILPKexLPIb3zcoJhb7r?=
 =?us-ascii?Q?caYvupLuPsnqiWNnHDwi3itt2jQwR2WlDDMz8KUHlyj/X3BB22yigOBaP++6?=
 =?us-ascii?Q?D7lO/9E3Qe6qnQUsMBJ5/lR6Dtj5BGXsYjwBSushHCA+rZVzqb5X7YtL3ovU?=
 =?us-ascii?Q?hGEbnKFTgwkVZTwft874tZomQ16GlLgd+w/iKwxSkNISxSs/Yr2H3K9UpxB5?=
 =?us-ascii?Q?4KwjKNG6psE3jJpCAeo/Ka4nZf3b6bvMdee/YGZyQFat2lZSojXr6k04boNy?=
 =?us-ascii?Q?x0RcloNY10M4wqIhLfOBfz0bkochUvPjC2gPGI2PLW8M82Gc+QYKZ6sBpgQN?=
 =?us-ascii?Q?gs5dBtei0p0iIiMA4uL6W/YgMUq2KYlJ/kHMP7mqfxRlEsL7rm99RjlOl+cf?=
 =?us-ascii?Q?JRgMrINEUR8aDSRIbpmIINAaqF0IUSf59mC2OWZuqSrf7CUsuHYHtePD6KQX?=
 =?us-ascii?Q?4x/yEfa2qnnicsFUhLcq6y+UZ9zPdQy+R8DDL1OvM/3m5qvl5FrqkOSHEwOW?=
 =?us-ascii?Q?GPMLA+HAxhOqMUVl5XkPJguzf7TgKsMAXU0QW8ChjlYHoYj2tk7JPE0a6VW+?=
 =?us-ascii?Q?WfvcozrloNRDZYVUlMBLMvzwfX4nm7rCJ7PmMiHUbrw7uk3NaAhOcSbQQHNN?=
 =?us-ascii?Q?Jz5is0Ww1BYyeFuh6ipLwlkmU5NUo211Owo1H10XZ/FNeeki8K+a/rL6qON4?=
 =?us-ascii?Q?Zeh310q1ZwR8boAdmTchOhGieggKGI1a+GyZD9fEYGZv3W0Qay47mKwyYlU1?=
 =?us-ascii?Q?DoncZ073rIrhcHKA1TJfLO4R7poscWSx+o67mKpB5Ds9QPd3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cd694b-5dc3-42a5-7844-08deb8370abb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:19:27.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ip5p7IVtfZu02e1/BCeBFt0/LCcDxFqLtErnuq4q1odkVlQKuafh8Z7Ukit/zP4D4zFcQdGCGmnl1FN52YtGOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12323
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33037-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 296755B965B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:07PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
> suspend and resume paths to simplify the code.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index d32646deb69f..e5963270d6e5 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1414,24 +1414,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  static int renesas_i3c_suspend(struct device *dev)
>  {
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = i3c->presetn },
> +		{ .rstc = i3c->tresetn },
> +	};

Suppose it is also used in probe funciton. can move these into renesas_i3c

Frank

>  	int ret;
>
>  	i2c_mark_adapter_suspended(&i3c->base.i2c);
>
> -	ret = reset_control_assert(i3c->presetn);
> +	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>  	if (ret)
>  		goto err_mark_resumed;
>
> -	ret = reset_control_assert(i3c->tresetn);
> -	if (ret)
> -		goto err_presetn;
> -
>  	clk_bulk_disable(i3c->num_clks, i3c->clks);
>
>  	return 0;
>
> -err_presetn:
> -	reset_control_deassert(i3c->presetn);
>  err_mark_resumed:
>  	i2c_mark_adapter_resumed(&i3c->base.i2c);
>
> @@ -1441,19 +1439,19 @@ static int renesas_i3c_suspend(struct device *dev)
>  static int renesas_i3c_resume(struct device *dev)
>  {
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = i3c->presetn },
> +		{ .rstc = i3c->tresetn },
> +	};
>  	int ret;
>
> -	ret = reset_control_deassert(i3c->tresetn);
> +	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
>  	if (ret)
>  		return ret;
>
> -	ret = reset_control_deassert(i3c->presetn);
> -	if (ret)
> -		goto err_tresetn;
> -
>  	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
>  	if (ret)
> -		goto err_presetn;
> +		goto err_resets_asserted;
>
>  	ret = renesas_i3c_reset(i3c);
>  	if (ret)
> @@ -1484,10 +1482,8 @@ static int renesas_i3c_resume(struct device *dev)
>
>  err_clks_disable:
>  	clk_bulk_disable(i3c->num_clks, i3c->clks);
> -err_presetn:
> -	reset_control_assert(i3c->presetn);
> -err_tresetn:
> -	reset_control_assert(i3c->tresetn);
> +err_resets_asserted:
> +	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>  	return ret;
>  }
>
> --
> 2.43.0
>

