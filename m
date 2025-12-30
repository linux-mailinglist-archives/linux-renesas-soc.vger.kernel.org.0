Return-Path: <linux-renesas-soc+bounces-26202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FBCEA1BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 16:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA31D301918E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 15:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D64231C91;
	Tue, 30 Dec 2025 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TL1tH+YC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9321D3F0;
	Tue, 30 Dec 2025 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767109937; cv=fail; b=pXqs8Vdj+YpqnVt5ESvrHtujuHFUfzbk/FYBCMIp7+lWwfN9ZHu715AVgarzUWs44JG21IwSfRenB9/fWKnhxl2dgnQW7cHBCUHVMqUGMiO/73783Q0Ob7/4aGFR10qeDFvErt5j1tqpa2fLLYvU0ijxWMLM7XvIDdx+rq6Ar58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767109937; c=relaxed/simple;
	bh=n1CZ+NBj/ku58pcUViEv7Gr9FxdBc9x85rZf0b1zflM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HgleRDDU9SwZWPFwJKeAlx6TrzLzDDr9gxesz7LMOoae7zAdFvzF78B+OUHhZXfjQNWGD0YLyS94/SED9FmuSCnxV+e5ORRuY5uVZxFWmNJnU7mAD/ya/bUNRcsUw9jbBikMTNgoRZJbFSvkMQmfszqS/hC9I8U6f1I5K1guuUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TL1tH+YC; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnQGhSWFzhVg7GvyWdcU6QG7sxcWRal5/yhhDV+daaj6uRpOfUClg0okct/qB+4z/al185jEU2ZwL4WDQ372uyuozJhuLvF7ygfttyrnypKXx1JakTuiPWw85SnRPmBxgyiDP54KFD9kCsIRAEVa4kE+ec8XZn64/tSZrV7ODICRTBuuHTTdtSfdtGAhItUlXabugK+hhKW2BZpjC7W3GWEBFehP7QTFRDIMhvPgg1dz0UJvWcuZdAvnq2+URBYNWrRCvhTdRi3LQ8E5CSDb/jrCNuJmf6c8d3tmVJctRb6qVS9+g3jG4PBdn5cCajTMQVGIm5EW2i0vb+raVkmH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16J+uXLKFOqo031C7XO43VvRP6yGYDJ4LsThtVISSDo=;
 b=nIuPnPqPQ/tJtWlKGczB1V0bKu9XKQY3SeFZwL32hcfDAIUi/in0dGX8Eze/z5qakBDLnGF4GGWctV+ea6aNvqK9tRGlpzertjtycZolX13fm3hts8V1uHCSG/EiuqR2HvhqIawOnNn2+/XgJIn94revSrBNp4TqhbDiKtp9mhxVgP20VqbXoPupI26ksfK5ufYHE3Qu6Cf/ghmj4XEB76cX8kRPoxJ5U16DeRboefX253W1YoHmQ4nqKY/K3a8dLM7jvX2LPme8vOToEB+UoewHI9kTXBl9Q3rfy0LQ89RQJ2r4zZPOeEU4HEEN1xARP/GScKv79ZTo7ancXQX96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16J+uXLKFOqo031C7XO43VvRP6yGYDJ4LsThtVISSDo=;
 b=TL1tH+YCA9VbLAJZtOWLgUABHZ03sfV5lBQ0WmvV7Z694xK8BZRms0ZIB0PTNRGpjc210xP1yRUfm/RxWVmd0Uj8d6+IMJJH4s74FRJx1aPWdnnwbU6B/kOn/awH4jQDJYSb8IqhMgRQjrtQNFgcecvDSrF3hkhyWRU3v+c1cBEPFLVGsbVleGGSC6FGeRSKTIdK36nAxcF/uVU11ftXxGIYKC0Oz+CsmrU3Auy0ZvgWKt1imXp1/EPJSyhlfXpWCZsGbOsxE0OAQIL8y9zuD7+TxCiw6LNpOrqBjx5ZNAL68ZhD8Tfelqmg10LeUb8JHbQGbaBgXRH8zrnIXYp6GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB9413.eurprd04.prod.outlook.com (2603:10a6:102:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 15:52:10 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 15:52:10 +0000
Date: Tue, 30 Dec 2025 10:52:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] i3c: renesas: Add suspend/resume support
Message-ID: <aVP1IxpDNUvLzHHz@lizhi-Precision-Tower-5810>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <8cba44d24d436bf11477c7f2b91de3c32dfe1809.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cba44d24d436bf11477c7f2b91de3c32dfe1809.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c286058-001f-4bf2-b66a-08de47bb64a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RswNe1Vq3L3WlITuQCOWIfC0gULfb7yJ1eo0oPBcN3CSDPDdi3b7nsB69vLO?=
 =?us-ascii?Q?vlfEYy1dnknH8Q9ZoP251FWGYfyF9tRWvPA5MbmkOgTlb+JGBeGDPLdxkiF9?=
 =?us-ascii?Q?+58+VysKWBDpSf8B8Wj3RIxRKRXnzCiuNPNvcQZHCgFjoxclpIh5p3Hyyz2P?=
 =?us-ascii?Q?jJYXxyjGeCrAhn2ZVToBlOGk7Tr3jeEsb/+3PY4siDOvUzBwWDIP9y4hMTLG?=
 =?us-ascii?Q?nbf1YkrVZ+FJ5i3KKmWvYUIe/tOmP1oWTIJo2sxRBuCO7pQPGpwtFgdPVTl3?=
 =?us-ascii?Q?SdI2SkATrYDtH6oLrVs4JE027wc2oqIyxbivGEsQ3dO8XJ20yvTYl+Ukv3R7?=
 =?us-ascii?Q?Tj7vvMgjKwUGe4nB/iaHnzsEep7CLb7e7REMiHusV05BVLR9YZuNSojmCRN2?=
 =?us-ascii?Q?Eu9+zMQnMTGAbaV+kZUBrGNeWM11qa7ILw8fEDgy+QpRXSSvvKRRfXuwmis2?=
 =?us-ascii?Q?a1nl7P1VPexlUqFkX8SZ6is539afxV984yGFLa0rOIZWz5cpiaTklTgzJSQE?=
 =?us-ascii?Q?iHmxOmojHQUhPuJUXTPOxFwaxlU3/82hvJ0041CAqIZg7OLvKjpieqZDdQuw?=
 =?us-ascii?Q?MnExaQ/f1D3UJRe/fCtVHUF2h+Drw5XYaHSmsshN3fJ0C5cuNzeoGkwyu6F8?=
 =?us-ascii?Q?hzT39jiP482o1xc06SrnHeq0F2JjmejCQPvWruWadddRWdBeITmoksRaWrOq?=
 =?us-ascii?Q?4VfMxKyADuMJKBHk7uAzNtViTnlVtXTnHx3P/tkFh475uClr2DLFfrcWElWb?=
 =?us-ascii?Q?T12WFtyq75XrByxpS4HyEpYj5eZocNFiU/308eWaFHvu/xTDXhZjymUqDuEm?=
 =?us-ascii?Q?Rk6lFlVv4Mdyp3aaDGOfTQfU+T3OrEQZh7CnQAwtYUQ1uILabvFH/zNljBU5?=
 =?us-ascii?Q?+Qa/U7AsIB3IynGvh8W+JsT/z5UPsHzjtwjrXmWL6VWt710d9T3FqfwQ/Hz+?=
 =?us-ascii?Q?ovW7UBoGAAJ6S3zgjSI3XC/JBXZAO+v2EnByEA+TAv+IIdz0XvtY97y5tQ31?=
 =?us-ascii?Q?xK0kRRmapf1fKoWDKrA8FUBA2lnB7mZUHjqjkUck7bKuY8oL37uFM7lYFpiu?=
 =?us-ascii?Q?kjW/jhpGaA3ZpZ7cciMpZ+M6B9hP87DZ6H6QYQ+7VW84m7E+dVzvWN3DTRjp?=
 =?us-ascii?Q?D0CTesCtFW98rWoWzWZHv9StRPfJ89NcDgqHnNC3MZWyhQOVN1TE3+eGhlNU?=
 =?us-ascii?Q?VIhVDhSVp/GAo656wwk/M3k4wS7j13LYNUvggv0OT7M4Iwu3ZoighGeDoMDd?=
 =?us-ascii?Q?Bnw1LoLZpUIO+F9Z7W3FX/NFmiSUe88YvaV9HVKTwcs5pp8ARMXvq11VKsXe?=
 =?us-ascii?Q?QodEe2XZ4LgkkFP9Oz3Id78YkjDaaWID1sLzuwikzXhX5d8Fq9hp8vQfSfWx?=
 =?us-ascii?Q?74sy+6u7RPcc72v8i5cRO9O2ah07p3aKCS3wE9cVYLc4JdgjZ6ZD8PhdpbAw?=
 =?us-ascii?Q?EsJs9mtBfP8bxWxqp5p4mc6P4LaXy83IlpNtIyZ7I1OUwvbwH6RoojEj3H5S?=
 =?us-ascii?Q?Yp6RX8+DGHZab2o/flGH18q1Zr0XP0wwZ77I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cpe3cyqcOkzSjVmzMgfcfGpDg5pDEyMHSrr9FnaCoi39KoYJxarAIRDQjmXw?=
 =?us-ascii?Q?dnxNiaB5QRIzDPQICzqYm2e0xUtPwSwkgrt3GihMVJVkUOzAYWhGGIjU0Bf1?=
 =?us-ascii?Q?Ouo6DdNYcF8H0rJ7KX9lmJBBg6tuvMyN/dobadvA8bTM+Zgvr+OBmLsW2gIi?=
 =?us-ascii?Q?Dc03E3KBzsVYz1ibGg47T6c2jt3r/xhQ6o6wZt8yiwYr2uNTe2/D8GzXk5o9?=
 =?us-ascii?Q?axpva1ccTpxIDCR+sZK2mtyZZrMS7NNkhz0h+liK7FbeVBY7pOhq0REJsEcA?=
 =?us-ascii?Q?UdwLao0v4lhYIZH18d/BajT4iz9zMiYEAiycuBPCjylPAzWITQrHPT8zIWsg?=
 =?us-ascii?Q?iifI0FOqe0HEQ6242FSZEzq5cEiCHXnxB2x8o/NOHFCQfAnX05sk8J+pqKtM?=
 =?us-ascii?Q?Yg0iiJC3+snEoVUuGcej2ZjR52U2rUT+TOLN6YWlWqbsC7WAQ/gU0zEPpxMf?=
 =?us-ascii?Q?klZAD5mDKrY8CrDRC5NG07lq+0aYV2iH7nMYz/lv06/a78TB6cOXoWLlN79C?=
 =?us-ascii?Q?xCdQTJacXjPzY2aJeD4H0fxlDfErRv6R6mMKJasgPoNRGN2RkuHbpa29+VTc?=
 =?us-ascii?Q?Rn1Nrpiqt7oZ10XL6lonVDlR1PsRnCNGhRXDdhoN6/FJvHs7hhcC9/ylbSYU?=
 =?us-ascii?Q?4lmnQzKtJ5eCRkGmEnJbFPzDqqap1YC5MgDmIJv5Rnw6tKImJX2bfsbHB2pu?=
 =?us-ascii?Q?hZBXClJ50F4L0RRQgXGW7h5Xj2810LBcy72IKm57ylfoaHwUXeEJxC5b5aJB?=
 =?us-ascii?Q?Ej0JMMZELYGfE6epn6sTZwhqbotC6e1j61kTm8dk7gXmUNpQS5fLnTqJaC5L?=
 =?us-ascii?Q?+eIZDkZwN97CjSI2D3xbTRiy2MziLRB7JVKV+6WkzS5vz1XRd7XjoDXoo70u?=
 =?us-ascii?Q?pIZYzU4HtFi6ydW0UOpI0w9dDig2Phw2M9zANRI0SMMEoH+g0+D14Hmmhcgc?=
 =?us-ascii?Q?3Xoy40QCSf3a6Y+xly1pUbDWnGD1LH6xoiqI5rQ4UbOvpabsD4GPHCM4SR1Z?=
 =?us-ascii?Q?CwT/FucggM/u650zxyU0MXK7gTPR+kdb+YrzmrKJ5zKSAauhfnWcljdKkiNC?=
 =?us-ascii?Q?BPxpqyViikKVllNRHLJCNp248xyhXZtXTOQtWw12BO1ftRfgUogJ7JLDL+hZ?=
 =?us-ascii?Q?3VCxI3ZJldlO3O9YwiL551yKCapvpsMR4/6S+YN0tygDy0cnrXKH6bK8el0d?=
 =?us-ascii?Q?5d6gnuro1/cojGzysQYPXrWplOVpiJE9C9mYoPJOR4Y9gO/SQZhalCJgkECo?=
 =?us-ascii?Q?6MaEx+RWnXhkhNTbXi1WuMvwx2DeU2KuBIpqCNoYkcb96MPi6UaZg5/eiySH?=
 =?us-ascii?Q?kOgRMqFb7aiFf+TtHVXOHGm4P05RPHbv33juQQ6D1CccS4Pd2skJTa82Dqwv?=
 =?us-ascii?Q?BtSMJ9agGRyf7t2O+LC/U1TY9D+KoISCie+2Q0TltrdS7S9OdHwGt6dVkSBm?=
 =?us-ascii?Q?nhtX4iVFXfJCugC7huzi1e/VYWVG1D/uk/DywzO9XQNXaKgFyQRFDoaC5J3b?=
 =?us-ascii?Q?yI24pASe+fLK/YJot0eaUB8ZxkGPHjghZo1iVFktOG2rXEk4ljc0YsFsTJPX?=
 =?us-ascii?Q?oMd/bk6S22PMI0n25N7ZbjADVmeKS9J5H29osqkSE1FMI9lb6ePE3zFru5OT?=
 =?us-ascii?Q?o33oWjd7OW/uTZyfIeZTu8/tAk5x8nwSpqEYoDCWUsY8fbK75XA5meyH5ywn?=
 =?us-ascii?Q?VTJHCYeQvwd/5igsrnMkoRmIPycT8ASds5V7jtOxhewZ4bCsxFkdu6EMDgBw?=
 =?us-ascii?Q?mCqOMwW8dg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c286058-001f-4bf2-b66a-08de47bb64a2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 15:52:10.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0JiErb0vXqI0ZKIgg1J6wZo4jlLCBqAYJON0Cc5MO/2KSFDa89V4eGonOG7oCoHZNWhmHfFJMSRhxgimNSvbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9413

On Tue, Dec 30, 2025 at 11:39:39AM +0100, Tommaso Merciai wrote:
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
> v1->v2:
>  - Updated commit as v1 has been split into smaller patches.
>  - Use clock bulk API into renesas_i3c_suspend_noirq() and
>    renesas_i3c_resume_noirq().
>  - Updated commit body accordingly.
>
>  drivers/i3c/master/renesas-i3c.c | 85 ++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 4f076c372b36..f089bbf19fa5 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -254,16 +254,19 @@ struct renesas_i3c {
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
>  	struct clk_bulk_data clks[3];
>  	u8 num_clks;
>  	struct reset_control *presetn;
>  	struct reset_control *tresetn;
> +	u8 refclk_div;
>  };
>
>  struct renesas_i3c_i2c_dev_data {
> @@ -615,6 +618,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  					   EXTBR_EBRHP(pp_high_ticks));
>
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	i3c->refclk_div = cks;
>
>  	/* I3C hw init*/
>  	renesas_i3c_hw_init(i3c);
> @@ -623,6 +627,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	if (ret < 0)
>  		return ret;
>
> +	i3c->dyn_addr = ret;
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
>
>  	memset(&info, 0, sizeof(info));
> @@ -1390,6 +1395,13 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
>  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
>
> +	/* Allocate dynamic Device Address Table backup. */
> +	i3c->DATBASn = devm_kzalloc(&pdev->dev,
> +				    sizeof(u32) * i3c->maxdevs,
> +				    GFP_KERNEL);

nit: can you move it to previous line to reduce line number

> +	if (!i3c->DATBASn)
> +		return -ENOMEM;
> +
>  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
>  }
>
> @@ -1400,6 +1412,78 @@ static void renesas_i3c_remove(struct platform_device *pdev)
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
> +		return ret;
> +
> +	ret = reset_control_assert(i3c->tresetn);
> +	if (ret) {
> +		reset_control_deassert(i3c->presetn);
> +		return ret;
> +	}
> +
> +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> +
> +	return 0;
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
> +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
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
> +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks)

look like it should be
	reset_control_assert(i3c->tresetn);

Frank

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
>  static const struct renesas_i3c_config empty_i3c_config = {
>  };
>
> @@ -1420,6 +1504,7 @@ static struct platform_driver renesas_i3c = {
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

