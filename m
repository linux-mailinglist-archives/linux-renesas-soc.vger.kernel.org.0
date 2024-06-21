Return-Path: <linux-renesas-soc+bounces-6590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40458911D30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 09:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E1C283995
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 07:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6BA16C86E;
	Fri, 21 Jun 2024 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S47PT+kb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5161716C6BD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955946; cv=none; b=F/D1WRpT5+jk/7qY8Pcw5Q7L3bXoZ0F58Tk0XdjGj7FCaJ3Hr8iVxCuD2YfZqyGcfDqYSrW9aZYOca0e+Bf1ph6zPs8x2hAlOI3oXkcTaMsCe5bdfYjzZy8uk+PrcOmBQVnyYV1vqkGIBh5dnNLLbTq+85Qv6ecAFNpanEw7KYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955946; c=relaxed/simple;
	bh=0FWngs3a9ZHYGOcRauLAltFY8V/DpYo7ul6GUKGsYC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Utazj7v89MHtz6hGfF9JGfcAraejN93t0io+b/vaybQOz616rSYtXm5BH+rBAVDAvTp+8I5hPKlfCvgYT87/xBIZa7vPg1QTkqsxIRRdlvHkfwxfeMFonABTaAIuWmJOUtqCgrBi/Eq73kXP1F3C0B8fTSS0t+7X4sQwfQJNNfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S47PT+kb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0FWn
	gs3a9ZHYGOcRauLAltFY8V/DpYo7ul6GUKGsYC0=; b=S47PT+kbsPnj0Y14yMLn
	w9Kd8evfOrsU/kNcvPBCXu3vO4Ee9MYNoj7DG4jFzxNu+Ni3dP+2aSPbJQx6Y3Fc
	8KO7TV8FhldqzHPRpx8p8OitEdnMVu4SAaIiPmyDXn2EruhXVafwmQ6Aq1/HbogT
	UqY3d02oJCmcwMoSsfIfefLlczJ9xMeYeaGhEmSzsTxx8oCcYZBdgDqklHWz22/B
	xyMj9/4TbiHgtwBEY/AauUNn4wuqnzxCJ0NsvKaJywn9+mAAwIgy08I+7b1CwSHB
	hTjqr+g1AiiOs1ATVtn7FDfFxnUHmIGty8WdsX8/1F401HWP+B3nlJ7QAQzY9mg3
	pQ==
Received: (qmail 1283791 invoked from network); 21 Jun 2024 09:45:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:45:42 +0200
X-UD-Smtp-Session: l3s3148p1@EIFNnmEbQrggAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 09:45:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Message-ID: <riweh6pybbbadjfgenwrdclquurzsvoxudq63v63ip372qpkca@frk4gtnxt3bt>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>
 <CA+V-a8v_r5efeR3U+J0MK7cKxPR7a6s0z4fws0iHO1-uezAuTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4gfhepvy5ou23jk"
Content-Disposition: inline
In-Reply-To: <CA+V-a8v_r5efeR3U+J0MK7cKxPR7a6s0z4fws0iHO1-uezAuTA@mail.gmail.com>


--u4gfhepvy5ou23jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > There is a similar instance of regulator driver [1] which is
> > controlled via register bit write, but in our case the SD_STATUS
> > register is part of the SDHI IP block itself.
>=20
> ... I could imagine that the SDHI driver itself exposes a regulator
> driver. Just without a <reg>-property. The compatible will induce which
> register and bit to use.

That would mean we have a compatible-entry per SDHI instance per SoC?
Did I get this right? I think that will be too many compatibles.

What is the drawback of using an "internal-regulator" property within
the SDHI node?


--u4gfhepvy5ou23jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1L6UACgkQFA3kzBSg
KbYf0RAAj58OS56vrdI1QNgWNvWlkONIcy7KZA/msnwfCY3Tk1EeIcdz52dKOiQa
Yd6lvlyXY4J2qzWDS/2d9t1ATcpEZLOqwogfKURsLIHjAtbzvcVY9Ah09ibUJP4L
89pKY1t9AJ7n2Qpt/F1sYnM2vZkHMvtH2P+KuX2Ov0iawEZeFTNHlgHwZQOACEK1
GqcwcnUt4wU2TEQdHCj6ailRQGlAaAXYElNYqzaBavvHm+zlz2neVoQ9bYiDv3Us
EIx8tW2LH6JxvWSSwoC0PNmlAqNmbkHaMsv9E7r/584z1Gpj816CZY+BSRb9dPCK
aTywMeGoLSy+HR+c62NhIaLY/bULrYbAFJ1AnL9tbWeAE+uj6+eMpwvETIIrKgLq
sSIGAHZpm2DxHWHLtxLbUk+PHjq6YIxP0kwc7KdAwiJ9k0or1wWYtZnNGtGHAFJg
TpUAL8YLtW7IuC3GFoRFZ4ep6ePtCOe+zzBBknNSz7D9lM6QgyfJ1BV/BfmTkyM/
aBtGREGiLvQTQv7g93hLmmFzpj1S5oFaP0A09iaru1sgcjwbC3wmRMm9LrfDwR2+
CxTSu7pG7+5vUZYJxK1ZePq/pvPgrxeNiuRoFGqc8s2WulVsE9TgA2l1+rsKKiIp
Hg9OayMcv2M0CHhIbqRmHVL3qeiNhky+hkC3S1yYxNcVq1WQQxk=
=CUbe
-----END PGP SIGNATURE-----

--u4gfhepvy5ou23jk--

