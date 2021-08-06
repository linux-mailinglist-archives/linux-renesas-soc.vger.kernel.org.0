Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990CF3E2988
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Aug 2021 13:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239384AbhHFL2b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Aug 2021 07:28:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231882AbhHFL2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 07:28:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CE0760F70;
        Fri,  6 Aug 2021 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628249295;
        bh=49mJJpkP7jJeQdk4rRiPSuGcgUo2/mtXGQECWbZUU3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XK4nulXtxvL5HkMZ3FpmZ0r6LMzqzDkQEPHtfgCggTUj6OdKfoGi1HR2KILAy+dSr
         iEBysDKYeaa1bNtJ2yAqpLze4PzHDgikegXsS65OQqFyY7wKVNwaZCZoICDVAQjR5Q
         GRxyznQsFECV7bFc1yDSK+BJpTtkTAZgnscDaJxs7rfmfTieV3MHxc28s0VjwGhM8v
         xlJmrqP2jLeaFme3yine4d8yweRNDzzbXazGTvqYuecgMa86TuPA8ZKjXIx39ghsIF
         EjAuavSFJ+20AuMNGi4Nc2IBy2pWLQRCWJT0S7dxGLKGoWzoY1aqEQWUz6Gh15xkea
         uokxe7XBJDz7A==
Date:   Fri, 6 Aug 2021 12:27:59 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
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
Subject: Re: [PATCH v4 1/3] ASoC: sh: Add RZ/G2L SSIF-2 driver
Message-ID: <20210806112759.GX26252@sirena.org.uk>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+mSjbC2tVdWE/Wop"
Content-Disposition: inline
In-Reply-To: <20210806102930.3024-2-biju.das.jz@bp.renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+mSjbC2tVdWE/Wop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 06, 2021 at 11:29:28AM +0100, Biju Das wrote:

> +static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
> +			      struct rz_ssi_stream *strm,
> +			      struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	if (runtime->sample_bits != 16) {
> +		dev_err(ssi->dev, "Unsupported sample width: %d\n",
> +			runtime->sample_bits);
> +		return -EINVAL;
> +	}
> +
> +	if (runtime->frame_bits != 32) {
> +		dev_err(ssi->dev, "Unsupported frame width: %d\n",
> +			runtime->sample_bits);
> +		return -EINVAL;
> +	}

You should be doing *all* this validation at the time things are
configured, not during trigger.

> +static int rz_ssi_start_stop(struct rz_ssi_priv *ssi,
> +			     struct rz_ssi_stream *strm,
> +			     int start)
> +{
> +	struct snd_pcm_substream *substream = strm->substream;
> +	u32 ssicr, ssifcr;
> +	int timeout;
> +
> +	if (start) {
> +		bool is_play = rz_ssi_stream_is_play(ssi, substream);

...

> +	} else {
> +		strm->running = 0;

...

> +	}
> +
> +	return 0;
> +}

This is two functions merged into one with zero shared code, just make
them two separate functions and then people don't need to guess if true
is start or stop.

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* Soft Reset */
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
> +		udelay(5);
> +
> +		spin_lock_irqsave(&ssi->lock, flags);
> +		ret = rz_ssi_stream_init(ssi, strm, substream);
> +		spin_unlock_irqrestore(&ssi->lock, flags);

It's not clear what this lock is intended to accomplish.  It's only used
in trigger like this and in _stream_is_valid().  In trigger() we're
already in atomic context so don't have to worry about simultaneous
calls to trigger() while in _stream_is_valid() we're just checking if
there's a runtime present but since the lock is taken and held within
the function the status could change before we've even returned to the
caller.  The two uses don't seem joined up with each other and neither
seems to do much.

--+mSjbC2tVdWE/Wop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmENHL4ACgkQJNaLcl1U
h9CFUAf/ZuHOAM0zjQxIdmxcvmfIalUNx2feYVhobCztja3Mvufl6Rg+OHwRQ7aJ
ZXCjY+qeltf7EAmdNEiftnW13g8YLawZWDzZhnk172lwqKOxYAvsQfnLdZHLOljp
U39Xg77d+swsHhhgS2cjUTLRGhbv/QdQr4cc77xYWwZY4me4xrhFR+HQaSv+JVax
ye9+bDqQGuUPmBrZ4x1sgoOI920Gry3bl4uwMqV0c2i9q8ziFhYqU7SI8MJbhuwc
zCOhBAridzGSSpS1zYGpQS5PpYZcUsJenas4vjZFvSR5Qw6jbWEWEBV4x5N8bWV3
rMEmou6riADGPoQo6NNiRpdrbT23hQ==
=k+yj
-----END PGP SIGNATURE-----

--+mSjbC2tVdWE/Wop--
