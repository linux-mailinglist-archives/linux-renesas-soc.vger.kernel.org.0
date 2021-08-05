Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D9A3E1C31
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Aug 2021 21:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242327AbhHETLo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Aug 2021 15:11:44 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:13664
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242268AbhHETLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 15:11:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZ84GTEJXrwO+nNovFNsv81bdA8xOY+F5LEaLuMWQ/vS5TkLSWN+Rchuu/giMVCbb8bDMglDVcMCg4FBumvyEfAhrFWYKHCPg/nttW1zL5hwvsdpoyRWSYLKpT8uBtctziqpddBath8TgS4BsUC8kJTdLGcnVFiYHeyeZczqA9WldprcDl/Wg7K3YUxt6uUWrKxeAn1J1lmGpSYEBklgYBeFuMiF/rykjrsI/wOb8kjiWukXHi1JkgQwwREHT70S1d5w5sUDi3t2VIf06ho0pscwaC8A48G3dKw9Nq/Nkny3xCY9v4Un9oIzM+fy1GiCXeNV5ZX9NzygOxumiu7FBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ichSrwDIg2yNUFGzmLmnb07X7BDhLnImWaFDVPGoNhA=;
 b=F12zY5AkkkfxMNmkdtJft3a/SgSvBRabT4ydQ+M8pCxRupB8hRod885+u//HEI2eMMQ2ANgpSJYIc1EfbjEMg3XVAT7W8oYifvQjqQLcFFQslkCpMQ4mO3gf+sSeYuiLEdOK5dG9fjohYmEXS6hxn0AFZnf0ZPEiFH0wadB6BeU7WATUcRQcjcwjBbDCnh66tMoa+5lPAuKa/BVzcPmC1Rr5oEEmOJtr5gAYE6zpyMdifdMO+jn/TnzAFqEmzklxL5qbaTYG9sANlQIL3V/FevfYrWoCT/EGHlcR++WseSWxdfeIPbqxpiVGo96a0gi5J6HBYdT0GpWH5zPBHg5DQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ichSrwDIg2yNUFGzmLmnb07X7BDhLnImWaFDVPGoNhA=;
 b=rFq3cQJSXbKzyV1dQR9BWJ5Zdep6PjlefIQN526PEJrhKeheDGEXQgv4B7me81pPBfqhFM+ZLNiwxglvjcad9Cp/5HGABz51kSw0WqZgsmg3kGAERtVbR82zsezwg4JgbC09D01cHfl4nThqpZP/ge0Ka/iQ6lBCVcRhkHyIgVE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5409.jpnprd01.prod.outlook.com (2603:1096:604:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Thu, 5 Aug
 2021 19:11:26 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 19:11:26 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] sound: soc: sh: Add RZ/G2L SSIF-2 driver
Thread-Topic: [PATCH v3 2/3] sound: soc: sh: Add RZ/G2L SSIF-2 driver
Thread-Index: AQHXhJ5wtXpwwps93UOX45655N82OKtlFXoAgAA7KbA=
Date:   Thu, 5 Aug 2021 19:11:26 +0000
Message-ID: <OS0PR01MB59222AB5E964F280346CDB9486F29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
 <20210729172311.31111-3-biju.das.jz@bp.renesas.com>
 <20210805153420.GQ26252@sirena.org.uk>
In-Reply-To: <20210805153420.GQ26252@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4920011-e33a-4d5f-15d9-08d95844d29b
x-ms-traffictypediagnostic: OS0PR01MB5409:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5409EA1FAB45041EA50C612986F29@OS0PR01MB5409.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z64Vr9d3EqCd1H8cP7Cy0ajCXJPd7yRggLnnK/lP9rafRaRBwtJLoyakG2ph/FghsFMifH0mvx/XaH0/Yo7DBq6ncnG/WVvC7UWMWnMC0c0yYhmScpXZVBVLtzHGpNaxlf6vSwRoJGjTxQCGJwUCMhHljhqrp3Lr+77zVVfMM0l0hEkRid/mKcYD5M2egkicwUvSzCqRTnONWpgyBOlK8zb4MzUOzuAn/ahqqBi6gyQCRVeJG7K/2B+Q7yM9p9h/6D+LufeJjJCpDcw1xyl7ZxrJuJW8yoLddGDeENjlopj6z1J3d1x97CAXh15FQl/XG+jBP9OuWcBCsKfh4+tjZfdsjEg+2mnfn9LHy+6k8EnNENFANWuQj2ph/kfCGXISnNTvNp/vW991e1b9Evvd0GXy+E89ZRWpl2CLXDsC0ylAsEgAyIPSRpkqh/cEVoe5n+ElJh3pobjbZddI3hiAkOEt+1VV8Jug41YxaockvOgwTkysmKDh1FeNFfdzBr6Y+AlzgjFT25LfKYrtYehi6IRne9AqTDVRUsvuH6EpSgsMjRo/6Tnw/zPKUFeYspij188I+G62izAaQ0l/wuv3ovmFWLClwo6dAf6vaULGqEcAw8L2nJNJ1aXVwh7Sl0ABXuSIgE5GDtL9a/F5Va55WjqizOSFctTO6iQ9pRhHukhbIsDo389k4cOA4hPwryT8Ot9gegq5kHaMcx2FjIVqvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(39850400004)(346002)(83380400001)(186003)(6506007)(33656002)(5660300002)(26005)(8936002)(8676002)(478600001)(38100700002)(6916009)(122000001)(4326008)(7416002)(7696005)(86362001)(2906002)(71200400001)(38070700005)(66556008)(316002)(64756008)(66446008)(54906003)(66476007)(76116006)(66946007)(9686003)(55016002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e64vA7YCkwMbLfYVh3ukbtCZK6cJr0UGx/mJudp8wy6ZsmQI44kooIMdrQJ1?=
 =?us-ascii?Q?z/luSQZVyRaMbOK6DKV9XJilQmi/jgFolFlCUGV05R6hkUDwCAZEcExbSgOX?=
 =?us-ascii?Q?a+3SvQQEHcebos9Yp8swRWwWag2XaxyT081AFS1U1mqD2umuV83Q32anohkO?=
 =?us-ascii?Q?/Jegk2a+cTVAsC4foj816nuxWIc9M9WCO4lbGOI+Tuwdlij7RLAikDsRWBOO?=
 =?us-ascii?Q?8ZCR8hYudlmm4hPj70yk46f9S/K7j+x2Z9wBtJtuDqGPuVOOLEkku8tJuk7r?=
 =?us-ascii?Q?aCBnj8z/JeB2+bZkejDdaRF2GShkck90qZDH6peQhiWeC6aS7K1A8JM7t61c?=
 =?us-ascii?Q?nrwGsePf9iQK0Apc5BO7g+K6o6jlDnNgf5vUBEmDSujrvETnK8vppToqiQZ7?=
 =?us-ascii?Q?FEWCexTl9Pt7eQEg7XO9S2Ij1faTvtjBnm9zvn0OzeGvbfDLeahf41aWi3YG?=
 =?us-ascii?Q?esaXTQvsEdUK8QZ315cAKSHQy6FMtyW6E60KcRBuKnI/8Grwq8JcXwRCrHj4?=
 =?us-ascii?Q?TZuuqwY8Fy9TJLXREmFh2YwpQr77xf7TApkjrz84bo2WOMCNzMbwwi5QjQHd?=
 =?us-ascii?Q?7qVsJKav7kSDNPAjh2dupRlDeFGptbZRexptRYqfd/jZ7ijj9gpAgyGUljl8?=
 =?us-ascii?Q?d/bIeWQdJ3fElVJVrtrqWVXZged5HMs4C2i9EvpRTJLRZYoV18VyVOEVIP6D?=
 =?us-ascii?Q?lf3epI4w9QiUrav9GMRbI6EZ7y6K0f9PMEBHGHMcSUgzmXNZ0LRzeAeagKYa?=
 =?us-ascii?Q?Fxqfj102ejMkwn43OFt7L1lgPPlxRsTG2D6UNnCeOYsOtJ1bAlpgnddfsngU?=
 =?us-ascii?Q?LL0kmiuQW76pZaXKs4w00co2baYvxIii2hujHj8EGo6gfp/8OdXAWJuryUPg?=
 =?us-ascii?Q?fTIP2c23xjXKs2kU5+iN50hus9oaRHu3GNWFUY0dxWf9zXTKa8wlXpmdZUet?=
 =?us-ascii?Q?I2TORDmQ77IU57q0cOeeWJQwgX+n6S8p98WyOPBnJDTUi8tpf4SZ+1SWSQgM?=
 =?us-ascii?Q?VMylWcLV4kWpE5yoUuSjW1FRuwyeGCdEgNtjqZksD9CLeCdx/65XYseaLLj4?=
 =?us-ascii?Q?nejaWVQnN1zNLXHuwasxn+MJFPG6IHtCLmksDhggGTUkNW7Xea2fLBEMxocS?=
 =?us-ascii?Q?v5GSQjl2CxWgGL/ou0fCVUQDAsMRDQd99QQoNEK8GXDmuNOnvqbgtrFgsSxt?=
 =?us-ascii?Q?Uk7PkzU0wJzAoaBxsEKHVkwLYuNej4KnP8UX0J4HONvA4sIHcOfAcXPlTopD?=
 =?us-ascii?Q?ZOSwKYxm6RiZdd0L1eeS+otb95ZWpjjVLACKd0vsj/tTykV7rxY5FLyqLjbc?=
 =?us-ascii?Q?+egxZUV5cX1XlMQPa28KeZFM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4920011-e33a-4d5f-15d9-08d95844d29b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 19:11:26.2103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNCOEIFWaer/hNcOtJRcEv0Le9v9pBfoY0k6BX/MwRTR0LxsdvRpPUNXAmuuRfF9T5c37KUb/q9/So4qnnnFgIAQgS7Juq+dpyM0z0AYB+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5409
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

Thanks for the feedback.

> Subject: Re: [PATCH v3 2/3] sound: soc: sh: Add RZ/G2L SSIF-2 driver
>=20
> On Thu, Jul 29, 2021 at 06:23:10PM +0100, Biju Das wrote:
>=20
> > +config SND_SOC_RZ
> > +	tristate "RZ/G2L series SSIF-2 support"
> > +	depends on ARCH_R9A07G044 || COMPILE_TEST
> > +	select SND_SIMPLE_CARD
> > +	help
>=20
> Why is the DAI selecting a specific sound card, and if it must then why
> would it use simple-card and not the more modern audio-graph-card?  The
> select should almost certainly just be removed entirely, this is not
> something DAI drivers do - cards use DAIs, not the other way around.

OK, will remove the select.

>=20
> > +++ b/sound/soc/sh/rz-ssi.c
> > @@ -0,0 +1,871 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/G2L ASoC Serial Sound Interface (SSIF-2) Driver
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
>=20
> Please make the entire comment a C++ one so things look more intentional.
OK.

>=20
> > +static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
> > +			      struct rz_ssi_stream *strm,
> > +			      struct snd_pcm_substream *substream) {
> > +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> > +
> > +	strm->substream =3D substream;
>=20
> > +	if (runtime->sample_bits !=3D 16) {
> > +		dev_err(ssi->dev, "Unsupported sample width: %d\n",
> > +			runtime->sample_bits);
> > +		strm->substream =3D NULL;
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (runtime->frame_bits !=3D 32) {
> > +		dev_err(ssi->dev, "Unsupported frame width: %d\n",
> > +			runtime->sample_bits);
> > +		strm->substream =3D NULL;
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (runtime->channels !=3D 2) {
> > +		dev_err(ssi->dev, "Number of channels not matched\n");
> > +		strm->substream =3D NULL;
> > +		return -EINVAL;
> > +	}
>=20
> Why are we only validating these here which is called from...

OK, will move this part to hw_params and validate there using=20
params_channel.

>=20
> > +	switch (cmd) {
> > +	case SNDRV_PCM_TRIGGER_START:
> > +		/* Soft Reset */
> > +		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
> > +		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
> > +		udelay(5);
> > +
> > +		ret =3D rz_ssi_stream_init(ssi, strm, substream);
> > +		if (ret)
> > +			goto done;
>=20
> ...trigger.  This stuff should be being validated when we set parameters
> in hw_params() and can usefully report the error.
>=20
> > +static int rz_ssi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int
> > +fmt) {
> > +	struct rz_ssi_priv *ssi =3D snd_soc_dai_get_drvdata(dai);
> > +
> > +	/* set master/slave audio interface */
> > +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > +	case SND_SOC_DAIFMT_CBS_CFS:
> > +		asm("nop"); /* codec is slave */
> > +		break;
>=20
> That asm("nop") looks interesting...  I can't think why that'd be needed?
It is not required. Will remove it.

> Please also use the modern versions of these defines, consumer and
> provider rather than slave and master.

OK, will use consumer and provider for the above macros.

Cheers,
Biju


