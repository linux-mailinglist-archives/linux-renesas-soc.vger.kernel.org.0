Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3734F3E2A82
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Aug 2021 14:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243739AbhHFM2x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Aug 2021 08:28:53 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:17184
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243697AbhHFM2w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 08:28:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzW4zKK0o+pG/io3YGeXF98c3b38p/dnZkxQ41ODxOpiWO0GILWuYqIvr/u7H+xPUOAW+Gf6MIxXHQpgPMR+fFHKhUlIUSWh3hJFBmkSgkxruFUAlWWYYtstJxNl/xtZFb7b8Xg4cHjH5KyB0FR6BsoiJq2mPmwck0FwwW70CzhPyb5cWvFX8nDzu3DPrp9qZgY/LcYR8F2AAmBGTs3+nisCX9MGPKVFG9nybMMzuQVoJuv5tr43TSds4pj2IcwQQhNrYIIlMilz03jIa34ViDSSIZEsG5nTLsHE0eLfZo1AltBXerpKNAxCxfwqypztqGgEvjPLWq9GWxKlK/OfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7wfBNuLwNlSQ0+d5GTRV74CACYVFWfVN2b0eQJGEVg=;
 b=XbSMBuqEMjKPGCKM96mkUBvNxrhajheo66nVUYBcQjNAh1mLrzj5ejsqJyaNRNtlAHYHjh+Ry8R0K691tYAC4DDn/isAIGb302XDVEXm1JK4lafGE8ialzYw2H0lH6OiLjb8k6ENtBhNsTyuRDLwgSi9oPyy5PhjcmeGt1O4cJ+WSbfevX4VSUXzaa4nA3i5RSFTrTo7EZsVAxdQEFUwbjNU1kPZYlXoMv5DUbPYroBgYJ455dCp0fI9NhmSU+xOxyhJenRJSgX93uOrcjWY2Il/xfeB/lYborx0GkTNOFcGMR0fObtXzY0uk83+e0WfIG3GIc7NyCpbALYtxipblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7wfBNuLwNlSQ0+d5GTRV74CACYVFWfVN2b0eQJGEVg=;
 b=Qpj0LL9Xxu8P3gtHFPfBbdw+U+VEwXrNagE9zr/vZhrYixX/a3pJJqYg0R8PXO1Omp8HLnMTwne+2G+tXtEobV9tnqRpQQUbxpSbAPCgKT8XQmZulARn6b9NYFA8kCG2d6yKHGzC33pNldg6nXTW75m1c3c1PCHKx2hpxAvACO4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5842.jpnprd01.prod.outlook.com (2603:1096:604:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Fri, 6 Aug
 2021 12:28:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4394.020; Fri, 6 Aug 2021
 12:28:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
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
Subject: RE: [PATCH v4 1/3] ASoC: sh: Add RZ/G2L SSIF-2 driver
Thread-Topic: [PATCH v4 1/3] ASoC: sh: Add RZ/G2L SSIF-2 driver
Thread-Index: AQHXiq36OuYLqS0sUU+zpfyOWsgWt6tmVtyAgAALnHA=
Date:   Fri, 6 Aug 2021 12:28:31 +0000
Message-ID: <OS0PR01MB5922A39CBDA225F1CA79B39686F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-2-biju.das.jz@bp.renesas.com>
 <20210806112759.GX26252@sirena.org.uk>
In-Reply-To: <20210806112759.GX26252@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a480573-d888-41de-1102-08d958d5b402
x-ms-traffictypediagnostic: OS0PR01MB5842:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5842FB610EE103596FA41E5D86F39@OS0PR01MB5842.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R33b+sw3KD2JC83SKBV+ZC0QlMHIXncJlnSSDbe6FdZjtg0q347L6xmhjPtKPwYP6j8dxsR9rkm9lbNHfu/hb/L8VfZhJkLEE/tnvmH0+7x07TqJT1dl4jnDVJR7IJ+qIeU3RiNn1GbpQam0FfP6X1OT2Q2mV0KFzg1RkS92LSQbRYVyMOmTqHTIkD8RVD+xHV0gtQymd9nNIzmWE7LA1nrrEu+1Os11SwQIKzRGs6hsx8kK1rRk9LBGHSXE+X9tFZuTI15fGqbfnLDqXjpsdGKQCWq+JSaj1bVpQJKum8EbX0k1e0pT7rSYhD8afFjpuN+9TPuN1Bqo1wbu8mNTrq0ibPSBMRPRVsKXHvjGZNSLGRnDxNZdpS5VN98Mtxorzhae4gJzqm8iPOHo8IzqTNnnKYKraZPFqdBcbWvhOT4M1r2jzDt9zv8mwBljp3wkZADYtF0bX3/4jiOS74+3zXoWCTsGoed7i8Ef1Jupp71cAL2yad76IeeJnXNEnlVpfXaw6cEqPlQDMMmSMD9IuO2emzbtmN7UUzUxJtMs+B00iEiRiLYSIw20JMcRNVPeUhYWySUbEDXnikLvpoTJfUXeh4sxUmgcKdG2Yhq6HqsfsnCWB1shlzneXkTh2ObEr+RvWDPlFeGLy8Qj9gwHkN1iFfACTIdZP4+XytUQbrRFRCaHuBjjr7Sp5awbgnn0Z6jJ4grcZzPzTmz1OmTX3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(366004)(39850400004)(346002)(478600001)(38070700005)(6506007)(86362001)(66556008)(186003)(76116006)(122000001)(71200400001)(6916009)(8936002)(9686003)(38100700002)(66476007)(64756008)(66446008)(83380400001)(26005)(2906002)(66946007)(55016002)(316002)(4326008)(5660300002)(54906003)(33656002)(7416002)(52536014)(8676002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G11PGvOGv7p4+XwAJ7IDPrcHLwbdxqnink0W/p0yM4I/u0RIEDDW3RouDzFt?=
 =?us-ascii?Q?Ve6LAEtsVVq2z8i1LfMJz720gdg5+POEmgnY+dh6Djnsu312Uato3M62oNnp?=
 =?us-ascii?Q?sSSNGOnpTxWmWF+bXmUAA4cyGVLbqRezCQ56OQ5UqWc5Zk6qvJklwjr46e7k?=
 =?us-ascii?Q?8tuHqyAF03T6IagjDym1/wms0ZyhaAp2sypKeKhYiWuUxAfNBtE/8iz6fRcJ?=
 =?us-ascii?Q?pTlJGOGpLPaFktl7YBXJGf9JMbKMTQBGyQWBgwHiCcz1yS8Qlb/sJr154N5p?=
 =?us-ascii?Q?hxqnIhi32HQaecpexzKe1xyqn1VnZGJEMRFblMPuAorDRzjaQHZ7zIzfxjUx?=
 =?us-ascii?Q?hQRa9YtSZ+oxsSOHyYZoEN4ajvPqq7iUGdxm3Bz4ao2WegbEQv7BqEbDCrYf?=
 =?us-ascii?Q?bZKJJgLU94MWEazBD9WGIaF2LQq/b/JskcqG+s8yhWVL+q/tJU9iMsT4li7D?=
 =?us-ascii?Q?zIdoUYVjYNrQD0sNoDNIbYZSMX9aHLMzfe+jrHTXUTUGmHO667CgNnqDHoGb?=
 =?us-ascii?Q?H5I2tRWCRxC0kIh3RPEVFETI0HB0S5YLEG1zcUrxt+7BUb9h41Wo4J5909WC?=
 =?us-ascii?Q?0f9+qfYNC9NIbe2MDxSWRYuMhoOOqhcZN3ug51IM1m3EE6rJnjBdKHg1dkUk?=
 =?us-ascii?Q?mxRPNe0BMxqa6YN0O1/8pKmazq8DW7rki9ys+EaacGkKUkjf39gP7oUoUTk1?=
 =?us-ascii?Q?d2TJ4PHukteO5cMZBz8c0rMIi6jyG2eDG6ayPEnyv3YFXyxyr25VIYte+Q1f?=
 =?us-ascii?Q?QYLWjHsj7m4cg9NvuriKazXq4fjzD3JvL7L3qDDfRlsd1qG1f/BGKnwpy3oR?=
 =?us-ascii?Q?G4/8Uop4SNaYXVscUMajqgfHWXyAvaJ+m1QbD0I2P3njiySNehtqdhK1T2m6?=
 =?us-ascii?Q?bP4RnobhcuE42nDADp6WZNuQRo2z27E8Gb0MNmDXgpEq7rw1fpXslsfKzVZZ?=
 =?us-ascii?Q?hP0Euf84ukLPjLO2qCN3N2HPmhZufL06xE+QBIX5Eb57my2rA9LzWdePmB0x?=
 =?us-ascii?Q?kPTu6QkCypvofbvkxidYlXwQ5KVhbticRKwqqT//ZCD5JloQ7gHd873Z9p07?=
 =?us-ascii?Q?2770uxXylblRberuYWc2ujukcxf3Hh60Amh1N7pQbvbin82gRb+FMUMswnmI?=
 =?us-ascii?Q?nJFYNA+ZTw4AfahhDlfQbSVKokiujEJWc+dTBRz03mR0q5W9iPG7Njmz6o8/?=
 =?us-ascii?Q?bN1HudbvkLHFQGDEVfBROOJkWmKV0uo+LsLsbm+RIT/E17oiWbYcSNeXtuPA?=
 =?us-ascii?Q?PjEVilL6jxemxpJJn8AtYcm3F5eF+o2OLhq0sOve5D4Jju5Wd4XmVkUrCj6q?=
 =?us-ascii?Q?KfUTZirUiFIpNFXvowk/6eli?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a480573-d888-41de-1102-08d958d5b402
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 12:28:31.4964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UB27Uc8uw/+SB8aPV4SyyFCWnFJjemerpnBPKgrWaT4M3v7hfPmpBVYD63Tsw1unM5oprlaGfVYqnXzswplwqiu/cuZ6OixSXV3yG33kZFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5842
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

Thanks for the feedback.

> Subject: Re: [PATCH v4 1/3] ASoC: sh: Add RZ/G2L SSIF-2 driver
>=20
> On Fri, Aug 06, 2021 at 11:29:28AM +0100, Biju Das wrote:
>=20
> > +static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
> > +			      struct rz_ssi_stream *strm,
> > +			      struct snd_pcm_substream *substream) {
> > +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> > +
> > +	if (runtime->sample_bits !=3D 16) {
> > +		dev_err(ssi->dev, "Unsupported sample width: %d\n",
> > +			runtime->sample_bits);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (runtime->frame_bits !=3D 32) {
> > +		dev_err(ssi->dev, "Unsupported frame width: %d\n",
> > +			runtime->sample_bits);
> > +		return -EINVAL;
> > +	}
>=20
> You should be doing *all* this validation at the time things are
> configured, not during trigger.

OK, Will move sample_bits validation to hw_params.

From core/pcm_native.c,=20

frame_bits =3D channels * sample_bits;

since we are validating both channels and sample_bits,
there is no need to validate frame_bits.

So I am dropping frame_bits validation on next version.

>=20
> > +static int rz_ssi_start_stop(struct rz_ssi_priv *ssi,
> > +			     struct rz_ssi_stream *strm,
> > +			     int start)
> > +{
> > +	struct snd_pcm_substream *substream =3D strm->substream;
> > +	u32 ssicr, ssifcr;
> > +	int timeout;
> > +
> > +	if (start) {
> > +		bool is_play =3D rz_ssi_stream_is_play(ssi, substream);
>=20
> ...
>=20
> > +	} else {
> > +		strm->running =3D 0;
>=20
> ...
>=20
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> This is two functions merged into one with zero shared code, just make
> them two separate functions and then people don't need to guess if true i=
s
> start or stop.

OK. Will split this into 2 separate function.

>=20
> > +	switch (cmd) {
> > +	case SNDRV_PCM_TRIGGER_START:
> > +		/* Soft Reset */
> > +		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
> > +		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
> > +		udelay(5);
> > +
> > +		spin_lock_irqsave(&ssi->lock, flags);
> > +		ret =3D rz_ssi_stream_init(ssi, strm, substream);
> > +		spin_unlock_irqrestore(&ssi->lock, flags);
>=20
> It's not clear what this lock is intended to accomplish.  It's only used
> in trigger like this and in _stream_is_valid().  In trigger() we're
> already in atomic context so don't have to worry about simultaneous calls
> to trigger() while in _stream_is_valid() we're just checking if there's a
> runtime present but since the lock is taken and held within the function
> the status could change before we've even returned to the caller.  The tw=
o
> uses don't seem joined up with each other and neither seems to do much.

Thanks for  pointing out. After re-checking, locking is not needed at this
place. It is required only for _stream_is_valid() and _stream_quit().

Cheers,
Biju
