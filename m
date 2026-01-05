Return-Path: <linux-renesas-soc+bounces-26307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5114CF4F84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 18:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33D1830ABCEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 17:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066D232470F;
	Mon,  5 Jan 2026 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iiIwmmw+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D7731AF1B;
	Mon,  5 Jan 2026 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633332; cv=fail; b=a94lsJFrAwT4H3KreiOLt1EQFZpcuVniL+EddiHFTB0VOnG6BRnQ2TBliUVo6ja0Jk05mJ8aqz4V0OsSX/1lnkB2eiin8WNRrUmipOoNBG+mnpGZcvgPoD8AFXtotfAf5peNMmFLm1WuWPNwxDWBFuGSod+ufF+YAcXkxIUAqmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633332; c=relaxed/simple;
	bh=MmunTSbjvWyjF+oK3sn05cqYr+Et4vSbJV7sXU0XPfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l8Qg3qBayscdkXjlCtXz3ZdivkGzwn4eBs3rkeyW50LoOo6lRPu6RoKGJ2WK6Z5iFMNvTF2Jiq/0W9VE4Az/zlq72m+WVcZcD3uLtX9Ojb5hNzyqoJQ5tmGfWOry+f9FEaUekiklr8cV3lAvSUAjMfWEtg5g57m6X0ARis5OxJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iiIwmmw+; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKUjQkW602o5Dd4wVpse7zuUvsvfHoHTxqpBUa7/Knda1ObZ38WEluzUWHihBfQ75rYiBiXpu2FTQqivbZK+pH9BhQIUkcErhdqeuqLLHhTTwr5qgI5GyNKWmqVsaonnUyEKwoT2CtCCyUc+hrRBl/uTLSDTqww0OpLR4w3/7m+0iQTfnHi3B/0JctYPggI7mY89UOtaqGj4CHz11hrl7MLSkAezA7QXHgbQZo3+gaHS9Lzc/GwkvGFXbTyllKcM72lffiZ1P69D1IbUwj5UflFlFPixL2ZtGr2DB36UIhyri8FfMNRiOrcjqyle4UaKFGBnFuGDQIZUzCpzz1DmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLF7wZ3FQTn8DWowRl/UGphsO0dLGXnhDniBE/cD3Ak=;
 b=gsGMcG52vG9AFHeSB8mIgkZ5o5U3p2EXAqvU5iB21YTCp2bVU3xMGC1UqQBJGgoJEsIWLXAXMediXMbX1zt48pRpGgdbmV+ih0JadKX/NGIyOeQBuomVejBQYG18oax/EJ6SsN1/HXVOHTA+7aUVZACXII+2rmhiFhV68TdB71o7Mz4ccLN6tyJV8Skld9eVoKPSXjsGIJTJofjBgXKKVb/mvzc/N1lboLaLtrgN+hXAqbkGqez9cZbyme7AuFgsDK1QuSNA4Zj8fFH5Geu3+5GGfey9C61PC8KM5nX0FlLbhgXu+qFXquNeHlUYqmST3cY5Dss7SQ65DU0o78P9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLF7wZ3FQTn8DWowRl/UGphsO0dLGXnhDniBE/cD3Ak=;
 b=iiIwmmw+EJNLyQiUg5aAhN5frJ85skQLAdRqiIRnaXMMFhkrSFiDlKH4njpZ68zLA1sFvVJb0OJnEjAHKIbgauG6R/PfY8ARb3OAMutDtPAiGhKfyihPMvFepm+tz2Il56IaGMyugJ3XrL14QBvtmSFpsWv4hKg4eGNNhUIQ8HPccMFZVnRaj6LTIwQUpLQ1NkyCTu8oTg4UedjAs6IlLvpg7qCniuG5YBUj+amPF9fqu1A+3+XFqLeEcuuVYMX3iBVzo7/6ez0LKyFR6VKxVL8vjTL28L6Dg6gCo+h5Oi6hNKSQBfNs+O6QbGAZs9I6UKA+hjztPTUHs+r6Cjvyog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU0PR04MB9252.eurprd04.prod.outlook.com (2603:10a6:10:353::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:15:27 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:15:27 +0000
Date: Mon, 5 Jan 2026 12:15:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] i3c: renesas: Add suspend/resume support
Message-ID: <aVvxp2hBcChwl1Xp@lizhi-Precision-Tower-5810>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <e7d14d84bea4503d2e0b8163d864e29b710b404f.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d14d84bea4503d2e0b8163d864e29b710b404f.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU0PR04MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8159f494-4daf-4039-a990-08de4c7e055e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KUpDt04hBCe1YQJtTSEFehPHwn9XZwliD68QJQHCAzA0bpIvuKU9aYl9RZVx?=
 =?us-ascii?Q?9Ym9uWCOAz53gMTAq2dfDKaIWgJCX1BG3SrA79X/K7pUO7sntY0cLiPNpZ+l?=
 =?us-ascii?Q?pgX3Ii+gp/bms7z1He4k7xn+iXykvHt5gkNMlMvpb6aOlOCcS0+TVjcJ+6th?=
 =?us-ascii?Q?VFhzm/EaH/3DA4MDCxxHG2NmOcMHKVUVh2TRVZ6zBcKGaRqZQWOjht7lGLui?=
 =?us-ascii?Q?Wn28hyZlVW6FGkVCxMwgVMcCsc8yyBfBcZMHu82JuvUhaKKn+/CLcJKgNucM?=
 =?us-ascii?Q?UzFZZ3coMp4zf0onUQXL+jcfp7yXWqghkbvzGC158hcaUBoas62oCO2GuG7s?=
 =?us-ascii?Q?tuISQ3/CvfIAi6v28zyNkfTg9o0YaNJQhFao5E1FeEwx1kBKNRrUtVA02lkW?=
 =?us-ascii?Q?enFWprtRlRaKI4smIboViVZWABJKXf+DbsCEjM6FCxpnY8makN4fLF5xYN9+?=
 =?us-ascii?Q?FvPTBAV1CaOtggURId0ICCHBOU2EKf/dfINgc+INiKias+OGPMfYxa4pY1sb?=
 =?us-ascii?Q?NxR8Js+OaWMn94DtHxCxnds88L0SQL86DY6wo1wusrMbSf7poShmugvULWhZ?=
 =?us-ascii?Q?RCXWGoJ1QivR4CnytI9DQiUsJG010TTi+tm9JoKN6uZy6QDjXLBYnGSUaDy3?=
 =?us-ascii?Q?cHon03Kk18WNVSkK476kG7fTASuMictALs39oi5bRYdloq5Q6d6zeuDMpymp?=
 =?us-ascii?Q?HNMyz/9bcOP4/1zGd+rbyz2FMqqyXVRcYjw4IYCS8OvxRKSU/ppXzSpDtbrq?=
 =?us-ascii?Q?k9zVcfxzMBJGoevwZNl7UF6oU0RvM18b+dM1rP9qUavmsfAS/sL3zojLTTQ2?=
 =?us-ascii?Q?q7Hs4pe68BNHv5EUWaHzWvj0RhKv3pG6AQapHQalsFARukLFuB1loLUiSaHM?=
 =?us-ascii?Q?+TdhC5X+d5The6XKdQMpvz4NbzGaqlm1/zLubzzcKNvSViwjii52NhchYd1g?=
 =?us-ascii?Q?SUe9aTnN6zmEfKRGGDyTEP0/YKJvUppwEI/rFIf5aGD8WYUsomo3NXiOF6XA?=
 =?us-ascii?Q?QpymhNUeSUuscSYt+8PEI8ZZmWYAwU1ju+M7a8bNuU2IIBBImnXFglE7jMld?=
 =?us-ascii?Q?RJitmQGlBe8lgohPWVoWCV7BYPfL5L+iH0wUY+eA2iErtMkbkd8VjK7oZjmC?=
 =?us-ascii?Q?1fEtZ0bIoXltzRK11/79dHgIejEt4S/XUSH37DcyKsL3hYB0r6tCEWybe5d7?=
 =?us-ascii?Q?tShP4DCkRk9QDV+OwyaPuor62LpsmhrFqtagOp9BtrHNhJ2WrZeXTMPko1Ls?=
 =?us-ascii?Q?wxn3fRgrDlJ4aMMHwrWmjj+OhqGmcYymKoV2EP43V0W8ihsCB6SfYGemrisa?=
 =?us-ascii?Q?7DBz7pM+4+v5PamiUXimKscLwF2jSYQoQol2YHKOaGsU0/meTu/LCt2ns8Ec?=
 =?us-ascii?Q?e2Hq/P+NbB92J/jQc9kHje7QGqdsBfJWqGjPZuqxGoxa3T8XgHHN1yNCKlfY?=
 =?us-ascii?Q?3OOIHTntU+b6tU4KRPRniuGJRpFClfrX/eO25xjVipXrO0O5hkZcXtbwKqAa?=
 =?us-ascii?Q?xzsYdfGcCSt+QLtiaQ/8CLS8+f5t/V44fKuy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ki7U92wXp6ITa6Ntd97DsDnBrLw2NfE5c5Ejde+vpxFzrE6iUPFSo0+hUFjX?=
 =?us-ascii?Q?JmUYRo4prcAoj1YsEXYvqWUy/9mUlWfyOf2HQ2gGDdsqWCDMnKw8rNInKKfV?=
 =?us-ascii?Q?sZBSrf1idBhWFvkMTUI/idqBkVnGKYuKpW5fFbNuc3482Vv6uUg+fktW9me2?=
 =?us-ascii?Q?t4OZEOFS0uNDPIi7qnOISLvt36TT8kQwWrcr19Qr/dk0Zwgxi9QFEMIQDwS6?=
 =?us-ascii?Q?bNi/IBbU0KgLbNPxzWoi34eNE/9setPekSWjgIgINztM8Cr1pao3XTcuLWoH?=
 =?us-ascii?Q?RqL47FtscOYEnkcSy6xqgKzjMmj260zbfgkUyGbvDSO1jnTMukWja4b7hK9a?=
 =?us-ascii?Q?EwplTznelTx22608FSVpC+YCu7/FGMTN1yMB0S5Q8e3P4QraiO7P5QBXC76W?=
 =?us-ascii?Q?hpuUuSb92YRzJKxyJhQV9VWXuY899g71p+BcB7xQCffzikqcHZw2CMM9/jMI?=
 =?us-ascii?Q?7RontCdaQkab8jzLslRETG+qMtvYoYv1rPOoelPAea/tS0H/wRethJ8oCvOB?=
 =?us-ascii?Q?kCqB8c9DkpPPnmUZFzDsvyFLuZ+PGWI9IFkzpva8A0KDp3an5chi1KVvbCs+?=
 =?us-ascii?Q?iOqH5cyRWvonCEwgwMAxQ3HcdpFSpiwnAyM97XgxdU5Zp4Cubrkc0dghNNcG?=
 =?us-ascii?Q?TjOrqJdrMYCAdiLGvRhBZkwGyjVzVbDBYhcP7pu3v+gjdE5wPiFd0JXwpHdh?=
 =?us-ascii?Q?o9Hg01dtMdJa7jzFztOdEnv2lLUat+nLHBouGXNQlsuWFSE139WaAurfd4kA?=
 =?us-ascii?Q?NAwNdz0DrIvAYKAmi4JrFRT6H6/cnS81Y7D7yK1bGVmnqMOocBvtikxwssff?=
 =?us-ascii?Q?HmsL3rR3ZDfjfwW78ZpWtja58shtxGKnTdKZreSCU7SCe3wLkBgHnIwd72GR?=
 =?us-ascii?Q?vDchYU29IerTThs/BbBAWact7xbGE6F8IyFdFq0Y8HorZ1F6BNYirCzp7JR/?=
 =?us-ascii?Q?PPhjI05bnQbgESk8WbUZ16AQrwLsWkBHxK/bbn0+1jgqSOTumV4i784uS6kS?=
 =?us-ascii?Q?SERGOwX09UVkxkNOeowYswsKvlGaqkS1IAGxOQzvKPxweLpgHM52yZofIJZI?=
 =?us-ascii?Q?PVmWlPXt2dF4PBT9t2DlZt2ajnDJP+40L9bCz5jcfok6CTHt6cgrnSe3L1Xz?=
 =?us-ascii?Q?tvT5RjfDFxREEAQEfVx9r9AdS1uJfHIxWWtNaWvVdEfsw0CLK81nlZ+Zh+Gi?=
 =?us-ascii?Q?p1Jzy6/Zto8kLoh7wiYzTTyDethTC8WS7XFVCKJ7a3rWvJB8KgNAc97eRzEC?=
 =?us-ascii?Q?pOcy7JKxX3eSaQ29L6pvsq8QHgltmX6RafPz+MPTXUZG8237iJtP7MRDmMGX?=
 =?us-ascii?Q?NqwkA2EgWdjILrV0nkYwplRTqusWSHHOPxAV1N1zvPy9iWiBXA84G6pGm2Zm?=
 =?us-ascii?Q?P0uZpymdaJlVJSZrTQ6uu5uEJ4watsLlTfs53dOkYWiho3n5hQ6ZA0gIX6wu?=
 =?us-ascii?Q?CfiUO4KOdPfOfZOhvg4tq0bn4Vxu4VdaZM8OW9mn7dkzbk3Zm7BxVm6gYe/f?=
 =?us-ascii?Q?huJSV6y1zvdiWNlTx8umxDAtpRzozb+MGaKWjFsXRYb2SFvD42vOrkzzzYMY?=
 =?us-ascii?Q?SBjCqSqpc4m490NqnISkVz3keMi/VUs/LH772qj8F5t1bOuR9J0R3lFNCogD?=
 =?us-ascii?Q?8pPExga3Biq9JOT0ZgSDQ0akpusyK660IZcCcfCe7yZk/7iEuZqiDnhZ/H7Q?=
 =?us-ascii?Q?NMADZ3lwOcuJ6cKSmChp3CftkCwfUkzYGHNzQKGbtD57dwTGkm2BVEhImIY8?=
 =?us-ascii?Q?fD+pXImFDw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8159f494-4daf-4039-a990-08de4c7e055e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:15:27.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKMTed78Q+ammhjV7jZoZMB/HjXA2Tb+oQOnq3QykDYlsuRfZ1K1jYqjFtnLTpgV4Af8YxbWuHE8mM5kQRs5tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9252

On Mon, Jan 05, 2026 at 11:50:02AM +0100, Tommaso Merciai wrote:
> The Renesas I3C controller does not retain its register state across system
> suspend, requiring the driver to explicitly save and restore hardware
> configuration.
>
> Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
>
> During suspend, save the Device Address Table (DAT) entries, assert reset
> lines, and disable all related clocks to allow the controller to enter a
> low-power state.
>
> On resume, re-enable clocks and reset lines in the proper order. Restore
> the REFCKCTL register, master dynamic address, and all DAT entries, then
> reinitialize the controller.
>
> Store the REFCLK divider value, and the master dynamic address to restore
> timing and addressing configuration after resume.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v3->v4:
>  - Use clk_bulk_disable/enable() into renesas_i3c_suspend/resume_noirq()
>    instead of clk_bulk_prepare_enable()/clk_bulk_disable_unprepare()
>
> v2->v3:
>  - Fixed error path into renesas_i3c_resume_noirq() and
>    renesas_i3c_suspend_noirq() function.
>  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.
>
> v1->v2:
>  - Updated commit as v1 has been split into smaller patches.
>  - Use clock bulk API into renesas_i3c_suspend_noirq() and
>    renesas_i3c_resume_noirq().
>
>  drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index b065b8d4b138..4123593fc16b 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -256,16 +256,19 @@ struct renesas_i3c {
>  	enum i3c_internal_state internal_state;
>  	u16 maxdevs;
>  	u32 free_pos;
> +	u32 dyn_addr;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
>  	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> +	u32 *DATBASn;
>  	struct clk_bulk_data *clks;
>  	u8 num_clks;
>  	struct reset_control *presetn;
>  	struct reset_control *tresetn;
> +	u8 refclk_div;
>  };
>
>  struct renesas_i3c_i2c_dev_data {
> @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  					   EXTBR_EBRHP(pp_high_ticks));
>
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	i3c->refclk_div = cks;
>
>  	/* I3C hw init*/
>  	renesas_i3c_hw_init(i3c);
> @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	if (ret < 0)
>  		return ret;
>
> +	i3c->dyn_addr = ret;
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
>
>  	memset(&info, 0, sizeof(info));
> @@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
>  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
>
> +	/* Allocate dynamic Device Address Table backup. */
> +	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> +				    GFP_KERNEL);
> +	if (!i3c->DATBASn)
> +		return -ENOMEM;
> +
>  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
>  }
>
> @@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
>
> +static int renesas_i3c_suspend_noirq(struct device *dev)
> +{
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> +
> +	/* Store Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> +
> +	ret = reset_control_assert(i3c->presetn);
> +	if (ret)
> +		goto err_mark_resumed;
> +
> +	ret = reset_control_assert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	clk_bulk_disable(i3c->num_clks, i3c->clks);
> +
> +	return 0;
> +
> +err_presetn:
> +	reset_control_deassert(i3c->presetn);
> +err_mark_resumed:
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return ret;
> +}
> +
> +static int renesas_i3c_resume_noirq(struct device *dev)
> +{
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	ret = reset_control_deassert(i3c->presetn);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
> +	if (ret)
> +		goto err_tresetn;
> +
> +	/* Re-store I3C registers value. */
> +	renesas_writel(i3c->regs, REFCKCTL,
> +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> +		       MSDVAD_MDYAD(i3c->dyn_addr));
> +
> +	/* Restore Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> +
> +	/* I3C hw init. */
> +	renesas_i3c_hw_init(i3c);
> +
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return 0;
> +
> +err_tresetn:
> +	reset_control_assert(i3c->tresetn);
> +err_presetn:
> +	reset_control_assert(i3c->presetn);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> +				  renesas_i3c_resume_noirq)
> +};
> +
>  static const struct of_device_id renesas_i3c_of_ids[] = {
>  	{ .compatible = "renesas,r9a08g045-i3c" },
>  	{ .compatible = "renesas,r9a09g047-i3c" },
> @@ -1385,6 +1473,7 @@ static struct platform_driver renesas_i3c = {
>  	.driver = {
>  		.name = "renesas-i3c",
>  		.of_match_table = renesas_i3c_of_ids,
> +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
>  	},
>  };
>  module_platform_driver(renesas_i3c);
> --
> 2.43.0
>

