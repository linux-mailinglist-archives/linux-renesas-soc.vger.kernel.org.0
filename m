Return-Path: <linux-renesas-soc+bounces-33042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH5RGI+zEGrRcgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:50:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E55B9A76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C67C301134C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC637D13C;
	Fri, 22 May 2026 19:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iKL3rKfi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E937D108;
	Fri, 22 May 2026 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479437; cv=fail; b=XBAH2nIwO1Li052sdBn1CKcVs30NfIj7wDZlaHjS72d4xy2QuCf1vNdO+vegUPGOYfvcFbsXqNPmfKKdj5b1ZYDcevudQk/yjtt9YQhIWJVU58qHEuG7BEDP4YYtk92Qlghc6S0N1+3cUgPW0wTHavEZ0Hlc6aIZW40uBVCzScU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479437; c=relaxed/simple;
	bh=M4939BzVK9FLws3wBvs0PeJV6cNaY1paFpnFkytxS0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dEHmDuyzc5nRzYOhPFOhDKibLtvqZ+1U2RrVnttlnYgXlYG8cVokYPA+0NOUiL3AE/FUtN20/6A4WdQ14BOunGCS2WwlbunMSuigP5gXPuZF64CRWBDBTp5KEhkNve/MQGD9BoTQJOOL1yg5li6DHlO+wlpSAerWG9hHtPOSgKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iKL3rKfi; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTNI5SuoFktGQh4qsKqqqXS/QcemTSDqok1kceoST5nF9gf8s7rHPTyieXyXLdrM6tQF7z2aWhBolS5NTE4rF7z4mqUMA+Lz3iEMj5qR40D5i1M7hgDM7TdSSODyPKgkTa2GJL1JLteasiVJvCdaHm0djfHX+680o03BsYG3X9kFUsHYD8P5K8xe7FG37i7IQkNvkJZtk396WlYFhPdFpcLlUVo0fBDL6Uqun3kB5EnoNp4SFvVe51am93QB/cS0E48L+dJQcOu1mLMaKahVjmwXcUNwdZe4cbC48JPUhok3Cz/jnUd3+3ojf/7wqGL3XovOuSUk6hEJ7CPb+bR6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDxL1kbBvLrmKdYuex6NNa6WhCi39ssEkPrHZ2zf58c=;
 b=aylpIuYad+lTBOx/YDnrp7eB+YgngyXJuXom8fIS2PyGTeIcpNNqKIsCOXXRh7jGZNXsTO4PARV3naDUFAIRGRd94TasIsBrQ+p7bV2vCqsBMNRCBG4xZ4WBpbYtuDrnv/eQkMAJOvExdnQHbLhZpIdEeHRHtb0QVh0hTb4ToeFBn9vH8EPX56LvGvabcmORsS2ke0nSICMg0yaWwLjVaF7H3Hh0dTPsK+5KShI5JaNypOdUqkdPvZJBi5VjOHvQpvx70K/GuyZ3F8l3LEN5+GE6NQV0M639ImeCKUma4QWlHwvE8yv7Sd/2GrCA9niUpe4/XU/XyXKJzkyhBaOCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDxL1kbBvLrmKdYuex6NNa6WhCi39ssEkPrHZ2zf58c=;
 b=iKL3rKfi7d/bG7T1pRpm4K9F2HUbH3ib+ECEc4pyqLYoSiHF5gvwdk/jtQ6iByMkj2h3/DJuBLhLjCECiVe70mTajXOawk73at0eO33V6HB2atABwz1xqdPmgfH/RSLOGRrSLRpS2bONLuZh7KjwCc6ujei1oC8eO4pbm3UwCNHM0QcagSWi8N4Zu7vUU+pB9AZWPxe3ZNsnGYjBJ46tGPHK8c2bQWtu1/3u+NziupNtWfkCqKY+/Vf+w93gUB0uxu0HTAG8ITjrz138aqz5a9b8m3AbiGUx9C6LN3+m8jqQwMABdrK8YESedl3a3rRo6aZOlg66ci+gQGmwTZg4Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:50:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:50:32 +0000
Date: Fri, 22 May 2026 15:50:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 14/17] i3c: renesas: Organize structures to avoid
 unnecessary padding
Message-ID: <ahCzgdbIs9th3Ovn@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-15-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-15-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: c776cdac-69ab-430d-d510-08deb83b6256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nKIhH48MaKtyRJ5Ii2t4J7NOkoNq6AXaFQ8o70aQrz8TbVuPtMosswXOj++85Ogr4wxSDsvYTN+ImHufOSf5pvgsYqD1b02NXb9jT32IdobqWc0Zo9F5qaA90VS9vYHxK2q91jPhIm6j7iw/o6ECZxtQEcN7VlN52bk/nvE+7TDeWWv3eoAaLuPp+wvBT5uM3RtbOz4hdF2ciu/dLeUPlfkZKTN5iAjjlzvOViV834zn4XfnI/njD2f1Jfipbvjfxyglww061N50tnGx5/CZ0wT2QA89fIRfGVSHRmBbqUBu1JI3BLLe8HRyH3B8N3sPKsTTbTfUr7tP3GdRnavUjgtpNCVafKNnEUM99syL5Cb6wa027brTl3BcKS5eC7DeYSBAPlW2APTrXKpId5kJEUB51mTZIi88IILPZBwLRTGXIUUtF/CDJPwY+db4LcpFmrZYGADc0ToMM61BzF22sDrXLfeQzt1/hy+q0z7QJR4QeA+mfuyXXH50G1Sq6EfdnvJtW3g9Wm+PDOI6yn/Qgq/Q5v2ol4hc++RgqiXhLMECltzsjIIesqHXWZKB7wDSDtJfZU6cOsLfdKH0/k6JS9WZvWAzvHsFAGoOjr61GCKrNn7xeoM16BcwHma3Qigq+NGUs25PF2MH4Y15JXrtKRAEJTtpITK4jKla3UmW5RZKJJE2QKGTWzjkAGeNdG77Fv+G3X3PyU5le18CZIVJNivoK3kuk9D+ki0vUbrAP9XlsGVywkYQeD4GCV87YdjK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZOkVqnCmeGkKBETcEMX/25RVXzluHL/hEU4T/3TpoFMY/8Ao615eixJ+jQ8l?=
 =?us-ascii?Q?lje0pqzlnXE6FZL2+A8ulKFF5ZEkaMbEWLAdhxaa243Elxy37o2wfo7TkMll?=
 =?us-ascii?Q?rPRml2lcNm+KtQ0WejqeAw7qGDV3LiJLRe2w00AlOqJf1y3+sldZD0h439Xt?=
 =?us-ascii?Q?YXsaH93uDIyn1KQEtP0L/tzxfdIhvp0gRP7LnyjcTD9ITKOBYi9qSx/i4z97?=
 =?us-ascii?Q?78CH2AsEtgIwdhvdTbSqk/eUDpB8FptIXAx7GGeb+390LEG08SYe1K7QM7XL?=
 =?us-ascii?Q?LN2UxBmu+sWRJb2JB8925ZllszHdmorJwpIwPOK7jvY/nvJj79GmXV+RFQ0c?=
 =?us-ascii?Q?FaVm6Yca5uOBGqkr+hkeee9gYmhKcieO2ZMpBxVz0aYS6rMFKFwd2ub+XX+a?=
 =?us-ascii?Q?T1o+R6/wwcpcINhcJcgplOPzEaXyrMY6pYlkLclzb2dW4V5I1aHNobf1y/6v?=
 =?us-ascii?Q?YZ9XZ9ileiZgIRyExreVBba24lkHLJ69uBvR3JRNE/HQxtDUtoMVxylziGxU?=
 =?us-ascii?Q?zxbq+2QYKsAxK9uTaL88PtNWDeos8sj97aMU7Stty5ZcO9K0NdfCZeUFnmtE?=
 =?us-ascii?Q?4oYm6ajjUkwBAJenwEODfgRlal9YQxFy8FvNlSp5mqcbLP4NoX/VoZ/71ech?=
 =?us-ascii?Q?wWzHncf+GSt7Plai6nD2vLnIV/d++h3EX4OzgIpN+aDPlkh3sXUM1qrO9SRO?=
 =?us-ascii?Q?TjcuHyjZKu8wRFuJnsjIEqqOWywmDKi7ab9P6MX1BYekpFLlHNonZCJiV26b?=
 =?us-ascii?Q?UmXxUx2lVjU4uPFCQKHmYQp5hvFR8vC5KSd1XzTKCkxUHCkfjaYgf8CvqOLM?=
 =?us-ascii?Q?YhyP1tX8biak5LtCQqOI3gNEBPKLfHQehMmm4pTl+dwvaOkcZ7yrQsLjW/xa?=
 =?us-ascii?Q?R3dv37CAKc7RGflJ7cwDRqyb2iMhfDZvBAIbjoP4KnAl3/rlt6QrhKyGUYGM?=
 =?us-ascii?Q?UQDQzYTaQtwNadfippPsjh02ZcLvUdrpBfP3QvGZ8U8rlyyoDVXoIWx0tA4l?=
 =?us-ascii?Q?l3WjWTbGN/5FL5QRMdjgwnY9PQnyEos/Yt08uf45wHDK56jdVGlewUu9NeF3?=
 =?us-ascii?Q?7Nj+KAu9zg78lz4l3RjduyL7aYDMLOGqk9siuOZquNyfwlN5K46YSLG4CDCi?=
 =?us-ascii?Q?ekzavvYlEsSmoMkvimoJXbCqsdJku66AbOt74dWli2JqC/RGv28rhbcY3M0C?=
 =?us-ascii?Q?HtSBxLFruS7quhF+GrButFIdC0UWOJ0f2X8ikjHK4oClduPkYhQNZ+QV890k?=
 =?us-ascii?Q?rLSc/O2JOcV/ZdPIDfZHnfmEyvcxNymXkTFdUlRTla7BZdLbT+7azZa8rTWh?=
 =?us-ascii?Q?hc5lnviRUjnpvuIM9B4HHimOb+U+jpwueiinWow+/FXUvA0Q43xTSTMFQv2o?=
 =?us-ascii?Q?fRlJEuhes5YexUOl6UQ2WHJDT3kJwWRR4QTg1/WkVhhKHrkgMGVvD8COxqQt?=
 =?us-ascii?Q?Hib4t09P3fI8x2EIu8sOYyj/UJhSYGf7gsQU7QPcEajXaHjRnDofCl3MIZuU?=
 =?us-ascii?Q?TRE4NX2XY9ymDlbme0Qd2wvMXa/fY6Iz18Msi3XFxi9SwYWlJ3I6MIZI4g2z?=
 =?us-ascii?Q?uRcN+6doHMSVrI5KH9++hIaZdbEH8VJVQBadzS7ojzzjkNEl5DRPvNLDc3UG?=
 =?us-ascii?Q?wQAMVYWJC33rgbfECGjOauoGHQZm/DTOm8h79yF76hyyrXtBGyycUfSrJ2YF?=
 =?us-ascii?Q?Ur2ZoJHzGha0s7hLDsBu7xBq9Ro1uKa9YxS95lOKawlH7ew7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c776cdac-69ab-430d-d510-08deb83b6256
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:50:32.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kCSIClEZSBznhAEkJ1DNPO07bggtqKfnZQPIjmfowQHMDWAXA1nT/FVoTALu+i2OeLA0iMv0E1My4IYBlXdJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33042-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: D92E55B9A76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:12PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Reorder structure members to reduce padding and improve memory layout.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 631c9c5d8038..5614ed99553c 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -221,19 +221,19 @@ enum renesas_i3c_event {
>  };
>
>  struct renesas_i3c_cmd {
> +	const void *tx_buf;
> +	void *rx_buf;
> +	/* i2c xfer */
> +	u8 *i2c_buf;
> +	const struct i2c_msg *msg;
> +	int i2c_bytes_left;
> +	int i2c_is_last;
>  	u32 cmd0;
>  	u32 len;
> -	const void *tx_buf;
>  	u32 tx_count;
> -	void *rx_buf;
>  	u32 rx_count;
>  	u32 err;
>  	u8 rnw;
> -	/* i2c xfer */
> -	int i2c_bytes_left;
> -	int i2c_is_last;
> -	u8 *i2c_buf;
> -	const struct i2c_msg *msg;
>  };
>
>  struct renesas_i3c_xfer {
> @@ -253,21 +253,21 @@ struct renesas_i3c_xferqueue {
>  };
>
>  struct renesas_i3c {
> +	void __iomem *regs;
> +	struct clk_bulk_data *clks;
> +	struct reset_control *presetn;
> +	struct reset_control *tresetn;
> +	struct renesas_i3c_xferqueue xferqueue;
>  	struct i3c_master_controller base;
> +	unsigned long rate;
>  	enum i3c_internal_state internal_state;
> -	u16 maxdevs;
>  	u32 free_pos;
>  	u32 dyn_addr;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
>  	u32 extbr;
> -	unsigned long rate;
> +	u16 maxdevs;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> -	struct renesas_i3c_xferqueue xferqueue;
> -	void __iomem *regs;
> -	struct clk_bulk_data *clks;
> -	struct reset_control *presetn;
> -	struct reset_control *tresetn;
>  	u8 num_clks;
>  	u8 refclk_div;
>  };
> --
> 2.43.0
>

