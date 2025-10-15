Return-Path: <linux-renesas-soc+bounces-23105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D96BE0013
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 20:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C170F18837DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 18:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D102FFDE0;
	Wed, 15 Oct 2025 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J8Hab3lX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1FA30101E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551696; cv=none; b=incbFq54BDtf6c48SElZcSAFZ/rnFohCFRYDYYYHn9lGQkFOcNKsKJsjZkfXFcn03E5YAKb2DIbdNTXYixlbsnR5+hgKewAQ8G6o37bGP75MGSCzbm90FQ/kuRB0QKnMILIUrCVk2BJTsu9VySCAcBeFX+cKQMJmWmFJDOzTkqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551696; c=relaxed/simple;
	bh=tITFIPlTnmh5rS7TCs5KOMJo/1d+tZ0Few30V9Uzhqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIeYljNkwbwClEQtfgSard4osiyHx/mq9SAjUsQQMrqZOM6W8K+1wsymQMtBTwXVWmD5o/E5ydW1e4ILKTr/5tp+i64BTRtNOEUXg+rVq36XVWyXEO+mno8AfkhrYmeTUSdp9sbQEVzRf1zYNhBwHUiYf7x8f+VocBg0Go2VfyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J8Hab3lX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qcJm
	bEOtHfRYZUxSHJeSJG9HqkHIe5AGo1upUYdmHsY=; b=J8Hab3lXKZh9buqF6r0/
	5lxAE8w820okVCeHvkG1FeGbCf2czLDz4MO+ay6E5pmxHlXxxnEJ4ngwiLIq/2dy
	M+IwwqTjmB01tYAJeB0Lqi/n/LaSi+BULzcKC4KmD+FqBwwXal2uOn2cjWmQu5yv
	OQfdrhH4pd8V/a20VHxKJi+uROabKjZPf9mhoZVjRmMhWgaq7DLMll6ALzUtvKdD
	XonoycmVqedPLMxAaFgTqe4heiWFIuKFWRMmbwmVw1CMGjZrOMh69G/3IdzJrISl
	nrfbiTgsfoDFWeBp0L8OK6C3NmSjStfGz2T1WW8LTy0bBuTgjVSB6XlwkDzsVCU7
	dA==
Received: (qmail 3503352 invoked from network); 15 Oct 2025 20:08:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Oct 2025 20:08:11 +0200
X-UD-Smtp-Session: l3s3148p1@djUTYjZBkM657tt+
Date: Wed, 15 Oct 2025 20:08:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] reset: always bail out on missing RESET_GPIO driver
Message-ID: <aO_jCaplR1xUpj9M@shikoro>
References: <20251015112921.19535-2-wsa+renesas@sang-engineering.com>
 <c4996204c8b72f10324af87516b92a3a2819091c.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/PGS2WbjzRFbSKtd"
Content-Disposition: inline
In-Reply-To: <c4996204c8b72f10324af87516b92a3a2819091c.camel@pengutronix.de>


--/PGS2WbjzRFbSKtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

> > On the other hand, the fallback is a really nice feature which could
> > remove duplicated code. But if the fallback is not present by default,
> > it makes it cumbersome to use IMO.
>=20
> And it's not easy to automatically determine whether RESET_GPIO is
> actually required, because that depends on both device tree and
> individual drivers.

Well, the driver is small enough to be included always, I'd think.
What about adding this to RESET_GPIO:

	default y if GPIOLIB

?

> In short, if both of_parse_phandle_with_args() return -ENOENT, we
> should continue to silently return (optional ? NULL : -ENOENT), even if
> CONFIG_RESET_GPIO=3Dn.

I think I got it.

> I think the message should be pr_err() level if we return an error that
> will cause the consumer driver probe to fail.

Ok, will send v2 tomorrow.

Thanks for the fast review!

   Wolfram


--/PGS2WbjzRFbSKtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjv4wkACgkQFA3kzBSg
KbboQA//XEJ5iuIIs92WHTzw2shfIH0/DiyRjtgQ47hhj8ELN/ibV9ZC8ZfOVpvI
HVrxeBgLX7LEcpKIGol08BmkfHGkqRnaGMONnHw/w3yeHYo2utoYhzdgv37a8eEZ
VeOGmmG/ErmGVFiupW9GKNPl84YE878uxGkLCR0F5PPQLw25Ps8KUZwfCoS8xtiQ
wYXGLp0OUTQP1oY5uoMbYG8TAK5KpApdi/atCjUkdqObLsihRITfJB/R2QtQwbRG
eXx78UF/N2pJ05WcSkoc+s0cmXX+vFmlI6BuNpx/lGYYbfJwxKlZmaHVQucPUkPH
qoG420l+1JclidjVx7AgkHYZir3TP0wpvBIF2UIcv/nVt7+7HHWrXTUL6FkTyiu/
jjSEg+Qi0JbQtnlsD9gqfsNK9kZ/N48FU2c5OweucidWTz9BwsTyn/U5xQmNfXnO
UV5venGc1X3OdvZaMi2KWkzd/OcSVh8byquxBBjCDvd99GOklP/mWldxRArujQUo
jKDGO8K+TpUo5zPFfoh3VoFXHfH7lxiFprD8hiWmz/kSVdjV7a7ZuANqWNaGXv8V
NZnta2uceynX94fX8eVQDG5tVuYlAX1XCQfgubn3p/9oTUCoMGMOwXWqxWjVJfz9
ATBdMaIzGD1lXrAXwKTNMaNavwJzwDAvzdMP3dLxNogLnvmpBN8=
=X+Aj
-----END PGP SIGNATURE-----

--/PGS2WbjzRFbSKtd--

