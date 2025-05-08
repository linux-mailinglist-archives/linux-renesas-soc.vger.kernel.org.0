Return-Path: <linux-renesas-soc+bounces-16790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3185DAAF509
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DA881C004AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD9C2144CC;
	Thu,  8 May 2025 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZinmLTui"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A592205E3E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691011; cv=none; b=u07QovfjCtAAkDagRctFkyoUj6DcQf7Lo3qXB8d5rV02YGy0flBZej9CMbtBR6hAyozkxq07WF6CPUwR5bkfJbgVcY/g+rS1lPJeeBV0yhzl9yROVHy91xpqhtaNATzK6yXZHPuKR1IrNtJ1rTJXWJVoOf0dZAHS1ULaXw7N5MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691011; c=relaxed/simple;
	bh=PMQR1QiXDZm4+F6Y7mVD5R5HYND/3Fwpi8Ckd8X7MMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt+CGsgYvcKTOBVzkPE3y/EjFwSFYJpPIwsdmSu8P+IDuL5WaYQ1E6oo++tV7JleWXr/OMtdtLs2ifwfz3UrpbopcbLGEWnGCTG72cW/bBrp1KbTeRDy41NX/FufTql/KVi3VZ5TBWQKn7rrklwfXQ0bBUHRJ5f0H2P5p9Ggddk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZinmLTui; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Tp8P
	P5Bb9eNZULmp+h8B7wsn4dQd9/hEYaSHDKF/PIs=; b=ZinmLTui7Li+eP0sjJi8
	ACLTFzXSjaqZjtBfA4ffDgs7W9UQC9AzZ8JjnJ4xwYkB4YYWOsEyIiZOhbgeMPDY
	ll+RyZHcySqS/Dw7qUhMSuq0Xh1/QjKfgBomX1LO8B+4fOX2N88hRqVi3A7GR3dW
	QPT5CXELZWNvA9N9YpwdJlE5XGV5qzIP3E1pkIbuwceBPyYN/M1g31M2FGjMN2wr
	q7W/eMrO5KdMzp9dSWqyufxBCjXpyFBFgvkotD6uX3R061vez48VutVm25lEnZ46
	gR5xuBg0KUpLhSIn4TdKfYP5uGNcYSfceQcXkov3jDHmRXI+e3cGePcO5AU42ZJ0
	6Q==
Received: (qmail 3716686 invoked from network); 8 May 2025 09:56:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 May 2025 09:56:47 +0200
X-UD-Smtp-Session: l3s3148p1@ZMP8MJs0YNEgAwDPXxyAAIlRla1HkD11
Date: Thu, 8 May 2025 09:56:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
Message-ID: <aBxjvofZCEi_1Fna@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YKrTyb9Em6OWPxiH"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>


--YKrTyb9Em6OWPxiH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> CC leds
>=20
> On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v2:
> > * using function, color, function-enumerator properties now
> >
> > Honestly, this is better than using node names? With V2, the LEDs were
> > named as in the schematics, now they are called:
> >
> > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programm=
ing-0 -> ../../devices/platform/leds/leds/green:programming-0
> > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programm=
ing-1 -> ../../devices/platform/leds/leds/green:programming-1
> > lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programm=
ing-2 -> ../../devices/platform/leds/leds/green:programming-2
> > ...
> >
> > Which gets even more confusing if we might later add LEDs not on this
> > board, but on the expansion board. 'green:programming-8' sits where?
> >
> > I really wonder, but if this is the official way now...
>=20
> Good point!  So I'm inclined to take v2...
>=20
> Let's raise this with the LED people. I don't want to fight Pavel when
> v2 hits the CiP tree ;-)

So, if there is no other opinion here, can we remove function, color,
function-enumerator and just use the node names which match the
schematics? Basically apply V2?

>=20
> > --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> > +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> > @@ -10,6 +10,7 @@
> >
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/net/pcs-rzn1-miic.h>
> >  #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
> >
> > @@ -86,7 +87,74 @@ switch-8 {
> >                         debounce-interval =3D <20>;
> >                         gpios =3D <&pca9698 15 GPIO_ACTIVE_LOW>;
> >                 };
> > +       };
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> >
> > +               led-dbg0 {
> > +                       gpios =3D <&pca9698 0 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <0>;
> > +                       default-state =3D "keep";
> > +               };
> > +
> > +               led-dbg1 {
> > +                       gpios =3D <&pca9698 1 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <1>;
> > +                       default-state =3D "keep";
> > +               };
> > +
> > +               led-dbg2 {
> > +                       gpios =3D <&pca9698 2 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <2>;
> > +                       default-state =3D "keep";
> > +               };
> > +
> > +               led-dbg3 {
> > +                       gpios =3D <&pca9698 3 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <3>;
> > +                       default-state =3D "keep";
> > +               };
> > +
> > +               led-dbg4 {
> > +                       gpios =3D <&pca9698 4 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <4>;
> > +                       default-state =3D "keep";
> > +               };
> > +
> > +               led-dbg5 {
> > +                       gpios =3D <&pca9698 5 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <5>;
> > +                       default-state =3D "keep";
> > +               };
> > +
> > +               led-dbg6 {
> > +                       gpios =3D <&pca9698 6 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <6>;
> > +                       default-state =3D "keep";
> > +               };
> > +
> > +               led-dbg7 {
> > +                       gpios =3D <&pca9698 7 GPIO_ACTIVE_HIGH>;
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_PROGRAMMING;
> > +                       function-enumerator =3D <7>;
> > +                       default-state =3D "keep";
> > +               };
> >         };
> >  };
> >
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

--YKrTyb9Em6OWPxiH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgcY7oACgkQFA3kzBSg
KbbeFBAAkXngs7hdRkE8x1voqmXkKTM+L3oMl2xx1DG24cuGZfsPN3oM0M6A7YxS
CKfegrT+JPeB034wQX+OWBku7CWObgzmg2uKGjZ2cEbLscxlhvxIm6PwwKlx2ibJ
QY55OQWPXI+Yy1L0ZRMOyi2Ck+B4ikUO9ufu6Nkq8rRs5qG4AY5gbQ0wImGjLSHj
uRMjrHPtpFpXLqqJN7SrVs3784/P5kcrGVkWmu/4vRV/bJMbsE5rS7LSnO2yy4WV
xtj12P32aGL/EwFInt39b8mRXm73BZaEeZLpq9kFJI9xmXqKNNWxSqHM0yTRSsBI
KBKumMGwKtnT+JWlfolx5CJ2FLdmtKuYAiEgGjNYGV5cueOJ1jboQ7RHIJwtDmYh
OFsZktKbXYo5m1cpwfnjWqyzBvlsDy4vcggNd8EV44trkzxQhP/UUKyqacbOB8cY
e/XJnbipd0vHoraOL0O9Oiyf025HTUR1ED2Yq56LBQ1bAT7kYknDj3dQRmJG7Q+O
Mj4+ARnwFJGzUu7yZXblkP9E+gdJ0va+g8FNv48Nf8OT5ISyufsi84v/tXXpEMJa
CA5hINEe16ofhh0SuZMzKGSeysLvDUusVFP1+bKLitKthaYnsOWnoHkbBvELSN19
2TSBPXoYZM6rBPNxrvCpdCRt1J5wXE77GjMaCqXLprL1YiBQ1yA=
=qL/O
-----END PGP SIGNATURE-----

--YKrTyb9Em6OWPxiH--

