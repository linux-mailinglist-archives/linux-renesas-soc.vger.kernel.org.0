Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9B9498B71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 08:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731739AbfHVGfi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 02:35:38 -0400
Received: from sauhun.de ([88.99.104.3]:56614 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727476AbfHVGfi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 02:35:38 -0400
Received: from localhost (p54B3343F.dip0.t-ipconnect.de [84.179.52.63])
        by pokefinder.org (Postfix) with ESMTPSA id 892A02C2686;
        Thu, 22 Aug 2019 08:35:34 +0200 (CEST)
Date:   Thu, 22 Aug 2019 08:35:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: tmio: leave clock handling to runtime PM if
 enabled
Message-ID: <20190822063530.wzee6gy4d2lisj2x@katana>
References: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
 <1564589857-17720-2-git-send-email-uli+renesas@fpond.eu>
 <CAPDyKFotQvTAC8OVVRiEqLc0ij3XNVdL3eyNHioK0YEWxvER0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xnta7dnbv7kckfzp"
Content-Disposition: inline
In-Reply-To: <CAPDyKFotQvTAC8OVVRiEqLc0ij3XNVdL3eyNHioK0YEWxvER0A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xnta7dnbv7kckfzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

> > +#ifdef CONFIG_PM
> > +       /* PM handles the clock; disable it so it won't be enabled twic=
e. */
> > +       if (_host->clk_disable && pdev->dev.pm_domain)
>=20
> Hmm.
>=20
> This seems to work for most cases of yours, but it's fragile, because
> how do you know that the pm_domain above is managing the clock? You
> don't.
>=20

=2E..

> I am going to think a bit more about this, but at this point, my
> gut-feeling is that may need to add some helper functions to let genpd
> and/or the pm_clk framework, to share some internal information with
> drivers.

Any outcome of this? Do you want to do it?

Kind regards,

   Wolfram


--xnta7dnbv7kckfzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1eN60ACgkQFA3kzBSg
KbZ8Jg/+P+Gl2f7dNKdjUiBhpesovbr73kHwlAnwapdedRcgbv//36l4s1Pip0P1
+ulYeJtufUOtaoTMMP6xFEbUazPCbzMX/pGhukh389pmyWJAIaIUPVYzf+Bh8iOW
F/hgEtzVnOKx2jkILXCSXVrJFIlSAIT9kXy/c2MFcsGFEhCV5dEjFkOSUvBL8icm
q48dA5SAmzVA7sLkb5W1Pra3PywBEMkWOekHTEm+WPJ0FPPcmcKe8gJ9J59NT58m
CAiVGl55L23jx2MRsc6Glqj3QRtI66/BUjMwF3NUzlkv6VdZ6Ym6lEI2kqJ0qyE8
hbHmfCpi5X+VE4wLZzQlNUE7PH3vH5I9cYhLTJ1s7gEERBAqeIbD32DOIkk8Xy6P
Dm1OyJBjbNqd+x3zew5Xt41rr1ntntmgYRcU/UECLNfn3vZayAc+BVZq5L3SJguX
OA8ScprISlYA+af/CJQY91lE/EMTvjqJeH/Na9jqzFGnge1N4gN6R7MP1CVEe8Pz
UL6c3/46SpH2YSadsb6AqQcI39kataDxl63TffUtP68dVrsoNZtfjQMsht5TSepo
Ba08uNj6ywmekvenPcWI33+doEF7oUTPXzeaLnC//0xAoRvjF7QHLNHt2cc43gvw
vsiIr2csd+IV8YFLSsZAkcFGa9o+wZcTG9EdOFl39srM5x1xYK8=
=+Zji
-----END PGP SIGNATURE-----

--xnta7dnbv7kckfzp--
