Return-Path: <linux-renesas-soc+bounces-6592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B5911DAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 10:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAB941F2162E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB220178390;
	Fri, 21 Jun 2024 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aN/W6cN0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C0176FB3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718956470; cv=none; b=VaQ2jWIqoA8u2m5nhNV8sL3xttTCA11u99GU8vx/y/sj8eStFbhlCHGPH2hOgcojYRP2xMpM93iIzQBZd4W/IcqBBtNUyf+AnMvH5/IqDkh/U5vEoCQhhfFK+Gmt6yaxSQkfr4TYjH3TPqJfgj81ZZZTXLqeZETUuK57hwOPFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718956470; c=relaxed/simple;
	bh=Qiu2cnuLE3bINgaUTy01KWZeDAWULRjFMg9Ap2rFhOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM6q8eKWEUwWh8GK7mk86beJuQ1oTew+jrbvbf0aEEIceGYJLLOzpizYS+d3lPZZ47K+RAgxpo2BzdTyNQYAQmCR3VL1HxFSZdyQeajhDyoURVu2w0Na0vhYS7fBmBvsP99sKqbjd4Ek9jla+Pi5oh+Z6tSapoIXx8LCUZgf7HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aN/W6cN0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=G+I7
	Dy46Mrza8gu4LYO3j9ILWX+nGJyhLuq4M5ObIbo=; b=aN/W6cN0p5nSicAwI5OR
	yW0sh78BFW0hvhjyiFZmnUfCmXusxuHOy31n/kO2gueaSVtcbmoorzc58OAeckcB
	jHZH5S9mg+EqMB79lHB8g16caw760vUbQsLP9gBlFwyfjijEqnd36IdzaQY+Qtza
	/BHueCZaIJfBtMKvlmxiuJDJvIStUhln2ETpG53zYW4/5gy4daTBDdo4X+D0D708
	25LeFdUEUtzT07ULqXzMi/ySdFLf1VHky9uUxavDTR57u9xkvMzoJNJ6eIQ2TtJG
	/fgGFahNR7p0nkDjDo2Pxd8YWDw5cUR/qBmE/7LM3Tdy6gWwwptdNWO+kaDo0o9b
	uw==
Received: (qmail 1287368 invoked from network); 21 Jun 2024 09:54:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:54:26 +0200
X-UD-Smtp-Session: l3s3148p1@QYWHvWEbCucgAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 09:54:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Message-ID: <4lypqqf4o2wk22kzpyutlaarare5kurdrlokbm6mb4re3mstam@qo7c3d4tcpll>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
 <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
 <CA+V-a8spwd82a3BTS-u-w-JY859YCRxCi0Os6XRn27-mkWz6WA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6w6c2dqsjx426ws"
Content-Disposition: inline
In-Reply-To: <CA+V-a8spwd82a3BTS-u-w-JY859YCRxCi0Os6XRn27-mkWz6WA@mail.gmail.com>


--v6w6c2dqsjx426ws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

> Based on the feedback from Rob I have now changed it to below, i.e.
> the regulator now probes based on regulator-compatible property value
> "vqmmc-r9a09g057-regulator" instead of regulator node name as the
> driver has of_match in regulator_desc.

I like this a lot! One minor comment.

> static struct regulator_desc r9a09g057_vqmmc_regulator =3D {
>     .of_match    =3D of_match_ptr("vqmmc-r9a09g057-regulator"),
>     .owner        =3D THIS_MODULE,
>     .type        =3D REGULATOR_VOLTAGE,
>     .ops        =3D &r9a09g057_regulator_voltage_ops,
>     .volt_table    =3D r9a09g057_vqmmc_voltages,
>     .n_voltages    =3D ARRAY_SIZE(r9a09g057_vqmmc_voltages),
> };
>=20
> SoC DTSI:
>         sdhi1: mmc@15c10000 {
>             compatible =3D "renesas,sdhi-r9a09g057";
>             reg =3D <0x0 0x15c10000 0 0x10000>;
>             interrupts =3D <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
>                      <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
>             clocks =3D <&cpg CPG_MOD 167>,
>                  <&cpg CPG_MOD 169>,
>                  <&cpg CPG_MOD 168>,
>                  <&cpg CPG_MOD 170>;
>             clock-names =3D "core", "clkh", "cd", "aclk";
>             resets =3D <&cpg 168>;
>             power-domains =3D <&cpg>;
>             status =3D "disabled";
>=20
>             vqmmc_sdhi1: vqmmc-regulator {
>                 regulator-compatible =3D "vqmmc-r9a09g057-regulator";
>                 regulator-name =3D "vqmmc-regulator";

This should have "sdhi<X>" somewhere in the name?

>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <3300000>;
>                 status =3D "disabled";
>             };
>         };
>=20
> Board DTS:
>=20
> &sdhi1 {
>     pinctrl-0 =3D <&sdhi1_pins>;
>     pinctrl-1 =3D <&sdhi1_pins>;
>     pinctrl-names =3D "default", "state_uhs";
>     vmmc-supply =3D <&reg_3p3v>;
>     vqmmc-supply =3D <&vqmmc_sdhi1>;
>     bus-width =3D <4>;
>     sd-uhs-sdr50;
>     sd-uhs-sdr104;
>     status =3D "okay";
> };
>=20
> &vqmmc_sdhi1 {
>     status =3D "okay";
> };

Again, I like this. It looks like proper HW description to me.

> Based on the feedback provided Geert ie to use set_pwr callback to set
> PWEN bit and handle IOVS bit in voltage switch callback by dropping
> the regulator altogether. In this case we will have to introduce just
> a single "use-internal-regulator" property and if set make the vqmmc
> regulator optional?

Let's discuss with Geert. But I am quite convinced of your approach
above.

> > > Let me know if I have missed something obvious here.
> >
> > Nope, all good.

Don't give up, I think we are close...

All the best,

   Wolfram


--v6w6c2dqsjx426ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1MbEACgkQFA3kzBSg
KbZmzhAAhikx9DCJzN4RjY8IXdukZFrLpplVN2YzG4v2JaPtx3Io/CWxE/x0uqbf
PBHqYGBG4cZSJxeRj05fmMNuQ3bWFPa7b66JzcboFked+yhEg6ZoSflK/N4zNAXD
xZcriyJWSLbLRJu9/qoA+92KoB1OHEg5eetJETOcp0ipQLQcZA9mUQQ78b2VrlHj
EaHQeQoIotN9dKbBLOwWFu6G60QI+oKwXvp4LNerh/4DJTiHzQ3olpZPJQGDPmcT
8o55f60f4r1D75Wnvurx2Hodrd/POHCeEQI4dE5Gjljz1aQ3+5Eh1qVTgoYXUQbA
E9d3uWDrMGGiLYD3q0HWuRtyN7Da3HhqlRodHG5erIYJ7dmefukEYIi6ghdrnsTY
BcaKi+R+531wyhpqOXFw0mINfU1YlMTkn0RZNUJiUhctY2BFKHp/I/xvSy0saZbZ
/2z9KWM1MqpfYwuXUH7YVLoqmvmiJ8LhpLubZ0i9OgsfOv/crv6osY+pxXHNfC9J
C3sC+4Ybd5RrtJTRKCFe+ANFdYrWW3IkD041qs+HmFlRcN9XUMkrL5/+fGrjt/gQ
uKw3fhpr3mvBYIA35hxPMjnIriFM7NTTH6qUW2uOgRLW4tTBszcfrkU1AJzRgxis
gdOOjwfqn/Acov8nmXE8GDNPgjayH5XfJhbwgc02ZQYlwUtTg84=
=hH6Q
-----END PGP SIGNATURE-----

--v6w6c2dqsjx426ws--

