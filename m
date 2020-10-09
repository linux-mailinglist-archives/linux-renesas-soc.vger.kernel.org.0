Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC9C288368
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 09:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731911AbgJIHXy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 03:23:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49606 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgJIHXy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 03:23:54 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5FC201C0B88; Fri,  9 Oct 2020 09:23:51 +0200 (CEST)
Date:   Fri, 9 Oct 2020 09:23:50 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable PCIe Controller
Message-ID: <20201009072350.GB10335@amd>
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +&pciec {
> +	/* SW2[6] determines which connector is activated
> +	 * ON =3D PCIe X4 (connector-J7)
> +	 * OFF =3D mini-PCIe (connector-J26)
> +	 */
> +	status =3D "okay";
> +};

Note this is wrong comment style for non-network parts of kernel.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+AEAYACgkQMOfwapXb+vIWaQCgjG0OhRwQl8bnOJ8I8mzJwYbD
F54AoLla+GY57uR//PGS5M5LIv2PhETG
=TO4Y
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
