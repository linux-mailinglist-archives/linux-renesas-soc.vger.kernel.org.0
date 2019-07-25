Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A04974842
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2019 09:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388167AbfGYHfd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 03:35:33 -0400
Received: from sauhun.de ([88.99.104.3]:47604 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388166AbfGYHfd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 03:35:33 -0400
Received: from localhost (p5486CDF3.dip0.t-ipconnect.de [84.134.205.243])
        by pokefinder.org (Postfix) with ESMTPSA id C4C872C282F;
        Thu, 25 Jul 2019 09:35:30 +0200 (CEST)
Date:   Thu, 25 Jul 2019 09:35:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit
 EtherAVB to 100Mbps
Message-ID: <20190725073530.GA1323@kunai>
References: <20190717125739.21450-1-horms+renesas@verge.net.au>
 <20190717132607.GA1458@kunai>
 <20190724105203.thykr2staw22gdj3@verge.net.au>
 <20190724210441.GA1559@kunai>
 <20190725055721.37mcdtpeer3knrxa@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20190725055721.37mcdtpeer3knrxa@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Sure, how about something like this:
>=20
>                 /* TX clock internal delay mode is required for reliable
>                  * 1Gbps communication using the KSZ9031RNX phy present on
>                  * the Ebisu board, however, TX clock internal delay mode
>                  * isn't supported on r8a77990.  Thus, limit speed to
>                  * 100Mbps for reliable communication.
>                  */
> 		max-speed =3D <100>;

Yes, I like it. If DTs have kernel coding style, there should be a blank
'/*' at the beginning.


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl05W74ACgkQFA3kzBSg
KbYflRAAllcDSSlsTgUOvKvUUlEGDA+QBMXfKKpdjWrsXoSEZ8qSZ0D56GCDCvg9
BoLqSuxWETsn3fXznuCjEjbfd1oFOs+eJreWQ15uF0C8Tek7ax1EMozoT2/gRcyQ
jSfqq26vSjoI5CQx64UcevMLdyhPEtmEUjyX9jPJdnuOsOuksP/Je2vl3dlmTETq
PL8KNEG1tlJe0Y2NUN332DD2XlZZC5cQ4DsRnjfqHd6jAy9rVYC+t+Rwd3+D7/D4
ZgdaO4NRbQLcgt8Wz5i0C/qGiXeSct5Y5Hw7ZMh9zxHvnICIYPqTFt3DubjOXo8g
rV0jmsLBYxV/xx1p90B/ZV7cfL9IH2fzq6+wIVmmkNXmZNSe+r3AvqV8iRJyrSzB
GISmruXZQqNA8zanWXzsOagn1DjufSKxt0VMW4BeFU+g8bHQ+XIP1oIjwzQkHa8T
XFmbCYZMuyRaBq6Mt3Cy1Am4+75QSc62AQiJQodxufhwdg7vOnyUBrm/bIE90Syo
05XIHeIJANrDYEi+wrPLS0+N1e7Lcy4yeV5GLDzuwT7vJkHqOrh38vF1qC/BWDRO
CEXXqxyU3n0UEK24cBaDgWvWb8jxecEMkCGgzpnZzfcqLLsETE+kPrjwG4puKFw5
zb6qtmuzgyuR6RPk0rtuvjJSDdK3XX26U/f1WxT0ecHtUTiRhX4=
=tJz7
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
