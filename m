Return-Path: <linux-renesas-soc+bounces-20992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A54B3886F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 19:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C07DE3BD67D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 17:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3A02C3248;
	Wed, 27 Aug 2025 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfreb9Xx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DCA747F;
	Wed, 27 Aug 2025 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315176; cv=none; b=PTDH0D+01QjP4iWzIiRpIYjHOyFD1SPej72d4/Y6e1ydf6SuN/GdcfcHq1U5opVi3nze2pt/2gRGSXPO8HSWg5d1cxFyZtMo+NhswMKELv4bwdiN87Hhe6B8150ccrSiVKwY6oUtSP6UfocV7yx7Pnu91S0bPY797cF93nGw4DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315176; c=relaxed/simple;
	bh=SnQDnTPowLP4QgePLQ2wQthrsx2cCnJ7E8KMwCCto2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsqK6N7nLKFH0mLJAD3ugOJKv8Zkw2pK4uXvs1f/Fygt9cIKSyYmPKIvKy2eRMRS8VGmDm4EYPQoTSFPvrjwTIOuSIuRgwPyhnw0Lerx1CYmiEPwOwggL8WGhs8/fp7cUXNsJpY4USbOI6fA8tZ5xQYU927bYZExQGLLAMi0W1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfreb9Xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC89C4CEEB;
	Wed, 27 Aug 2025 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756315175;
	bh=SnQDnTPowLP4QgePLQ2wQthrsx2cCnJ7E8KMwCCto2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfreb9XxCa05zxBEKtiFQqWyQLg0iCzvAH66ipcX1omTMp3V8Kf3CixppwO3XL95n
	 Eo2pz03vaG4JBYrvps95/mwjLADO8VfcCz8eK+dKUqTwfsRLFGRY/vxe1xnlsah3iJ
	 JvPPprfDFAEExFQqxs8GWZ/VQTJLCSOLQ3Qys6rnWLf8gFhJ87oCZtSi1CGjUFO06P
	 0QzhZ9O5R3iAUHbACaclb//HP7oy28LTiv5bxqb82W/G8SUSgeWP9I4+BHHO1VYog/
	 5I4CjBcjAa2xsYqx7wQ22UzFrGjjPE6czKSFDxN1HrNLyzXZXyb/4KI3Rqkwkj3Lfw
	 XPcN1h06FDvug==
Date: Wed, 27 Aug 2025 18:19:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: renesas: Document R-Car X5H
Message-ID: <20250827-donator-throwaway-57c8df9083ef@spud>
References: <87cy8jx7yd.wl-kuninori.morimoto.gx@renesas.com>
 <20250826-pelican-facing-971a7bac1cf1@spud>
 <87a53lbr9x.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JUUGi8C8uJMTFuOM"
Content-Disposition: inline
In-Reply-To: <87a53lbr9x.wl-kuninori.morimoto.gx@renesas.com>


--JUUGi8C8uJMTFuOM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 11:24:26PM +0000, Kuninori Morimoto wrote:
>=20
> Hi Conor
>=20
> Thank you for your feedback
>=20
> > > I have been mentioned that I will post DT-Doc when I post board
> > > support patch, but I think it will be postponeed.
> > > So I will post SoC part now.
> >=20
> > What's the value in posting it alone, if it requires a board to be
> > actually used?
> (snip)
> > > +      - description: R-Car X5H (R8A78000)
> > > +        items:
> > > +          - const: renesas,r8a78000
>=20
> I have already posted the patch which introduce "renesas,r8a78000".
> Kernel will have DT check error/warning without this patch.

Then I suggest you add a "- {}" entry, to be replaced when the board is
added, to avoid allowing invalid use.

>=20
> Board support patch will be posted if these were accepted (and ready
> to post).
>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

--JUUGi8C8uJMTFuOM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK8+IwAKCRB4tDGHoIJi
0v5bAP9oTyIoDe/s9/KZf4XaAxMopoFLUtX/6UmsU1ElyRLzOQD/ZaRY/S72qZNl
G81hcS4oMdLgJFYKyj6VD6wF1z5IcwQ=
=zptE
-----END PGP SIGNATURE-----

--JUUGi8C8uJMTFuOM--

