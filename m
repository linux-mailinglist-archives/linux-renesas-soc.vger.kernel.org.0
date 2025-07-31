Return-Path: <linux-renesas-soc+bounces-19809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668CB17831
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 23:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 490EC541E97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 21:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5925D23ABB1;
	Thu, 31 Jul 2025 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OelQScBx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089A21A433
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753997316; cv=fail; b=fUdF516w/nWkNXdhT2BuPLyUygNWhTQbwbdIp3RdsPc6TjGlcOsXtogmSH8/2Taj7rN9b6Sl7e5ygYPEBgJEsV0f4mfKdu5FR5vwdku5cLdNUeYPcecTN9h4f48BG7rKOO/yPeEvHn27Cat52m/0IQENobbbo+ZkLaM25MFgyIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753997316; c=relaxed/simple;
	bh=7/0chSLgzSa+a3f50tWBNfoejvOe8q3Tx0Xf0KQTwC8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=We/IzhCNhFW6Domp1AjjNrMaZ64bT12qINo+AY4IM9BwnUYaUAmtITt9JGTCmsP/qdu+TqZKovtRZS7ohJ76ZakkkdQD8EvnSxCAZ+vYdO8uWdG9VOndwRlY9P3AdQ3mvpu/3zDGClkPYPlSQZOVUyZEt8GDNHFcWD+KfXoVpBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OelQScBx; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2H55ekSVMIcyr0d52U3h2MaxysEVVDpZ0v8s1gHj3Rtwa1ZuorJsYf3zV5KhriJvFYssgxG5//u7vJhVPmeOhj9/ZC+SKuuIG/Q21SvP8bjgdIWsRe8/Geewn7CLX0nMTbgvPy4ArNYCaEVqc0zKWtv9TSDTITGIObKm31No3M6AOqEO/GrKN8bj2ZO/4AXGMBO245vB+cUaKb+z8s6ZYJ+UpuwwHKmyR1offMMmpbP9xeXQK5tJlcl0VMRGmF1O3s+IvKeIDQFeN1SvosT521W66EG1PcJCr74W0jULpEqgI49kQp58CDZ9UqYxxzkDsRpYcc9tLnqnMDhykERBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF4WQjvhiJIn2iNcxlhOw+T7kWcaUbThIXffliFXHE8=;
 b=o5rxO6633u5I3wrEDigqV5OmKSQS+yfbsg60lGrVPbrXe4xyTrllOLZrdz0MzCXKklKUzsSOIM3Z+edOC9R87YtUcdNygVshL3TL67g2XCUYNR+2xkZKai3/YGsEpx7hP1rlc2QMDQ8uunDysVJLpyVnegSY2IuS5dFwOF5wR0Zi66mDhN8ABM3i67tKDeRBlhA40+bTYlZxcEhfjjGx3vAeZXIoHUykooCnOM3zv22yYeHRpMMtDzl2X9BgS9StTqrHuruSUdC5Lb3JM6DZaPWHjjH/Ps6GEU/gxpal7I5/6SHnFAU6RfRUxP6tCdg9JNY0Ht91e5D5PSungswqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF4WQjvhiJIn2iNcxlhOw+T7kWcaUbThIXffliFXHE8=;
 b=OelQScBxcQsETEK9pMPLiWNy+CpxoTojfPk0TU+MB8rggYd11KPgSmsvPzjKtIO9//t+pOgY6Yzk6Y/9SigakqxJSw8N2MCN2ma7vjl2sx+AQHI2Hq5OMnMDRyc69PirHYzjBwFtpXJOxU6bY/M7Iys8yJq4mS0W5jBSOjtye5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7843.jpnprd01.prod.outlook.com
 (2603:1096:604:1b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Thu, 31 Jul
 2025 21:28:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 21:28:25 +0000
Message-ID: <87cy9gcao7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Huy Bui <huy.bui.wm@renesas.com>
Subject: Re: [PATCH v2] soc: renesas: Identify R-Car X5H
In-Reply-To: <CAMuHMdXrfGE0+D=1qNMCkupaotZjYHi+X=LU=Lp7You3VpzLxA@mail.gmail.com>
References: <87ple33aar.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXrfGE0+D=1qNMCkupaotZjYHi+X=LU=Lp7You3VpzLxA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 31 Jul 2025 21:28:25 +0000
X-ClientProxiedBy: TYAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:404:14::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c4c317-aa2b-4e14-435c-08ddd0792ed3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PcyekURple/0Nulpd9utTtc9gTIipotpZtUX20pYk9XYOxXnrjql17owJ43T?=
 =?us-ascii?Q?BigPRwBNGsxLfnAt4952IGzv+i6EkGo2sb6dw3+uqQt2RBMpVgSaJ7ttOs53?=
 =?us-ascii?Q?4nNjUIv3SHynBQ+hgeu5CdclvBDqINipm1H/sqOvWWI2/eEYa9XnEMNLnknb?=
 =?us-ascii?Q?uSnChAwJPAADeetMWKAMLHV7PWbzrjB2SEH0qdeO771CogyGWb4H1m5Crycs?=
 =?us-ascii?Q?+UbS+n5EUuw3FBxQK8dXY5Y4doM7UOg31hH7GFLD1RdIgy+gwPOrau3HioVO?=
 =?us-ascii?Q?6lBHuRbDmHDXRvseytyVXeZqcm6RWl1IUjTi4rKwkBhhaKt7xZfHdi9e3HtM?=
 =?us-ascii?Q?+sN72rGK/V4XIhfM0pDbbMo8Ews8Ye31yVjRQ6rYiAehd7PiCIJENmzfgxr0?=
 =?us-ascii?Q?8hukNVIyGw4ESz3bkGXiURA4tQa53InciLA9F04rOsw79BCiGlCvTCFIDy9H?=
 =?us-ascii?Q?gPt15w9e+ykisoQzDCDs/vOQ64O7JQqNe/D78c79eixKcuxBCb1BimjEJUNx?=
 =?us-ascii?Q?2UDjMgiGvuQ6nMs7Irnb7HsDNj8kgu0++iQAlksE1IMvso6+UTIEv29OFxEB?=
 =?us-ascii?Q?pHAZu6i1i+f1B5uf9M6+0QGoQOrP+XG2THK+KPZuOVYRQoPjbNI4AuD5xc5y?=
 =?us-ascii?Q?I6dpd/35341cMX+tjer20dAIgPe7sfXIfh4XLAxLVHkehtCySctmF35S+hs0?=
 =?us-ascii?Q?1cWdfWXitUZ0FuIG+XqKFt3usb0QT5g0/4iaWxgP/HIIojWyN02e6lkjczz+?=
 =?us-ascii?Q?aJ5cekQYA6+fdOxmq9YoPlY6KaJ5FB/aPOPiL/KK5sg0NfPa72SnO5UdR+Dr?=
 =?us-ascii?Q?xxk4vWHe8ZFbLWb9b272vX0puYetfLutE/5hsgZXiYBQTIqmJahY+VLHjech?=
 =?us-ascii?Q?EQnWLT/W+EMdDzrgvRRvWzF74eVnhU7jGd6L7aQgqP6GxEyz6sFTUvTKuD0A?=
 =?us-ascii?Q?HNEmUvc+cFD2Anx1x1NthzsoL1iJ+8gmP5QfM1iCOCVq0kNtXLRKSWmGRcNw?=
 =?us-ascii?Q?+2GKqOrs7bNf4yy9IxDF4qdUOME2e2Ph4nkt2/O3ZG6Ou09UF3t79a0e4oF3?=
 =?us-ascii?Q?Zr7r6bxf3liXLbd2N/izU7niM0+so7yYJNSB29wlBX01YjPDNanXzX9/ozI2?=
 =?us-ascii?Q?BKpSIDmphMmYinD7hB4VqOb0LKXwV5AK1jO71zHkJD+tv+UGINtLExIueO0M?=
 =?us-ascii?Q?POLiIKdiklJSQW4wLF1oBevkxyyWIAS0qqt4tUzgYmfFZcxoBF1LRNf/awc7?=
 =?us-ascii?Q?VtTChmUr4K2Y5oDB5AKlCqhGQcx9MOdyhWWPOIEhx7A+JpePn1ewWYlPEzMk?=
 =?us-ascii?Q?l/eaNPC+ziSuXGqIHJW6ljQXO+vtyXeR9KHel3CExzPYFkmA2ZfLPNhSJ1mI?=
 =?us-ascii?Q?3596zKtGWyUlqpayolEJbIMmXsozJO2p9dlFSk3tDfI2YBqjtu3fWdhxx8Cp?=
 =?us-ascii?Q?D4rs0bXUKzzAuczPgcAmmXMswH2mO2KB2TpmL1E6EKlrZvGC6WAFsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ra+HlybaFPvvz+s3woRyxJ5boy0stcGcv6PXIEbacvIoH33rDG3MD60vwOcQ?=
 =?us-ascii?Q?ACOQBH7siPf7fTOWAGGKzSj2Om97dMFZlZ50s2WrdgW/czN+puGDsiD9AakE?=
 =?us-ascii?Q?nA8Z5rH4z4WGZfqRIWdeD5L0L4oR7DHmvO5EzPBaZtmh5/iiEkzfWllaeuiG?=
 =?us-ascii?Q?90+kweGq8FaLKNQCnuTs6YAbx6jtdhjfog2X4fidrNUjLeQ8PT42IR0Lc00Y?=
 =?us-ascii?Q?5O2w+cQSezX0wV/Db68p5KJMp4WwD2BDLBjbaJvjIMPC0aAR3JlEH4smHOuA?=
 =?us-ascii?Q?CTI/rv+Xfmbt8ahMRFLYSxVxGl2iZX7EgA7X41P4qqLXkqUWkQSn2Dt6EVOR?=
 =?us-ascii?Q?genevDFB9f8cpcDn2yQmtcrrnNwoxhzIij4zIMQ67DlLIjfJkOMWRXzx19Ns?=
 =?us-ascii?Q?TCsTZT22n5oQeuWClP8oDaRFgXsGn4qIMS2Eo1oBubkFI+xlTFPt7+f45tXp?=
 =?us-ascii?Q?+0uZShrTCkzkHE9mJy42xXRae2y/y8MbfA0pmri+6zDfE2xz+o7Qi2d9meTK?=
 =?us-ascii?Q?ljheZsn/t1OzBi3vlBsQxk12Nt55wupy871usxuaIuDLRFWjadXL7FjHj1ly?=
 =?us-ascii?Q?RvkO/Xi8NXbFYZVwXP5hOqcCVpciSJCX+Ro1OVaX9GhafCAm8ettg+z46Re7?=
 =?us-ascii?Q?L16WP0plSgukT1PEy1qKzwMA3mIrkOPC4giWM1gkWo0Wnj1nyXWhuxg3G6xh?=
 =?us-ascii?Q?LEtYpGP4tGKBLbM34+Lnv8Y1UsEoQOn410nNK9z3qK29DK+rJXcA3FH9S4H8?=
 =?us-ascii?Q?+HUFX/4u5wC13Up/sv8E2Hyk4k6ZLvf35aAOvZPvorUdZAmjkAU5F675bSod?=
 =?us-ascii?Q?9+WB0lO6OGDaM5tNxXmLHXvOmSNRLWMWomjG3NKfRHfeeL1uXkJf37Mr0Zw8?=
 =?us-ascii?Q?x/JMoZdb8I9lWvcgGUjV3q6gRrxZ0uWa06YvFr3LOFxRpb5k0E0p4AF3rBlL?=
 =?us-ascii?Q?CjSkJsCvHI41gf6yN+e5wy0/uP9Lw3tBMKh2FA8VxD+EZXhjN1HkzbvM35rN?=
 =?us-ascii?Q?riVBLx5PQwCGqCYhC2Iq/hjd+YWaI8mlYzPZ2c0Ls0+Mi4ymQi14+Miwp3Ff?=
 =?us-ascii?Q?E0dfG8puPiHeuXpXg1SzZI3uZUy9QWjxFy7W9LY4IWs8xJP1kM1BJfSnOq4L?=
 =?us-ascii?Q?mgl0PQo5zyE7xwkLqL1q02BX5VNtWi5b6C3tmKQQoBwUA3suRSv6KJOH1zA4?=
 =?us-ascii?Q?Gr8r/ofE3akDuCm0yzjgRVCbwcgxsn5KyDIyYwO9PhwiXD7aEeECYub8s1vk?=
 =?us-ascii?Q?RBM++khfekVlNEbeNzuc2VQBA4yb0rtQ2fbkOopmV0OqQwag5pO3a7/rjY0h?=
 =?us-ascii?Q?jTMRZoiCeJihA7p5HfckFnXA9LZSNdpDQ/BHV8kvyktwZFJs7q6G4HaPLMAI?=
 =?us-ascii?Q?U9H0S2Jrkz7EM9J8V2gMZsbKbPjWio3h07AqPqelvjwrsfWrPJOzEJGsWtpt?=
 =?us-ascii?Q?xDEDkTkIA2X6EGmZUQiNs2cDwnQnqdBSTJCbnz8uP3b6w8b8Gjq3OIkPuqDX?=
 =?us-ascii?Q?aGH8xwSfZZeNj1sEOSeTNZdegXTUvXzqEjCONjYBk/g3uTRBkiDN9Srq2k9c?=
 =?us-ascii?Q?i1l1UBbu6N2LcdkIZ3HmM1LMSCHH7lHOVLiqU6wK0S5hN9iBTy9uebHzjGJm?=
 =?us-ascii?Q?/9UUODchxzydbOhf9r9hMb0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c4c317-aa2b-4e14-435c-08ddd0792ed3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 21:28:25.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prG6EWnKPWvL9QvmrTjcxapP5Katp/a0BsbRLX4wQj/MTG3eCUHB0Z/V8MmyHhsb3+0C9X88pmxwCcX+mOg0rn6TmTcPcRl9OKv040W/7ji1syUarx09ZqQkEVT7cMKP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7843


Hi Geert

> > +static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
> > +       .name   = "R-Car Gen5",
> > +       .reg    = 0xfff00044,           /* PRR (Product Register) */
> 
> Please no hardcoded register addresses for new (DT-only) platforms
> (especially if they don't seem to be correct?).
> I can drop this line while applying.

OK, thanks.
Will adjust on DT side.

> > @@ -378,6 +388,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
> >  #ifdef CONFIG_ARCH_R8A779H0
> >         { .compatible = "renesas,r8a779h0",     .data = &soc_rcar_v4m },
> >  #endif
> > +#ifdef CONFIG_ARCH_R8A78000
> > +       { .compatible = "renesas,r8a78000",     .data = &soc_rcar_x5h },
> 
> scripts/checkpatch.pl:
> 
> WARNING: DT compatible string "renesas,r8a78000" appears un-documented
> -- check ./Documentation/devicetree/bindings/

Sorry I didn't explain about it. Yes.
My plan is update SoC and board DT DoC in the same time, so it will be
included in next patch-set (= DoC support + X5H support + Ironhide suppor)

Thank you for your help !!

Best regards
---
Kuninori Morimoto

