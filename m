Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A407F42141
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 11:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437467AbfFLJp1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 05:45:27 -0400
Received: from sauhun.de ([88.99.104.3]:57876 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727677AbfFLJp1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 05:45:27 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id 321F22C54BC;
        Wed, 12 Jun 2019 11:45:25 +0200 (CEST)
Date:   Wed, 12 Jun 2019 11:45:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Message-ID: <20190612094524.GA2153@kunai>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I was thinking about sending a follow-up patch to list hs400 here
> after Wolfram's patch appears in a RC, would that be okay with you?

Do we need that? The *board* does not handle HS400, so why add the
property?

Similar setting would be an I2C device which can do 400kHz but the board
layout doesn't allow for such speeds, so we are limited to 100kHz.

Or?


--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0AybAACgkQFA3kzBSg
KbaxpA//Se3AHxL90CgEfPjioPpqrYagiEHKorJuwyrhOD3PEjRzbRCU/FyoqbiY
tOyEEG2O3uLfsPWTa54rof1qqtwYp4b+QGRcJCsDnC1JcyfMb7HQG+XbUdlSKihP
ylLdcXWJiTXMeiqkmkDtO6Fb1OhrNI71yKurPNpzC5NKbKW2bHU9uzQZAaKvPIrF
Js72+Qhfwhzg1KSdeM/dytxctWpyWAoN7TiHQZyfSokyFXB5Twmw3bFXEj+jkszN
eG4T1lNsPf4G7KrA7YmiDgL/n2a2TV8ogQMFP9g4IW5IGIQRn1Lg+PcsOze1DHQ+
vLkg7Ijcje+8pPuLQLzgQ1h0dHLP7wc+93TRMvdCUHdsbSL0ZyNgvRncFBKKKchQ
5OihAJvfbKhvJ+zPovoZP14unAOvt0uNt1hPaw+63grFiOt5rVHH8rJ4uO9deYpw
Yg6dfX4Q40d1N8Bz/c72oDkmD3hXK9hmXgaA2BZXDdNGciOhBnTDUg4wmoHomLHX
u6vm+bO68/Km3Vis5qDiVw/AFOlorKDrDd9ETtxQTcFD2Up/A3Hrdff3aJ4mGjqx
nY1wTFjUmalwKUnvGxtRph97fQxwiRP01CignGBvESUlghWcGm6EhtT1PYFDb27N
L1rytT2efbKVBWSfMWgX0c6ulrCwdG1s1iBOMJ4lpTtEZz6jhT8=
=0C6z
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
