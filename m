Return-Path: <linux-renesas-soc+bounces-1775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3A383A889
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 12:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B971C245E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 11:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2891B7F1;
	Wed, 24 Jan 2024 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8Ddc7tz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9B1B7E4;
	Wed, 24 Jan 2024 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706097021; cv=none; b=DgucZk2ILfW9ki7AhcAnM//5fjTRYC5x8B3ukpe6tKu+3V1vZaBDwnnuFljOdNOGyblNS3y/5qGzr+8D0+wZps0hsKSkmlq/IzDyhB60qNHuyCc9A2xeBlHAhrGEUdoYnQtaWVuO5k8ZM9gPBXxrQUrTX9EZLLHtk0wIcrL7+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706097021; c=relaxed/simple;
	bh=thdxLQ6Ir5c1JU402aPYO0Si7gTDX5mpLrlD8QzdG1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeYbyZNiD/9k4xuorJEArj5vKhWBNl37lbrGbeZBN98KEX5MYOE7ZihHdlLbTWHGk6f2aDqwjZtMYU0O/F9hwwKN0z74eFWEj5qNQ05c8NclRfyYGKwOCdrUOSnRaq5dFU/rfFkQf1bAteiOPAwvV6rTTYAPtv6erlfYx3hRaWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8Ddc7tz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BB0C433F1;
	Wed, 24 Jan 2024 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706097021;
	bh=thdxLQ6Ir5c1JU402aPYO0Si7gTDX5mpLrlD8QzdG1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8Ddc7tz3SPJqW/uJQhvqxqUzvAQxv1q+mw47dDYs5PO4EhvJTWYvHCUZKwnEaS8J
	 NyJOpjZcGt36kcGPyCSOJQKJIEKBBBYiQ5qmjlZ9jYSyDTBAGoqTX0ukvDkZ8dFjc5
	 SOSebBZcxumpWNJ316P90dcBqnsWBHw6K/LBmj+M5MWbFpUSypebNtoAPuI4mxuMAz
	 tlzoDxv6lJ9Sz/tBz0SMrVTvOIifq79WJ/rGgIZ+46bAOJsB0/8ORyMDhb1VGwDugb
	 IjtNiDS/NSNOcAFs6Owz3837SIj6K0fS+qK0SedfP1YUElcGtF7JgSPVW9I9S2JABR
	 /xO6RnuKUfxxw==
Date: Wed, 24 Jan 2024 12:50:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Nghia Nguyen <nghia.nguyen.jg@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: serial: renesas,hscif: Document r8a779h0
 bindings
Message-ID: <ZbD5ect1rFX0Ojxd@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Nghia Nguyen <nghia.nguyen.jg@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
References: <55b458e0ba9824e1246e556075bf882032c37279.1706095578.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GWFWZ00VAxbpvMQb"
Content-Disposition: inline
In-Reply-To: <55b458e0ba9824e1246e556075bf882032c37279.1706095578.git.geert@linux-m68k.org>


--GWFWZ00VAxbpvMQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 12:27:15PM +0100, Geert Uytterhoeven wrote:
> From: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
>=20
> The R-Car V4M (R8A779H0) SoC has R-Car Gen4 compatible HSCIF ports, so
> document the SoC-specific bindings.
>=20
> Signed-off-by: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--GWFWZ00VAxbpvMQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWw+XUACgkQFA3kzBSg
KbbpWxAAgAp3ZkQLG9M6gmYeF5s3kLXEdGQjHdu2/M31Y4TZSfGejxqtETfI7d2K
rLDscXRtvgIQ34FycgY9fhN7R1BwcN3AQeBQvyJ0OmMGt2giNG8rZ6IhKa0/EJzw
AmyRhPIUtCQ7n0u6rI46dpxur/tSvw9Q99OV+juMQ5jt0D+T9sMlV5U7qNmG66jL
roG6izntuK05dzeuUE6KQltHGgYeU0UZSqsexAGGgtLRE/F/DxGpM6NB60EDXgHG
MtGA7zvgbPyotjq2/CtgE7EJCOZGjcqxT6bYfYAw/v0xhD5kZCOEyhmEWmFnLu6q
DV7KLs1PB5wVqZd9irGHgPvCtzpEw9+ATrRlFJF7XZrqyYokhwTsLBe5LqrbdYpA
ORBZaKsSJac08pz11uS1rt6oUD5XGBhCya7hinJf2+hK7wFJrlz++vkt/uITX1HE
S0T+eUP4zv7XyxMCIAwpjRsEE2D+Y2Ha5/G4x89KaSDTvHXno5Eiowp3zxZWcN0Y
5Z47kfBiCCBCEf1Prcb/eQgLKRHoRF+07bYJaULNrtHWpqQf3cJt7rZfyhs0qlr0
Xmmrayb7KI3leLZgVkK/Hp3kv8yQ9EOZqyV6CYHy/xoSwp52HcM2sZE23yRJb/XX
OFhJnu+JnQDjGSyXKFD1QeprhjkAUnT+tUoz+XjQ7IWZUXBtMb0=
=mv2c
-----END PGP SIGNATURE-----

--GWFWZ00VAxbpvMQb--

