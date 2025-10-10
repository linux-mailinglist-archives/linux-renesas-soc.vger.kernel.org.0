Return-Path: <linux-renesas-soc+bounces-22871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769CBCC004
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D6451A63C6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 07:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4C42765C1;
	Fri, 10 Oct 2025 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BNx5hSi3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037FB27586C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083115; cv=none; b=ovgegBopg9GKzc367+7W3BKC7nGAI5TGijL7iC4KTm7MjVquICf7mbzqGZwysoN88MRpU/Nlpmz/+4hQ/IrGyPIjmprTPEh8yW0dKQ4NJAYgNOtkJd2AHf929ozi+CszsrXbBDYwyy7w3hQY+Cx60y9XUmoon/CI5sgkBrlgpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083115; c=relaxed/simple;
	bh=D+uj4nmQqNwsFrTENmSxwrLIBKZpLAUm1rk2tYwTb78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ga8G/1wWkfDOAZ7nYVSQCzkmApcDaBRTlKja3G/qmDivtCpOVipfDKuIweMu+kubZUK/XnwYTe6Y9vCo1hBBI0rsu/RLKHUKFNNYne3cZ1kzuVgKWFrERLtp/90/iy34pG62mYgAVsTWuRNQ+BOSscZ1ouajW/C/b3TCnwZPw5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BNx5hSi3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mJ0+
	68OE5zy6P1W6jhqEWVox88d/fLjg0YQjL/yTxyE=; b=BNx5hSi3IPKjiXPajwyS
	HtQeJZ5Gw8xmgeVz74hYThcHCrkyDsOD8lasC+KTBWDjxT8LsnG/czeqi0CMnAAY
	viG4E7dWgVRzOCW2gmbj6+wn68Gh79AV2sOnNC+b41MnxKEuLvdJcpkSm403xov2
	wjRcZMFOu76P891QL/P1/wgPV9DtOaSoaPWmi66VOJyXe/279naAD4kVWxn5DHP6
	2TXZDRftuZijvsnRwHWCjFcvailJ8ftaau+FBu3rti0IvKP/keAyazBchRRJIdO1
	tMewhkPEo+d3KTIx/wFtTPy5HU+121V1VHBZl9TECIFn58fwMELSb3QwowVovtrk
	wg==
Received: (qmail 1380566 invoked from network); 10 Oct 2025 09:58:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2025 09:58:29 +0200
X-UD-Smtp-Session: l3s3148p1@FsqASMlAVMUgAwDPXwQHAL/S9V79e5yL
Date: Fri, 10 Oct 2025 09:58:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
Message-ID: <aOi8pQuHfduf6-FX@shikoro>
References: <20251009181916.2431-2-wsa+renesas@sang-engineering.com>
 <08b7a21a-72f7-47e4-9dc9-37a7316f94d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oF47ZDGtWqrcrNR3"
Content-Disposition: inline
In-Reply-To: <08b7a21a-72f7-47e4-9dc9-37a7316f94d5@kernel.org>


--oF47ZDGtWqrcrNR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

thanks for the review!

On Fri, Oct 10, 2025 at 04:37:14AM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2025 20:12, Wolfram Sang wrote:
> > This PMIC is referenced in upstream DTs for the Renesas Lager and
> > Koelsch boards. Sadly, we don't have documentation for more complete
> > bindings, but due to the spi-cpol/cpha it also doesn't belong to trivial
>=20
> That's not a problem.

It is not? I found this mail[1] saying that enabling spi-cpol et al.
will disable sanity checks for other trivial devices.

Adding this PMIC to trivial devices would be my fav solution, actually.

[1] https://www.spinics.net/lists//devicetree/msg731369.html

> > Change since RFC [1]:
>=20
> Please start using b4. This is v2. Your wrong numbering makes any
> comparisons broken. Try yourself with b4.

I checked the link [1] I gave last mail and the mail said "[RFC PATCH]".
Looks correct to me, am I overlooking something? I am open to switching
to b4, but I need a time slot for that.

> > * dropped "unevaluatedProperties" because we know this binding is not
> >   complete currently
>=20
> You cannot. Bindings must be complete (or complete "enough"), otherwise
> I see no point in accepting them.

I can see that.

> It is like you sent driver code which does not build because you did not
> write half of it. Why would we want it?

I would agree if it does not build. But it does build. So, the proper
comparison for me is a limited driver which probes and gives access to
the device. Features can be implemented incrementally. This bindings
works/builds with the few information we have. It even removes a
warning.

My reasoning is that DT describes HW. And on the Renesas Lager board,
this PMIC *is* connected to the SPI controller. I am open to removing
this node because we don't have a driver. That would mean, though,
otherwise rare to find information is lost.

All the best,

   Wolfram


--oF47ZDGtWqrcrNR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjovKEACgkQFA3kzBSg
KbbRlxAArWjj+dNuvn88EjbaCPpiQlZGU0pTEd7sj9rfTm/K97L22HRqGDofFjwl
0pvW2VSHYHuy2n9OHGrZDzTaAtl0L31dVjOG+p/4EAy47NZvIGRJ3XOnLFDWvTUc
HgotnzhUovwCHvY5fcMlqJemNjTl8lqJialAeY8rEYf1quhG1fej0vSsciA3ULkG
NfZqaeVDmmBO3S9dXbSVPoii0RwYq8tAMzU8TC/WsdLU67qBYFs+dDZ9uQRGoXhT
UO5o2aq+/S+kqsT0821r0C/Q9FOKMPxOh+jE4lDChzJE7Yv/0tIBY18Y80umXB2a
k3vM1wID6POtvBXwsCYQA73zxosLyjewXFxjRhNXl7UjUhroC8kTm1E0gKVEfO/J
jHmrTWgCsI36vT29UdYlStTNTrjCya2wu7IpkAoFZxJ7EYtwfcCtkAwGttpBtMwa
YDEhviYzois9bMlPW3gEaTWKC8Tj2wngJHuDeMSnf+SGvfcKx83Fs8TOzyq0yp2c
iMkwduy9nBzNRB06sVIGUhPW2uRGkhHO8xSpgjvhb4L/6mmImrN9DXRSX0k/ZB1b
9kCes7rRFZ0prrL4lUjQ7hWbSF3e+TqmTsteH7SQq9RNRIwRrBOjSI+Vh4tlw+sO
cfrQmhYLx1NxV2Onrz9STrX53vWHP4NFTFuwqXDdAM8uL8xJkCY=
=W9An
-----END PGP SIGNATURE-----

--oF47ZDGtWqrcrNR3--

