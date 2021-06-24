Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE043B326B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 17:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhFXPWD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 11:22:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230087AbhFXPWC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 11:22:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7444261374;
        Thu, 24 Jun 2021 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624547983;
        bh=KV10zHBSqlCkuKc2RJJQDADhYV4Qrdmr5zoSUOufvyY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SWsageM1fKXEYBFcT6G+t4lIrigXJtbHW7dNMFYZTCnjAD8+z9FqYUNHYR5TqZEvQ
         D0E/hElsjg1sUo3YhmxFP3ahKoJ4xUH8Vh+3loTSImVkpHEPl6wrCP85B8/2qcKrtw
         YMwxGyNanIRc6+1nUbZTJrk45G4JEUWvUyvc0Q5y/00NK04u7GQOlvXsnSb18dBw+6
         8w+JoUCvzrAvhcUDn8fYmKwIkA8n4hKthWL40drJUF3U3ygZyjKfDN6uwZqc/dUbY1
         uZ/R296o+k7J/ZjSy9NFYa/8fCYZuezNa3AT+flNP7igk7dSYSrKuk9fXyeH5xudy5
         i/yVTPyntF7pg==
Date:   Thu, 24 Jun 2021 17:19:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G
 and M3e-2G
Message-ID: <YNSijAdvaNzHNnkF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
 <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
 <CAMuHMdUJQCv7Qe01Km=6F=yUjcNoo_OvOBrYpPcC3SbhX0Ru5Q@mail.gmail.com>
 <TY2PR01MB36929E0DE956A374B8CF5EE7D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <YNQi0w4zsG01ezgu@kunai>
 <TY2PR01MB36927B0CCE7C557A3115E481D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mk2WMQJ6OjkrKA/s"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB36927B0CCE7C557A3115E481D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Mk2WMQJ6OjkrKA/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I don't fully understand how the refactoring should look like? Is it
> > moving 'struct renesas_sdhi_quirks' to renesas_sdhi_internal_dmac.c and
> > merge it there with renesas_sdhi_of_data? Is it really better to copy
> > this struct per SoC? Most of the data is the same.
>=20
> I also have the same concern. But, I guess we can refactor
> the renesas_sdhi_of_data like below to avoid increasing data size:
>=20
> struct renesas_sdhi_of_data_with_quirks {
> 	const struct renesas_sdhi_of_data *of_data;
> 	const struct renesas_sdhi_quirks *quirks;
> };
>=20
> And then, we can keep of_rcar_gen3_compatible and
> we can add each SoC's renesas_sdhi_of_data_with_quirks
> and set it to the .data.

That sounds like a reasonable approach to me. This would also allow us
to merge the quirks from sdhi_core with the quirks from
sdhi_internal_dmac.


--Mk2WMQJ6OjkrKA/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDUoogACgkQFA3kzBSg
KbZzQw/9GYBMM268CNgZPNIylRBi83cLVXIzwCzVFdoN7NFsKLR+PfRtj7sI0sm8
krvF9iV4AiQSOqOkQq44fMg8TX4SW104chpSowL1wCOJi3RB1GeWnCrk1Ob8fpTE
lU5iYr1AqWd55m9wpqA0ELBhJcvbIVUs3YCEWq2o2lWhQn/cElqfUfw+7r68j1df
f4O0kyU4ZhAMaBrpnC2bnseFFchgPtdpeoAgQHsX6TEqGwIfuPY+OLt32CWVFL1x
EyeT9mXOqc95Ozqs3CbufzMbUT9W7A5VW2+X1ZiV2fSE1yUhKRJP+fGY4YUibLrD
iS+Oi5HcTYQj+2vOEFuGpVTAoJy8Ay8n9bPx20nZTFEWFvUWNw/AE3VGIZHF54n3
jSNqlSq0VqtczcfIULSPMvl6UxjWDadvBFkAxf2SqKHItU/z0hmCs65DyObK5e14
2HqOIvdp1ZF0ps76BLpryqh+TFQ0/ljazB6cQAlEuyTeDyTx4dOFlPOGyWspSknI
sfjwe+wD25WiXCPGDyOa+ZdclOQUlXKAL/k/Fcso1pnumd2BbDyZ/QeDL+gYj/r9
ACzokBxFu1Pu2xyFtkehwYVV54hw9Yszj57iwrQ200IHC4gHoS0S0eYWoRJ/a0aL
lRmkAAkOjGEVOul7ipcKb+lQAcFxb8nJ/sexCEhuN3DXA5SaKcU=
=Btk4
-----END PGP SIGNATURE-----

--Mk2WMQJ6OjkrKA/s--
