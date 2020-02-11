Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29404158B9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 10:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgBKJJ0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 04:09:26 -0500
Received: from sauhun.de ([88.99.104.3]:50214 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgBKJJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 04:09:26 -0500
Received: from localhost (p54B337A4.dip0.t-ipconnect.de [84.179.55.164])
        by pokefinder.org (Postfix) with ESMTPSA id BF1A62C0740;
        Tue, 11 Feb 2020 10:09:24 +0100 (CET)
Date:   Tue, 11 Feb 2020 10:09:24 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 6/6] mmc: tmio: remove superfluous callback wrappers
Message-ID: <20200211090924.GB2024@ninjato>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
 <20200129203709.30493-7-wsa+renesas@sang-engineering.com>
 <20200211000239.GF2443363@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20200211000239.GF2443363@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +		host->ops.prepare_hs400_tuning =3D renesas_sdhi_prepare_hs400_tuning;
> > +		host->ops.hs400_downgrade =3D renesas_sdhi_disable_scc;
>=20
> Would it make sens to rename renesas_sdhi_disable_scc() to=20
> renesas_sdhi_hs400_downgrade() to fit the pattern that it's called from=
=20
> the mmc_ops?

I also thought about it and came to the conclusion that this is more
readable. To downgrade from HS400, we need to disable SCC. But no big
deal to change it if you/others think the other pattern...


--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5Cb0QACgkQFA3kzBSg
KbYRAxAAo5mok/HGcZEGiAouMzBo24qzhoOZBv/imBiDgpSUNnvQUMU/R++fy1El
YBa5yDrnn8AhJEInZ0aqHa2urZAdS/ZuMNi0r6pTnUc5Z7xJp5nsF4JKu9dH5cUP
hZzucZ2vNaBsg1C3gFD/Xoxjus7sbKSuf3lzI9lQKz8W1NkTyyWa911s7PSPThLU
yHBA07nh7bCt3HEUk/jRhfkpILURyA+qTvvGLXHAJgleh5ScmfMJ2vHRVJnreLng
GiKDG8YX+eN4qiRMDrB6yIL1RmBuReltL0zltNqBRUNeRSAMyNOXSVcs2oz+YZh2
sHiO+kgijGrTujx7sKqx0fRLD8ZKkESI+0d5VRlSCCrg1DOHtibyzSfkY8yjzXr4
vexam6MPgLqtCzFgcI1MPrwvbUt1onzGRRMjK7A6bQKlIXRH6TCsuoqqloaDEwQm
wUCuD4QwqDh0GwG7+4r09ZB6D3cL0SiXcVxznSCwNFozyQThcFPNyklwg03VpGyK
RTwAY3lMJQgTVSfSRRcJ4r3CC9tkhdGdXIWgcpVfWxGO1/Q0BEYTIKyvcbhXtHms
/a8RgDUzDh7NT2Mgx5Q1N/2WK2wlau3qdbKELLDdK2XP2Rl3gghr+jAyC021jpi6
IfxcpGaq7E99Y99e0oXIR+xiXeec95GZ7k6yVa0ZXpgInJhf2SI=
=G51t
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
