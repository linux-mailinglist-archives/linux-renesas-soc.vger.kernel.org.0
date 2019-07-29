Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA0507877C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 10:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfG2Iea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 04:34:30 -0400
Received: from sauhun.de ([88.99.104.3]:38398 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbfG2Ie3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 04:34:29 -0400
Received: from localhost (p5486CFB7.dip0.t-ipconnect.de [84.134.207.183])
        by pokefinder.org (Postfix) with ESMTPSA id 3035F2C35BF;
        Mon, 29 Jul 2019 10:34:27 +0200 (CEST)
Date:   Mon, 29 Jul 2019 10:34:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to
 100Mbps
Message-ID: <20190729083426.GA1381@kunai>
References: <20190729080356.13023-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20190729080356.13023-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2019 at 10:03:56AM +0200, Simon Horman wrote:
> * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
>   August 24, 2018, the TX clock internal delay mode isn't supported
>   on R-Car E3 (r8a77990) and D3 (r8a77995).
>=20
> * TX clock internal delay mode is required for reliable 1Gbps communicati=
on
>   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
>=20
> Thus, the E3 based Ebisu and D3 based Draak boards can not reliably
> use 1Gbps and the speed should be limited to 100Mbps.
>=20
> Based on work by Kazuya Mizuguchi.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Yes, this matches all the previous discussions to the best of my
knowledge:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0+r44ACgkQFA3kzBSg
KbY5PQ//Tn9hY8BpQBlzmkBgp0Vb+e4od1DjjojwtSQH7aDBkA2LjrQ1ab/QTBXB
fOHqCFFMv0XIrFMAgChgXtRNXvnDuwJCeraIGV762Qv1vYUe/G+o+VFIEC8GU1IT
XXqSiJeDR+RTyV6iv3yHjkvkMRwJFRtu5iDgZ7UuLIrKYCQYHdkF1c+0tjkATGnb
I3U/kzvkQCmDEhU5inD8e7pIr8EtHdXwvnR8d5iPgTNG0JF9jwKg5WObU33uzfvJ
b+Qs5G8OWMR0e76cxe5XrqC1wrWdCM6D6BP+vWYncZo8hqP4r4wgIYOSlxOsQ1Jw
MqCtPLRyw1x4GgylwsfC/fr+efRTlMzHnTyRw/giMhjq3LOlQXyG33H6oRDBl7QG
H+J/ToAL7a2mcuPiLKojmIqEKr5lClRY5Rr0SmWjDNMgYZgUE9ZgQHAKryB7ca69
Zd6ZYpm/a7xSg9Mhj5XOvXRP19segJXEkwhLwTc0GlS2XeEwTEa5yHd2bJvo1IWE
UZQnk+xfAqt0FbSgg6+3fCMoKSzJ0s3A524opVWkWqkPu5uQrDsSeMdVXJAwT8h8
dQ2bvXMXTDFI/uy1X3hFvcOmAPfcGrSqVlwdwl12oMHad0QBa8vtC+++3/Bscu20
hrteZEvO6LmiiGOJ1PclsuLAuFxfJgx9cHcxzF45ye5cdrkx2vs=
=Pn1D
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
