Return-Path: <linux-renesas-soc+bounces-16987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA9BAB3CBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 17:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4ADC86480E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6568223FC6B;
	Mon, 12 May 2025 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJQuR80l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3585C23D29F;
	Mon, 12 May 2025 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065249; cv=none; b=LbX/VZZGbEarKnR2b6bRCdKyRzin4Z+/+ooCTvWMfNkNWCsrS8yq6yWnDtTUBvDSgDocFdox3jbEDluT5xA2MtXh/rLHDmSz4rW7LHanKpoU5IJVqYsAFliHF8tMx3uH/E85eCMECZ2GUROVxo7Aaj/kPDvffCkldaiqetM1eco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065249; c=relaxed/simple;
	bh=ardgSaLF+Xzy6IuCgpd3Vkzram81Uc0c2cE1fOWBWbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpvkLEEN6NgzLwkvWnDQH/5YCVvRgcUX2jWc7GqhSzowg2TwVUASGP74WI4xDB6PKf0VAA/HDglLV3UjxRdLjzP7HuwPx/NWYz6IXfNXGZSwr5sJ6ydhros9zBJSCU2CEtlkJsmpyMFy0UQ9sTxxx8B6oW6Sdc52YuCXIETX8OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJQuR80l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0F0C4CEEE;
	Mon, 12 May 2025 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747065248;
	bh=ardgSaLF+Xzy6IuCgpd3Vkzram81Uc0c2cE1fOWBWbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJQuR80lByNZISu3PMcvRfdar/46craiwyvRfxH6qwaBIaKgVN9lld7eN6lMOenYm
	 nYxeWccZ1cW4nZCKj2VchptdnthkDFu/uEesq1e9irdeXR/Xfwa4g1liYvMm2QQabc
	 syC5HEpxoUPK5Za/KRD5vYFMMYCznB0U2cbH1bDqNajhPeqaxTQpcvuFZR38gn8Kr7
	 elQ9XuucoHOSFEIhetmwBTlVPGDs9klgcQHSr9hNPsWVGnNcySwKn5KIGxK7iYGCfi
	 +cuj5O0+5l1OHUiqLy2ROwMtTQyXUSRuuMZyTvtm/p4bi/cfnmm22o3Pq1WBZV/xX0
	 Hu7OYGL3mXhCg==
Date: Mon, 12 May 2025 16:54:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache
 compatible
Message-ID: <20250512-neglector-scope-65dd0e24db8f@spud>
References: <20250512-daily-saga-36a3a017dd42@spud>
 <20250512-sphere-plenty-8ce4cd772745@spud>
 <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z6jVGgc2yAbBL/YK"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>


--Z6jVGgc2yAbBL/YK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 03:57:41PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Mon, 12 May 2025 at 15:48, Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > When the binding was originally written, it was assumed that all
> > ax45mp-caches had the same properties etc. This has turned out to be
> > incorrect, as the QiLai SoC has a different number of cache-sets.
> >
> > Add a specific compatible for the RZ/Five for property enforcement and
> > in case there turns out to be additional differences between these
> > implementations of the cache controller.
> >
> > Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for the update!
>=20
> > --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > @@ -143,7 +143,8 @@ plic: interrupt-controller@12c00000 {
> >         };
> >
> >         l2cache: cache-controller@13400000 {
> > -               compatible =3D "andestech,ax45mp-cache", "cache";
> > +               compatible =3D "renesas,r9a07g043f-ax45mp-cache", "ande=
stech,ax45mp-cache",
> > +                            "cache";
> >                 reg =3D <0x0 0x13400000 0x0 0x100000>;
> >                 interrupts =3D <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_=
HIGH>;
> >                 cache-size =3D <0x40000>;
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.16 if there are no objections.

I'll grab the binding then on that basis. :+1:

--Z6jVGgc2yAbBL/YK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIZnAAKCRB4tDGHoIJi
0qXTAPwP/YNKxUjnsoWI2eR0P927XpvMHJh8iXZEVodQF9EU0wEAtk1y4MXzjY2B
SKRgAqtfnm7hZ972QpmZqhPgXVaxGwk=
=xOTE
-----END PGP SIGNATURE-----

--Z6jVGgc2yAbBL/YK--

