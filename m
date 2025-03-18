Return-Path: <linux-renesas-soc+bounces-14611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F28CA67F0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 22:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A75216BD28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 21:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855982063FC;
	Tue, 18 Mar 2025 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Lfib3jtk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281EF20469E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334310; cv=none; b=ExidERcc9Bw12CaAZiqy8kXyut6Ekz7q2pAWpc2vYTq6OK4jKcEyX9NCGjkYwsvoY/dKk1CBH7jNmYkcMG8Cfyog2VbuL7s5DHCIDtCb48O772Pbn0GpEd35E/P9FnrFPRwyj0JAfoD0VzMaxD6tz3Ag/3jWPYRKaQC2fdDCBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334310; c=relaxed/simple;
	bh=bMM1wi+NozKN3/tg/TNSU7TCynynqWTpswJC2Ltfdww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oqbuah0/+5j/OVpYQnIn5FSyMTgjkluXXR4HOysTd3zt0w29ZQKnC/dJWSxeQnXN+odaNi5+hUl0cbm9qSjYJmJ8Cvu+296RInDjiGwm9DKd2d9NZ/KYmpBtCS2IwqRVHUpZdpiqDenK1O+Omzd0jKH2p4uhskrJWGHrC5VnFK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Lfib3jtk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b8Bo
	+WjcBkSBJdu8LGh6iRdR5TxchwQpHG5ejNYnok4=; b=Lfib3jtkxEsXAP2Ny19i
	9IMsJZGsfqdiDM3bfObY340JPfKytqUzvjWlls3tLek+PFFZRe7ORdvfoTYn2gdj
	xgzZturlPW5LDiWL6l7bBciN7G8Liov9WASEPqIxqqleVAaqiTTK9ro5vV8g/PBp
	k6jCUeWLJD/vVKj1DgpJzdTD4cZuGZZ4z/8WFlVo1VJcT/DrOYxdo+gckiqbOQBW
	i5NUVvYujSS9bOGT4/gPseJJjVvYUUvGIVkAzjT6mgq5i0fzrE8WB2ruiNb+2uou
	IlTfzCcBVyIHz7PiLvLQw6so9EKGIBsFet/XOW0H3tcdtHr0PaKsI7Mhd/bRM+hD
	Rw==
Received: (qmail 4009536 invoked from network); 18 Mar 2025 22:45:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 22:45:06 +0100
X-UD-Smtp-Session: l3s3148p1@KjVg0aQw6Ogujnsn
Date: Tue, 18 Mar 2025 22:45:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Ulrich Hecht <uli@fpond.eu>,
	Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
Message-ID: <Z9npYaRwzhsoLxS9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Ulrich Hecht <uli@fpond.eu>,
	Linux-sh list <linux-sh@vger.kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVM_ozW4LAA4DstQuDfEcOnOcXZ2QHGv8nYMKDPWJe43Q@mail.gmail.com>
 <Z9fxfV9jAGJ51fcn@shikoro>
 <999cb080-ea61-45e5-9ea0-356fb8bc4639@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZSSzgJ/NPc9toIdY"
Content-Disposition: inline
In-Reply-To: <999cb080-ea61-45e5-9ea0-356fb8bc4639@bp.renesas.com>


--ZSSzgJ/NPc9toIdY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

> We discussed both approaches internally and did an initial
> proof-of-concept of a separate driver. The result was over 1,000 lines
> of code copy-pasted from the existing sh-sci driver into the new driver,
> which is generally something maintainers want us to avoid doing.

Darn, 1000 lines of logic is a lot...

> trade off here is whether we want a single more complex driver, or two
> copies of much of the code so that bugfixes/improvements to the common
> sections in the future need to be duplicated.

Exactly.

> The RZ/V2H and RZ/G3E have interfaces of both the existing sh-sci
> register layout ("SCIF" ports in RZ/V2H & RZ/G3E manual) and the RZ/T2H
> style register layout ("RSCI" ports in RZ/V2H manual, "SCI" ports in
> RZ/G3E manual), so keeping things closely aligned as we move forward
> will be beneficial. I expect that this will be easier with a combined
> driver.

I will have a look at the series.

Happy hacking,

   Wolfram


--ZSSzgJ/NPc9toIdY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfZ6V0ACgkQFA3kzBSg
Kba5ahAAl/Ml/ppwI24PMjK1c4ePEYFQ5vJsj56tZw+c4I6ys1LCKjEuwYVYXYTe
6Wg8A6/IxSYrxhrqqTECYBwcnryDDUNXJ5vKRdhqVPRCYVbgHIhqblKA4LVUTAzi
9+e2Ip1hRNdZP+H/fSSN9zF2EDfQQng8J2pCIdcBkBzzTh/cYfCgdkpJnIMpKIe4
SiEQKiOuVs1epIHFPpqO4vw46tw5SCgJCxtZetaqx5ZJRjn/d7YbCs7J5MDxAX8j
bEloxNKmjLVdt5MCKhHXdhxmzwrf7lY6api2Le3unyiDFSA3PEzZnoVRThvY4Jux
2UqwkjAiA7+LoIi+Mwan0b9v2hgby7QhuF47ZcHn+gIC4fVER+0Pxt69kxM0yt9U
qjgjZNfG7v7MJZRAgePdxW8kzPU5ZWj8ympsxe6r5scPIMvujtM6tTCCYT62AXhX
S3RnbP0+vVVh4xMUOvXP9ShX56H4b/JB92l51uc0xpPQVm287dT+5gexuu9j03vg
dIyMaJnomQ2AJvMH3c32u10H5JtdXzl7Z5i9dCS6fFh03QkJjS3krHRXbk7pJqMT
nV95tj3IBOmeDtP7Nb+dJ4Ni9Y9vK8hMpCSFkF8FFJnGcrUv3JF9ejcZ2aIu1pzy
mr1dTJR2VZMrj6kbACexmh7lnrt8ZOO85OYCDt5iy0QcmMI9lIE=
=yaiH
-----END PGP SIGNATURE-----

--ZSSzgJ/NPc9toIdY--

