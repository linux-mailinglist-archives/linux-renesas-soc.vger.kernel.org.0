Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B211F6ECC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2020 22:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgFKUci (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jun 2020 16:32:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:56234 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgFKUch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 16:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XfjGlyJl/T3p3ZUurz3vqEk1fEjR
        3cpWETyOWaoOn0U=; b=g8pI0qJ4me9kXmg2KRopgd/TpOPVrDYTANMyYIpQdkvd
        LPpCVPrcAPZgU+fIzi0KXelOoAejaFDDVC2vvhQNFWjX7eMQl5v5OrpuriIOLFBc
        X1ArMHrk3K9lOcxqlTaBA+4LF/KGiBy2PFmZ1guMOWASfSUzIN4dFdB2KujFunQ=
Received: (qmail 4193618 invoked from network); 11 Jun 2020 22:32:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2020 22:32:35 +0200
X-UD-Smtp-Session: l3s3148p1@dBtf3NSnbtAgAwDPXw1WAG/z8f7aUK6V
Date:   Thu, 11 Jun 2020 22:32:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] mmc: tmio: core: Add end operation into
 tmio_mmc_dma_ops
Message-ID: <20200611203235.GA10758@ninjato>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1590044466-28372-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <1590044466-28372-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 21, 2020 at 04:01:04PM +0900, Yoshihiro Shimoda wrote:
> Related drivers like renesas_sdhi_internal_dmac are possible
> to lack dma unmaping in error cases (for example response timeout).
>=20
> Since tmio_mmc_finish_request() will be always called in any case,
> to fix the issue, add end operation into struct tmio_mmc_dma_ops and
> call the operation in tmio_mmc_finish_request() to call dma_ummap API
> by the related drivers correctly.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/host/tmio_mmc.h      | 3 +++
>  drivers/mmc/host/tmio_mmc_core.c | 8 ++++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index b4cf101..0a4f365 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -118,6 +118,9 @@ struct tmio_mmc_dma_ops {
>  	void (*release)(struct tmio_mmc_host *host);
>  	void (*abort)(struct tmio_mmc_host *host);
>  	void (*dataend)(struct tmio_mmc_host *host);
> +
> +	/* optional */
> +	void (*end)(struct tmio_mmc_host *host);	/* held host->lock */

Okay, the good news is that I can reproduce the error case. I also get a
growing list in /sys/kernel/debug/dma-api/dump.

However, here, the list does not grow at the same rate as the fake
timeouts are injected. So, it doesn't look like the unmapping is missed
every time but only occasionally, so this seems like a race somewhere?

And if that is true, I wonder if we couldn't fix the current error paths
instead of adding another callback?

Or do you get a missed unmap for every timeout, Shimoda-san?

All the best,

   Wolfram


--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7ilN8ACgkQFA3kzBSg
KbZEcA/7B/NMY+HhZtZaxcO5dyZ8YWBnFgsGPAXd1L2VLDpF/ZxEtb+ptz768BSf
+zh6nbzAafO/tLqpLNVM5TJzMYLZjQAC/ku+GIyhMbtyAHb5Rjd+vot73J2RAwhB
xkbBFxJgCvbEYlURyAkukfZhXqAw4g8uns9i7znp44apQDD/BwYma1fWRU4RnpPz
2BY8kKU/IIyS74zA69qFMx+ktL/uSKVHTQ+asNJIyEqFIDAQYZgDHk8UOLD+yvev
irNGRcOG718nusxhxro6i0qFPRo0SgbRr95SnmutL8YmsQGgh4wrM6c6SpcEYGJi
LP3KL5HzEpUZCQbKGEmbt4E4Ztp2HxcXRBeb+ZG8AYKr2eViVbxpx3PwanmtXBIR
YWHa4bTnprj6NlVqkZgfOFrQqikqyywvydXl4x1lddrbt4q+6lYHdzs8fRW9mXXg
j4jJ8hhUZ7g55CgxYtyAQROSgC/aZmlBic7Z8qyGR+Q6Ig/zG4ov61Amnm+CpDOg
azwZ6UvlL1+EvXCZ4VWx9JaDIAXzhEki3r9a8dgSqV5aWaYyn4rqwEBGj0spap5M
WS1gp9Ib5If495drGDMp7IhpHQHvw+T/wU9KTP+mpxto4VIdbMqH5unkjT80ld8J
HAabdLIhF04Erm3GvGz1GI6QVsKjdFwj0mHQOXLPUDEhOL5xqU0=
=a2uH
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
