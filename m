Return-Path: <linux-renesas-soc+bounces-18192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4652AD73E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB194171DAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C66A246BB4;
	Thu, 12 Jun 2025 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ifb8Elga"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5BB221FAA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jun 2025 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738703; cv=none; b=RKjg5zbQIegSfKFi84H8X0X8xoB7X871E0hbkDAVUC2SPUR47dX2YxRuhw1f36Eb6izKmFn6FrC+Op0/Nr2w0Y4/wtgscIh4c9BAONX07P5GeMySuYczjPmpjtLv8Qi06QkSdSPSRnfpRQxSAc+lW61TW9bWVaJAs/p1GsxfUvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738703; c=relaxed/simple;
	bh=/491YK96geYMMoQHdMnC5tcLOKwN8ZyKqOh+KHZhBtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRhpM8IfuRGdC7C2OMudYfZoH8Pmk8HoxuVTYVQyls2fD3VY2iZi2PtlGkji8RT/ILpm/7zfaoSGB3NuqA5HC6Y2J9YjE3CM8OlGru8Ymijrd11yyqFfuVFkvmskA0PBGgp+u+c/6iQiRxnhFRnpWOmspYV86cZtmh0f0spbtGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ifb8Elga; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nvX4
	gaASPxW8NzIAszKH+xfR6o3pGLbxslvAvlUHCVU=; b=Ifb8Elga9Hq+WuT3KRxS
	mf4hNdyFGWeD5WnrMu+hPrvK959f8HMrexl2/lRy/lxSt1edL7v6HmSdXl/5XJJD
	mVGcVnXowqjSVUMkVRwSYOGaMwatXTMZFQMjLWmcbUEPlbt4VPSVRysfZb5QUdVi
	FKV/dMn8tUYsYblVK93c+qcMa1FE9ptr293YpDmjhigAc1+41pvVYWuM6J4tquqt
	JD+meruUvZ8l48yFQiIWqCW142Rh6dTB/ac+IMrzIDPpAshdoxOYnqux6vrbSqSp
	IPf3b0yyFX75EtV5uagbg0ihpJFnTPGLEtL1a3R9dGowqawe2GgYqr0F0b1BXL7H
	pQ==
Received: (qmail 4027197 invoked from network); 12 Jun 2025 16:31:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2025 16:31:36 +0200
X-UD-Smtp-Session: l3s3148p1@axByyWA3dqUgAwDPXy2/ACpZfVCNKldR
Date: Thu, 12 Jun 2025 16:31:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aErkyDQvV3C0TZSu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yxu6D1mTWsYb+Rh+"
Content-Disposition: inline
In-Reply-To: <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>


--yxu6D1mTWsYb+Rh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frank,

> > +  clock-names:
> > +    oneOf:
> > +      - items:
> > +          - const: pclk
> > +          - const: tclk
> > +      - items:
> > +          - const: pclk
> > +          - const: pclkrw
> > +          - const: tclk
>=20
> Suggested clock name is, apb, trans, srfs.
> Needn't clk surfix and provide meanful name.

? Why can't we have the name from the datasheets? It will be
unnecessarily hard for users to verify the correctness of the clock
assignments if they need an artifical mapping of these names. If they
are the same as in the datasheet, the same task becomes very easy.


--yxu6D1mTWsYb+Rh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhK5MMACgkQFA3kzBSg
KbaFJg/+KeiNeq05WPjw2bEJSYqw0HawAApouvZSc2qN0M7xhrHqvU6cFplYCJlC
NZmV015zCr9ulnP8GFmigTu6gkjaW2YLSn0UEJMBdTHNAut4jjl43VKkmkVRYShU
Hr3ob55YKWX1GG/MNo8+miZsP8iZbZwO2kvFegO6SrVzuKgVzLZVBEIbBZdZuy5P
y55f1LVO6uYtH809SAPf2jEccye7y7EVPRTGQydNWaLzWYqNteSUBx2S22bZ3GRk
lSVRDgTMkmLJlVdNBO4vjbNldMklN2YfEYMgGpyBmUjbATuu2gaERPpAmyqLV1el
40Kns1+fMLsfpstbv5LJ4QdHl/vgKsDscZlAeis5wXuQNRYLBp1mZziV1d6uK4U0
RS6Uza+rn9Ub/wj7/m6qNQC0NsrnK6BZJVoijGciQumZJC+brugfiFHBm5+q5/M4
gnY7mT0YuBRSBTppXRJM4tgSCSEGDQUluFZ19zOu28TJq/gmbwo28GJwUG/Ozd82
Bgnm/6EM/u72iqx6pLS2y7RdBCCXl84UVdVbMoV/dyWf3Zd/RR6w8bmplXi/cOyY
fXG3MWkh8jRCVx9B1TL1kd+UT3qKyARQJNQ+u/5YZ8UvaFVPgcusglixuTReps5J
jiwQoITVVoHr6OrB2FkmNFeRkEuL8nIewZuKrqLQ0wli2VjROJQ=
=OjIv
-----END PGP SIGNATURE-----

--yxu6D1mTWsYb+Rh+--

