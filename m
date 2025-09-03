Return-Path: <linux-renesas-soc+bounces-21282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62618B42274
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 15:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E226E164D84
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1828D30E0F0;
	Wed,  3 Sep 2025 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ypv4NANb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22830DD0D;
	Wed,  3 Sep 2025 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907493; cv=fail; b=P326WmeNA4+8N4ucT1tJGUm/Met2kyCMawc3Q33KPtWiFQwR4YduFAjlBIVnlWNoreXP8lDsiFowsaJonNmsimPyC53f2dp+tsdqpVHCZcrlOTVeJdr3hYCH7bkfJwcd04rFSHffprhI9v1LLxlopxJOYLQgBpx4XufYqtiq75A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907493; c=relaxed/simple;
	bh=f8B9epuvYYKGeCabj90von2lCPP5j9XUnwhZacs4y3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YU3ubAHR6NTWJopYInGjFJxlGH3zLCFaSDL1GoMXWJQECjQJWU2RwgkyX/x4rN3D7OtY95PigE8wtKS6TagMkYNoxc2mp9Mv0zCw9sFCLWiIYi1HeAIVz7qsRawixyE6o/KbPW+GwkqLJqxCn4ItBUPAAYue6/cg2D6kjx8qLHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ypv4NANb; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVcD6ceRs6m9N25dWF3gV0/BI+zmiXQDZRqgEwxTSG6dGzHmuTyYZ9CP0Pkqgb1gxyn7awrNqGIrQmUyVdMDxxi30Yw4YG6j4eng0pq9PDnXBo/VNz2BgXJ8pe2+o73sC5KcUwmpwvF96BFKJp4GfZtHidMWyT8GfRhTQkveDc4bVFQuSvMTf+naSyvS3O4cAAFd9f/dRR8knSKF7sfnBJQbtJbvMr9qHEnWzDK/gJKAZR0r1hDgVJ7bEyvyI4p4FdrEw/fx8LYGF7bxrG/BeCY15eG10Krc+BWWGaaCFLMXY7vJ80p2grnxDn1ZI6w/veonMgfkv6IakkCnXsLn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr9hEGRS2wWsuz777yUpxBAinNOVGLbqCCV+XTSVjjo=;
 b=no2lktbCDM+miQ6OApzA0GXWWwccQIHqHU39qtMtZdSzkxpECAYPOfT2UbroVFBS1gD1IBc1oNop+jxPvjFJRaqvp+7diz5ZUXl52rL05qFxLpvBQrmc/vkFza4A/r2ttJLJnZfWPkIPRESmQm2bf1PnFwS+X7U2Zlr/O7tQqd+4R6/XXAn7NsEZMYcI+8GellsXOlC3Wdovj1k4rtDzt/dXsoju/KiwBq+RZnwy+gfD7FvK+iGbnlYO82q5kk0KltXAC+kUoqVh7OxVZdSehNybdd/WlPgiVccwcSDbB5okW1yeh+RaLuHhas7NqJ3JcQQJL79eoX0eJg9uhxwoTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr9hEGRS2wWsuz777yUpxBAinNOVGLbqCCV+XTSVjjo=;
 b=Ypv4NANbm1OXle+XBHiyTmwGYnVH6qjuM6HHHDaBHbwR0i5mf40a3bpb5LBa0Fnc4hIMkAEeRR3x06k8TBVsvXe7/LTA4r4WA0dBGW01FD3onoVxSzDPkefsCUy8mxvSldecsBYD4GlmtkuajYBzqPafKF7YJX58qPK80LMmDTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15891.jpnprd01.prod.outlook.com (2603:1096:405:2af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 13:51:24 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 13:51:24 +0000
Date: Wed, 3 Sep 2025 15:51:11 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: renesas: rzv2h: Simplify polling condition
 in __rzv2h_cpg_assert()
Message-ID: <aLhHz5K3NHrQ1FCX@tom-desktop>
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
 <20250903082757.115778-5-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdWc+gJo35btt3D7mibq+JCnZh4OagFPtSgUELjAG1J9UA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWc+gJo35btt3D7mibq+JCnZh4OagFPtSgUELjAG1J9UA@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15891:EE_
X-MS-Office365-Filtering-Correlation-Id: cef86ad1-2d2a-4500-0e82-08ddeaf0f8c6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MXedVmyXL9PDXH+jsaL58sUJQ8Lx0S7Q0/vUGZQJHzS9WxHyRnNm9Wo9ifPz?=
 =?us-ascii?Q?YQ5VaZNLwvWbgYvFcXlW3H1zn40CN4W4YACCuidtngscsxCbZRinhb4tzw13?=
 =?us-ascii?Q?FYuj7KYo5CzXjnJB9jJFDimQqfYWzzINOgNaR1gxyG5gu+6QCFlJu+d6vyLZ?=
 =?us-ascii?Q?rTvaZdVhXxhAHZnMuOHxYe365JOLSYeM5wI4BtHBNczKQaAGjH8oYxuzeX5W?=
 =?us-ascii?Q?gdBgKAVdh+sr0obnubdt+r+p3i+YnUoDW8iBMf2F2TTcu5eNo+WMDpDro9iW?=
 =?us-ascii?Q?dls/T/KTkHRHd7gvLY+oGAcvaElh2WCBN4Us/n8dbuIGH8fGLzIx/wIl9V5L?=
 =?us-ascii?Q?pUbtPqlzcUggg0x5C3+Ax23mJPQhLbC/6FM8UHxD9xP741Sicvykfd2ZuJta?=
 =?us-ascii?Q?I6wcoZ147YYWvnDw2r+Nct6dK3jrAtuE+pkCvtKv8Lb/czj/6koDRyEO63jO?=
 =?us-ascii?Q?ETlY8Pu3bh3ySxEsujpYrex/ufr3qYF0VZUmfKXJ5ZizwMg/jb2Jra8oqZ2T?=
 =?us-ascii?Q?1sVAPsv24+88LBp3gzfmBKQ8usWTT2bINy7ot5mwe7NKGe5WUOVEOANdcMcJ?=
 =?us-ascii?Q?gHRR7z4E9l2HuGlZT8bxbbTKQigvHeeSQY39gorpA/5DNtFuZq20gbRgfHG6?=
 =?us-ascii?Q?6RhxYOWOxpiN++giIM+Ci2o6TuI+H2EMl/8PVSwzYdzvLX9tmF6HKbVVLBN/?=
 =?us-ascii?Q?VA/vm0zKU8ulY5nZ0aPkVCKYdXQALX/vXNkza2HUfQOJChO6ws4Ib1Az+jnt?=
 =?us-ascii?Q?Rh3zsGGIseis08WTnPV3vFMQDr6Wj63bolHaVTY8Kiikj+I0SZVt8vP/y5Gh?=
 =?us-ascii?Q?KYYiy3+u0jCXd+2WauC8bokkWXoxq8SdSOZRfFYAMcuqtP0pxa7GfWqLFLja?=
 =?us-ascii?Q?FFCvV2dDWylmi9NtRAaQpbkUEtC7fx3ZxdKUDDiap3IwnUTBmWt/s9sRzE0c?=
 =?us-ascii?Q?DY24RxL7frBFARdvBTN1FqFkbH04e4mgVQ0s9mvHOPWXCD2S6LKvuWFZ/7wR?=
 =?us-ascii?Q?glw9AfNQiDK7WDJU5RZ17MMu4jMXKgCx0vfl8r4Yv01EpDF4F9mkpa+Sf6zh?=
 =?us-ascii?Q?icM0r2iAv+likW8mes1GSSu40dUXdasJc4V6ZEiUwrI8bl0JMWZSBUFFnnDi?=
 =?us-ascii?Q?pZekcJiobxyx/6FaGjEegDQ7TVPt5/y5VMfaGY3SMObeWmHLXTe0AJCFNyj3?=
 =?us-ascii?Q?Q0v20NjPEBfYzcso4LusiJewQa4rS0eDTSuNZ3pSFHb0hoUB796jCFis39WQ?=
 =?us-ascii?Q?lWCAyBQS4jIylVl+S82dHSmMlKzaxLB8yyga+pvl5AmsCseUEWco1u/Co9o6?=
 =?us-ascii?Q?ulM0YoB6gusmTbpfyoXScBUGox0b34WdqA8g/lspA7EHdKzlAzc8UjzGIpC/?=
 =?us-ascii?Q?+U+llPMEIzI6juF1w4OU4SXZAxdPcbrjYoBNNyclMowyF8KC12jTihdVYvKg?=
 =?us-ascii?Q?Om0ZfWBri2Qy4xoMjD9oObdbmehSTBI3+UeRIqfQIpulBN14Hyt4Aw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DyNppsFsrDun0LqMuVv5hvVbRHF4eTP80mM/TRjS9mOavkLMLsxtb4i3XyDU?=
 =?us-ascii?Q?67/9cihCkaSkd/gsmWo2rq/zVFScScFze7f1lOQJxTWFOm7nkzGD/Dkbdsmf?=
 =?us-ascii?Q?/FaliaBH5jIaOCIEvOd9MvyPjAm1NySOacxrkaNtJAyEqSDSfqi/dZVDRa6N?=
 =?us-ascii?Q?wamKZQUbCnm6pjXNC5MFfsnSoRU4jexgMbcWjIp2MmNFnCNvWXK05ZDQ40qV?=
 =?us-ascii?Q?2PpKlfh7m+xnk16d06dmVfNey932A2Yt8yamnUXvF66C4NUhybQEVIUBwIpA?=
 =?us-ascii?Q?RSX81hNm5jqc2nzdb36R6a4/O0Pkut6EojTjTmjbyrV9baTVT1FclqNg1ghe?=
 =?us-ascii?Q?4S8xqcMy0m3TrzvT41rQamadx1U5ucZ0Dvyr2p0HtJw8f1enoXpJqA5PkYNK?=
 =?us-ascii?Q?SZtd6A/DxlyUFAEiBIL2tn+NESo26ueU36ONdnB2WcUHCmcIIb5d3WnbCXI6?=
 =?us-ascii?Q?tDKodJ5cDXTVOZkaIJ/1k7e+pLv6Ornvebe25mEEbIytD4mi7ZLM86Nkbyhz?=
 =?us-ascii?Q?kY093FPhEs7nDqvNIafJd9PwUnX0pFddSg5RUCFo4wnOP6BmTHQ9KoSw1ZOI?=
 =?us-ascii?Q?4+nYreoWZNcIMP6JfZWU4IJFr6456WWKTjyrm7bs5bJOBXpIdp8/q5rJ7ZlR?=
 =?us-ascii?Q?ZRQj1U0oDyrVbkYE/oJtea+S7I/YzXlawwI5xACyEpE31kxVOxA8FwU+W9F9?=
 =?us-ascii?Q?IAI8rnKp+ZI/PsSZjob04lnvzVQ42VJ7hPv4VeabbJFAlHtQYaYNIr4/m3vu?=
 =?us-ascii?Q?cKuhLKvfbuysNLiW2eyhLd1gy7taTOrRwmFGCHybGPkP+eW2yiEhJLLzXoFS?=
 =?us-ascii?Q?WgY+e+s/Al88CEz7T2JcZspcaknM1qg+sZm1BZVC8rve9AKgfJ1uMOgTfRsn?=
 =?us-ascii?Q?KOWIiZOOTpsgy8CVKaJWR5jRQcodhL2mb4ZfEuByLanGRt5t5yHMpo6OTaZA?=
 =?us-ascii?Q?j5atq10Fo/q/h73DmzPxhf3OmqwiaY79u2T5DShWDRhT1GelFVpZpKGFd4dm?=
 =?us-ascii?Q?VNP0XewJCOybsWb16Ot5mFkuWeC6qrIRHkZCNfVAKjZD/AKDuELjcjeQCOdh?=
 =?us-ascii?Q?y914Huya9Si5936j7Ck2+2o3NWuaO7AFKVnoAoJLYtW052y3ikpj3swISBCL?=
 =?us-ascii?Q?IsFbQYPd446pPjaNut5EiIqBnHzARIEenpbzYHCrvRqx7yqNnRcgPWYI7u7q?=
 =?us-ascii?Q?ctqHGkwbUBL5tMR4WdY3l50uiSTMHBicI4ITILu2pzWR7L9f9qC2OJ/Y6RWF?=
 =?us-ascii?Q?BRu4XkN3ctTmFAq/LtgdKppwfj19oZ/X7LTq5f1oPS4ft5GWM3IoYqBvq2J6?=
 =?us-ascii?Q?mYuV9l8hdT90snCs1nDIlij0zRuIGw6Xg4Mu/T0OXoe0gSoQan+vHC0xqr3H?=
 =?us-ascii?Q?aHZ3DwFLAUM3XT9M8fEepHoZWgXdKxqGI9ySU3bHPEqagtnUM2UZ9UsifZwH?=
 =?us-ascii?Q?e4TFXOEPxnj9R8agXTc/ZWmFyCr9WQuHFFkQiPEnH20WqGDWokBBlcoOmGyI?=
 =?us-ascii?Q?x68F5fJ+AUXDcSFZ0D+bPUZF2IsugaBy4X3w0xCDVqC1uAzan1aSXzN7kCOc?=
 =?us-ascii?Q?gkiZAhGVQsIKE9CcjV4F/nriNmZc9hBwxa4Jpp33V3yCyDAlI3UMxUg2RWES?=
 =?us-ascii?Q?ymKAWEt6dAbxK51gah9Z4F4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef86ad1-2d2a-4500-0e82-08ddeaf0f8c6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:51:24.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 435KeZUKP4zm6O8bYlYpsXLR4qWvqQirWCa1mOROiawS47e0kTjAozLC77NlYpX2h3UWmM4LOicWnammiCwalDX5zTpU10BogCufLR5ngD90w2Gi4lb97pyTGgOPAJdO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15891

Hi Geert,

On Wed, Sep 03, 2025 at 01:58:26PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 3 Sept 2025 at 10:28, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Replace the ternary operator with a direct boolean comparison to improve
> > code readability and maintainability. The logic remains unchanged.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -867,7 +867,7 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
> >         mask = BIT(monbit);
> >
> >         ret = readl_poll_timeout_atomic(priv->base + reg, value,
> > -                                       assert ? (value & mask) : !(value & mask),
> > +                                       assert == !!(value & mask),
> >                                         10, 200);
> 
> These two lines now fit on a single line.
> 
> >         if (ret && !assert) {
> >                 value = mask << 16;
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.18 with the above fixed.
> No need to resend.

Thank you for taking care of this!
Same for PATCH 1/5.

Kind Regards,
Tommaso


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

