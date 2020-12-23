Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E152E1F0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 17:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgLWQBG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 11:01:06 -0500
Received: from sauhun.de ([88.99.104.3]:59776 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgLWQBF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 11:01:05 -0500
Received: from localhost (p5486ccf0.dip0.t-ipconnect.de [84.134.204.240])
        by pokefinder.org (Postfix) with ESMTPSA id 03DE32C09D4;
        Wed, 23 Dec 2020 17:00:23 +0100 (CET)
Date:   Wed, 23 Dec 2020 17:00:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 01/12] pinctrl: renesas: r8a779a0: Add I2C pins,
 groups and functions
Message-ID: <20201223160023.GC892@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
 <20201221165541.27679-2-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline
In-Reply-To: <20201221165541.27679-2-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 05:55:30PM +0100, Ulrich Hecht wrote:
> This patch adds I2C0-6 pins, groups and functions to the R8A779A0 (V3U)
> SoC.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Testing I2C0-6 gave meaningful results:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/jaZcACgkQFA3kzBSg
KbaQtg/9G56LiZohQ9ziQYYUkZNPnd93v7wKAUnVGR29RRwKHjvLqAE+EyhhMsYo
0Q0KLCTNd03dsK+2tVXSk34YrbGlbzJ5KgE1rR3Dp0HlnW0WzQEqeNsvLNNGhaWy
ehXvnCfarOKoLA6/lmGbIM7izfy+E/0yLnpPEl0v7lOrHp5rL30Vt38NMYiOjP1H
73f9ZYVsw3BOTDD31FrqAnzjRrlctKcuvBsr4pNmEWdFiF//BQnu0TuAHwKb+vOe
MbRM25R0pQie27FgriuqWA+1P03GysIZsyDaEqB2+21NYnwFAqj/tLxg3kahgWac
roNDQ4E1NZkvd6FFLHInGhyQSn/0NWVzUtJGFMjxbVUDOWz+8ZhEbk85iUJpUr6p
o04h96kiDa7N8fEjJqzBqCWtq+Qlr653rB53WGtKmHwDPZjV3uza+6B0Xij0n2MI
5dKiJH9VLfii+rZXvUqKErtmhp/UDdUwd4xirgcRzD2MVhpiGzv8o08HjiKW2i45
18H+T3jqg3iemHjPXodyX9Zaq8sRaxt0jU+baEmef3xqCBhDHGa7UB0HE6yLF1OR
A88C27r4XfQF24/2IxQjoLHqMBfxHUTPt9im8PERghSqKy4jGs6cJExbw3F58VJS
B2rJE9HV2I7MnhJ6DAZ8eUjeRRmdlatb8w/Z4yjxARXMjvddfu0=
=SItM
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
