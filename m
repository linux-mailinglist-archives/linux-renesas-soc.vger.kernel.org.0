Return-Path: <linux-renesas-soc+bounces-9459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0548991013
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 22:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4D51F2714E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 20:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053A71E105B;
	Fri,  4 Oct 2024 19:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OS57+qhR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE91DACBC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728071624; cv=none; b=mQrMehNAPLwT9QjmCm725JPKGtBHRclDrrNp5DBoqUeyGiKF3tp1ywvqGEUMZ0slxLxTkFKkr3laScCY9fJTMo43dQ002RQ238bSINQOAOwTA33UF6HYFWSQK3HARcvNnewW3+tqe/C2dQDcr1N1ZPSWsBuQH98I4MdVAN33U8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728071624; c=relaxed/simple;
	bh=KIC2dofQhziIWGhUi24kAhRTa8oghqw4lHWFc9cTmIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab6ZZN0lHLkPt6XDsVbZaIznxj2tjFISgYd8MBvPTenE0VAEjh4xCw8pn6s+/Lk60upf2U89UCHpuxJnK4PZsJF5IyzmQVveX+8B3WmtFc8WXOrtVYGr4ZvDmlVBWp0Vds3xo8CtoENl1EHiJ0lWOkRhRMpTbziH+c1omADJuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OS57+qhR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fVQT
	pYTmYVBZzzpC3FXxbAYiPf9hvBwLyazbysaopKk=; b=OS57+qhRRNBJ82jI1K4/
	ETMb3qiP+2bDnATA2NoqwFtljQJf6VE2lb8EoV3Xf8wKiH50twIQOp/Vi3C46FAE
	kZj+tzIL5Fvk3vfNEk47umDZM5UyrBg7bLjl5ZRaNXGdMS2ledaDs4+oii8ftL2E
	DzfyXnShdAu8PxaZJWS9jAaia6N6sQksGEGy9mFlCS210qsR0mJ0feYrOU1jjRu7
	5kNyLZQQVT7Rt0jMwv64lHw+8RsFJgXuJjqfDj55WqNtL4v9LsjJ5Sr9/Ro6Z2nb
	DmmV1xXAzuwaTQmodLa6DtKR9Uoalt+sCY0Q1jiD8k7m+F6NeBhFJNKmAl98U39r
	sg==
Received: (qmail 3544699 invoked from network); 4 Oct 2024 21:53:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 21:53:40 +0200
X-UD-Smtp-Session: l3s3148p1@zpj2Bqwjbs9QvCeD
Date: Fri, 4 Oct 2024 21:53:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: renesas: genmai: enable MMCIF
Message-ID: <ZwBHvaWKKfzgYoMc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com>
 <20240928092953.2982-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdXV9Sbk-rjR3FfwWOsWyaHv3XCh3+XooYZB0Z5tbXY0_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OiwGXDQY9vx91EXV"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXV9Sbk-rjR3FfwWOsWyaHv3XCh3+XooYZB0Z5tbXY0_A@mail.gmail.com>


--OiwGXDQY9vx91EXV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +               regulator-name =3D "CVcc2";
>=20
> Odd case. "Cvcc2"?

Fine with me.

> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
>=20
> The regulator is not always-on, but controlled through the MMC
> CD signal.

Hmm, okay, but how do I model this in the DT? Can I say that a GPIO is
input-only? I can't find this in the bindings doc.


--OiwGXDQY9vx91EXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcAR70ACgkQFA3kzBSg
Kbbkew/6Aj56imqY3xSRlx+cMVmdeFrVhsXY/aBO6OTYVTRfOuFdLJangQmm91uV
GI7d386rNOWPvxFA3qjFzlhmJriVXfT6/hpl4FMqErRMFhMWUcRlLQdwW2+dTVHc
sRVmEB5vZ1lhAo7Ow3UTCBAeZCsJ/ToStPMUa3x1RDGnGtPtM2V2MuXqAub0f/Yq
V5+t0kQi+UkDuuqSgGYirYgKUT9PN70jyI4iK8jqSfWMnHzbzEjeGHy+26YINA4x
4bBDq+7Xm9B44YfIEGPT5Oadm0OgGpgj2spxY123KxuBBXlQzqDkQdWpadpKNknW
wEIozr7NPr29ZUs2ZzK94CHQ94jAU4ZnzjlHYJsOwKxoCRaOmimWcsX7cJykUSfK
/5x1m4FoPgr0fPFcIFX1Nfj5q+5bj0l231eN1u9hL0gRxTE0q0Xf4Ii9EJo0YyGG
jT08gSK9cAQpbGy0up103qWtz1FwCIbJITt93azT8NI4BWhH1Fy5Vj8ABxoynalW
kWQuZuYuuaB5giF2gER7BK29LIX1FycpQEF2EqQuSxUTMhrgn8nAWMA9r0lDO/FB
JgQ53NGhpavcR1cWdvIT5Gj0bivyw+l4+GrvlERAYeMoZp6UwPWEd2u88n4JkUt9
Xui4Tjt8EK8NuFwCIh5JCpXi8/3G2ZUOorryIYawSA00zSFbIBw=
=wheO
-----END PGP SIGNATURE-----

--OiwGXDQY9vx91EXV--

