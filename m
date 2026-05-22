Return-Path: <linux-renesas-soc+bounces-33033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IxoJjOrEGrKcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:14:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9295B94D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E94B83010398
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D1B37A4B9;
	Fri, 22 May 2026 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h7ZqNgrn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D421C37A494;
	Fri, 22 May 2026 19:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477230; cv=fail; b=uMUXlCxTly536NeY3ZMoyz8EwUUuw+jkYwDcUT2ACSBvJugKWqsC7HSyOXFLhWxUk7h++HXrt1QgyLqiqk3EAIEZ5fZdiQKvgwEb6J5KDVmopyihCe6f6osi6P7GHh6CwAOVlh/Eu4mVZ9rptutz49u4YINAuaoW/wiDqSUHcf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477230; c=relaxed/simple;
	bh=+eEr8TCjdluE4xj8HNJYNMwoxIw0xxU0cvs/UAgJQMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZCgell6Zc2Fbc9VEK0NZElf39uN+OxZSkDaClGA90leDZ9JV0XR/kRUes9+4YytDDrtWlxFIaLt51sEDA5bU9N1Yp9fbpajwVIs0s9HCaG7tBgYy4Lj+SmC3hyd+XammU96ROOk/HSMuPqo51EOmqcQxV10jagR/qnXlMy0j1Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h7ZqNgrn; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr3VOg7jsfUGSoLu+mouvp3FROAY4Cd/Oyub6dmnz6/lLiGWFp6avUlkJho0F41ipu+mRsDqzUZ5+o3Fo/eVxoS0kcTsyYHvD9FG47DmJbLNHE+Fw0ps6/NUnFtugBRKweh2+xrr7oqzjO9jO/FgXx+0ffZX5S+hM9Bd5LEEn7YhNeVFUV4FJyNstw/RDuRKXRcbd/M7nYx4yrAOvXt0EBjaKx2L2aXNvtXPholcYYy3ZnqeZj/7yry6BKgLRMgzzSQrAM0punkbzJILiAQ7e16kfnD7DeZF3wcIOP89zA7LMb8ZinM59z+PSiHTJK5c/Bw1nh4crUb2A/elxJAV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D/QHn4D6LRYMZhLxJbwlKMJXPlyVOmCoB1VHoP215E=;
 b=CWptZkyq473qWA8YqUJWlKx20miDgfHidPydSa7HNQqriuP1fGXF5ofTNRcyhmAl5uhjU3Wp7lwTe2XEmbHFV5XX89Gi3PGTLqB4EPPXT3V0US8CBRuz5Sqzu4Im8wNb4TOa8s5jz4zzFgATol1XyDZcU+pNcj8xPqnovfpnd+V09qHJI9xcMaHrBK1/s0Q+g1y/zeaOow4U+sSzogPPQRQ9IIfY7g5dXcwLgz4Z0kRRXWU/fE+tbDs8cph8CZcqSe1SJf3LXRMtBBSiRUXk1548r2XP1Lrhrcg7iMztBc+PtPSVpKO4JyEi02V4bNBB9yCZj9Pk2xtFTZp9X0bMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D/QHn4D6LRYMZhLxJbwlKMJXPlyVOmCoB1VHoP215E=;
 b=h7ZqNgrnPQTmZnl6g5ERgUmsFfm8wt3WCKnMz5Xous89kikAz/93ApFXg+wKKhVntDfu/pbh444AXO3kAkgMUGeF1vIUl0si2fCfQiefF48iI3hZxQ5Ik/eWPDM0wPZZpGtt83jJmrQdHg93skrIyFYxG8SJMev6a9eCGTX7GEDek5XKpNCGnG8wNUpjwaKjQvRnjJU2phvy1etL2cQOrqbHss67mhPLu0zxQKW8mdR6msISCkxpVtFAsLm9bPBo1j3bhessQNoY+d4H/bIpOsFD+anlh0XkcSj/DJaWRicWjo/m29xVTAkwKmvL72Kk0ksVtXcQ6f65GbEmgEWUfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10300.eurprd04.prod.outlook.com (2603:10a6:800:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:13:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:13:44 +0000
Date: Fri, 22 May 2026 15:13:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 05/17] i3c: renesas: Fix re-attach
Message-ID: <ahCq4mNIMi03Ck0K@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-6-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-6-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SA1P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10300:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dfac69-e83d-4bf6-38fd-08deb8363e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|11063799006|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bt1spXVnZcdmzVNiHtMKYUeRASD7jTP+xbpNGmA/kIvtMtw/0r0CVlfMPuY4eHEcUShfvPwqV/EuSDye0EKm8VSQf3mjNmuGNmlTqwqlumXL8Wvl1V/4RK4Lut7CUiWd2LDIBmVqCOoFbtVd3mtOLL7zZbbe6YTUiWqEjqJM7BZtPKwBAB5UGpzjNYz//fmt2or3TekgPpMPe6pn35dw0KJkv6QiUFNXzi5MeMM6wbKCJQ0HOo5CttnB+XCj0j6JTE6hBG6m66hUo0txCRfSj0wzpDNYkwY5SWTG8pE48BY4TWSu0npXqcwaEnV699x5PWMAmaA7bBOMmJQKcSfB4WYE0vDABYi61NFjomHr6vUYaiUwxuJd7+7Edp8yhrolYQxumUOkFBk24+iK+aITFS6TNdBRq6oSFtvGQDURmjbp0J+vmrem9+7ZM+SL14fgGc/p4ochVJDQtuG0WX4+Ba/+n+XXf7OuC77vGB1ujqnbd0LHyCZlP4hDYLv4R7AxTm5+nfiDoZWBT5BpBW1h06aYEsWdlXPRvEQtxNobW/p1kd+ix0eZsE+O3bz6Mdc3r6BkcK8zkg9NJFQ6/c3cx3ppWZSPY6wcs3iSm06UPj2xqT5mjk80FXpKITeevoeTu4BH+aYY13P4KHNU3wxsgkx+Y0wtFToamEdZHFMQNb48onb+HoLFVdHokGJt+Z4xUf0v6S+ezRtqY2ODw50mKueX/qfXmM4XsZrcFYVA8nNFIKIw/AF9HoZ6Z0YPK073
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(11063799006)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gQ7G3/+rBeCh3Q0kaRwXl5oSdp32bz47gE2JgLfKkRHJfF2sN3UDVRJXY3aR?=
 =?us-ascii?Q?SGz0X6uAjb7sw4d2WL/J1YYKJCL9zIx95sFxJaiGlrQXrfqohfn0nr/iXk4v?=
 =?us-ascii?Q?kvb2RPC9XxlJT5hNlAn0NZ5l7HQ2Ei8wBiXeZotVmvGAZ8ZSYby+3kFesaWn?=
 =?us-ascii?Q?KEAOXx5JlCV0KPPybk1VZ5gtbcWHsKWrfJP25gFpzyQy8qv4i2vLTfU3o5k+?=
 =?us-ascii?Q?/Jr0HTy1kBPQrkom6rA59kBPnm0kmNGChEb6sjJWSyF4HinkkFB3VfsAqbT9?=
 =?us-ascii?Q?041nomOzJUqFn8Z2xiFVx5jVdpnzAFURU+NN6MmNpv2r2eGkDh4mTmp0UYjA?=
 =?us-ascii?Q?Tayy97wZ8QzBcLVVBuGhdGBzgvU/30Pbl/r4+/QQ8jKjJRyilupj2P9jEIOI?=
 =?us-ascii?Q?45rEfdfaTRMBjT/rzrl6Ug/joPLssgy4z6BkgnX4ensOouDeYGwMYw3xNhS0?=
 =?us-ascii?Q?yBM/KSQTlkC/du5fiI4bsvVmqgld2ri+SjHFjMquYLSoW7GOp+ovY7dC0vpH?=
 =?us-ascii?Q?yYyEC9V4WbGaQYA+BCUC+fuTWHU2LHgwQD6gx3kmbu6o6JaubjfZpfGC7wwU?=
 =?us-ascii?Q?zv6mp8ucaBOAvnqytolY6ASxiT9cHcJyEuYydXeJlFjt7BDegQDfKp+7t/Bl?=
 =?us-ascii?Q?dIORr0ZBj21EwOmTHUXe/EMTCGPjRsORd9qyuUypTVpCF9OBe0DKJoP7EKox?=
 =?us-ascii?Q?ztAj7KRMAUq/MyrV1Oe2IlTImKJ9BN7jCLY411M1ykKxGdd0NiHSnsuo30iB?=
 =?us-ascii?Q?fcNPsrVkYfYFh8ePmXnVBdwqo0x8JZf4Cw16iWrqAjfQ1ytDsJ95/WCWBb/T?=
 =?us-ascii?Q?9e7CDwi/QcoMa/jSic7J4Op9h4dIUfkRFNcy6Gy9x/8zVyEqkjuACz5NvakD?=
 =?us-ascii?Q?WmVLaywR4I+SuSvoFuMRPFNY9phli70orc9ISwdtHBAKUJAyrlsFpePYl7jV?=
 =?us-ascii?Q?jSpLq4rJc47P8M3n8xLGO+bEvwx8tLm1aurEIhNFdHjNCPuLzGbQIhyV+DZs?=
 =?us-ascii?Q?c67Oz9SN5af7cOg8S88ihAZt+tHtQfBqRFbQtajO6XZiB3dd4TwT3lt79ZB3?=
 =?us-ascii?Q?ge4x6j6euA7Rcoif7iP0Ed9Sru1AnMk/mNLgqhI5g5Wigh9yJd+B+tNJKZ6D?=
 =?us-ascii?Q?DjeTTnvlwowFBVd743L/z/mlngLTrUXsM0eFr1Q9tLROs2iFVbI+QS6PRgoU?=
 =?us-ascii?Q?cIfVG/I4Frcml5kaqPzmgOuzf5X63L+DQfOVkz103jm5sJ558mo3D7/CnJ/1?=
 =?us-ascii?Q?d4dviWvKsGSRIik5GsFVoWPuIVFDbPzXYvKJocp1Sd9A/SeHuSkOlug/54G7?=
 =?us-ascii?Q?aDO6dq5Nav/Xv0rVkTqu7KX4QRHjvPC12jhi0hDR//FxwjhnQ6LURu88wLa1?=
 =?us-ascii?Q?9fRQZMY+rtGiYj2JZZAzcZJVLjU0yqBVm3Ui5jQmw9s93sBufkbFbpjQGhPX?=
 =?us-ascii?Q?eFK+kKyQzoBl86Oedy0RMfi1G3tNxUv0GakSccCKy2hPe3FgtAHb788dGKAy?=
 =?us-ascii?Q?03Wv8BsKdC1/aWwydmjYU6pBwFNwAa0JBWeudppEBN14QPJKk3PrTqORwZid?=
 =?us-ascii?Q?/RR3xyJxAA+cWo9vYOfH9LQXVLp8Hu30sRQ0+8dTfwyP5R3DQR76y0Cyp7xJ?=
 =?us-ascii?Q?66+FwEupRSTM+Lex1sEbgBV/GfM4bHQHuk3hDwB1PDfKzL+SXK4xIJfQjfiV?=
 =?us-ascii?Q?0p6+/3JNYmVenDrbpDCHWV66EbHOsKQyC0pOcGL8riVs8rhDvOo9n8tzNQbF?=
 =?us-ascii?Q?SMn+havqoA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dfac69-e83d-4bf6-38fd-08deb8363e1c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:13:44.4385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+8Ak7xVOHarABCo0/u7LOVOrf2VZCb+wAT/3+2i7XTfAo4dcJwGG9NLmmI4useo1HA7/LXWl0NkDZsEqMr5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10300
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
	TAGGED_FROM(0.00)[bounces-33033-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: EA9295B94D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:03PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

subject should descript what change

possible candidate si

"Reconfigure the DATBAS register on re-attach"

Frank

>
> During re-attach, the device may change its position in the i3c->addrs[]
> array. As a result, it may use a different Device Address Table Basic
> Register (DATBAS), which needs to be reconfigured.
>
> Reconfigure the DATBAS register on re-attach. Along with it update
> software caches.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index d2f29ed0b6ed..5174a390d668 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -892,10 +892,28 @@ static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>  	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	int pos;
> +
> +	pos = renesas_i3c_get_free_pos(i3c);
> +	if (pos < 0)
> +		return pos;
> +
> +	if (data->index != pos) {
> +		renesas_writel(i3c->regs, DATBAS(data->index), 0);
> +		i3c->addrs[data->index] = 0;
> +		i3c->free_pos |= BIT(data->index);
> +
> +		data->index = pos;
> +		i3c->free_pos &= ~BIT(data->index);
> +	}
>
>  	i3c->addrs[data->index] = dev->info.dyn_addr ? dev->info.dyn_addr :
>  							dev->info.static_addr;
>
> +	renesas_writel(i3c->regs, DATBAS(data->index),
> +		       DATBAS_DVSTAD(dev->info.static_addr) |
> +		       datbas_dvdyad_with_parity(i3c->addrs[data->index]));
> +
>  	return 0;
>  }
>
> --
> 2.43.0
>

