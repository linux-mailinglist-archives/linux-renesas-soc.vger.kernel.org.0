Return-Path: <linux-renesas-soc+bounces-11764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55F59FF72C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 10:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46B1A7A1359
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 09:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BBB193407;
	Thu,  2 Jan 2025 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EAIh7WLn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A23987D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jan 2025 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808548; cv=none; b=W9lpF/7QANxunoCsz38icilCszM61GvnJQdAEVjxXBMiKJdRJlqSjSAjSRhWLp0iCllPSba4xNYMYAd2X8S7xAB4lIwPEH7wkapl3rnq0/+PvJ35Gbu+P9GVxnXLkGX2rcJ6rKcgb5pq0EAbBhGjtJU6sdW0rwaS0dnIQsvwYwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808548; c=relaxed/simple;
	bh=wj2qkNTrCNfULZcoLbNKl0IaQxdt+Jxn3nPeJQdoml4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufWVfjxop68xARNhchqrmfQEl2GRii6KE5OTZfDNln9LkASNHzxWeeH8T1s2e6zeO/LufaaKCJNsTquNyHkoLOPo0EBDDIvXmKkl8rsyT4o6saOHmQ1RlxVbx4PTJYNTQY0BcjSNUtDcpXONwFSLpNGRYfIiatFmmhkDDAJOJdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EAIh7WLn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wj2q
	kNTrCNfULZcoLbNKl0IaQxdt+Jxn3nPeJQdoml4=; b=EAIh7WLnwSnyuRx9C1sY
	6n52Yx6cUD9E44BVY0yh5b6e4ELQClNWPZtYPwfSGa7LwhpD9R/UKQn6JWXVlXsO
	scxFp8ZdS/8ZLZzl/iP1o+Uar8vJf4R3fUrIDoP/HFhT0g7bnVjcr1t1D7SxYqY1
	hcPS9jj20L2RLdPCXd+x27LfXD0AasCjEDjwyEmewDMNDrC8do6UGwBf69xrkKJ2
	gzOHoxsbnQ3wXL46nFDBrPkX9gZkc62xARrLzk3wVi0nJT9oV94O8f/EuEbkskNy
	k7lEznSwgoLuPyDDs8Ahs+Nr9odEEYIN+4hpsehhkmYnbzNDNU9/JkQghPx/zMxP
	gw==
Received: (qmail 565308 invoked from network); 2 Jan 2025 09:55:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 09:55:42 +0100
X-UD-Smtp-Session: l3s3148p1@hJy9U7UqZKYujnsY
Date: Thu, 2 Jan 2025 09:55:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH RFT v2 1/5] bitops: add generic parity calculation for u8
Message-ID: <Z3ZUit3usbDSblTb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yury Norov <yury.norov@gmail.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-2-wsa+renesas@sang-engineering.com>
 <20241229111129.2602d219@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ln6sxa6tLb+g0/hr"
Content-Disposition: inline
In-Reply-To: <20241229111129.2602d219@dsl-u17-10>


--Ln6sxa6tLb+g0/hr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +/**
> > + * parity8 - get the parity of an u8 value
> > + * @value: the value to be examined
> > + *
> > + * Determine the parity of the u8 argument.
> > + *
> > + * Returns:
> > + * 0 for even parity, 1 for odd parity
>=20
> I think I'd return 0x80 for even and 0 for odd.

This would be a very non-intuitive result which makes code more
complicated to read. And increases chances that people get it wrong.

> That just need the 'magic constant' changing and masking with 0x80.

Not all users will have the parity in bit 7, some have it in bit 0, some
have it in a different register even. So, returning 0x80 would be a
micro-optimization for some cases in a code path which is not hot.

> Also rename to parity8_even() - since it returns non-zero for even parity.

The name has been agreed on with the maintainer of bitmap.h already.

> (and I'm sorry, but IMHO 0x80 is better than BIT(7))

No need to feel sorry, but it is really your HO. We have reasons for
switching from 0xXY to BIT() tree-wide. You might want to check commit
messages of such changes.


--Ln6sxa6tLb+g0/hr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2VIYACgkQFA3kzBSg
KbZ7CBAAh0jlbvTMw6abaiwqbkRGmbqaqId4ldJv/BY6XEMlcfTEkUUYNspV/X46
QiYkmabBEg2I6CvjJAFPimNr7zyU6Ve9mTtx40P6LT5E5o8m+uTgUo/ppB6oQgVJ
p5CgWcTTYdpqVY0yyDt9QpqqrGPYAHWFMv07ynTDcXAieDmD3oL+gaE+HSDWgdlu
9+pXqoSxw+DR66c2v2V07zmpAoaAIAL+9hBVs0x4R2HZMtjvj5Zm4Z2aKBJ+LHrl
86X7jk9fVeQZ5Xmal9mROnpMaOnyRdIZUoM2NzYVF/5FcWyOpTVFvplrvoYKTcdd
6jr6B3qs8O7sTg/eGroPQ5NjDcMko09P/bXK5PjLLQSq6e2dVdpruNq71Zus1n5T
BNQlOzeL4LxGL9oW9jAEo2ISguqUT9PKjQh/639EiU/e8TpL4azbj9hwUnsb6j5D
MrKRbBvvJNab+VV9xzjpATxX7/GtVsCDsdMBKRBv2N+L8T/AVog9ESxiy9hyJRDD
Ln9TlHhDKxKYJjMkNqPy50obWwZmmg7CJRvtUpM43U1UMJRH5Uh5JlFnOuabKmLj
af7BnshmlwzJdLhTpSy96wuDbuMj0HmLF1B+SO4ILuZICo4eUtcSn+phWUORkG4I
m7a98TNxb+EFTrRBaa/AOnBURu5ibs55Hjk0wMVTC5Hrd3cqf8s=
=RPRo
-----END PGP SIGNATURE-----

--Ln6sxa6tLb+g0/hr--

