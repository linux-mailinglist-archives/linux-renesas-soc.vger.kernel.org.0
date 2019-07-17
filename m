Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D20576BCF7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2019 15:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfGQN0K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Jul 2019 09:26:10 -0400
Received: from sauhun.de ([88.99.104.3]:52062 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfGQN0K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jul 2019 09:26:10 -0400
Received: from localhost (p54B3309B.dip0.t-ipconnect.de [84.179.48.155])
        by pokefinder.org (Postfix) with ESMTPSA id 5D41E3E4757;
        Wed, 17 Jul 2019 15:26:07 +0200 (CEST)
Date:   Wed, 17 Jul 2019 15:26:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit
 EtherAVB to 100Mbps
Message-ID: <20190717132607.GA1458@kunai>
References: <20190717125739.21450-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20190717125739.21450-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 02:57:39PM +0200, Simon Horman wrote:
> * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
>   August 24, 2018, the TX clock internal delay mode isn't supported
>   on R-Car E3 (r8a77990) and D3 (r8a77995).
>=20
> * TX clock internal delay mode is required for reliable 1Gbps communicati=
on
>   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
>=20
> Thus, the E3 based Ebisu and D3 based Draak boards reliably use 1Gbps and
> the speed should be limited to 100Mbps.
>=20
> Based on work by Kazuya Mizuguchi.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

What about adding a short comment explaining the situation?


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0vIesACgkQFA3kzBSg
KbYXAQ//eY5vLCU8SydfxuIYBpGgt01P4ilDeKmuGFtqppatLHXhyUhtDR2n+yp/
bgARhaNVdJyBPpHzrfslUFYlIGZ4V/hISsmE8PgMIRSo3G5CfXpHcdKdD8oKvL+5
gyLpAxOW+qCaOPtgPkDxVh1Hl65XiODn7U4UwhqLW/TqDaosQGXW9/eVFgILg5HM
UlOGbCxeVeWTt0vyyRayaVJZjNi85xUdArTWbw6WBxEwTFJWY/1M2GMostHAV9jN
6H8v/IqjsQNpzRrIsYYfyXIqKalxCFPzkVWSbDb4PK7kxjTlOOzRqGbaDUMowaDg
NMWFTC4Yre+UfxY1vX6fbjzSZRvdjfVu4cx+7fwGwZx7SllAqdgzBCH8IerVd0Wm
BetO1MvyLpTuO0Uzt0LI7EvIMfRCFcR1ckBAf+wwasYLRXxR6x4mXj/TnkjbOjI9
MMjayYzWopeEBh1wyYv/2E8hNoR2QHkCr/+8I7zedPTcXCBZ8MimDFT7eDg3M3jv
kiugpAaun3+w3VRpCGExZwZjzPWxoaTeDWh/C4hGZ7iKM0hrW+y4FPcOrDCniVzb
25Ql0hAH3Zz6UN3lAKuXoy1WTlrAV1tvKh7IUCBFz85YnIT2tHQEKVMnlwDxReee
uUJRwy0slD68jRbcGvkTVSRIkS+GnV8aY+vBKYSI0kAZDC8o+h8=
=dsjm
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
