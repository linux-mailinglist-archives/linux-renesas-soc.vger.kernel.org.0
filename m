Return-Path: <linux-renesas-soc+bounces-1877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014283D900
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 12:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1F82284FF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30EF134B4;
	Fri, 26 Jan 2024 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEy3zySW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB378134A3;
	Fri, 26 Jan 2024 11:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706267212; cv=none; b=WVFeEabi77D+379cd49TFg4+K2RpCwI4UiZ1+DxZ+HsaSCnheQJ/UOqvbO70IpjVcV8KxvdjNCDgZ1BGZxLslfSErZmD/MIZlzWdTLBa5/5tsg9G8A68Jm11Nxka5JN66J7FKp3oqAhQnaimw8DYABywHOB4VE1J5fVpz2oVZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706267212; c=relaxed/simple;
	bh=ufpNnfJru1104qXlFUoLfTNia/ycorGO/SvUYkTtyvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ/3ytN1LV9yW9S+VYMXTysD5KQYPl7QX8/IWnwK0K4aNkOvM72Zg1tnLI/bYuL+utDt9btBV/pAtgGZWadqCELrxXQFBLkOh0oio/8XWHhhMW3JQLGB+mhLmhE+hVtGYB+oPSq58M31sF3yf+oJM0yhCT5NgQc0uiHrIi3RUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEy3zySW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC863C433C7;
	Fri, 26 Jan 2024 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706267212;
	bh=ufpNnfJru1104qXlFUoLfTNia/ycorGO/SvUYkTtyvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cEy3zySWMgdmN27HY5tP8TgfhcPAInsz9CgmnaqGVBbWdovrl8sseficXs9KQX4S7
	 TURQVYs80yfiBntTW3q9+rgn3Vf/VKXMraTk7xf42awtVQSYgqTyvtv6Li1RPavJ+9
	 xTIHWCH2CMTQNvSUKWCq9Yt3urBWwdQnn20CxZ7XejYi3xpcL5SN8qHMxRg8UnBJ3W
	 NzbQm8H0gYxGt+1BEHEraR0XKLI1JBR29RNrPgq7r3PVKTo6rdr+/WddRgpBeDk82R
	 wbCsR6OkrPZ9bYlevJkTnba3GtAfU88ez6s6E2UQaS7cgy0DRv2M5d6LGUIWclEVTc
	 dWjbWf0GRXCAg==
Date: Fri, 26 Jan 2024 12:06:48 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 5/9] arm64: dts: renesas: white-hawk: Add SoC name to
 top-level comment
Message-ID: <ZbOSSL006eaoz6Ss@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1706192990.git.geert+renesas@glider.be>
 <de81db7ca38c8f4737092bdac6891e9db4bb9bd6.1706192990.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="van6FlUw4Gh6h4Pt"
Content-Disposition: inline
In-Reply-To: <de81db7ca38c8f4737092bdac6891e9db4bb9bd6.1706192990.git.geert+renesas@glider.be>


--van6FlUw4Gh6h4Pt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 03:48:55PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> The White Hawk CPU and BreakOut board DTS is specific to R-Car V4H.
> Document it in the top-level comment.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

"+renesas"?

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--van6FlUw4Gh6h4Pt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWzkkgACgkQFA3kzBSg
KbZSrA//RJEXxvsodV/5T/Y4aIeWLmdBDChofi3wZGhLe5msn0Da7h3mGgPIujuP
0YFbkdKoOFO81XRUNxMziQpiI0YGLO9R8A2e4omcGNXcsIahQ1oE2MpucArJOucr
YEh1bQJ84FcKM+uWhEbJTyr2voOdfMZ7rzD5VJ3mQs5l4RUAQ7Q0LhE8P04CwQxy
mlQQqWMKLMlX9URvEQ9HAKP6gJvWceIG2s1agEf+pa4PO+Fs8NHznXE/BJoeBI+H
b510CzNImz8nkns9sKB9bmYz67DglsebAfQ/NhnNlUL7HzJ7p9QiwWtsbEbzVkdF
J3hkmNk9i+QeN2a/Oz9qIEwwpSCHsIYun+5CkvVEDyvS/FMZRa/1uoY6pQ6XU7ts
HMTdoH5HuhjVAycEXnzmsmqsyBpY6PKD2LGaMAqk4ZwcMZtt5d37Q2RspgkQaOx/
4r014XUI94gnsi3zB5jU8zz9IwgAvdHfexAO7+GZAai2rA4WJJAgKvpBiOYYRiA+
tfQKKoUl0yQvjuIy3BN24BYvEROkIYIpzGj+z/c9niQS5+qt0DpoB0g93RROOy9Y
GBdT0OEYlJJIgLyEDIM8qnNI/kltVgfQQBxgiBdtrLmpie5xA5tf6fZLBsS3gCDP
5/VeSm5Ja8MB6gOh6wP1kTJfQsfET01ePD8xjKZSj5Odue3SR88=
=w9Xf
-----END PGP SIGNATURE-----

--van6FlUw4Gh6h4Pt--

