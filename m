Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 614F634C71
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 17:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfFDPl6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 11:41:58 -0400
Received: from sauhun.de ([88.99.104.3]:47468 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbfFDPl6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 11:41:58 -0400
Received: from localhost (p5486CF7A.dip0.t-ipconnect.de [84.134.207.122])
        by pokefinder.org (Postfix) with ESMTPSA id 9C0173E43C2;
        Tue,  4 Jun 2019 17:41:56 +0200 (CEST)
Date:   Tue, 4 Jun 2019 17:41:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
Message-ID: <20190604154156.GA6731@kunai>
References: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
 <20190604151530.7023-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVhv2GAv6ha-Z6OQZC-yFmYDSMexsrNxHXf2w-6B+tj=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVhv2GAv6ha-Z6OQZC-yFmYDSMexsrNxHXf2w-6B+tj=A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I think the above 3 lines can be combined in:
>=20
>      { .soc_id =3D "r8a7796", .revision =3D "ES1.[012]", .data =3D
> &sdhi_quirks_h3_m3w_es1 },
>=20
> Or do you prefer separate lines for easier grepping?

No, I just forgot one can do this :) Will wait a little for further
comments and then fix. Thanks!


--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz2kUAACgkQFA3kzBSg
Kba1rg//XO2Z3JcKBn2CCEC0HteJMQEIJF/Dl8mz5TrWndTJTpHiyURdlEiVfKkf
OdmICNSEVI+desVJDS9AnerG28EKT03T6xOoaynNw4cI/x9Ys3UWnWTgM5DFuCSy
FRY/Ym7yzKv1cgQtrd0zQKCxWTn0fR0cI0xVatme0kirxCl4tARJUkz7LV3SH7Wu
vkxqkcV4clhQbVeDlgd4psRojDOHtW1bwC+5S3x6DNvEshW5CuqNzlmP1Cqvxf0x
fnMuh0/Pp/vYIaY3nr2Avg0MorERTVItT2ONNk4R/OtuDPer5wS2NHzaN6TPt7K3
PKx/ZZRQn6utqTn5UaAAZGvo7BPg1M77r8q0NSEX+ogBpTL8QrbykvxCqwo3xBhe
du7lz9gvJ+pOYx00wnYmNwpKkG/6r9WICnAZqpmNscIl86lG/08iD4LaIb2o5G9f
cF0jW/v7Q9M/f6xY93ecyUyN8dus0GMdf5TA+9mVYKIHxBGEhgyXgHjJ1CJX33bh
L0M1DHz6iPypOZ2XgnFKJTf7ykxENZkSw/btjoAnGPhpzkS6CtDnMxSs18B2/NxQ
Y8r/atWGlNOY3XY4LZRy2rrlOwEta/EdVE1gvyy8tRXJ+zvfspxuS863xsTdDDVG
4z6+qmkwVK65tga3p2/Tm3znke1OXIeCH/4Bqwh6PsF47w56sF0=
=TrtT
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
