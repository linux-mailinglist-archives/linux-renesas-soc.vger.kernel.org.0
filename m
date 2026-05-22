Return-Path: <linux-renesas-soc+bounces-33030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCjlBFapEGqwcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:07:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 617335B943B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EFA3300B131
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44CF2BF3F4;
	Fri, 22 May 2026 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SZXTjQrD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8564367282;
	Fri, 22 May 2026 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476814; cv=fail; b=IP1uRL4bFPwrHw+NRMISIhZ9vevHlhlkPz3ivTEzoSTxrdaD8un5ysrdBju3GH/0wqiogwXCZjk+q8QfwVsa5U418ARA/g0RpIaeN4I0QDRbD2ao1SNeL+0uA+J3X9j/IVneXrBsPnDXChFcmH6LvpbZJh6GOKy6Ir5GrvgJKGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476814; c=relaxed/simple;
	bh=pn49rOEirXIwH6efxcq5tbmvdArugKj7XWikoQuAf0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GH82NH6ST7kabseSYlTeVzEm0eYlnfUyE4DIREFjtHqlCOkX5wUwEGSv8C6E8IfPi095D1YACZ2kY5/L5oHH7y/Yy6wQ/Smd8Nb//23d6Zay+gQpU6lPXnJbohQMbwIzUuxKZMlZRf6BISIZdTbqIOZMCCBnWjXdRo3DiHfYMoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SZXTjQrD; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyAMvkNcqS6XOsIxoqWNTq/q0eGEW0rcsP2VvVJS7qxrE6tsGa14q4hNXNNND8uLAOJ4XHejXm1RFEfHIjRveDDTeFTuoIgY7MfOBpm30HYtx9tnTYROoU4chpPX6onRxf5J+mCpi4Q/iGZSAql27tTxTw/vlXwAGif23DfDByl6wJmbkOmfjqNuJoSmk0xXtQo9aWoQUSLpTvYMdTow++EQey9JwqXqv9MrKuEIV40f6qXXJOA4oiQ94tDNSlEp5Xv4FhidEBZuzRPooqJHITLOzSb0r6a3+eRAl3cP/OfSI3U4tAbLAZIRFiz7EkYR6VVGE8IiJTWVEpfC/Kf+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8LrZ4Wb54rh6bIw80kcaQQ0ZLOTYM1OmEwcDpjKtsE=;
 b=JuptSR0hRu1qgdG+zt9aJLb+tfKggAP5pyyKxuAvPCyu+2g3DdBa7MMAbh4eeaeEmcd+1gPSCMut3Cv5ChjtGKnk0Pcriik2OJB5CN0XtGrRDCzL3Im2xXJT/i2DpWQRrYQvq3hIzU2aqXXOo6y7RTmUD4jVAUUGlmNdySgOflrAeLZjRgAI2JrhrFE5XmjwFarEtv3dwDC0jQRMis6Ug/rAkBGs90+sFfBi2SE+50N9BSyXEd2cwm15jmu9ZDSHWaRa3oWfRnS4tATcI54MDn/wvhztIWcIR7fUDpIBHWN6QcgZuRZQYIvPN5jmjC+ReZCmRaP5jAZ4UEW2GDUm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8LrZ4Wb54rh6bIw80kcaQQ0ZLOTYM1OmEwcDpjKtsE=;
 b=SZXTjQrDRLkCT3uQyFMScN8R2kwiE2dqv37SeBzridgnCFOIOF7gzXg7hH0kYg2FV65igHf5CfB1q8SCiuTQZbLmvr5UDduBeTxF7wI/zwYrxl72/CnwfGovvApzMFIKWL5R92e/VuHqRlj/BwJMeZYLu+mv7zghnrQVb9cKtp44p5PV+iFxD45AsxeH09Lc+z6pyk0iBRSitErW0zq8yX821/jPEBNN2ZSiS17CY2zInsdbCEOsI/ravMtComJ7RISuIb76sDqH4w+hmUcdBdmwP63DdPxtCdN9bJwi7/8J7pzFOdyzXNXQV03opOEUDJHANuHCQ8VMHffViN37tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:06:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:06:48 +0000
Date: Fri, 22 May 2026 15:06:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 02/17] i3c: renesas: Use the divider 128
Message-ID: <ahCpQUIH9_8mB0CP@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-3-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-3-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SA9PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:806:27::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: e87e1e06-a028-4f12-123a-08deb83545e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|56012099003|22082099003|18002099003|38350700014|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fjNv7w64LHN8JJCbQWzwMSPJwgR03gvVaharVzQzsaAEAOrz1JuAHo7guUojvw2aRkB1PXUCu/eB4QBs9EeujJOmMLc/ASX9SYff/XugIr/xWBWOljAJU5r23IVNf43nN8Xd0HX3lOMXrlnXpyEr7WAXI/I4KRrjHxNIYDnkmrZwda1Kitd1lG/DrznUK0Tt3x4SV5I2DLNV7d08RjvmBPlRBSNIfrWX733lDlr9DTIPLl93XZ+Fat8BQ1LF4/VRBxDn7gBOOhxnNzds22ptgblDLVnk89vIdgzjSyL8PXHlS/hfRLzEiHRtZGyzwz0dUfRtyRX1Q3UyLi1udTzkyOjy9FUQVYZNCTIIUHfY13e2itK1M9JEc4GfyGsUeXvWOAw4Egl/YCkQC6PVsg80a8Mk76EzObNLkHJvlgwPij0ATNoUZrVZ67Wk8EnYnRB59auXmESutpf0IxXKncpqAUrqIvHKO5c+U8RL1An/LJ1hOMFscicVgnhrxRgcybQIN+BtANfDeUlFEHDdkfnbZVMRdrb9oQWEYa6mnPNMjAr6UsRydCIHRUtowdYCyMs7k2s86MY1XvwF7QF5kOm0Ck498v++mecHCXbs4tlB884WDb9UvD2/kCVmM9ipSgJY5cVy+2M7cZKxQz3L4ckd27mYrMb8F+X1VYZwtRCd1O+N/YaFGwP8Tk6I9reYTKUJyjoz7OFnkWX4utzl+mMiRZTMXWQTYx9lU8XW8Fp7RsBKYyBt6N1EQwVmCKNGsWbz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(56012099003)(22082099003)(18002099003)(38350700014)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3nx+ttGB4Bxb2oPX0axEu4Ojqxbj3byZcFDp1BnJHp4VLjMjle95QKkbu1J5?=
 =?us-ascii?Q?joOvC/A2gKHhvhr3+6UiQjiG7WFWi1pi2cKKyyLmIZeHtSozTNIWHVHG+it5?=
 =?us-ascii?Q?/YrgD5imHSSa+K8O5CkerAl9oaHoLsFXamaLgfSSoisw0HhfuWYvCmFjY2kI?=
 =?us-ascii?Q?4k3UyAlFSKZCsG0QfhLTiyNI8SJ3SmAuNGSl2PQsVl6f7Zs2AKas42+bsjEX?=
 =?us-ascii?Q?JHIGqyBSNizXIbDX0YCT49MFvYJ/iB3bdl+6keNLxIKmEAmsK75Tq+wHF6sw?=
 =?us-ascii?Q?Je+9chag3w9xt3lW3DgLdftTrSq6vF2wicv0RcqykJ0Q2GJRAfXLFOqdbC9v?=
 =?us-ascii?Q?H2tOnQPFTV6IxgNBxSktD1wwih3MFe68T9ED2hJ97Bfdwo6QqbOez2WoU3RP?=
 =?us-ascii?Q?hQW8tubo0D7XHp4GrCY26rMThFFPoF69D1akEDg0Y3cFFFlBTDQ3YXiemjBU?=
 =?us-ascii?Q?0l4098j0D0LBbU6sXLaR2QVr4q/F0hF7rH7r+8/VwcbwILFGjTTBDOUYTBGt?=
 =?us-ascii?Q?l3LmERMllU31lCgGbOUTBSltlxntP2GePFYAkfvLuNNHHEo62WkwLmSp57cf?=
 =?us-ascii?Q?Ap0503eeqiZPobQ2f7oO+o2hHFlXJY1TBG7Azf+I8P39GDlqgMQ7/ZvrP42M?=
 =?us-ascii?Q?YbK8IJhVTDyoyuBCXul13rOq+xXsyNhVCZREoQ8U98iHYSFA1x2N+b5I/re7?=
 =?us-ascii?Q?rOrnsTw+7j8o0vGVJbw1gEpoMv9bWIPOPQw6iSr5h3uBvgCbIeob96WIPCNT?=
 =?us-ascii?Q?S+gXBkt6m9ggSme1/Xss1se56sbk8kwi6afIw+uoUu+nRZXTKIgohjzZy9am?=
 =?us-ascii?Q?jwQxw3T6RcMk0McvVa10JGwFdRC0TFRukynqORRkgKbhCJOhAUr8b7doWKT9?=
 =?us-ascii?Q?KqsFlwpQVL65EkHPI/YRIYncAX9tH+QftU/oRUsfQ/Dp0kbCaItn/+8Uo0Gf?=
 =?us-ascii?Q?ry6mUXRHzjp5l7dHSiyl9zK9eM07O1Gv5iNdAIpu9DLmWrJZgF2kZN1Zty+G?=
 =?us-ascii?Q?kZ/JN2ig/SyncKIJDAsKKKR0hNAubUPLJjlAD6zfWoCOKw1Z/UKy2AIaQqWK?=
 =?us-ascii?Q?TiYZAg6qMwdPOXcUA67b6ucLozOf47G8sgieaxfccvk9+Ag/jEp8qQW1zA3q?=
 =?us-ascii?Q?tLR6v8125c5wgPzxw520cYoZLA1K6pVCzXK00qFKtD3nXcUhLwwGbeoKcEx6?=
 =?us-ascii?Q?kj+Wr/Ft3P19/b9SsfZHizfauoZu+yKg8I0KZubdRL5nce/1bNb4xQfxS7SC?=
 =?us-ascii?Q?zWQ7A8Sk4rEtcaWjQrC+MUL0HzBFgAY6aQUYkx/BgF2TOx0boydv62HGM2fc?=
 =?us-ascii?Q?jlOrvDTcVLNxYE+AFof4QXdjQxhffGq18aQ1U4QrlJJTx1ocgYNcoSxkbXlZ?=
 =?us-ascii?Q?vUS7afL8gzwIFpXx3ZZQvuW5QyfKrCXK+8ncQMFkI/Zp/g4hF6GmPPYpeGbi?=
 =?us-ascii?Q?D1HwJTZTjZIfcfR0ksN+4aBzs8olxu/Y1o2i5gqS2TPos1k+Sw25R5SeV4IT?=
 =?us-ascii?Q?GEK6rWuJjmVDNTDM367vzco7yRhrvcvFfnQ9XDC3AcNb0bHmOJH4kmkqsNo9?=
 =?us-ascii?Q?KEyrFK+l4VUQ5DVIzO4moz+rKpuWTUnIHZRse35OxxdCJlUfeEOVWxNw3mKW?=
 =?us-ascii?Q?Ol+ebyspJFrQbQjEQr6WyQQl4Ocm+J3STy5M1HmwZcxdZT9xEDtoYRDxfngC?=
 =?us-ascii?Q?H4MkQYDcMj7Lkzcb16NMUZIDv5SX1IlB6a/ypurxDXa7PtFpp8chtXPX1HEW?=
 =?us-ascii?Q?OEH1gbJN3Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87e1e06-a028-4f12-123a-08deb83545e0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:06:48.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5rnhWT1AIUtERCkC5reuCXhG0qptIYsQJKO6uHi5p/9WZcmlKu4x6XeVfy/2ndhsyGvHLvR6SOSoIlry4MXfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
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
	TAGGED_FROM(0.00)[bounces-33030-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 617335B943B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:00PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The REFCKCTL.IREFCKS field is 3 bits wide, and setting it to 7 selects a
> divider of 128 for the internal reference clock. Use this divider value.

This doesnot reflect what your change, code add one more search for clks = 7

Frank

>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 36e3ccbe66b0..1917549cf6d5 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -559,7 +559,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>
>  	i2c_parse_fw_timings(&m->dev, &t, true);
>
> -	for (cks = 0; cks < 7; cks++) {
> +	for (cks = 0; cks <= 7; cks++) {
>  		/* SCL low-period calculation in Open-drain mode */
>  		od_low_ticks = ((i2c_total_ticks * 6) / 10);
>
> --
> 2.43.0
>

