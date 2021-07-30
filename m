Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A41C3DB9E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 16:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239067AbhG3OAs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 10:00:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:56802 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239013AbhG3OAs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 10:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jBTJGV/FMmhlp4FysMiDu/IBBCsW
        BYFdeP9B4UYMUa4=; b=qTgFos4rrXnc1C/No2um1KFy85PGyH+rATZFV6gVtycl
        mT/fWR0cD5jsRiJn42oGMsZGg5RUmQJh7cytBfWVYgoyPrp7HUdmOxw8dpaspuWX
        wda2Nx2RTsCVlIgfnlooS52PUs6Vr5axh1yc9netIIL7mkSBEeYY55AtEeLqnR8=
Received: (qmail 3019269 invoked from network); 30 Jul 2021 16:00:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2021 16:00:41 +0200
X-UD-Smtp-Session: l3s3148p1@y/0hpVfIzrIgAwDPXwtrAFZwfe2Gefyo
Date:   Fri, 30 Jul 2021 16:00:41 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [RFC PATCH] mmc: core: ensure flags are always cleared when
 retune gets enabled
Message-ID: <YQQGCZ6a/z1ER8pa@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adrian Hunter <adrian.hunter@intel.com>
References: <20210625190107.8160-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dgrWcng+cGIK9+ZQ"
Content-Disposition: inline
In-Reply-To: <20210625190107.8160-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dgrWcng+cGIK9+ZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 09:01:07PM +0200, Wolfram Sang wrote:
> Move the call to clear the retune flags into mmc_retune_enable() to
> ensure they are always cleared. With current code, there is no
> functional change. But it is more future-proof this way.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> After reviewing my own code, I thought this is even a tad better. What
> do you guys think? Based on the series "[PATCH 0/3] mmc: avoid vicious
> circle when retuning", of course.

Would be easy to apply now because the dependency is in mmc/next now.
Opinions?

>=20
>  drivers/mmc/core/core.c | 6 ++----
>  drivers/mmc/core/host.c | 1 +
>  2 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 84f39a59a28e..b039dcff17f8 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -937,13 +937,11 @@ int mmc_execute_tuning(struct mmc_card *card)
> =20
>  	err =3D host->ops->execute_tuning(host, opcode);
> =20
> -	if (err) {
> +	if (err)
>  		pr_err("%s: tuning execution failed: %d\n",
>  			mmc_hostname(host), err);
> -	} else {
> -		mmc_retune_clear(host);
> +	else
>  		mmc_retune_enable(host);
> -	}
> =20
>  	return err;
>  }
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 52d37587cf45..8ca1db6413f8 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -101,6 +101,7 @@ void mmc_unregister_host_class(void)
>   */
>  void mmc_retune_enable(struct mmc_host *host)
>  {
> +	mmc_retune_clear(host);
>  	host->can_retune =3D 1;
>  	if (host->retune_period)
>  		mod_timer(&host->retune_timer,
> --=20
> 2.30.2
>=20

--dgrWcng+cGIK9+ZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEEBgkACgkQFA3kzBSg
KbaBhQ//XUImiprmH4bMC+d8UFaXPfQPpGIKebk7ojGKs2ggIuWJJijoZyglZDCW
5GfFs4oy9mmst8HRu6JlIhyDvH6VU/UehnDYxv0CiPiwM6PRYyBxhSqHlkak69Uv
8tnvsuFIbZ+nPi+XAZJ3IdDr4rhr8IP67nxE9CDVOEwtuw8bG0FQ6Zu/VaNoKiqb
TE9PUbJ4ejZYDoq3pmMG4cj5KBpSGW57I2npC9x6oKrir4ncdVu/MV85kGCqo+91
G0NQmw8v0JqO+DQHJkkXhfR5fYcy/No0PLA0DBnclcGSUiYobwOyyd12qfpByDaP
cTSlXqssKCvDK5PLI+tPRaypkwFCKg0Kx47uxL/sr9UHdv+QZ3SoRyIRtpjk12Dm
/ywqSOpn5GYIuE+Mqd1CckclEQLq9Vngg9m8bpRTmoBxit9f/YFtueCK78TYmWda
3LqLAEZPfc1LyIuMZXYpFJbJsL3FfOXWKboCvqfUEJBWvxMWPDe19jg8XFaGViOB
OPsl5KuN4iwPFP0B5714zMJI8JAK7M4NJQkF3eKZWVngIxyA8jpgT9uVtfIs4+0U
8aGbu9L+J9rmbc4s9/mYJ/Wa0cUzqSirafDLE5TVx7ECQ9sopWcSfiE35SwCyu5Z
Lx+j2iLKq6VlFAsbWx5ZrXOduWZHBI4XOdsJ2958N2wArYep0Uc=
=5PPw
-----END PGP SIGNATURE-----

--dgrWcng+cGIK9+ZQ--
