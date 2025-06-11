Return-Path: <linux-renesas-soc+bounces-18132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FDAD5C75
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 18:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5E243A8984
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 16:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328AA1F866A;
	Wed, 11 Jun 2025 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M8Ici3Ws"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53B18D63A;
	Wed, 11 Jun 2025 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659844; cv=fail; b=rjC2mjnbYxXicmTn7VO5ItZaa9WNACPzFIpXcDdQ3CUm8Pvz4NPlgRS6UAHFGeMJGFxW+HV00qhGNrmGu+AfPnPkoX94q40U7uu6LEwPfERi/Q4XuEwBAzY/pb9Q9qCcbTjtnefyQ6lhbHX4enq4NXl8WHzNr+75PCcixpC+lds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659844; c=relaxed/simple;
	bh=6KV+J5lrnGzSUk2EX5Gk8VILF6Umy0EztqO7DUjm+OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lOse6ekBSoJhQFkipGs6SAbu2UAN+2so7yMRYV2Dw2V85gPrQnqCNtr960j4UOQZ20Z4lGag2mYnxorYv49QXkiqEi1a184ASa5EelfhC5V0ceVZeEd99WdBiXgLC32JFgfKeTZ5wJlnh97lM7qIkYjlWyn6U7v/qr79j86SIQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M8Ici3Ws; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwZfLO3JOqLxAk4z34FupsY1i7qoQ2nxRIxIDWSiodW3IiDKwxIZ6oRH+m5Wrt4oYpCY3p5JktGxNXZ8RRWXIBC4h6Bq/jxJffJO+JG10uDFdlLvQFiyCoyeBCcFgy4pMx+nFjmnjJMfvqoArdbx7pxFWXyIYDEyjGWHyTk4Ief+aksVyvtECXVKD6rSrvMY15Oa+OrtwS/WMWwRr4wYU4GSjW1k4hDPKONuuWPbHfsJyUCBK5FC3HOCiNCE5fbgbbdO3d82+Lc10TxIMuI1O4E9kvJAf8EaB0yd1ATfCP9SLYBUdKwomduuf8FKyIQ72TPukTNo9Aqdj+8YI93EWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mxVd5UybakoujQLJXcuKWtyBMpkKclIiXVPBZW/r3s=;
 b=XlRiUl/pXQaj3AGO4iYvP8uYU4z507GV5oOOGJ1UUCckzqWLie8pdxBFLSo2hInqj1hP17kvXdyTPR8h8tgEafw2Kb6+OXGkx0asik8XyEZLR8DtDu+YuKqW+wK+1+8dp+wH8Fx+QciWrVoDziXvNllpgVQrfxAujvkPO0U2Ki+G8ChSmTRahcsVLweW+zsVHBoETYtQ0ar4a0OOCYTrFITfkItkm5izNVxBAzoZ9XGkDcQw7eqt5H7K3VApikCkqlpa+Aend4ph2LosmqbBw6DFUHF5v3P1PVcixS9okGbR+txE8VoK7ahOq219F0wq74rhlY1sXW+vXO7bT1qgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mxVd5UybakoujQLJXcuKWtyBMpkKclIiXVPBZW/r3s=;
 b=M8Ici3Ws70dqc79jZxAPD1+yJwpwaH8qhmy8bcL2RTrkpNiTN1RQHICLPADh4SqVn9EBnsTgwBckV5SKHps+Bgy4ZtDr35zSv8A4M4cyWWFnPpZRB9G3JbPh6JlGnZJzz3WlaH/oGAScF6DlcmjDG0eFee6arV6Ac94nrB4BsfFYnD+r5DY/V3sqTNK+LmZ33hu+OOTG3JCCumyt7L2e0xI0Sd2w/W9AJI4me0iGGvL5F4g2UaeqdVx2+yCvX4zR6QWFE0hTLMlMgaVdkXH+hy+WB8vY+8ErkRWz3lgiG3h2rk9ltc3vVV255HA5WYecCdfxam8Dt1cpw0rTFDcksw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10463.eurprd04.prod.outlook.com (2603:10a6:800:238::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 16:37:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 16:37:15 +0000
Date: Wed, 11 Jun 2025 12:37:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: PH2PEPF0000385D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6b) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10463:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cbd463-1b14-4438-06e3-08dda90638e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wm9wvuk/fQVHkMBuLW/VEo6oC6joN5NG/7ETeFNB/V0xhLSINNMnypi8XHm8?=
 =?us-ascii?Q?IxaMU1BHlPQleujyuCJ3/VyOhFGRpfVtA+dFRTehk9J65fkWj8T1iW+y8Dwe?=
 =?us-ascii?Q?ghPys69N1mscUMkmIWWhp1kDds1k+KwqvAdicYhE+EHscm3TXnEVOUJnUFHs?=
 =?us-ascii?Q?OqFWZTvBXWFXqXCUaYuLRx74BIx7DSbJVIHJmHEGLdDrInJDhA/4guApt2HB?=
 =?us-ascii?Q?HDn3igWvlQ69Sz8Omb6xKyfhhgcpGCwgqVMaeMvMgc1NAPU1h5vOUQMQ21mv?=
 =?us-ascii?Q?Stcl+mF9WCUPfyTj635VjZzC7SifoxlPEUdrjSr3F/3Ygihjmn2cH/wpqXpS?=
 =?us-ascii?Q?Ichzzw2QQ59Tg4ut7gDNk5eFdWCmrPs1XREEL6Cv2jlWP1Q0VqPcKu0LrqRk?=
 =?us-ascii?Q?vbgHMnHvmeWXzwOWBwF4cF3rL/JyCZOHUUZhRw+ZMZxiepXtBgBQvpz6wt0q?=
 =?us-ascii?Q?DkLMxQLKdAj2Z1TKcXx0bB5R3ya9tmF0drgQVUkiBZuDTcNKJLk6jewf/ZWu?=
 =?us-ascii?Q?VdF/aWDEdffdtLRl+m1E5s8iliShMgPQ2ilp5jTEbKHl0VYq0AaF9A+Cca+7?=
 =?us-ascii?Q?dekRaktZfWQAJXuWNed8joiU8EBYXg0i/C7ZWmJsQsDnvm/xrIse80TVhKin?=
 =?us-ascii?Q?Fnz0rwNg1SNVG4IH2lRcEl6qes6+/TnL+G2NzzOU9mbl3NSgnO66FDuhy9o0?=
 =?us-ascii?Q?z2fKRpv7OsIn3ZKmaGcDiXGIMp1yR7aMvYcKIaPqERNepvpr/i/4+YrQeFsx?=
 =?us-ascii?Q?4wnjWBOnJmW7nwSGYYpWwAaM+pv0+Iyd6t/LrxkEI1OWl28VJNBvYqBKgJg8?=
 =?us-ascii?Q?i4iFKiOinbQCHuwf9hHtn/rIspVdY8h0rH5vErK72iIh69egvXzJCqKxdYuU?=
 =?us-ascii?Q?Wvp/RPqYedxnwlXU2lApgOJVq/OZj8+Bk+o3lpXhmg6Sy0RLhK1Td7aDtqW6?=
 =?us-ascii?Q?u8h/A0P4JV4D2zDK1VWP1yx5/xAIdTrUJsDpAlgnQ+19w++2oAy8fU3ecR/x?=
 =?us-ascii?Q?/28jiAZuDzRBhKDdyDd1K4WveknAIQgnUS1wdOeBqK6HoYs6VSruFc52CMgR?=
 =?us-ascii?Q?joM/ifHc2nfnLRVbDG/opPo7sHPrLalDqkGtPtvWzkjZuv1rdHdgu6/0Esaz?=
 =?us-ascii?Q?Ly0phcYaReidToVr4vzZOVlHg15mtHmHzJDYCUFeH4WPMKNEwbww5W1GTUNh?=
 =?us-ascii?Q?ZXLZlZSX/iwdtpXOsSTa5BnSI/+4IAzL29SUoblc3F53/MX7WpT7ezCB/vTJ?=
 =?us-ascii?Q?uBaywOhPyjsgjkZKHCENNCR0RwTJ/rqe7JtRFF+ehLUyNJPRySHZVRmvbkWr?=
 =?us-ascii?Q?S5v0PMqDpZDbcWKbA3FZBK70HtdHMTvSm1dwrzvEjJ3+CLoCw04EXHJ313j4?=
 =?us-ascii?Q?r/ondixCRS5b4qGd1FJKFuzYWaMz1+1GEYwawCTzQltB3DGs6bOHxJYfNw/L?=
 =?us-ascii?Q?t5YykvWJ2q4ceJDnGHMFioVkA6vkGA22LfhU/B0RqKJgGrctyIQLdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z9W5pO88ZqQGz2FEXjjjG+jrjBukS+ZJjYI7WAonjXMZuU4mfg456nfA1Fcl?=
 =?us-ascii?Q?TT8wZvG8hyzO6yY2paxHW7/mBf5UV8ShYqpTuNVRH3To14BCSuyQeZP7Dmi1?=
 =?us-ascii?Q?Z3Uy2g5knvSKfKoVtev5Qc2lmpRPzNrhTm+VJ8Oeo7fUrl/9UAJ0+S4RtSM9?=
 =?us-ascii?Q?ALm/H1Os7oCZKX1l0eyCJj5U950YOiw2lY4Nl9dWrLp4NXf27aoKokl/GjeE?=
 =?us-ascii?Q?dtv+3q/GIoIKmeXWqktcj6daHBtFwDLsjk34XF/odQfo8gEpfD1gi8Xn3zj+?=
 =?us-ascii?Q?yAI/cqeJrgM+nvPGIE+KoK8N5HS3srr0eNrg9ztsNNPv8z4tRm3MsqqD8wkF?=
 =?us-ascii?Q?J155+A9wjgWgulwr5F/jowWrteoS7GGrYV9H5SiTMZJBf8iX87ewZcdoe7aT?=
 =?us-ascii?Q?j79EOtpuTqAL3mHvtyJUdf42gKCCXzBlk9LWFvJcfN3b9aslsNiuI0Z8tXpc?=
 =?us-ascii?Q?HLl6y7nbjxjxBK5LKHgZVvvw+ssWMd2TgVzT/LQR5NK+Az1u1OiJAhfAqPaN?=
 =?us-ascii?Q?aXOr/hrA6oMLr1EKgzOd1ows6oqsRd1+/TqX0JDGGAVZu0VqhKDEq2vWyt/C?=
 =?us-ascii?Q?20lZf0i2Uy2DetWZynUg2fpdBHakfN+vb2DKtlkBGD0ZRjjkoMcPRlxKDMRo?=
 =?us-ascii?Q?ZLfLZWywcjnjiTsWpm54XXSOiXt71RV7bw04JkFqbea3DYMH1VEi7qIemo6R?=
 =?us-ascii?Q?lKA5FJJ4JjeRTe+4cuAo7JtyMIg8MV2uKRRBFKuXY7Bd4OKGR/2kyT/NXgVI?=
 =?us-ascii?Q?u1R6SI4MBoPx7pIH0ezZGbXOOnKsFO5INwVMN2g8Joih3nuVJreDTzOXTbAx?=
 =?us-ascii?Q?2xAl+0luuo3CjEfLIdNJqwrv3Qc7vJYzMqlh8q2CTRrGe1KGR/YzTgRYd9u6?=
 =?us-ascii?Q?FnffgBM9mHEEk8IdBnK1PKrHszI6Pdcwn0kIid2B4hZhGUv0R3IrFrGY0RKG?=
 =?us-ascii?Q?v5jQeUzVsl34AkgOLKxdpb7+Myw8oSkp9D2RnnMJvyJBwoEjEyeqE6q6ZFki?=
 =?us-ascii?Q?MdqEeufwwFVkGCkJN07xTu2JQysCXHoR0HHY6BOXqbhWzCqW7RwPhboSFNW4?=
 =?us-ascii?Q?8bk1aZN/P7qiu1nUOEdtnX0N6aTcMnvKCJFxbGocQrTmGwCC2za1+OQx1zxk?=
 =?us-ascii?Q?VaW78v0Thvqbk7xGZA5L767B/r+YmLSw++qUqiVNdG+cq0Ydi0e9vQpCzhAK?=
 =?us-ascii?Q?Ng+0TDsqJAvY5B7BhelIEp7axCi2QNB2yZGg2U2ysAVu+2XrZ8Q70T4XoVIS?=
 =?us-ascii?Q?nuTcLiRhYBWyAmwk+lrExN9mL5iHJNCCsHlF+F4amyCrNK51+59kxpDBU9Tr?=
 =?us-ascii?Q?rsWaH3xy4NaavCxxubp9HaAU2BFK1lMlLJv4maWHNGD5KDVAU0g7pjaMG7HW?=
 =?us-ascii?Q?jsghNIisW+5Bj5C2gdyrnbcvv74w4QgntGjIVhm1tfzjaWDzzBzjPUXbvjBM?=
 =?us-ascii?Q?hTDxNHV8RiJym70t0sn3rF6wCc3ebnlQUOvMEZty192XRWwFOnHBF5yiALeT?=
 =?us-ascii?Q?mFUu2QvO6yUKB0892XyCMK2BuhIrhJ2Nh1Zrs+cSuZBPi4S2Fa/hdR0c68U8?=
 =?us-ascii?Q?2FT/8JFyRqk2pL0VqTrHEFVr8eaIWyRTgfGaT+t1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cbd463-1b14-4438-06e3-08dda90638e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 16:37:15.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aG7/DBH44hdBt/P31cDs26Pmvizh+0OUITB4/d38dHCLn+ztUEhe8bNdgw1oGF02Ew4RVRXQ1lCz8XJoUQJsVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10463

On Wed, Jun 11, 2025 at 11:39:28AM +0200, Wolfram Sang wrote:
> This adds a basic driver for the I3C IP found in various SoCs like
> RZ/G3S and G3E. Missing features to be added incrementally are IBI,
> HotJoin and target support. Other than that, this driver has been tested
> with I3C pure busses (2 targets) and mixed busses (2 I3C + various I2C
> targets). DAA and reading/writing to the temperature sensors worked
> reliably at different speeds.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Open questions:
>
> - RENESAS_I3C_MAX_DEVS is a constant currently. So, we could get rid of
>   the 'maxdevs' variable. I tend to keep it this way in case future
>   controllers may use a different value, then we can change it easily.

It is similar ADI version. Can you simple descript hardware behavor to show
why need RENESAS_I3C_MAX_DEVS,

after get one whole PID and set dync addr, you should have chance to get
free address to let hardware to continue DAA.

>
> - I am not exactly happy with "renesas,i3c" as the generic fallback
>   compatible. But I couldn't derive a better one from the docs.
>   Suggestions welcome.
>
> - For accessing the FIFOs, this driver uses the same code as existing
>   upstream drivers or the recenlty submitted "ADI" driver. There, the
>   question came up, if this could be a helper function?

Add common header in drivers/i3c/master/core.h implement inline helper
function

static inline i3c_writel_fifo(void __iomem *fifo, void *buff, size_t sz)
{
	...
}

static inline i3c_readl_fifo(void __iomem *fifo, void *buff, size_t sz)
{
        ...
}

>
>  MAINTAINERS                      |    7 +
>  drivers/i3c/master/Kconfig       |   10 +
>  drivers/i3c/master/Makefile      |    1 +
>  drivers/i3c/master/renesas-i3c.c | 1441 ++++++++++++++++++++++++++++++
>  4 files changed, 1459 insertions(+)
>  create mode 100644 drivers/i3c/master/renesas-i3c.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..a90daa29b48b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11458,6 +11458,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
>  F:	drivers/i3c/master/i3c-master-cdns.c
>
> +I3C DRIVER FOR RENESAS
> +M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
> +M:	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> +F:	drivers/i3c/master/renesas-i3c.c
> +
>  I3C DRIVER FOR SYNOPSYS DESIGNWARE
>  S:	Orphan
>  F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 7b30db3253af..13df2944f2ec 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -64,3 +64,13 @@ config MIPI_I3C_HCI_PCI
>
>  	  This driver can also be built as a module. If so, the module will be
>  	  called mipi-i3c-hci-pci.
> +
> +config RENESAS_I3C
> +	tristate "Renesas I3C controller driver"
> +	depends on HAS_IOMEM
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	help
> +	  Support the Renesas I3C controller as found in some RZ variants.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called renesas-i3c.
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..aac74f3e3851 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>  obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> +obj-$(CONFIG_RENESAS_I3C)		+= renesas-i3c.o
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> new file mode 100644
> index 000000000000..ff276c955d07
> --- /dev/null
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -0,0 +1,1441 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas I3C Controller driver
> + * Copyright (C) 2023-25 Renesas Electronics Corp.
> + *
> + * TODO: IBI support, HotJoin support, Target support
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/i3c/master.h>
> +#include <linux/interrupt.h>
> +#include <linux/ioport.h>
> +#include <linux/iopoll.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#define PRTS			0x00
> +#define PRTS_PRTMD		BIT(0)

#define PRTS                 0x00
#define  PRTS_PRTMD          BIT(0)

Add extra space help distinguish register and field define.

> +
> +#define BCTL			0x14
> +#define BCTL_HJACKCTL		BIT(8)
> +#define BCTL_ABT		BIT(29)
> +#define BCTL_BUSE		BIT(31)
> +
> +#define MSDVAD			0x18
> +#define MSDVAD_MDYAD(x)		(((x) & 0x3f) << 16)

Use GEN_MASK

> +#define MSDVAD_MDYADV		BIT(31)
> +
> +#define RSTCTL			0x20
> +#define RSTCTL_RI3CRST		BIT(0)
> +#define RSTCTL_INTLRST		BIT(16)
> +
> +#define INST			0x30
> +
> +#define IBINCTL			0x58
> +#define IBINCTL_NRHJCTL		BIT(0)
> +#define IBINCTL_NRMRCTL		BIT(1)
> +#define IBINCTL_NRSIRCTL	BIT(3)
> +
> +#define SVCTL			0x64
> +
> +#define REFCKCTL		0x70
> +#define REFCKCTL_IREFCKS(x)	(((x) & 0x7) << 0)
> +
> +#define STDBR			0x74
> +#define STDBR_SBRLO(cond, x)	((((x) >> (cond)) & 0xff) << 0)
> +#define STDBR_SBRHO(cond, x)	((((x) >> (cond)) & 0xff) << 8)

FIELD_GET FIELD_PREP

check other define

> +#define STDBR_SBRLP(x)		(((x) & 0x3f) << 16)
> +#define STDBR_SBRHP(x)		(((x) & 0x3f) << 24)
> +#define STDBR_DSBRPO		BIT(31)
> +
> +#define EXTBR			0x78
> +#define EXTBR_EBRLO(x)		(((x) & 0xff) << 0)
> +#define EXTBR_EBRHO(x)		(((x) & 0xff) << 8)
> +#define EXTBR_EBRLP(x)		(((x) & 0x3f) << 16)
> +#define EXTBR_EBRHP(x)		(((x) & 0x3f) << 24)
> +
> +#define BFRECDT			0x7c
> +#define BFRECDT_FRECYC(x)	(((x) & 0x1ff) << 0)
> +
> +#define BAVLCDT			0x80
> +#define BAVLCDT_AVLCYC(x)	(((x) & 0x1ff) << 0)
> +
> +#define BIDLCDT			0x84
> +#define BIDLCDT_IDLCYC(x)	(((x) & 0x3ffff) << 0)
> +
> +#define ACKCTL			0xa0
> +#define ACKCTL_ACKT		BIT(1)
> +#define ACKCTL_ACKTWP		BIT(2)
> +
> +#define SCSTRCTL		0xa4
> +#define SCSTRCTL_ACKTWE		BIT(0)
> +#define SCSTRCTL_RWE		BIT(1)
> +
> +#define SCSTLCTL		0xb0
> +
> +#define CNDCTL			0x140
> +#define CNDCTL_STCND		BIT(0)
> +#define CNDCTL_SRCND		BIT(1)
> +#define CNDCTL_SPCND		BIT(2)
> +
> +#define NCMDQP			0x150 /* Normal Command Queue */
> +#define NCMDQP_CMD_ATTR(x)	(((x) & 0x7) << 0)
> +#define NCMDQP_IMMED_XFER	0x01
> +#define NCMDQP_ADDR_ASSGN	0x02
> +#define NCMDQP_TID(x)		(((x) & 0xf) << 3)
> +#define NCMDQP_CMD(x)		(((x) & 0xff) << 7)
> +#define NCMDQP_CP		BIT(15)
> +#define NCMDQP_DEV_INDEX(x)	(((x) & 0x1f) << 16)
> +#define NCMDQP_BYTE_CNT(x)	(((x) & 0x7) << 23)
> +#define NCMDQP_DEV_COUNT(x)	(((x) & 0xf) << 26)
> +#define NCMDQP_MODE(x)		(((x) & 0x7) << 26)
> +#define NCMDQP_RNW(x)		(((x) & 0x1) << 29)
> +#define NCMDQP_ROC		BIT(30)
> +#define NCMDQP_TOC		BIT(31)
> +#define NCMDQP_DATA_LENGTH(x)	(((x) & 0xffff) << 16)
> +
> +#define NRSPQP			0x154 /* Normal Respone Queue */
> +#define NRSPQP_NO_ERROR			0
> +#define NRSPQP_ERROR_CRC		1
> +#define NRSPQP_ERROR_PARITY		2
> +#define NRSPQP_ERROR_FRAME		3
> +#define NRSPQP_ERROR_IBA_NACK		4
> +#define NRSPQP_ERROR_ADDRESS_NACK	5
> +#define NRSPQP_ERROR_OVER_UNDER_FLOW	6
> +#define NRSPQP_ERROR_TRANSF_ABORT	8
> +#define NRSPQP_ERROR_I2C_W_NACK_ERR	9
> +#define NRSPQP_ERR_STATUS(x)	(((x) & GENMASK(31, 28)) >> 28)
> +#define NRSPQP_DATA_LEN(x)	((x) & GENMASK(15, 0))
> +
> +#define NTDTBP0			0x158 /* Normal Transfer Data Buffer */
> +#define NTDTBP0_DEPTH		16
> +
> +#define NQTHCTL			0x190
> +#define NQTHCTL_CMDQTH(x)	(((x) & 0x3) << 0)
> +#define NQTHCTL_IBIDSSZ(x)	(((x) & 0xff) << 16)
> +
> +#define NTBTHCTL0		0x194
> +
> +#define NRQTHCTL		0x1c0
> +
> +#define BST			0x1d0
> +#define BST_STCNDDF		BIT(0)
> +#define BST_SPCNDDF		BIT(1)
> +#define BST_NACKDF		BIT(4)
> +#define BST_TENDF		BIT(8)
> +
> +#define BSTE			0x1d4
> +#define BSTE_STCNDDE		BIT(0)
> +#define BSTE_SPCNDDE		BIT(1)
> +#define BSTE_NACKDE		BIT(4)
> +#define BSTE_TENDE		BIT(8)
> +#define BSTE_ALE		BIT(16)
> +#define BSTE_TODE		BIT(20)
> +#define BSTE_WUCNDDE		BIT(24)
> +#define BSTE_ALL_FLAG		(BSTE_STCNDDE | BSTE_SPCNDDE |\
> +				BSTE_NACKDE | BSTE_TENDE |\
> +				BSTE_ALE | BSTE_TODE | BSTE_WUCNDDE)
> +
> +#define BIE			0x1d8
> +#define BIE_STCNDDIE		BIT(0)
> +#define BIE_SPCNDDIE		BIT(1)
> +#define BIE_NACKDIE		BIT(4)
> +#define BIE_TENDIE		BIT(8)
> +
> +#define NTST			0x1e0
> +#define NTST_TDBEF0		BIT(0)
> +#define NTST_RDBFF0		BIT(1)
> +#define NTST_CMDQEF		BIT(3)
> +#define NTST_RSPQFF		BIT(4)
> +#define NTST_TABTF		BIT(5)
> +#define NTST_TEF		BIT(9)
> +
> +#define NTSTE			0x1e4
> +#define NTSTE_TDBEE0		BIT(0)
> +#define NTSTE_RDBFE0		BIT(1)
> +#define NTSTE_IBIQEFE		BIT(2)
> +#define NTSTE_CMDQEE		BIT(3)
> +#define NTSTE_RSPQFE		BIT(4)
> +#define NTSTE_TABTE		BIT(5)
> +#define NTSTE_TEE		BIT(9)
> +#define NTSTE_RSQFE		BIT(20)
> +#define NTSTE_ALL_FLAG		(NTSTE_TDBEE0 | NTSTE_RDBFE0 |\
> +				NTSTE_IBIQEFE | NTSTE_CMDQEE |\
> +				NTSTE_RSPQFE | NTSTE_TABTE |\
> +				NTSTE_TEE | NTSTE_RSQFE)
> +
> +#define NTIE			0x1e8
> +#define NTIE_TDBEIE0		BIT(0)
> +#define NTIE_RDBFIE0		BIT(1)
> +#define NTIE_IBIQEFIE		BIT(2)
> +#define NTIE_RSPQFIE		BIT(4)
> +#define NTIE_RSQFIE		BIT(20)
> +
> +#define BCST			0x210
> +#define BCST_BFREF		BIT(0)
> +
> +#define DATBAS(x)		(0x224 + 0x8 * (x))
> +#define DATBAS_DVSTAD(x)	(((x) & 0x7f) << 0)
> +#define DATBAS_DVDYAD(x)	(((x) & 0xff) << 16)
> +
> +#define NDBSTLV0		0x398
> +#define NDBSTLV0_RDBLV(x)	(((x) >> 8) & 0xff)
> +
> +#define RENESAS_I3C_MAX_DEVS	8
> +#define I2C_INIT_MSG		-1
> +
> +/* Bus condition timing */
> +#define I3C_BUS_THIGH_MIXED_NS	40		/* 40ns */
> +#define I3C_BUS_FREE_TIME_NS	1300		/* 1.3us for Mixed Bus with I2C FM Device*/
> +#define I3C_BUS_AVAL_TIME_NS	1000		/* 1us */
> +#define I3C_BUS_IDLE_TIME_NS	200000		/* 200us */
> +
> +#define XFER_TIMEOUT		(msecs_to_jiffies(1000))
> +
> +enum i3c_internal_state {
> +	I3C_INTERNAL_STATE_DISABLED,
> +	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> +	I3C_INTERNAL_STATE_CONTROLLER_ENTDAA,
> +	I3C_INTERNAL_STATE_CONTROLLER_SETDASA,
> +	I3C_INTERNAL_STATE_CONTROLLER_WRITE,
> +	I3C_INTERNAL_STATE_CONTROLLER_READ,
> +	I3C_INTERNAL_STATE_CONTROLLER_COMMAND_WRITE,
> +	I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ,
> +};
> +
> +enum i3c_event {
> +	I3C_COMMAND_ADDRESS_ASSIGNMENT,
> +	I3C_WRITE,
> +	I3C_READ,
> +	I3C_COMMAND_WRITE,
> +	I3C_COMMAND_READ,
> +};
> +
> +struct renesas_i3c_cmd {
> +	u32 cmd0;
> +	u32 len;
> +	const void *tx_buf;
> +	u32 tx_count;
> +	void *rx_buf;
> +	u32 rx_count;
> +	u32 err;
> +	u8 rnw;
> +	/* i2c xfer */
> +	int i2c_bytes_left;
> +	int i2c_is_last;
> +	u8 *i2c_buf;
> +	const struct i2c_msg *msg;
> +};
> +
> +struct renesas_i3c_xfer {
> +	struct list_head node;
> +	struct completion comp;
> +	int ret;
> +	bool is_i2c_xfer;
> +	unsigned int ncmds;
> +	struct renesas_i3c_cmd cmds[] __counted_by(ncmds);
> +};
> +
> +struct renesas_i3c_xferqueue {
> +	struct list_head list;
> +	struct renesas_i3c_xfer *cur;
> +	/* Lock for accessing the xfer queue */
> +	spinlock_t lock;
> +};
> +
> +struct renesas_i3c {
> +	struct i3c_master_controller base;
> +	enum i3c_internal_state internal_state;
> +	u16 maxdevs;
> +	u32 free_pos;
> +	u32 i2c_STDBR;
> +	u32 i3c_STDBR;
> +	u8 addrs[RENESAS_I3C_MAX_DEVS];
> +	struct renesas_i3c_xferqueue xferqueue;
> +	void __iomem *regs;
> +	struct clk *tclk;
> +};
> +
> +struct renesas_i3c_i2c_dev_data {
> +	u8 index;
> +};
> +
> +struct renesas_i3c_irq_desc {
> +	char *name;
> +	irq_handler_t isr;
> +	char *desc;
> +};
> +
> +struct renesas_i3c_config {
> +	unsigned int has_pclkrw:1;
> +};
> +
> +static inline void i3c_reg_update(u32 mask, u32 val, void __iomem *reg)
> +{
> +	u32 data = readl(reg);
> +
> +	data &= ~mask;
> +	data |= (val & mask);
> +	writel(data, reg);
> +}

can you move reg to first argument to align below help function?

> +
> +static inline u32 i3c_reg_read(void __iomem *base, u32 reg)
> +{
> +	return readl(base + reg);
> +}
> +
> +static inline void i3c_reg_write(void __iomem *base, u32 reg, u32 val)
> +{
> +	writel(val, base + reg);
> +}
> +
> +static void i3c_reg_set_bit(void __iomem *base, u32 reg, u32 val)
> +{
> +	i3c_reg_update(val, val, base + reg);
> +}
> +
> +static void i3c_reg_clear_bit(void __iomem *base, u32 reg, u32 val)
> +{
> +	i3c_reg_update(val, 0, base + reg);
> +}
> +
> +static void i3c_reg_update_bit(void __iomem *base, u32 reg,
> +			       u32 mask, u32 val)
> +{
> +	i3c_reg_update(mask, val, base + reg);
> +}
> +
> +static inline struct renesas_i3c *
> +to_renesas_i3c(struct i3c_master_controller *master)
> +{
> +	return container_of(master, struct renesas_i3c, base);
> +}
> +
> +static inline u32 datbas_dvdyad_with_parity(u8 addr)
> +{
> +	return DATBAS_DVDYAD(addr | (parity8(addr) ? 0 : BIT(7)));
> +}
> +
> +static int renesas_i3c_get_free_pos(struct renesas_i3c *i3c)
> +{
> +	if (!(i3c->free_pos & GENMASK(i3c->maxdevs - 1, 0)))
> +		return -ENOSPC;
> +
> +	return ffs(i3c->free_pos) - 1;
> +}
> +
> +static int renesas_i3c_get_addr_pos(struct renesas_i3c *i3c, u8 addr)
> +{
> +	int pos;
> +
> +	for (pos = 0; pos < i3c->maxdevs; pos++) {
> +		if (addr == i3c->addrs[pos])
> +			return pos;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static struct renesas_i3c_xfer *
> +renesas_i3c_alloc_xfer(struct renesas_i3c *i3c, unsigned int ncmds)
> +{
> +	struct renesas_i3c_xfer *xfer;
> +
> +	xfer = kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> +	if (!xfer)
> +		return NULL;
> +
> +	INIT_LIST_HEAD(&xfer->node);
> +	xfer->ncmds = ncmds;
> +	xfer->ret = -ETIMEDOUT;
> +
> +	return xfer;
> +}
> +
> +static void renesas_i3c_read_from_rx_fifo(struct renesas_i3c *i3c,
> +						 u8 *data, int nbytes)
> +{
> +	readsl(i3c->regs + NTDTBP0, data, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		readsl(i3c->regs + NTDTBP0, &tmp, 1);
> +		memcpy(data + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
> +}
> +
> +static void renesas_i3c_write_to_tx_fifo(struct renesas_i3c *i3c,
> +						const u32 *data, int nbytes)
> +{
> +	writesl(i3c->regs + NTDTBP0, data, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp = 0;
> +
> +		memcpy(&tmp, data + (nbytes & ~3), nbytes & 3);
> +		writesl(i3c->regs + NTDTBP0, &tmp, 1);
> +	}
> +}
> +
> +static void renesas_i3c_start_xfer_locked(struct renesas_i3c *i3c)
> +{
> +	struct renesas_i3c_xfer *xfer = i3c->xferqueue.cur;
> +	struct renesas_i3c_cmd *cmd;
> +	u32 cmd1;
> +
> +	if (!xfer)
> +		return;
> +
> +	cmd = xfer->cmds;
> +
> +	switch (i3c->internal_state) {
> +	case I3C_INTERNAL_STATE_CONTROLLER_ENTDAA:
> +	case I3C_INTERNAL_STATE_CONTROLLER_SETDASA:
> +		i3c_reg_set_bit(i3c->regs, NTIE, NTIE_RSPQFIE);
> +		i3c_reg_write(i3c->regs, NCMDQP, cmd->cmd0);
> +		i3c_reg_write(i3c->regs, NCMDQP, 0);
> +		break;
> +	case I3C_INTERNAL_STATE_CONTROLLER_WRITE:
> +	case I3C_INTERNAL_STATE_CONTROLLER_COMMAND_WRITE:
> +		i3c_reg_set_bit(i3c->regs, NTIE, NTIE_RSPQFIE);
> +		if (cmd->len <= 4) {
> +			cmd->cmd0 |= NCMDQP_CMD_ATTR(NCMDQP_IMMED_XFER);
> +			cmd->cmd0 |= NCMDQP_BYTE_CNT(cmd->len);
> +			cmd->tx_count = cmd->len;
> +			cmd1 = cmd->len == 0 ? 0 : *(u32 *)cmd->tx_buf;
> +		} else {
> +			cmd1 = NCMDQP_DATA_LENGTH(cmd->len);
> +		}
> +		i3c_reg_write(i3c->regs, NCMDQP, cmd->cmd0);
> +		i3c_reg_write(i3c->regs, NCMDQP, cmd1);
> +		break;
> +	case I3C_INTERNAL_STATE_CONTROLLER_READ:
> +	case I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ:
> +		i3c_reg_set_bit(i3c->regs, NTIE, NTIE_RDBFIE0);
> +		cmd1 = NCMDQP_DATA_LENGTH(cmd->len);
> +		i3c_reg_write(i3c->regs, NCMDQP, cmd->cmd0);
> +		i3c_reg_write(i3c->regs, NCMDQP, cmd1);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/* Clear the command queue empty flag */
> +	i3c_reg_clear_bit(i3c->regs, NTST, NTST_CMDQEF);
> +
> +	if (cmd->len > 4 && i3c->internal_state == I3C_INTERNAL_STATE_CONTROLLER_COMMAND_WRITE) {
> +		renesas_i3c_write_to_tx_fifo(i3c, cmd->tx_buf, cmd->len);
> +		/*
> +		 * If there is still data remaining in the transfer
> +		 * then it will be written in the Write Buffer Empty IRQ.
> +		 */
> +		if (cmd->len > NTDTBP0_DEPTH * sizeof(u32))
> +			/* Enable the Write Buffer Empty IRQ. */
> +			i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> +	}
> +}
> +
> +static void renesas_i3c_dequeue_xfer_locked(struct renesas_i3c *i3c,
> +						   struct renesas_i3c_xfer *xfer)
> +{
> +	if (i3c->xferqueue.cur == xfer)
> +		i3c->xferqueue.cur = NULL;
> +	else
> +		list_del_init(&xfer->node);
> +}
> +
> +static void renesas_i3c_dequeue_xfer(struct renesas_i3c *i3c,
> +					    struct renesas_i3c_xfer *xfer)
> +{
> +	scoped_guard(spinlock_irqsave, &i3c->xferqueue.lock)
> +		renesas_i3c_dequeue_xfer_locked(i3c, xfer);
> +}
> +
> +static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c,
> +					    struct renesas_i3c_xfer *xfer)
> +{
> +	reinit_completion(&xfer->comp);
> +	scoped_guard(spinlock_irqsave, &i3c->xferqueue.lock) {
> +		if (i3c->xferqueue.cur) {
> +			list_add_tail(&xfer->node, &i3c->xferqueue.list);
> +		} else {
> +			i3c->xferqueue.cur = xfer;
> +			if (!xfer->is_i2c_xfer)
> +				renesas_i3c_start_xfer_locked(i3c);
> +		}
> +	}
> +}
> +
> +static void renesas_i3c_set_prts(struct renesas_i3c *i3c, u32 val)
> +{
> +	/* Required sequence according to tnrza0140ae */
> +	i3c_reg_set_bit(i3c->regs, RSTCTL, RSTCTL_INTLRST);
> +	i3c_reg_write(i3c->regs, PRTS, val);
> +	i3c_reg_clear_bit(i3c->regs, RSTCTL, RSTCTL_INTLRST);
> +}
> +
> +static void renesas_i3c_bus_enable(struct i3c_master_controller *m, bool i3c_mode)
> +{
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +
> +	/* Setup either I3C or I2C protocol */
> +	if (i3c_mode) {
> +		renesas_i3c_set_prts(i3c, 0);
> +		/* Revisit: INCBA handling, especially after I2C transfers */
> +		i3c_reg_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> +		i3c_reg_set_bit(i3c->regs, MSDVAD, MSDVAD_MDYADV);
> +		i3c_reg_write(i3c->regs, STDBR, i3c->i3c_STDBR);
> +	} else {
> +		renesas_i3c_set_prts(i3c, PRTS_PRTMD);
> +		i3c_reg_write(i3c->regs, STDBR, i3c->i2c_STDBR);
> +	}
> +
> +	/* Enable I3C bus */
> +	i3c_reg_set_bit(i3c->regs, BCTL, BCTL_BUSE);
> +}
> +
> +static int renesas_i3c_reset(struct renesas_i3c *i3c)
> +{
> +	u32 val;
> +
> +	i3c_reg_write(i3c->regs, BCTL, 0);
> +	i3c_reg_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);
> +
> +	/* Wait for reset completion  */
> +	return readl_relaxed_poll_timeout(i3c->regs + RSTCTL, val,
> +					  !(val & RSTCTL_RI3CRST), 0, 1000);
> +}
> +
> +static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> +{
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	struct i3c_device_info info = {};
> +	struct i2c_timings t;
> +	unsigned long rate;
> +	u32 val;
> +	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
> +	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> +	int ret;
> +	bool double_SBR;
> +
> +	rate = clk_get_rate(i3c->tclk);
> +	if (!rate)
> +		return -EINVAL;
> +
> +	ret = renesas_i3c_reset(i3c);
> +	if (ret)
> +		return ret;
> +
> +	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
> +	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
> +
> +	i2c_parse_fw_timings(&m->dev, &t, true);
> +
> +	for (cks = 0; cks < 7; cks++) {
> +		/* SCL low-period calculation in Open-drain mode */
> +		od_low_ticks = ((i2c_total_ticks * 6) / 10);
> +
> +		/* SCL clock calculation in Push-Pull mode */
> +		if (bus->mode == I3C_BUS_MODE_PURE)
> +			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
> +		else
> +			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_NS,
> +						     1000000000 / rate);
> +		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
> +
> +		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
> +			break;
> +
> +		i2c_total_ticks /= 2;
> +		i3c_total_ticks /= 2;
> +		rate /= 2;
> +	}
> +
> +	/* SCL clock period calculation in Open-drain mode */
> +	if ((od_low_ticks / 2) > 0xFF || pp_low_ticks > 0x3F) {
> +		dev_err(&m->dev, "invalid speed (i2c-scl = %lu Hz, i3c-scl = %lu Hz). Too slow.\n",
> +			(unsigned long)bus->scl_rate.i2c, (unsigned long)bus->scl_rate.i3c);
> +		ret = -EINVAL;
> +		return ret;
> +	}
> +
> +	/* SCL high-period calculation in Open-drain mode */
> +	od_high_ticks = i2c_total_ticks - od_low_ticks;
> +
> +	/* Standard Bit Rate setting */
> +	double_SBR = od_low_ticks > 0xFF ? true : false;
> +	i3c->i3c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
> +			STDBR_SBRLO(double_SBR, od_low_ticks) |
> +			STDBR_SBRHO(double_SBR, od_high_ticks) |
> +			STDBR_SBRLP(pp_low_ticks) |
> +			STDBR_SBRHP(pp_high_ticks);
> +
> +	od_low_ticks -= t.scl_fall_ns / (1000000000 / rate) + 1;
> +	od_high_ticks -= t.scl_rise_ns / (1000000000 / rate) + 1;
> +	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
> +			STDBR_SBRLO(double_SBR, od_low_ticks) |
> +			STDBR_SBRHO(double_SBR, od_high_ticks) |
> +			STDBR_SBRLP(pp_low_ticks) |
> +			STDBR_SBRHP(pp_high_ticks);
> +	i3c_reg_write(i3c->regs, STDBR, i3c->i3c_STDBR);
> +
> +	/* Extended Bit Rate setting */
> +	i3c_reg_write(i3c->regs, EXTBR, EXTBR_EBRLO(od_low_ticks) |
> +					   EXTBR_EBRHO(od_high_ticks) |
> +					   EXTBR_EBRLP(pp_low_ticks) |
> +					   EXTBR_EBRHP(pp_high_ticks));
> +
> +	i3c_reg_write(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +
> +	/* Disable Slave Mode */
> +	i3c_reg_write(i3c->regs, SVCTL, 0);
> +
> +	/* Initialize Queue/Buffer threshold */
> +	i3c_reg_write(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> +					     NQTHCTL_CMDQTH(1));
> +
> +	/* The only supported configuration is two entries*/
> +	i3c_reg_write(i3c->regs, NTBTHCTL0, 0);
> +	/* Interrupt when there is one entry in the queue */
> +	i3c_reg_write(i3c->regs, NRQTHCTL, 0);
> +
> +	/* Enable all Bus/Transfer Status Flags */
> +	i3c_reg_write(i3c->regs, BSTE, BSTE_ALL_FLAG);
> +	i3c_reg_write(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> +
> +	/* Interrupt enable settings */
> +	i3c_reg_write(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> +	i3c_reg_write(i3c->regs, NTIE, NTIE_RSQFIE |
> +					  NTIE_IBIQEFIE | NTIE_RDBFIE0);
> +
> +	/* Clear Status register */
> +	i3c_reg_write(i3c->regs, NTST, 0);
> +	i3c_reg_write(i3c->regs, INST, 0);
> +	i3c_reg_write(i3c->regs, BST, 0);
> +
> +	/* Hot-Join Acknowlege setting. */
> +	i3c_reg_update_bit(i3c->regs, BCTL, BCTL_HJACKCTL, BCTL_HJACKCTL);
> +
> +	i3c_reg_write(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> +					     IBINCTL_NRSIRCTL);
> +
> +	i3c_reg_write(i3c->regs, SCSTLCTL, 0);
> +	i3c_reg_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> +
> +	/* Bus condition timing */
> +	val = DIV_ROUND_UP(I3C_BUS_FREE_TIME_NS, 1000000000 / rate);
> +	i3c_reg_write(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> +
> +	val = DIV_ROUND_UP(I3C_BUS_AVAL_TIME_NS, 1000000000 / rate);
> +	i3c_reg_write(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> +
> +	val = DIV_ROUND_UP(I3C_BUS_IDLE_TIME_NS, 1000000000 / rate);
> +	i3c_reg_write(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> +
> +	ret = i3c_master_get_free_addr(m, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	i3c_reg_write(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> +
> +	memset(&info, 0, sizeof(info));
> +	info.dyn_addr = ret;
> +	return i3c_master_set_info(&i3c->base, &info);
> +}
> +
> +static void renesas_i3c_bus_cleanup(struct i3c_master_controller *m)
> +{
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	u32 val;
> +
> +	i3c_reg_write(i3c->regs, BCTL, 0);
> +	i3c_reg_update_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST, RSTCTL_RI3CRST);
> +	/* Wait for reset completion  */
> +	readl_relaxed_poll_timeout(i3c->regs + RSTCTL, val,
> +				   !(val & RSTCTL_RI3CRST), 0, 1000);
> +}
> +
> +static int renesas_i3c_daa(struct i3c_master_controller *m)
> +{
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct renesas_i3c_xfer *xfer;
> +	struct renesas_i3c_cmd *cmd;
> +	u32 olddevs, newdevs;
> +	u8 last_addr = 0, pos;
> +	int ret;
> +
> +	/* Enable I3C bus. */
> +	renesas_i3c_bus_enable(m, true);
> +
> +	olddevs = ~(i3c->free_pos);
> +	i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_ENTDAA;
> +
> +	/* Setting DATBASn registers for target devices. */
> +	for (pos = 0; pos < i3c->maxdevs; pos++) {
> +		if (olddevs & BIT(pos))
> +			continue;
> +
> +		ret = i3c_master_get_free_addr(m, last_addr + 1);
> +		if (ret < 0)
> +			return -ENOSPC;
> +
> +		i3c->addrs[pos] = ret;
> +		last_addr = ret;
> +
> +		i3c_reg_write(i3c->regs, DATBAS(pos), datbas_dvdyad_with_parity(ret));
> +	}
> +
> +	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	init_completion(&xfer->comp);
> +	cmd = xfer->cmds;
> +	cmd->rx_count = 0;
> +
> +	ret = renesas_i3c_get_free_pos(i3c);
> +	if (ret < 0)
> +		goto out;
> +
> +	/*
> +	 * Setup the command descriptor to start the ENTDAA command
> +	 * and starting at the selected device index.
> +	 */
> +	cmd->cmd0 = NCMDQP_CMD_ATTR(NCMDQP_ADDR_ASSGN) | NCMDQP_ROC |
> +		    NCMDQP_TID(I3C_COMMAND_ADDRESS_ASSIGNMENT) |
> +		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
> +		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
> +
> +	renesas_i3c_enqueue_xfer(i3c, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> +		renesas_i3c_dequeue_xfer(i3c, xfer);
> +
> +	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
> +	newdevs &= ~olddevs;
> +
> +	for (pos = 0; pos < i3c->maxdevs; pos++) {
> +		if (newdevs & BIT(pos))
> +			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
> +	}
> +
> +out:
> +	kfree(xfer);

you can __free(kfree) xfer = NULL at declear to avoid this goto branch.

> +	return ret < 0 ? ret : 0;
> +}
> +
> +static bool renesas_i3c_supports_ccc_cmd(struct i3c_master_controller *m,
> +						const struct i3c_ccc_cmd *cmd)
> +{
> +	if (cmd->ndests > 1)
> +		return false;
> +
> +	switch (cmd->id) {
> +	case I3C_CCC_ENEC(true):
> +	case I3C_CCC_ENEC(false):
> +	case I3C_CCC_DISEC(true):
> +	case I3C_CCC_DISEC(false):
> +	case I3C_CCC_ENTAS(0, true):
> +	case I3C_CCC_ENTAS(0, false):
> +	case I3C_CCC_RSTDAA(true):
> +	case I3C_CCC_RSTDAA(false):
> +	case I3C_CCC_ENTDAA:
> +	case I3C_CCC_SETMWL(true):
> +	case I3C_CCC_SETMWL(false):
> +	case I3C_CCC_SETMRL(true):
> +	case I3C_CCC_SETMRL(false):
> +	case I3C_CCC_ENTHDR(0):
> +	case I3C_CCC_SETDASA:
> +	case I3C_CCC_SETNEWDA:
> +	case I3C_CCC_GETMWL:
> +	case I3C_CCC_GETMRL:
> +	case I3C_CCC_GETPID:
> +	case I3C_CCC_GETBCR:
> +	case I3C_CCC_GETDCR:
> +	case I3C_CCC_GETSTATUS:
> +	case I3C_CCC_GETMXDS:
> +	case I3C_CCC_GETHDRCAP:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
> +					   struct i3c_ccc_cmd *ccc)
> +{
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct renesas_i3c_xfer *xfer;
> +	struct renesas_i3c_cmd *cmd;
> +	int ret, pos = 0;
> +
> +	if (ccc->id & I3C_CCC_DIRECT) {
> +		pos = renesas_i3c_get_addr_pos(i3c, ccc->dests[0].addr);
> +		if (pos < 0)
> +			return pos;
> +	}
> +
> +	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	renesas_i3c_bus_enable(m, true);
> +
> +	init_completion(&xfer->comp);
> +	cmd = xfer->cmds;
> +	cmd->rnw = ccc->rnw;
> +	cmd->cmd0 = 0;
> +
> +	/* Calculate the command descriptor. */
> +	switch (ccc->id) {
> +	case I3C_CCC_SETDASA:
> +		i3c_reg_write(i3c->regs, DATBAS(pos),
> +			DATBAS_DVSTAD(ccc->dests[0].addr) |
> +			DATBAS_DVDYAD(*(u8 *)ccc->dests[0].payload.data >> 1));
> +		cmd->cmd0 = NCMDQP_CMD_ATTR(NCMDQP_ADDR_ASSGN) | NCMDQP_ROC |
> +			NCMDQP_TID(I3C_COMMAND_ADDRESS_ASSIGNMENT) |
> +			NCMDQP_CMD(I3C_CCC_SETDASA) | NCMDQP_DEV_INDEX(pos) |
> +			NCMDQP_DEV_COUNT(0) | NCMDQP_TOC;
> +		i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_SETDASA;
> +		break;
> +	default:
> +		/* Calculate the command descriptor. */
> +		cmd->cmd0 = NCMDQP_TID(I3C_COMMAND_WRITE) | NCMDQP_MODE(0) |
> +				NCMDQP_RNW(ccc->rnw) | NCMDQP_CMD(ccc->id) |
> +				NCMDQP_ROC | NCMDQP_TOC | NCMDQP_CP |
> +				NCMDQP_DEV_INDEX(pos);
> +
> +		if (ccc->rnw) {
> +			cmd->rx_buf = ccc->dests[0].payload.data;
> +			cmd->len = ccc->dests[0].payload.len;
> +			cmd->rx_count = 0;
> +			i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ;
> +		} else {
> +			cmd->tx_buf = ccc->dests[0].payload.data;
> +			cmd->len = ccc->dests[0].payload.len;
> +			cmd->tx_count = 0;
> +			i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_COMMAND_WRITE;
> +		}
> +	}
> +
> +	renesas_i3c_enqueue_xfer(i3c, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> +		renesas_i3c_dequeue_xfer(i3c, xfer);
> +
> +	ret = xfer->ret;
> +	if (ret)
> +		ccc->err = I3C_ERROR_M2;
> +
> +	kfree(xfer);
> +
> +	return ret;
> +}
> +
> +static int renesas_i3c_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> +					 int i3c_nxfers)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	struct renesas_i3c_xfer *xfer;
> +	int i;
> +
> +	/* Enable I3C bus. */
> +	renesas_i3c_bus_enable(m, true);
> +
> +	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	init_completion(&xfer->comp);
> +
> +	for (i = 0; i < i3c_nxfers; i++) {
> +		struct renesas_i3c_cmd *cmd = xfer->cmds;
> +
> +		/* Calculate the Transfer Command Descriptor */
> +		cmd->rnw = i3c_xfers[i].rnw;
> +		cmd->cmd0 = NCMDQP_DEV_INDEX(data->index) | NCMDQP_MODE(0) |
> +			    NCMDQP_RNW(cmd->rnw) | NCMDQP_ROC | NCMDQP_TOC;
> +
> +		if (i3c_xfers[i].rnw) {
> +			cmd->rx_count = 0;
> +			cmd->cmd0 |= NCMDQP_TID(I3C_READ);
> +			cmd->rx_buf = i3c_xfers[i].data.in;
> +			cmd->len = i3c_xfers[i].len;
> +			i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_READ;
> +		} else {
> +			cmd->tx_count = 0;
> +			cmd->cmd0 |= NCMDQP_TID(I3C_WRITE);
> +			cmd->tx_buf = i3c_xfers[i].data.out;
> +			cmd->len = i3c_xfers[i].len;
> +			i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_WRITE;
> +		}
> +
> +		if (!i3c_xfers[i].rnw && i3c_xfers[i].len > 4) {

Only pre fill fifo when len >4? what happen if only write 1 byte?

> +			renesas_i3c_write_to_tx_fifo(i3c, cmd->tx_buf, cmd->len);
> +			if (cmd->len > NTDTBP0_DEPTH * sizeof(u32))
> +				i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> +		}
> +
> +		renesas_i3c_enqueue_xfer(i3c, xfer);
> +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> +			renesas_i3c_dequeue_xfer(i3c, xfer);

This may common problem, I3C spec have 100us timeout, target side may
timeout when driver wait for irq. So target side treat "repeat start" as
"start" and issue address arbitration.

> +	}
> +
> +	return 0;
> +}
> +
> +static int renesas_i3c_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct renesas_i3c_i2c_dev_data *data;
> +	int pos;
> +
> +	pos = renesas_i3c_get_free_pos(i3c);
> +	if (pos < 0)
> +		return pos;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->index = pos;
> +	i3c->addrs[pos] = dev->info.dyn_addr ? : dev->info.static_addr;

Are there extension of "?" operator in C ? I remember

dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;

> +	i3c->free_pos &= ~BIT(pos);
> +
> +	i3c_reg_write(i3c->regs, DATBAS(pos), DATBAS_DVSTAD(dev->info.static_addr) |
> +				    datbas_dvdyad_with_parity(i3c->addrs[pos]));
> +	i3c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}
> +
> +static int renesas_i3c_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +					       u8 old_dyn_addr)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	i3c->addrs[data->index] = dev->info.dyn_addr ? dev->info.dyn_addr :
> +							dev->info.static_addr;
> +
> +	return 0;
> +}
> +
> +static void renesas_i3c_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	i3c->addrs[data->index] = 0;
> +	i3c->free_pos |= BIT(data->index);
> +	kfree(data);
> +}
> +
> +static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
> +					struct i2c_msg *i2c_xfers,
> +					int i2c_nxfers)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct renesas_i3c_xfer *xfer;
> +	struct renesas_i3c_cmd *cmd;
> +	u8 start_bit = CNDCTL_STCND;
> +	int ret, i;
> +
> +	if (!i2c_nxfers)
> +		return 0;
> +
> +	renesas_i3c_bus_enable(m, false);
> +
> +	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	init_completion(&xfer->comp);
> +	xfer->is_i2c_xfer = true;
> +	cmd = xfer->cmds;
> +
> +	if (!(i3c_reg_read(i3c->regs, BCST) & BCST_BFREF)) {
> +		cmd->err = -EBUSY;
> +		goto out;
> +	}
> +
> +	i3c_reg_write(i3c->regs, BST, 0);
> +
> +	renesas_i3c_enqueue_xfer(i3c, xfer);
> +
> +	for (i = 0; i < i2c_nxfers; i++) {
> +		cmd->i2c_bytes_left = I2C_INIT_MSG;
> +		cmd->i2c_buf = i2c_xfers[i].buf;
> +		cmd->msg = &i2c_xfers[i];
> +		cmd->i2c_is_last = (i == i2c_nxfers - 1);
> +
> +		i3c_reg_set_bit(i3c->regs, BIE, BIE_NACKDIE);
> +		i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> +		i3c_reg_set_bit(i3c->regs, BIE, BIE_STCNDDIE);
> +
> +		/* Issue Start condition */
> +		i3c_reg_set_bit(i3c->regs, CNDCTL, start_bit);
> +
> +		i3c_reg_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
> +
> +		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
> +
> +		if (cmd->err)
> +			break;
> +
> +		start_bit = CNDCTL_SRCND;
> +	}
> +out:
> +	renesas_i3c_dequeue_xfer(i3c, xfer);
> +	ret = cmd->err;
> +	kfree(xfer);
> +	return ret ?: 0;
> +}
> +
> +static int renesas_i3c_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +	struct renesas_i3c_i2c_dev_data *data;
> +	int pos;
> +
> +	pos = renesas_i3c_get_free_pos(i3c);
> +	if (pos < 0)
> +		return pos;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->index = pos;
> +	i3c->addrs[pos] = dev->addr;
> +	i3c->free_pos &= ~BIT(pos);
> +	i2c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}
> +
> +static void renesas_i3c_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct renesas_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> +
> +	i2c_dev_set_master_data(dev, NULL);
> +	i3c->addrs[data->index] = 0;
> +	i3c->free_pos |= BIT(data->index);
> +	kfree(data);
> +}
> +
> +static irqreturn_t i3c_tx_isr(int irq, void *data)
> +{
> +	struct renesas_i3c *i3c = data;
> +	struct renesas_i3c_xfer *xfer = i3c->xferqueue.cur;
> +	struct renesas_i3c_cmd *cmd = xfer->cmds;
> +	u8 val;
> +
> +	if (xfer->is_i2c_xfer) {
> +		if (!cmd->i2c_bytes_left)
> +			return IRQ_NONE;
> +
> +		if (cmd->i2c_bytes_left != I2C_INIT_MSG) {
> +			val = *cmd->i2c_buf;
> +			cmd->i2c_buf++;
> +			cmd->i2c_bytes_left--;
> +			i3c_reg_write(i3c->regs, NTDTBP0, val);
> +		}
> +
> +		if (cmd->i2c_bytes_left == 0) {
> +			i3c_reg_clear_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> +			i3c_reg_set_bit(i3c->regs, BIE, BIE_TENDIE);
> +		}
> +
> +		/* Clear the Transmit Buffer Empty status flag. */
> +		i3c_reg_clear_bit(i3c->regs, NTST, NTST_TDBEF0);
> +	} else {
> +		renesas_i3c_write_to_tx_fifo(i3c, cmd->tx_buf, cmd->len);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t i3c_resp_isr(int irq, void *data)
> +{
> +	struct renesas_i3c *i3c = data;
> +	struct renesas_i3c_xfer *xfer = i3c->xferqueue.cur;
> +	struct renesas_i3c_cmd *cmd = xfer->cmds;
> +	u32 resp_descriptor = i3c_reg_read(i3c->regs, NRSPQP);
> +	u32 bytes_remaining = 0;
> +	u32 ntst, data_len;
> +	int ret = 0;
> +
> +	/* Clear the Respone Queue Full status flag*/
> +	i3c_reg_clear_bit(i3c->regs, NTST, NTST_RSPQFF);
> +
> +	data_len = NRSPQP_DATA_LEN(resp_descriptor);
> +
> +	switch (i3c->internal_state) {
> +	case I3C_INTERNAL_STATE_CONTROLLER_ENTDAA:
> +		cmd->rx_count = data_len;
> +		break;
> +	case I3C_INTERNAL_STATE_CONTROLLER_WRITE:
> +	case I3C_INTERNAL_STATE_CONTROLLER_COMMAND_WRITE:
> +		/* Disable the transmit IRQ if it hasn't been disabled already. */
> +		i3c_reg_clear_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> +		break;
> +	case I3C_INTERNAL_STATE_CONTROLLER_READ:
> +	case I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ:
> +		if (NDBSTLV0_RDBLV(i3c_reg_read(i3c->regs, NDBSTLV0)) && !cmd->err)
> +			bytes_remaining = data_len - cmd->rx_count;
> +
> +		renesas_i3c_read_from_rx_fifo(i3c, cmd->rx_buf, bytes_remaining);
> +		i3c_reg_clear_bit(i3c->regs, NTIE, NTIE_RDBFIE0);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	switch (NRSPQP_ERR_STATUS(resp_descriptor)) {
> +	case NRSPQP_NO_ERROR:
> +		break;
> +	case NRSPQP_ERROR_PARITY:
> +	case NRSPQP_ERROR_IBA_NACK:
> +	case NRSPQP_ERROR_TRANSF_ABORT:
> +	case NRSPQP_ERROR_CRC:
> +	case NRSPQP_ERROR_FRAME:
> +		ret = -EIO;
> +		break;
> +	case NRSPQP_ERROR_OVER_UNDER_FLOW:
> +		ret = -ENOSPC;
> +		break;
> +	case NRSPQP_ERROR_I2C_W_NACK_ERR:
> +	case NRSPQP_ERROR_ADDRESS_NACK:
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	ntst = i3c_reg_read(i3c->regs, NTST);
> +
> +	/*
> +	 * If the transfer was aborted, then the abort flag must be cleared
> +	 * before notifying the application that a transfer has completed.
> +	 */
> +	if (ntst & NTST_TABTF)
> +		i3c_reg_clear_bit(i3c->regs, BCTL, BCTL_ABT);
> +
> +	/* Clear error status flags. */
> +	i3c_reg_clear_bit(i3c->regs, NTST, NTST_TEF | NTST_TABTF);
> +
> +	xfer->ret = ret;
> +	complete(&xfer->comp);
> +
> +	xfer = list_first_entry_or_null(&i3c->xferqueue.list,
> +					struct renesas_i3c_xfer, node);
> +	if (xfer)
> +		list_del_init(&xfer->node);
> +
> +	i3c->xferqueue.cur = xfer;
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t i3c_tend_isr(int irq, void *data)
> +{
> +	struct renesas_i3c *i3c = data;
> +	struct renesas_i3c_xfer *xfer = i3c->xferqueue.cur;
> +	struct renesas_i3c_cmd *cmd = xfer->cmds;
> +
> +	if (xfer->is_i2c_xfer) {
> +		if (i3c_reg_read(i3c->regs, BST) & BST_NACKDF) {
> +			/* We got a NACKIE */
> +			i3c_reg_read(i3c->regs, NTDTBP0); /* dummy read */
> +			i3c_reg_clear_bit(i3c->regs, BST, BST_NACKDF);
> +			cmd->err = -ENXIO;
> +		} else if (cmd->i2c_bytes_left) {
> +			i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> +			return IRQ_NONE;
> +		}
> +
> +		if (cmd->i2c_is_last || cmd->err) {
> +			i3c_reg_clear_bit(i3c->regs, BIE, BIE_TENDIE);
> +			i3c_reg_set_bit(i3c->regs, BIE, BIE_SPCNDDIE);
> +			i3c_reg_set_bit(i3c->regs, CNDCTL, CNDCTL_SPCND);
> +		} else {
> +			/* Transfer is complete, but do not send STOP */
> +			i3c_reg_clear_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
> +			i3c_reg_clear_bit(i3c->regs, BIE, BIE_TENDIE);
> +			xfer->ret = 0;
> +			complete(&xfer->comp);
> +		}
> +	}
> +
> +	/* Clear the Transmit Buffer Empty status flag. */
> +	i3c_reg_clear_bit(i3c->regs, BST, BST_TENDF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t i3c_rx_isr(int irq, void *data)
> +{
> +	struct renesas_i3c *i3c = data;
> +	struct renesas_i3c_xfer *xfer = i3c->xferqueue.cur;
> +	struct renesas_i3c_cmd *cmd = xfer->cmds;
> +	int read_bytes;
> +
> +	if (xfer->is_i2c_xfer) {
> +		if (!cmd->i2c_bytes_left)
> +			return IRQ_NONE;
> +
> +		if (cmd->i2c_bytes_left == I2C_INIT_MSG) {
> +			cmd->i2c_bytes_left = cmd->msg->len;
> +			i3c_reg_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_RWE);
> +			i3c_reg_read(i3c->regs, NTDTBP0); /* dummy read */
> +			if (cmd->i2c_bytes_left == 1)
> +				i3c_reg_write(i3c->regs, ACKCTL, ACKCTL_ACKT | ACKCTL_ACKTWP);
> +			return IRQ_HANDLED;
> +		}
> +
> +		if (cmd->i2c_bytes_left == 1) {
> +			/* STOP must come before we set ACKCTL! */
> +			if (cmd->i2c_is_last) {
> +				i3c_reg_set_bit(i3c->regs, BIE, BIE_SPCNDDIE);
> +				i3c_reg_clear_bit(i3c->regs, BST, BST_SPCNDDF);
> +				i3c_reg_set_bit(i3c->regs, CNDCTL, CNDCTL_SPCND);
> +			}
> +			i3c_reg_write(i3c->regs, ACKCTL, ACKCTL_ACKT | ACKCTL_ACKTWP);
> +		} else {
> +			i3c_reg_write(i3c->regs, ACKCTL, ACKCTL_ACKTWP);
> +		}
> +
> +		/* Reading acks the RIE interrupt */
> +		*cmd->i2c_buf = i3c_reg_read(i3c->regs, NTDTBP0);
> +		cmd->i2c_buf++;
> +		cmd->i2c_bytes_left--;
> +	} else {
> +		read_bytes = NDBSTLV0_RDBLV(i3c_reg_read(i3c->regs, NDBSTLV0)) * sizeof(u32);
> +
> +		if (i3c->internal_state == I3C_INTERNAL_STATE_CONTROLLER_ENTDAA &&
> +							read_bytes == 8) {
> +			i3c_reg_set_bit(i3c->regs, NTIE, NTIE_RSPQFIE);
> +			/* Read PID, BCR, DCR data */
> +			i3c_reg_read(i3c->regs, NTDTBP0);
> +			i3c_reg_read(i3c->regs, NTDTBP0);
> +			cmd->rx_count++;
> +		} else {
> +			renesas_i3c_read_from_rx_fifo(i3c, cmd->rx_buf, read_bytes);
> +			cmd->rx_count = read_bytes;
> +		}
> +	}
> +
> +	/* Clear the Read Buffer Full status flag. */
> +	i3c_reg_clear_bit(i3c->regs, NTST, NTST_RDBFF0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t i3c_stop_isr(int irq, void *data)
> +{
> +	struct renesas_i3c *i3c = data;
> +	struct renesas_i3c_xfer *xfer = i3c->xferqueue.cur;
> +
> +	/* read back registers to confirm writes have fully propagated */
> +	i3c_reg_write(i3c->regs, BST, 0);
> +	i3c_reg_read(i3c->regs, BST);
> +	i3c_reg_write(i3c->regs, BIE, 0);
> +	i3c_reg_clear_bit(i3c->regs, NTST, NTST_TDBEF0 | NTST_RDBFF0);
> +	i3c_reg_clear_bit(i3c->regs, SCSTRCTL, SCSTRCTL_RWE);
> +
> +	xfer->ret = 0;
> +	complete(&xfer->comp);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t i3c_start_isr(int irq, void *data)
> +{
> +	struct renesas_i3c *i3c = data;
> +	struct renesas_i3c_xfer *xfer = i3c->xferqueue.cur;
> +	struct renesas_i3c_cmd *cmd = xfer->cmds;
> +	u8 val;
> +
> +	if (xfer->is_i2c_xfer) {
> +		if (!cmd->i2c_bytes_left)
> +			return IRQ_NONE;
> +
> +		if (cmd->i2c_bytes_left == I2C_INIT_MSG) {
> +			if (cmd->msg->flags & I2C_M_RD) {
> +				/* On read, switch over to receive interrupt */
> +				i3c_reg_clear_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> +				i3c_reg_set_bit(i3c->regs, NTIE, NTIE_RDBFIE0);
> +			} else {
> +				/* On write, initialize length */
> +				cmd->i2c_bytes_left = cmd->msg->len;
> +			}
> +
> +			val = i2c_8bit_addr_from_msg(cmd->msg);
> +			i3c_reg_write(i3c->regs, NTDTBP0, val);
> +		}
> +	}
> +
> +	i3c_reg_clear_bit(i3c->regs, BIE, BIE_STCNDDIE);
> +	i3c_reg_clear_bit(i3c->regs, BST, BST_STCNDDF);
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct i3c_master_controller_ops renesas_i3c_ops = {
> +	.bus_init = renesas_i3c_bus_init,
> +	.bus_cleanup = renesas_i3c_bus_cleanup,
> +	.attach_i3c_dev = renesas_i3c_attach_i3c_dev,
> +	.reattach_i3c_dev = renesas_i3c_reattach_i3c_dev,
> +	.detach_i3c_dev = renesas_i3c_detach_i3c_dev,
> +	.do_daa = renesas_i3c_daa,
> +	.supports_ccc_cmd = renesas_i3c_supports_ccc_cmd,
> +	.send_ccc_cmd = renesas_i3c_send_ccc_cmd,
> +	.priv_xfers = renesas_i3c_priv_xfers,
> +	.attach_i2c_dev = renesas_i3c_attach_i2c_dev,
> +	.detach_i2c_dev = renesas_i3c_detach_i2c_dev,
> +	.i2c_xfers = renesas_i3c_i2c_xfers,
> +};
> +
> +static struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
> +	{ .name = "resp", .isr = i3c_resp_isr, .desc = "i3c-resp" },
> +	{ .name = "rx", .isr = i3c_rx_isr, .desc = "i3c-rx" },
> +	{ .name = "tx", .isr = i3c_tx_isr, .desc = "i3c-tx" },
> +	{ .name = "st", .isr = i3c_start_isr, .desc = "i3c-start" },
> +	{ .name = "sp", .isr = i3c_stop_isr, .desc = "i3c-stop" },
> +	{ .name = "tend", .isr = i3c_tend_isr, .desc = "i3c-tend" },
> +	{ .name = "nack", .isr = i3c_tend_isr, .desc = "i3c-nack" },
> +};
> +
> +static int renesas_i3c_probe(struct platform_device *pdev)
> +{
> +	struct renesas_i3c *i3c;
> +	struct reset_control *reset;
> +	struct clk *clk;
> +	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> +	int ret, i;
> +
> +	if (!config)
> +		return -ENODATA;
> +
> +	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> +	if (!i3c)
> +		return -ENOMEM;
> +
> +	i3c->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i3c->regs))
> +		return PTR_ERR(i3c->regs);
> +
> +	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	if (config->has_pclkrw) {
> +		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +	}
> +
> +	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> +	if (IS_ERR(i3c->tclk))
> +		return PTR_ERR(i3c->tclk);
> +
> +	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> +	if (IS_ERR(reset))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> +				     "Error: missing tresetn ctrl\n");
> +
> +	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> +	if (IS_ERR(reset))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> +				     "Error: missing presetn ctrl\n");
> +
> +	spin_lock_init(&i3c->xferqueue.lock);
> +	INIT_LIST_HEAD(&i3c->xferqueue.list);
> +
> +	ret = renesas_i3c_reset(i3c);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(renesas_i3c_irqs); i++) {
> +		ret = platform_get_irq_byname(pdev, renesas_i3c_irqs[i].name);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = devm_request_irq(&pdev->dev, ret, renesas_i3c_irqs[i].isr,
> +				       0, renesas_i3c_irqs[i].desc, i3c);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to request irq %s\n",
> +				renesas_i3c_irqs[i].desc);
> +			return ret;

return dev_err_probe()

Frank
> +		}
> +	}
> +
> +	platform_set_drvdata(pdev, i3c);
> +
> +	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
> +	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
> +
> +	ret = i3c_master_register(&i3c->base, &pdev->dev,
> +				  &renesas_i3c_ops, false);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(&pdev->dev, "register with i2c-scl = %ldHz i3c-scl = %ldHz\n",
> +		 i3c->base.bus.scl_rate.i2c, i3c->base.bus.scl_rate.i3c);
> +
> +	return 0;
> +}
> +
> +static void renesas_i3c_remove(struct platform_device *pdev)
> +{
> +	struct renesas_i3c *i3c = platform_get_drvdata(pdev);
> +
> +	i3c_master_unregister(&i3c->base);
> +}
> +
> +static const struct renesas_i3c_config empty_i3c_config = {
> +};
> +
> +static const struct renesas_i3c_config r9a09g047_i3c_config = {
> +	.has_pclkrw = 1,
> +};
> +
> +static const struct of_device_id renesas_i3c_of_ids[] = {
> +	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
> +	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
> +	{ .compatible = "renesas,i3c", .data = &empty_i3c_config },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
> +
> +static struct platform_driver renesas_i3c = {
> +	.probe = renesas_i3c_probe,
> +	.remove = renesas_i3c_remove,
> +	.driver = {
> +		.name = "renesas-i3c",
> +		.of_match_table = renesas_i3c_of_ids,
> +	},
> +};
> +module_platform_driver(renesas_i3c);
> +
> +MODULE_AUTHOR("Wolfram Sang <wsa+renesas@sang-engineering.com>");
> +MODULE_AUTHOR("Renesas BSP teams");
> +MODULE_DESCRIPTION("Renesas I3C controller driver");
> +MODULE_LICENSE("GPL");
> --
> 2.47.2
>

