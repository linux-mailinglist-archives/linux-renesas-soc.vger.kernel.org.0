Return-Path: <linux-renesas-soc+bounces-15045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7EA75580
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 10:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDE516E57C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 09:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E18B188A3B;
	Sat, 29 Mar 2025 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M+uS+9cX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141518DB1D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Mar 2025 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241073; cv=none; b=lh41/gBbj1cRRkVqNP9bOYhow1SDtkzRJTxNZBtcUXcyq2cD71/+yR7TNUX4QDXuMQjUxkTjzRU9vWlFOz3D0H+2O9CO0+KuYUsk/jKYEk9dppUQtv0NLTCZCsXlrAWG4kTsrUGrb1Nq8rArBYnZmwcinJGWM5/C1PB02mNpycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241073; c=relaxed/simple;
	bh=nGeXT3r6N9vF++cSwiY/IH5bGtSc4BratJeeE0gY3r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqKmO/5sbLrQKO1Tox2nekPxvmwJNaktl5RbnsSiM6U2O05qlGI/Ma00OYWoQtKgGHMdUbK4UUtdw9J+IQWSBbCs6rkP9sshSFqjYdJJ9SybXt8lUAXXeebBqZYOMbfudJqBWM14/JQGGYLnhtTIuKFbNPmLc0MzD2TFuCgTaeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M+uS+9cX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2Pzv
	etjMYtgLQNeaKYT/XK1YqoPTpSVD7s1N2qEdEoU=; b=M+uS+9cXoeoV3GZDSTZk
	i0MLlT8wJFjRNz8mjAzvgC1D1bU1W3paI38my0H5yAumu3+mW5vxbwQgBOLgWsF1
	ksCJk7+PufiS37w4gdtAPE7XNnC0BJnPh2W2btLettNIshwCSlAIpZ60F30IW/eH
	YyekvNdaVN/FD7pLMwEmLLoRV/LzbkABd6o3h2CRYiuzg5z3jX970p3p2yAMu+HQ
	Ci5EOLCfsRUwGe5ci6YUALDW5vacYhq1BDKznwgTYiUNUKjaZ/sKmvb8gZGr+8ov
	8+igfG2E53WOjeLn4JY5ys6SeYfgZdrbKC+XP222ohFbqFKugW7nynp4FxVrgwMk
	Vw==
Received: (qmail 534274 invoked from network); 29 Mar 2025 10:37:47 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Mar 2025 10:37:47 +0100
X-UD-Smtp-Session: l3s3148p1@I32M8Hcx4tMgAwD6PzqDAV8182DI+BaV
Date: Sat, 29 Mar 2025 10:37:46 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 I2C bus
Message-ID: <Z-e_auJxLrg1d69I@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
 <20250328153134.2881-9-wsa+renesas@sang-engineering.com>
 <f15da9fc-781d-440f-ac36-f19f96146433@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="shIkQbXXWKTijd7u"
Content-Disposition: inline
In-Reply-To: <f15da9fc-781d-440f-ac36-f19f96146433@omp.ru>


--shIkQbXXWKTijd7u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> [...]> +	/* Some revisions may have a 24cs64 at address 0x58 */
> > +	eeprom@50 {
>=20
>    So 0x58 or 0x50?

The eeprom is at 0x50, always. The serial ID (the cs-part) is at 0x58.
This is always the case for cs-eeproms, see their existing usage in DT.


--shIkQbXXWKTijd7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfnv2cACgkQFA3kzBSg
KbZ4Pg//Z6wPuBK7TxHBdRc7x1Ugtr/8UCaR3v2sj108GALwEp4S1rVWo4b3or4N
QTMrGuMjqpMyCXAhXaQfOa0liaSdX5vlLtWVqRK4uSoibsvGSdOSybrNM7t1+O08
9Mw7nxSuPNX+LGuXlBblBSRJHZnDOkAbF4XoFX0HHfeHNQkYIAdW1/A/CW/bqZMs
qf6fY8/nxfIKTev5K0eWDVq75ZszrYVTo+M43uCPTWKgoth2ncjV5/gVLu1aVcnB
1ir1sTpYbAKQOgWBtSP1/sEiJ6w+TF50rMRsq9b9p3xUG2gwlxe9Sm8nnz2l1NZv
bNDI7zNrdx1TlMj3D/akddQGLE6BhxeCdYUbz037OzxjP5tl2dTyUk4Y/g+NqSk+
vNTenYETWiUU4H2hF2aRBkaM4btBBs/V9VHZiJ0Vn1CzeWtaBVqRscLa4x/5ECbj
MuuvF2ub09l7L617MSofoTpCFy9NrcfLyei7k00W8g1w1oxsPB8zZMTZ6aHhZi/C
I7ZwT986uAEPFPNCiPavBiIjBaqgncTHUpygOb2hJYG3Y/auDXaVcbxP1wQppa5Q
PCYZXgd5aps9fx2b+rWGrdldRShRm4j+vZR6CY2STLodRQtyxgikQJMEjlc/2DL8
td3cSGGitL2KfnavYNqr4EzlkmYHq8avPPtiGgM5krxlEJe+6bA=
=oMYy
-----END PGP SIGNATURE-----

--shIkQbXXWKTijd7u--

