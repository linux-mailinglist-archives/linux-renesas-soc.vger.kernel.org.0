Return-Path: <linux-renesas-soc+bounces-21067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3DB3B8AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA017B08BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 10:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D712304BA8;
	Fri, 29 Aug 2025 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ADTTBaIe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2C1DF256
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463221; cv=none; b=IizMQnn2P80j+ZnKy8uQiiVjfdcM3EUP6+CevgFnuCxcuyLbveuDrAXphLCG0MTWYXbmjoVZbqFtM7yCZR978B099FaLfBxhbYoB1kAcvJcoQB1SDqk3aFNtx7RL5QG8exvMAW3SVrvU3BvRy7bNoFkuNpUmUL8q9n7zVP7A1HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463221; c=relaxed/simple;
	bh=nAF36oJy8dKTU9xaHlD68r9QBzPM+5hmrDoWIId9v9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/+QtGncp9fDNB/o+XuS+McqIuiqGPRfYIkR/YNeB/nGHquan54iZqnEE5YYHHYVJwZ5CzA9TqDWjKb9cJyDBNCAUeZ2/VI7mrnVJvhPrSHDYnowrDA6bQWI649pojS0xfkFpHsJ6WjmPy9w22UL6oyH6pGmZNbhLAZb5rwRkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ADTTBaIe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=O++U
	ByZLhmvU6YE0qJBMcHyXS0UZnUlSnOCoY9nS8ck=; b=ADTTBaIeZxqRjUnI7tsX
	YzxY/0OTrAEDMYbimoXqVpjc4k1/qp4uTU4bveSKjCa0qRzOsUTU/pECtLB8M4l3
	ee0gjlB7wuQaTUdgpBW7KQCYtAiPKd4LSHI0bTqnxjNYRh0DvBo6xFegcyJ0tJxa
	PI8Te6GJQR7sLOIRA4Y/FaEAqXU6y4qGkeimeGZv+/0TNFxmX3TPeVAfRhs0+NrV
	zA7bWY2mMX/WGB9sreIxlGf4gOaPidvFJG/M8sdxi74FhLyqJZMFTaCbAf6hF9li
	xDAuD/YNGgPmngBssYhzZwwWWA3z/P5Piz0jNj1xpWXJWg6uO2dsqZiu/e1J4mnE
	Ew==
Received: (qmail 1417178 invoked from network); 29 Aug 2025 12:26:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2025 12:26:48 +0200
X-UD-Smtp-Session: l3s3148p1@0NGVdX49vMIgAwDPXwOZADQgI+b4m0Li
Date: Fri, 29 Aug 2025 12:26:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju <biju.das.au@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
Message-ID: <aLGAaKYucaW1vPCg@shikoro>
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F8GY5M2JEWrkv7+C"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com>


--F8GY5M2JEWrkv7+C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I believe some of the SoCs that do not support 64-bit accesses, do
> support 32-bit accesses. Do you think it would be worthwhile adding
> support for that, too?

We have that already? Check the context after the chunk added to
tmio_mmc_core.c:

        if (host->pdata->flags & TMIO_MMC_32BIT_DATA_PORT) {
                u32 data = 0;
                u32 *buf32 = (u32 *)buf;
	...


--F8GY5M2JEWrkv7+C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmixgGQACgkQFA3kzBSg
Kbb4NRAAsThMdFsKPiqQSz1pbDn1UHUP4i6IO5AmnCrPhGO+gSaxx7sOY4lzrW8b
GnRgvFpNeH8GPv/kJ3AsMJC1KcI7OJrxCpklVfP3NScR3bjPK8y2GZSFKUHb/os9
4CQVKLRMlYEhnNS4D4/Gq7RKCyKMbAQG7+oshIVbh5SB4tNSwulDqz9dQWuhn/Rx
o9cCmRXoBfemHTFzcMfwynLZJUstA6lvRjo0VNltJtrcIVJebqgfsCaqLT8/buSf
csWALcF8Gpvngw73Nx1/bctCHg3DjawppSoFcl9nnOc4n0/W1eq8yB0hPGMj63c4
RBFZMH3RYJIaAQ1fg+xrYjmzv5cjd+AaeptLrsI4DnOOj7xurbg2Y0bVQK29o1bg
TowC8mWm+TyRS3YuJVqc6pxsvYx0Gu3yShS2yJDM/G0SBIHq8eLWPfo035aI3Q8s
WTWYUFNVtA6h4m+rSKavmVwEuXNvVe3C+01FQdnjsf3F9A7j1HCf8zVcAnHvswgb
hcLTpVeNpdRVUmScvLglZyW2Y5Zbm/f1Nti5M7ZdpHpeYUFUt2cFnH7xVfbUXpUu
xWTJhSjVDcqOLduC+e3DTqCGLLGuwd5Y9NElIML4KX/+adbELG1MrBjufRab6fh5
XgyCo9H1c2Zbl0oH+CmGEDemaAcj5SucT6PRmBFpWhxsaif8MyA=
=kDoG
-----END PGP SIGNATURE-----

--F8GY5M2JEWrkv7+C--

