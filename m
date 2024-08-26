Return-Path: <linux-renesas-soc+bounces-8289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0F95F2A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D20781F248BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 13:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5350517839C;
	Mon, 26 Aug 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZJRJ+qL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A978318660E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678259; cv=none; b=bzszfnErMDQdzkYa9jcFlxLuSqzpR1NGCx+hSYomIRhmtPYSHT1xiyc3iAX6jzNZ+QkoexzDCcDKQXxkdkyP9qSkIfCQae/UJX8WpvxIPPkaMGkfUq9we2tffixOGwEZvQ8kfBPUTarkem7fx6arMWTlOMPmGxUYVm1wwVAfA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678259; c=relaxed/simple;
	bh=TrSZOaPa/K9D1owCLeJ5jUplhYx0VHHZYY6zlVytrO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5TaeuBZqpOkxaO6YFwCL7IUwk/qR+rJZaZiHgpt2onf5sOJIq5Lr/xDjJUuznBGweaYSs72xvJZBdrFZC8F6uyGZdUTFltqQm1akIBRKYfc4yaONDqDhS00viGRg8e7eLgoUatrZ6MndY+QrTdLjfFJExwhpP4iO6A7P+M3AfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZJRJ+qL5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TrSZ
	OaPa/K9D1owCLeJ5jUplhYx0VHHZYY6zlVytrO0=; b=ZJRJ+qL5h0x2cEdAkRwG
	E7u2Yt4E228jkkpjXIYjYOUuq5fsG+M4i3uSCzNMLOR4NSIjF628LwWxzlHSvlMa
	7jtLWa+veoAOC/pCrszNofRx8/1k0by+maXqW//PzVVX53EXwgHVVt6a2Cxvv8o5
	Zxc89v2JMjK+LjehjWLlZe3LT515dM0AIfpQwcP1yVq3Z0WaDsQzbr/cpUZJ5Ty/
	ncg2SSduFBgU8w65O5s2yJ0Iqpz+t0MTpF9hFrwQoxkOj6EY1ZnI6NkwDNcNjXG5
	a9Qt++vYwOX319Cbjd87rwtBYikvN9tczf2SNvNBtbTtcv8gJWUVadXxjMbueRML
	Bw==
Received: (qmail 2001654 invoked from network); 26 Aug 2024 15:17:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 15:17:33 +0200
X-UD-Smtp-Session: l3s3148p1@Nuyg8pUgsskgAwDPXwdRANgvu6DX4+2c
Date: Mon, 26 Aug 2024 15:17:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: testunit: move code to avoid a forward
 declaration
Message-ID: <ZsyAbVwsOiVMG_sz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
 <20240814182210.15382-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Spfa7zFIHbM/yJcr"
Content-Disposition: inline
In-Reply-To: <20240814182210.15382-3-wsa+renesas@sang-engineering.com>


--Spfa7zFIHbM/yJcr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 08:22:08PM +0200, Wolfram Sang wrote:
> To avoid forward declarations in upcoming code, move the workqueue
> handler as-is downwards. This will ease review of the new features.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--Spfa7zFIHbM/yJcr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbMgGwACgkQFA3kzBSg
KbayzA/+KHLMNr7HrgfuDBy6MxlqLINCIsOipLoVYROaWgrHdlJ0oI7gh5KuKybK
oUUl7cFbbdsDiZZ9s4VIWdpifU0DCExJ3j+s3DlAHplxB1rCX1A7VaBg14K28QvB
iTKVhlmV/gy17Gdq+df0PmjLsdu0AGlgtvjCM6G6cLJspENEF0/sipAa3wP75K8c
Lyqn46zQJM0Zw0qBQNGeAJhWQNWA3az/jvYHsz4X+vv0HpH5bYvxDWJJE/i+SASv
E8vhT+IOmUUeS6ALxqYRc96mM4J9Rq8V7wjUAbT1LnYflb/aSaEDdOjNciF0E66s
i8svfArDPNj0Uh3zyNUjiVF2r+Sx7N3m/lAiie94JfRhrq9Wz0uh68r7VM0GO/gK
MRV4eVkDIWTlD9b7ssuRr7JRgS11YiiPcAqYD6tAdXwFeeZbogQvoBe1r+ELW2e7
rAxCkopRLd2y8WwsWiALw+KimioNJPD+x/W/cSZutB0G/pda7LKu7hJ7JBRCBKbE
WjKl1Thj7P6+jz3jous1Llbr/ThqrtkGTeRNGhNOZQL+l/12Oidh3TY7tZVuhnjZ
89kXFe8NWZ5s7dIBlNTasjpvBMcAzn5QH9cN2jXi5RkQyK9jhFIiDYSzle3gq/Y4
LChZesQhCaHa/2ZLpB0trbFe5NAn2REuY5I7L4HWAMNlfDJ5fOk=
=lDeA
-----END PGP SIGNATURE-----

--Spfa7zFIHbM/yJcr--

