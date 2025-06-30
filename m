Return-Path: <linux-renesas-soc+bounces-18921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1473AEE20D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 17:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B77DB1882ABE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 15:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA7628DF29;
	Mon, 30 Jun 2025 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iryPtEEe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649D28DB67
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296370; cv=fail; b=NzytvAlxbksSMbdoPbtzaKc31va3FCT4D+uWBvg/2eyi0LwOr0iG2qjlPL2Pm+jJcKh2o71l9Z/km9j72cjc9VBj2LjeqAenIfEyLzNgaxJO1DJMvr4LsTdQUDPY1+04Fx6mwYBK30BH7RfLIPVP7UUEfhNXRLvoWmfB0eLvzi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296370; c=relaxed/simple;
	bh=iPnwDQ6zjpTloIL2bfaKUKUu6fZD7QswRdSb6BE12nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FpPkwvznoG2tUW75xZzCaFwKLYr0mDLOqxi4pNPN+gP87mELxyhvjpDt5gv3TzwQ5lIrJdMWGK0HtvN3gg9zAJe6JW7yVQB6abHQ+6Oz4qx17V3T6NkzzSt2gC6jIdjSpTtsraepQ7Nis7+dihCVnyi2ZQlgpshvrAis0fmHDkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iryPtEEe; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sonEpCx/iwy/UyCOaaNZLuOQKrR+hu8UVaHu0asZ91rtND0BQsWCDR38/VmOMMAlLpM1xUTzmOG1PaY4GqGM71Z9rCfWv9t5XHC2g6O36LAVQIhSAG9MUgJfPi0fW7WTwu6Cj9fcDPxU+Sp8qZHcKC4ddUeGAA9xqDcKEgm9ymAYtSQeKcRsz/aezbtEp0G5y7Pat1WphU2MSrQDGk+rSlhnODff7SjkLWyTDfJxnFlKejnz8e2DpG4evqsuxqxVGUfWgaH4K9+px0REyGu308Bp+08GFdck/NxonguAsNIhuJkjhwDaR0AtmECZvfrZwTVqq0ZBK14TIJL0DhNrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZRdnbE+5AQud3oUGhegvoSMeRrNpS7zcpWqXPSwBGU=;
 b=sKqPkEPgtnLyQMpVnT5dDzPhjIO4AO7nfBWIjJZbBJGYH+yDu3xYVZQvk3wrkgWlDJWAMm8mDtrrXzYR6iZyZeP1M9qSMkw4X5lQuhGVBy9buLB/yNVaF21Fxbvt/ABCUFc8asrRYcsQB/jAEVnXvzqYBSHLUoT96hdW9cHFq0IJ8NfeQy19Z5/WZ4XIu3ZGlpu70sH+R+ttHQf3ReCTb0C/PJTgUwoVuIgcs5MRMZk9fhttaaIeqsCh3GW6n9hQnVt5S1SLRafgq7QGWYWTPOtJUjHukpkPHbmcrPLQVUA0OLaFyqepS+P3Q2ez+jfsOQt3+x3jpo0eC97nbvYfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZRdnbE+5AQud3oUGhegvoSMeRrNpS7zcpWqXPSwBGU=;
 b=iryPtEEeWKlPntaXOnvVgAg2W5YU9xRL0sIPHzELdM+eOcxbIdjkinTUTewJ5KGpcK/7s6IZvK19YyFDAGYSTgN+EuZTKYf2Dso210VR+kQmvygAuNAPW/eqa4eNfI70+/AxDizZf5aI93JtJJaweWRIdKgPhc+VXSHiRqY1bJ7BqXgkmUziszMvapmMYhfb/JK2sPIC5/sHvjonh+5ypmTIkspOvxbgDzWk3FHK2Hk87mUzX6tphyDE12felfJDyXDWj+J7rFaW+6YJs7YNLOCc6XJzkBZP8ian9Puo/wWwqJj1QG4g1Fq3wuGT9mvLwupEX9FvCE6QYSUGfMFrLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB6988.eurprd04.prod.outlook.com (2603:10a6:10:117::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 15:12:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 15:12:45 +0000
Date: Mon, 30 Jun 2025 11:12:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v3 1/3] i3c: master: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aGKpRwJBs2Gt9KGQ@lizhi-Precision-Tower-5810>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
 <20250628192027.3932-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628192027.3932-6-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb26628-2001-48e9-a675-08ddb7e890cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HrEJ8GkTdyZ2oewaUInTMyrdMEuPipUmREJL6SLFRbSJzcEZRv7uwYB8GPN/?=
 =?us-ascii?Q?Mj75r9mTGjh656j//9EKme19PqWD7s6xKkoYjvAH/KCrDCGksAmfkvgacUd0?=
 =?us-ascii?Q?b9WslcR3Bnbx2Hzk/bzvKUjitrCUQTr1mCGUWCLmNOLTIMkae5itcVBlTAOB?=
 =?us-ascii?Q?Du87aEaDWYCitLOdTqGrlCOtSp8NMMGWRRLAD+ieYIJm0YNXspcojvuuMkHZ?=
 =?us-ascii?Q?cLEzwkpWTuX3CfCdu17zfduo1CHXIVaUhZWtVEpNhZTbmXy9u49/FSL2dukH?=
 =?us-ascii?Q?px54B5ibSWb8ljObL4za3Ob79l0HZS66I/b1dec+Ijd7icWSe76lQ6TrJlOd?=
 =?us-ascii?Q?xGc42vC6AXIBXvcTZzqSVBqt7u29QuWEbYCNtS1FsQkD/URu83WzimNdZA06?=
 =?us-ascii?Q?vtz5H4p0QbmbpgQPj1mMUh+9bIZKaAIVLEj1DNDD/r1BkWS2AfR2bkRTHxBz?=
 =?us-ascii?Q?FttVWrqaGtO+Px+74PkyKjfIxCvgS7KqjqDrQ55rYL4ku91UNNFbQ82E6o3N?=
 =?us-ascii?Q?2xhvftYpZ+G8A3cpfEsO4CD+zMc89NHX/Al/OdNhGqYHVqs4+cE1IB8nWyFX?=
 =?us-ascii?Q?C7ymN5iduq9qwXG4xsrjPeRxe0JSf6+Q7lHU2fMdTpf6+04XsuP8fhctIVUL?=
 =?us-ascii?Q?YUBH+1huYg0gD6R4gv6KS1R5RY3dXRh8/JcmxkBzljoqI67pxH2sW/oiUSuq?=
 =?us-ascii?Q?uFPmSSgd++//d0kkkJt+gkV7cAtiksS87t0sEc8ywSxKq1F6LlKMXnTdztrr?=
 =?us-ascii?Q?LLImtr6aDKWPKWDoUXWvgIT4WnZyTIigO7cuuhZiZG4Mk2mWgc5F4BwwCN8a?=
 =?us-ascii?Q?e0a3mm6s812HUhtkmw0jHChbPSeq90BGrBI9w3yqaZ17imAoDP8Gn03dy1+X?=
 =?us-ascii?Q?UuL8YkpAMitX9IMFTA2GuhwopmnUvbcqyyNDjRW1tu7L2W46MR4+UDMqyAm3?=
 =?us-ascii?Q?dfZcpq66CgHfBytstOTVvfSj5wRrko3RkFJfrlW0JnHZTHL2cm3M8G0ekD1E?=
 =?us-ascii?Q?RX2Ej5BKluA5r5dj2tFZuXrtHwRMQnaxcHklTP8016syeXoOjw3/Dj5JsAe2?=
 =?us-ascii?Q?5LZehYUevZqEimfYkjbr3gh8evg/ARA6HLmV3DI7CDSbIvyVujbMxpVLluG9?=
 =?us-ascii?Q?DOfXQDpT7hO/s9quyeQp9b+O6iZOobgasoevuWiHnqKp3ah0Jy6PccEwn00j?=
 =?us-ascii?Q?g8pgTS+Z6H2FebxMdpcncGTocS0peCJefTHrcChG5IA3EbJZurfRO9bLWtEf?=
 =?us-ascii?Q?jvGkh9nWXdsLw7gHFDtOgRQPnbhr7UNMndj+cIynASdbe0/AhbZi/iWF2Qi2?=
 =?us-ascii?Q?RoRT9wXufsX0hT0U0uzAsCC9YX32Bb6jo5up9l4sifF3e1jjzcNz81NnBNWI?=
 =?us-ascii?Q?slgg90FXtwhhUTOsv7nhPEvktMamfs4tQ7CGCXlCvEEhDpC0UkUoGPYcxsb+?=
 =?us-ascii?Q?ZMIFEIZ+T7h6WyiMAP7uzzNW63uD1rDlnxtfQs2qle1vsEZn9CTEBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzYE3+Yql7UAF8LGKRfRqoqZN8smkZxT8gy+DpmiZR7xABkh6/DUx7RQipZv?=
 =?us-ascii?Q?fX2d6ZVVxtejhwWemuc0RjR0HMyOJYv3O+FQOA+E37+I1ATKk3MXZxIsg2Tx?=
 =?us-ascii?Q?HB3KLQ4e1Enw2nDItYof9DuRZ7pLa3l+OuwKJX9U2fbpQRNVyub1Yi1eevXH?=
 =?us-ascii?Q?KgBlwt8tqkODTtMiqzl+jh+715Afvi9RnP8QKb14vDGjC0FwuuLDzqvm6l/n?=
 =?us-ascii?Q?J0UyT9SHpoWjFsfVU2u3fzlct+TzYxstD90QzG84ZpZKrQS8TuRnwrIkyBOv?=
 =?us-ascii?Q?Pr9aq5ECjqWNlr6g8byqRrYs38psX3YjhmC+E84dAxLCxTXgWG8CUvgisXRI?=
 =?us-ascii?Q?casqpVRDpOdl/azDgXq6Fs3isFq3EXLbtHR105QepC5SdkEh6kqslLAKsa7S?=
 =?us-ascii?Q?pYYDbn7W8tXSkbUyKKnauDQMKl1IeDJXDJS8CzWsKu2kvk7m7EoYLENMV+Aw?=
 =?us-ascii?Q?LBpufNmak0BYEGaDWF221zfKgTbzwDcwAhr/MNVGmoULDJj1RRgwoCt7YIml?=
 =?us-ascii?Q?uh+6WkrE4lBXcsMVodikvui+XH2Yq3m4t2xkpQV8KZLpL/Yveo5h7xqJxuX/?=
 =?us-ascii?Q?7xuIDtsxL+91QJfYCBonlurqpJjracYF658NueY1dnZIoytmbwXRVyEHDXm+?=
 =?us-ascii?Q?5hnP6lAk+ZUPmeQt701orw5RaKe1u/VUx32UxUp9h6TQR/2UJ8jwp5haRmjY?=
 =?us-ascii?Q?P3wRsf+FhHbB/IkftOfg10wOCuC38rSB0pFwceTvLPrxDOK7shmQc6rcSYd+?=
 =?us-ascii?Q?9EaMrBheRVZePElyvvub7O2Avq87Isfi+MqSbr9jOnxanP/hTgXUMcdC40ac?=
 =?us-ascii?Q?D8iDXHGme11FtKKOEX6i3un84fcXqybBe8/hltdwz/h9qxtx10AVNJV1Ravt?=
 =?us-ascii?Q?AZbsSMClP1g8Tex4piy7U7X5bSU0J42hghUu1CF3iS9lHrEUPtNCQoZlxF0l?=
 =?us-ascii?Q?2nUjCctD+pFEtX0AEWppMEXkbXvBhZlfWSMQDWFkARY90sogLPKnpXAZ7ZL+?=
 =?us-ascii?Q?Xkq6ke39LJi3PqFIf5deOzxXlb3J38/OGM694rNX4tGgDGwJqUWFZvzCzXa+?=
 =?us-ascii?Q?gKx335PrlLhJz42nxsGmfNIaJLN28g9wwjd8cs0RV+InM50UQuDGkbTzr0Fa?=
 =?us-ascii?Q?EEp5NJdPmjcGwpJ6BJuIe+g75fOUZJj0PdgcJ1U9k/PX7cuGi7Tlf+yOIBtu?=
 =?us-ascii?Q?fVPyj1X3Rtk05l26OpmftDcW0mw1BOmMnSXZmNZy5a6ROCN54F/CwVQIeJyw?=
 =?us-ascii?Q?xGZLDupfbNGGpKv7m0fG3egC3InwTV4w9QQuG0WFNHcmt1XcPxImv6ZSC4cL?=
 =?us-ascii?Q?T4TR5/MuuuWWqNoDaoBv16m03fJRuYyISmQk1HvVpJ31Ipgfn691qJ7Y030l?=
 =?us-ascii?Q?4NOv/woG3Xtyok4PqXDm7h/n8wc+sSSzsWevg8muiPDXlB8g06kvm+vHaULE?=
 =?us-ascii?Q?7u9DhI414oqbLKXAMKO3qg7apIt9OLr8BKeAzR0xByDYsGSEfZATfb7rI6O9?=
 =?us-ascii?Q?mJlmO+ef31VBiKAc7jZmazHaUJDzdPqgClJNXTswZzWBErpXCJXobwogwBzV?=
 =?us-ascii?Q?j5LFBgy95L8p9pgHitM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb26628-2001-48e9-a675-08ddb7e890cc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:12:44.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLWkIVd7at3lVGYgYeVLd9fWLaLEsduxN+XG+vsChE17cuZi+d2xlcGTdDDI6EVlZpHfCf22ABGWowKCn5TNTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6988

On Sat, Jun 28, 2025 at 09:20:28PM +0200, Wolfram Sang wrote:
> Replace non-standard ENOTSUPP with the SUSV4-defined error code
> EOPNOTSUPP to fix below checkpatch warning:
>   "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index e53c69d24873..354fef4a033c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -837,14 +837,14 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  		return -EINVAL;
>
>  	if (!master->ops->send_ccc_cmd)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
>  		return -EINVAL;
>
>  	if (master->ops->supports_ccc_cmd &&
>  	    !master->ops->supports_ccc_cmd(master, cmd))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	ret = master->ops->send_ccc_cmd(master, cmd);
>  	if (ret) {
> @@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>
>  	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
>  		ret = i3c_master_gethdrcap_locked(master, &dev->info);
> -		if (ret && ret != -ENOTSUPP)
> +		if (ret && ret != -EOPNOTSUPP)
>  			return ret;
>  	}
>
> @@ -2210,7 +2210,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	 */
>  	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
>  		dev_err(dev, "I2C device with 10 bit address not supported.");
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>  	}
>
>  	/* LVR is encoded in reg[2]. */
> @@ -2340,13 +2340,13 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  		return -EINVAL;
>
>  	if (!master->ops->i2c_xfers)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	/* Doing transfers to different devices is not supported. */
>  	addr = xfers[0].addr;
>  	for (i = 1; i < nxfers; i++) {
>  		if (addr != xfers[i].addr)
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  	}
>
>  	i3c_bus_normaluse_lock(&master->bus);
> @@ -2766,7 +2766,7 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>   *	    controller)
>   * @ops: the master controller operations
>   * @secondary: true if you are registering a secondary master. Will return
> - *	       -ENOTSUPP if set to true since secondary masters are not yet
> + *	       -EOPNOTSUPP if set to true since secondary masters are not yet
>   *	       supported
>   *
>   * This function takes care of everything for you:
> @@ -2793,7 +2793,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>
>  	/* We do not support secondary masters yet. */
>  	if (secondary)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	ret = i3c_master_check_ops(ops);
>  	if (ret)
> @@ -2954,7 +2954,7 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  		return -EINVAL;
>
>  	if (!master->ops->priv_xfers)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	return master->ops->priv_xfers(dev, xfers, nxfers);
>  }
> @@ -3004,7 +3004,7 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  	int ret;
>
>  	if (!master->ops->request_ibi)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	if (dev->ibi)
>  		return -EBUSY;
> --
> 2.47.2
>

