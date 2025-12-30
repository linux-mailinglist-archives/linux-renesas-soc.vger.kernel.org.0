Return-Path: <linux-renesas-soc+bounces-26214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EACEA7C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 19:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0F0301F8FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 18:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759C4322C77;
	Tue, 30 Dec 2025 18:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Sq6iL4pU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B326AA91;
	Tue, 30 Dec 2025 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767120004; cv=fail; b=u27YcVCveoMRIvIW4XrELbkGGL54d3Su4ivNvyLX1ZgIUw53oqLybouAcmlD9FK46sh+3JCp/Mzpu8yHWKiWh1j3VSAZV6Bfwyq/kpRvxTvetiHm6j2qL4HpCZuV/Y3aRW/siSUVp0zPqtJP7S2axhy8jMeGYfLENFIDB6OwuKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767120004; c=relaxed/simple;
	bh=x+i5TmFuX7GjBfQwIVFczFsJO1wNV8cuiTklDHuFS6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fAQ6o5aYLC9EGnjN8D+1SJw7c0rnhWAl6CedhftjgrTKApmdQ4tJ2BeN2GmdEAseBubwwgei71uWjEUEaLNCsxLwPshjn0Hz8yHFWQzcNHJaDlx+Q4qtNaqN0K9MbTMcXrtAOGCdBgpv8E8RmBv2mJl6k3bWnVONRXpPREMaNkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Sq6iL4pU; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opHhDtTuW7Mr0oL3xAuR5NRUHRmDwEzcqQ4orkxXNwkSkSVcExkIJPAvz9ZPBwrGhL2Hj0huKrmfVXduvYqr6RLOeY+2dAAoekoDe8Y0jYt7Kqo1Tfd+r9PstggxFj0bgFqKIEFXHO4VpqpryPD3WMDRpvGD78+EzIBzhzWaoyj51H60r3aS0hi0LKEBs3kqmW/ZPG48wraQOw9Nfw9TaoCDZnrYrgtzYRldozQkcVy+/E2fD8eNSJBXCm9ZwbPvKMpRoNFDcPXP8jyHaAE1nCM+vx0VuQorFvrU0kme74XfsOPyRkVmM73FXPAFiNVys86fIBAJrU7ljSM0YQTcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRuBuVlTCVU/G6n/q3KECrsMS8KD4g7tCanz5k8sMHQ=;
 b=XxJBF0ryCZkyZqdLA3ilpb3fP7bNztl/3SiRY7H7qpTiiPKhdzRO6ApcIUQdJB2lcDAxM+8VFtBx8lrpTkxCVJf8muNNM+ScrigZiBZd/U/PiYRu4nmEEnf4nr1KgdBVKPFFmybBHqhZIQrTwPF1EQC+Ij1s87RcPY5z6+nEnjVOCmzb60abCo78KmH3jgr8VV7X192V5cGYo3VXU+zR6ly1F0RiNj+a788MgLfow54A3/5Cc4Awo9+C+dF3tGsXlCtrJ6j+D+d2lIQUvzaso51ipo81IuuL2PvE0pjmg7MAgP3rrivQwiZ0Rk1q9FFBs8GD3jbaC0DNhx+queNx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRuBuVlTCVU/G6n/q3KECrsMS8KD4g7tCanz5k8sMHQ=;
 b=Sq6iL4pUBk2rG1njBKzZ6i4VH7JTJiejQ2wI0wFyTfVr1vhXRYW1+cZgilgRjX379MYRJJG/LlP1nWDFVML/ryJB44op5Nj0IsuLaaB5Rntmxe8zls7yEduWvPhz7LwNCoUnOI3GGN9DkRztOtYCo0isqbX/yIX9pQXL690CNI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB12691.jpnprd01.prod.outlook.com (2603:1096:604:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 18:39:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 18:39:55 +0000
Date: Tue, 30 Dec 2025 19:39:40 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aVQcbIzfqjhxFvj_@tom-desktop>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <29d6558c381b726f53c22088a5a2ad5adf9fe142.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <aVPzQrFL7T5KP1jI@lizhi-Precision-Tower-5810>
 <aVP81n7yRgeHz3FX@tom-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVP81n7yRgeHz3FX@tom-desktop>
X-ClientProxiedBy: FR4P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB12691:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bceb28-9a70-424b-0fb4-08de47d2d387
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LkH+IZdtRN/ioCHQfJQZtcf+F1ZruuK/tvDpESgs3Hs1gt48sbZv2XdNSxxT?=
 =?us-ascii?Q?oDJ78ZrzhKnMw2l4lot6inaM1Bgs796QVDgvYmjE1iGHBCb+xswfODukTfKx?=
 =?us-ascii?Q?w3FikNYNWx2DDkqCvhVJtoDpM7t6jlvC0maVlp8bL8i0khNcRtZaEGFkQDqS?=
 =?us-ascii?Q?hJkmzYCGpCb/yypZ7KiWmNEyVqFuWw+Ccbngt2Dqc6DvIOf2lV77c1xsObih?=
 =?us-ascii?Q?Hml4H8HirkjOKEGidVjz/oQsYsBvrUR7KwflYXsR8kViJmtijKTvOt8tDOTF?=
 =?us-ascii?Q?WfhymVaCHOeRW783rzvKAQugXeHnbQYN8JtbFqvwOeFFBaSBCRh+XmO2uyPS?=
 =?us-ascii?Q?Onys8zZI/Ya/ZGmGJ0d0jsTunSCMNmFywj4y35t2O7fw93mVCXr4Vogo9U+y?=
 =?us-ascii?Q?u086vEGRf8XcHCWzvf+58gIJFYBA4YTotymLYkLGyFFlCiiEfYH/rM0pBZVT?=
 =?us-ascii?Q?x5HIMhaymVLuhnhKTQbX62U2LVfHsgTVTIm10j9sXPGxcEJT+AdixYIyyFRn?=
 =?us-ascii?Q?aZ5vapMG7lQmq7sDc/wiNmTZRFB8SRODgyG7oIbNvCbw+gDMRX0CdYDUrYP9?=
 =?us-ascii?Q?kHljfSCGSfpjpLHn1JgU2R7RGTZdL9/z7xsra/wGtRgq6Oj/WYFgkWbKzYKi?=
 =?us-ascii?Q?shf8AuSVISNlKbIP/l5SXYIzPo7Ir4giCfGymNB+TvMMw8T93+OnBcSDKrgN?=
 =?us-ascii?Q?2JIiHHSjTgY/or0hu9kVkFZTr8q2q+yEYZJiszBB2UiXs84ldZ5aGggRXVMH?=
 =?us-ascii?Q?cyK7FKZBauCca+PrjI4iyMC4246l4EUxqIoNqVpBZ9+CNe2w5kvhS3VYd9Eh?=
 =?us-ascii?Q?qzYj5XLmVJEIsS33h2CHqsKB4QuThe3pm7TL4UUPf0aJ4ygXSJTtbBGAsJxb?=
 =?us-ascii?Q?T1Pm1pln5hpcv16w0ZGbTJ8vgQJ1zS+y5a0t520fiz/TFFIypi5JD9I08f/E?=
 =?us-ascii?Q?1vc0+IE9WciYcIWQwzhxd6i5xnTDiXt3KjEmm91Nd+aslvUH7owe/PxNmz1f?=
 =?us-ascii?Q?nMfrtg4z6iFsH3RplIiH7HUuqDA+oqKTO0qkCfzSZ3vDFO8JRJ6XR/ZsOuKL?=
 =?us-ascii?Q?dkkJqltNDpUFsJ8UD2T9NFJloApeWBIAI++fna9Wp+4Gm8AzUcy09NB1DHQI?=
 =?us-ascii?Q?FsZlRYykYILEleERXwU5D7/v9FBlzxvabVNgJFmamh3eT++aLi90YlJJF+9h?=
 =?us-ascii?Q?GgxXu2kkd56AFXSheztuEvDp/fEMp01JI1WP6O2UyFfmes1W6Of+5InsI21U?=
 =?us-ascii?Q?GWNgBc0FFOBxr9uDxZbn6HxMDV6OntJflltSYLSRBg/uscQvEegLB9cmFx8u?=
 =?us-ascii?Q?t2waBESZCUZPQF3+KV9baZjgWlgK7+/SkqoOpmLyoP5Intb7iJmX1Howb1GB?=
 =?us-ascii?Q?JR+27bBEdCJcGFMsYehsLxgouiUgNj8UYHwX7Jwhws6ZfUVa/ZlxvZDJERi9?=
 =?us-ascii?Q?hypYdvV1bqYvdp7uZfj29sTUSBag3JCE+f6dgjyv+lrbDJtqUhzO81hyBP3i?=
 =?us-ascii?Q?yOUtELjoHO8ypdti01+znJ6Z7F5y95KXKsIz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wChYBNPjBITNenCZbDmX4GlykhL4FINZamJkkmGCzfIxHv8TJplFmrmZEByE?=
 =?us-ascii?Q?u04u1msb7djCpU6YZFY3lxt/aWrBcg9b5i2LI2571xO3qMRcydAhoSiprmtf?=
 =?us-ascii?Q?dco7jh4TaKyDzX6qvpWwJ9Gw/+MAtk81h6lxOiouBkMORiadq7I2mNzHxarU?=
 =?us-ascii?Q?QLglNv+6WJreaPxAyCyLgPQuv5qN95zsdladD+agkytkl2bTKvWMUgPoAM7B?=
 =?us-ascii?Q?O70YWunxJUTQZacRKSOzpD5njKPdHf+bdhiwb/lL2bi63fQiUIh3cgawt0E7?=
 =?us-ascii?Q?V0R7/j1B760WhpcFyGLMrC8RCmH1OWTRxIrxchBgbPGY7yuDeXwnmLDh9BC1?=
 =?us-ascii?Q?oFSMlykAxu6hFRBRC+bEvZLz7veM6INL6u8fOoenZlaGqnSANIOB4GBbeEN9?=
 =?us-ascii?Q?XrPuL/Tleb0QeDWPmVGk81uMmP/3ugHtyPWj+l6O/Omlkehjzt3gIgriDdCB?=
 =?us-ascii?Q?UebM97cOSwy9DCsFzDoz/IHPNRiY5u0fGK5HV88etEsHDwbHTwzZAzaPoaCq?=
 =?us-ascii?Q?9UyRqxydHAEGDh11FMq6CiNqtQDG/btZYumM39pDER2jQ2WmT86mqYKiIMF+?=
 =?us-ascii?Q?HjdxLmMFQVys2+gMjxFYsIxzQi0Je5Z+1yVSdQBVnhkl6K12KZEwApp9EB1Z?=
 =?us-ascii?Q?WT5Wklxkg+aq055tUNTsPrA2eRrHVGv+hgvI8T0LmHVyUlUgFgS9CjCGkjzJ?=
 =?us-ascii?Q?kv4ajl70xjeUuFr/3CQ0cQx9hJ3qNeaHfB1CkgiGPSNfc0+2JDsgFHn8q3xR?=
 =?us-ascii?Q?VMJvsKxWisFmNbGaaR9RCEhEgKqaeI5WqCJgk+up/p25Kd5xuBeKmt2Ggu5I?=
 =?us-ascii?Q?2dYNps+9bQr1DHGKwXvnKVKielI6l+Ni1EQGG+gR9QC/2O6WQvX/ULLhYiMD?=
 =?us-ascii?Q?sR8oQBTEjTMXCAVENE2hRY7nSld3dnlbMjUJ3tfLzl9XS9lcw/ngsJbtri/r?=
 =?us-ascii?Q?MfYx9Y1DNKrN5ahAMq/hZZq3XHnYkqLLMKwNMHIQ4DakaQz3I+c7tDQVwb0I?=
 =?us-ascii?Q?GhLptR9Q+UhUAx8ACIMGCINmgjJDXim9p2/1TlmvNK5OeVdo1X9eagEpdrxZ?=
 =?us-ascii?Q?0+aMVryO1YTJ7PZeRPaetuW3gziT5iCh5q2Yw6sW1QrG+QLYLQbmc+eXnBs4?=
 =?us-ascii?Q?d+2Z6FQO6ockOtsXfKZjtNqg2n/z8bBI++VxbOgxsy/rmdkimXtEKWyp0x52?=
 =?us-ascii?Q?j1BP1eqxODg3tZLitIp0awvRUYidB086Op51m2b/jWTta8pgIOUxsIClWJPU?=
 =?us-ascii?Q?6uifHFtALHhT7nOaJgcxb3tLiX8UVkAojTELjPxRfCgtBnf4QXEWCxL6SBwu?=
 =?us-ascii?Q?ZJzcHKjApyipvwzd/AsDjewKbDiqWYeDC2ajCoZhz9uE0ERLgO0ezHzXSfbx?=
 =?us-ascii?Q?MVwyhMkINiM+C+H74EYDM/8KfFWqitQxQz0at0nAjfxjV2YT/pHv+rrJuOWn?=
 =?us-ascii?Q?8e3AP+/8XukmfDRvV8j0pXNHbNfGtxKNfg2JVNFw2bdWpX99cCLEuVoaJNZJ?=
 =?us-ascii?Q?4+2/cVW6SFwKg1LDux6s1LUkbR92SEdaypsu/KxT34etbPxb9+DLtc50kVMy?=
 =?us-ascii?Q?LvGnXwJIb6ncoSfdmNQ0+w3vb3gX9uMiY4E9MDKsQ/Ft9q9ERAXWznIctNrg?=
 =?us-ascii?Q?AJMLXisGnup+SYUjcYQwglOOS3GEg9sbhEXuq14Que7jkwKWEYR9FDdAnlGZ?=
 =?us-ascii?Q?A0UAWRyPl4bLlWOfmhGKfMyZrpwq/D2hHfv9XZ46f9WQPKQesnOVf9/ZcWZm?=
 =?us-ascii?Q?4vU5tdksV6sLO3wFAop33K6SMJst78rqaxuwSugMZUzpNc1fc8AE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bceb28-9a70-424b-0fb4-08de47d2d387
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 18:39:55.3905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc9F9zWGE9JTULN55i+ZoNW0uVPVkA6EeR4UmGw/w0iL5B3wXf6hLQEWIbgRmQUWdoW2jxDE+armKcHxuxiysB8qhDa8cOoL7ZUBCaZW0qQWolVMhty1FTPRpYvLvUqj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12691

Hi Frank,

On Tue, Dec 30, 2025 at 05:24:54PM +0100, Tommaso Merciai wrote:
> Hi Frank,
> Thanks for your review!
> 
> 
> On Tue, Dec 30, 2025 at 10:44:02AM -0500, Frank Li wrote:
> > On Tue, Dec 30, 2025 at 11:39:36AM +0100, Tommaso Merciai wrote:
> > > Replace individual devm_clk_get_enabled() calls with the clk_bulk API
> > > and store the clock handles in the driver's private data structure.
> > >
> > > This simplifies the code, and prepares the driver for upcoming
> > > suspend/resume support.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v1->v2:
> > >  - New patch.
> > >
> > >  drivers/i3c/master/renesas-i3c.c | 42 +++++++++++++++++++++-----------
> > >  1 file changed, 28 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > > index 426a418f29b6..8ef6ff06df90 100644
> > > --- a/drivers/i3c/master/renesas-i3c.c
> > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > @@ -259,7 +259,8 @@ struct renesas_i3c {
> > >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> > >  	struct renesas_i3c_xferqueue xferqueue;
> > >  	void __iomem *regs;
> > > -	struct clk *tclk;
> > > +	struct clk_bulk_data clks[3];
> > > +	u8 num_clks;
> > >  };
> > >
> > >  struct renesas_i3c_i2c_dev_data {
> > > @@ -276,6 +277,10 @@ struct renesas_i3c_config {
> > >  	unsigned int has_pclkrw:1;
> > >  };
> > >
> > > +static const char * const renesas_i3c_clks[] = {
> > > +	"pclk", "tclk", "pclkrw"
> > > +};
> > > +
> > >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
> > >  {
> > >  	u32 data = readl(reg);
> > > @@ -489,7 +494,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> > >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> > >  	int ret;
> > >
> > > -	rate = clk_get_rate(i3c->tclk);
> > > +	rate = clk_get_rate(i3c->clks[1].clk);
> > 
> > Can you use macro of variable replace hardcode "1"
> 
> Ack! I'd go for:
> 
> 	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> 
> in v3, thanks.
> 
> > 
> > >  	if (!rate)
> > >  		return -EINVAL;
> > >
> > > @@ -1298,11 +1303,17 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
> > >  	{ .name = "nack", .isr = renesas_i3c_tend_isr, .desc = "i3c-nack" },
> > >  };
> > >
> > > +static void renesas_i3c_clk_bulk_disable_unprepare(void *data)
> > > +{
> > > +	struct renesas_i3c *i3c = data;
> > > +
> > > +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> > > +}
> > > +
> > >  static int renesas_i3c_probe(struct platform_device *pdev)
> > >  {
> > >  	struct renesas_i3c *i3c;
> > >  	struct reset_control *reset;
> > > -	struct clk *clk;
> > >  	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> > >  	int ret, i;
> > >
> > > @@ -1317,19 +1328,22 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(i3c->regs))
> > >  		return PTR_ERR(i3c->regs);
> > >
> > > -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > > -	if (IS_ERR(clk))
> > > -		return PTR_ERR(clk);
> > > +	i3c->num_clks = config->has_pclkrw ? 3 : 2;
> > >
> > > -	if (config->has_pclkrw) {
> > > -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > > -		if (IS_ERR(clk))
> > > -			return PTR_ERR(clk);
> > > -	}
> > > +	for (i = 0; i < i3c->num_clks; i++)
> > > +		i3c->clks[i].id = renesas_i3c_clks[i];
> > >
> > > -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> > > -	if (IS_ERR(i3c->tclk))
> > > -		return PTR_ERR(i3c->tclk);
> > > +	ret = devm_clk_bulk_get(&pdev->dev, i3c->num_clks, i3c->clks);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_clk_bulk_disable_unprepare, i3c);
> > > +	if (ret)
> > > +		return ret;
> > 
> > Can you use devm_clk_bulk_get_all_enabled()? all dts already verified
> > by dt-schema.
> 
> Ack! I'd got for:
> 
> 	i3c->num_clks = config->has_pclkrw ? 3 : 2;
> 
> 	for (i = 0; i < i3c->num_clks; i++)
> 		i3c->clks[i].id = renesas_i3c_clks[i];
> 
> 	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> 	if (ret < 0)
> 		return ret;

Checking better I think we can directly use:

	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
	if (ret < 0)
		return ret;

	i3c->num_clks = ret;

In this way we can drop also empty_i3c_config and r9a09g047_i3c_config
that are no more required.

Thanks & Regards,
Tommaso

> 
> In v3, Thanks.
> 
> > 
> > Frank
> > 
> > >
> > >  	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> > >  	if (IS_ERR(reset))
> > > --
> > > 2.43.0
> > >
> 
> Kind Regards,
> Tommaso
> 
> 

