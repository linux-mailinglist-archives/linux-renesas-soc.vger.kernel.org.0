Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDDB12883A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 09:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbgJIHdx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 03:33:53 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50544 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgJIHdx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 03:33:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 585261C0B88; Fri,  9 Oct 2020 09:33:50 +0200 (CEST)
Date:   Fri, 9 Oct 2020 09:33:49 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED
 indication
Message-ID: <20201009073349.GD10335@amd>
References: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200907155541.2011-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
In-Reply-To: <20200907155541.2011-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> @@ -63,6 +63,16 @@
>  		enable-gpios =3D <&gpio3 11 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		sdhi2_led {
> +			label =3D "sdio-led";

This should use appropriate label... probably mmc1:green:activity.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+AEl0ACgkQMOfwapXb+vKrjQCfROOMQBVSBONI7IRKZfJ6Ibpn
aHUAoKBKPHGLOLWavFe+rh2y6O/uXRN+
=Nd9K
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
