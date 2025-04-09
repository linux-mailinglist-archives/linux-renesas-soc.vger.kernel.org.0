Return-Path: <linux-renesas-soc+bounces-15643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBFA81D87
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 08:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 031A84A0FA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 06:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB9C212B1B;
	Wed,  9 Apr 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BMqIzemn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22849212FA2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181739; cv=none; b=W6Rrtg3Cmg96+/FqFbk4x9MQDj1pGhmdhh1rVtIMfwMhd82cRwRfpRleh0RtPDj1d1l8CElmoRKjagc9hFHtRFWPimchgpSOO7VFqcR5YzmzBOKwELC/CPKl9nCVkBkN3wA5w47yWx4Pahoybt57om7TBKphPDdheugSRMZflQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181739; c=relaxed/simple;
	bh=DtoGMl4+W8r1g/lGfoCOHOQvWKdWBn2e+uY7/BpjuRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSO17XLrgQqImANZZ5P1VKyOQS7XzEcIuv6SxQ7g+v3njEjPNNNGcdiZspBGEo9FzjV+0+b+L4eCCJH+G5JW2qTtfiZqpeBxNqvFN3fcPhpbn3fD7yg30K2d/pGPaqzuCM2b60UlICiju0QmnAXioPXEeAM2FZHRWqpmtZWS03s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BMqIzemn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OwVf
	WRLhh8nlfli2ZxrlP2wEOtA908Se5+ygDD6PL58=; b=BMqIzemnmz33jgpBPWPf
	CnBIeUoYwWhmyfM0Gum55c+/nbjcgYr/WMt2qVCyNvDpYSiKpVo4X7yCtsbWnExi
	vktzBVfYKNzv3roRpNmnW4sq+yUFLWX/RISFAefLaZaZ0VlJJSuE8+/JxuuLJ0wV
	MBtqUm8VqrTStVwQsyU4GOnz0jhhjhkNqWIo9WFN9eCHQjkRjAlL1XHIixDoGQrs
	TiFYBGPVLhGOFL8ZagGFw65bjB+vp+7niIoaoFzatA4LBEDEqUe9mjLU7zFBh41+
	66BFl4sJeX3tX3pQ/l/xkaGxYBqIrAgJFfaQxvm+FUivOysv/1wP42u0hO9w6VB3
	Fg==
Received: (qmail 321901 invoked from network); 9 Apr 2025 08:55:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Apr 2025 08:55:25 +0200
X-UD-Smtp-Session: l3s3148p1@U2Qm9FIyttogAwDPXyfYALbiJ46yNPq3
Date: Wed, 9 Apr 2025 08:55:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: phy: marvell: support DT
 configurations with only two LEDs
Message-ID: <Z_YZ3NiXb15wgDuY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrew Lunn <andrew@lunn.ch>, linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
References: <20250408063136.5463-2-wsa+renesas@sang-engineering.com>
 <7f706127-aa48-4385-a7b8-f016e0ba52b7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QXDi9iYu4cGtvusf"
Content-Disposition: inline
In-Reply-To: <7f706127-aa48-4385-a7b8-f016e0ba52b7@lunn.ch>


--QXDi9iYu4cGtvusf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> Please make use of the LED binding:
>=20
> &mdio {
>         pinctrl-0 =3D <&mdio_pins>;
>         pinctrl-names =3D "default";
>         phy0: ethernet-phy@0 {
>                 reg =3D <0>;
>                 leds {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>=20
>                         led@0 {
>                                 reg =3D <0>;
>                                 color =3D <LED_COLOR_ID_WHITE>;
>                                 function =3D LED_FUNCTION_WAN;
>                                 default-state =3D "keep";
>                         };
>                 };
>         };
>=20
> Just list the two LEDs you have connected.

Been there, didn't work. This is what I had:

	mdio {
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		compatible =3D "snps,dwmac-mdio";

		phy_mii0: ethernet-phy@8 {
			reg =3D <8>;
			leds {
				#address-cells =3D <1>;
				#size-cells =3D <0>;
				led@0 {
					reg =3D <0>;
					color =3D <LED_COLOR_ID_GREEN>;
					function =3D LED_FUNCTION_LAN;
					default-state =3D "keep";
				};

				led@1 {
					reg =3D <1>;
					color =3D <LED_COLOR_ID_AMBER>;
					function =3D LED_FUNCTION_ACTIVITY;
					default-state =3D "keep";
				};
			};
		};
	};

I played around with LED_FUNCTION_* values. I looked at other
devicetrees but I only could find one-LED setups. I tried going to one
LED, too, with LED_COLOR_ID_MULTI. No success. Then, I looked at the
driver code and did not see a path that would enable
'MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE' via any DT configuration. Thus,
the above patch. If you have any further pointers how to do this
properly, I'd love to hear about them.

Thank you,

   Wolfram


--QXDi9iYu4cGtvusf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf2GdkACgkQFA3kzBSg
KbYuFQ//TwBaCjWOfynwFvWmaRHAHIdYwC2R09TxsTqDOFI66VfWfBOgr+3SPoQR
9cMGq/w+hVi7QxpYflPwka7Jk4GqBFZi35ToCANCGQRCsulFc3zKhmy0QguXJtBN
y34Y+P0DK3bG+DR4tl3wqUe4RJ4gJV08sXWeUJ0wF9guXuUWHOmykjtYOeSBPXId
GBSqGPEZj0Zb7XlfWP/0elSkoOlcYBtuQao0ASdjLF+FpNFH1qqaYRvgz5tLm2TN
hSaOzCzlouhU+/uNVLgJckP7Isemv3bF2C44le+/Ei6JbzJvp1JCF///dmHHPLdY
HNnp3PaLj3bpfXCjMrB6kT3SegX0Pyvvop0LwVV6C+NjUOE7ozTWWK8AlAIiH83B
nPvzLyw8yP1EqKtJOeZwbt4CHehwfCNPP76eMhDTTCpWk7LqNXBjQ9B01K7nE/rZ
3RYmt23bvSp6yyeJ1MmzVawO2yJ8EAdajgN1PuHXGUlXTCj32vdIRCdEdv86payS
z74JaVH7b2bD2oGtlygDeul0MoBH2SzOZfGQFnr7FbWqDOVSmPgwJ5wPW4vyqZUK
B5PlVL25D3PMnwODiHeVAH8qFWRXc32k9QylmTRM7YMBizNKDmNSeRi/ziQSMP4C
7bBkkox9ipCUPc/yu8naLsTbLQZ4UUoCtofLmvn4aT2CN5UDb84=
=qIkr
-----END PGP SIGNATURE-----

--QXDi9iYu4cGtvusf--

