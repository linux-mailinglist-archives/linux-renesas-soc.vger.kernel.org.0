Return-Path: <linux-renesas-soc+bounces-33038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BI4CpWsEGrKcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:20:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E45B9654
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6253300DE15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52901370D58;
	Fri, 22 May 2026 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iRkyeke9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F0E36B05E;
	Fri, 22 May 2026 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477650; cv=fail; b=hw5pnTD7upFEU0jd0q5GFc4f4QsNX26cAR3AVUYBbhmoPwVzz1sKhPY87WD30RIhm3xjjSqybnVXf04eojfIowtultYehewWVmmSFwB1LH+DTdFa/qITGrINZ2ny2sqzTGEUXBRFQkEOH/YsyfSqVfhjiqlBiGxsBUvOyq9MRys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477650; c=relaxed/simple;
	bh=qWez4FHTCb0jV9lSZhAPEa20wW7qwK14UvRkqDiqK3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lwVTpZTDKbeJ0p0BTv+lc2wTmyHknyWqaCF9ynW3FymC2yj8rB1ggm4aEb4nXVGPEYzdDNT5M1lvX0f6V++mh20Ilyn+Cxv/aP5jbUgXcWQGxsQo868r75HSzob9lDWj1rNizI9m6RC0UVtq1KGzHr+TZpyRBMgpPcR2FDSEHCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iRkyeke9; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJVa6GOwr8jwacc5tpXCyHhxpxpf5TDnAsTWVX9gw9JzKF5LAQcmyg59ynwxs33fhMMu4BZpKzTXaimOipVTIDZP+MqxrRJzuIPneZEg1Xh1RcFR8yGf/1qecgr3uqbpXPh89QSMUEFFd+g951c4Co+/BP6SoprGxPbe/b/nr5AymGfFAE9nhfOnD4RmXetPMVQ+rb6u/Z7IzVh+V0Be6lb/W4PldCfCi0pOLJn7FdRBg0+npL0b4YUbHXip628YW89C82Tq+wefoPy/oTB8DZtRkTGQpmuJHt2rtSPsJBNfyoiePu+Va8nhnWj/LD2gF/iLP2yCvIA2TLcgQRCBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpqyXChmiawRkolZyPsPxma1NSOSnPHLHxK1QTcpt9I=;
 b=caUMJWDE4HEYakcIY/DDxW8tFaASoOir6ofYnUM+aq+oQnguSMcCgdsLuk6GASgBgF1hAlC0DCOU4DmWqMqMgKNVHxgg+o3UBGxFD9rk8JdZvEHzLKzlST+FzH9qMRNWZFKz1CrpgYxhOSHTbTUe1Jin+4Xl58VVMVOeN7Lx1ZCLtZR/iMGTk04DRcMfg1erTKvWQJ4YlJZXqcI0iBsGBTAMFnI4kBuoA853LzLFqMIy21JWhNvxH8g6AjhLY2ttCZYM78gIJ8hnIixuCr8wiBOWeBDcIpTW47m7/QoZ3tsvEMCwOT1hfQYfroXsGqD+77Eqe+pnwuJsjO3BLoI9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpqyXChmiawRkolZyPsPxma1NSOSnPHLHxK1QTcpt9I=;
 b=iRkyeke9d9uNHckz4SgWGvZr9Dud7ltqVzFF+AZApoAYypAR6wVAgLvdwXo6gUI4Cu6yBagcmXcyVxUw5BEQahhKx9RA0/fhKX0Y5D5XTo40wrm9XN7vSSOLx/ldbvh+GDk2TfL3nzGLRrRV6aKf4qMyHpHRkxXg8GFP4cWKmhNEOw1GK7mH6ezg8KGSBXQr+to73qOsFtD+0FzNXZ7eYzAqrfS1g7AesVf1rAGxj8TJ4sPvOCMFyyc0ul0rWAHUyEkd41bdR6kpA/LQ8L6f0ZJEfxK7J+rRTHTi5e0nfDBkgj5EpXakLZCajU/w4j/G24Qwwj2qFzaAdJQWAyGN/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12323.eurprd04.prod.outlook.com (2603:10a6:800:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:20:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:20:46 +0000
Date: Fri, 22 May 2026 15:20:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 10/17] i3c: renesas: Return immediately if there is
 nothing to transfer
Message-ID: <ahCsh0KNoZedtNsn@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-11-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-11-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SA9PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:806:22::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12323:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c90b89-a927-4d81-5212-08deb837397a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|22082099003|18002099003|56012099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	V5aMHZTEd7LC/ktEh857gRTSY6NVwgqrGBFx14ly/ZGmd6Nhzi12wfGUeGfSdLrtCU1HMLz3M67nW7u5gYIk4erEah7Fl24dgrlnYO6GYU0Pcpdg3adkCTudEdPknzxTyE8nYzQ1aLXgjI7VjxlsB8l8/zrs4tvEGzIW46sX+uM8c/phrxg8shkT+IQgX8OumdqzwhJl4h8drJUIkpwb0X3qP5B/bYoY2/ekXd6wvGyGqYwDaTjPIgaRKAfueTgez2bXJ0rqB8t791V2GGtBgPFzj5csKHQJLz5ELwups3OeqvzZhwOirjku/41oV1t6XZHStuEpDgjJi7bs+SekXC8sYgwHZdyyFmllYQ7bhL3o/GPkv7PKeTpvtFYVGwUhdzlbXnA76VDHEgbeXCWkvD3Yz/6q2CA2Bore/3C8UlPBp6W8t/0GHnDtnC01lOq/YNPoiFSiz8wMQfByoaYkxNhNp9TfAfYigIMw1Rv63D5qUYAQZbkaJOlldJ3eKxs7/yfCzfLFzlY4vUnWMioBr1A5l4FxumzdYKS1dq9Tprvg9vmVLmCvDQYFogXZwF8uIsjgets/MaNYFwrKaXc8T4XFkkRByoHqMcsgZ2FmwzsaW2Ek1uM96yvUNuJGN0CMzrwL8UqzJIc4+fV7MtGizF0s18FS/awS/x0l1sJhF3wIjuYBVWahheCFLz+9fBlBU8zCMysKAkngb0mxzaCWbe3r3Sh8AT+/0zLHX84oZ24C+OEVLcnbKz87ZQmwG8R3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXSoTLNp6fwXHw6taQlqbByzwd9LcgAL6KNi3ykVHvzt+DvGwU1n/VYM1QMx?=
 =?us-ascii?Q?CMrJnkUNcKKKc9imHDk0biKk8Qw2PGmWrD6Rb/hQVJ5IyOef/V20nw9KQQnj?=
 =?us-ascii?Q?io5TIB+rQNz54B1pxJv4NYic555ygjAhoIPG3GB4WTA3w57OmU8u9wJ0bnx3?=
 =?us-ascii?Q?hc9Iuw9WLmI2WsHp9dbgVICvuV9VZMd2+ic/KGfND6WroQdHicjrJw9hVPa3?=
 =?us-ascii?Q?fi2ZZIbeZLRyyDoloCGLBINJCvwhtae7aQC8dv99mRUrcd/ZRRVmnER+ymjt?=
 =?us-ascii?Q?acqzSLMIUw91twuHQrcP1is+kLoT3zcnSDvax14RjeyKGFWgmFE0iSDPvXfG?=
 =?us-ascii?Q?Vhxn9XQ4/97C3FcYW/rJCe7DuOGL69uRS95+p+2XLTWTYVwZne1w7ajf3q3F?=
 =?us-ascii?Q?I3FS+jrn8gUv0Uq7TRl/gpJFIYNFu8xaNow6kC1hq3rGB1boL7NUzhkPhLs3?=
 =?us-ascii?Q?0RsllJKzpB8xz7FVwQcUOBb5K7wZPUB4ZttY8udY0m1K8oQqtS6rbAGh3pJu?=
 =?us-ascii?Q?BZ3KYJnGhl1//4U01NzN9huhIC3j7SbR+v9aLlrDsXJxCdYOL1vhEaEo3wSr?=
 =?us-ascii?Q?ppjwFT+yNBNWyQlDzFiQc5g1NqwVMSm2Tsx/KouKML/xypdXEDO0o35uBgxU?=
 =?us-ascii?Q?qsZOipq/EAfksu0MwQeQxB6hNI/C22cnv9wOjubYJRI3xrXJmk6pMKFpgcNl?=
 =?us-ascii?Q?J/CVE3/sQ0f32EVR03gV403dP1KuXLyQBaTjh/UQ0CGIw6vmcPluOOEZ04Qr?=
 =?us-ascii?Q?aE2DwplycI7NMvNss80q/JLM5YH/WhveWq+bymyDRIS/8kD8wVyO48GMLLJA?=
 =?us-ascii?Q?Q2H1Y4uVwIHLLdclRxdmz0nZbZRT0G9jYZVXM4PfcqjccfBVoLb1kkNZzoed?=
 =?us-ascii?Q?KT+5sHX8Dzm8aLEyfPZhDIDgAsje4uvCi8DPSY4cOrMBegIHvIjrEbLZNRfG?=
 =?us-ascii?Q?x5Do+v/IvLO9S/+S/oWnpThm3Mgr4lbSDGs/6EZ+lLDKPKXU+ZsOIQgxlMDZ?=
 =?us-ascii?Q?/RtpkWDe0aNZoGPul0B9j1yF/BjkVrZXxR0Cfv8YJp7hyp0awP9Ylri5CjmK?=
 =?us-ascii?Q?tBafRcWlZdGccspayse/ahsJUHRkhzIwEUWSceScXxwQ+B1CGzF1rT2mMheF?=
 =?us-ascii?Q?/JyJWeXTaj0BtGe3S5z9K3veq8qMJhPZrckwUVC4Hcl5o94kmcuhqilm4fNO?=
 =?us-ascii?Q?HvYwwi+gQDI+rQqJ9XHkMxNVYzY2+GHvyFGhjM+f/5AC474/lOHoQQl8GtxX?=
 =?us-ascii?Q?wcObuV2iRsJgM6sskcM37piGpCwkrHFjAibTH+bHaEGhkr2Amywc13nwSDmI?=
 =?us-ascii?Q?zdiQGZSUCEjvojP+PUBPskIVo+Hv2BY1XNAChQo/Dy56XFGCb817dTZxY3Mj?=
 =?us-ascii?Q?aOHvgPqn2hfrefkIzJ1dLspx5j7GlBeJNpAbpByjS3pTRfTcixPyFBMUlW+O?=
 =?us-ascii?Q?PCuBJL1eXx7XeudG1VIUjFhEpDg85VBFrNnp1jUVp+0vFg+RBByjzF82SDw7?=
 =?us-ascii?Q?O5nXQAea7lalX57Zk1ZUs9naetTPXzK73Nrcq6n02BD4h39h3tHiRiNhDNrk?=
 =?us-ascii?Q?T0qRXfOZAS/Ga4jggx/ztk/vAVsl8ctwNzq3z2g3xvsUcl2WnknRsXj13jML?=
 =?us-ascii?Q?pkPAjjualLOH8uT3HhbWO5ir9z1W0dOYJqwcNDrxWtHm+AgZDEeg0ZkAwk3/?=
 =?us-ascii?Q?rRlfQXwtgbPCuTclnZkFf8WrCiq9h3thM0+8ai9srREJ7htZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c90b89-a927-4d81-5212-08deb837397a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:20:46.2501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3dl0mSSXUzlSmjWLqUUl87foXRo/GhufwaFdT74rRH29KP2xKMhriKwtDdTShW0tVnK/saKwg+LUWWb2QdK3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12323
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
	TAGGED_FROM(0.00)[bounces-33038-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 798E45B9654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

subject:
	 Return immediately if nothing transfer

Frank

On Fri, May 22, 2026 at 01:18:08PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There is no need to allocate a transfer structure when i2c_nxfers is zero.
> Return immediately instead of unnecessarily allocating memory.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index e5963270d6e5..de75125eb013 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -940,13 +940,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
>  	u8 start_bit = CNDCTL_STCND;
>  	int i;
>
> +	if (!i2c_nxfers)
> +		return 0;
> +
>  	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
>  	if (!xfer)
>  		return -ENOMEM;
>
> -	if (!i2c_nxfers)
> -		return 0;
> -
>  	renesas_i3c_bus_enable(m, false);
>
>  	init_completion(&xfer->comp);
> --
> 2.43.0
>

