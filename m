Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4CE3E1819
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Aug 2021 17:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbhHEPeu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Aug 2021 11:34:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:43262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230298AbhHEPeu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 11:34:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82B6C60F35;
        Thu,  5 Aug 2021 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628177675;
        bh=FMZKr/KFT+VimHSBq67dJBliXzA9cWOYESblfOOwgiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lLckpamQ9/9P8u24pAXto1YLgGIMkDXWJoIiLY8v1DWc+VVs8habQITcM3jG+t1Bz
         kcT6dY0aY4Fs2OgqiXsMdl44iV+e6ILAc3D7teX1l5xbeNnx3WkKcubYotm9xKWu6y
         pKQeUiv1XXbdL4+fuiEAr7hplfTiIUYoAwpEY6WUrDGh4oYpMi+y61CixOasNh4MsZ
         ooPqY5tB4Z6I+/nwxk5p94KNdlum1qXuiLAbK2OxRXsHNT2mARhwaYfZG2a8zHlHlz
         gdNbffT/2o3d3pbQifB8NQalgLw7onTyAh22JkkT+OrwTtzZFvBogl9OMYTaKYTI0y
         7sILAG92wjPkw==
Date:   Thu, 5 Aug 2021 16:34:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] sound: soc: sh: Add RZ/G2L SSIF-2 driver
Message-ID: <20210805153420.GQ26252@sirena.org.uk>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
 <20210729172311.31111-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4dIe/AmYstFUGHTF"
Content-Disposition: inline
In-Reply-To: <20210729172311.31111-3-biju.das.jz@bp.renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--4dIe/AmYstFUGHTF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 29, 2021 at 06:23:10PM +0100, Biju Das wrote:

> +config SND_SOC_RZ
> +	tristate "RZ/G2L series SSIF-2 support"
> +	depends on ARCH_R9A07G044 || COMPILE_TEST
> +	select SND_SIMPLE_CARD
> +	help

Why is the DAI selecting a specific sound card, and if it must then why
would it use simple-card and not the more modern audio-graph-card?  The
select should almost certainly just be removed entirely, this is not
something DAI drivers do - cards use DAIs, not the other way around.

> +++ b/sound/soc/sh/rz-ssi.c
> @@ -0,0 +1,871 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L ASoC Serial Sound Interface (SSIF-2) Driver
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.

Please make the entire comment a C++ one so things look more
intentional.

> +static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
> +			      struct rz_ssi_stream *strm,
> +			      struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	strm->substream = substream;

> +	if (runtime->sample_bits != 16) {
> +		dev_err(ssi->dev, "Unsupported sample width: %d\n",
> +			runtime->sample_bits);
> +		strm->substream = NULL;
> +		return -EINVAL;
> +	}
> +
> +	if (runtime->frame_bits != 32) {
> +		dev_err(ssi->dev, "Unsupported frame width: %d\n",
> +			runtime->sample_bits);
> +		strm->substream = NULL;
> +		return -EINVAL;
> +	}
> +
> +	if (runtime->channels != 2) {
> +		dev_err(ssi->dev, "Number of channels not matched\n");
> +		strm->substream = NULL;
> +		return -EINVAL;
> +	}

Why are we only validating these here which is called from...

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* Soft Reset */
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
> +		udelay(5);
> +
> +		ret = rz_ssi_stream_init(ssi, strm, substream);
> +		if (ret)
> +			goto done;

...trigger.  This stuff should be being validated when we set
parameters in hw_params() and can usefully report the error.

> +static int rz_ssi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
> +
> +	/* set master/slave audio interface */
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		asm("nop"); /* codec is slave */
> +		break;

That asm("nop") looks interesting...  I can't think why that'd be
needed?  Please also use the modern versions of these defines, consumer
and provider rather than slave and master.

--4dIe/AmYstFUGHTF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEMBPsACgkQJNaLcl1U
h9DnBwf/XKjZA/9gCQVpfhG/eH/xV2Nqi/mU+S/Uyy8BhUXMa76mOR6wzTyd2kWD
n2j0dV78dzujccTdXriDVsmqQNknlGUGXa/tZrTiraGOqGw3kqy0f5NIGdzhPCZM
7Ip0mcl7VQKUm9VBZgjHkVjLRaB17ak9uQ1X6przneydtabW0mftK1W0K6xflHYP
Zy8RO2z539VBnys7irkKC8fITqVMkhqr4oeWSE/sXAwTQ6Yj/KsnFUqoF8FqyU0r
bZ+fLOstqIwg7zSBmeJHVcxqAImoanivIK3s8aVERiVc6xlhAeZAEKIvWb0Vo8GQ
e9rNcmQGr8Z3OWsrkbxcRefF1r2OdQ==
=hOBs
-----END PGP SIGNATURE-----

--4dIe/AmYstFUGHTF--
