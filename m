Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F3B2E1F10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 17:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgLWQBh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 11:01:37 -0500
Received: from sauhun.de ([88.99.104.3]:59794 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbgLWQBh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 11:01:37 -0500
Received: from localhost (p5486ccf0.dip0.t-ipconnect.de [84.134.204.240])
        by pokefinder.org (Postfix) with ESMTPSA id 27DEF2C052A;
        Wed, 23 Dec 2020 17:00:56 +0100 (CET)
Date:   Wed, 23 Dec 2020 17:00:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 02/12] pinctrl: renesas: r8a779a0: Add EtherAVB pins,
 groups and functions
Message-ID: <20201223160055.GD892@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
 <20201221165541.27679-3-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Content-Disposition: inline
In-Reply-To: <20201221165541.27679-3-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 05:55:31PM +0100, Ulrich Hecht wrote:
> This patch adds groups and function for AVB PHY, LINK, MAGIC, MII and
> PTP pins for the R8A779A0 (V3U) SoC.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

AVB0 works.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for AVB0


--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/jabcACgkQFA3kzBSg
Kbbqww//Zoa1GCdEF8tqsPboaBMyyKgSif0AQaDmwQvpVjRihqkr56nmgMthynFb
3YNKZnvAMCSw9dBoOn/k9Ml4y97oIviHN4ehT7XSHg4YycCkRoQKu8gdRI9orJi7
qXv3sCRH03D8SssIsPRa5QQZoSHeCJW3oiwTe3a0B9hlqbPfMcfEO7tm4FPvPS4R
OpGQGrB9czeZFSFRWmweqD0jDrHQPIjbPAKrGs5x2oP1wYjHHccmpswCuF0nt3+F
/Jp06Mi6Vuq5MwcSgsmjH/NDfE53CPNATS9TrJ4wwGdv7CcFh18xx+Kmq/wJEZaU
3YKXXks1uoM2FK2tz4tTwpxERlE6Gn2Aie6yTUvkqhOGnk4d0yAi4sijiQFY+CcC
DEKaP6PSwHCkiXO9aafELMqn8304ffWwEL5xbc6v97S857mq6yO2aaqYKENBkO6D
Y/2nQK72wCvX4VssIeHYjmufsab6k3vFWo8QP96Bme8wkS+tN9OCngsT+DHC2fEk
/mPWPvB/bPQlBQnz3rXD9tmv6Q7yYKLpNYEFIacNHuHLpnXpftAGzk1ZUvWpepOt
zrddG7h5TkYZV3XrEbwIeRHlkkQZ0Um8Hjr8WE9JbAEnrkjRzHiVq1jU9IV4UoXF
15gu9c0ah6XRAmSXwwAjCEXefo+70Y1xGku2eCJjFFHhtO4Nf04=
=k8L/
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--
