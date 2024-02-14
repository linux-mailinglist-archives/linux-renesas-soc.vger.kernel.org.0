Return-Path: <linux-renesas-soc+bounces-2760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFEF854A1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB48B1C22B94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB72C53392;
	Wed, 14 Feb 2024 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHN0JtRk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AD153385;
	Wed, 14 Feb 2024 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916244; cv=none; b=RaXMV8gT+x6rLasuMfdw3Zp9m7f3bDDBWtCFwZ3FnMVsUP6V9Ucp+/ELUAnpzYpGHwD5UvwMmj4NMheg28VWphDBxL9JE4nySP6yXJ8Pot8RTHRV7PNjQh+sC9yW1GZAs2AxAi0Lj4zVqkA/gIr7YG02FAN9VQ6Z4/Ew7OVSaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916244; c=relaxed/simple;
	bh=blLjpe5OEg2eOMPk+IuL9uEfHsMWrCmlj0cxSEt7z08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wwj5Rub+sy1JNLZ0QXPuXhpOYtaf4ZSazI84CWI5ODrs8OmNTqCBIY7Emh4i2NeAyhZFjTQJoNBqg5CFaaKrYVWLvLUk6ISjRrokZmCCe+h0UUcW27jH3FEHhP1K/9lkJRu5l4JROTPhXDi1eNUApHRrWJFZCK+VvROCKSWek2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHN0JtRk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA83BC433F1;
	Wed, 14 Feb 2024 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707916244;
	bh=blLjpe5OEg2eOMPk+IuL9uEfHsMWrCmlj0cxSEt7z08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHN0JtRkmbMPCdXUHNACgato4pZZvHuNj5GpSyOkoWiGvKNkRjj1yw8twLZaKMtky
	 otg6FHbO2mdD3JPtX1krlUA9oUd4DxNVeyp4EZstFot2hnEvjphbruYtiXZ8MpOds8
	 Q2EnU+AXsBtWDj9YiIUKw3qiR5b/f3g2hIepFnCtt8s9nqsdVvysUClbf46rjMWbJL
	 AhPS4W4qYhoxP8/m2NsYePVu0u63XN5/cgOs9cx1JL6JexdFkci15nnoOTSMaY7BNz
	 iwD2S5tTL+H33AQST7IrJdC1dpu2+nvhunw+D6hJ7Ed4qQ5LmbLAG3KJ3V4CtRUfb/
	 JYYV0WDVqldFQ==
Date: Wed, 14 Feb 2024 14:10:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add SDHI clock
Message-ID: <Zcy70FoMmAenmy1A@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
References: <3a604a6924043775c2ed0630b1c5c29be2d1a5b9.1707915642.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k/EZIT2KEdKtMX1z"
Content-Disposition: inline
In-Reply-To: <3a604a6924043775c2ed0630b1c5c29be2d1a5b9.1707915642.git.geert+renesas@glider.be>


--k/EZIT2KEdKtMX1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 02:01:34PM +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>=20
> Add the SDHI module clock, which is used by the SD Card/MMC Interface on
> the Renesas R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> +	DEF_MOD("sdhi0",	706,	R8A779H0_CLK_SD0),

I assume this is correct because you got it to work, so:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

But documentation is unclear, the diagram above the table says sdhi0 is
707 while the table says 706. I guess you reported this already?


--k/EZIT2KEdKtMX1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXMu9AACgkQFA3kzBSg
KbZY3g//Wja4N0Nl8h5hft6ydyzmrkAGQ441qyHxfw3E9J7/fGjhs1Iyu5OKhZZn
Jf+3aYSPigMaiZ9q+7q2QTa4wRJqH1AJA80RCw30rplSdtsFYWHKuRELCAfvv+pZ
4LnGH8TLr6UQEF7Ko7+Hc9lS6xMpPDPxA5o3jjecqa/TgYSyN6Dux9eWEG+NyW3D
HB7G316VjEVZT1UAAppyr3kp8pxAK0bdEgOhr0R7VBborY3ZjR/IIAO9n4Wnsc39
hPa4QqfzBzorOZmjD25MPGwIQMAadZj9GMY2nnw4HCJ0SJceRj9M8s3nIXRZihhS
mqMhmsiveCqzvslmmiP+9J8fPOLMzYwUVw2a9JQnoTJ67pxvUV52SuQYdK7tUOj+
zqGSJogNVC6jEVrkuMHleY46PwfzMjONQcWJWSX4cmGCL59GwUturaQQu1Vds/xi
TZqifw4buwpnoS0RC+MWHzYkMSUfWJaI2+9gMHT6vOyrr2ev1PKk+sl8d/GCzKb9
nT4GJEwEeX5rbOmRIKtdP0/HSXHS2zLyWHRe1JNzrCZjx2RhgocE5cLaVQpl46R2
wLpApRbPPtGRXCmC0JQm8zX9Gxv6u8bG0MqwqssLE+xXtUSjT6eTxtcQ9w/Kva7o
54ehBrsJqsh2vQxH2NhCaP5rR5GIskjuKZdJfxL4EF4naNhjDM4=
=hJyk
-----END PGP SIGNATURE-----

--k/EZIT2KEdKtMX1z--

