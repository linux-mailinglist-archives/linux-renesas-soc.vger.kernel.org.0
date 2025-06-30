Return-Path: <linux-renesas-soc+bounces-18922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BBDAEE20F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 17:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA89E3A7931
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 15:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8364428DEFF;
	Mon, 30 Jun 2025 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SlFkcxh4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AC28DB58
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296389; cv=fail; b=KIJ46nPSgK2YH9wRpyZd/AGIfsLCmYYW6ri7AI0VUlK+mDSe8Q6zL9COtmMW9xmEwT81Khl3XFqY3YPnivEM6L378DZWVG5yBNJwGvyJ3B2+kBWn/AJ8aYhu9aDoIv+iJ1xGjB4fia2fT/iCzt7VgZj90W62gSC31wEGbL3WzuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296389; c=relaxed/simple;
	bh=HdgA56D4j8k0+wHE4whm+CUQ1xidjEcsYeEt7kb9dbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kXJ2A2BWo5NWy16RWxzZT2Bonwe9Wzg7LRRA/7oHPiAKsxsxVIj4VXgdLaWLd7GuXCk31mwCA279Kr2BQuF/L0yNIW1ykoyqQfyb1SqVFTtdKh+AeBuizoutf6aLER41CTig+0af1KMklYBOBORvD1hSgit+f2psdwup6XW2Ils=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SlFkcxh4; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9RMBCTMUjU/NFU3BS5kH1zdfutTUrUeOSdd7cNjKllyIuUHcmYI9WFSQO4h6fawZBefv7VxAbIxFKQfqJsVHI0wjRSHKAkci0asV1XkbnZ8/f8UeWEAENEkAeXZq7VPJvL8ybiHN1XTzS0QJpVmjGAjHZclN/5tWph8dlKPfugj8dSrqBmUom6y4lrGtOrX2bKsfFo40WihJumGEYLnKDFiQRrV+q1ozmXfAJP0Lbq0qLaqh716cZvx5qx6Ce/IGraUd8+MViOFCUml70scK19rmk1PPSIsWYUfR6uYWA34e/+Sv5b1qs8ucUlRpmqiD1kuN2/y4U4Ras6lyYesIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXnN3pIFGEQXQ0IscSxUmLtStlszZnixr4/m+caHurQ=;
 b=cmbLrQeQK0n9PgVz6iCKVE1NTh3AJ9pV4rzaDQuR0lkmCo6OANtTz1b72Xq61lmCaUjCYlOnMagQPuAXruO41ltHm5IM26JBop0xqDYg8ys96jiyg0d3pd6HLGv/gCi/7rmJ9UUNcf53L+zxfjDYv58ZzLQqd+D2zFLlIhttfeTWU3Yf2ejxt/lpV8/GQFsTRgJpGLckanypypcK9U/1ry3G/cwrxfeXa5tQOMnTgPmzQ/qZJfLVqsBFiD9tVkBkhzr7JZ7FcPTksKuZ2Zh3NgfD2oZxGcx8LQC6/E1/XXlN4y5asNAEXolZl3OUMF3LIe/vidRKEf3oDVSHmtPVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXnN3pIFGEQXQ0IscSxUmLtStlszZnixr4/m+caHurQ=;
 b=SlFkcxh4q7au6e4ksQcGZjFaefR2Y7G/tLX8hErmGzyBMH1ZiIkwd62F/NimpTrmHEWd64RMtLxxsw6uKFcVm5kSwYfjUiS1yiUVAc69IAJehYUKO8Ln0Fnb0IFwVBrp4kxZ65ydn6P4XBv3LF4IPnZTwQ8YN/3QuGkx8CXrz0ZZ8z7OQ6LXz7acSHdw/OM5MLvhN4ah264GveTaikB4XefYyrFlW81ewuvWmqGZUa7routusp/afrr7p2+UijQcF/mqdym2pmkwCanH6h+od+mTJ+O96Yb94VN56ioWFxR7sQ3thZ1dUlMyjdvMixmzrKz1HHe8HHHjpva5fJxdzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB6988.eurprd04.prod.outlook.com (2603:10a6:10:117::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 15:13:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 15:13:05 +0000
Date: Mon, 30 Jun 2025 11:13:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v3 2/3] i3c: dw: replace ENOTSUPP with SUSV4-compliant
 EOPNOTSUPP
Message-ID: <aGKpfZLJ0nzvAcSK@lizhi-Precision-Tower-5810>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
 <20250628192027.3932-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628192027.3932-7-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4PR09CA0009.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d706a4-78f1-425a-c4bb-08ddb7e89cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HAgtbndmVNLSM9AFjcgF5j+TTHMr0pHDvnq5wspOt3LJ+9hk8OrYxlxc16PY?=
 =?us-ascii?Q?jRV1TSfdsSKv+/0TW/wHcwgProXkk2usB4jQMgPiNoeDRyIyeEQBCyL4moSo?=
 =?us-ascii?Q?11F4xZ5Fdx1VpEijBOadXjQsGnC2YBZdYrAXUnDFOOKflnx9qpAopOT8ZhjG?=
 =?us-ascii?Q?iqf+1ZR+Si8U0eDzA4prhyAqMnixNBVtQD5n1rxzXWMgFLQN5LXBs081TScN?=
 =?us-ascii?Q?oEZ4JsZUNhTDtXoxG5roaAEzYz5IG1QpPNjibhFMFSW5MytlLTWtyqjr/Cz1?=
 =?us-ascii?Q?dXbotyVgIhQR7nANPEdiXtMDmc4w4JWGsPlr/U3C1BNSfcHApSFnIX3bpN3U?=
 =?us-ascii?Q?3FFlRtJLeuL8PqjF8XY32ixnY8XV+kn/6fU6rbYJg9aRW3nDVe6v/AVA83Mz?=
 =?us-ascii?Q?8A7Y0aZAQ87jvZf7rFHSwda5a4dSz21PppBhnztwKk1eGdZzDmVuO0Z92xUk?=
 =?us-ascii?Q?hTBH3ThOsayZB61l/fGfelpXWSaJzFoUxHf4zeniXh/7toI1gt0e7eqUuT+R?=
 =?us-ascii?Q?JBfaTu0FQbb09hfcX2xwSZYXhMeyQkrvusUckGf1nPdqv3kIc3xgzCvCZAt+?=
 =?us-ascii?Q?moAib85kpWBdbZ563nzi7M3KIy24DB4136EjjduFCyr/lKxqml+GtWLc/p84?=
 =?us-ascii?Q?YzdJkBcoPN9aLQzH9Tp2JZu78TYiBg7S+lfP2nenQh2TWk2xowxx98+BXXau?=
 =?us-ascii?Q?Yv6LuQQZyF2NJVUQ3P7SaNf2sb4oRENQ4qH0JcP+T0GEnGoweXa/N2a0mgU4?=
 =?us-ascii?Q?9CggtBdq6jco8JBz5eHw7VfMlAt4pG1wJmTGLHIZnssYPcZEE5Chjncy3aHN?=
 =?us-ascii?Q?agl4X5BUijF0YMjS5x2a0zHUDj9jo0MI5ze/cxKnF/ySD+aQxOjw88YeBRJ8?=
 =?us-ascii?Q?7eZcJtJY53fF26oplXaMmUZKesL+5VhnWP3Sb93e8kPLGfndUZkKqhxbJp5y?=
 =?us-ascii?Q?SmmsCS8/R23c7PJcIOfqNccee+sENfIG3FEoKOk1Mpyih1w7ICeDGqM1Z9VW?=
 =?us-ascii?Q?LFCOIkMFCo2vbjvgsWZPBdnDtDbHG3PUWFdoeQGw7u9xk5uUoSS6NvZsrcoA?=
 =?us-ascii?Q?/2ziOH0jKC18X51UFlU4MDFdz9ErRC/oeHK+qijAQtAAthhNUjTDxnNbDoZM?=
 =?us-ascii?Q?6yPN+ATjyJRmj6Jg2PMO/5cCBK4Nhtp1axRyYYtQfiyIgf5mM0eiPRYdpjVk?=
 =?us-ascii?Q?D7SuHZA4bXzJaFuf78JyMvgEi9JqdB1ALoZoTNBhcJvY/AliMwh0aRh5oCQ3?=
 =?us-ascii?Q?W3NM2Jk3aQsZ9/kzP3453q24+pG70FQ4qJl5EL7otu9+LYVCZW7nwZsuZfFR?=
 =?us-ascii?Q?eOhzUl2vnKdUnY+YGPM+X7xqkc9iEGzxg4nk0ji23wvUTUkMt6ee4A7FKqnD?=
 =?us-ascii?Q?dTRNG9et4JvyPZKVQMsSJunlRkqODoe7ioZx6dLlTuPYVI71fGluCnYiOVUh?=
 =?us-ascii?Q?tHqlopVxO6CbZbTg5CoqkShsLeLdbQqZDa2XSyoaqVAX1t+F3NgAmQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VfaPcBcUrv8B8TRxqjzq59ss0D7F5KO/vzXdQA0/bgp5VuJuROk2IsYuqPuJ?=
 =?us-ascii?Q?Mo/ytiiTNKhJIXd7nwhFfASmyAL9WUWR9Aq+xTeweyNT6nDOhRiOd6hNbtbY?=
 =?us-ascii?Q?/givhvkMTMSEeeWaElCzLDoQwpvqh/cvofL+k4po0t+tC6bJnjPhsF9g/r4Q?=
 =?us-ascii?Q?gd3dHw+BZq73ayOkkVwFYVGonmApzjwcpLTxoBqPy9jNZaAvKxTKYoqmOjbX?=
 =?us-ascii?Q?QZBuFESFwyFsKxCbUKBOO3bpJMXPTfvHkKnUHfW8pqEPpb22BkSFqAcXMkLO?=
 =?us-ascii?Q?A8ow5WZ7AsswfMMYApmHame8GVAeGXZ14w5CAbBsbSUDkusDV0gVh34TFtlX?=
 =?us-ascii?Q?qPFu6yde1XqpypN1pbq357I5/mM+PMEFB9Yalu91SsZOCDi1437nJoKyg6j0?=
 =?us-ascii?Q?Kqvw5qRvYoMuUgve/v7QzBE3RUwn4pAnYsb+bnVgIAN9C/dqOTofK9wLW6JY?=
 =?us-ascii?Q?1RzOawOKgVQY6qaWhiHp/s5Epq24BoDX0Vu79I7SRkQDddUTMDB4DFrFpNVm?=
 =?us-ascii?Q?ap6a0cuAEp8HOgZqWYigGHGULDsQPTEQirsyoaoemdeluu0hJsOW2pF8/041?=
 =?us-ascii?Q?D0f8YO/bRL8f7TawzLePD7vnsIRU4ROepwAmHdMVsEJYxZZFUGhc0T058tpb?=
 =?us-ascii?Q?RDBBb3/J1FN5EGMYWWQJxdwimHXmPNEMvZMq427pZwmfiMTPpRexZm9k9zzy?=
 =?us-ascii?Q?WbrrBXjm9XiENUB+Z7mHqzMkoa0JTdSE2SUz/fgIslpWYT7bnB4zJgZ93Xhx?=
 =?us-ascii?Q?Y7rgNAhSfD9rExt3G7WWsJajD0w4P7yZk//JHb3jPakPvyQhaNPatbYaEqDc?=
 =?us-ascii?Q?ug1KWXvRHPKzO9je7+S31uvqgPIFY74jayedwVJ1PWU6xuRpb7wYky+GlO89?=
 =?us-ascii?Q?NaYZvbJRVZoby8RSJgp4XgP+V2GKpO6WP456wABAC+sIPv4PhPextNE0JXvf?=
 =?us-ascii?Q?qfPG+UZdWg96a7pBalSbTVeFJG7S6sb45yrWKRsbQa7bcJkccaMRVs3fqT/m?=
 =?us-ascii?Q?L6o9Flwc6ndk/1XXFLVgmqAOB7U0v9Cr9xeCtxIL4/2mdg3wxSnb8x/yn3Mq?=
 =?us-ascii?Q?KlLHwxx5oTCwz3e6zs1ASyq/SRB6UWNgN+psKlrc2H9LzEzY8DRVO3KtwFzE?=
 =?us-ascii?Q?LgY3e4bAQZMb6imotx4n27fXakfCNAM5BuWwzBtEiXnrXlFMPCJGKm5JRiBN?=
 =?us-ascii?Q?cpv6CYgkeFn8Ih8LsgN0dkBZwAszVf36KBjMyTR48aRP7wm3+eVDlvUqrZCg?=
 =?us-ascii?Q?MNekJB/4TLuekbrTTDKzCiuwVfes6lUTEIXlv1Laq/eBjSS+wxAC1jVQkuAL?=
 =?us-ascii?Q?38UlnNuWc0FXDMFI0oEjXwmvltfVQ52A0pjJRdkj/gijUa+LodaZOBsStp1X?=
 =?us-ascii?Q?UVYuRQ8+gKfs3Z8lABMEUEg3FyhUaNcma5YA4FIomCzPxfvK6LwKx4alA4Tb?=
 =?us-ascii?Q?3FaQkH670UYOD4PMXxZgoxaEKrQia4bVd8cswYt+OwG8m4n7DNFdE+CNdCIk?=
 =?us-ascii?Q?T7Cw/P0fWKudOgB9nLbtBGwCEDpJ+iD8afRI7Nq68xoqWz+v8nc6O/p+0X1S?=
 =?us-ascii?Q?AjGMF0KTS6e91ynE1Vk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d706a4-78f1-425a-c4bb-08ddb7e89cd3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:13:05.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNC0Q8Tv4cp9guLiP69MgVQFY4KL7edpXs+B5dCNUgn6R4ImOrVrXriWQzZHv6ce695OUaYkCDA3Rtt4z6Y4/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6988

On Sat, Jun 28, 2025 at 09:20:29PM +0200, Wolfram Sang wrote:
> Replace non-standard ENOTSUPP with the SUSV4-defined error code
> EOPNOTSUPP to fix below checkpatch warning:
>   "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 611c22b72c15..91429d94a866 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -932,7 +932,7 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>  		return 0;
>
>  	if (i3c_nxfers > master->caps.cmdfifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	for (i = 0; i < i3c_nxfers; i++) {
>  		if (i3c_xfers[i].rnw)
> @@ -943,7 +943,7 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>
>  	if (ntxwords > master->caps.datafifodepth ||
>  	    nrxwords > master->caps.datafifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
>  	if (!xfer)
> @@ -1093,7 +1093,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  		return 0;
>
>  	if (i2c_nxfers > master->caps.cmdfifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	for (i = 0; i < i2c_nxfers; i++) {
>  		if (i2c_xfers[i].flags & I2C_M_RD)
> @@ -1104,7 +1104,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>
>  	if (ntxwords > master->caps.datafifodepth ||
>  	    nrxwords > master->caps.datafifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	xfer = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
>  	if (!xfer)
> --
> 2.47.2
>

