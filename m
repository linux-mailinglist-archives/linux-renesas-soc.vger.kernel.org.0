Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED5E3DBC4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 17:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239704AbhG3P2S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 11:28:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239620AbhG3P2S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 11:28:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1269A6023E;
        Fri, 30 Jul 2021 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627658893;
        bh=kIAwJDaemvupetIvbkpv8ae8gOlFvu3AZm5atjlJyf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p8swqbJCrzZsSWfI7nkxi5tg1U1/IVDeetllIwgsJ5+jtp65HpqFmwBu9YuSYWdjb
         JCU82wZBjS/J+zeOZwhHdEkuzCz+TJi/2UOilgYmnBmQIW6/hWQUt4IH4D96UcGGkS
         LZnaTEMLZQUU6GU9izGdc/FNxIdPhoGNNiTfVqBkWwnn2eCNtRBuGEnCJTB0/iCugd
         9Wy9oU0syo/CwrHWbNKxgjFKHAFfv5Tuw8csmMHT8Lfyf5gPSc0jMiDp7OOqugpsNY
         dO6w2lXsFsjabpqesNtvYQgcPpIJYdZKOkFUt245XnVVjGDN1hhrss5eeymKfkEUMp
         UpxYraUfTbCaQ==
Date:   Fri, 30 Jul 2021 17:28:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
Subject: Re: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Message-ID: <YQQah2Q8qmQPEl7F@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K581topx12pYoyqW"
Content-Disposition: inline
In-Reply-To: <20210514155318.16812-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--K581topx12pYoyqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 05:53:18PM +0200, Ulrich Hecht wrote:
> The TMIO core sets a very low latency limit (100 us), but when using R-Car
> SDHI hosts with SD cards, I have observed typical latencies of around 20-=
30
> ms. This prevents runtime PM from working properly, and the devices remain
> on continuously.
>=20
> This patch sets the default latency limit to 100 ms to avoid that.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Adding Shimoda-san to CC.

Shimoda-san: can you kindly run your SDHI tests with this patch applied?
That would be very kind, thank you!

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 635bf31a6735..4f41616cc6bb 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -32,6 +32,7 @@
>  #include <linux/pinctrl/pinctrl-state.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_qos.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/sh_dma.h>
> @@ -1147,6 +1148,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		host->ops.hs400_complete =3D renesas_sdhi_hs400_complete;
>  	}
> =20
> +	/* keep tmio_mmc_host_probe() from setting latency limit too low */
> +	dev_pm_qos_expose_latency_limit(&pdev->dev, 100000);
> +
>  	ret =3D tmio_mmc_host_probe(host);
>  	if (ret < 0)
>  		goto edisclk;
> --=20
> 2.20.1
>=20

--K581topx12pYoyqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEEGoIACgkQFA3kzBSg
KbY6ag/+McfND+KN/KYYW4qjAcqaAF2nOw37frAaOo5kpmgMqLDFg6XDgk54+jyR
c/QLSUed3HPIK9eQ3G2fIvfOAsP9Epgua1d/DyVfZ1v+F57AyOMYG2qVpacAKBrW
wtfycDgCZSP/fTsq0hwkXJD2COT0XWLuPJCPGzL+PgB3/gywDQw/TrgiEnEhW5nA
c5Z1b2DdeylhDMUnzock7PD+NraG5m5mkLCcCCdwyKemfu53yA7+PsqfJUOtWiR6
qg8Jjly1/ya6bU+pbQDZcYHz/jKbpCmZ9qtqxJlpqlDQQ85vTVQhEY3NV1EDGZkU
p+OprfSvIT1hL7Tsn21iwGvxnVM+GuLpZBN+AoHBJmKe9EcgqnxwInZbRviD2v47
uYESsCkg0ujTLqkO+hYCmPW43EANmghLRCQU0Bj3u53XYNopJKOlUYXJ5pkS7mN+
xEsv5fwhE2XDzAvfhNAS3RsXP5R/XW5WvZVBPfC2rfqBHFW+J7n8RWvvXzkd/LLp
e7P3ot5XSLi+VPaTVs00qve1jhDU/NQ+ebsZYn/uMdbGMj/CH1YSRHHCXT7lePit
2tREB/EyeG26WY7nFKNV9af0ocKlELR34TNhat9lHS+1AvgLN2sPu421WrLC9jr+
Opf2umHR0UvUaEPR/fKs24ywrSVR+xRhdT01lc1gINREDN/Fl+A=
=khcG
-----END PGP SIGNATURE-----

--K581topx12pYoyqW--
