Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923A3D3277
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 22:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfJJUf1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Oct 2019 16:35:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40987 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbfJJUf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 16:35:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46q2s74MH7z9s7T;
        Fri, 11 Oct 2019 07:35:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570739724;
        bh=2iGd5ROkda3Y6J2MmH/+8mopajYGf+t5o0Gi5NzAir4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GAZBtPvkT4x2lVX1/F51NL9iqh/G9zECJz1ThPyE3Am9vWs6VtkB2cz5EMm++Ld0b
         XDtvZC8nUDjsxxp8CG/eg29+6KhKCBXBOSwBH9tDMHmEFok+UVzPLqWDSwWnIbrJob
         ZzN0+IqBWa/+9ANOsYUeW3Lux87vC0OLmcpukWZluhKaC5SQQwIw/oy01qshO0ji2P
         Y5aL1/DeLKNGHifZ75bJ5FSdTDaeOOPpYvOi8t/dR/hvjFc4LCGbhsI4I94sppyZeX
         3MSrYMyJB1zUt7fG7zFASr8SfxqKHmognaHXWbsQXK6O6O2WDtqqZ+HupiFSv2LO3p
         vM3fjivBa2P3A==
Date:   Fri, 11 Oct 2019 07:35:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove Simon as Renesas SoC Co-Maintainer
Message-ID: <20191011073515.2933918c@canb.auug.org.au>
In-Reply-To: <20191010123046.15291-1-geert+renesas@glider.be>
References: <20191010123046.15291-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V3S_2M9Xo6krU8dWBzoccDj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--Sig_/V3S_2M9Xo6krU8dWBzoccDj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 10 Oct 2019 14:30:46 +0200 Geert Uytterhoeven <geert+renesas@glider=
.be> wrote:
>
> At the end of the v5.3 upstream kernel development cycle, Simon stepped
> down from his role as Renesas SoC maintainer.
>=20
> Remove his maintainership, git repository, and branch from the
> MAINTAINERS file, and add an entry to the CREDITS file to honor his
> work.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

So, I will remove Simon's Renesas tree from linux-next and rename the
renesas-geert tree to be renesas, OK?

--=20
Cheers,
Stephen Rothwell

--Sig_/V3S_2M9Xo6krU8dWBzoccDj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2flgMACgkQAVBC80lX
0Gz6jggAkWH/aV4Ww6HxXnXq0XbwNVDhJTIfgpJ61ST9eggCpm1c3p4KHKvkd9s0
JLpzxz4Z/Yx9WkuDbHmRgnIoWu5U7AoJt6OfU0N3S8sciHM7OhuS5CbtZDusADXh
oFKDnFgnu+/c1onbP5to9IHSHzRtQm9cX72LfHJilKcgN94th7E6aRo/iouS9VMB
K0XFx+YHgqlKglpzvcT52G1jT10r+nfi30g/FqGMWB91PfPEoZDWTqg9ldcwMJiq
NpTqOMO+QGCe0rsZbvj/n9JI4kvIVrk4E9lFK1oStJfkqfDWAyPHlqTCWWxuLvxJ
ccioAcApaMOtA+AjwEMyv+nIFfr0mw==
=qwbp
-----END PGP SIGNATURE-----

--Sig_/V3S_2M9Xo6krU8dWBzoccDj--
