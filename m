Return-Path: <linux-renesas-soc+bounces-33039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKNwIRytEGrKcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:23:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D63885B96B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B566E300F135
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9673536B05E;
	Fri, 22 May 2026 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P/5OTdn/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C63236AB5A;
	Fri, 22 May 2026 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477718; cv=fail; b=TgkVs5B4Su0GY6UOZbYJuggIwWG2OCEtgUQgr5UXSt+8z1R6Pu095wTWGzEtg/yj60tIBtGPXFMlbFmVxTis4V3Bs4rLx+vy7EONa0GVaGfbEJDO2Z31Rpq/Z5X6VIKNiBeSDU3NzWwOC7zcam42bUGzn5Id0ZZEHK+osKYUFWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477718; c=relaxed/simple;
	bh=zSVGlyXdI8Tg8rMMVfwmWLH647adqSpumI9urB2acmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lh2JjxhAJiyl9kD+iQsnAzkr3jm+PuytACkTQ4RFnLjfqW3YYHrw2voKnVK1dPU5/CPDDxVnPLhA+j5wIzD+mBtKIbOj2ITMg0fCqiw7/4xLX0n5wkAINHxYyqeg74iqHKNtawrQ77qKZy2fQiqy4IgrF9GRQPrY6fcJJGj2dHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P/5OTdn/; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFrUpuHGnLYrsuOXRfpfZ7Sth1QBaowKscxuNo2bpDpJBczPcd7t3oVL6+bohJriUkyINOHnMqNbzag4VzFhRh8J2J6+zfrXyg7vDspV7QBExcbYVmKvlxDelBU9/G6kJwzyER8pp6TIcnuwhoHuv5kIoPsg1und4R/uM7X2PgxCF5cBJrH6fp85vn/BT3CJits6JCb4vuBOSYPQ9BBszQR8dXDxFXVZmA+C/OwyGXkz5fNZRgqmJo4ZvV3rLQ8Ij+x9c8LrXJ9y6zwY/K9J2vLf43WXbG9U+eo2zsDtEiuOlqQ0xyDRKQ3cszTuNUkNhUajhXCerNDP2GWSTLiAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkYNpNQAkDTqNX0bWBbOweg6o1riYUZgdS56sl/+xBk=;
 b=T/N9ndZG4oxeQxNP2J5vpk24GhkTRdOH7tp/K3cl7MPQtZrMyiUNBt8ZettOF13NcJufI7n9AZberKkOsFhA1leL3fc/0ifeUfswiHo44BmO1/wkBKDvGBMFZeU89M19T5vjDnQIOlptmA5vT8mySBcP+ZpjA62o8B5Pw9+pziYQmgNcdMr5x0bCiyfOf3fehhhVX+dU1X7gz6OJGx9LpdQYDhKUvLydFh0qxTvCx/wgeUSaP/aRcls26gcFA3DgPmBmn4MNL4okmXnCPUWLogwhq/h66R2DSzuO4qcS7zalu7VUo64WtrjmEPbeYw8grwngW8aK+UlfG29CyuLJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkYNpNQAkDTqNX0bWBbOweg6o1riYUZgdS56sl/+xBk=;
 b=P/5OTdn/L0f3453pczm2ZVPgmyea+DKhnarsxm2EviK6uOBH62Rccw4PcWbw5jdg4Zv0Yz6JRLp0XUt5pPozqxolkPHE8OITCBOux/vmOOOI9PePPWjN6kvdl6y8nOefmMrjqfhnc9qV+f+c3VL/h8oNz+PgRIhJsX3Ns17CEw6EOQGS+f701e64poz41BvxuURuo9dMoYaLnFQFuEJJqla2soFa4NJSALDO/Ej5yj2ZW90+VV5fyq99V9ZcijadYx31tVZtBChmBF3/BXRPMfnFHkm/+2tkbiBiGTlNMUYYi90Uq9cJo9TaJZAaNMrHdKC/3QoFFCwpqOuCRDSlkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12323.eurprd04.prod.outlook.com (2603:10a6:800:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:21:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:21:54 +0000
Date: Fri, 22 May 2026 15:21:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 11/17] i3c: renesas: Follow a unified pattern for
 transfer and command initialization
Message-ID: <ahCszHJ5_IKCf75D@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-12-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-12-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SA9PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:806:23::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12323:EE_
X-MS-Office365-Filtering-Correlation-Id: 139f232e-391c-4e8e-e8ee-08deb837623c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|22082099003|18002099003|56012099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	il7UmHbpT3B6nFc4OP/G52t3qn1jFDQ3DK3NdUBEddiVeF8IESrQT9sSi5h26Sf7VwihfkIEVAT6FtkIXOaLVCEY13WXwzpLuPO4tLFDgtOmCjIpwGvLeRp4gCPcWGluBBkN5HqIp/0wQyQPNfqI6gcPDUIBZbpcRAqIBV8TXLV54eWVSPs8lpdnik9ZRX6R3GFykCcCWK638BS3kMP5b/xURXD8OR6XmzQYwT3VzgQ2qP5qSBIs94bfb4cHaNHykuJYzTk7UeGpIWD/NFU6Uju6Y71fL9vpKI1ssGDIKHzS4ICo6iIaafg4bP3ax/RawLMciRaWm/e6oUi/hfCa9plKBrpMHxl2wKSQy2UnO+61aSUb8QYqZjs7jTzSUbPTapvjWGyS54fM9319yDtjezZjErGHnSOrj5ROjcnNy+7ImIItOPakD3Y9DG6YlqZbsgVNyvPaTMpFJzy56TMjxrZU16T1oKstF7Xsxzvi1IaVhqgl3pAqUogiVgNz87DTawMJKFpKiiG/Og/qll63G68gcrc3ckDRYcAMjWGJrDAf1Zpm5CyqRy6PwB19bgHYq4butGJqEaOcoqB3eABshfUN226SChz+1zAgYMFm9tUoGsMtGSMfjif3QE++RqckgAlLJzF4uR8wu8bKSzeyNmsia1i0Pmp3o00ftBsEd0kR4m63Tl9OuJM9eXuxINQN+0vmtdlzixmY0cZT/z0W3mtkVrm8shRnTV7AG1wrwPu0bGMT5VDZCvIieL55LZTD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OnhZyVCumkivry09NFWv/W2OV49HkfvyrBcZWk8CLjys0BfsokWY1o3VsBO?=
 =?us-ascii?Q?hjQ5cY9+Nccpey3fKpMRYOLpakwwzgj0HlZaIE/OwyqGrT2h67yH5QdB5A9n?=
 =?us-ascii?Q?P3oNhD9unO5IApvK9RwioOhSfAYmzMqtIEcTS+wN+5QV7lp3fTEPv5otHnv+?=
 =?us-ascii?Q?+YJBFdzjaxqQN+340dFIlagn05KyYDlc7vP3ICAv5rBuMx0z4KWpYhFP9Vty?=
 =?us-ascii?Q?g/785H9tF6Yqm6q1kC0WfHC0RABR5coL+5oEU5GN9keHkJzGv8AWdeHH5KIq?=
 =?us-ascii?Q?FIX/8ng7/6PXVvtGgdqnYEgIJufVgF9abQmHfnosEzTHNuM75UBuBQnBL/hM?=
 =?us-ascii?Q?WnnnmZ0L12pRx2kP/DdCQkqS+/aW2TO0QphuXJLW4vKU4bufh7KATCQkkha3?=
 =?us-ascii?Q?rfrpeqWnw0L3vr//Ax9dO7xBKaoMWJXFKnhUbBbI78/WnWFe8nCm20xvY6JJ?=
 =?us-ascii?Q?HJ5K/PO4I4yNjZ0EIhzHuHRCX1onrX9kpmW6xTqwfKicFXgDY7zewSsTgSWn?=
 =?us-ascii?Q?64GsBpaq79+jGjcxXvsHJuTbifsdoDRK0gpHDGKsT+gGI8B0oVBIKVprktdi?=
 =?us-ascii?Q?iA8k5f6Dephtm6A975Px/qATkJGYfxs+dYwCS9Ym0LK/Wrp25LaYTZMF2EfB?=
 =?us-ascii?Q?M0fRhj0ZSQWFLAso4yUENeZyneDW0bDbCK8ywuiNYLrz1r9G0VK4eM7cqZ+B?=
 =?us-ascii?Q?YyiwsHCyobQ9BTP5wkrXvkUodOP4Wq9ItM8RShFr3erHH2sQoRXRohEp7OQe?=
 =?us-ascii?Q?6N+RmQQGPBczLyerqAQgYJJxn/P7VHBkN0XIIQ1F8SM2DxZ+7TccNQZLadbr?=
 =?us-ascii?Q?n9pLPuVwV33KwkH39s/5ckQEnBJen0yIVdI7UdwaXwQhfn1O+VSV5RGSju2T?=
 =?us-ascii?Q?Ijed+CWGfPeRlf9Xa+AEYr5HuYGhlBH++qwOaIdEqoJtCIRnJxf6rOSVAtSV?=
 =?us-ascii?Q?5esm8sLLEJOyri+XDFeXZfaDQAwi+fwKJtObHPZQxmaiHifSwmeqwpBHvgE4?=
 =?us-ascii?Q?ZYh0pTRpr5B2FJfq73JjUCeyIKs+7YLfjU5T1Q8Xvz6tDiQFO/8AC+xoCtnA?=
 =?us-ascii?Q?ZGRnne60x6z4nRUUiyt05rXfYTWztE+j97eVvST2BfVtwOSpjHgiII9M1h/u?=
 =?us-ascii?Q?vXpf0jcHmelP4mNQIx1ng/ul/fkyyq9JpCj2eY6R/MjsAL+NZmF5scavq7qP?=
 =?us-ascii?Q?qfj4j3Zmwy9dhmQVgBxTUGxx1NDNaBkDCj2d8tPIbF1wpGZs2zigQmsoJkXd?=
 =?us-ascii?Q?IpWo9HBMTRhYHqG4ChJCvAUSrwqE5yHUtG9iMRv3M/h+dbm6G06ZcDVzPIQQ?=
 =?us-ascii?Q?WUk2IfUrTvkfifK8R3vQU99x//a0wkRm/aOzvgXy2zXfmWV+sqje+hh24jm5?=
 =?us-ascii?Q?D5Dznmomkn1WQsBekBIdh09YZwOFu2M0/EJt2Q2v2Yhw5FEB6YumU+SeSAXn?=
 =?us-ascii?Q?pHju0hFXLiV/AtcQHC9sbMMoxrnBWudYB5YcY4kipPNDQ2swtmaNbKrT7KJP?=
 =?us-ascii?Q?sUwWZdVwN1Z7iwnie0FTdsM0kTBVc4lgOidO8Fj4W3v0T22FC5qs9i25+LSK?=
 =?us-ascii?Q?3F/B5ItpqMvn6LVgZd/hSJ0ePSFYzfd6fkWh9gXpo0T/GJ/k0VLOxsxtdcSa?=
 =?us-ascii?Q?/pBmyCc08jzch2KrCSZ8/RRTUA52cKm0xdd1D4hNSF+RV0Akk2c4p/Dc50kA?=
 =?us-ascii?Q?+1Mf+8FoEd3OBKsV5iVDFKWLC6nL6oMa8R97iFRgvYk0S9ag?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139f232e-391c-4e8e-e8ee-08deb837623c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:21:54.5429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXM/QKQzUHwnmRumzkR1N3CQiwYW5ddd9zUF5mnwZO/W94FqL2BRhMpfa24BiBveZAeqLrYGvJ4L9J+v9PxX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12323
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33039-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: D63885B96B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:09PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Follow a unified pattern for transfer and command initialization across
> the driver. This keeps the code cleaner and easier to follow. Also, in
> some cases the I3C device was enabled before the transfer data structure
> was even allocated.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index de75125eb013..12bf4797a70d 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -648,6 +648,10 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>  	if (!xfer)
>  		return -ENOMEM;
>
> +	init_completion(&xfer->comp);
> +	cmd = xfer->cmds;
> +	cmd->rx_count = 0;
> +
>  	/* Enable I3C bus. */
>  	renesas_i3c_bus_enable(m, true);
>
> @@ -669,10 +673,6 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>  		renesas_writel(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
>  	}
>
> -	init_completion(&xfer->comp);
> -	cmd = xfer->cmds;
> -	cmd->rx_count = 0;
> -
>  	ret = renesas_i3c_get_free_pos(i3c);
>  	if (ret < 0)
>  		return ret;
> @@ -760,13 +760,13 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  	if (!xfer)
>  		return -ENOMEM;
>
> -	renesas_i3c_bus_enable(m, true);
> -
>  	init_completion(&xfer->comp);
>  	cmd = xfer->cmds;
>  	cmd->rnw = ccc->rnw;
>  	cmd->cmd0 = 0;
>
> +	renesas_i3c_bus_enable(m, true);
> +
>  	/* Calculate the command descriptor. */
>  	switch (ccc->id) {
>  	case I3C_CCC_SETDASA:
> @@ -816,15 +816,15 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>  	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	int i;
>
> -	/* Enable I3C bus. */
> -	renesas_i3c_bus_enable(m, true);
> -
>  	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>
>  	init_completion(&xfer->comp);
>
> +	/* Enable I3C bus. */
> +	renesas_i3c_bus_enable(m, true);
> +
>  	for (i = 0; i < i3c_nxfers; i++) {
>  		struct renesas_i3c_cmd *cmd = xfer->cmds;
>
> @@ -947,12 +947,12 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
>  	if (!xfer)
>  		return -ENOMEM;
>
> -	renesas_i3c_bus_enable(m, false);
> -
>  	init_completion(&xfer->comp);
>  	xfer->is_i2c_xfer = true;
>  	cmd = xfer->cmds;
>
> +	renesas_i3c_bus_enable(m, false);
> +
>  	if (!(renesas_readl(i3c->regs, BCST) & BCST_BFREF)) {
>  		cmd->err = -EBUSY;
>  		return cmd->err;
> --
> 2.43.0
>

