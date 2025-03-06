Return-Path: <linux-renesas-soc+bounces-14107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DBA550DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 17:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23305163F5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E942144BC;
	Thu,  6 Mar 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIzzk/VY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548D214215;
	Thu,  6 Mar 2025 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278398; cv=none; b=dPPmvL654Ur99OqL/i5vfY3/k6EPE+NiaXWy5e9gc1L5WxvbG4Np+kDMfnEGHwJxSGQ01/aBa7dAUIjsgqQiFz2uvQXYIqs6PM18P+k41Mb5MDP1K7nNoxn0tfKRQDtv/RAe0EhuqcoA4yOnhuCnqtpdZIm0bTktzCMk8ONTudc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278398; c=relaxed/simple;
	bh=p1xxl5U+OpWnSGGhMDfZZryJ7dgXJL+8/fxRSuOy6tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emk5JRgwX5+/XuPCiJM/64hh+4+Te0qeFKKGbwiOYjBoJDNET4mgJwIJN6UEE6uPiJWbNXTO4dkuPFi8uD9nJ2RRdCZE9zChwKy8vzncVJeFzPD2NRLA4jA2GjXgatLaQOkcfVmTavMarzo3xjA33QHh1DaifONxOvdNhPe5Mn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIzzk/VY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A77C4CEE0;
	Thu,  6 Mar 2025 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278397;
	bh=p1xxl5U+OpWnSGGhMDfZZryJ7dgXJL+8/fxRSuOy6tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIzzk/VY6Vgd2uPb6a3xN8O3a9SNzgSLtHnGLiUktfMIk0F3urhpDtwwNZsg3Gwqt
	 rDbb5VIwdBD8IT8aiuMxMp4tgYcnZLcAxOg6kdiT7N+M8bY/wMy7490LwJYKPuDl8+
	 UmMLVzdWE8rX/mSBctB+ce9oOpdSpmVQqi8xIu/Vjko9TL4lVjPCs4TdlIHrG46So/
	 pnm3iGVLlK812LAfJFEp9GC8fh5VxbUSf5a3n5aq94YcZazqxF3dDAV3o9dUDHbMN+
	 VIZOjcMr7uIfKe2or1eRdogLf0KceWKRNeH8MtSBVQy0RItfjWnAIboZq1nCpc7UJk
	 FFmqXEOieXoGA==
Date: Thu, 6 Mar 2025 16:26:32 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 Control
Message-ID: <20250306-slather-audition-a6b28ba1483e@spud>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305-cesspool-headlock-4d28a2a1333e@spud>
 <CA+V-a8uQTL+SHYqVU_J0th4PT6YPF7q6ypzDu33nS_6onWLoOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DOLIzUy4BmDDCltF"
Content-Disposition: inline
In-Reply-To: <CA+V-a8uQTL+SHYqVU_J0th4PT6YPF7q6ypzDu33nS_6onWLoOQ@mail.gmail.com>


--DOLIzUy4BmDDCltF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 09:35:13PM +0000, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> Thank you for the review.
>=20
> On Wed, Mar 5, 2025 at 4:26=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Mar 05, 2025 at 12:39:13PM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add device tree binding document for the Renesas RZ/V2H(P) USB2PHY Co=
ntrol
> > > Device. It mainly controls reset and power down of the USB2.0 PHY (for
> > > both host and function).
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     | 56 +++++++++++++++++=
++
> > >  1 file changed, 56 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/reset/renesas,r=
zv2h-usb2phy-ctrl.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-us=
b2phy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb=
2phy-ctrl.yaml
> > > new file mode 100644
> > > index 000000000000..ed156a1d3eb3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-c=
trl.yaml
> > > @@ -0,0 +1,56 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-ctrl.=
yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas RZ/V2H(P) USB2PHY Control
> > > +
> > > +maintainers:
> > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +
> > > +description:
> > > +  The RZ/V2H(P) USB2PHY Control mainly controls reset and power down=
 of the
> > > +  USB2.0 PHY.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: renesas,r9a09g057-usb2phy-ctrl  # RZ/V2H(P)
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  '#reset-cells':
> > > +    const: 0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - resets
> > > +  - power-domains
> > > +  - '#reset-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> > > +
> > > +    usbphy-ctrl@15830000 {
> >
> > How come your nodename isn't "reset-controller"?
> This is to keep consistency with the other similar IP blocks found on
> Renesas SoCs [0].

That sounds awfully like "it was wrong before, and I want to keep using
the wrong node name"... If you're claiming to be some other class of
device, "ctrl" should really be "controller" like all the other sorts of
controllers ;)

>=20
> [0] https://elixir.bootlin.com/linux/v6.14-rc5/source/Documentation/devic=
etree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml#L66
>=20
> > Otherwise,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > > +        compatible =3D "renesas,r9a09g057-usb2phy-ctrl";
> > > +        reg =3D <0x15830000 0x10000>;
> > > +        clocks =3D <&cpg CPG_MOD 0xb6>;
> > > +        resets =3D <&cpg 0xaf>;
> > > +        power-domains =3D <&cpg>;
> > > +        #reset-cells =3D <0>;
> > > +    };
> > > --
> > > 2.43.0
> > >
>=20
> Cheers,
> Prabhakar

--DOLIzUy4BmDDCltF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8nMuAAKCRB4tDGHoIJi
0oGbAQD1DEsVJ26txgtMwHVJFjjyDvTc4QPtoSqHjqDxyI68/wEApouaX/KT91rL
yXazIwVT6hH2o50iPf/75oKx00Mlvgc=
=ry25
-----END PGP SIGNATURE-----

--DOLIzUy4BmDDCltF--

