Return-Path: <linux-renesas-soc+bounces-14745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A4A6D7C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 10:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DAFA166E38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 09:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A0025DAFF;
	Mon, 24 Mar 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T5FRuUVE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A9D25D538
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742809408; cv=none; b=m9Hr5ideRJslEDXl7+TbdWpIAe1gb/ikvP8Dwxrh2UVNqTpXOLqM+tAzgzy5SiMSIXJifuc2WxtIAQkn1cCL78ja4lyjmTsWVUtjSeoCO/+YZ2BM4HVf0h7/t4Xl+KXDj2lYs682YaBNFreNP5DQPrlM5NKFtlAocgvouybsREM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742809408; c=relaxed/simple;
	bh=pak5k7IWyYhyihUG+ysdV/ZoBiBbpwMnIeB5wwqQFWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrROwXATIqk+el9EwtQTFqxY/RZ5FkZF7H5N2uUWBJO9oEolf/+r8owRJ7FI+2swpQcZYy2TR40g830q0/gpxxAe9zl70bs3AFrJoCSSqX+tVxlLB5wcQRYaZpDpPUlCN7ku/O6MeoyZSvy8vRu7UcQZPHsuhIV2W7F4AQEQ/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T5FRuUVE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=r7d8
	Ot8mfH1I2wFZHCJQK70oiDoS2l0a40rEehkWGPg=; b=T5FRuUVE207AkDGjX4Mo
	dGjHJ4m9FMONUA30tCsJMe2X9YbEA73rT/Ytsy487aKvDSqOPq2I3AluGojfQoOQ
	mvm3Q/OkcfnWicVI00buv7xouFHacV827g7+8lwj3shw0FOozrr8JTFM1by5/TrQ
	tdDtvLb7SxrW85MU4nMcv1IWr+nvmdb2wjQal6wuEjl0GaL7ClBY5JHkOG7nK62e
	tnmkZS2Z+HWj56SUmfBc9V3Mx7azu/adPBQJ32m+2IjSfpdpiJrFgmRx7FPhSIrc
	aqJDiLU3lNxXaD8+9RDQrXszJk+COH7+gHmU9RLo/KH+iSsOTIT642hzkk7/B4fT
	Iw==
Received: (qmail 2486540 invoked from network); 24 Mar 2025 10:43:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 10:43:24 +0100
X-UD-Smtp-Session: l3s3148p1@2S12bxMx4TNtKPH/
Date: Mon, 24 Mar 2025 10:43:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <Z-EpPL3tn54E8KG5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wQ0cBGF5R+xQ7By2"
Content-Disposition: inline
In-Reply-To: <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>


--wQ0cBGF5R+xQ7By2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +config SERIAL_RZ_SCI

I think this name is too generic. Most RZ-variants so far do not have
this SoC. Would 'RZT2H' work or is it too narrow then?

> +	SCIx_RZT2H_SCI_REGTYPE,

This name is better.

>  struct plat_sci_port {
> -	unsigned int	type;			/* SCI / SCIF / IRDA / HSCIF */
> +	unsigned int	type;			/* SCI / SCIF / IRDA / HSCIF / RZSCI */

"RZT2" in the comment as well.

> +/* SH-SCI */
> +#define PORT_RZSCI	124
> +
>  /* Generic type identifier for ports which type is not important to userspace. */
>  #define PORT_GENERIC	(-1)

Does userspace need to know this port? Can't we use PORT_GENERIC?


--wQ0cBGF5R+xQ7By2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfhKTwACgkQFA3kzBSg
KbaGEBAAko5Zdq31eqGFNBy32OeJQ6zpiUA2K5ueKkvKDsZdQFJRwzx5e23rDPlS
8JSNVPmJkqIn23c+Fs3CySTiE0NmdLWU+0x4BSocF2wdGEN0sHSRWV3Hyvf4mwYS
m5dwGXYf7M1aBBU72eq1MRnOlo/GfvhJS4YY6QR6waJCCtdK76MvbSu98NSMwv8K
53WmYX/Vj5R2MduC8Exl2soxg4Q0BQkwEj64LVwr/K80R+w/koiPOug1XMoMCMLl
zNhHaIhtcerURNvElIB6oi+ZEwPC20ErptdvqgIzLNuQgL72yTmsfnov3ikI6ybg
B2udVb73mXJc0SE3jxtshYLIcVeRBjS7n8goisDVKhKsWu9FwuWFUGgmrnOXzVfD
zT+3vCN3Ab/o6N+hri2j1m69s9aorWa8EF4x42YVmLiGx0kgbeASqCx70Iz4zIXG
yQ9viwyDIu9lOsmgMm8HHZ4X3EQHt5Tjx0seEFt9jGCUPZMGy4cJIfIhA14DHA7K
yf5U/bwNDXRtxiGFt8drMe4QDS+hlVqMCCvJfG7Bvrx07h+mnrs9eHXLLcoRBMj1
3cTy/In64cd+VyKsre4QDEzz9pr/J5HyUVq2y1RMIDt2QK+dJSronIYNnzln8TWR
pGtKERYgScgbKx9Ya5qxeKsw0bTD5+6H4BMBFCXkeOaVCBEURuQ=
=Wo2h
-----END PGP SIGNATURE-----

--wQ0cBGF5R+xQ7By2--

