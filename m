Return-Path: <linux-renesas-soc+bounces-22523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67638BB06B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 15:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 266FD16497E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 13:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24AD2EC0B9;
	Wed,  1 Oct 2025 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZNa/dBb2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941121CA14
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759324127; cv=none; b=YYyqge4ZUeh4Zuewha1DhpV96uLt8h5N1/X45sjDVtD5cuWzoltdSAFEDOXOpcmrKX9mq3WMmwDbZv1x5Opo27l3z7D8gnT1ywH5Ebp5EUaxmLPrzHu3OsXSRjuMaheXy0ai5ENFmFoVhpiJG1b/3DqL8+Vh9jO+ygKCAJLXStw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759324127; c=relaxed/simple;
	bh=vuErY81N8RCjg68ZgNjqjNizeimiLIL3kdOvQ1WjKYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL8P8pI9GnagHxa3fBKzWcEjdknFCmOsQo2JamlRmBtFd8xpS/9hdVjG/ECKmBeziXSkqw3svOdSb9JUGuoEQy+xaZzVyBvJX3Qv4C7N5BBvTHFmEUNFEiA8o8NnlRVDWRojEskigvShiOG2WAp4kyUKy/yPJ25/uPaS4FQeW/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZNa/dBb2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QFzB
	c/rHZuKTiy9FeKX4MCWYRTLrzzBrRXwC6xrdW+c=; b=ZNa/dBb2a2sY/9tfA2xt
	7IffqBc0n/H0dMC9hf6xPdNJTcxYRDew8sWh5+rHBpXEjRPf9DgaHg5sWGixp7DY
	AEb5XRfh3ohJzP4qjbccaJtXwfmGJfYyY47FLr09/D+7r7x1/amVLo3ejU1Jxi1K
	sd+Qe2xPLLGm43KLIWgXRg4cON1VsXWb7eE0M+XuDnJIrODTkjXHyv/KYmEicv1v
	7MuUgtPpzXyeJUoUBV5G78gA+wX5ru174dj3gFYgSIvON134aVYkocE2FXgF9Eqj
	iMA7ah/x5aFznCYsrZfiqCwQqEQ7YQCWpJayN5XRm9WdiXa/7e0h0TZKZLiYYZZl
	xw==
Received: (qmail 4052002 invoked from network); 1 Oct 2025 15:08:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2025 15:08:41 +0200
X-UD-Smtp-Session: l3s3148p1@6IJEkRhAMLa57tsh
Date: Wed, 1 Oct 2025 15:08:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: dlg,da9063: allow
 'interrupts-extended' property
Message-ID: <aN0n2H4C79s0KseU@shikoro>
References: <20250929072306.5634-2-wsa+renesas@sang-engineering.com>
 <20251001125149.GA1122744-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bZdqIAY7RV885kkI"
Content-Disposition: inline
In-Reply-To: <20251001125149.GA1122744-robh@kernel.org>


--bZdqIAY7RV885kkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +      # oneOf is required, because dtschema's fixups.py doesn't handle=
 this
> > +      # nesting here. Its special treatment to allow either interrupt =
property
> > +      # when only one is specified in the binding works at the top lev=
el only.
>=20
> The solution is to fix dtschema. I'll take a look at it.

Thank you!


--bZdqIAY7RV885kkI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjdJ9MACgkQFA3kzBSg
Kba7zRAAiX+RphF4dCuhZWa7nQAloOwqUc2A1mkl1kyQGe5K+95ysCzAP3YQIVwg
SoXzHbJl4PLFzu2fPhcVztZKsxTamybK3K1rbGFlv4GgbQwBa8b/5/9lHfmlazKA
y54GamUnWNvhkjPVAKzx2in9mMODVaEyD9eV/YYUUW+IRqTXEpAq1eZIyVs9ZUBm
RsS11HOSpTTDA6zlXTV8wkpiiDGvXx34j8h4aOXatPB+Qd22ATCIKCKP54URaUrz
uytwxJ3Xlnf8CXSd/O25YRtduPWOI98Qy0Cmb4nqeatErJTRGDd3zM+y6ZYB61Y/
0VWAb4H4eUVWpBuWMCLGfYPCqXfH+xvzxxsefKP1SnyMy8hlIa+PXozdJZ8AtT9y
Jgxgv5ipJFolTQMNJiRQHLRVIYVs5D5YKZD5+o9p0W9gfjcgf/kpqApC1EH3/Kzr
3AJmMIV3W36wxCGd2orSkiu3bg1w5YSl8RVUVxs8C55/707dGVuWIErR4rDopTOG
t0vE+dtK7HszdW2e8Ve57jcCR5pY2wKGo+CqdTGxzHcgA1Y96fgzP/JGKa1WWaBA
rO4vmTsyQFpfUEkmIjPIoiYe582c0H5zZNcJIiCsXLQLqEcFwLt4SmB0mc4Hagwv
qHO1MlG7LCmbOQlmiPr6OH1Efc1CWce65Dj+yUsdIDFCwqgiCLQ=
=gZFL
-----END PGP SIGNATURE-----

--bZdqIAY7RV885kkI--

