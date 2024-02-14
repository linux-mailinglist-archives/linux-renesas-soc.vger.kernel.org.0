Return-Path: <linux-renesas-soc+bounces-2761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E978854A1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2F27B26147
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D8C53394;
	Wed, 14 Feb 2024 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cG1SQlKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50053385;
	Wed, 14 Feb 2024 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916256; cv=none; b=U+gwyJdtipwDlE3MrqKPecZv11Le/smALKRuUbbL3eABg7ikgGvF4BVU8Vbjcmf2VfI45u11PF3wzKv3fQIhtfUrizgUoy5c9hJqLIrW4U+6VqwwgoaYzQc6uJmCBIdTFSMm1dlfSiBJbHkEavOR7KzTK6/fT8rY9GuThOvf+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916256; c=relaxed/simple;
	bh=MI+AdkSBlJTSKIEXqFz2Z6RhgIQoxWZQv4ZxLFl4Vu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKutFZ/ogItBXP6ovfUHRud9FtJ4lKhkKGTXMUJH4rVynR5xntmChP7/sdVua67OF1PNIsUHEAWzcVl2sMI4r9WaAqicGsJJ9h68Ka4dzAvvfbci+atfRHVgB40mJH6mZgSeyQWPc7KfdEhYFOXbcX9xEza5DfqEaqU8hqcdvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cG1SQlKO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1EBC433F1;
	Wed, 14 Feb 2024 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707916255;
	bh=MI+AdkSBlJTSKIEXqFz2Z6RhgIQoxWZQv4ZxLFl4Vu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cG1SQlKOq/ZBgBjfD5d9v6OaKvypGx9lyVKi9bayP1S+mtgJsOFWvo8iW4Z3m8ZwV
	 MNJwJsdlqnKO8plg0T81dU1BsN7QtsvL8rdJptfjtGN+/2L4FfjqMdpsIC9hl5rCsH
	 U/55QayARyD0f5M6Nz4eGmebpauaz+U4wQKzdtLl4R4qDSf9cBnbkkdaeQoMkwsLPp
	 9XemNG2kmS4how+pmy59GaP4vkI+aeuB8U7SnMp5cCdfMY11MerrbQi7GBgrp+XH8B
	 I2knA5PtcuQG0PNYRZltv5BalyUV5AyyU1Lzr15+HILHUL/LBnzyg9P9kcKe/0Rnn6
	 pUyjBiRgoTm5Q==
Date: Wed, 14 Feb 2024 14:10:51 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add SYS-DMAC clocks
Message-ID: <Zcy72255L5J1WwWZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
References: <0285ef5d0c0c9d232e196559c9130ab46733d7f7.1707915706.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gRKP5Gqt3BnccmVt"
Content-Disposition: inline
In-Reply-To: <0285ef5d0c0c9d232e196559c9130ab46733d7f7.1707915706.git.geert+renesas@glider.be>


--gRKP5Gqt3BnccmVt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 02:02:16PM +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>=20
> Add the module clocks used by the Direct Memory Access Controllers for
> System (SYS-DMAC) on the Renesas R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gRKP5Gqt3BnccmVt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXMu9sACgkQFA3kzBSg
KbZp3Q//XRAADThmOhKwBslhWnZ9M5u/fnKJqFmhvYstI2C1mGldEL33Lx+TPDks
NUD9dGcPKyqVGASZe1Umx/KrAhv3+kEFAJ6Yx8FES1ZKGXe1DQ+k+w3tITcsmdsr
opGpKrn1H44d5H8j7LUz8SgVIsZ8rvyCmBzYKyH4+fFPUn3noHsfgDmWNxAIeDRl
JvjSdToo9uQrzr27HFHHEWPj+eXZLj9qNgdL4HCLCLlfUAdg0w7YZ85/ofCBC0r4
6jyYcj0kPEzN9qs82v/tO3x3vu3rT+9ECcMhIA6G56Ii0INUtC/723ZMq070pg7n
2FTckgmJsToU9VSdlHCpv0BvKVLs7hCjBk8eWt6OkgraxOHv1vs/NqHhFPkaPgIg
H6SsVqtoVEUTb/eo26Zwui+FPZ+LS/j2+V50/0H5x2+a5TWSzVZIgx/Vqi4ifLO4
h6mechrPS2liC8fpoz/CsAD/Rpfk0BS+NHL0U9MV6C4jgYGuLhNu6OMiYZs5iYYg
3YfmJl/bQnGMcNtDfnldskY5W/VPLkX3c+/LkZoh9kAmj9IoNpAOmvOD1L9cMF2/
/I3gYm6drOvQNAe+SxKAjUWnxP6wox/nanmpU7MhBm+3lulHR2p6OX0EmDkEAPpF
2OVWxcG3giULFgnH2KJO3UDTOvdM8cEMOt57l1kceXgur5N9C1c=
=LFPd
-----END PGP SIGNATURE-----

--gRKP5Gqt3BnccmVt--

