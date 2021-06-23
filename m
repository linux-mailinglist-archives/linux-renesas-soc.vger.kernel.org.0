Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDA83B1E3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhFWQD6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 12:03:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:51384 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229523AbhFWQD6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 12:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jq/kvOojzw+rHMVe6MN8vQuqa+W7
        Ds5f30ZBuk50NaA=; b=n4MmT95D4jc+8ArdXb/JIhNjWOTwtqtmiAkdX4lsyV8p
        kNAE6pEZbhyLM+SXqmcq0qKKptF2BKFW1qcHH29Pva7FHAb2CKVR/4IQj4oOQOB8
        YZFZFHNnJ9GA4COnIwx+BS50PD5n++dI+d7f+H1ZVce43try3HBggKAQKKT68ug=
Received: (qmail 2662005 invoked from network); 23 Jun 2021 18:01:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 18:01:39 +0200
X-UD-Smtp-Session: l3s3148p1@hJmRBXHFqKIgAwDPXxfaAE9zqdDx06XQ
Date:   Wed, 23 Jun 2021 18:01:38 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] mmc: disable retuning when tuning
Message-ID: <YNNa4vgo2/ggVrIR@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210618073950.46154-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqNcAomh145-MH8LMKnGDi3zCFASMh-U5DK-xM1rwJqHg@mail.gmail.com>
 <0979048f-b477-c65e-0f53-8bef284ba3f4@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b1my5Sll1DmvJfA7"
Content-Disposition: inline
In-Reply-To: <0979048f-b477-c65e-0f53-8bef284ba3f4@intel.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--b1my5Sll1DmvJfA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

> mmc_retune_disable() is not meant for temporarily preventing re-tuning.
> It is meant for exiting a transfer mode that requires re-tuning.

Okay, I will add this as documentation.

> I would prefer something like below:
>=20
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index b039dcff17f8..f6d97bffc559 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -937,11 +937,14 @@ int mmc_execute_tuning(struct mmc_card *card)
> =20
>  	err =3D host->ops->execute_tuning(host, opcode);
> =20
> -	if (err)
> +	if (err) {
>  		pr_err("%s: tuning execution failed: %d\n",
>  			mmc_hostname(host), err);
> -	else
> +	} else {
>  		mmc_retune_enable(host);
> +		host->retune_now =3D 0;
> +		host->need_retune =3D 0;
> +	}
> =20
>  	return err;
>  }
>=20
>=20
> Would that work?

I will check it and report back. Thanks for the input!

Happy hacking,

   Wolfram


--b1my5Sll1DmvJfA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTWt4ACgkQFA3kzBSg
KbZz3A//a2lgahH7HSpqfvOiPjkDLSBMXypvFSgp3bBmZ8qkOoEJwt8evCxOnr1L
iSFHhIT9IYmuu0xYFNc7qGm4wCqiud/g9XetgElD5U27dKssAVabFNa4Z/bfLMTP
J5U1GEaV8NRykgmf3Qrnms6d6GHi9szkI548NbYxHfRE4y3HfWRM9S/a8b6ek/am
FVNrTBGVrWkv4HGtwEvDkwE0PEVoXeN9TW9LAh1AyCxTzW0hVD5oN1g7nh/ngXhm
vZPEeD+37ZhQ/Yj42uho++Tawkfmi9ZkQvo9NV+X1ZIGtcCR460kLl/wiWWKnzrx
PQtXpCa+BfA1cMAIuNkqdXj5Os+YPO+Y+k3kSBgqiYP/r6QUZteAVEqX4ToYeyOI
FIMXYZCBJSrPLvnkb20ZKN4R8hrHeaaQiJCwHb9FqCtRsTJNNXkqZ/GPivlrroND
uqFDt2QCE6JJVF9JNfQ19aYROhNjMG0NF+nV8t1pA3Nz/J+aBjRuT/Ee+w7cj+zX
c8TughYsrbIWSfYHWy+y3fw8JrXViz5QIa9m26hxfLbc0w6PkOpLWN3mYnkV/MXJ
xjn/TUoPXUs5isHpq6DLTxZh0Ok3Oah/UNESeP36Nz4ttW+ubzRz8O96wLHBBBYn
6yyH9+M7NPR5mPQcV0Wuj4RzZyepf9Zs8fdRoaSkVdGNk8rO274=
=484i
-----END PGP SIGNATURE-----

--b1my5Sll1DmvJfA7--
