Return-Path: <linux-renesas-soc+bounces-33036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAFwGuerEGrKcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:17:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C04285B955E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFE5C300D96D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6B2361DA6;
	Fri, 22 May 2026 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NywAJWlN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F3A224AF9;
	Fri, 22 May 2026 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477475; cv=fail; b=A9ojzfNj2BLYauvpc/JzvCGPP13YVN2iGIata8u8pikLWCpSJzcnVn1cmwUfY3ywkH9d5Lf1jWkPej/UT50JJxtHPfWsievZsSyX1TWVO6vYeLA04XZJfa+53vUE0Ejh0ts1YDSON6D7PPito+tLZHfCubDWVjVkgLXnjtqAxjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477475; c=relaxed/simple;
	bh=q5fRG0PID2bzN6Gm7iVZ1pGbVviV1gLtMYBiz5d9SeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UrOF1zyzJPQalcR3lPn8K8zMZon+PEADzVj+4Cv9rmmpxZsQhhcHzTcTBXPLwQZgCpwntpwLOI1sjixC5SriUrubs45k7/vUYVwSMy+1842R9N5Fg0oX7M7Ufjsxm3wVqYvACbUuzMe5LFE5TLNcOft60ozYQLDRRd1z2Y6UvNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NywAJWlN; arc=fail smtp.client-ip=52.101.84.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErJB+HbC84xRyUjLwzEg0fdVBi6GOean5+r5niZxFUgiVHXOuj/KO1RPmV9A6MqR8wUzaxRUbEp062iqv5XliPzhOjr0jwtnez8vbmOUL6o8L/9F8zRzpgJQGCUvZEWSQpkHgnlWGsdleXKHuxBOp2P7MMS6Mr6r6VTYMOdDw0gYXfvyDaebCU8aFGaVUecabn6gG5XEIKb+i5pjnNdoy0nynMekHB1CYwZIbUhVPOs+7WVAzgROzg9Vmvb6egPQiKArtlp0EU2nQ3Z9SiTEUjVcYx9/fu9SXWYJt6zdLnfbpus3vqolLNSg+Fv1nVVSlNWeSNaFDFLusy2JrqHETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRlxCcFyN4j4ftkRhYpNIx8GKR4bTuwriGx/LF7AzFc=;
 b=ap13qkUZUScy+burF/599jpiPC4p/+DibnJqHN6Z6j2Yg8TUsrFXn7dc6rW3AcL3sCGQ8sv7ezAjprgTk6oDhcLh7rCoYErN+wiiSLVZkHffabxs8JGi/0q9d0zSAtQOne7VNtL2SHyZR7MrePtaUcjE3FxrhPmID6MWFcSYfdMB3abBOhlBuoI2RN0ZvFm6miV4TIC6Z3pVU0JK4elQAfVUx4kiORB+rH/8iwV9n1dOkDCNdk0cSLFiJ5a5blfUJKgy+f9xyh+rHm1hVyveANKoRRSZY22TCB6xD6M2nAyQEzXO7mzWztzG3Krn8alqINmddvYkMkwuq9iD2Bd6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRlxCcFyN4j4ftkRhYpNIx8GKR4bTuwriGx/LF7AzFc=;
 b=NywAJWlNgQMog5/3DRsWMZMDn8XazwGDoAQ4V1/Y9eRQz38dr8z8XzB1GEsOXSSfNnM6SleUQEQ/UII341JdGKdOctT598rQ/+bZRA1we3ru9Z/tT524BgBXDWY9/xh6PNDIkaSdP2XmTsxpqzh4LcBv9kXhds/CNcfMicOYyDPgyeFHuKfG82bWwj4DpMNuDAF6DTVDMU445HzlaIXohEGJz3g7qccmiomyKCxYsiTBeB6GB1x/X3LNZCorwUlvMl2tNcIGBu77nOmStkVi8Szq4aTNK78KuIVyt+7Td7d6lbroxYK6adwnNg/OtAIg0JIoludFTP22Yg8lGoWXGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12323.eurprd04.prod.outlook.com (2603:10a6:800:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:17:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:17:49 +0000
Date: Fri, 22 May 2026 15:17:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 08/17] i3c: renesas: Clean DATBAS register on detach
Message-ID: <ahCr1jJRRaqxTOiZ@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-9-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-9-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH7PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:510:324::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9862727f-f8df-42a2-eef4-08deb836d01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ygR5XUvI/sMXm4dDJJJwS0UV6h/U8CP/asT5AqShoW3EVvNvtOAEfttQxBig13ZJODGKOLeiUpCTzfuAIY8NkZFrwi1Lvueo2dYvvOmTOzZnZ10wxViHR9NO+iyLMjNLXDxHM1iwW8kHhdl8K1RJCATKWyxQaLfOlWzxFeI/1MqLjUXEsQHstMMMNWYeJ5DSth0goIuAtM12c/H0/dVOoZZ+FoQx2hm0DUCvkS2fA9i5ptLciMFEtnagZD38O8PtSOAUEAgA9qxSlBIIkYiumK1Oont1ppbdanJnystgy1/R9PyMbIcGwUILIsoRGKbhx5U3jJVG+TxuQ6J75Fzqw/eWZcQ25Nfxe9gXpkX5dFDpRyhKBTE1ipMHKx54fvDJiY9XXBzBAMtAwb3UzUWhrLJy995NazeQEMsrLWRnr4EgVOL/mY9MUjy5scXMWIbIVFzPnp0402kez6+aWyCPpgBpR6YGW3Fog0e6gANW94ZfUaCUDkOqVzeBKobPVK15wagBZwtDl0QjJGW6xOuYXU1ng3C8tooLwDEzoOC3xNH3zZL9sQyEf82lBaWLbe5zU0xJi4e8uHPdvUrqju5z4JmvxKdt5/RYlYNYDZy9rd9T5OKE7AQyv/Hz9uXkoWKj+qTMqfRSXxesrrisx1ipsc/ZVf4WDRwWO6vsmbRu2zWHqmoj9qkePPNrnhTLcTjmHrne+d/zLPK6z0jUwS0wCS/W6okF4RqNN31DV/l7DJdblmlevbgDgVa2p2yLyB5T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOhCx7ALjy9/9XCtemnZr/9+r0ypiJ9QqE2gP8BxOXjZXO9P3bIUekBSKj3c?=
 =?us-ascii?Q?9u6D05LAnqehqoo17zz7RQNLoAotV0gIRqrugL5/wPtom44m3HaHr9sgOgpI?=
 =?us-ascii?Q?jsog6Hdpi417mU7kEIhptn+QgNiH1BMYXnIV8e3UYHS6umWBdysbN7KZxb/I?=
 =?us-ascii?Q?sckwHbqqzO1IENcMKH7b4vL34UPeXbmYBxOM105tE5iobXy9jpQcCImGIsnw?=
 =?us-ascii?Q?nzWm3BYDjbLhQuJjnB2YakTILmTK7JUvtKrE7+A5aroii1HhsBaLd68s+JWa?=
 =?us-ascii?Q?9mDv/TOV/Do4ozmKsGOToihSAIPka1mD0joEUf1cnUYv2jfUupFFwnBFokM2?=
 =?us-ascii?Q?S9l63F26+PvQtv/r8x8TchiYgjRGQrSyimFRZtRbxQSZer21qaDlaM+piBPn?=
 =?us-ascii?Q?1ygMhJOdmPArJhlma4hPPWwnQRIU5DijstYtwHxsoGBnCXsrrkm/FKSRJewk?=
 =?us-ascii?Q?3DIXC1yLoYSX/lj6LI7eoVtO+VbXTypkpqxDRkg1PYAeXDCFuZzaihMO6L1w?=
 =?us-ascii?Q?qGvs2I4uYTdHrgum5VMnTxgnFe8cmiue8u5JpB5JpUm0FX7UE+3LsXN8K8on?=
 =?us-ascii?Q?+v5CqZD0iohr7JmRoLiCszKLCCFxu6XmWb1wp3XDtHnceUVd9eI8L6c3Af1Y?=
 =?us-ascii?Q?HDk8MMhLew0bD4e/fV0OqXKIhh/HI6eb3e9YQIGbMjt9oUiBYb9AJPBEoNGu?=
 =?us-ascii?Q?Dr/p6rcZVL4F4YQGxpE54P68u4eh9Hz0TmgLsBrC8tpbN16800Lh9By9pViT?=
 =?us-ascii?Q?ighUUBw1yWdaV7wvKJdw/3CA0pjdQCdugHpt84lfWmN/MAaG+j4CwExqhaSS?=
 =?us-ascii?Q?kszr6ctz6pte/iuY5ahOWwuV+W5YZ2lOnb/CWSG5bCARcITZ4XwTH7wir0sp?=
 =?us-ascii?Q?9HDGa6Va2OzPCoRY3bxD4glo5yAtp8MBqnrI4ONPXZAT3+P6PvXLsUhOdXKO?=
 =?us-ascii?Q?kHz/t4c1SKtpGUPBbkcjNnxQ9ADGYw8zmlVDupicMvh8PLl2Q0o7p14GHDKq?=
 =?us-ascii?Q?6Y7asjsoFX67NrKMHggJKi/92FUbykaJQtDhwxarQ+Y/X9ndrKvOR+34xho4?=
 =?us-ascii?Q?jrsbjW641+68ufb5qPp5/Ndr6AxPbC6B3uzR3iIEju44LmlThe5n8Tq4fvbx?=
 =?us-ascii?Q?9orFPzBZAjTKaGIExrnKLNizwurtzOa8jAPnKGN4nT1P17vN/wBa0SPF530B?=
 =?us-ascii?Q?MtplXNBTXc5KQKgRK6AKGWeY+NxsiXVx8K/9kJF7atIHHdpvZx1EQudwL3Ei?=
 =?us-ascii?Q?g6La7DyMSUYcSLp1xQnUQrwtEKxzA2wAjxK34yjTdV0y2tY6iivzPUazva5n?=
 =?us-ascii?Q?uaoSn85mqAlWOrtQOzD4d384dUukD9yHfXyuAr3nE3wQUKfu1Sx+b49nhTDN?=
 =?us-ascii?Q?VWC5pluwonLRThoP2zSJRJ4W2frdomOnDQBBbHxAsqw7Z2E18p306hESgGh9?=
 =?us-ascii?Q?IR5cgu43uUKGCjUk0tLgsivAoz2VzXrMHPKIc6MaekivoPTMfRkTojnhEg8G?=
 =?us-ascii?Q?S16oh0XIG/4qFgVJgzX9Mwr9uR5Kx7PiyY0aYAcmXeK3LytOoW2mdqeGG6wZ?=
 =?us-ascii?Q?0HMoQpDT0qyNqIXbz1fVvUmslc4Di+rUXX72SljHNsBUtDtKODoxCfo0QAu2?=
 =?us-ascii?Q?aRKabMXiAm+ihgiT/LQ59OqHR6uFy8cKWHKo9YgadXzVZ0mSEV3rVDg7NSCJ?=
 =?us-ascii?Q?xOH9gm7ylDR5jlzVbtnTwMOzB8OJQLKLT8bJ2U0Qp1UeLnEq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9862727f-f8df-42a2-eef4-08deb836d01c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:17:49.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDLWw/pg6Cm2ehclXdCUaz9n5hZYGmRK0PWP0imLXbZuY9NvyOMmIAIcpPEUQlSdWjisHumsZ+LOB3at3eaMvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12323
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33036-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: C04285B955E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:06PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The controller uses DATBAS registers on TX/RX logic. Clean the DATBAS
> register for the detached I3C device to avoid issues.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index c009d0de6a2b..d32646deb69f 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -922,6 +922,8 @@ static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>
> +	renesas_writel(i3c->regs, DATBAS(data->index), 0);
> +
>  	i3c_dev_set_master_data(dev, NULL);
>  	i3c->addrs[data->index] = 0;
>  	i3c->free_pos |= BIT(data->index);
> --
> 2.43.0
>

