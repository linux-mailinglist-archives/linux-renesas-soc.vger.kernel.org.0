Return-Path: <linux-renesas-soc+bounces-21715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71CB517AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 15:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCAA0189C53E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A17F31A54B;
	Wed, 10 Sep 2025 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BW1BRJ7q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EEB31A058
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509866; cv=none; b=JlCrchCfW3u79gPrQVbQ/L67cAY+IAUVwHAJiUlOHWYoPJfpxxH3aOkQHmaVG1z/dq1pVflyFPHrES64Rc3GmBH+I0Tf8pzxC15aYL64QppCOl3cDACmV14jOWlaE0hPB4d7tKHZxXU3/BJSkVtkyRlWzKkNh4hBZKiKIISlwOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509866; c=relaxed/simple;
	bh=Q9akw1uaVlPRKHpVGGkvheKyZgq2E26lqjF5le7RLYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=priJv8ze3AnyyTKMaUwQ7bu5pnV1KWgFwGMQrv01mipvwaN5HRzrE7o8fnZAr6wR2oRcyQJ9qtW9RoHrKcr2G5jOx6d3p/AWcZCdRu1HiYfLNc/iEipit52HRxglpDwXRZx124F/8ArRAwanzw+xWNauMreDeYVcvxe7YeJ6AEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BW1BRJ7q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=F1fi
	7UnICHAY/E3hilgjsW23chGdCXUxLSRJsAc0DXw=; b=BW1BRJ7qr6/HZeLtHBM3
	ehTtdlSJiSqzzq9vMpVAcmU8XEzwKhY1uPXGHuJcCVvnbnH8BrP5FVvvnQFq/luw
	2I9fQbcQBetZkl8llNA+KpgCeXxG1+scFLoa/FGKkkpzDd7/xgcWEWdDD3I57OST
	lo89jFjfi+NWUpEq+FdNt3JsegDp+Rsa8ERwPSE165vXGBtfebwuRY39oYTO5YB7
	bDcSamkIXX2bGrqn/RIvqjcTQRlCgPgy3dRNb5xoREgIeuK/vggiofbWBmii88eE
	Zf8Ok+IfVD7QwX5KbIQMMqqA3+Nr6Re8oBwW9AXxf1kY5/vWjuwwc07xIqStPbDg
	Kg==
Received: (qmail 612963 invoked from network); 10 Sep 2025 15:10:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2025 15:10:55 +0200
X-UD-Smtp-Session: l3s3148p1@1+CaJnI+3QltKPOV
Date: Wed, 10 Sep 2025 15:10:54 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
Message-ID: <aMF43hiNrlosrFUQ@shikoro>
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com>
 <aLGAaKYucaW1vPCg@shikoro>
 <CAMuHMdX9HjP09R2p-PS4KgHKB6UcAQB+zKqN6QYwsboxtJCkPg@mail.gmail.com>
 <aLGN7ohswQ5FYdk1@shikoro>
 <TYCPR01MB11332990CA8D7FA5FD964C0AD860CA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TinP/ewp2ndQzzTJ"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11332990CA8D7FA5FD964C0AD860CA@TYCPR01MB11332.jpnprd01.prod.outlook.com>


--TinP/ewp2ndQzzTJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I guess we need to add support for 64-bit polling for r8a77970(R-Car V3M)=
 and RZ/A2
> and 32-bit polling for RZ/A1.

=46rom a glimpse, A1 is the only one already using 32 bit ports? I'd think
we can enable that for R-Car Gen2, too. Probably Gen1 as well, but I
have no SDHI docs for that one.

Happy hacking,

   Wolfram


--TinP/ewp2ndQzzTJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjBeN4ACgkQFA3kzBSg
KbbRVw//aQG4WhKC2ITVLDXkWJVva5iUirvZd0RVWRjX5G0IcteBNrYgetns/fiZ
2VRvRTeds8kfC8BhshDQwbgEf+LBWEnivRSypVJ7mjfGvpg2hL3Tt25lGld2Fe8A
e0QoPo5ZkVgNBT9S1kELxDBe82wHVeuvuNJ5piongAZNjd7mpc7D93KU1XFgXM7y
n8Mvse45V6D2kg5kb6cqJrTBM0a8Gt9OYhYhFoDATZ3aXJVtWwRxkZKOSwH9N1DW
WLyRVK+roZNKiTPe3gLDm2lkjwgH72Cp1+QFuuPSBwFGlqLjS6OkOWhETZrPOc7D
ytLWTQpOD76x0BJPLFySPa9uQMXhZLyDcamdJ15t+R4QNBbfbAu1S2xmawIMP6xi
eCaeWjSJflyhnGCpMlxoovab1LSepLFWOM8/WMePLkuA/VngNLRVbDUUA9r8oit4
98qN7HlcJqQs4SKaQL5zmYtPIL1Bz6uo4ugqdrs/RVpRaJgd1/ARDEnAJYX5ioA6
EMujDHd6e07rajZUV7878V7FaRBgK4+KO3nIvI7+ByyvDn3O8b69xO7tbOvaRKaP
oUmjPXUq9Sdz8+K2osyZYqvJMhzg9s1nLs17Y93V4wT8AQeY5fubiIJHciR1dwH/
LdXSy61RSiaYebnKbR1pplGkz41U3XB5kgPvKp+9ldELE3MaSQk=
=Psy8
-----END PGP SIGNATURE-----

--TinP/ewp2ndQzzTJ--

