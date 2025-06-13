Return-Path: <linux-renesas-soc+bounces-18237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA9AD862B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 11:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23E04188ADB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 09:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E437263C;
	Fri, 13 Jun 2025 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gRWoF+yL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168D2DA776
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805249; cv=none; b=qiee6kOs+6OBHOdTB96JoAsQ3HXWs85GS4tPxsHXjiJp1/YQvWPxm+2quuUQyZSXfYQQyYr5rE3u6bFHyiNamofutIMxAmz5EnF9QZM5FdIQ9AEOYMMEFaiMz6sZMzg8xuOU14vwFYzmkZf+ab5/oPrRKNQKyIubxz5jTKrjGwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805249; c=relaxed/simple;
	bh=MX1ZhSMof9W5SnhQVgowW4g8YbmpKOTWDsVh+7Js8xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1HYBD28XXJ1LEVDQ4BRcZr9ueXVgMc6yHd59KaXuP7fiOPur09QoQ5gn/2bE4Y6kEWkreJNX3KOXVwPDth0p0sXyGTlmIv6lZo+8vcVgLXceo2KTw3oDdKJjvCMODDqvGynq6HwGbV66vaAXOKqOK/ev0QSHFeJHSPCA9tVZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gRWoF+yL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+0Bq
	zdLlDglF/nSPHWXiog9vV+pZLDTRXBAdu9rqcZY=; b=gRWoF+yLE8jp52aSKbMF
	SJuLGDpZFx9pptq7CAiCNDvXBf0WVMuC0n+JY6WpwRqr+h3LXEsKNgVmnm/aasrw
	Fgg9G06eYAMw06EA/TvMbfT1OIhuo8Drl24Qv+O0ww0g2POTUaxE3RvojWAB1mEQ
	8qlfH7A2PwT0QaJ3vA99Jd4du9tC8Avq6L3xmJEeHl93s9RqeNzCsnl0K+qk/VeJ
	UAz0yMDKOC9c7tF3Ql70YvBSiU7AzZEYDd6xeqDV7faPJC8NlLkAB5/YwhvEnIv8
	Dj2hFy3HtHER+56bWKlQ+5lasSGpN1SjcS5hWIzlXxxKdBinhR836nRl6pGrqlUZ
	Mw==
Received: (qmail 151628 invoked from network); 13 Jun 2025 11:00:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2025 11:00:38 +0200
X-UD-Smtp-Session: l3s3148p1@eIGtR3A3nM4gAwDPXy2/ACpZfVCNKldR
Date: Fri, 13 Jun 2025 11:00:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Use new line value setter callbacks
Message-ID: <aEvotoVqitiHxgYA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IyZtLzjok06KW934"
Content-Disposition: inline
In-Reply-To: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>


--IyZtLzjok06KW934
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
>  	if (!bankmask)
> -		return;
> +		return 0;

Doesn't that mean that the mask is invalid and we could return an error
here? Or is '!bankmask' an expected use-case?


--IyZtLzjok06KW934
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhL6LYACgkQFA3kzBSg
KbbYChAAqCHL7AWGxGPu7Lo8VSyJDiJhZvgCLnnVbp5Unxwqs6sn7xdOajagBzKZ
ODBBT5CJrYyYK6ENl4wc0jP2KumUYcgHgLniq/rzLCFynPClnK+ojm6KSEmm3Z/y
4rUYmXH3nRL5d8oJZCnt6pdc9y5mXZ0jnPCYQMNBeyCkqS3fyzqYg8420RwiLRyK
AQ1JzgreZenuDJM7VzLoO7Q7RQQY520H1/ozSOaOZZISsjR98+Qt+IGjG1eGQCSy
j23YLLfYfWJ4q8hHX6ogEPA1sc3kzghdSmy7KmSejIsckED1vr3DD8xJy9yM5itu
CMKgiY1wyuAcJ+wjtejQ4P7Nruj6UH6fRzKjUe1Q4JA1XpVyVuJX5gnzSZPCzsX1
xPTFm1/dLnJeTMIMn+tckaSzmqnsmfKC8V/Crjxtu9FxrMSLkJRLE2ZewVoSqq2f
MrhwyuPoLX4g9ePk+3yM0uvC5D3TZBH1XO2rPnDtQTwqopcoP+NJObXfC5oGCLCJ
qKfrhxrRNx1jtbWeuVHxUlLHkmjpgHY4ZCBHrxsndGLtunxfiH5WeJTlqJx9ww3K
K/+7mGNSTZcsXzSJhrCb63JwAh0y9W0XnLHkG+U6yMCjAegy/qBfp0Hs/tpL/upb
GW5MCHJMltnbPH9yzkm1/Hz5LGL1x4nVIkpKfoBJIMctg8Gw0D8=
=BnHO
-----END PGP SIGNATURE-----

--IyZtLzjok06KW934--

