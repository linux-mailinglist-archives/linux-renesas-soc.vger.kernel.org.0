Return-Path: <linux-renesas-soc+bounces-25364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E87C92EE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 19:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EEE6034A5DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 18:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1954A2853F8;
	Fri, 28 Nov 2025 18:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvV3pvwG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21A26E17F;
	Fri, 28 Nov 2025 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764355753; cv=none; b=YvPFKDMbcdXgV+og7hDglcp6a70HIAXkamM/6MV13Fx8UOEsRfhuGK636Q/gnbLnxpLefqrfBoVPY6r/FvBv+RfMQPzzStpXGFX6HqBPZonXZqLuxj3aR4A6P8ZOr/8J3LBch9MztADmZGW2/sJI52bY2+Pyc0OVL7S1f4mb8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764355753; c=relaxed/simple;
	bh=NtMfcfFfDb5zhNBtoZS860R3Lc0nUlKvsmQDGO7zgqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzbsXpzNqGMszUW6pidcopQpEz7bKjDZ3kmJgbb9Io+HDbmx/eti6uK/0oRdGHb+cK1NWqW9YgaxWaSJboHii69uHY9vR1aFk+f4M2swfVFqwWnNRZmBbpibd/I+mqvLuFRq8JyhxYRjyrQl8rFnQz3Z5bFrogkRwZKw045Qxzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvV3pvwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969DDC4CEF1;
	Fri, 28 Nov 2025 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764355751;
	bh=NtMfcfFfDb5zhNBtoZS860R3Lc0nUlKvsmQDGO7zgqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvV3pvwGPJW2p1is7KzglvpFu5Sx151ITH8aFIx0ZrMcY9PSwepoeamDDhHZvHs3L
	 U9B1pOaenj0rdy5CEB7d9NukyZBOuRfgNVfVO88aFVBL3EcIFgpNH9tdgD0OFRpDfh
	 IqkY/U63QU1X6WKIhjfqPGLaDCJmyN1c8xtR1CW/9edHXqJkWKSZvsX7oVbNrEg8Vn
	 gX68mu28cwkj/NlVQTX9hpzauA8/1swmCe6UYtcAWnT289FwPKioWvjUaErr39JAcF
	 xvu43VkmUvXx5H07MxfQf8HobVVZqSxdS0qm58uaZYbTeuwpaMHCISOehkGrpzMwoE
	 z3ICzsV2m3PJA==
Date: Fri, 28 Nov 2025 18:49:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Message-ID: <20251128-strongbox-craziness-cea572479d17@spud>
References: <20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com>
 <20251128-rz-sdio-mux-v1-1-1ede318d160f@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuY2vAqczeLfALfj"
Content-Disposition: inline
In-Reply-To: <20251128-rz-sdio-mux-v1-1-1ede318d160f@solid-run.com>


--uuY2vAqczeLfALfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 05:15:38PM +0100, Josua Mayer wrote:
> Add mux controller support for when sdio lines are muxed between a host
> and multiple cards.
>=20
> There are several devices supporting a choice of eMMC or SD on a single
> board by both dip switch and gpio, e.g. Renesas RZ/G2L SMARC SoM and
> SolidRun RZ/G2L SoM.
>=20
> In-tree dts for the Renesas boards currently rely on preprocessor macros
> to hog gpios and define the card.
>=20
> By adding mux-states property to sdio controller description, boards can
> correctly describe the mux that already exists in hardware - and drivers
> can coordinate between mux selection and probing for cards.
>=20
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 14 +++++++++++=
+++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Do=
cumentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index c754ea71f51f7..55635c60ad73a 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -106,6 +106,11 @@ properties:
>    iommus:
>      maxItems: 1
> =20
> +  mux-states:
> +    description:
> +      mux controller node to route the SDIO signals from SoC to cards.
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
> =20
> @@ -262,9 +267,17 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> +    #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>      #include <dt-bindings/power/r8a7790-sysc.h>
> =20
> +    mux: mux-controller {
> +            compatible =3D "gpio-mux";
> +            #mux-state-cells =3D <1>;
> +            mux-gpios =3D <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_LOW>;
> +    };

This node should be removed, the tooling will provide a fake phandle to
satisfy your mux-states property.

pw-bot: changes-requested

> +
>      sdhi0: mmc@ee100000 {
>          compatible =3D "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
>          reg =3D <0xee100000 0x328>;
> @@ -275,6 +288,7 @@ examples:
>          max-frequency =3D <195000000>;
>          power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
>          resets =3D <&cpg 314>;
> +        mux-states =3D <&mux 0>;
>      };
> =20
>      sdhi1: mmc@ee120000 {
>=20
> --=20
> 2.51.0
>=20

--uuY2vAqczeLfALfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSnuogAKCRB4tDGHoIJi
0j76AQDYhR+vDQOegSMmt7lld2bHr2IbFhzrJhaGD4IK6PD5yQD9FpFC5t5WYURu
YH6kAC4dVJbC9mDBO40t+80PpLwvZw4=
=nZiP
-----END PGP SIGNATURE-----

--uuY2vAqczeLfALfj--

