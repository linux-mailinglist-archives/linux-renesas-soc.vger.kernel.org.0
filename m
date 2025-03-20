Return-Path: <linux-renesas-soc+bounces-14698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8501A6AA4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 16:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BDC298254A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8731EB5D8;
	Thu, 20 Mar 2025 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gr4YoEnw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D71E5201
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742485841; cv=none; b=LJq+43XMIeee2JTx+FiYWKUj9vsSKEe8pNHA1XFwyxU23lJG9RDHW+qGAQaVR4nnxbpAQLIeoiVwrIDbMrliBCtJSFd2vA8/e4mfHcuNViILqDLfMlVcXmTWa9rtnLSqkkElFHqE152EDBY1tl4jf8tPJzr4N8rB8ruTmpUz2rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742485841; c=relaxed/simple;
	bh=UyBdXNFgm67KU+j1EDo5XsOZ0SNYD8as+5pMPGwvsws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gch2yihQSPo5xpRX0g0Md9IHBJ8RyDAbEwDuhv43dxAONpo4sFEyiX0Y8iLrGwbfsHlXmJ/+T9q8w+rN6wag1FqokEnrgMd8GKCssrnVvSleIZggs3nICaHX0UsMHROuJywl+IO7/z5uqiRDvS2h6ZNWfljE+JvI0xcIV1NNRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gr4YoEnw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UyBd
	XNFgm67KU+j1EDo5XsOZ0SNYD8as+5pMPGwvsws=; b=Gr4YoEnwL2NBjGN79FNI
	KRdPMDIaDCChdpDCj6diCg+HVhB8UPjLLRFNwmjVQla2f7qlZ3w3Zy+uemqhuwPt
	jxL9hnqtPvwtvQYbOfmLxlRpRJW6CxUtVgqS+zqoz2VR5h7FBASPSCPckrYm8jSs
	l1+Hwon/TAGLyHEAxSfDeDHBnEB35FP8JiqInroF7kT4ikO9wwmJ2IXFDOKLJy+x
	1XBECDDH9sUS9+1Z3EuORpqCJoHAFheN4OKqkNBb76Nwbcai183oihwaMj8d9aJt
	AUVFO9vdNYOgigN4zRQs+CVB7V8pmFitlgRUGdrQbEvd4N7aOSxT4SBqT17laZTt
	YA==
Received: (qmail 747425 invoked from network); 20 Mar 2025 16:50:34 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2025 16:50:34 +0100
X-UD-Smtp-Session: l3s3148p1@PcAoGcgwQJgujnsn
Date: Thu, 20 Mar 2025 16:50:33 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] mmc: core: Add support for graceful host removal for
 eMMC/SD
Message-ID: <Z9w5SZmytn5g9SA9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j0szOiKot0rmBNkW"
Content-Disposition: inline
In-Reply-To: <20250320140040.162416-1-ulf.hansson@linaro.org>


--j0szOiKot0rmBNkW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 03:00:31PM +0100, Ulf Hansson wrote:
> As pointed out by Wolfram Sang and already discussed at LKML [1] - an mmc=
 host
> driver may allow to unbind from its corresponding host device. If there i=
s and
> eMMC/SD card attached to the host, the mmc core will just try to cut the =
power
> for it, without trying to make a graceful power-off, thus potentially we =
could
> damage the card.
>=20
> This series intends to fix this problem for eMMC/SD cards.
>=20
> Please help to test and review!

Awesome! Thank you. Will surely check it out. Not before next week I am
afraid. But already looking forward to testing it!


--j0szOiKot0rmBNkW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfcOUUACgkQFA3kzBSg
KbbFrg//TOs03sVI6OVfUHIF+m2I8NGYBR6Jr8ZvnegntJ1DO+1MiQSg5OmHs/A8
mG94c+JO3yR6vC1vLs3/65xaFt2q0Yqn71krhcQgCI8G9DhVX5tBjm/OLtP/+9tt
5cIeT+nixYNvs10Q00ZSeVIOHeXAAJnw4CgY768Jr7FGqw+4M6fPWzk/QSIo+iLD
oCYfKlnj1cpyIZQoaN0Pb+ST3VWyib2WN7CL0iRqBJFEWK6NhFjunj2Pr2nwpkTQ
X9Lai/qkhT2rL6iWcZvY6AxY3cnenZ+rlD5VZcJRqAp0V7HGXj8CMxyc2GHL0xbc
ZRrEvlgE40X2FwWitlvQ2aIwxaOhBzrqullLyV+HJP306u24jNCfZUSaqLTfey04
CBPHr5VMfsWwmoGdrROwVwe10oZfg2TNFtDJSa+hV645yvrSXsRHu9XHldaCg9lZ
+1cwlQ0RT8Nfa+YmKoL+X32Am3Oe+ZciOwj+j+a2GeGUtSUBYlM4M3pEnNnyS3jy
AhskO6ONr3Q8gfhvQhl08P4fOKgYkWYpaysu9siVDaEqpXi33nXnFD446sdhGab+
G64ifA9U+UpxDivCNJ2FDCBV3XIzHo3CE6nM3zclSCu7ZFJczhcveLxtcERgJxol
tFAo2YpHjSKJVObDJNgTlOPE3+XLTB1+mE7OjYO6dPtwWIkGuYA=
=Oz+a
-----END PGP SIGNATURE-----

--j0szOiKot0rmBNkW--

