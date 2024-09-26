Return-Path: <linux-renesas-soc+bounces-9064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 523039870FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F081F25324
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9E0154BEC;
	Thu, 26 Sep 2024 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BCpw0QuH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E31D5AD4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345104; cv=none; b=oxcZ1efbc20d70IEGnujVmaMGlJsFspyBgF9tvYoRRxM6bzeRbj/OGW/A53w1D76ix1pTQvbH8yEBlSYCq0pQzD0Bd/1LE4fR1Pe/z5c8m7UCPqHQsMd7aHFpSbXQMol5yQFQvq5SWylbnE8LfE+nBfv2QP2Ervs78qLyT0UDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345104; c=relaxed/simple;
	bh=DVjzBKrI9vPi3GhqvJpdRR1RE2pnjskG5psvZyL5d7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU9RBfAHj+LtAIq9eK9j7iLXlAl2kfmdh7WoJ4VV9X0e0fCiR0BOJ5nrYOcRbUIaywkHc5o+X9o7f1KKfiEuYSP8lOzQ6Jv88JSYiYyA+GZOMo3e+EKGKUYTMrQJJ1FUaN7UlS3uRBtZ8ecGLiestxsp6qHSfAStx4RMTsVN0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BCpw0QuH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Gxph
	7Uu0nLcoKZoy3/C9V93eieFIzDkY/claq1thjUk=; b=BCpw0QuH2HYGVKziQlKh
	N2IE2C7D64Bi8fek7ph9GRrdazddDCPXTucim5QTDhOVmA4TwXYPz2+s37SvwdFD
	y/0vVo1yToBAL09chT7Q4wZDXR0Pl5GEqBctcdK/fov+3gHZOJgqMe2tx63H+Fkl
	iQ4iH7ss2fJAK1hMkKryPY7kquWMenN9tGxIPuL3L/8uQbL3jIdP3bBukx81QHMR
	IuEnwBKKzY/K3uePv92wWI85XwaYYwM7PlHn5RwCbODOBVksvEnMF047VMm0nKvY
	0aj1Yo8kOeHwpf/rtSuiIWbbV0kR9Mm9maU/DKOlgE2iiK2VmZnGvRuZ+v/WLUVE
	sQ==
Received: (qmail 941710 invoked from network); 26 Sep 2024 12:04:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:04:54 +0200
X-UD-Smtp-Session: l3s3148p1@cS283gIjyJogAwDPXzRXADDuo30Z+IZ9
Date: Thu, 26 Sep 2024 12:04:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: renesas: add proper node names to (L)BSC
 devices
Message-ID: <ZvUxxWTIDCGOUQjh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org
References: <20240926075724.6161-4-wsa+renesas@sang-engineering.com>
 <20240926075724.6161-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdVBAWny2Z1e6_D+v+=jd2y63a=HDe9+cnRMwfNTeh0cpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ihzRq58QCKAwDHX"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBAWny2Z1e6_D+v+=jd2y63a=HDe9+cnRMwfNTeh0cpA@mail.gmail.com>


--8ihzRq58QCKAwDHX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for the review!

> The "@<unit-address>" part is optional.

Ah! Then, I actually prefer dropping the unit address.

> Actually, I cannot find that in the DT spec, only:
>=20
>    "If the node has no reg property, the @unit-address must be omitted".

Sounds good to me. However, sh73a0 and r8a73a4 are still a bit strange.
They have a unit-address because they have a reg-property which is
documented for renesas,bsc. However, there is no driver for the BSC.
AFAICS, this could work as well with "simple-pm-bus" and we could drop
the renesas,bsc bindings? This probably is a separate issue, though.

Happy hacking,

   Wolfram


--8ihzRq58QCKAwDHX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb1McIACgkQFA3kzBSg
Kbbe+xAAtG3gJVzXifFw4Yxo/EZQ/mlX1Xe4DMFZ5CMrjXj547T6Ym2OGM0c8Vms
yPFf40F49Gieh9di7JYcp7Ni3+OluGdwv9XFzWE/1Z5wI3ffS3lw2xln+HB7Meu5
GHFmW/GT67QD8Iag98W8RgZ8Nla2Mb1oFDhAtfE0mMXXy/Fxv68NEmtIrzZg6a+I
bCIFhtiUr3T8Udic5gNttWMeI+aMcDLu2b+9O9DcYRYmz2a7ilWjDmY4GyFPj93T
1kky26YuEXMgbu3xrLLPCDM/JTlnHfJIxC/MFic5QBhWMkK7i0BZVGI1+fqsGi+b
2fatAPLtYUPJODYHip75Hw00L6vmzKzZj1orMyrptXCBrYgoPhALnTenZ5RwuGJS
MzQFGLR6CAQxVhP7BpStSDhrS3/tu9YJoP9vKzdhPoNEdf1y2fYzhXTYrmHUh3yi
vOSlD/V7+zApbr+FUUvczEmccvXnuoMNrIprJPW5kMLy1sGxncyNKb0f4IFApZTP
upigHDnR1zLGuy18VaKqjFFbvo0d7kjDUmuUPYimDUNyZpSijRSR0+7hHF4h59DY
zUWBOOoJfWSTmzyDRNM14BN0roslFanCm6wO6pJfnxazOW83BxnsBi/6PhtIDcsG
DeLWzN+UDjzzT/Eu1HVvqxOhGvaHT9F/uE6mLcKflSAgRgNQg34=
=w4gp
-----END PGP SIGNATURE-----

--8ihzRq58QCKAwDHX--

