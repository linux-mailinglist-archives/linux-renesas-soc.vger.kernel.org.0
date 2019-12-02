Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19AB610E71B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 09:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfLBIyv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 03:54:51 -0500
Received: from sauhun.de ([88.99.104.3]:42010 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbfLBIyu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 03:54:50 -0500
Received: from localhost (p54B3363C.dip0.t-ipconnect.de [84.179.54.60])
        by pokefinder.org (Postfix) with ESMTPSA id B15772C04A3;
        Mon,  2 Dec 2019 09:54:48 +0100 (CET)
Date:   Mon, 2 Dec 2019 09:54:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 4/4] mmc: host: renesas_sdhi_sys_dmac: Set
 dma_buswidth value to 32 byte
Message-ID: <20191202085448.GD1266@kunai>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20191128210728.GA864@kunai>
 <TYAPR01MB45448366F6EB1F581CD399F7D8430@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB45448366F6EB1F581CD399F7D8430@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

> > 1) can't we set dma_priv->dma_buswidth at runtime when we know what the
> > card is capable of? Either DMA_SLAVE_BUSWIDTH_32_BYTES or
> > DMA_SLAVE_BUSWIDTH_4_BYTES? Then we don't need to fallback to PIO.
> > AFAIS, we only Gen2 sets .dma_buswidth in of_data, so we could even
> > remove it from of_data entirely?
>=20
> As I replied to Ulrich-san on other email thread, for now, rcar-dmac has =
a limitation
> on dmaengine_slave_config(), we should not call it at runtime. But, I don=
't think
> any sd card have such a limitation. In other words, if rcar-dmac doesn't =
have
> the limitation, I think we can change the buswidth at runtime and then we=
 can
> remove the .dma_buswidth from of_data.

So, that I understand correctly: The DMAC limitation is because of the
driver and not because of the HW? If so, is it hard/planned to be fixed?

> I also grepped in drivers/dma, and all dmaengine drivers except Renesas r=
elated
> SoCs don't support DMA_SLAVE_BUSWIDTH_32_BYTES. So, I think no driver uses
> the 32 bytes on mmc/hosts :)

Wow, we are bleeding edge with this? :)

Thanks,

   Wolfram


--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3k0VcACgkQFA3kzBSg
KbZoNg//ezhUoYdzJAmhqBtU+A8clC0LGkYkhcHMACjFXxbNrnB4/S2THO+pWP3b
SKdHfaQRflbhEWBz+QnuUWlWlgxhTI+nbst86rrXlMbk/deTzkt8CMkXNVQApWIF
s0lFZIQTHa+YvmuLL7y3qmfLLAo7Epo1w0VLfxhjtK9EajZ1ryRjtyTWRVIEcy0o
FTh59GSnZ+ykePlRBQL9p/Lq35D7ZX6++967Ig/eqCVBNrfDWmWptKOpkpnho8lk
TDs8wK4YBzrZa8/PGbXvKDdAU4Y3a/91/A2udBUUizQYnPOJYsHYzapDl0oisIPe
Kuvmu94Rg2/Nt28wncVE0Hd6xjL5mRh3BEBfxpkFCRL5gz3kB2/QjQsJfLdNsCuL
TwgQUmX3lDWs7Gm8ODDuJtwpH7tCavQhvTwmNzw7UDMPWaMpcFHSVQP13VkXjShj
N+5MBlefKOMMxHNHd/SraJ8tsdRdj204plAYcrnbUCZbdOUaVnafLy4EAyXlVyVm
WzpA1H6G/u8lvlGoL3UJbii6rpwzZlsL+ulsExKdBbzRdOGnGCinJXg4fUF5HmUF
IdQ4vugPST9SSSN6MQ7KEBOtYnLdR8pv1EQLZRoMVPkw+bkoa31WyMpPTjC4CTiB
0VFtMRJlLBNk4dOXodIpTMH/bNvDUBSYZp0JibBQeznd3I84KoQ=
=6+7V
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
