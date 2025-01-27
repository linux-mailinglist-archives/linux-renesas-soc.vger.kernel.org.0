Return-Path: <linux-renesas-soc+bounces-12555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD0A1D54E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE2107A3731
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4C01FE451;
	Mon, 27 Jan 2025 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ICkJZ3ZS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2125A646
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977294; cv=none; b=VS2geqTBY7ysYOizvnKZ3PHu3VFrKZJ1b9rXNEa56zTNiWHin9o9ZOenCGckQx/Mg0y8mnPnDsc2Ef+gOp59cqAWDLbrKK4p8Vgjr0TeE3F2IsCjehQKSa1TQhY5AZvwhmcXymC6Zw5iXDDcVQ1Xr6RaCFklwGOPfQTNV2F4M8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977294; c=relaxed/simple;
	bh=3x9uSPSIVGhCt9id42vR/S2Ig/8hr4jggoL9a/EToBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csiriMEnzmJtkrBOCctdqhxycNrEVjYaO7Gv2/0iIUQ40gIvaWJYd5Cpv+BKZP47vWPoj6qFeQwojI5eKpcAkYGFI/PXA+aJ9luzOeoUuh9nWOfU6fSamW1E/VPfiXc8728jefeDh+ji5cHkfIB6OGHVQnwQYPOvdDyLGA4dcis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ICkJZ3ZS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IFLD
	WEy0w93gL9rOdMlcc5J/OmXkevlT83n3T+1Y06s=; b=ICkJZ3ZS1rrbPzf1n/wv
	UoX2wCzvAi1mX/HV53bzIxj5wXm3EgJPxw4N17wVQptC3RF3eUqRAezY2GdCeo3q
	73pwY1NHoE4Wrvd8kdvznIno/ZwUoyag8G2/7bhD9y463BQSgodH7KFe8iVQhxUA
	4lwq2843AUZUeVXUjBrxfKs2zjg9zd/+ugLlwBOAumbkgACkrd0fiiwxMsKDQA6v
	unqoSxnY9nhwsbh9MfVQ/ra4+c+KNx1pTZBOcK/3kyC6aa/mfIP/KT7nFk7jPa1T
	7k53g2f6BPJkzLlSDcD1rUyHeucMMRmNX6Y6ApYTYYEmwZHgBOA+SU2egpIYGVs7
	NA==
Received: (qmail 217505 invoked from network); 27 Jan 2025 12:28:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 12:28:06 +0100
X-UD-Smtp-Session: l3s3148p1@1UTLXq4seu0ujnvm
Date: Mon, 27 Jan 2025 12:28:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5dtxESPVtg2Ba2J@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
 <Z5Z06WowFspmXby9@thinkpad>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zc+KCNiSvVhpUGWZ"
Content-Disposition: inline
In-Reply-To: <Z5Z06WowFspmXby9@thinkpad>


--Zc+KCNiSvVhpUGWZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> If you guys feel that you can explain the algorithm you're employing
> in a half-VGA-screen comment, it would be the best choice, and that's
> enough.

I agree that in-kernel would be super-great to have. On the other hand,
I especially liked the *detailed* explanation of different approaches on
this website. Which is helpful for users wondering if they can use the
new generic helper even though the algorithm they want to replace looks
different. Yet, this is not half a VGA-screen.

> If it's impossible or you think that external reference is really needed,
> I trust you. But please refer the original source. In this case, it's:
>=20
>         Warren, H. S. (2013). Hacker=E2=80=99s Delight (2nd ed), page 97.

I decided against this reference. It is a great book, but why pay bucks
when there is freely available information for just this one topic.
Besides, the book is a collection of algorithms and references other
sources for this implementation as well. Maybe as a second reference?

> If you think that pointing to a web-page with nice summary to the topic=
=20
> is helpful - please do. And if you would like to cache the link - I've
> got nothing against it - as soon as you commit to maintain those links
> up-to-date in the kernel sources.

Sure, yet then I would prefer the wayback-machine link and have this
patch accepted.


--Zc+KCNiSvVhpUGWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXbcQACgkQFA3kzBSg
Kbb7rBAAmixT4N07kb5ZPvbL/AsjoZXqYdXx6MUbDUA0GDbwuoNCDdLAIpW0xgeA
0yUz/bpen5yjZUNcmRa/FEjMdcnOPx/pFU2MAQwUS4i0IRklBumD5+PC9iSnXEsu
l1J7D98tr54l15GRDFBD2aBz5OAkwXoOxWjpwe27UfJjvnVwJomGvS9UOSqg074p
LhvFWsKgzGBvoQZrUBGeeTIJJqQHKL+KESErPsZOtmlZby0PeKacaN4vYGftgB0q
jSiDbnH8AaP00C74k5mRuWjhPEYH404rs9uiLM7+0o2PPU5P/j5tNI0miNCHiWaW
SwDodivWc59eEVUrz31dwwwlWN9hIRI73Y2OxQamy34/eBtaNSQNEKKFE+3rEfEL
zAicdTxBnncwTmSWtNvGuMlSwA7kzWqIoFQmp54ut8NGcuIPvNUfD3mLG4csvAEY
usZnGJPH2sr501HrgZ7f2XO3zTvczpb86COxfy/bgqEDcF3ef2KRV0Gi4E/C3Jib
EoOj3MskbYiGmKILaQwWbith5Bf4ss72h7QbfhEz0kFNHd95yPPo2djYdDH0lfm7
juUgs1/WeWIxaaBsmYAAPWD4h9MiSwVYsEEOxyMzPbkQhsRCdy4Uf5MMuA59Ogn4
oOe64rP2XmGmUnRVSbGUjmzCePzTY/wPX/cdS/w/YWvFTvAjH3Y=
=khsO
-----END PGP SIGNATURE-----

--Zc+KCNiSvVhpUGWZ--

