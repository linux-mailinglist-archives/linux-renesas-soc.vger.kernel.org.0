Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357963B4FE9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Jun 2021 20:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhFZTAd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Jun 2021 15:00:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:43670 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230107AbhFZTAd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Jun 2021 15:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XguuJvFgAO1GBtu32ShPppLrE89U
        UxsFvRw5mYKjLs0=; b=hwJhSFHlGlH0HbxYvNiMCJoXq8CdweZj8+hmhR2YCmar
        MGPGjU/Bo+hpZJ1v6AwMU2jZXHRb5Sc4nZ/5U+n5DZkyOsshnBIdRk76IUXgpFFm
        yz7AHmpvr3CNyn4ouIWcY1nVTKa3MjKy9W8kEs2wEjiqo6oyqNf4ELieOvkt6Yw=
Received: (qmail 3686869 invoked from network); 26 Jun 2021 20:58:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2021 20:58:08 +0200
X-UD-Smtp-Session: l3s3148p1@TAML1q/FAoMgAwDPXx9NAPXRWcOdxyeY
Date:   Sat, 26 Jun 2021 20:58:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Ulrich Hecht <uli@fpond.eu>, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
Message-ID: <YNd4vIJjpaSmFD9t@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulrich Hecht <uli@fpond.eu>, Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
 <bbfbed66-5058-1263-159c-dabd345286c8@intel.com>
 <563832257.373371.1624260736936@webmail.strato.com>
 <5adc8601-23c7-4378-94e2-cb3641d9039c@intel.com>
 <YNBJq7Lrtlc/qExN@ninjato>
 <b5062770-ba5c-32d5-15f0-505a09bb4a2e@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l9KduWXRzNiGaE7d"
Content-Disposition: inline
In-Reply-To: <b5062770-ba5c-32d5-15f0-505a09bb4a2e@intel.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--l9KduWXRzNiGaE7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Adrian, Ulf, everyone,

> With the code above, if the host controller knows the card has been
> removed, it can return -ENOMEDIUM from ->execute_tuning() to suppress
> the message.

On second thought, I like the idea with -ENOMEDIUM. Because tuning can
still fail for reasons other than a removed card and we want to see an
error message then.

So, I checked when/how to return -ENOMEDIUM for the SDHI driver but this
lead me to more questions. The few driver which return this error code
all follow a similar pattern:

xxx_request()
{
	if (host->get_cd == 1)
		submit_mrq
	else
		cmd->error = -ENOMEDIUM
		mmc_request_done()
}

So, my first question would be if we can't apply this pattern in the
core before calling the .request callback? A lot of drivers are not
implementing this pattern although it seems useful. Is it required?
Recommended? Nice to have? However, I could imagine an answer for moving
it into the core is "no, that should be checked atomically"? E.g. sdhci
does it, but atmel-mci and s3cmci do not. If I just look at moving the
card detection call into the core, I don't really see the reason for
atomic. Am I missing something?

All the best,

   Wolfram


--l9KduWXRzNiGaE7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDXeLYACgkQFA3kzBSg
KbbgyA/9HmpIvbnoA25g3dRGHH7M/sZZCxVr5+S2ohmblm0ZYyiO60cMSl/ShAHD
0kCOBPfXCelQ/SsC3okrg1bnd8vozKuKBrtaLcER5AREmOn1yEegf+rVX3FM4++8
Nx2zH8rVjiyk5wv2fAcJXh+9YlnhPmZdFPSFf25dE6i5fOnTLSJeUl94YQTbESOS
10i2bf3ZetrbMTLCRtwq/d0zqwPzxPd8jHalTP0DA4ltp/sNav5QTEK+fhKT0vL6
GjFBMfWvAEj5sgnPCiErD/sXskm6HK7Z3fu+1DwBi0y/leMibkdPfcyXkjQWquDt
p81gRdQdIoGGm64wf7J2cjma+QYKG6zrhuK40x1TRoKbar8ukbr0ZrWnf/m51ptU
xzIEiol0X5BT/2QWbZ2Qiy1WS3LTHSXFwDMu0rVVQBvl+S4JLMMrrKs2QZxB2Ndc
KVoPkiJhsSWMBsxduJ0YFmX+fHmhH4GGjDs44i6Q72xko+TRJfN/PY8Iu1XlMteL
QPL625Sup1EOsc91s74Rg24wEIxpIJeoe5s/TTKT32pfwKU0Azw8e3weMzPw9ifA
/0zU3x3VjZQ5IBYaPNdZi7I0IIzdHRNxC6f1vCeZxT/I6KK36oYR70f1j3DHZRpt
dDaqbWlgsV8DXPsw1PTFTV4Muyr5CFMq4Tcw1F8rVtPSCCHX3O4=
=Ulq5
-----END PGP SIGNATURE-----

--l9KduWXRzNiGaE7d--
