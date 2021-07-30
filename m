Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09D03DB9E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 16:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239013AbhG3OCa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 10:02:30 -0400
Received: from www.zeus03.de ([194.117.254.33]:57248 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238991AbhG3OCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 10:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6xIPYCFVhkRvp/e7wjkgnLIIJQWx
        cHmoYfQYZUWs6vk=; b=Pq7AzmiCKmZBWHxV4YRen6RawjBkk8DGzqvWe8MPwpxu
        MpI4oVFGLrQGSlvtA93DScrXZHaw+mT9VJIcnWspOfPRQmrzsRvDsaaoLJr3CHbC
        H50aMqmfiWEqgQm2nwK3bQtivG8lh2tvxG3PaDKN4qpzg5HrCuIvgtekRsSkDdM=
Received: (qmail 3019641 invoked from network); 30 Jul 2021 16:02:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2021 16:02:24 +0200
X-UD-Smtp-Session: l3s3148p1@/Fo+q1fI0LIgAwDPXwtrAFZwfe2Gefyo
Date:   Fri, 30 Jul 2021 16:02:24 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [RFC PATCH] mmc: only print retune error when we don't check for
 card removal
Message-ID: <YQQGcP8OzROec+pa@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adrian Hunter <adrian.hunter@intel.com>
References: <20210630041658.7574-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9n/TLHDfBd9YNEVC"
Content-Disposition: inline
In-Reply-To: <20210630041658.7574-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9n/TLHDfBd9YNEVC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 06:16:58AM +0200, Wolfram Sang wrote:
> Skip printing a retune error when we scan for a removed card because we
> then expect a failed command.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> In my tests, detect_change was only set when a card was removed.
> Inserting a card or resuming from RPM would print an error. Did I
> overlook somethign or is this good to go?

So, what about this to remove the bogus 'retune failure' command?
I also think the code is a tad more readable this way.

>=20
>  drivers/mmc/core/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index b039dcff17f8..b7e6e5640640 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -937,11 +937,13 @@ int mmc_execute_tuning(struct mmc_card *card)
> =20
>  	err =3D host->ops->execute_tuning(host, opcode);
> =20
> -	if (err)
> +	if (!err)
> +		mmc_retune_enable(host);
> +
> +	/* Only print error when we don't check for card removal */
> +	if (err && !host->detect_change)
>  		pr_err("%s: tuning execution failed: %d\n",
>  			mmc_hostname(host), err);
> -	else
> -		mmc_retune_enable(host);
> =20
>  	return err;
>  }
> --=20
> 2.30.2
>=20

--9n/TLHDfBd9YNEVC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEEBnAACgkQFA3kzBSg
KbaAMQ/7B32pi+nDFfonsyRSMFEgx/y2cUDAJkPlcVN4SlR7e3zUSXZ3Qd2E8ySK
8Y8RODdgM9NjsOyZY2FWLyFWUnnKTJfwUOxlxcFeipIwrumufYSNc6iKJ9qya0ef
7GxPpPP5XIqF4vWmIKgkef2INRU0eHW6QCvpuKDRQGfSjvtGLnzVBeNX1GXuYIPu
0H3IFp41WoB0A5dIw4VsWR8GXK/MqlekiYMBq5ZBZQhWhIMK6pUW1zHAIEgzxegg
sU/X8r+v2YlaODOCxbmaXDLjmkIlddq9OPNU2CpBNLIjOvvMZKEmtzM7L9+Lu78Y
zZOfOCno53f1hmkFkCZjokRdoTPqpYMeNJugEov9Q1V7Mb2KT4y2NhmcvMRIuQgk
aHX3g3cNR8e+DtPAM8vbHMp2lm7KkdQyCUTRFAwnQAAk6L5co2PXTowUXoVHjADb
7W5CQpcq3utt2SyPoiK9zl1mfcPBRrlu/x6yeha0GcRM2DHRzG0tt3uEK0lhqpz/
KjCr7kPT1wHS/UiiwlwPNF8unTUjTCQfKrzKQWBGZQaOXJ5AZYdnJFfqhRbwbRDJ
EiFVmy0WveH6mjzYoWIb+upjQgIgbTOavai1yYVvIaPuMZOWUZQ4sh1oWgOQ5hgG
JjXk1ZR7dOSeZIJS5J5+dDJxX4YNB/TOrotQLlGI9cyLdz3d14M=
=sTNS
-----END PGP SIGNATURE-----

--9n/TLHDfBd9YNEVC--
