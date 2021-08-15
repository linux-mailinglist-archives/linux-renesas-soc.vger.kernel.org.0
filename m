Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BA13EC7C3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Aug 2021 08:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbhHOG7a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 15 Aug 2021 02:59:30 -0400
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:25765
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229752AbhHOG73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Aug 2021 02:59:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYphKDPmtrsH+DCl1xlZfCmcM/tO68YsMCApQe51XrVe0LcvyzXE0ig0TI30AiDFaLCph2HOkfQHvfBQtKFxYBuMU26uE0UARMeh8INoerHs9KflDDPq24xXDvVozY2zJlxzmsG5hXjmp8SjVmFfVKOo2d84ifJcOxjzhS3v0BM/5/AJOrrhu0aTdLjhC7eUaH911gOTmRbkRdX09V5l5X6mKJSTl6bg98BXj2G/jB5+Hy3OKCxuFYukub4+mnzg3FXu3TEMTOouo6ampLvfuYE4QkCUNCVRvWVPFQj47sXXHsEyTfBlOlAZvUq8nZATNtWYx+wadY7fm2grC4hVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXvYfVJ5M0FOULhO5IWRXoGlTSuHmj7z5SmS71jSbUs=;
 b=OMBQgG9aS2BTdaBDZcyLvc96idUk844yvPmN+VPo18G3c3CUYgznkOK3cX7oSmiBZWgEiAOi66gf84bh2kitBATPwkY/rn6HPSQ0jWmV0bD+TjOTYOMdewQhO0WCokocztpW5fG4KvjTRCcfT7ZjYGZuQUFakNIF4oOqy9rEuk5FQl0+jW64tubFiGUpOYLXheAWj40Ts8TMOSpFmQgFzm0pVSB9gpHiNmOUP1DSeRNpU3P9ud3JSc/cbPKV61z7rzad2zRP+yUlyNY2h5f3u+lXePZI58pG7pT5+JhAuynCs1EbtqKd7OCWMK2mtLQi4EuNQ8ZVyqmsF2jCLeLs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXvYfVJ5M0FOULhO5IWRXoGlTSuHmj7z5SmS71jSbUs=;
 b=JS+2ujpVc9r4938VIF7IPNFGfz0NbaLB6j20RhNG05CV+0LMZHYYaTs8cY8XSuJquCDD9Ij1TeCq2Y/s4RkUivGuPL8dfh1joLUKf2CfNPbh+gybk/UsR92ZW1v3zd5qb158MecuLz0zCZxisG4n9H1F3EFK6kIYqGClMZKvlw4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4801.jpnprd01.prod.outlook.com (2603:1096:604:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Sun, 15 Aug
 2021 06:58:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.022; Sun, 15 Aug 2021
 06:58:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ASoC: sh: rz-ssi: Improve error handling in
 rz_ssi_dma_request function
Thread-Topic: [PATCH] ASoC: sh: rz-ssi: Improve error handling in
 rz_ssi_dma_request function
Thread-Index: AQHXkRINY5ngU8SFBUyYSTmg1ns9b6t0Iuwg
Date:   Sun, 15 Aug 2021 06:58:53 +0000
Message-ID: <OS0PR01MB59224FD7FDB1E14E94D9396C86FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210814134106.14275-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210814134106.14275-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52d0eac0-3869-4edd-c000-08d95fba251a
x-ms-traffictypediagnostic: OSAPR01MB4801:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB48012070961751486C68FB5386FC9@OSAPR01MB4801.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mkusnQOWp88mULpS54Wif8ahwJzfE/tsX2ZOEYWKaV6x/d7sZa4CBgXqR/sPGPoFqUJiF4OcUEvkjvdn2RrhiJ9muTduMBC08cGcQa51KwyolYsw8X7Zc/EagMs330B4fcpY5CwoMJsRpfP3gwwYf//d2N7dId87Yg/tXfXrbscJj6KzmlE8mSYfVfDaW46U05cg2dvNEIDrT1iXsxLcwvkl1AbY6FPAxxvx7qlyT5LDyGKMJJkvy79iE3TrfEWiQ33ZWsEQsoK1WhpBFEkM3kcpl9UN7TTMoBRfBivFLZAtFmjWlNzp/WM7orTa5D0j50G+oxw8URejslFeEWalWrzSv7+yraBwuAtSXIBLyz4SMwwc7Zj4l9R4QfTxr5Q8zI8/v2tLbCLuLwkg8aT0VlEq6xPG4ll7VZANk1UAGJFbQ/PYTsc54Ia3kOkDoBrWKIdnCsut+PoCW6rcDqk16aRAD4I4aRKnEsE58GwA5Uy5uDcCATyv4V25RJ7ZvHaMrbpt8gKVacxyQRUDFrAkR0y5FtwIvl3WUbWIqQgTeOqI7rGNscS6ZcjPP6BbKbc8wqxfBreyITWkig9iuDacQhBWIA+fLYnn7bGIpq+bZBBw39/xclrouLcj5ByItehdkW7/GX8Pd+iaLfpTG1NCma36apvaeW/YA1FsK3YgWm1aGzCeN5KXBg7yM2Hl+kFN7JH0LunaBeI9MmSAl9Lp1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(376002)(396003)(346002)(38070700005)(8676002)(71200400001)(55016002)(66476007)(8936002)(38100700002)(9686003)(110136005)(66446008)(64756008)(66556008)(66946007)(54906003)(76116006)(122000001)(6506007)(53546011)(83380400001)(7696005)(52536014)(4326008)(186003)(5660300002)(26005)(2906002)(86362001)(478600001)(33656002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hHMXWGG57dFlDxznO4O5/rZTF5CmORSA5C+4SWqvsvj5vQ9pKWW0vwY3LxQl?=
 =?us-ascii?Q?nWQss6TCl1Kkf5luXKPKBU512/bFnJXxGKryC9Q/SEfRYF39z7+kxc1wRhDf?=
 =?us-ascii?Q?VlIb/UKtIma3YxjgSAlFDz3viohOVQ/KKnuQLIlx8ocvpoS3JMwRn1IoHkuJ?=
 =?us-ascii?Q?2PKxicDaAeV/1rwAYydYcGeVaTEat69sDFL4lx8PCB3WU163MP867+kS+orV?=
 =?us-ascii?Q?2lE3Duyi4b8hCayNipDy0rVR3zUNwy9X8bJ+fdPPvUL+C5VP+CfpWS13dZCr?=
 =?us-ascii?Q?Q8u4sYbtG5nrBczeLTBLIFQAd7IpsHSmaMXegSIqLvv2UZM0PJfeSn9eA6wc?=
 =?us-ascii?Q?kSjuARuCePLHJkBH8d+KQaAeGbSvSWOHVBpVEFTNAlvj1eeSg5AjkP/ht+/r?=
 =?us-ascii?Q?+txglM33JOlAmBy7kMFINB8OP5ncRi7CtRQyy4zln8YerG68HKXAVe9qV3hO?=
 =?us-ascii?Q?a+Wm+EMgL3v9Hkcc5nmpGqFWWXh7E/SxU4eKrR0lq3abIcC+4AHtdwSj9G00?=
 =?us-ascii?Q?/XB8ixqDZV+PPy2ZbRZnwGhA9cUtJju9Zgq8vVBH9C5ftBu0FAf8jtgCwn7b?=
 =?us-ascii?Q?QjXGTqZIpUQm+hqG2Z3wCvIEurmaoT6b0YowqPM/Hbsv+fq7m33iZ8jLd4rG?=
 =?us-ascii?Q?+6xkOc/TTQhIbNVJ6Q+k/2B3i1fhOX03mRR7G+s+3OozR5UsLXCQaP8ATGuP?=
 =?us-ascii?Q?eNEb8t3EUHnQhGq2SsOYhPtCgf6cn3DJJoXrIH657JEtZ9JgqvN6TCH3od2Z?=
 =?us-ascii?Q?qeSfgyf5L5OlQ1r2+6Dv55yU2xnxJEinFvyA9Fbb9xHrL69h4bOyS9ZJDlM9?=
 =?us-ascii?Q?yQfOFAKiVzQ9rYdDnMMGw/194gMwwsaEEY6TuRmoNpvBxCi1XIYHfFvVcrl0?=
 =?us-ascii?Q?GERKgouvsCcX3nsXLc9AMd6eSf6soQte5cbf8rkd3HiJatNhq1KkLmiPtkI0?=
 =?us-ascii?Q?GH6EZFgyNhyrfQ6Q+cKaOeWbXK1cif0m+/ZSH+Dv+F5GnZOmPBKYbjignDg0?=
 =?us-ascii?Q?dOy13b0JilI65iedSjSh+qNrnVqPmYPugmB0d8vEI6ammub5ioXE/a8HktSk?=
 =?us-ascii?Q?7BnWpqvNb3MRv32GZYo1EPhdEF68Pf1GBsCFJI/XCDJKA8YmnYyrPDTnBpb8?=
 =?us-ascii?Q?3X+5AhXpdm2eyqyw7qux6tg1Rtu1o7OtdYgckyIoWrymYzfOxrItfpjBCXZB?=
 =?us-ascii?Q?9BSMEugjo1KY6Ami6gsM/HSfZJF1fo3zIwazhG5isoTGxRZUV26mf/guHh9S?=
 =?us-ascii?Q?HS7XRyXmi6deJJCCeWWrCiLBWre21658pXDJRBk04JPuhLE5Gc3xV7e5aKoH?=
 =?us-ascii?Q?Xof7I30ie2+8T57I5pOKaNsX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d0eac0-3869-4edd-c000-08d95fba251a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2021 06:58:53.7386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkgjvXuXT7WpbAyGo+ZxdsTdILhvFzS80lRnP3MkLwl96giijWIP0IIFVj21V83dHOF3ShSvjMZyHrdFTSVZYC5LfQklHeb2g92L35gDE3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4801
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

I have send v2. So please drop this patch.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 14 August 2021 14:41
> To: Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Liam Girdwood
> <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>; Prabhakar Mahadev
> Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; alsa-devel@alsa-
> project.org; Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org
> Subject: [PATCH] ASoC: sh: rz-ssi: Improve error handling in
> rz_ssi_dma_request function
>=20
> The rz_ssi_dma_request function only checks the NULL condition for the
> value returned by the dma_request_chan function, but this function can
> also return an error. If it happens, the subsequent function call to
> rz_ssi_dma_slave_config can lead to a kernel crash.
>=20
> This patch fixes the issue by checking both error and NULL condition
> returned by dma_request_chan.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  sound/soc/sh/rz-ssi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c index
> ea8d33ede5d2..3867e2efd3e0 100644
> --- a/sound/soc/sh/rz-ssi.c
> +++ b/sound/soc/sh/rz-ssi.c
> @@ -676,11 +676,19 @@ static void rz_ssi_release_dma_channels(struct
> rz_ssi_priv *ssi)  static int rz_ssi_dma_request(struct rz_ssi_priv *ssi,
> struct device *dev)  {
>  	ssi->playback.dma_ch =3D dma_request_chan(dev, "tx");
> +	if (IS_ERR_OR_NULL(ssi->playback.dma_ch))
> +		ssi->playback.dma_ch =3D NULL;
> +
>  	ssi->capture.dma_ch =3D dma_request_chan(dev, "rx");
> +	if (IS_ERR_OR_NULL(ssi->capture.dma_ch))
> +		ssi->capture.dma_ch =3D NULL;
> +
>  	if (!ssi->playback.dma_ch && !ssi->capture.dma_ch) {
>  		ssi->playback.dma_ch =3D dma_request_chan(dev, "rt");
> -		if (!ssi->playback.dma_ch)
> +		if (IS_ERR_OR_NULL(ssi->playback.dma_ch)) {
> +			ssi->playback.dma_ch =3D NULL;
>  			goto no_dma;
> +		}
>=20
>  		ssi->dma_rt =3D true;
>  	}
> --
> 2.17.1

