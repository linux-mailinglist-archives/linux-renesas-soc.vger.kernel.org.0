Return-Path: <linux-renesas-soc+bounces-33029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN99CGWoEGqYbwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:03:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B52715B940A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 142B430067B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D8E277026;
	Fri, 22 May 2026 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E80jTN0h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DE41F7916;
	Fri, 22 May 2026 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476576; cv=fail; b=K5lNdgPwepu7WmrrrXq17Ge9Tq2IZIqpuDz0XWF1TVf3VudQb7wyKOKCgUTg/C5mZUMP5B5TUnt+v/SCKlOHIy5kIYnmyHdJh01cxrFHuhDL41abYHGAwS7+KbmcwXPY1oKNi78kB0IkEkYqaA9brl2gSW8E2EhkQ7scKj93Vhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476576; c=relaxed/simple;
	bh=YuVRclhOTu40keQ/GzLJJaMTQe5rT6GvO3Ez71unKLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S3N10c8x0Aky6zeFRPkrkZ+pZuT278E5oRLr9bWHapPZLaKNl3cuyTK9420RpSMPdNGs5FcWUA0ezYcSK99X8CUP6aOW2EWqQ5wrjtex/PpHOo4Iiy9lRBl2PVxKyI87op01Raa1aeTc7Ui8uOOhIwa0E/GDXzrpA74lAcZnPiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E80jTN0h; arc=fail smtp.client-ip=52.101.66.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEgiYRoyANTUXkBX85i/0l3ckfmkvkW1+MfKDkOhJAXOB9yX2kaPlPVYDMLxQYLEzyHI39ATbM6tCpv21hSSyO3KkAnIGGc9S6rK++HyOoxe3opJ+OT7eGRTrbgUz8OWKcRnyOOdlnB6tudkErFatDL8NUd5woLg5cAq8cke2xdF3vIFTRMZxOn5bUUmf+TRj5gulS9X6uX7PKamizNlW7ujoUhrPF0ndsMhjIhResIY1KKxqN4kKs0nKfRuIlWkopL2vwk7Eh24oHqdxdiTZ5/Sg4ph/F0yH8OUkIgRMw4iIdkcizirPNQ7IM2GsDc9NoU3djOEptEKlKNeX+Kqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GgBMJfJAGrtcoUj1vDKAKMFHUdFDEcn635ucO8UR+0=;
 b=JrdIt6DZihksSTQ8pIWaW8afxX2WAcz4yrspmIIcUEzvs8G5DJlDv54Yka99ALRGjej1kYoE4ZwEbKe8eerbqzsHIqtzA9g5LCCTArRdT8bqqlrxDpBCYzMskIvAQdNAkOt0SZq+yxLOg4S71McpXYLdyc+QZvwCJfp06aaEfIdPTYmk0lnZncqzGde1juPyZaFdp2Pjxg55e7uyrts0/4b/JmrFsodBg8/nUbTSyZ5Au2s8y5+dPcyw9Ph+qOYI/V/dZNPWYgv5J65kU5tUiVgOmYQRI9EMEoB3zvnR2CMqijoRE8YBs8Ue9IB9h1EloJnxS0ki/L11q19zPQi7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GgBMJfJAGrtcoUj1vDKAKMFHUdFDEcn635ucO8UR+0=;
 b=E80jTN0h4LIMcpBLh3cgzqCJA/wo14cSjSgvUainvjgBTy+EVXf2pdgiL3ROjYegNZViqWQn4aE1k+TDsKgyCRJyATnvwyhusD3NysNDOBaadvTLRzVsOeyg5pDHLZwGXMd14+E2/YwH3XydWiiFcrJyvz/+jgItqdmgRAQq2HFIAtUVduL9VW3dtRuBjCuBtuHj3Bgt3ZHBzV/Evv1/duYFff0DonZI5n7dBWKA+keGmz46PpvCmpZ1DFQEWn8p9JmgWQEXVp5xqADEHFYDw/kKhmq1F9bjfrDfmbTez9OJEc54/GtnGEjuHdQ0qvI7YGnXDG0vGrgk8CpVnmrQbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:02:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:02:51 +0000
Date: Fri, 22 May 2026 15:02:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 01/17] i3c: renesas: Check that the transfer is valid
 before accessing it
Message-ID: <ahCoVI9yIJ5Bsbq3@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-2-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-2-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH8PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:510:23c::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: ef40f444-9633-4cd7-38a0-08deb834b8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|56012099003|22082099003|18002099003|38350700014|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YjWQ3lXyozkISbdGvZEk+FNzz8iFFNFePlkYNGyc8k5oW8WBR4nCMko7B3D73/OKK9uJqs7i/zLeIIJLnaquICm5SMHzqRAOdNto0meY3q+V1zhJPEEnsc8Muk+rviP07ZHvGqdaEd8sIDIttVSoK603wnBsHgbK1h+Iikg/gGxd613BmCIUcIDV/qb9fbHfMlfo3TqgUcX1Ep36rvhR3k3QsCTxZE172iHCoTs+d18M/aCxq8HNdrEzBgFnxbarCuzW332YGN18K7SYuS5LRIjcEtH/JuawtDpEJ7Zgr89/d2D3w5qk4HUEO7Pnq5f7kXt0mNkjKnmnICEYLUvSDrwyhoJITwTP8J4z6nPTYpCDmarlLctrH9AgDzbVjw7ZfSGJHZGLA803OTi+WL+96f39+WDxcn5iI0rqxjUylMqDXDxdvET5GtYKds/Goxj73IENzXM4UYMV0yvwtx50JDxULfWwfH8socEC9rR+UcwiiLL+GVsEhmvBnC8OeatkZ+cRopLxyljBycs+uBB8H5aSXGe5OcAL21TokbxSE4QcFizttrIJXMam+Ti0r5gzpr8/Ne1QjJ9gI5cfz9POkTjgm6WLrQVvQeGqoFZ7OXglvmzZCcvPe/2TYCg9k0KGPrlN9AeqohBOR2PuxViWeEJdYqoL+YWMKyKoV9oU3JNVcHLa/IaYpHM+kwAas/O1HsmK1JTprkJvryiCOO6xEtfLi7F6E7Zfmt6MeNB42ZzLvV3A4rvyL+8yx4EuGiuj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(56012099003)(22082099003)(18002099003)(38350700014)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8L6SNFTJ/7UXp1xX6ntNgXSxlNnLNMyyYTOEY2bqs91Ctk7q5wpe64XcPOPb?=
 =?us-ascii?Q?0mSKmRf/C2pwMCXuJj8AC9UBTqJHsx6AOhmOd9akSx4Galb9JHN06XhBXcIL?=
 =?us-ascii?Q?f9lf++WJ+XsESbaDGWuV/w3AFS2GZdyPwUUfUizuX6HcV0c70TsRfQsSR4UI?=
 =?us-ascii?Q?W08HkxzIKz3SHMoL6tqTTmMKLw847JudXiAAlRuFBolhRFLVjGTo1cR6gNi7?=
 =?us-ascii?Q?vpA27NA/LKtjBsS31NuLEwVppg04hd+5LfkEjxJ/Ui+eKE6+Yguwb27CksTf?=
 =?us-ascii?Q?v6J6gAWh00Krj2o5UvJLg+pnorJ6AoiPNhyIU5BzfDJ2Jsv+orFZLpGfELqy?=
 =?us-ascii?Q?6g6sg3L5vnx0ydMnJRa/MoOCiHBnf0RzK74xffZDbLHYhRdVlQaOamGPp19V?=
 =?us-ascii?Q?ZlWDskyyRJFnR9dFi+7589PlllNTA3Y14rgOjkZsgIo1azyBrK1a1p71jqiI?=
 =?us-ascii?Q?wA81dd/X4O5DEdNzfLb2P1pL29HmvNSyG4dB1wA3s95Oekn/i36jw3/pM+AK?=
 =?us-ascii?Q?1fO7bcLXystlULXUmGHLheGS+pHlfMBb9go8Qi/OSLzKKjHRAWn7JJQAkFF8?=
 =?us-ascii?Q?sFYviRTwn+EKlHKfswMG6RGRQxOhjplVBunOwGaoTwNGcd+AID0z9N9WU+Vr?=
 =?us-ascii?Q?+VaXb5ahVql4jdJAP4w7PjRN7qiCSgT1FgmaTV9yP6UzIf/HI7yuzcIkBI06?=
 =?us-ascii?Q?l36RiUNd+6ESgcDpSRHv7CFaslLFlcoYg2FI9ACKN9h2QJ/oDuF68NSwKRqT?=
 =?us-ascii?Q?hAxE1BPvL/GxRyCJIiEtXp9gonTrWML3LOYOejm/wwP3P/esunKr62pvaPUn?=
 =?us-ascii?Q?RiP6Xu0Jd+ATl6E9GieNvEZRjX+/euufFRfXgknJv2e4CM092xIpPb9hWx+r?=
 =?us-ascii?Q?agPL8JhMUsHKX0VtyaPpkTnXh0n836iY3YtFvY9mkf9pFw1TrFLcdNjimXW3?=
 =?us-ascii?Q?0H0EdU4IJ5chSCU8l4SFoyk2ntV+vGzSmaZmXWalWEzHzXjeCP5KE3swKRWA?=
 =?us-ascii?Q?3MNRBvM29OHvKT8pQVWQ+aN/+ViNgzUppRBafbxfFuZqxsZItUmkPde5a3mT?=
 =?us-ascii?Q?+6xP7s5EAQetlV6RhBjvSWc6Pu2hiDF2utVv/N6tZqHigDpfmu1AuHz9vCpD?=
 =?us-ascii?Q?MV8uo9c65Vt647WANKPYoVtsHLRsmqq5EDUG64ldLQbU4xovTJkowIUkl5vP?=
 =?us-ascii?Q?2ssxoSWsGsJf9ZoShNRaGeUsVsWshyp8/DmIuZC9fMYn9S/o1xXL64zNaZUI?=
 =?us-ascii?Q?TNrcT/rZ4EimlXUBFnKZHgaEqu3r2xyP+PTqLCrEuj2Q+G9Gaz5Pi5UELJ5Q?=
 =?us-ascii?Q?Lv466hw/L2aXqsRLhTmFWiGvUkuvkvv67+giZf0bNxXEnUyHobw/gOwQJtUy?=
 =?us-ascii?Q?B3tyIa3HCdAavWD0SFo7IR83O2MAeypjH3T/Gp+taYDG1+ySoCEBgQGfDdXC?=
 =?us-ascii?Q?OKS63JqtotxLi/FqhbqvX21GgChqP6zbg8/mNyBpOfERpH3C+D6e/+ORqyM4?=
 =?us-ascii?Q?69+Dq2qmeATgNmesQo/TJWlGicEj65vbHoNmjNkqm31YHVAPpkm3qrvwK2NX?=
 =?us-ascii?Q?jSWXozJRp8cl/+DdrsKV7i7veNdXIEXSbB1SiWqXkSf3UwokjFtiyce9PU7J?=
 =?us-ascii?Q?S6TIH1izBU64XUc/hGVfY7lqY4KK/dQwKrGVhwp5M1/lSF7HqueVx7lCWoKa?=
 =?us-ascii?Q?1BFJJjNhIC1f1SjGOjoFZFY1i6l7U/mB+BxiHlIDJ9Be7oLM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef40f444-9633-4cd7-38a0-08deb834b8aa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:02:51.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p6Or9eCingqJTmNFMcULJgXaYOvaPPpZkEhscu2ivoS5QOgD8GOgi+6pYpRFaQHIWZuBgpXf9NALLe6y5j9xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
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
	TAGGED_FROM(0.00)[bounces-33029-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B52715B940A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:17:59PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas I3C driver uses an asynchronous model to transfer data. It
> prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
> The interrupt handler dequeues the transfer, updates/uses it, and signals
> the waiting thread.
>
> If the completion times out, the waiting thread dequeues the transfer and
> free it. If an interrupt fires after that, the handler may access freed
> memory, leading to crashes.
>
> Check that the transfer is still valid before accessing it in the
> interrupt handler.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index f39c449922ca..36e3ccbe66b0 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1014,6 +1014,9 @@ static irqreturn_t renesas_i3c_tx_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1054,6 +1057,9 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		/* Clear the Respone Queue Full status flag*/
> @@ -1138,6 +1144,9 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1184,6 +1193,9 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> @@ -1235,6 +1247,8 @@ static irqreturn_t renesas_i3c_stop_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
>
>  		/* read back registers to confirm writes have fully propagated */
>  		renesas_writel(i3c->regs, BST, 0);
> @@ -1259,6 +1273,9 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
>
>  	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>  		xfer = i3c->xferqueue.cur;
> +		if (!xfer)
> +			return IRQ_HANDLED;
> +
>  		cmd = xfer->cmds;
>
>  		if (xfer->is_i2c_xfer) {
> --
> 2.43.0
>

