Return-Path: <linux-renesas-soc+bounces-21526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8790CB46316
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 21:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3F6A01432
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 19:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E855315D52;
	Fri,  5 Sep 2025 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRvttllv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ED6315D22;
	Fri,  5 Sep 2025 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099032; cv=none; b=lySesHB1fL2aBH6j1Eweg6INo0nAmMBu2mrC/8Nt3u51WAx2AjB3NdNMAffO+ViBekG6uAbWzRejPmsf3Swt0GhXQAdpQW7jqi+POnn+EIJaqLrq5smpCbBmNbXiRzjewu5VNLzJHvkDe3OvEdRg4w/FmXETNQiepLchMlJCQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099032; c=relaxed/simple;
	bh=qIzUbO/sBwBn9eM4w3lfY4+Ygc/NgXkLIDsWHrZsw7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWjG5pMVJdD4BSs+cKQmKhgY5ncV0BEAmEqU7LdMbAUY/En047y2l+UFxnZ09fhFNYmX9YpZVcW+2ZQ5Evo3+gWv1MxZYIXCwmgbtvrnBnLkqOuscS0yUupx8JTTrpe1MfVfjCc9milT+RAgnMxCuW3gkBTvLtdxsBDUW0WMUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRvttllv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B445C4CEF1;
	Fri,  5 Sep 2025 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757099031;
	bh=qIzUbO/sBwBn9eM4w3lfY4+Ygc/NgXkLIDsWHrZsw7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRvttllvXeb50lo2c6avwb4bRJQ+NCYyMwYgaFiVlwGx0Z7FeRc+xYt2XXQtMEe03
	 8nHhvafQABC07nspDJXdU7tfIvVMbhV5mVcdmx29WGm8umdS5E1xTWqNwmFjcAWZXd
	 46FjguhS7QFjidiygR8Iq6nDdGt3sgN0STzYk9Ovo7R9y12m4Pd3wbq24CJD1CM8pB
	 XTncANdPUBTgfUcqpe4tbbioRUYdZSiNVvUpX1skP5X+sl89HzaRi1UBVN5s0zEg2W
	 6hsJQe9v9xSlihdamw1et5v2LFUNB8WS4PVkEk1YU2BRq2GQkg3WnP2ZNFDeksjoQw
	 eea5XLXldT2MA==
Date: Fri, 5 Sep 2025 20:03:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
 720x1280 v2 binding
Message-ID: <20250905-imaginary-crazy-a5734cb794fc@spud>
References: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
 <20250905-humble-framing-3d9b786c87a2@spud>
 <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usBmjWL10C9rXeNB"
Content-Disposition: inline
In-Reply-To: <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>


--usBmjWL10C9rXeNB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 05, 2025 at 08:55:16PM +0200, Marek Vasut wrote:
> On 9/5/25 8:46 PM, Conor Dooley wrote:
>=20
> Hi,
>=20
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +      gpio@45 {
> >=20
> > ngl, seems strange to classify the device as a regulator in directory
> > and name, but use gpio as the node name in the example.
> >=20
> > Otherwise, this seems fine - if you feel that the hardware is
> > substantively differentially to what's in the "v1" regulator then
> > keeping them apart is valid.
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> I can rename it to "mcu@" or "mfd@" some such ?

Sure.

>=20
> I originally thought it could be compatible with the V1, which is why I
> tried to conflate them into single binding in 6d09c6e474bd ("regulator:
> dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280") , but
> they are too different, so this undoes the change and creates separate
> binding.

--usBmjWL10C9rXeNB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLs0EwAKCRB4tDGHoIJi
0iY+APwLj1336PzN6WjULb9ViDkp1qnpKP4J2cicUnX08OB1iwD/XZpDBQy97xa3
JXXKMGD3tzx/lj6Cmg6vuuX/kd/xCQY=
=kAJA
-----END PGP SIGNATURE-----

--usBmjWL10C9rXeNB--

