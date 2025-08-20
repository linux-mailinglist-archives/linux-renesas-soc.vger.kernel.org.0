Return-Path: <linux-renesas-soc+bounces-20743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13BB2D43B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 08:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777A85A218A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 06:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FBC2222A0;
	Wed, 20 Aug 2025 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PN4OTMFR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B932EB10
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755672463; cv=fail; b=H5wO6bxnIlIcrZ46M7lBm2FuP/rqCuV8Ypypei6K5iabNAwXa1nZaJvLH8oztazM08kHpjt1eu2Sd1jAWoYqNiQExzH5P4NkbJ9vRivDGT7/Pd1vCQyOsYSGsdvdhNdcLWCX2osP2h4Bj5quwRf342fTZhwg4fSs4OEHjUTtr0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755672463; c=relaxed/simple;
	bh=GwS+Hn54DTi6iPMkfYZAFbhRObn1YjhQnVGPdqf65cM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JykWpCjEML47pw78VBzrm9dGRbMYnB5OaGSLiJeRe+azrJ2z9qidHGj8lmNSE1+JqSJTXExgLWVjUDHvYZ2wWe/jZBdkeV11Fj0Zo5Q/VpW7hD/Kf/C48G8shg/+M2oSGByjvzCWLP/64d/63OvustFx5XdxDg0GxvfhVR43CBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PN4OTMFR; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjQaJu3UWFzF8Z1nuNye1h+XoB5UTz9dzhRmedEjZaz2X7ViVUZgqNx+6g/eGoYVudnz3weEq7VgfiqEPQwrJuGQcOXrYp8QMdXvPNdZYp5bMI5DmIXzidmL0TezugofwaDY4aNENPzYdDj2RUKeaKxklPzeNJL3iBsBOYsJF67HGZrHbVecZ+g6gIVinca6psxgesxFa8+m52Baz3E050Exzz25FsFrpXa8h/w+DCqaHpGhizg2jL+WHSTI8yT3kpA2Uh6guUGlh8uQ6N99SdJ23bxvSWpYX0dK+N22DZcA6uODLag2WwNuwdem1ab4oYzjpISyoGDivY4UYhBpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaworxQhJk7fLv7r5gffILGn0pZbgk4AYyyFemxFQ1g=;
 b=FumKl8Mi6sB4rvkqdOtc9L+F4VwRXBMG11ZhhOucQHc0iuCBCZXPSYmIS+8GHTJGPVfBed5X/3dASaBfk4EsCpa2H87V9dI5Ln8rNorZEXzGjGmb1vo9xyQNL22BIZNXc5YS2LDupextvtoHjdV5xVPusEt1TzdzXogdir2h8eHnG3AXXUVGTCU5inA2JjNpw4GXyGvvYm1Um95xY/yPiZrsXQndH7ILlQQrP3hiLgT7dPd4/0F7Wn4Q4Ts3r1WFT+CVUONgkt/MJ4s7dKvigE2hNV6wFSPNbJ0qCYQJ26yKA/whj3DdvcLs9vaRm171eAT3MuefkTw11ptuMVL0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaworxQhJk7fLv7r5gffILGn0pZbgk4AYyyFemxFQ1g=;
 b=PN4OTMFRnPl5NklKO1glwVBn6gGz1hc14l+zBEVl3HN4HyKGnF9D5KoRBrwQTvnylPTN2+m29DlD1++PAcmqtEglEjeFuTKZjFK2NbkcOlQoQnzYe+sLAOhVTO69DkOMntMIsAQWseCYksGQ8IWARm//v/5JEvvvkNxJqMR3sYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB10910.jpnprd01.prod.outlook.com
 (2603:1096:400:391::12) by TYCPR01MB6963.jpnprd01.prod.outlook.com
 (2603:1096:400:ba::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 06:47:38 +0000
Received: from TYWPR01MB10910.jpnprd01.prod.outlook.com
 ([fe80::d5a3:373f:dbec:4ec1]) by TYWPR01MB10910.jpnprd01.prod.outlook.com
 ([fe80::d5a3:373f:dbec:4ec1%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 06:47:38 +0000
Message-ID: <874iu2zdyv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [RESEND][PATCH v2] soc: renesas: Identify R-Car X5H
In-Reply-To: <CAMuHMdWHXDd41aDgVEBA-MUkzCS3ugvgRF90pB3ZzVcc47ZNgg@mail.gmail.com>
References: <875xeizguz.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWHXDd41aDgVEBA-MUkzCS3ugvgRF90pB3ZzVcc47ZNgg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 20 Aug 2025 06:47:37 +0000
X-ClientProxiedBy: TYAPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::22) To TYWPR01MB10910.jpnprd01.prod.outlook.com
 (2603:1096:400:391::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB10910:EE_|TYCPR01MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 337866b0-aaa6-4d4c-1024-08dddfb573ce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r+cDulrELyGOusUmHn+3H77mZTjhF1X5p56GQnfSUDQB1G/zJFNEMfVtLZIZ?=
 =?us-ascii?Q?qfLbDSTgEVyfWAqM1Y5JhN+Ra5hscCWYqLDGziaOtCfXN4tuQUzBb1+jqTEU?=
 =?us-ascii?Q?tK+8/6bb8f/FqbkkZYlqXwvznNMFIaqZrxDkYNBRxdb7W3YDJyudVr3MJsxu?=
 =?us-ascii?Q?FvMBhtv1nR5aKIaFW3H+LBuOIT0eMRSxn9UyWn/Qm0ytFWl7pNP1VToij5E9?=
 =?us-ascii?Q?fvIlRyi8y9BvORTIRXsF8gNUVHNnH25HccOHgoTlkbu+oQOsCAKy0F2mdIyV?=
 =?us-ascii?Q?Yi7ja0rlXMmkveah13HtGcpbIAUoGD+AmB8ff7Cj1BIQhVDjcLuZ0/Jvhr0S?=
 =?us-ascii?Q?9bbTT+HuWQSqIdncGiqfoURvHbI5d9OFhbC5/ETgwbUeGeoSYg+Pu6faKQLB?=
 =?us-ascii?Q?NF0PvIg54IsOm6c/GCQ1ngZsiMIw6Xbt6N6l1+ng6U8kRBzyHHBGIA2rJ6Nv?=
 =?us-ascii?Q?jLPRTYEfS/JiH3IpSA1E7F8tE2GmMPEF82SCPhVT6eQahpyY4Wi30c/hmrh2?=
 =?us-ascii?Q?evIfMmkl6bhrI4XUI1eiF5vk3BLBYShzTl7DcazT3LPWDZWOw8pFuAOdrxq/?=
 =?us-ascii?Q?lrYRYkWMKwk/Q1DkOUI6WNhBiY6Ep6spCxPr2SG+cbH8OomQzSxAayFm3hAY?=
 =?us-ascii?Q?qCh8DDpuelG8I9EcER3CysnwxfNCwXJLpsZzV+v8GVIeFIk+b0KhKW7vzlm1?=
 =?us-ascii?Q?k1hQ/EV+rSE94X/OZDzXhkUZV93Qju8d8iv9sqViZof3H1NjfVuiQQy8+IRP?=
 =?us-ascii?Q?KWXQ2FCzE+lBzru7taNKaITLFr5fi+twZ2ENi+OrdyFYeaoz6jnoinRtS/5/?=
 =?us-ascii?Q?5h4V2jEgWmMSJkSRg3GUcQj2UmNyTYhcuk3R1fvmsUSXMmHgpyeGM6cmk15A?=
 =?us-ascii?Q?aa5jRGqQj3w6Fu6QtEfuyz5GQ/wZ1IYH4zUpH3mA8tJsWojMXxsZoDuimN4R?=
 =?us-ascii?Q?0zFTlyOYdzv67w2U00M/nfTsNjBl6aqrm5MS2wnapccorkVaL9IUxUU6hLR4?=
 =?us-ascii?Q?S2+AxSqMNMC53IGDwFrItCnjV/XAORKmqumuLzD6VFyitzwzeuWdYMcGijk8?=
 =?us-ascii?Q?LFvP/aCeqLoUShBJLTaQYHvcKGMyeTtHCzgLrlWwyEqksrcVoWmhPtRKcGXI?=
 =?us-ascii?Q?9KO1QBLENkPylGuUMjCYGY43LnXhGtCgUWq8mNHcYVL4Gj8lJ2nrCXW9x5vx?=
 =?us-ascii?Q?cCE3gl5f0gqGj1wW9T6sZABJ9vd0UDCpGrCimtagI1JqouMguaQNDi0KSikp?=
 =?us-ascii?Q?nP+VuJ6uS4tSyrS0gSb+iAtG7t1Q2JlJr3qGwurf0U6pE4gVr/obTMO9YwHq?=
 =?us-ascii?Q?epbSX+YGK0o3D928FDhcUlatls/fu2UBdt4a4yK75BbTUtcSd8HnzlJy3LwG?=
 =?us-ascii?Q?kDPtxxki5NZQmHTnsEJ30d/YEbNNSKdDGvhns/5pso3E4duhOcC/cKzjAcrE?=
 =?us-ascii?Q?oSQqqUlvzJvIBzG+kgdIWTwhr5ZXeuHjhJ7psFLqCMkJ3visdrZjCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB10910.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/XbSrfsfyslMGoNPkW1Ox3dsgb0VefZ/Mvje3jeEFOuojf2hhPbNh7nkpKl1?=
 =?us-ascii?Q?BGcZn7Sf4PfFzc93hEAHxqQhOkPyFiiyJqeCbo9IY87l+vzWRgVyt68zfAQh?=
 =?us-ascii?Q?BromSUTTUN6KC+NvnOH3wVx5wIjVy/rMyj0WimZelxAi11w++gz9L+vEOEY1?=
 =?us-ascii?Q?9dxAE5+azrAGN/SbX//QRXRaXVihT+eGzAhnkibO+Lt4WuFO6b0kNWwuQVtU?=
 =?us-ascii?Q?B7Q8p+Xx5gnbWAwbAtQr5SOKzMuZyo/5erR1req5WAP4Wp6ab5I68YYPK+1q?=
 =?us-ascii?Q?zifXlTsOwCAFZJ3d+n+6KG6RqxFJkJ/kB0U9yolF+qpwxxK9AT8KGdr4ZEJM?=
 =?us-ascii?Q?rp1O8aYwNMYiy3aaYj/fcIlfJxUl+9ZqYnJvioZpstqajs25mZ3EmP0890BR?=
 =?us-ascii?Q?jqDUJ1fpD4OcMbOMXFqVUB5fEQuzL5LDSHl9p8pKJ+5LH45OPZtpV1HsVci3?=
 =?us-ascii?Q?tsC438F7fhwf+OGTuM06aOk92Z440CJEZx88A8Y5oCmxgzDw7RToT9R1A/ls?=
 =?us-ascii?Q?8j6PyHgCAl4Obl53cfj3VdF/6dTSnwdpx2mXKsLQfSw1lMaMjUDIUfF2r30i?=
 =?us-ascii?Q?RUb1vWziIPj8+IKi3JO0SZVxvJB04ns7s8Voot8Prtc3rgEmKydQXXae8bVS?=
 =?us-ascii?Q?000ttGz0+fXZVqIzZGBAETSm67TTPK4jgoLwW0XSArT6sm9ZAElePoqnHO9K?=
 =?us-ascii?Q?sOPAXzAawVhnyaBpn1+jfHNYtAFqjGJMGGMmI1RMYgGUsALJVaKitU+jpOMP?=
 =?us-ascii?Q?hVcxq00ZcGcBqymPTWwMtg1P+VHo0kuxSVqvYzjYFQOYFLS7eQb4tU+Vp++m?=
 =?us-ascii?Q?51dyi1dAV82EPy1RNG8rUqIFqiU/3HO0CM5bwI72zgtVOXDhJo/CrG9lvdts?=
 =?us-ascii?Q?nogi1WdZhxEojQzOlBk4TB9pIkK/PJxtAwqvcRytVBrL1ZCdZM6HRPUSTflv?=
 =?us-ascii?Q?lGuuq9IJaIS6CtFJggEqoEZ4Sr0JRCx/JX+UuHRkXCkNqoYqTx7Z+N4uv0/L?=
 =?us-ascii?Q?09V3yD9xO/dlXRd1CQj61jVHr/pDNumKCzkvuNLelfVGaeaQhU85MG3pIcsC?=
 =?us-ascii?Q?b52J4ekdmawYhiCRf/ksr7FHc7/iMQNIL/8k6P7D++F3icl2EG46Gdc+9jH+?=
 =?us-ascii?Q?4hVHIKzHEPwTMfiaQXLarcXQ4a38skR5VfMeKlFccHiCLsyulwpBHr0xuWxd?=
 =?us-ascii?Q?sc0cUHaVlDmsPPyhAqOh5laG/5QpAUTv6HqN63+/xztC/EVv0tT9Sz/iPOON?=
 =?us-ascii?Q?3+FBmSCFXYXcWvMj41enhy9i7EBVlgA2yBu1Z9Be3+REwUYE7GlWT+tjOm6o?=
 =?us-ascii?Q?kBnYIwYuU+opDXTKY8bKR1jo1/+731F4sp1Pk/tS1AAtbQiS1dC1gqONsJS/?=
 =?us-ascii?Q?f0S87f87bOrsIeKv2d19Acu7g75YYzEsKJ9J9uQ0bGNEOYfjEsrnV7ewu65k?=
 =?us-ascii?Q?28xHGtoeAmTEU2hkioIAlSPGm9LTCjBuk4byJnWcuYAPUp3g4jlAgrG/pum1?=
 =?us-ascii?Q?/GF5WOepNcmsBHHxmbOK7ySi+FNCvDZPWN3vN57FOxeuwhCPTprmDw0mDgjB?=
 =?us-ascii?Q?hYrpEKoHjmbmteZdPuV18lrTZJBWeB9lhr3qUFE2P1NZx9hR5vsgVUhL9VDx?=
 =?us-ascii?Q?sfhloGZBvr5Q4F5ZkEfedCk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337866b0-aaa6-4d4c-1024-08dddfb573ce
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10910.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 06:47:38.2899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cZ4+onNdewVQihuIa0CZuGjm8/6dcvvyWDVwk+3rYKHNk5MSrW6o3fcdHARrpovHPVhXcasOd1bu3ZIWEVi3nrnupnDf1ermgGQ8g1bL6DfbHet/EqSve3DS2CYwAfE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6963


Hi Geert

Thank you for reviewing

> > v1 -> v2
> >
> >         - Based on latest linux-next/master
> 
> Thanks for the update!
> Same comments as on the original v2 below...
(snip)
> > +static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
> > +       .name   = "R-Car Gen5",
> > +       .reg    = 0xfff00044,           /* PRR (Product Register) */
> 
> Please no hardcoded register addresses for new (DT-only) platforms
> (especially if they don't seem to be correct?).
> I can drop this line while applying.
(snip)
> i.e. will queue in renesas-devel for v6.18, pending acceptance of the
> DT bindings.

Oops, indeed. Sorry about it.
To makes sure working patch, I will post v3 patch


> > @@ -378,6 +388,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
> >  #ifdef CONFIG_ARCH_R8A779H0
> >         { .compatible = "renesas,r8a779h0",     .data = &soc_rcar_v4m },
> >  #endif
> > +#ifdef CONFIG_ARCH_R8A78000
> > +       { .compatible = "renesas,r8a78000",     .data = &soc_rcar_x5h },
> 
> WARNING: DT compatible string "renesas,r8a78000" appears un-documented
> -- check ./Documentation/devicetree/bindings/

The ordering is back and forth, but it will be updated with SoC/Board patch-set.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

