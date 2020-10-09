Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB2328836F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 09:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731939AbgJIH0O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 03:26:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49816 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731895AbgJIH0O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 03:26:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5C7281C0B88; Fri,  9 Oct 2020 09:26:11 +0200 (CEST)
Date:   Fri, 9 Oct 2020 09:26:10 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED
 indication
Message-ID: <20201009072610.GC10335@amd>
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
In-Reply-To: <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
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

I believe this should be something like "mmc1:green:activity"...

> +			gpios =3D <&gpio5 22 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "mmc1";
> +		};
> +	};

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+AEJIACgkQMOfwapXb+vI//QCeLE1gu9e27wZ74TgaiIgIZFCP
WiEAn25EDEtSwbkYoX9eoesQP5kPAjFH
=yRo5
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
