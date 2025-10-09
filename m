Return-Path: <linux-renesas-soc+bounces-22846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A86BBCA69F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 19:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3750C189C5D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 17:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECB11E5B78;
	Thu,  9 Oct 2025 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vc4RrOUg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F1227BB5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760031949; cv=none; b=UQr60ELzLKEOoMPUiBoiUhgAtrDaVCKN7Yg2aSY7yVE000MJ60VVDXOuhxmLEQazCUjjBv9CG5vHKXNmwOekcAn4VtQhijaRo0U6RwUFDt+ZLakacn0uLu2wlBNUSyNIbkgcUN2hVcNyf1SK6BixivsoRMlpZIkO//O+6UmLiWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760031949; c=relaxed/simple;
	bh=+TO/qEw+wbzOHIyaQhjRZqkHI9gTGRPdNQHZavWkTYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3dDHFyxM4S7tJFek3/5do0GzID7ZcFBv+NmtjQ8YgP/Cdonym2j7CEbxonaZxpI3BY7/WuBnv4LHRst9AWAlMy5x1DlaTc4lQi9O8R5LRz1auUx/Ot+lbzOymoh2lF49ySEhIOrBNHyPuDFmei4Fg6AbKNOhj+ss3HFwrV2LMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vc4RrOUg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+TO/
	qEw+wbzOHIyaQhjRZqkHI9gTGRPdNQHZavWkTYU=; b=Vc4RrOUgP15A0L2fk26h
	tHA2fi/iauZjG1zxMYoAH5JJPYLPcy43IbdaW+DzCQXf1IsiRz75Q1l1EnjLPTdq
	y0eDl9HZDceuzGXD4x9wJ2/Lwb4P+5oEiO1dILY22Uw95ZjKP41MerwPaIuQ2Bly
	Lsw5nrmtJhFqveqsEGAg+JziRytMEXMlFofL40Rf8hHVEsIlBXiZraV7dTVF0Ax8
	CVRGX7tmkzikJThmMYN+G6djH3IhNe0kG6YymVxhJgkJoq3dVGjo5YmYsTFKPiwV
	q7K+SkcqdEeEOr3XhvQz+G3i765VB4KkPOSRDRbRmoCusiCS/mdTf7rmtDszOf96
	nQ==
Received: (qmail 1171731 invoked from network); 9 Oct 2025 19:45:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 19:45:38 +0200
X-UD-Smtp-Session: l3s3148p1@wG51Xr1AzLYujnv2
Date: Thu, 9 Oct 2025 19:45:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: eagle-function-expansion: add eMMC
 support
Message-ID: <aOf0wSc5rgve30af@shikoro>
References: <20250923161709.3110-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdU+0iL0fjMM+_vPxsOmPXW72X0_=X2A=ZA9gRf367UB1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ZGkI5n2BmN2GlcV"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU+0iL0fjMM+_vPxsOmPXW72X0_=X2A=ZA9gRf367UB1Q@mail.gmail.com>


--/ZGkI5n2BmN2GlcV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 05:18:23PM +0200, Geert Uytterhoeven wrote:
> On Tue, 23 Sept 2025 at 18:17, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Add pinmuxing and configuration of the MMC-capable SDHI instance to make
> > use of the eMMC.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.19.

Thanks. However, I just saw that the node name in pinctrl is bogus,
sorry :( mmc_3_3v is plain wrong, mmc_1_8v would be better, but
actually, I think it should be just mmc0. Voltage switch is not
supported on that board.


--/ZGkI5n2BmN2GlcV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjn9L0ACgkQFA3kzBSg
KbbhoBAAp0Mjnw0frQvMVob0er5xLbmKwJBHj5nDHl9Lshq2JfscGINjMadeSqnM
PJWN5xqsZyFZ/Zzx4Gi9SbWFdqPudXdGdNwuDbsYz65pUq23Gvf7sKH8+JMYgouV
43Od0J/Q1rOj5SfRO/+yebj3RH3f8Dp03sZJkmD9DaOImdlN5PVlfPPlZg2u7n57
qVtsG8G+i5JnNu9aKajS4jWZhDWKH0/2kisZ36FZUogGSF67Skb6XoM94xFrXZTV
Fgoq9TX8Qw6ksRhZ4MLXxBAMzk/weew0QYcX9LczplwX3ioPiQoGH01mJ8JZmbVY
FEiBRTK6h0yGHHbZTjPHz5HwaPOz/4ihawYqUu1okTJoDr9Vt+gbp7T6g8hrEbKP
pBne+0a73Ol/SmBSbXkYx1OvkVNy4eLcWlG9ELE3lzMnEcbz0Bc0UfVSdgVPmBpo
DlIyNlrfrB/4iGXQ7Qr3NWHqljdsqkuTUvY9mP04SQeUxCmfh0l5rW1XsoMvMJCW
HYGnMxwYudkKJwKvEuh37AbL0lOVkGC1PUYcJNGDAFI+qeSRXnwWLYVUwX/GcoHX
OPt021KdeCKT6s95UVoFjNEuR/a/G4Glm1+PpdYQ8SzZYgxUWvFAuZig93FDPbmI
YTO8nsfQ5+Ycg/HzA/iIAzEq4WP2VTvUgab0mbjeIAE/IoM1V1Q=
=ASVG
-----END PGP SIGNATURE-----

--/ZGkI5n2BmN2GlcV--

