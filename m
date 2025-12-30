Return-Path: <linux-renesas-soc+bounces-26199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA0CEA188
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 16:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A60AA30049CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 15:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E8F2E541F;
	Tue, 30 Dec 2025 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ir+Dyqmv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45B91FBC8E;
	Tue, 30 Dec 2025 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767109456; cv=fail; b=ZPRfAI2CBtoLYiPc9nh+zXI+ylroD7QDLUbipt9IvfBZhL/OjoyBK3krTDmSjJbae0GvAtwOFEekyTXp4mIh9/DWiArPWPt8Aosm5/xnptSx0YqTmdtI7FTexKPGtUqkN+gBJZNr5IB0J9FHjzzjKCUDEVhVZv/wlcucSVh0+rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767109456; c=relaxed/simple;
	bh=PI9+yh1kqPF33VnKSn3exZstVEUIknDRuJDzXYRCi+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M4W9aF6wAi4qRnu6MIawaP7YTDRYGPJyIQl6PKF+zyv02D/1/rjcTeSbUtZ45wkVL5Ovy5rHbzLaKYnKHgumTOH77SA+dZNWe/EPkqO30aY4SmcOLx2M9er9ghnRg/OmsyUCjQKtnKTYo1XsgNOy6B9HMrjZCI6Qlzhm5OHk9bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ir+Dyqmv; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvlY57IM3ZZwljxQPgh1a3rxmlvdUMw6bMusoOndYvIySb9SuxSb7SA0kZcbGXvIsBBic0Oz9dRBzihQ/JIAdcGKv3gaRrYuc/ATqeSxvF9ttNAugtp9nePiAn8byP+IJLsjpTOITroSioKIvDuaYLOhQiil7MGrIGi0f1lg0/lLs8QiUulK6GBW+AVgo2jvZcmP36xbNYQhAKBONMtdF/R+t2d2NlK/pyGzwbbJbdIZp/vGWtiN7jg1F8ftyaZXAf2v0A+tNY8qauovqT1iFX0dci07bmuHwt60reANb3Kryq3Vh7KvOCavxqTA5q9kCNaNifC1O7NA2cRfSUHOow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1bJGLuX5d8xGedJkgH4BkdETLtvB23zCrwa9GsyyHI=;
 b=bTRvdgWh2azpyTWW1yy2Bl69umSiJ4VRluzT5V38ca1dCXYWSQBQRKHBbX5oT4v+anli2NRNFwgTcn/N0pZUS2lPfh5/xPDyXPaq84jUk+uFLJOWmryNvbIRLIC1GiUbc0DhgR0RgkXTai8y7/qnVK0+7DKuWfJHqT+TJNx4i8Pz9U6fY9tKncbx+0d+dCqZxUOuB0UFaR9HWy2SXP2yqzuULBdcA0olkxUHsUrbuplh+KClDYXxp56nLATnxtT4gcNuWGiMmrC5uYFav8hPYy4ZoR6dqU4n7U1KP3jZdbc9ZKa9Ut1hwIO8iAgGHihVYTe/M+PKn/T/6ejEe+w9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1bJGLuX5d8xGedJkgH4BkdETLtvB23zCrwa9GsyyHI=;
 b=ir+DyqmvaHH2ZF319PJUSVwZB1Q5v3D7KCePvpIZo91+BmMAQsLGwLioAXiP7lrOEthIP8kg0HnMggRzu6/C/RM7NwCPuB+BJavqQAVFRp+P1P50eNqBVz+WSXJtm6XVfO7142jgCZbWVXLTt+9by3jP5EqTUT4vqwHGFAgTIHemiWQI2OhcPco1zqEAb+dJ48JH9CBb77PHERtn4pCsO8aMgBgApkwylXGHNQJhgMF3EuvWS3c3HFZqkvKx+kYxgD/7KmdyzO3ilLlehI0VqzSCK6eI099o9pIXqaE7iqJj3bjVROhFiklZCSMPqd/LdCu72LoaKPBG4pD99CwiMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10110.eurprd04.prod.outlook.com (2603:10a6:150:1b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 15:44:09 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 15:44:09 +0000
Date: Tue, 30 Dec 2025 10:44:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aVPzQrFL7T5KP1jI@lizhi-Precision-Tower-5810>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <29d6558c381b726f53c22088a5a2ad5adf9fe142.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29d6558c381b726f53c22088a5a2ad5adf9fe142.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10110:EE_
X-MS-Office365-Filtering-Correlation-Id: 561ac76b-b6f1-4d72-6b71-08de47ba45a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Th/gNx0DUh7itfDlk36b0mBt0ChtRiAl3w/zPllqrxDpVztyDc1a5GAcwOat?=
 =?us-ascii?Q?zSezoR2yYhruB3IKsYSU6SlMdXwbt/4J8A3bmeiMH8xQq+hgT3Hu9yFdTMYW?=
 =?us-ascii?Q?plXcGIs1k2IQqHLRS3gMSN2qS067y+gfuCvS1HN90LV9JTRV8wFw+e+TbNXu?=
 =?us-ascii?Q?Z0G1dZ1j22ielh/BKNKD7eTikrQhRR6JjSTaOwC/xvnJnk7r07/u7UzpH5uM?=
 =?us-ascii?Q?yKsGA4Uk2tizpWJIhpGkNRsrG/9vwYaa9cbBb4AEVPE1kB7jbvyLDBJ1kPFu?=
 =?us-ascii?Q?pKvXrHLgeBdsQG2YiSQCs7oFyRoIKi3jWWpCs1ZjU8x2cDsbqXjh7U7pjzt/?=
 =?us-ascii?Q?xkpZGLLN5wWjKe+HkpB8KDytli9tppHL6uaP20agoMsbbgQtaJemyB3HjhCA?=
 =?us-ascii?Q?B7KPTahXk7/DkJCe2zBx7lobC+XcEHqjMEQ0N/DY6lSgvEBdNtjc6MNW2Wcl?=
 =?us-ascii?Q?MIJeDwpF9kHlCvaJd8Ii35kWapEsfG/8kYu+oUMZ9WQjhvZOlpphHlckxQv2?=
 =?us-ascii?Q?zx8Uim+fsTb3/14+gzPg1j5GDPC0kDGXPj3RkG9j8K7JA0mOnmeROLXRNtBh?=
 =?us-ascii?Q?st6NA2T0ZEOzhBgMXSDapYRaxmBgm3DB70csu9GxKYnafH2uZBKIhCLpZrhy?=
 =?us-ascii?Q?RLyTlK3QwOPYGDjGRnV9QcQkFmpNbMyufLxPTjEdvJSwFlOlDYIaEl5q4U8E?=
 =?us-ascii?Q?ZepECPcvF96Roq67mBfqgjK9Ho/dF0PrGZFEgd/TmpUj7mpv2h6wfN84/cld?=
 =?us-ascii?Q?DHrxn3mOMElRwnmn8AArNAB4TJcuBan+YePVHCPQOAQ1PNhoxTeHBZUEboce?=
 =?us-ascii?Q?ZFYxJLlQ7emVu8z0LGznirab6H1yZRNwWhjoRon+fnxsektbBNmaatyYkaAx?=
 =?us-ascii?Q?BFlz2tRFK/Ua0YHOyrybhN8281gORMGR/xri1qJpZW+oJNex/hOapzkQGAwJ?=
 =?us-ascii?Q?SYP+fJmL8ACo2TLWRty/bYr8upJWZrlAZgmOpk2+JBL3Gi4Qdbim7eWVWfcO?=
 =?us-ascii?Q?TgSERmNyI/81kOeqzq4PPdJagk/g/t2fb1cnBZDlZD4Gyz6C2HdC4rco69EV?=
 =?us-ascii?Q?pJGieABeCBQh5OsGyCWsjYb7hjUuD3O98jzri0+jLayDiOeZziYmRFdFS6AS?=
 =?us-ascii?Q?yRRwRoDMTzfJk9YB4WeQllcuE7E/xT3AJSz79KvbUyCvY2J72xEL1weoTzj/?=
 =?us-ascii?Q?PYxOiK6qjCfUrXBtTI3Ti3HbEJp89FHYF1LyqAUbT9tK2fL7KlQ7OB4BAIoF?=
 =?us-ascii?Q?+sFhIj8mrsBrYSeWT+RXFL+RbaibzFtuIGzfCg9OW/WejIYbyeTSaZPkRaYg?=
 =?us-ascii?Q?c32PEa/6QVS+8h1GVY2+9NtaZwk3SStJF0OTnCK/sj2UUlHa2lWdyFZseu1U?=
 =?us-ascii?Q?4qqBIbz5gf5UHRG9yedm5P4LiVV6h++zkBsgoUqIUzVpTPgCXqDeCys4Mwu+?=
 =?us-ascii?Q?wj6DPVAY2igZGcJhjVeT6sc5bMuAGiZgY0zHU9y7DgR2PRhyGPa2OoDtTuXR?=
 =?us-ascii?Q?1K8fkKQ7sGiRIwwwkQY0tiQhCd2Ps7zdWqRa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i4Yspf4/9AcYJQsQI2qz1Af5XPcBjyPrqXuy9tW7WRU0NWrPQ9ZeEAcEHRH0?=
 =?us-ascii?Q?Il5F9/psDlTE3WFjS3bmYrtsB0rdgPTN/T3jCbgddJRI5Z7gxIBytLADGSOm?=
 =?us-ascii?Q?hxc7nyvkKfO2Mbtc2kOcIKVdPnQqNgeP1D+xzuka9/C1t1fufvUuwtpy73SU?=
 =?us-ascii?Q?ZFZIUc3ZRCQKoDZV2c6E6QyvoEpBIrv+ToKG/Gdgpsu1DcEa1P3Th5RJvLbE?=
 =?us-ascii?Q?5vPu9k3KKXPglY3IWYeF/orFx7+Vv+O9BEbtjRYCVM4A+QwUY1Ez12BoO1+B?=
 =?us-ascii?Q?3xFxx2gbjlTd1DF7qRNP4rnJ6SvTle56etRhpSXGVYg9bAyjBvGWw6kpr2B1?=
 =?us-ascii?Q?m4jolHcoL53XuNprOMV0JltFKmZizUm6EK8zvL63mhJuspM6bV7xKKZQ7kLZ?=
 =?us-ascii?Q?dh6vi52alVuM0Ax+xy+pTD27xP+hwGRP1O96kdVvP9yFP9dvZVCfkA8l55ku?=
 =?us-ascii?Q?lV6LAP7U4fagd6CsBaqQLB0NqXFEPTbfn++KFosNFabQ4ZZw3My0lCNjp5qt?=
 =?us-ascii?Q?6QwjxYIBjrkSTb/acs9bp8q3ta2LpgpPgcq5IW1m+GENc7W0UaueGrnOY+oz?=
 =?us-ascii?Q?qqrWpa8ur/iLVg44zUa6w95NXm1AW8D62GerupwTtB2hUoVIrQxSki23pzFI?=
 =?us-ascii?Q?dAQ+IHklLodWLqRyQBruK4GDfkcCL2LU1w+WavGI2cvZWHBVSr4Fc1XIbXbI?=
 =?us-ascii?Q?wbuahhNrt2D0h1Xn4go+vuQoUAopFsu2KJQkp2JQs+ipcKMnJxV6C6l+rHLW?=
 =?us-ascii?Q?SvYCYtLf2dM1N2YUamIeV8CBe4BuBQ3lzTBghIUwmEfcfg0mIE/pR0JPlwZg?=
 =?us-ascii?Q?jI7jYnE/ODdzXYF9lCse8hITgP5jk0l/sj+ddnSbCT3uKT3H02fPkUJDAE/P?=
 =?us-ascii?Q?XrGhgjq4NO5kChkkJQeRb0FagGuR5sdWKeCdFKT/1ZJr8fG72ECAPBtx01OT?=
 =?us-ascii?Q?MxPVdCY+TYxEJyXkdSVZI+9dRSh391a4Z78sob4nL0usL3M65J3mrucJ7oaX?=
 =?us-ascii?Q?YRnyWHOHo4VzOaPwBAgZAwEJV4khhrcoSOO0t0Q4p1byhb5E9/rwqe5Y1Isc?=
 =?us-ascii?Q?SWALSBkCGgJNPWmpMWfSq+ENgVguNNWhXgwmkMHhNP9vAov6ymYyLqsGb/vy?=
 =?us-ascii?Q?jPdvZn5bCU33ijEMyu+7Pdl6QzxH61zJm4s/y1qqWqz2Wn8rma+JS8AiK72A?=
 =?us-ascii?Q?fD9LYOle6s5ixk37of2CLGCFCI1DhQRGOsIc+jn0hmSjZ6/UWdtDyyxt0RWI?=
 =?us-ascii?Q?pSBmHD8qfxyuvWM2L57E6XX3PuhaGmBTHGRBCkQShsWQqax1K0ZWYMbCCKFy?=
 =?us-ascii?Q?jysAZezmYklz5VwEhoHRHNHJEIfthIu02ciYkKRjHf7BA9TBPdsXZVZKQq6M?=
 =?us-ascii?Q?bWijhX27S16/Y6LghmYXJ5+V02CZF1WgTm6/Wok12iiSjXdFgloYCbi9bNok?=
 =?us-ascii?Q?NA/2xajPb70gvwcJTg0yL4N6ItJmsZ79o6nElq2jmZmDu/1xgmaEXvsHrgyE?=
 =?us-ascii?Q?i50VONuJIEbw3qdZ1CYuVru+jnb96XkvIpfpKyxRe5EWrsofALOIxyKScXXW?=
 =?us-ascii?Q?fAomNEu9ZybUde38R6Ri/dsrwGLr83tRJhijdevfU6TOxaMVCPu7Z+8KCDBF?=
 =?us-ascii?Q?uunevasvZQorqWEUfcSyc2w+u76iBO9t14hcWV1t3EYaDV8e8gVtdNNdA7H4?=
 =?us-ascii?Q?alcRnUZH+uAkQtxHJ3h3Kt5oPeGIeD5NPAlN9uNlgO3w9Vot?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561ac76b-b6f1-4d72-6b71-08de47ba45a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 15:44:09.3318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5Y8T61URsNeLzToRtovK5+dx56pe+PpqMvYpcnU8v+bpjAC7rn+5gNGyJ39M/SjCht3LMNJgtEtXOtWifSdzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10110

On Tue, Dec 30, 2025 at 11:39:36AM +0100, Tommaso Merciai wrote:
> Replace individual devm_clk_get_enabled() calls with the clk_bulk API
> and store the clock handles in the driver's private data structure.
>
> This simplifies the code, and prepares the driver for upcoming
> suspend/resume support.
>
> No functional change intended.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - New patch.
>
>  drivers/i3c/master/renesas-i3c.c | 42 +++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 426a418f29b6..8ef6ff06df90 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -259,7 +259,8 @@ struct renesas_i3c {
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> -	struct clk *tclk;
> +	struct clk_bulk_data clks[3];
> +	u8 num_clks;
>  };
>
>  struct renesas_i3c_i2c_dev_data {
> @@ -276,6 +277,10 @@ struct renesas_i3c_config {
>  	unsigned int has_pclkrw:1;
>  };
>
> +static const char * const renesas_i3c_clks[] = {
> +	"pclk", "tclk", "pclkrw"
> +};
> +
>  static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
>  {
>  	u32 data = readl(reg);
> @@ -489,7 +494,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
>  	int ret;
>
> -	rate = clk_get_rate(i3c->tclk);
> +	rate = clk_get_rate(i3c->clks[1].clk);

Can you use macro of variable replace hardcode "1"

>  	if (!rate)
>  		return -EINVAL;
>
> @@ -1298,11 +1303,17 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
>  	{ .name = "nack", .isr = renesas_i3c_tend_isr, .desc = "i3c-nack" },
>  };
>
> +static void renesas_i3c_clk_bulk_disable_unprepare(void *data)
> +{
> +	struct renesas_i3c *i3c = data;
> +
> +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> +}
> +
>  static int renesas_i3c_probe(struct platform_device *pdev)
>  {
>  	struct renesas_i3c *i3c;
>  	struct reset_control *reset;
> -	struct clk *clk;
>  	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
>  	int ret, i;
>
> @@ -1317,19 +1328,22 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i3c->regs))
>  		return PTR_ERR(i3c->regs);
>
> -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> +	i3c->num_clks = config->has_pclkrw ? 3 : 2;
>
> -	if (config->has_pclkrw) {
> -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> -		if (IS_ERR(clk))
> -			return PTR_ERR(clk);
> -	}
> +	for (i = 0; i < i3c->num_clks; i++)
> +		i3c->clks[i].id = renesas_i3c_clks[i];
>
> -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> -	if (IS_ERR(i3c->tclk))
> -		return PTR_ERR(i3c->tclk);
> +	ret = devm_clk_bulk_get(&pdev->dev, i3c->num_clks, i3c->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_clk_bulk_disable_unprepare, i3c);
> +	if (ret)
> +		return ret;

Can you use devm_clk_bulk_get_all_enabled()? all dts already verified
by dt-schema.

Frank

>
>  	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
>  	if (IS_ERR(reset))
> --
> 2.43.0
>

