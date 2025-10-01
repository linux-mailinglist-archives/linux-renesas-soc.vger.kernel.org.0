Return-Path: <linux-renesas-soc+bounces-22535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB53BB1804
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 20:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889E24A7F09
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 18:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399662D5419;
	Wed,  1 Oct 2025 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ0jdwUA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA6C25DB1A;
	Wed,  1 Oct 2025 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759343630; cv=none; b=f61ol9lQA/xPoPmL0jm52/SVW4nv6twlRSlJhafl+oGrSkfEn/+ffH6PlzEcjrTIwNimxBLDEaVa0F5sgkCkRki8ZoV/fSdrcWtcSCAM9EmqguPjcQD80asxnhYp9GPhA0vg9xipCtrW3uEyXQ1umzQzN4XeKrfnHFG6D8GeFhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759343630; c=relaxed/simple;
	bh=Xb2lH0sV16eeETFsmOI0Y8doM7vNsNLpecPTgoVug9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oi0Hp+yBdhQVg3IYpavlB8wjNA1hsQMLMS1+cGp1oJ3WJpKwcP6K0u8sa0qCqBYDt9ISaVBH+xvIvTPubntpfqsyQ1MUSSB761u/2xX4Lryhn0LNVJwhtg2K4Z+oXOU9oc/yh4EndmVmw0PBENUuHCxVde+2YTtj2+TW8gUPSk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZ0jdwUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8B4C4CEF1;
	Wed,  1 Oct 2025 18:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759343629;
	bh=Xb2lH0sV16eeETFsmOI0Y8doM7vNsNLpecPTgoVug9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ0jdwUAbWT/9x4SadJIY2f4V/NL3jEI+DJHNGWWhIxzczO13aFPh/6klDqwA8bL9
	 cLcgoW557k6R40KFRWM8Tw9dxoZPfUa4sqnn8MgwMwVsxuoUTexDoY+TuVR2m1U1LS
	 n41xfrN/iRQlc0P/yScu/JOxqqa+e5I/Xtmu3ug1AsYLlMjpsxgNJxDZ3AO2ymxE33
	 FF51i9KgZCiSognZU8iMD11mIHZVDtNyEEG0T6AJJ0ptTU3EYOhaDlHvaGxzCvSmau
	 EIO8mt5aff/aLLg/CfFJgfFyqDGqOGBw0+yZ08QoUJXsAuH6HptbAodY1Tba5+7l2p
	 jFjG/5jVsEFpA==
Date: Wed, 1 Oct 2025 19:33:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Amithash Prasasd <amithash@meta.com>,
	Kevin Tung <Kevin.Tung@quantatw.com>,
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Message-ID: <20251001-bonding-surging-af8cd0d09e07@spud>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
 <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N49fSXuRnpf7iDQV"
Content-Disposition: inline
In-Reply-To: <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>


--N49fSXuRnpf7iDQV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 04:47:50PM +0800, Kevin Tung wrote:
> Document the new compatibles used on Meta Yosemite5.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>

You've repeatedly ignored my ack, so I assume you don't want it.
Maybe you want a nak instead?

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e109=
a78d931dffdfe28 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -89,6 +89,7 @@ properties:
>                - facebook,minerva-cmc
>                - facebook,santabarbara-bmc
>                - facebook,yosemite4-bmc
> +              - facebook,yosemite5-bmc
>                - ibm,blueridge-bmc
>                - ibm,everest-bmc
>                - ibm,fuji-bmc
>=20
> --=20
> 2.51.0
>=20

--N49fSXuRnpf7iDQV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN10CAAKCRB4tDGHoIJi
0rToAP48ObGVhLOzqtINSi0uK5cZGsYs4Yk4UKr5h8fYmM++rQD/bO5IqlbvGU3Q
ohXJpk3bM7P7wKsfp835IM8Bn2xMTAE=
=on5v
-----END PGP SIGNATURE-----

--N49fSXuRnpf7iDQV--

