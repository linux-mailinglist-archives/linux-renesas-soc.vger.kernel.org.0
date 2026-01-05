Return-Path: <linux-renesas-soc+bounces-26306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37EACF4EE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 18:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C9F8300A3E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 17:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FD3322DC1;
	Mon,  5 Jan 2026 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TPlpKTZ3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC51D31355F;
	Mon,  5 Jan 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633136; cv=fail; b=WBCmSyL2UUxljshQno3cLNZLDGXVkjGjzxXMrBVHnlDJ+27Ni3DzRfSwrMGT7l2GhexbEcjq+cKjtf9YpZEKPEx4vhVXWx+ALkpjCvaen5REniTYoqvKoe7AMgQcrxXltkdUIdptFKlHwIBz8O/KPg3BbBEKXlvkICjqIW76tSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633136; c=relaxed/simple;
	bh=M7QaM7wmzTdC5pTXVI/vkbX5jzf+RHA72nwNCF+vp30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PV/gtUos5nI/bleXjA3GynAHh4WaOLphgqQXE2ZkFtjP6rYJ6u6+nKRbjoxCG8JZJDWXrrPRsxVL2effRuA8v8Bo/5w/cCSW7Fp1rT0zvMYjKXzcmOJwKJ3hZhslPc2QDy4DjoryFx9+wSPbrz5SW4nXj2shjB02KakU123FpkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TPlpKTZ3; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEl4CxFaBTCNpOIc5cmVvbuWdv0dvvdjn+i4DT2ORvjEZIQKyQT+82ssWdQ7TlLo14bPH+gzV+QpmHWFm29Tuodr/DE/ASkFMoKrFvN9UFGoSFTuuWvzihONXa8L2dOlHA6kqLHK577TmrUJjcgm472r7DdRDewdgXZWDrQml3Wsq1sELHnzLDfqzw+TfkSqJou1eRnFAU1Z5QIMVBpcbLW0Qi8JXTzmheJ0tQKEnUaR5DjRNo6DqZ8iJxMxNvqLzVsls+TCTKMUcIjBrqqwxkriImO/yaflwPouOOB6Tms9Nr+pV1gqLpfvNvPaaowD8DxyLbIMYrCJUp7Hlv7Vhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTU9d8pSSy2z89JGOJyA0RjGyFiuk3PoMi+DwhpA8ZI=;
 b=XImHoijIXT/ZBW5oS6oWL0fi+gQrNlt5f2frTfLxpPVtFPQLFEY5V7DjkiUTfEQUcfP6zLqt7epya9M/3ljmGQhztQ+xwmUi+SrARZaWAd7ogO5IkKp6JS1FNBImARWOHI7jt4//txwQUrI67qP4cHP+tqZEph0KBDwKtU3x0x0i0n1/C2A1PtZNmtY9Ialv4q/LRPLdtGztbkDRnF+61HzXdCsJZwqEgbFtOkrDoW9cBhqe1uqNnnuyl6hSAohnQrdNWwVjJYiZYGUBiATL+EUelSxUnlUrjwD8DKaVA3BOXf3/cc1oIfp6ED2b26/Go4oUrvr8BOXclPMf6MLBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTU9d8pSSy2z89JGOJyA0RjGyFiuk3PoMi+DwhpA8ZI=;
 b=TPlpKTZ3fZetTjO43J3IfcZuNP0U4xJ+LeLLLS8Es3+UuJeC4iZlduHmd60/+ILbJTe4qMAMDgJ+c35DSv4K34AsclYgFRh9pLujZZdSy0Y54+KOj0EF6Mw5OSO70ElvLJ6cm7ssqOcMzJl0dGas32erU1FeSupUCsTNH8cuT5KOmeUZoyfWu/S1qO4sTsfYfYd5HPPD0Iyb44GQniETEm/G/8KRqDGSM6nGGeWHwjpN4rDA3Q5jR3KbckB1qPMg2xLQVleyZfzUipBHwFFIZMXoVFfEUyTNBT9pVSyH/DQP0gzibJBt/U5xh1esADaPevpO0Kse8rh58JY8V3h31w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:12:09 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:12:09 +0000
Date: Mon, 5 Jan 2026 12:11:58 -0500
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
Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 982faa30-21ac-408b-70a3-08de4c7d8f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RBG67p1s/Hz+a0ls4AsF6y8I2v4jVzuhs5GwXRN/r+jUgamo8XZuoatBLzPi?=
 =?us-ascii?Q?BUm8yRCgCnSG4VY6UJO75mm7XlOzHQDp+7xJ9gajym1B0bG5ft0vbly+KFs7?=
 =?us-ascii?Q?DWezFZRMhyWbmiF2oLmXt6b2jbFF3cOpm8/Jpdc8ZvtVgEO86JeXZjV7ygzc?=
 =?us-ascii?Q?33DE34dDNO4H3NjFDAnken58PKWPZN6/8gY8c3V+rrAlWZUavlu6N69cZ6zD?=
 =?us-ascii?Q?lu056RrOnIZ40oTj+IfsL6n9xZHDhC37YTNuC4IfHYL1b5fniw1q5fVi9UON?=
 =?us-ascii?Q?Cx2+BX6vlgdDcklEaTzPfxjkNGcAb6XGwpqOpVik0S3MTillKvZQtIlCAHq0?=
 =?us-ascii?Q?of7koSY+fUet+Df/E+Z7U9vMkkuJM83rC3n+m9Cj4Pd0kmeqTRBL1tbtxzRY?=
 =?us-ascii?Q?Ko1WZImDB0UWhaOzJIn/qhnJhMbK1EQyc8SK2/FF2erp14w5cIsKZuzdyda1?=
 =?us-ascii?Q?SJMHaMgWGMhdYpT0dSf8LV21xGImASu21sL4X9zc3dluwluUDE1OHoeZUZMs?=
 =?us-ascii?Q?EfV/neN/FZdTTZv02eCiFZXyxc45UVdBWOw/tASIjYB9EIG2brifH/qc7QuQ?=
 =?us-ascii?Q?vgRdv72MckRFJr+uGEFS7dTvy2RQz2M8rH2JRo7gyhz+9dEC5x1093a+Zp9j?=
 =?us-ascii?Q?j5CzDSxTX11ixZ6KAde8kgsT+mwlhYAbeU9vdCMua8kabrNUMVCYt2gTGaEW?=
 =?us-ascii?Q?j2f3n9PfPjmUTVno7b5aQhIU2Z0mJR/PS5dHOlFErgrboVR9neZV23WdUfOK?=
 =?us-ascii?Q?wKmiTPXEEU20Y6VGrnbwyhcq/pOJee/h2sm5Z8yuijiYcr4NO+PRl6ApeF1o?=
 =?us-ascii?Q?JyJDkuVMTSpPkbt/se9uwVIVx8OiyTxb1GvlpiPK1vLsxdlLwd1V0RJyxyIj?=
 =?us-ascii?Q?F9N4wiKOMS+iYc+ySIsjCBkcjmbZE0Wg+sFEAMznPydKkgMyqSF8G3RjAF7t?=
 =?us-ascii?Q?nWjYg7r6PT3Pr+mBCwJQpHoSkJyewCszDuLy2sb0vUyAFIQAmpbl+49zIBg+?=
 =?us-ascii?Q?M/DeaCQdOhKCcdBoBUn4enHnQqBo4LbUu+/5U1y1/kD32gQ6SNFfWWtE6+Ks?=
 =?us-ascii?Q?GnWhR8MzBSbqu8K8/LWdobrvDthRRHxUm51MiTRao1q4AMuRpFZfoJzf4BGW?=
 =?us-ascii?Q?DwD+qSAeSrK89yxDemr6HeW5Ju2z7gynBcbF9/54gNe+VAEJgnCSwNlfIobG?=
 =?us-ascii?Q?B+Qo332gVqZBRVJMHWvrL58+1KIVCuEGns9xSRzDozbFYENAKtCldDnJ95RK?=
 =?us-ascii?Q?dS5QfcSfKzMBPTXwpwSE/rQafOulILKxB3h2n/BiXlLtyuEyC4mv26ZCDjRQ?=
 =?us-ascii?Q?fBBmSAffFW7/DuAHHnakG4BOXxisdgijbvAWT5gz3OrYfYv0+zT242PKHinI?=
 =?us-ascii?Q?F6HYJQMHskPrGw487ORfx9urTtaVqryFB+Q1DDk4uYPqYdM/IqmPv4rNzFGd?=
 =?us-ascii?Q?GRXWf8/futgF2FRc9FDD7/8N89ycfVwP+UDD+xx4Wi+zIMaCV6aU0XrxXHSZ?=
 =?us-ascii?Q?RXXP8W4r82k2mO6RteqXKOlKn4ccjGnthzRB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q0BLbcb7jNYAaUZoDgw+Bs6ynjSofgDekAVzsOx3azaHTzYsOw0aXKyrvigL?=
 =?us-ascii?Q?xOEdGainqu1GuYqphjslEyIRQz0IE9hkIFvtIMvIaReRQT3UBue0ewQJgj3q?=
 =?us-ascii?Q?8v9iaBmS4f2ByFRPHg0WCk/qIxSreiGLIVq2jI8gGg3Kt79CWqIq8qi9Vgy7?=
 =?us-ascii?Q?eGqHBL5JR9lcsPfEeWLGjZT2syHcegXbJM8A6xcQ7vUEZRzo0mVpNmm8tiA0?=
 =?us-ascii?Q?sgGmGwpBLOFEOjGgPXSQXiy+c2t/ADQQQFtMspH/WlxQJylRXS3rb31nnEr8?=
 =?us-ascii?Q?3qxIW3Otv1/gs2vLwvGe0adt1rA0lQzACMauLFtQZN0IDv3lA/6rPhzsgYw9?=
 =?us-ascii?Q?Wb82UzbbwbU8jY8CjuuTWQyX+Fz6D+lcqrCJq1UA571R34RHc461silw6SEE?=
 =?us-ascii?Q?uDuyS8xtdEypxouIHRiPQaDy4yngziwDm+w+x2hSKrjqL/ggaykBLkHqqcoz?=
 =?us-ascii?Q?ty/kSuvBKck9O3ARl6f/JChZcaw1Q7xqkP1Byh2LwVh+6JgdFilUrA14P7tu?=
 =?us-ascii?Q?kCE58rO7X5cjkWE8DJvRNjz2i0NdZSAfuCMRY6LPOi1YwKGZeC/56dL2KNWa?=
 =?us-ascii?Q?9ncEO/MDvD15got/Nn6Md6X6KxhNulkk9xwEam/L+o/RKN7cbS918Dj4aOX9?=
 =?us-ascii?Q?eGKqHjTH3D7fHxi6iLcyl6N+AHujfCtftOGlchR06a8T/hIu6zQNWrp5UARa?=
 =?us-ascii?Q?MAQjxS1EKBt3x47/JXzDbKgeruH+YMkMb9SSl6vfntLgC6B3w86VycVxlPet?=
 =?us-ascii?Q?lLdi+t/uoOLFbT5A+7LSn1cIZiyEDTujawq09FwRZ79yb1sfUD6jZ4yoVE0F?=
 =?us-ascii?Q?GR4bgrjBQMmRRy8vsFHm5CPhvnakYiktwqyMBuXq1Rin+mVw110VNN35mi6w?=
 =?us-ascii?Q?8wrBQWbUqM0hSS4WDai6qnufKAmsgUW5WKf+gJPKLn2z9GBWuFdOmsZgn7jO?=
 =?us-ascii?Q?I6dCViBPORa1qN0RZrbi8LILDhJuP5Ic/tFzCLHI+IlJgkCDes7sv99IENpX?=
 =?us-ascii?Q?Uv/91T/LOGZ82ZKRsPbgt+73Hmsww+hiTZAvGPYR8v03s6LDWb74BENi1B/X?=
 =?us-ascii?Q?wu470JyzS+EWs6uiLMzpTXonC9yWuOrJ1qq2o5EqbC45XhOVmwmKWjth/Jh6?=
 =?us-ascii?Q?NPk3muUZJo9MMk8gdJNAqy8acW8NEE1zTmX+NMShyEY2DwoDkYyQ1xibKKfK?=
 =?us-ascii?Q?mKC2SB74a4ywmYU6jKduneZWowOT8a0TZsTUjB3Hlf8r2o66sjhZXu4GnN1L?=
 =?us-ascii?Q?vgl3vMu5GlMZ36YjtDz8EAMoxqg1zPVCubjW8uFb4bH2QMcBid4lIxM5g4YF?=
 =?us-ascii?Q?b/qZtmUYxxzCTfw2jyvi0OmsGu2xr+JAQ/wcSBHgKI9lBjUiwt6+EuWmaNtg?=
 =?us-ascii?Q?G3o4v9hyWwmB8swdY/cBayIzgZgWJx+v4MqmUch0+QBJsmeLTrTRQ7DclPTz?=
 =?us-ascii?Q?HqS40BwnUT1ylfhRD3ovVe1Jtt/TpQ41WkLxx3tfu+nHKXczf/6w6Avr4YHG?=
 =?us-ascii?Q?bsyStZoHITFCm7SX5gHJnE6EVoODJb0TrrTltxte2dAAFj5R6Cu0LOi/eRyc?=
 =?us-ascii?Q?C6m2cyQaW0KicKE0NepCJTdInm3vzAaeNzmtA3qAc2bYg/ZnsECNyS4Kh9vo?=
 =?us-ascii?Q?dttrAVxh0yuw7Xeeu9ifUPb1ullV3HeDCxmiN84LFp6zrd8EMcbzYWtJX67V?=
 =?us-ascii?Q?ffyryth8PWqdeljvb4mczXvyEdcyNkcF2YmW1N6Y4iXCzpYM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982faa30-21ac-408b-70a3-08de4c7d8f39
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:12:09.2209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5Bcat4gGUST31upFzuwd8FPnWKirn6akSH9Vat3hROiFIwMCnmP0ALOgMk67CZXT4SsLeSPx7XMWh7/F+YzvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916

On Mon, Jan 05, 2026 at 11:49:59AM +0100, Tommaso Merciai wrote:
> Replace individual devm_clk_get_enabled() calls with the clk_bulk API
> and store the clock handles in the driver's private data structure.
>
> All clocks required by the controller are now acquired and enabled using
> devm_clk_bulk_get_all_enabled(), removing the need for per-SoC clock
> handling and the renesas_i3c_config data.
> The TCLK is accessed via a fixed index in the bulk clock array.
>
> Simplify the code and prepare the driver for upcoming suspend/resume
> support.
>
> No functional change intended.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v3->v4:
>  - Collected Biju Das tag.
>
> v2->v3:
>  - Added define for TCLK index.
>  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
>  - Improved commit body.
>  - Dropped unnecessary static const char * const renesas_i3c_clks[].
>  - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
>
> v1->v2:
>  - New patch.
>
>  drivers/i3c/master/renesas-i3c.c | 43 ++++++++------------------------
>  1 file changed, 11 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 426a418f29b6..1b8f4be9ad67 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -198,6 +198,8 @@
>  #define RENESAS_I3C_MAX_DEVS	8
>  #define I2C_INIT_MSG		-1
>
> +#define RENESAS_I3C_TCLK_IDX	1
> +
>  enum i3c_internal_state {
>  	I3C_INTERNAL_STATE_DISABLED,
>  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> @@ -259,7 +261,8 @@ struct renesas_i3c {
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> -	struct clk *tclk;
> +	struct clk_bulk_data *clks;
> +	u8 num_clks;
>  };
>
>  struct renesas_i3c_i2c_dev_data {
> @@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
>  	const char *desc;
>  };
>
> -struct renesas_i3c_config {
> -	unsigned int has_pclkrw:1;
> -};
> -
>  static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
>  {
>  	u32 data = readl(reg);
> @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
>  	int ret;
>
> -	rate = clk_get_rate(i3c->tclk);
> +	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
>  	if (!rate)
>  		return -EINVAL;
>
> @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  {
>  	struct renesas_i3c *i3c;
>  	struct reset_control *reset;
> -	struct clk *clk;
> -	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
>  	int ret, i;
>
> -	if (!config)
> -		return -ENODATA;
> -
>  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
>  	if (!i3c)
>  		return -ENOMEM;
> @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i3c->regs))
>  		return PTR_ERR(i3c->regs);
>
> -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> -
> -	if (config->has_pclkrw) {
> -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> -		if (IS_ERR(clk))
> -			return PTR_ERR(clk);
> -	}
> +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> +	if (ret < 0)
> +		return ret;
>
> -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> -	if (IS_ERR(i3c->tclk))
> -		return PTR_ERR(i3c->tclk);
> +	i3c->num_clks = ret;

Need check num_clks > RENESAS_I3C_TCLK_IDX to avoid outbound access at
i3c->clks[RENESAS_I3C_TCLK_IDX].clk

Frank

>
>  	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
>  	if (IS_ERR(reset))
> @@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
>
> -static const struct renesas_i3c_config empty_i3c_config = {
> -};
> -
> -static const struct renesas_i3c_config r9a09g047_i3c_config = {
> -	.has_pclkrw = 1,
> -};
> -
>  static const struct of_device_id renesas_i3c_of_ids[] = {
> -	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
> -	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
> +	{ .compatible = "renesas,r9a08g045-i3c" },
> +	{ .compatible = "renesas,r9a09g047-i3c" },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
> --
> 2.43.0
>

