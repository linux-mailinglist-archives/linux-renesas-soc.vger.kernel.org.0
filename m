Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC52203BA3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 17:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgFVP4X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 11:56:23 -0400
Received: from sauhun.de ([88.99.104.3]:40430 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729095AbgFVP4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 11:56:23 -0400
Received: from localhost (p54b3337a.dip0.t-ipconnect.de [84.179.51.122])
        by pokefinder.org (Postfix) with ESMTPSA id 141942C2062;
        Mon, 22 Jun 2020 17:56:20 +0200 (CEST)
Date:   Mon, 22 Jun 2020 17:56:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] lib: update DEBUG_SHIRQ docs to match reality
Message-ID: <20200622155616.4rbhhiuce36aqc4b@katana>
References: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>
 <CAHp75VdMPt60CKnP1HtkN8=3iY7+Kgrv6b9DTjcj-KMKaRknvw@mail.gmail.com>
 <20200613113924.GA5578@kunai>
 <CAHp75Vckh3NERodBs3e8wo3NxbrP=BPRY5g7MLmA4szqLFcfjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m3chytxjt3ldrgkl"
Content-Disposition: inline
In-Reply-To: <CAHp75Vckh3NERodBs3e8wo3NxbrP=BPRY5g7MLmA4szqLFcfjA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--m3chytxjt3ldrgkl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> > Maybe your case was like Krzysztof's case where the issue turned out to
> > be the extra interrupt on deregistering after a deferred probe? He
> > thought it was the initial interrupt but it wasn't.
>=20
> Commit
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/iio/pressure/bmp280-core.c?id=3D97b31a6f5fb95b1ec6575b78a7240baddb=
a34384
>=20
> The relevant IRQ core code
> https://elixir.bootlin.com/linux/latest/source/kernel/irq/manage.c#L1774
>=20
> It runs it at deregistering, right.

So, can I read this as an Acked-by?

Kind regards,

   Wolfram


--m3chytxjt3ldrgkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7w1JwACgkQFA3kzBSg
KbaB7A/+NAwG03m74hhJ9sXauZk7atzG9V/IXj78LDII5tppdPI7qxPYtek0d9UZ
XWwk7Tx0UUBDipc2kTVxiPM94sd4kyX2atfQEOSGANEDR/euI+4vff/W5RtSn8+7
pDqOcVqiLaKLgK4Vw9XigfRV62hsaohNlrUBJMLNPC13KrfmVLB4hfGN9GrNjSWO
OWUf6opnLyHcZxnK3Ox9eghk5YpCjRC47gCY/8lzH/Jsoa62CwaZEawLkKacSHBY
tbNIJWLP7TbTbN8IJ9wwzEM8pTcwm7k7U/o4xDPmzucOcV82DKzW0wpqif6SLn/C
FdZhGDhlHp7qv7qfKwC22QzDfJZo9vR5FDeHSslnbbd3VdGYCdezZN+NGPGN+vk1
OWSAgIhmTl8LzkS0lbZxLFD1Q32OdjqFbLNrhBNjQdJjkzVQSz5JQFlP50zTUdj8
QknWlNZhNlW3C8ewN96LpWPXKhSgQwpWjyGLfQlGDdXEjRpbAzgdIqc+iPvoYS4t
BhtBtDrg8X819W209i2UfZhKvSmpbxh6lRsNA7KFfw6PXQ6E4mel7DRHx89UB0d7
Z5Rw5ghGJv3KjDZI8tTZpE1nDsQc3JIZEx5J7cAl2WtK1sQfOd0Pxmm9LKxfnrAo
/VV8FZzYo74halNxo4jmhcvraSKHvNSynboRu/uomdbcUc1itSA=
=39pM
-----END PGP SIGNATURE-----

--m3chytxjt3ldrgkl--
