Return-Path: <linux-renesas-soc+bounces-33041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFVbIiSzEGrRcgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:48:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 457365B9A1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 581D230167B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496D937DE9C;
	Fri, 22 May 2026 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e+5n1Phw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EDD37DABC;
	Fri, 22 May 2026 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479313; cv=fail; b=je1DcrIZCF6ioL2zSiiMaHubylVEZhG1Qc07M/Ugs+MdMx/jdWevwig3rrrf8knfYxzpIOMimkC+1Dm90NIL8I0AwG3p8kCs+5+QVgWlA3wKXcZ/ZjFi7czYr46SzcbTTFu4TxSkmYOTr2cDVi4smZPZ/wfhXAoo7vLDDcq1+IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479313; c=relaxed/simple;
	bh=BTVAjkUQZZ3a8cpr607Fn4xqvS66ugnsZPdq/YISMD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q+COqYGz3YiVrkbPMBiGkhaP6C5zogqa103Kp5ZNseeI21uszNlWSUC46ynaMBC4O8qkV3KyNNF6vnf3vQEWp3iX2+khy/fNeS/d53YedZOiDNj3YM+05e3JY0sag2YqGzXrMzPuEgIbSTfdv7yGB/z0SnxcdQIG1Kef0dXn/I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e+5n1Phw; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqDN05sm9m+JDsejPmScWH5/WXfMkRZ/K7SvwNMgk42dELdhmO7RZallMJ8llfHorJ5bUV88FQmgh50qrLMWwAwW3cC7Jqza4Q8JFnWTQBVFxmsIS9HSFqHz5Lo4dV+bRSBxLxrnCGfpk6NoxnaheIMmQx52h0RFwzCGT5hkXdVpih0Q7JRXlxsgP1lxsNORNvB2fS8gHx37962KDaJEfhXicFZk7dB4ePxCBR2F7bcH6I4EN4xrc4C3URTwx4IHs2Ux+0IcatwwP5sX2SN8GqxLpAlIBXM8StFeV/We+xzWWBJO8GpcYjJilx2d/vGQ2WcPF1APhY86JKnkCevtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO7ki7qjt2JaLhh2jGGUvnSp1KOV2gofdNlIgkV9Hq4=;
 b=BBU6uollt3rnuyFnP/iaxMh8LB6oqyNgEPvEO+ESNAQ7mi5uezCRYNPMyk3KIBmiqlhIMQCREN48XSQCN7GpNNsAAa1m7A/SPwYwfIEiBPhxrzwHyZH3PpZChYJmpUkmivQkc2V9u78E6WOZ4+00O8uZfQALHvPld0c0hL896p22BlpO/jSIa4DJ0imwIPcU1O9Tg05vO+uu1Pn1DNHLYVUks+1F+5uoJ/5TiIEGR7C2lLIYPkzdQMdFqM37U+8QtMoPnzbtM4nJl5taJ1mKpm8qurMAj+YrRqK0F/EyGLiPlCjConzM0Vix+9gdaOC9zSviOrgkJ0zvRhSkUWoSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO7ki7qjt2JaLhh2jGGUvnSp1KOV2gofdNlIgkV9Hq4=;
 b=e+5n1PhwJKIgcEh6oS0PPBu4qhZC1qWgcv//ek50qEnV7L3OXP7pV/36lKNmWfJgdNNm3ljj/mjxzJI81fjOFsKMCoUyXCqB4cxa4frcXHH1/jzjuEowrGFEEyiCQZpHsy/hcNV+gdcvKlkU7y69/YF4fvfgD5uLEuTUaEKxgP7kPnkAvYgZ43mQ7HJpwjJGu4tL67a8FTPcyXQP93BhFNaDr0210/elODusEnJ7fK7rNG5SBNgzCYDf8MkpB1qUV4HMZTNIv95FWHbpr+0RmuwBZv/ebD4rqFUo+iB013fbWCufUzz7oKS2sNy6f1J7icWVBPPcNTKbhiNmloJ7jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:48:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:48:28 +0000
Date: Fri, 22 May 2026 15:48:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 13/17] i3c: renesas: Update HW registers after SW
 computations are done
Message-ID: <ahCzBTwpdsbkLkLm@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-14-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-14-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH0PR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:510:4::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c08891f-16f1-44d9-d4ef-08deb83b1842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ydrZNyuMZZXuwBYDgkYDl4CR45zlxNnzWJA1zZhcxSY0L6wRKwUmth0nLtZC1wVb92SiMOMuSTFcDCGq4sf9L4VPHFCbwPnZH6jiuyWk/pHBA+jOgCxJFDF9mMvxIQ3UE58eK9g7JMtsqMTyDFe8rNU6MT2vetPIcqCt6hb9Sd+1xLAq8zu3BNfyCP1XGqp/cuRBxYy5pfUrU+JvcYOuEqjwyPlThicTorY6jsAPL7ai/R4QJ4V9qvWAaFNZTBRSJCZkrpNKNqGZ/vW2hYoraV7glmaTdB1f7vea26KBIM5g6YlsI9pon3eBiv+GuB6yh87yLJXvpwZa7Heg/2fHzxFHDPMcH3WkJ9EzkNxqCfcJ+VHPSWMO3RqjHXFNa2P7lht/y6L1z1JFd5IlHaqkQbGFnVudgEqmaBrVbkBoVSScM9/OuwN8HKk/ycSpV+MmEKOMBTIGognyY+ST37oLGgR+LJU2hEgfAnQh/Zdw3ylrNL8Rz8NZwd03kPodMx0JUAiy69P/JIVRCzGg+1uLM1dr9LPgdW/d7M8FOW3yOFj00UaC3RgIVoMPurf+xKm6mIxZfIH7tjIPmC2wWVg+NsuspXeMuKGlxCbrQ9zdi2M6BUKSzPIozVoZ7IGjoI2RZM4boQWXWlRgAXj8cIgv+KdoWr5KztCGu4PiZzikPf4OR8YgOeZ9PE5dJkyeBkTc282FFdXNx57+c0OySsFkTfc3rgwc8UrU4FhQ68ewUaSzW6mNQBHhLNEJctR+RTZ7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QJJrtPtxQVB8t3c9EmeEChistDsBbyjxA90ZtDK4hXsOn89fltqPfF7FmQlK?=
 =?us-ascii?Q?EJNY6FYoGWVKb7qxRi8ECkX8soiuYEn8bH1Fwp+daE0XNuZiq7++XO4TH9B+?=
 =?us-ascii?Q?JfyO/8j/zmbZj6e74j4dXc0ujnb9HDyEvLp3FP87IqRnqDk9cGIxJPU9AlxD?=
 =?us-ascii?Q?MGoPLNkGHB/UXO5DgQl8Gk8hBc44WnxuYuDMTyqzVudXNLiyEGjzzWZ6G90z?=
 =?us-ascii?Q?bAdcxY5zeMJ0BkOqyYL7Bd0kY5hEp1TvgGDMBcsVPMExjLyAOe0Fcd3dugP/?=
 =?us-ascii?Q?9XVWlTNaWoOUbquwI1d1yqZOllfz03iNMXKCvqyFpAtLxVQvRb4xElJcGgdQ?=
 =?us-ascii?Q?eFvqZAdJoxZRvnxe3iwnmklrMdinm2UTkIRUimtwW/f+AXglF1Q6/FMvgnHT?=
 =?us-ascii?Q?eJ9iabYJVYcJRTIiKSoTzfHmAUAdSA7XN6TMy/TBpK/CuF7eyMzNVKVn9TF2?=
 =?us-ascii?Q?l848KQcoG05uyTGXGA+hEtrDruUAatQ7i/rJvPo5R2Wv+jfAYr5DsIrC0WOT?=
 =?us-ascii?Q?FsjEubzJ4/TevOItSJep5qnduvZvHw/K0R+deGPgMFZFjku3AbLDhgoft+6r?=
 =?us-ascii?Q?+pfsCYeiJt2pqahLm6j4r0b4K/+CfKtrttVlQfRQatVEoa6NDzvw2z2BlRWH?=
 =?us-ascii?Q?+MQ0mS4lNa6LdubttaJTf+0zqvFAHE9hEU52lHiGsIzxAe2kcNSQ1p5jaFug?=
 =?us-ascii?Q?r11vwOv8V3QV0Zur9xqJuxWWPoMCiy1xDsQMk3SmN587o6XC3F+x5YIlqMg2?=
 =?us-ascii?Q?Zme5IOa63FPUnU39SqTF0e+1MKTyhXSISdQJ9dJGmV+xpgIYY14BOUyWXcgH?=
 =?us-ascii?Q?KVrmMZ1ZCphDzRciUhweq8sEpDfTIA5YjiVEwhZeODqN9W5dU4rynZlRimsF?=
 =?us-ascii?Q?Wt1kSQHeB3hvwUE7ZURhnOMNdSlN/ZPfP4slxJGcT5uH5rh22QTC8J9B7TtG?=
 =?us-ascii?Q?qcFj//IDjqRMuPzhjPdFaIPE6ZtRDu6s3+SwrTMbhrxAlPxVxzv/xWQzZEaw?=
 =?us-ascii?Q?M3b5W+vIIpU6RYrvtgZVo25yT0AjY/giVDrTp4VnD3U+1bSndZFrXqfi7wKJ?=
 =?us-ascii?Q?CKa1HRps/likXWkzkk45X6FCI0SZBC7nFuFMo3hrkUxWb4jS1Kqk5RoBDCQT?=
 =?us-ascii?Q?yXAClGF6mkt+MuRRk5iB1tbEXk4m1SPqvW/fL4W5x/ivYYetW5gLtzF0Y58z?=
 =?us-ascii?Q?f8K9a/MQfp1b/v1emlM12WOo8UbX5B2Xp6WBVrv/0nCM1lT1xo/n4kwbrB9v?=
 =?us-ascii?Q?9Sv+CkX/wMm4DFr6z+zBfcM5eTTB6QgD98TLACqiBUrdHhHBrsHxRv1gKGy5?=
 =?us-ascii?Q?WXygOVKDU7Lzx63v739n9T96upB3TscAJoDbXYG/tWk47CA/6IMWthVxdBPT?=
 =?us-ascii?Q?m+wHLER5JmN4HNJai4gy8ACZvpJO6GRPVpcLlh7EYRPyRAHwuiOQM3q+ssG4?=
 =?us-ascii?Q?P0V73+iKtCqJMLaGKjyTJP+BAcE8OOS8CXX2Y6ZRS/J4POHmzzAEZ1HUBOwF?=
 =?us-ascii?Q?5TEIYgYSpTyj0jcNlXVdJjZkGT3rnRr0mgvLwN0UdP22AjpWghNQngWselJI?=
 =?us-ascii?Q?is9upLW9IdseVgcWDNHBL9tSr2JWJVlLU5fIKdBVBAwjknyI8ji1WWTXTOVR?=
 =?us-ascii?Q?OqovQ9ETLoLcQ5vl8t124UxPi86zx172xlomFYITh+QD72YPcCblgb5x2OQ9?=
 =?us-ascii?Q?YHjAcOSYqb6YoIgZ8fZkaBm2Q1XKupIlGXn0c5cHEBtFeLJP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c08891f-16f1-44d9-d4ef-08deb83b1842
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:48:28.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yt56M+SNL0sL5gA4jVuhIxcWkZe2rOedDJS2dUTR/bufd7jfJwbClTeRR872EAJdQdGcSBSyVyHKZHBzeWD30g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33041-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 457365B9A1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:11PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> renesas_i3c_bus_init() performs a number of computations and software
> cache updates, interleaving them with hardware register writes. While
> this works today, it makes it harder to minimize the time the controller
> must remain powered when runtime PM is introduced.
>
> Perform all software computations and cache updates first, then update
> the hardware registers. This prepares for future runtime PM support.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 865e67ac0fd2..631c9c5d8038 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -550,10 +550,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	if (!i3c->rate)
>  		return -EINVAL;
>
> -	ret = renesas_i3c_reset(i3c);
> -	if (ret)
> -		return ret;
> -
>  	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
>  	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
>
> @@ -604,27 +600,31 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			STDBR_SBRHO(double_SBR, od_high_ticks) |
>  			STDBR_SBRLP(pp_low_ticks) |
>  			STDBR_SBRHP(pp_high_ticks);
> -	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
>
>  	/* Extended Bit Rate setting */
>  	i3c->extbr = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
>  		     EXTBR_EBRLP(pp_low_ticks) | EXTBR_EBRHP(pp_high_ticks);
> -	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
> -
> -	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> -	i3c->refclk_div = cks;
> -
> -	/* I3C hw init*/
> -	renesas_i3c_hw_init(i3c);
>
>  	ret = i3c_master_get_free_addr(m, 0);
>  	if (ret < 0)
>  		return ret;
>
> +	info.dyn_addr = ret;
>  	i3c->dyn_addr = ret;
> -	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> +	i3c->refclk_div = cks;
> +
> +	ret = renesas_i3c_reset(i3c);
> +	if (ret)
> +		return ret;
> +
> +	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
> +	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
> +	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(i3c->dyn_addr) | MSDVAD_MDYADV);
> +
> +	/* I3C hw init*/
> +	renesas_i3c_hw_init(i3c);
>
> -	info.dyn_addr = ret;
>  	return i3c_master_set_info(&i3c->base, &info);
>  }
>
> --
> 2.43.0
>

