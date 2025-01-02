Return-Path: <linux-renesas-soc+bounces-11765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 723939FF736
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 10:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7039B3A20BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 09:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD18195FE5;
	Thu,  2 Jan 2025 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RMprv/2b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243621922F5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jan 2025 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808700; cv=none; b=nGvgNB/JlFuzmHQ0ldHSquZX+mYUwL1yJJx3k+m4nzWcrLCXw3WCInsmwiyH83jBvU+G893Jz9ydf7O3v8yZ721NJPpEyTmt/G/YxcqA9HisU15d1uNEDf3UHRujVVXsn8pESF3AidEGmAXxbo1Jaqqgb9K1LizeF7DNZaRGEHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808700; c=relaxed/simple;
	bh=6bmMOYwTp5trCR740TisU3LLS4d1XK1XILoxNEcE/Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QR6S82UUWCdIZL2DVgYKhwbbyG8uDVc3wjH78EZxLLRfD4LgTnrMGECa+swM763IFsnHpyZioyKLjCno+r7s07ji4MP3G/WZUir7exnAv/br0IPiQaFkv0hobnK0PzWhj4zOoSCWBXcbt9kTSBwst7V1ZtJmt2NaX1RqG1udRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RMprv/2b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Gs+2
	hPH7cd2bDykXunJcpg5uE8woUThZ9MCwPZZn9t0=; b=RMprv/2byYA06/5TJ6P9
	96Wl8iHffiFp/TG1JP2C8EHmoZFxCaCr4FgK85nw59KiwsjmVlry0nNhPH4hlshe
	oWCo/BlCUx6ttXpMd78kyW4ZGmqA77f8zK7klVgSSwXK8BjSrLPVIAXMd4KXuJU8
	UsbcFnxNC1D+B/cGh4PgBhKE6GcQ6yxrVrph+1o5MdRxmbvtvhkN6ctICoEQWeIf
	kOPDFJiHyZdTPxQVIyl5+skwlx9Oc97RmCWf8q9Oe0qOZhJ5sXjiaH4sDjrZjMe3
	AmLw3supcVDZMTcLkK/JgDHasAHSjd+nPsbvGETlkmCn0dqlzPyUsnnG56IUjWP0
	+g==
Received: (qmail 569827 invoked from network); 2 Jan 2025 10:04:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 10:04:56 +0100
X-UD-Smtp-Session: l3s3148p1@TLO3dLUqBJcujnsY
Date: Thu, 2 Jan 2025 10:04:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <Z3ZWt0Whyppr6GKX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U50NYcqUFG7jCC2J"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>


--U50NYcqUFG7jCC2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >         /* RR0[0] =3D ~XOR(addr[6:0]) */
> > -       if (!(hweight8(addr & 0x7f) & 1))
> > -               ret |=3D 1;
> > +       ret |=3D parity8(addr & 0x7f) ? 0 : BIT(0);
>=20
> Perhaps keep the if()-construct, to better match the example in the
> documentation in 1/5?

Can do, don't care super much. I chose this construct because the other
drivers in I3C use the above pattern. You still like the if() better?


--U50NYcqUFG7jCC2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2VrcACgkQFA3kzBSg
KbYSfQ/8CfgGrO0RTP7xeBKPxOpWOzkAj6hdyH5myy2b8d9GgHV/vJA2UHBZP0os
BKcPYVCIhNlae+FVmHVsH4RYesj5TGIHnqN9XBDQWV5GRaFtlSnpiB49qgI0EPcg
nZABv4xvqaAF3ZuNIcm1AWoY2Uy6diSmfXcfVQ9uXtCLtaak/fXf6MAB0KWedacL
dTn3paH0hVM+xYTarqVNbkDkKPdPaNzNzA+Vt/63n49A68M2noZ3rTt90FE0Pq7I
ByCE7l7drWUg53KTIRXHGYp4b1wwqdcNqRHfHyoR6bQaa4gObAg45fmJ2y2U0O2K
z3gZYEAKkwsqNmUO8sQyUKptt0CHu1rCXrnazdWwQ7/rJgLfPBtvxQQcv+jGn46c
ZGYsqWiATXGfqPxzQ1NVIckC8Mp/A5KOySK0n3QMiSXNXebK9PNFE029sPWSpqu4
gVNHzNSLonylc+bHuozdu0jX85rVI1KhSQGC/EGprS21AD+7AbDkPlgUmf1b+dbq
lboOCox54EX0Ro4MyZCn9zNB8sRdOiC2hbotiXIbCijY1qzRwQruXn7AdTEdaY2h
Y0T4jIWArdNxCNSFaiVODm9AxvO7BYZMTxD838FVKk4N0PKQDZWngKRlW1NcocSU
TC8p+Km+Z+8tJ2AWS9BIj4QAn31rqmo9A38dJMZZMOp7tb2eGQo=
=8Qzu
-----END PGP SIGNATURE-----

--U50NYcqUFG7jCC2J--

