Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01C61B5B41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgDWMTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:19:34 -0400
Received: from sauhun.de ([88.99.104.3]:33760 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgDWMTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:19:34 -0400
Received: from localhost (p5486CE55.dip0.t-ipconnect.de [84.134.206.85])
        by pokefinder.org (Postfix) with ESMTPSA id 444FF2C1F65;
        Thu, 23 Apr 2020 14:19:32 +0200 (CEST)
Date:   Thu, 23 Apr 2020 14:19:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi: avoid bad TAP in HS400
Message-ID: <20200423121929.GA1130@ninjato>
References: <20200422125914.16590-1-wsa+renesas@sang-engineering.com>
 <20200422125914.16590-3-wsa+renesas@sang-engineering.com>
 <TYAPR01MB45448C2024C50BF3FB6B7EF9D8D30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB45448C2024C50BF3FB6B7EF9D8D30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +		if (bad_taps & BIT(new_tap)) {
> > +			new_tap =3D (priv->tap_set - 1) % priv->tap_num;
> > +		}
>=20
> I think we can remove the braces.
> After removed it,
>=20
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

True. Thank you, Shimoda-san!


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6hh80ACgkQFA3kzBSg
KbYk8w//dSPbVYe5FrGMFecJxj+xOk6ZReorwOKoAS1D6Ug8bc7NpJ2Zadoj0TMN
pe3+rmA5AYN/0OIn4cjyHf0tEoEzr4WO8v7nfBKBL+BIw+AYkDMxMDLuFoJlZAsk
sazFasXnUHB2AOt7FLeOPNsydvcNyRjdNvXz/7/YB3fTyjhZQ2r6YL36wmltolzE
Ib1ql2BfWOGhtqbX+jlz5iyXIeIVG6QewLAWS/OXjLLLZd8Fjatoyg7DE1RlFmtl
DUzNkEhOEEbAVkJDF333cQKv/hbo7/IidV2DymarekASwEhGrIPo30K5wtdevWzj
nmW9eLcjQa572q4id3+xF0lRT/+thohx0I1yOpY+K+n6bQb8Zhtb8fagw2hju/Td
JsEwrXHeVLRP92MedLZpXFSZvBiI+9RKqo1FLcaBJerJl18leHeIrHpHKAvc0lwl
ju6791wn6JvHsnTrAEgTHXbuNCEY/RU5MPcisrKnrvHkVoj3XajA84D6z4I8J0ak
O6RjUf4NaAhxtBJaUkxbEPNDHEOp0Dp/xTJPSjGp4ia3pLAuWnIkfZpMmS7Zdrjr
w5EZRTVcWvbE7LlDfFLCoQ9ZVPnIM3AdAmKi+G54UUaZF8MIZZo5r3F8uQj4buPs
Nnw8NMwzKjN+0iTqkNhvNtUp2jNNgL4+OltLG6TIxXdzy9MSg9I=
=erwS
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
