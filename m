Return-Path: <linux-renesas-soc+bounces-14559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593CA66E0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EE917A41ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 08:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437F11F09A6;
	Tue, 18 Mar 2025 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="iDM9JV2+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919BC146D6A;
	Tue, 18 Mar 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742286094; cv=none; b=ill9k5dpO4LnZwsgF6sXhKbtcek9oplENfktEJLLlB00UAMTh+b0j8YfNtTmDTGK5uB6uk8A3uEj4TNOlZHh14Qt/9tHzKIpjUIsH9OtlJ49aRyrL+CKfsO4+7UHonZQe1ZG66TdF4u6xBRpn8Mu+PUu5/6c8DozZQ5VOYDi6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742286094; c=relaxed/simple;
	bh=eCJ30kUReItZP7bmYeQDT82DJqArPXR0CBt8PMLpJas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZ/0dSYk/WmMZYkyg4d/skQLUpgL2c9t2xVaoIEhc+TW3ONBdf7iiH6x9OphSHPQf2ZSZ1hxEEgJEUGnED5xPbTIin1G22958RCHzUNX26UbTLyYvdGDacwKeeYSBHmLFw8dcu5LcdPpkWMOSslqhOa8/xSPBG9ITzjkFFix2DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=iDM9JV2+; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66F3C101F71FB;
	Tue, 18 Mar 2025 09:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742286087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fOy1Wxy3azMA6TiGoR+RRut2UatAJVAPSMjGHc7ZRy8=;
	b=iDM9JV2+81qI8V9uyIv5w97/sCAv90DBaGLwapHqTusZe8Yl3wt+0+8HF7BAGpJkQD3kUw
	//017VwBGQy9LRXfPdqAG6XSWCGglQq014Fz54yFvIMSMqzb4ecpsSNlCG51N3A+f0XZaq
	dgaVp8cRcKSZZ/7Uz4IqmMAL3hNqPbEWqVQy1RNICGkFY7Qk3WY/JaUpW39opd7Dh1rf6H
	c60UtAG860ZehDe2/AOTY6DZefr/DsLlSVTSduZ2qKnllWlTQqArw533LB+FPKxEFfHLSm
	cbGmDm68thypjScZTFMc76YXeDzaWG+hFMfns/2Jr9q+rJXEJJbsAfVl91OKXQ==
Date: Tue, 18 Mar 2025 09:21:18 +0100
From: Pavel Machek <pavel@denx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Pavel Machek <pavel@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas: Fix description section
Message-ID: <Z9ks/pBQCWXUDO78@duo.ucw.cz>
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
 <20250317083213.371614-2-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdV4SyviVU0+WhgFD_vCO43BQ31tx8az-JihWDAB9EJS+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rOTIEJHNjUEpLBx2"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4SyviVU0+WhgFD_vCO43BQ31tx8az-JihWDAB9EJS+g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3


--rOTIEJHNjUEpLBx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Mon, 17 Mar 2025 at 09:32, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Remove not needed "and" into description section.
> >
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Closes: https://lore.kernel.org/cip-dev/Z9P%2F51qOlq2B46FK@duo.ucw.cz/
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > @@ -12,7 +12,7 @@ maintainers:
> >  description:
> >    On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) han=
dles
> >    generation and control of clock signals for the IP modules, generati=
on and
> > -  control of resets, and control over booting, low power consumption a=
nd power
> > +  control of resets, control over booting, low power consumption and p=
ower
> >    supply domains.
> >
> >  properties:
>=20
> I think the original is fine.  When emphasizing the structure:
>=20
>     The CPG handles:
>       A. generation and control of clock signals for the IP modules,
>       B. generation and control of resets, and
>       C. control over booting, low power consumption and power supply dom=
ains.
>=20
> i.e. the "and" is part of the typical "A, B, and C" construct?

Well, it is still horid sentence. What about making it into list, as
you did?

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--rOTIEJHNjUEpLBx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ9ks/gAKCRAw5/Bqldv6
8qHbAJ9E6sbZEBaY5Hnj3ncRRxq+5+thZACeL4Q5k5rVBovXxPpd0nDd8ZlnIzo=
=a6PE
-----END PGP SIGNATURE-----

--rOTIEJHNjUEpLBx2--

