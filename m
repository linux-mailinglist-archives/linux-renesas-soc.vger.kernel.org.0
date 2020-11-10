Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CA92AD681
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 13:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730018AbgKJMkd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 07:40:33 -0500
Received: from www.zeus03.de ([194.117.254.33]:57144 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729832AbgKJMkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 07:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=pyVtQ0Obh2Q3P6ikIBydi4r4enjH
        MjwO65sFvCdnVgw=; b=keBbEP+KNYeI2FAFTwELS1nvIwDcDkI9ZLH1TwoyX48i
        PHW+C8IEIdoc8jkABm/9R6+EstPwIutHTRYUr5FVUigbBy7NL/3tRPkVTVcP6K+x
        onHCbXWbaDmolskfutvf1cOqdnRCJg1tEp/gdkgz8HUFrxxzgZz5khy9A437dw0=
Received: (qmail 2168012 invoked from network); 10 Nov 2020 13:40:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 13:40:31 +0100
X-UD-Smtp-Session: l3s3148p1@zIsC/L+zYMkgAwDPXxAvAEQD26z+TKuA
Date:   Tue, 10 Nov 2020 13:40:18 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] tmio/sdhi: fix workaround for a regression
Message-ID: <20201110124018.GA3612@ninjato>
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFpGX0HOQr4z4LEH9FLiqeRJzNiUpBLpCNquJGJnZNFycg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <CAPDyKFpGX0HOQr4z4LEH9FLiqeRJzNiUpBLpCNquJGJnZNFycg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 01:26:08PM +0100, Ulf Hansson wrote:
> On Fri, 6 Nov 2020 at 08:26, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > After some refactoring, I had to insert a workaround because a
> > regression was discovered when re-inserting SD cards. Now, this series
> > implements the proper fixes and finally reverts the workaround.
> >
> > This has been tested on Salvator-XS (M3N and H3 ES2.0). These patches
> > were already discussed with Shimoda-san and the BSP team internally.
> > However, I'd appreciate Shimoda-san's tags be given here to make sure
> > the patches are exactly that what we discussed.
> >
> > Thanks and happy hacking!
> >
> >
> > Wolfram Sang (3):
> >   mmc: tmio: when resetting, reset DMA controller, too
> >   mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF
> >   Revert "mmc: renesas_sdhi: workaround a regression when reinserting SD
> >     cards"
> >
> >  drivers/mmc/host/renesas_sdhi_core.c | 13 -------------
> >  drivers/mmc/host/tmio_mmc_core.c     |  7 +++++--
> >  2 files changed, 5 insertions(+), 15 deletions(-)
> >
>=20
> Applied for next, thanks!

Can we have this in 5.10, too?


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+qii4ACgkQFA3kzBSg
KbZaMg/9FXv7Ki/XM6daV8bP43ekPc5wBSEeH48y6uA+jCU7xZuY2faBpTe70+Rq
fc4zOqF4we+KnEzbu6VDTlzLBcRt0xI+4Xz1K/vVp3iA3gWBEJK5OgiGa/A/2lL3
dL+aOXP6Xka7T5Gb7gfCP42BSlzYfofYXiOqGPBKBmspH3ofZPLpp0fOCevzxqOf
8SquYEM2JWLolaiyw1TAJziIHUPqufrqfa4Mz6ura1EEk/JmAlVobdxLNppjwiL1
d9Q4hIwmgqhatzEqc/IpY1llhZ3XIExJWpCafV4i9Gd1l1ssGHvYAVrIYwD6+uuz
YpO/jEKU6v2eDpoJ22XzWFbUilhPVsARdnpYi2DLbE55LVXXnyysaNWkYr86j+or
GU59ss0qDk1rT5xcf4BLL+GSwJv8LgA4iOCDgLRFgcu69LLNy5brYyl/yoWeEeja
bZQNCQ84RytTQHFutwa21u4QmXYQsbdK1fMz3by/4/ioWrhKzH+UFs5QiHfo2jGq
Rj0Cia6Ip1G2Z5Anr+Xs5h8J/9wGj4vXZiit4JscqvrTdLhfopK6LBus4cKTQbk7
IorTtl44gcxLcGaWDHWn1YeEtXXlyTwoEConMKKWGWHfwe0LObGuDWuyjK4wJRxs
6lirNpwOCY/jqKrrHMsNGlE0k7NuEbDpbT4w98oG4MKkksO8Dbk=
=7yAt
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
