Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93EA2DAD9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 14:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgLONBV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 08:01:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:46248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729156AbgLONBN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 08:01:13 -0500
Date:   Tue, 15 Dec 2020 13:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608037233;
        bh=fDiP7ilApLHaKkbPhxkJs3BwaJy+ICOzNNwrseuWDDQ=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=igylZFgutp+6ZB0uy7rkm5KPCGAKGCZ3mZ7wmryn8yElieFXFV6sfnel/Cz2/SXqb
         wVQLyLa5IxVG5Y1PuFhaH9N543ogMHakK69qg9PQ+PeykMYouz5iCpi+gD/w/Fk1Po
         IKjH40Ne5hYN0an/elbKmglXRdAddDvi4CYsJM8cLnOoZg56Ap0HTe0oHa55pGFYvu
         sKwEMVM52gRNnoc8m85BwOiTpJnxYjPrc8Fd0LBqAq0k609+tCZSJsVb44grJZeO4u
         gjiE2QIjDnaU2K2pjlAfuu1w3/3WeA5tp665NLBMS8DDdrypBh3+CLDLCjTSUpA8xh
         niVQhMC+fXB/g==
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH][RFC] ASoC: rsnd: don't call clk_disable_unprepare() if
 can't use
Message-ID: <20201215130021.GC4738@sirena.org.uk>
References: <CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com>
 <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: In specially marked packages only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 09:06:05AM +0900, Kuninori Morimoto wrote:

> -			adg->clk_rate[i] = clk_get_rate(adg->clk[i]);
> +			if (ret < 0)
> +				dev_warn(dev, "can't use clk %d\n", i);
> +			else
> +				adg->clk_rate[i] = clk_get_rate(adg->clk[i]);

We never reset adg->clk_rate[i] so if we use the clock once then get an
error attempting to use it again...

>  		} else {
> -			clk_disable_unprepare(clk);
> +			if (adg->clk_rate[i])
> +				clk_disable_unprepare(clk);

...we'll try to disable twice.  This was already an issue of course, not
something introduced in this patch.

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/Ys2QACgkQJNaLcl1U
h9DL3gf+LbNAoq+ie6MXE724oAYdw14gdhZfxkEnqHxElgGxZvKK4DzEZl6tGfvw
pfaEOw057v0Jd+6M7/EgbVW+FEMMHkyrb9HJrsAaQJyBnKE8KreAqVCcsHuCIqGA
z5qEphd6k9vzNByer4Rs+Lo8AAnNSLvEgKDfPjAVyJNOTJjR+C6JbCf/LrXU5u+s
tuar+WbDmCTjX5mRPOqE2jyWt85IL5TFNnEegN80uYwXgpdBoIq25oFOgbzqP9Pg
rW/6/xhRsUQ+WeyBfZrNCxpg0kgQt69OmqfG8uVniwUF0W2BAiYlG8jq46n6CAIB
bzkkTuu/1Sh9yjRVkt9OIcQCjYvt6w==
=B+vF
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
