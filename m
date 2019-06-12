Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD55C423E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729933AbfFLLTC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:19:02 -0400
Received: from sauhun.de ([88.99.104.3]:58782 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729752AbfFLLTC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:19:02 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id F0A042C54BC;
        Wed, 12 Jun 2019 13:19:00 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:19:00 +0200
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
Message-ID: <20190612111900.2crgsg4adinrrw5u@ninjato>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
 <TY1PR01MB1770B85D549CD20C963620E6C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x7x26x2e6rxmlv7d"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B85D549CD20C963620E6C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--x7x26x2e6rxmlv7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


I think it is confusing to describe a HS400 property if the HW is not
capable of it. Even if the driver has a safety check and will prevent it
=66rom being used.

But as I said, I won't be insisting. I understood it simplifies things
in grouping boards. From my side, we can close the case here.


--x7x26x2e6rxmlv7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A36AACgkQFA3kzBSg
Kbayuw/9H/f5108nrosWSuvxyd0anllMECnyPihyEQEPXjde5O2gM3IznMrzmPV9
97Is6XRx2a102SvTtWHEcYQ8nBP6LPob0QKaOGfyjaug4DdgsIhvpi90RoDq58ud
6X4gxJWkxbCmEmvi78EOS4tkQ/zo/kQos3ZhoG1UHeJfbSyJ/cHmqLPkT1CspOib
CzWf0caEuucYCEosie0foG1jv6RgEbWTKQrLUQZ2QRN+IuxstwgkfQwOL2mbSNRq
nK3bYD0Of0In5CNufwQ2MwgwHZ6Y5sMwnD+OXeCBf9G8AWK5jYghxuJn6Ycu6LeX
zlJ46ZLQU6n8M7zA4olfDzeNZ4FPreedzdmcMLH2eB5BEAcgiUm2oCGLQPV7lsP1
UAbSKXhW2OJolC/CP3diXftX809c2CsWO1hFMfrOFIkLV6qgXGwosK1t831srsAO
LHoc+563g7fSd4kqilpVqN+blcJEoLK4k16kjuVquRU8oYqOh+tYnAC+eRUvIVUG
3qhjxTDIrrzjmXkkKRh1mZZnlueWFSlUDpGFyJ81LHJizItCkUVTmF9UU1TglURd
ZQjY5Caqdeg0evzxf30BQ/1b8DynSPbtW5uRFtkngrikUuY+4i2qQfA8fHi8EWR1
xUKIRa7ArPILAQeJ/qEGlhWGmmeYNv5lsBL1XO64AF4ueHZVJB4=
=NjrV
-----END PGP SIGNATURE-----

--x7x26x2e6rxmlv7d--
