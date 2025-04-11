Return-Path: <linux-renesas-soc+bounces-15835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B9A8586A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BFE68A6FFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB4F29614B;
	Fri, 11 Apr 2025 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hj1BlvFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A827CCC2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Apr 2025 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365195; cv=none; b=M5DdqhrSOx1pIgiFv3YlMBdm+k3ny+Q9bY12dkhFWPINOKjrEgITCCXkwaRBAkdUzJBHDsmvT4iCLINQ6Q17+dd4BxndpEF1JAh45Ppi1E/d2aFYber7kLur6JpACmItTFxPEBQasa85EgNlbWWYoAFDS7zV6I5rWWSDoDsZAJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365195; c=relaxed/simple;
	bh=bYz4VWYXRVMZMzO/WeiodKWmw1L7VQDJw8uSANjmYZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS8mfio+MOB/yCGzrBRYqWFgm8uA4hJk+i7WtgX33g74ASFBBjrPSO5rq0wQs43NWcGspfEwpN9Dk2l/KKZSmOw/CzmzKl8e/U0cLzReea1iBg2aiAls5ZwBEPLiv+/9FDk2zu3JHTKg4kvA4mf/f++FqOX2yzI8m0k9LkjShio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hj1BlvFC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=v5Ml
	bzfy/UYtcdXL3mkK2vLrVgQkVRSUpZGGQs7rGuU=; b=hj1BlvFCT8dW5Iu9XbxD
	yDptYRJWrwOidK2/AR/7UnLCIYNA2L8GKb3bqXdAMuEssiYjNOM6xS7OliOXDI0w
	Maut5TKDfTEyfXSimJXq6DaB5IIc91ZKKYCD1Ht+NCzwa9nkQOA7QM0RgP97nDzd
	8FOEka8rbYUVTTgL25HXjm+V6s6KBOo1e8hANEha9vrCiztBfK+g8/u5Da0f6nww
	y8tWYElrfCCfehVwgjiBpywsjmnC3YMZLREpqpIKZCWSBtVE6TwG1fuJWjVRpClj
	9Odje1lqwq0+CImlgyGq1WJ04NO0JOQ5FBm5sqLZVOEy93fW4MIBlWFRyEyP3XE9
	1A==
Received: (qmail 1242354 invoked from network); 11 Apr 2025 11:53:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 11:53:02 +0200
X-UD-Smtp-Session: l3s3148p1@AHYSq30y8pMujnsS
Date: Fri, 11 Apr 2025 11:53:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z_jmflS03VHFOE3d@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
 <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5meMjSjKXGTajXvg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com>


--5meMjSjKXGTajXvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_=
eth4>,
> > +                   <&pins_mdio1>;
> > +
> > +       mdio {
> > +               /* CN15 and CN16 switches must be configured in MDIO2 m=
ode */
> > +               switch0phy1: ethernet-phy@1 {
> > +                       reg =3D <1>;
> > +                       leds {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               led@0 {
> > +                                       reg =3D <0>;
>=20
> color =3D <LED_COLOR_ID_GREEN>;
>=20
> > +                               };
> > +                               led@1 {
> > +                                       reg =3D <1>;
>=20
> color =3D <LED_COLOR_ID_ORANGE>;
>=20
> > +                               };
>=20
> The above should also have one of:
>=20
>     function =3D LED_FUNCTION_LAN;
>     function =3D LED_FUNCTION_SPEED_LAN;
>=20
> I don't know the LED function mapping.

I have an incremental fix for the LEDs to this patch. Thomas cannot
really do it because he doesn't have the board. I was waiting with my
patch until this patch is upstream, but I better send it out now, so you
can squash it into this one?


--5meMjSjKXGTajXvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf45noACgkQFA3kzBSg
KbbhBQ//SA3eCGX0eMFXQS4vM9SjlKaSOc8Sv9fxFOcUPfIOzFQ2in7V5MSsS86y
qLykrEEz0ddawdAm1v4Ll97vvODHsLJ+Zb7JTcuv3xltq2MddsxOxEldllAXS5dd
wmAP+krIqhWTZO7l1hOx42rY7lfrw12WM1fZFDXIlwRshciS/6VKBvDdcKrWub5M
/H3ffK/6jHSUrXmP+2YnqZ/R1KsTnDU8OI72ib/4Tpy6yonmMVJhLwQQFxtXo4YM
KsDO8oaYhhDqjdMms9juwMiDaObkxXc1Q/Ex27OnQKVQe5Ns7Zxw/Io2r6qMYiZn
6c4QXDrHZaHsxifc5KdL37R1+CfBJX5/cK6/KpSDYoz9WwiBCaWccjf3tsizxTZL
FanpqH+9Ddbg8XSSPpJ2HutmK8MQYsYoCtw+paoHUVmBzOR2F9pePbxQxZ1SM0rH
TnuuureYZje+nAOlQNoLRkqbD2bUfmTlqS3SI/SHDaihesPs2ETWTgyn4LLM0XGI
JejAOCbYhtXG7CzHcuzRs6dNKmr7OFsuvJcnY4iVshsUvQIgeOqL9YgP9LUeql0x
mb2eiIfLUswA3m+qvrVbb2QSnq1zUyYkYGNtlDFKv5XRUrP1KY2iGEYxaNL9FmRg
pgjVrSpKCxlON7Q+2QhIAJfycNG8GPMJbpLsIo4xMq8feKqXYQU=
=KXkU
-----END PGP SIGNATURE-----

--5meMjSjKXGTajXvg--

