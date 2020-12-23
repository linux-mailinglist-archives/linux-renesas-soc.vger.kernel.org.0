Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E51A2E1F0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 17:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgLWQAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 11:00:36 -0500
Received: from sauhun.de ([88.99.104.3]:59766 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgLWQAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 11:00:36 -0500
Received: from localhost (p5486ccf0.dip0.t-ipconnect.de [84.134.204.240])
        by pokefinder.org (Postfix) with ESMTPSA id 1C2622C052A;
        Wed, 23 Dec 2020 16:59:54 +0100 (CET)
Date:   Wed, 23 Dec 2020 16:59:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com
Subject: Re: [PATCH v2 0/5] pinctrl: renesas: basic R8A779A0 (V3U) support
Message-ID: <20201223155953.GB892@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <20201221165448.27312-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This series provides basic V3U pin control support, up to and including t=
he
> SCIF pins.
>=20
> This revision includes fixes for numerous issues found by Geert in his
> review; see below for details.

I use this series to enable other devices. SCIF0, I2C0-6, and AVB0
passed all my tests, so far. So, I think I can say:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/jaXkACgkQFA3kzBSg
KbZD6hAAiuTzw/QcQ524X/UuX0NR6n9xH6PvunIQTbBbRn/IDqRoSPpM19k68nkb
7hKJpI4g3BiRfYvA4pL6IQYUyBsqaHUjY58unXVnDULcJShQyDXS5ltaHEybJjnO
OqrAIOmxI0elbt9mBUBVNqTnAb2BBolKIKH2wW0PytOqiNzaLd2mfxQYaBy5l6UD
nhPBsj8nz6cWC2sGS1S4IiiUM4dKPXV0mN7BnIhOXTZodOChmRnqbh3y1aXOwxHI
uPZffgsMFPVaY3utx9RXSdjCV7yLj7oQK6TEYQlzwxeCITKRpCVbD/iC+Zcaas5H
ypTTdbCXFCVLrRzbULmw6thJGpPPHhYhyXVJk9GmJRcKA5kaoaR+ELw0+GWQr/ZM
FuzoYXy8oQwEXy7PgAnPO6pAAoFl3N+lwb/cu2DydPELe4nunt7FjccdbR9bgh97
ApVa+IyL2A5Tdcg/IEMz3gTurrbtZH6V520IUFVI7eYm1Uzdw1Kh72nLdM1PaXrw
DstrhpBAc2PCpwf9DauPgPgf+X9sE2AlzMVnwXAG29k0RsklVzH7h/an+x8t9Zg4
DiU2DHk9Xu6DQLAqKo+X9eIVgY7uqtJNgsopGOyNq9ezHbZ2CEOQbxsqUoRjud7V
92DZEvxZKRZREWXHdK0WmNCmKG9tkhYkAA+7amZCDQ47MtrCpdM=
=Dktb
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
