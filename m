Return-Path: <linux-renesas-soc+bounces-19629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16029B0F70F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 17:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A959C7A1452
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 15:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894671DF24F;
	Wed, 23 Jul 2025 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="apxl3ERf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369E91DF963
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jul 2025 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753284640; cv=fail; b=LkIVFTUUAj5s5aD7Na6LV4cv5BgzwzOHatBL1nXQUHjjDu+BEdxUwxp/sSGDw+Q4HnWtq5pdkanGYanrD+qW0O3CjFSd/Gzj1L4OPboxv4JlOq/DFkKPAd1IU2iaqpmVcNu5xXvVJzlCpJFGX/qKXU2v2mKA9i5gUJFtoQtFk9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753284640; c=relaxed/simple;
	bh=/9+MTvlFH+kBgxEdUPNGpNlaaOuaJTDMCxGfQ7Snb20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=esLMC07y1I+LFBMvbJvlHVXuNV8SYv9aJ26QTusHQTGurKTGP/Nf+yfk/SxS+LKUXVrAaI8XRA63t8MHlXiAXtWs+e8fljvAumt3KhwmZKAfns98uu8ZwUCAwiSCpw38V3T66Ab2uc6/xsQ0ktawJWCf+jEKdOiMduHZxeCQhso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=apxl3ERf; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIbcNYkcwgMrAFAA+nz08K4t3QomZrZtyjkwuNYsr3iY7Dt1VaOGtOnGO91LyRFw7Zwiq5ty8qkhTqo9BASshyIkqu1rL0g43h+BTeSrhvdfvZNhNpbNbNIwldYJiJ4Nf+zZ7sojcKyCnsJibR1d5LWscGT9INvFCiLWW5nclpguR7SRe0rOsZ5egBmqdx+WGbyIyA14CCSk4NADlue0wyvtvYe35DwYhlGloupB1kyrOR1WT2AuYMOtpoZYYjYIwUSkOEqLsxgXtAY9D0pj0k05zIDq6/LZM2gngbOHmKuxMLyoX04R8PXBhYQ3zMoNx6+v4U9krxR3WD5M1fwpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptBiS27XkzRk5tEVepj9Qzk6vymbqnO3O1pXB+zi6F8=;
 b=DyT6OfGPAMvoWyo1qjFTqvCTm4DEVhqGu2wARgTG+BVzfW8pllbkj9pFXzrcjKdDv85HHyKaQYzYGMU+EOIPJkvBNDnlnu7AkGvAmlXpQdXycjGD44tAZllUV6LfSrcbmq1JqfF4nFgpBfgfr+xju1XuwGsVeiZrI+iZFUGTYnO7rQsU2QMnrGqUsF1YgDpueGM8Flbl8ieAbc3gBOypAI+Hq3yq2hBoetcukFiebMDV7VOC7iuYsRcVIP9hh+rznEBLPOep0Kn+Ve4tTT5GTX3P7uFUM4Zwrn7l0+fTnhazjdmYNg2DtAywwbPugUTHjS69pK3OeOgyTh6zFWWPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptBiS27XkzRk5tEVepj9Qzk6vymbqnO3O1pXB+zi6F8=;
 b=apxl3ERfvBnBvq4l/Nrwc5/QL5pLzqlmdOVwPUalbfolEjvverGY5mgOL86R0jnxFbQHGXdMCUHlJghPd4Q6X9IrBShmrNM0m/E4PasM59b4YVWEX0pQ2NjjRW8Y6e4pUUHPSM+lL0/nyKza62mYLGb1r+GvCcdBS3A+IxytfVBXjZXvcAcuqtK8TkOnqqhs/MU0MqPczE0xyoY47XLUvdhHiLcMw0Deuh9H0aZPeutfLotk6ByUefR4zi9Ic97xbD7v6Q/FK6ns5THdVeIMSb9OLUKHYlmHDjRs+crpEiUIqAoRbfG4zy9VyopOgFflLFqev8PcIVqn339VOt5sqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10956.eurprd04.prod.outlook.com (2603:10a6:800:276::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 15:30:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 15:30:33 +0000
Date: Wed, 23 Jul 2025 11:30:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v4 1/4] i3c: Standardize defines for specification
 parameters
Message-ID: <aIEAFUYaZQmZlFRI@lizhi-Precision-Tower-5810>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
 <20250722190749.6264-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722190749.6264-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10956:EE_
X-MS-Office365-Filtering-Correlation-Id: 36056970-5f2f-46c4-0d02-08ddc9fddd2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oz9jMCDPXFb1dv3RE4PCAQzC89f3Knwkx/4x29eQ3FvM8MO1XE/a9g12AnwN?=
 =?us-ascii?Q?kvBtS+SG28lzNSIUh19TNCkzk1sFHIWaP0eqWXZKfK6bsdm+tdvZ1as7Xr1M?=
 =?us-ascii?Q?+CmNWaCB5xRtwcodBxmfWIDqiKBChIdNpYiVpI8QMoTIC88FlRxf10hwwpnk?=
 =?us-ascii?Q?cg17mqNbkQlJyaTZjfrFoQZV0WpCKIAt0DrGjj4/URJ4IsNzxw/DkhkxlU4w?=
 =?us-ascii?Q?tznrUcAbAMxKBXZm7makBa7SYrZDdJLDVaxwiQpbPYS5JCIipgFvF3Gz9vKL?=
 =?us-ascii?Q?WPD6zDEwPlDzeiZ0C2bBSQA9+CcXcJjqpTOCgPjBCHgggYLCUP4zTA+fMCSf?=
 =?us-ascii?Q?wMPUdtosuUXMPtiWowdniA4Dnp9ZtpF0iwhufaNBPMQRVkBzaLNcUY0FOdFD?=
 =?us-ascii?Q?sLPO2S8kJWdOSIQiaDcZ1d75XTg4+E+/Xpiu3z5YLOoGzzC2vtrcDCG+NbTv?=
 =?us-ascii?Q?GOK+XB/+M8I0gT6Ui4jsMtBOGk5Aqe6u/tDk067b+aLk0ZAGOuSVLkjZwOOh?=
 =?us-ascii?Q?LsTmyM1UNpW1vLiIhkORc0p6PpqWbf1uZx3jQDF/UrviDStO8eRJ3AYpKYFt?=
 =?us-ascii?Q?GEbY4wHzWaNDKiInX6B/5f+MI4hLCGtRHkq44qjaiSphsHWYgvHlaFtyGD6W?=
 =?us-ascii?Q?7nTAu/9Qa2C1KJJVmaqVYvlNJA37Ys646wBufl39UCe7dC1BGbvbY1eDYQAb?=
 =?us-ascii?Q?TEVz32nZYbGA+al1zM78X6LnGohxYvfF7lCIQtxg/jus1C7aKcbgaojOf8I8?=
 =?us-ascii?Q?RrZKuBg+qdEC1mBbPL2BHQqBRO7IF3h0Osu+afH6B6xx9aaftMDnidGFvAqm?=
 =?us-ascii?Q?Wd/dWAn0+YI7XsaWzbIZeb03NVsydVU2qAMevI+IRHKACjEYcCWNouWE8A9p?=
 =?us-ascii?Q?itVjTQ+VGUVx3phrZJIriHbs5KfS3u+DXgEgZZrGnHHUFu+cpa62EvTKQFmx?=
 =?us-ascii?Q?kDpxMZYJW94M9B8Qy/uezVHA3i0QiCE03XezGBBEgZIcAk0k5I9s6aOmNF3o?=
 =?us-ascii?Q?qJpNWBjoO3vvabhVMVrt/d6ibTcsH5e9QdWxuvLPZkdIfKhD6CxOJT5w4N1w?=
 =?us-ascii?Q?XKjz8+MnbjS8duFcfulos9WT5qK5NC0GczzEpN1OJcTe2NQkq5hLkm/MEpWx?=
 =?us-ascii?Q?99ypv8YD1VXE8yQ3StsqwGuPCTk6+t1zCaQ3A8wWOx48LaSSEtHWtjuBgI0J?=
 =?us-ascii?Q?jIl2hwxM1N/U1EcxDbHiU4YLlMOwwzo5lWWnqqKxVmoMUfZFiU/y8CvHkJ90?=
 =?us-ascii?Q?vFXugOUoRGHbEQ/4ZwMp13VdERunuXq4MMULXzKtXKLgX9oUP3f7vJHuh/pl?=
 =?us-ascii?Q?9ZZIkfw93QiIprBY3+39967L8PQYgiHf+4xM3jfDCgR72CkA8eokvLfl21he?=
 =?us-ascii?Q?eKqp4esx1xf0UTNJBPY+EuqMW4g2ATJG5JC82ELDPYe55yBMqifKcq3SExqz?=
 =?us-ascii?Q?+Ofj+hhjUJNn0T+meyuHyPgl597o+5syugeKyZqjUQTWlUwlhCAMvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3w648bk8XRd4sXoyZELeeVJR+MrKm/G75pMu7ldNNMPYwht3IBBZh1Rx0Ku1?=
 =?us-ascii?Q?FRZbo1x0hoMjhYAimfx4+MJFNnEQJNP2tc/o0hZylo4GVtGUCtvRBsLARxnY?=
 =?us-ascii?Q?Q+mB4EC8VPtUcF6hz9L+ztCEQVc8pCHn9BQBIkkCu5MaUMHIAeAR26a7kojS?=
 =?us-ascii?Q?/iSTl1cj4f5vviGIasEGlEiFgUjIB+5Tc/uWnHIOfUF2Esf0SOXlQTRiPbdO?=
 =?us-ascii?Q?J8pFfppExu1hG5Dx120YePa+wmLp5xhaXsfs9jVCjA3PlJwTSB5C/KaK+ped?=
 =?us-ascii?Q?g6jTmNANLduIpTMBM8KTJ/36gK/E98qukp0/gaUIzGdhkGbULk6bhaHTtZcB?=
 =?us-ascii?Q?0U1V2LDOas2VzkKXx21FtG99WIYaYSh9pMY/QMiIASKoP0X5F3LiDoglGKVd?=
 =?us-ascii?Q?I63ri1gE2RoLaxlMOMSBMC0LpDjVavaAYzTduxv+at64OjY7p8LvT0lFoChq?=
 =?us-ascii?Q?SKjDSnuGmrG/ZU1Auhx/21wDi/VAkM5abKj7IJMbhdCAdOVXYM6WUb2qldHQ?=
 =?us-ascii?Q?PCyz3tHWw9+HgFOSvuRBO2JqISzna2SLC0oZ5ByEnb0dPKfdrKRS1Oax6D3K?=
 =?us-ascii?Q?6Ob015nZL4IAxRM3QHRbynB9Du+jgKKoblNoMf2UghbxA/nUpI3Qz7ajHdLq?=
 =?us-ascii?Q?cV5Loew1B5rUEzMrlsqvwTMfAVAhhr9DFWEKltw23FkWjkuLYTvEZeb6h1gO?=
 =?us-ascii?Q?J5m443Cn7Ax7P97kbp7AR5wZy/Y+ZWWUE67seZ2Uhn0ei8DYBptNz+eRBw3C?=
 =?us-ascii?Q?4dp8tVsKyZ2F9ae/xwUYcQjNBN+xhm/IP2briRuhhyE1wIX/FqIPqyI7wW+w?=
 =?us-ascii?Q?IEcgvctudTLa6aULOpVO9gVyj4MyKi32qswbaMgmaW8aQ92BQ7eh5JLPPPfk?=
 =?us-ascii?Q?VzQRw19JxnwvGbIcsxGe0Pf4tOD7aJXQgstHGlzj8G7SGWUYLr6ZXmHC0HvN?=
 =?us-ascii?Q?pfbewSIZ5ysGDclH83FjkTfRN2bRAFsxOts+nGNbPmkgzQY1yiSMWpQymN5R?=
 =?us-ascii?Q?xbJlNYqREAQ+wsaX9RpFC23xAIgM/wwnx+4vK/KEq8mHfaMeUyVPY9JVFhIJ?=
 =?us-ascii?Q?ku4emePratDTengIh28kGue9gOvh9sQR2A5lNPQM0kb6tsLXuZJ63aYA6cRI?=
 =?us-ascii?Q?G6Tksc2BxVtu0WRQ5WDvsl34agYjPPO8fu8XIycXPYhMy45VLoxHlugLFgMo?=
 =?us-ascii?Q?ppkWLYBPPW8xtuJT/aiEFdQaFbilaYOH9+yUCmbmfWIBVXMQxQ/Xg1aU5+re?=
 =?us-ascii?Q?eEZdSrDCxV0PArctEVfJXOw6AGukgy8ItAL9WTKWWsbb7bjqsOC4EQxcJPN2?=
 =?us-ascii?Q?gM59PIfB+o65SDtf/FXRRx6ECQ4y/79a5PUoavj4CjfwSntQihEgTFHAxNyL?=
 =?us-ascii?Q?mBuMBDLLSzzyLkF6p2UYHEY49w477PfmERbOQxhMn7+nTLMOIDlbM1ZjAO1K?=
 =?us-ascii?Q?ezNXaJcJdfaF6QXmmk1snw3EG4x8NTe1Amjx3xCnrUKUQsB8HfKzlC/lQBoN?=
 =?us-ascii?Q?TSoPMqR86ud13zOSWjv79wh68tMmcit/HbY3HzlP/d4Ea78nlfHAm9kbwuk2?=
 =?us-ascii?Q?qTpg783vV41aBJO0yE9AJeXc0jfmuADWnEdSsakY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36056970-5f2f-46c4-0d02-08ddc9fddd2e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 15:30:33.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YauXQA9jBLnn1T1Gv9zBw2B0A/WQQkkyUqa3GKONkAWnoXpDTivWYAlqKRglgxnxUKlTedT7ghTDL6pkrCftw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10956

On Tue, Jul 22, 2025 at 09:07:43PM +0200, Wolfram Sang wrote:
> Align existing defines to follow the consistent pattern:
> I3C_BUS_<PARAM>_<MAX|MIN|TYP>_<UNIT>. Prepare the codebase for adding
> new parameters and help avoid duplication.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v3:
> * Reworded commit message
> * added version of spec and chapter number to the comment
>
> I added the chapter number to the main comment because it is applicable
> for all the values here and the next patch. I thought it doesn't make
> sense to repeat it all over for each value.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/i3c/master.c               | 12 ++++++------
>  drivers/i3c/master/dw-i3c-master.c |  4 ++--
>  include/linux/i3c/master.h         |  9 +++++----
>  3 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ffb734d378e2..6a2594dc29e6 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -728,12 +728,12 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
>  	switch (i3cbus->mode) {
>  	case I3C_BUS_MODE_PURE:
>  		if (!i3cbus->scl_rate.i3c)
> -			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
>  		break;
>  	case I3C_BUS_MODE_MIXED_FAST:
>  	case I3C_BUS_MODE_MIXED_LIMITED:
>  		if (!i3cbus->scl_rate.i3c)
> -			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> +			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
>  		if (!i3cbus->scl_rate.i2c)
>  			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
>  		break;
> @@ -755,8 +755,8 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
>  	 * I3C/I2C frequency may have been overridden, check that user-provided
>  	 * values are not exceeding max possible frequency.
>  	 */
> -	if (i3cbus->scl_rate.i3c > I3C_BUS_MAX_I3C_SCL_RATE ||
> -	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_RATE)
> +	if (i3cbus->scl_rate.i3c > I3C_BUS_I3C_SCL_MAX_RATE ||
> +	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE)
>  		return -EINVAL;
>
>  	return 0;
> @@ -2786,7 +2786,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  			const struct i3c_master_controller_ops *ops,
>  			bool secondary)
>  {
> -	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
>  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
>  	struct i2c_dev_boardinfo *i2cbi;
> @@ -2845,7 +2845,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		}
>
>  		if (i2cbi->lvr & I3C_LVR_I2C_FM_MODE)
> -			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
> +			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_MAX_RATE;
>  	}
>
>  	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 91429d94a866..dc234efa046d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -622,14 +622,14 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
>  	core_period = DIV_ROUND_UP(1000000000, core_rate);
>
>  	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FMP_TLOW_MIN_NS, core_period);
> -	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_RATE) - lcnt;
> +	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE) - lcnt;
>  	scl_timing = SCL_I2C_FMP_TIMING_HCNT(hcnt) |
>  		     SCL_I2C_FMP_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I2C_FMP_TIMING);
>  	master->i2c_fmp_timing = scl_timing;
>
>  	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FM_TLOW_MIN_NS, core_period);
> -	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_RATE) - lcnt;
> +	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_MAX_RATE) - lcnt;
>  	scl_timing = SCL_I2C_FM_TIMING_HCNT(hcnt) |
>  		     SCL_I2C_FM_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I2C_FM_TIMING);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c67922ece617..7dfcbe530515 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -249,10 +249,11 @@ struct i3c_device {
>   */
>  #define I3C_BUS_MAX_DEVS		11
>
> -#define I3C_BUS_MAX_I3C_SCL_RATE	12900000
> -#define I3C_BUS_TYP_I3C_SCL_RATE	12500000
> -#define I3C_BUS_I2C_FM_PLUS_SCL_RATE	1000000
> -#define I3C_BUS_I2C_FM_SCL_RATE		400000
> +/* Taken from the I3C Spec V1.1.1, chapter 6.2. "Timing specification" */
> +#define I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE	1000000
> +#define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
> +#define I3C_BUS_I3C_SCL_MAX_RATE	12900000
> +#define I3C_BUS_I3C_SCL_TYP_RATE	12500000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
>
>  /**
> --
> 2.47.2
>

