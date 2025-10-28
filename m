Return-Path: <linux-renesas-soc+bounces-23733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B6AC14498
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D8394F3A9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 11:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01D729CB3C;
	Tue, 28 Oct 2025 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ig3+jrf3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65B264A65
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649451; cv=none; b=VEbL2f6gpn7Bbannew8rKIx2+YOWDKQ+m65yJ2kKktH17vY84/LcqA13XfJsYfkTLTsutf6ObWppsr/40qfVKCxE1J/4ohbK31TbuN7qO5FcgJXam9BZ5/DrEc/e4LZ2LeOi8TPs7BnjFmeror4u1f1YWy18sFYMr62yXhqsJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649451; c=relaxed/simple;
	bh=eiagCQlZPxukDR3dBg6xurkhW//GBX2JTyZWx8vsuMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIiX5zIWK/5NaBWTQqc7XSvUTX528Q5saZFSo8BSTn16uok5/EVgdQLfAG0IwP/+fuGWb6K7byR5+0JEA0vO/EUMXw6058AUeWJi7XtX5+kfl1uSzq6A+Vq14crVXij8pGIqG8st6b1ybTs3e9WySYIlyTb5/KzMOH/LT0oe8w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ig3+jrf3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QOoq
	nRZ5QptYcwwwGgkRLC5034BSW6v2/L6Wq7Uo/2Y=; b=ig3+jrf3bi68lqz6da0W
	mWtjD/HOikeN3Z4AskCYjTHg/+iLJjdY6FMjIJbBcCsyFqtG1hfxt2q0BJAyx1dW
	gvh8Z/v86UXgKmv2Dt57xLLQ4/CfxU6zSktG3B4fajNUMajKKqq3Q2THx6ZFmmIf
	zAvPt31DQnmPSjAzMdb+k0WG+61mDwEoPkv6H8CxGr5XEvaHZl/1pZN1HndZuqvK
	b4m4sYEZygZ4ds7wHdRbZd3r38getxI7mIMo7ZFcyJlITd23rDikQujcaPRuXUx3
	kpvEBSmwMvKVCNR6LSlSbZfMl9CTFri68qDCRjSqD09XnN/XJAPHg2M7HXUM0lmH
	DA==
Received: (qmail 3986450 invoked from network); 28 Oct 2025 12:04:05 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2025 12:04:05 +0100
X-UD-Smtp-Session: l3s3148p1@Yexp+TVCWscgAwDPXyjKAONDL9E53Fzy
Date: Tue, 28 Oct 2025 12:04:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
Message-ID: <aQCjJcXaKAjjUhTg@shikoro>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXz9egr_tye9CbVRMJws_Y-jh9jwCvTTOq0JRar7Zd_Xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D2ke92+uNBjFUwaA"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXz9egr_tye9CbVRMJws_Y-jh9jwCvTTOq0JRar7Zd_Xw@mail.gmail.com>


--D2ke92+uNBjFUwaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    mailbox@18842000  {
> > +        compatible =3D "rcar,mfis-mailbox-r8a78000", "rcar,mfis-mailbo=
x-gen5";
> > +        reg =3D <0x18842000 0x8>;
>=20
> This is an 8-byte block in the middle of the MFIS register space.
> Perhaps the DT bindings should describe the full MFIS block, and not
> just the mailbox part?

I think something in the middle. MFIS block also includes lock
registers. We have a BSP driver for these using the hw_spinlock
subsystem. That makes sense to me. Currently(tm), the register sets for
mailbox and spinlocks are seperated. We could make use of that or we go
anxious and start with an MFD right away.

Gen5 has 64 of these mailbox TX/RX register pairs. It has additional
message registers which should be included here IMHO. It is usually at
offset 0x40. I'd think we want to have one MFIS entry in DT and access
the mailbox we want with an index. Instead of having 64 entries in DT.
Well, actually, we would have two MFIS entries, there is one dedicated
to the SCP as well. It would add 32 more nodes if we describe every
mailbox independently.

Note: if we want Gen3/4 compatibility (I think we want that), we also
should go for one MFIS DT entry. On Gen5, every mailbox is 0x1000 apart
and has all needed registers in there. On Gen3, first the 8 communication
registers come and then the 8 message registers. So, they are not
seperated like on Gen5.

Happy hacking,

   Wolfram


--D2ke92+uNBjFUwaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkAoyEACgkQFA3kzBSg
KbZ84xAAl2tVacWHHDACqFO+oX5fWkC2z7Gpxkz6WVVc7LFcHUHDWnTT9DHxQ2Pa
+UkfciwO2a+VbENwJ4iBRrIhWpYI5VFHzx3PPCKpjbj5NXpgDxTC3CxqL4wgLQ5K
uY63h0sNiHIkNB7/+hjIeJzPPDgq6kLhvg3Z63hmRVIYrblsxkvdy+MrmqRnAQ0E
jPZUN3qgH00ve/Mm56iItiug/oSTNkfsfMOA5DJaUSkqWUL56pu1UmNWC8FNCEjY
RaUg8Wl2SrqwqD6SY+6pVkYgaqRX7Xw3nrLbgDbN5V4w+Gij2Qr9Ec70gI4YFAdx
judMIdI2IiGkxOKqqnqvuK5p4JKZUEZlz1fb694TrLUMCLnQKh1xWpb7QJHkKMsk
6N0SORoc4p93yKlq2w7oMSPlMIxmeCCP43KgUHCz1OilMuW95PEN8S2sZgwR8Qt9
s/47U9GVCtg02p7N4crM7tDJ8QOxprUwO6gMZHfaZs895rYugrAAW7fXz6kD/WQG
AQjQotR5r6cdIaOww5Y+/tRfzKXk5AyGbfRzuT6sp3xZl20meCgugJ0KTQmAljsq
b1osFVskAny4ppOqoKtEdnlVQ/c5Rm6DmUPNLhcllMMgkqgnJy2mRZwM9uNeHH60
UcEZOe+n96QBWuDjtyTqF7UUOX/t826cG+7lU9dzDw1FZkNRKek=
=juE8
-----END PGP SIGNATURE-----

--D2ke92+uNBjFUwaA--

