Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00CC9158B98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 10:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgBKJHR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 04:07:17 -0500
Received: from sauhun.de ([88.99.104.3]:50172 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgBKJHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 04:07:17 -0500
Received: from localhost (p54B337A4.dip0.t-ipconnect.de [84.179.55.164])
        by pokefinder.org (Postfix) with ESMTPSA id 7EB372C0740;
        Tue, 11 Feb 2020 10:07:15 +0100 (CET)
Date:   Tue, 11 Feb 2020 10:07:12 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 1/6] mmc: tmio: refactor tuning execution into SDHI
 driver
Message-ID: <20200211090712.GA2024@ninjato>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
 <20200129203709.30493-2-wsa+renesas@sang-engineering.com>
 <20200210224416.GA2443363@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20200210224416.GA2443363@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

thanks for the review!

> > +		ret =3D mmc_send_tuning(host->mmc, opcode, NULL);
> > +		if (ret =3D=3D 0)
>=20
> The variable ret is only used here after the refactor so you could=20
> possibly drop it and just check mmc_send_tuning() =3D=3D 0. With or witho=
ut=20

Yeah, makes sense. I will fix it.

Regards,

   Wolfram


--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5CbrwACgkQFA3kzBSg
Kbbs4hAAo+HtRm2tZ9TOHfs9z9z0OqAx24bpW5kdZ4KaOKt+3Bag6rjVh8k2JzGo
cm5MiAcRIY67yCDLiNjDpcJLJ15L8slVneXdh1MPQegAgYv3dstHC+srprZkSUsE
RFAZFwtfKyXPM+FojvK16w4xpcgLStW04+Q1QT4QPj1dzSKX9BGvar/VmRMPNCpP
r1Y19BV1QFDsLq+1zKv+xyJtNQNHVglPkb1kbfIfqqrZ/2tMB9AsLKEMyMctTnTe
YZS6+P0lycIoZkMamcUmZCLAFpjaMg0JJUf45FBF46+YZyV6leuKCy+jEqCrdHTB
0wHN3uk0XzaQohZuCTB9Bqt+3KC+SMhgAc6p9VZFg3Ji1+t4x1oiW/LZLpmpBsfO
isgvk/1NY8DEDjM9F4wFbexFyZNkF2cmdleljuqlbFdaHsmSP2QRTee0ZWKBCYvK
XmSCts6FZWbDePh3bE7oFqxz6zWQ+g0sR94Hq0IwxNn0rqjhDFxjKZYKZydil66D
KOyzh7aH51zaKHUasI35vWnZerfDYEy7FaGizE9C7dEQrUXTE02P4HfMpeX5edHv
FS8qFsp8ogQLFWsgycizspMyQLU156mLcXDhwhegFRp96NJJqFTiPx3LtNU4NJj8
rT0Bbh/TkflpdXdxcLfnPdOgAapXDwinAwkeijFO+r4FPQnDpX8=
=MD5d
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
