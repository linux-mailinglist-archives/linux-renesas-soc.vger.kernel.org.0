Return-Path: <linux-renesas-soc+bounces-11799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0937A0075F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 11:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F3418841B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213431CBE96;
	Fri,  3 Jan 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lSmi9E/l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D3186A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735898564; cv=none; b=Ql+ofCzGbGnO4PokCBmLeAoW7UMv9jOHfCfrCcjHbAVgxFiutF9URXpWrCDwbyx6Jemo4NsEkx2+mkK3kkqm7TWmAG9VCoSZtFmDd5sL22uj2kw6qnVEnbRA6HQabUkmyNo5vsOtJDkCCJHK0SK341NWkw+nX+Tqx6LtxEIr6OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735898564; c=relaxed/simple;
	bh=ubCr48YUaOSALGz6FYTS3jlQqmRntaOl3w8aV8VbpEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnqklBcwVzyAMkrc/Ah3IAUWX3RLgZFn0g/CAD0fBJy5KhBjd6fi725FbLv/ZiYo8usdqtshFhs0GVWOv2s6aKjSFqHrLqsrES8Up5wmPRrTCE26HXGEPvRRyrUyg9NWN4/uvoyMdbmZe5mvvbA8MtNdr2anmiCYxYuJeelB98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lSmi9E/l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NUMw
	HtNan+TxpgJjkQKR7rfLku7RbwxkAScy6YXapl4=; b=lSmi9E/lpme3wFYe0E4U
	0jNjl7GUxc/8hlBI3bNo6zE+KMFkvdV9km7KTsmIDtgkJqJuE1luCeHGVfRrCGwn
	5Vqr96MqY2CnlUyVCpXxasDotZv7pETPs+xgqwU0dkjtOdsCugZdeBQmz/mW0UWH
	7pjusz65iq1Po9ir23nSnXwT6PLdxIi3+rgOa89OihFMo1RCrtF9bsSqddFJ9rQI
	FVwWq4h+/X7VwrFH6iGYPSutZsLlw0C0na1FBZiS1MyRkt6GZ1Ti2IGbMUZHQdYH
	DT9jnLSJZVLd0gVmjYXPA9bohVYWQ5FZxQVmZcNg3jqQmJ7VQvPPBZnY1q/w6TG3
	Mg==
Received: (qmail 863052 invoked from network); 3 Jan 2025 11:02:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 11:02:31 +0100
X-UD-Smtp-Session: l3s3148p1@VFV8YMoqeuEgAwDPXw20AOMQ2KO98fSH
Date: Fri, 3 Jan 2025 11:02:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3e1tuAR5GsEhYLz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
 <20250101121431.05d831c7@dsl-u17-10>
 <Z3ZV_D5AIUxFR1Bw@shikoro>
 <20250102185109.0862cae6@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XkLW/A6lvfQrGhmi"
Content-Disposition: inline
In-Reply-To: <20250102185109.0862cae6@dsl-u17-10>


--XkLW/A6lvfQrGhmi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > > > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY); =20

=2E..

> The old code is:
> > -static inline bool dynaddr_parity(unsigned int addr)
> > -{
> > -	addr |=3D 1 << 7;
> > -	addr +=3D addr >> 4;
> > -	addr +=3D addr >> 2;
> > -	addr +=3D addr >> 1;
> > -	return (addr & 1);
> > -}
>=20
> So:
> 1) it always sets 0x80.

Right, this is why the arguments of the ternary operator above are
exchanged. The old function was basically 'is_odd'.

> 2) it uses addition not exclusive or.

True, but it will work nonetheless because we are only interested in bit
0 of the result. For one bit, XOR and addition are interchangable. The
overflow to other bits is not important.

> So just not the same definition of 'parity'.

I think it is. I mean, I3C wants odd parity, otherwise it will not work.
And Jarkko kindly confirmed it still works.


--XkLW/A6lvfQrGhmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd3tbMACgkQFA3kzBSg
KbYNeg/+PNb2KMDMP0ewXl/IwD1G7mkS7bO+bTs1JpnpLpZvEoq5U1mCOIj72NpH
Oy7GqlMS6dsy9nQ59V0Mhsh9ggSKUqcE52xmT2Vg6hmk2yAp4V45MWSNxpvxGMNU
Q7PAj+Wad7haeb2EQNIuTRTYfVwbGu6wBH4jmeTji8uoW5g6IfsDlQHpw8kkOTuq
a27m135CELE18toAlUNzsxKRjafEP+y4af+mvJQ30D+sz6pR7UybKT729c0tYfc5
clrmZ/4G8OWtaaNvqHwTYynEj65x0KaJur/F2pyohX9Z93WHLrxA7n3ChP89bYv3
clJGwaUxzT1DPpUBpFeIOjRlYMV3AHPSOMI2NCvjcM6YGLEvSjXJ84pm+67up/Qc
FevD72MQ1SJua4x1P7eIxs2xivQ7IaqXaOSsisUmAmXSjnQhbDFbeHd14d+pCRN0
Z+/oP1dpB2gkYzlo2mDazhnan+caHoXqIj7ljUDLOLVDmZ6VQQ1M5MlisIdg/7zH
Kdjla22TaiS6oRJ2qKpVJge++MZLr5h96kdrC1jcr+PSn+NwiOie//u1cOk9lOdr
4pNGZHYY8MQxLaHlu9+OWrjCUNQSqeoV3cq/X12TE10xYWzUrsHycoKAgQa+O6AA
FiuPqiiQtOFLxVmHt7JjvoHxvwzrpgB+CJZ6ewXXPBjx1Id53U0=
=Lanw
-----END PGP SIGNATURE-----

--XkLW/A6lvfQrGhmi--

