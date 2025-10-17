Return-Path: <linux-renesas-soc+bounces-23214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C7BE7DCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4E1A18884B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FD02D543A;
	Fri, 17 Oct 2025 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kkMajWmK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE82620C3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760694227; cv=none; b=YfwpNzKV7GbQMPuJervwQy9focjCbpHu7Duziu4xo4etMk1dTnE7dmL2eD+hfMGwPNOtwPhAhW4fJ3oLjy3jbapqI8BjsYYF1nATdmKaMvGVBOOa8wnorkSxKCERMc8i/B7IjlhdIYxsu6IJXukSF7/x35x9M5n3j3dQQVM3rno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760694227; c=relaxed/simple;
	bh=MzUi16oTQP7YHfK3t1Su61QtqB6pRAeB0dGmYrV1O4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwaFp3rWZfggM/BYoJvBRJbLfVnD1RqYwDtFIQ16iAZ1eypIrCXWt9pcQO8q49/ywgyyhC9pzpYj+qNiP9EhYMVij7MsRFNjRAx62YPMSU1/xxV3k838obLeB4cHEHNVxFqAGxE7JqcbLWsqu4jRyd83SiImXdTp2TNkd0rFkNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kkMajWmK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Znz4
	K6t21CCdfuN7zqH8zYTpEQqSRJOon/pDCPX8WMA=; b=kkMajWmKJhV/VS4kMuH2
	I1Rq1B2/3ghdsonceGUeZarfPv+hXN0hpGpqO+O11iC9Ndwho+xDWTEBhi6nwPDc
	GhuphqJzwXp4E/SO278HP9ebalbOxj+R2+HeRKQU5b64SbkZD/4L1sG5JsRdZVqd
	Iu826jvIf4XlZs4UwDAiAbqpgZKtC911+rP0ZR+oyzIlymjuHpl3CP/rOzuH4xUA
	DayOkJKxQuzaX95nELwjv8P+tI3xEEY6qir/pT1XqRFX/3NswA67gAPxkPBGRWUH
	vikdehXNoEvHbK5Z0XWw6He00zxv+qHS09z8nT2ZVv7aqUUHuEdE1sXIh7FucZt1
	pA==
Received: (qmail 4172818 invoked from network); 17 Oct 2025 11:43:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 11:43:43 +0200
X-UD-Smtp-Session: l3s3148p1@rUq+kVdBDoMgAwDPXwQHAL/S9V79e5yL
Date: Fri, 17 Oct 2025 11:43:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
Message-ID: <aPIPzyN86tTwAU4I@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
 <0a347beb6d3b6adea2f9c78721d33732b8e85724.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FtxeUC4QscgIFUQr"
Content-Disposition: inline
In-Reply-To: <0a347beb6d3b6adea2f9c78721d33732b8e85724.camel@pengutronix.de>


--FtxeUC4QscgIFUQr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	select RESET_GPIO if GPIOLIB
>=20
> Thank you, what was the reason to go with this instead of
>=20
> 	default y if GPIOLIB

The above will "fix" existing configs automatically. If a config has
already RESET_GPIO=3Dn, it will not be updated with the latter, so it
still requires user interaction. Because RESET_GPIO is a leaf object, I
think it is OK to select it.


--FtxeUC4QscgIFUQr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjyD8sACgkQFA3kzBSg
KbaXuxAArj/dWznAU4C7+FWN4UA6XkOJJxxxd7xOcnMifuS+3bNr+kOHcrv7BBF3
T8kIvjr0U/NDjyE44IxMBor8ymkMP5RbXQ+4nhrjAo8+OvsFCLoem3IvCeKTknQc
Qi2+VU9tjWdEWV3/o+rgFgT8VGfe6edBvKyMTHsCK0WNu+aZl6+7L4hzREG5oS71
cSo/v1BD1aqgPPdhC4d99RfERdCDq9vwTaT6Nsa0ztt9QUeNwE7jVplyYWrOZqXP
tAUWKbhXuFtjW3eQ2o8bDsrDIft6inkMVTieU1tPE3eeJ5rtFZqYiiOe4z/SW90O
sWvXKPIqqjYloDRxhCr90i9q1v3HY+bQDYwgs+ZuzkpO/BigMjKqRpqbyfIohV5S
EjicBs1/lZP068bWpDyPVaGLTB7NC3jWAnlz6kH1d8ysZ3Bv0NV1O1MPvb042hSY
hPHALwv+gnvvQOAqINp27Jn2jD3+rrEXjHyVQywl+KFI6V5E8dIVjTnsu/xLE7Q+
Xy2DNxPoRpyHChdXR15Iif3coIBJXy8sxFZeZc12wO7TgFDZ/MevhUuYWLmqK3bM
RJL9Co1zJEoL2YRzyu04bdEY6PRLzchnrlIp+l4/EDH4mQNeEIuFhL7q/r3ocuYk
Li/nScuPhUJWmTXTiap/AWdsxF5Eszlf0zGY+RTWM+fNP7yB54Q=
=XHld
-----END PGP SIGNATURE-----

--FtxeUC4QscgIFUQr--

