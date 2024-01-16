Return-Path: <linux-renesas-soc+bounces-1591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B182F343
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jan 2024 18:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61F9728741A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jan 2024 17:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BCD1CAB2;
	Tue, 16 Jan 2024 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suoP77rj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F81CAAC;
	Tue, 16 Jan 2024 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705426458; cv=none; b=JwfG+wCP4ymxZmOssoO51ZNA0BqmvTNo2Iz0Sa6R9izn+i5KFl/qwgiLNZmOOabQdX7gYoPAMJYzCLs49CUlPnBnAFyHbHkEmQm28AZ7LXNtBS8gDsMxUotT1J/hN6E1HXS96UC1ZmE07FjFYuiqMtbgm7alXQydFjj4WH37WOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705426458; c=relaxed/simple;
	bh=8p3Bv9fS9hcvnux4i7+QsuaRONJtDzRbjULEc/qM+pk=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=Hv7ZqiVKy7R+zXCMH1UJjpR2ZA389lU7zMCXDw9NHzwrl74V71q/Sr/lj7A3C2kqbs1J4+oVsmB7/1zI8emhMyGHQ4KqPquCbI0ZyXMgu7g9CZAVAQKggPsmeA/ojTVTrfakUu0t026osxhzquRWdDAzUGZGlMbKTht/un3ww2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suoP77rj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79ABC433C7;
	Tue, 16 Jan 2024 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705426458;
	bh=8p3Bv9fS9hcvnux4i7+QsuaRONJtDzRbjULEc/qM+pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=suoP77rjxNLBOyGKknnGu7OlFdoZTknBpSYJt471v4NArHDJPfOnHKszO3PmsVQkG
	 fkF5NwYMP7b3BBAKAPpHbeGN8tpU/rHmElwy5k9c8vJEdTq3fZTPtfalX+XRvRBf9Z
	 040bLDMI46bsENQZdwUSkZLXG24eZAe74Gw6GJkF8RaFmsFsBqtK0sAdnwdi5GfN1b
	 LCT2a1wTRXOFLfhaanRAqXqVFlSWfYvStB4ZWGqheR79z5M4JVxtCrQMzO82N6HVtb
	 Nxstn9oDb3ARbT03AyplV0x+hONRyV2qtJUgFhBEa30RwXgyrRe5Py/k9bEcFZR9oF
	 C1gQPtza/RNNQ==
Date: Tue, 16 Jan 2024 17:34:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document input capture
 interrupt
Message-ID: <20240116-coasting-pastrami-1dda8d1025d0@spud>
References: <fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be>
 <20240115-wages-secluded-b44f4eb13323@spud>
 <CAMuHMdWY3D45NGHvGXSZRLZz4TyCRgRCQLZV6CzYs=mSFcherw@mail.gmail.com>
 <20240115170807.GJ5869@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PLgkBpzBz5n2FhT/"
Content-Disposition: inline
In-Reply-To: <20240115170807.GJ5869@pendragon.ideasonboard.com>


--PLgkBpzBz5n2FhT/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 07:08:07PM +0200, Laurent Pinchart wrote:
> On Mon, Jan 15, 2024 at 05:48:18PM +0100, Geert Uytterhoeven wrote:
> > Hi Conor,
> >=20
> > On Mon, Jan 15, 2024 at 5:13=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > > On Mon, Jan 15, 2024 at 02:45:39PM +0100, Geert Uytterhoeven wrote:
> > > > Some Timer Unit (TMU) instances with 3 channels support a fourth
> > > > interrupt: an input capture interrupt for the third channel.
> > > >
> > > > While at it, document the meaning of the four interrupts, and add
> > > > "interrupt-names" for clarity.
> > > >
> > > > Update the example to match reality.
> > > >
> > > > Inspired by a patch by Yoshinori Sato for SH.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >=20
> > > > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > > > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > > > @@ -46,7 +46,19 @@ properties:
> > > >
> > > >    interrupts:
> > > >      minItems: 2
> > > > -    maxItems: 3
> > > > +    items:
> > > > +      - description: Underflow interrupt 0
> > > > +      - description: Underflow interrupt 1
> > > > +      - description: Underflow interrupt 2
> > > > +      - description: Input capture interrupt 2
> > >
> > > Seeing "input capture interrupt 2" makes me wonder, are there two (or
> > > more!) other input capture interrupts that are still out there,
> > > undocumented, and looking for a home?
>=20
> Maybe writing this as
>=20
>       - description: Underflow interrupt, channel 0
>       - description: Underflow interrupt, channel 1
>       - description: Underflow interrupt, channel 2
>       - description: Input capture interrupt, channel 2

I, for one, prefer this wording.

> would make it clearer ?
>=20
> I'm also wondering if we really need to add interrupt-names. Drivers
> can't depend on the names due to backward compatibility, what benefit
> does it bring to add them to the bindings ?

Adding a -names property and not making it required has always seemed
like a waste of time to me. Granted, making it required post-factum has
other problems, so I am inclined to agree that it adds nothing.

>=20
> > SoCs can have multiple TMU instances.
> > Each TMU instance has 2 or 3 timer channels.
> > Each timer channel has an underflow interrupt.
> > Only the third channel may have an optional input capture interrupt
> > (which is not supported yet by the Linux driver).
> > Hence each instance can have 2, 3, or 4 interrupts.
> >=20
> > See "RZ/G Series, 2nd Generation User's Manual: Hardware"[1],
> > Section 69 ("Timer Unit (TMU)":
> >   - Figure 69.2: Block Diagram of TMU,
> >   - Section 69: Interrupt
> >=20
> > Note that the documentation uses a monotonic increasing numbering
> > of the channels, across all instances.
> >=20
> > [1] https://www.renesas.com/us/en/products/microcontrollers-microproces=
sors/rz-mpus/rzg2h-ultra-high-performance-microprocessors-quad-core-arm-cor=
tex-a57-and-quad-core-arm-cortex-a53-cpus-3d
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20

--PLgkBpzBz5n2FhT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaa+FQAKCRB4tDGHoIJi
0hJKAPsH2IaDOPlurMPkBUuO019dDgDcIkdyy3NJnFmex6flPAEA3v8Ly8XOMz9L
LAWEsu4AzTmlAFdnbKbgDQzeugjdYQo=
=F/w/
-----END PGP SIGNATURE-----

--PLgkBpzBz5n2FhT/--

