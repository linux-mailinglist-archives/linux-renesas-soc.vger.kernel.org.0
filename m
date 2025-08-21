Return-Path: <linux-renesas-soc+bounces-20881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD28B301D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 20:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01C66030F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF0F1E5B70;
	Thu, 21 Aug 2025 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYp9AWFY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D54C6E;
	Thu, 21 Aug 2025 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755800168; cv=none; b=FBoq7QBwU2rfXtMYxppRz1l12UwH+47cAyqG+0qoVSRGBq7l1hPyPGp0uEp+pSH3zvv6URGW4rmiH1q6M31NWsf8IrtifXhBWhI1ZpFj7BCo5wH8icb0RuR5JW+KerMCBJnJXQvEz2KhqbZnXjqdprdl2MQY/Gwcup/SsgNJlwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755800168; c=relaxed/simple;
	bh=veW0qVFrmP47n0MUNc/joNwN/5xsR0WE60fQR3ZiOZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GF64UauMTBESS5MHbXMlEwWC+OqWuT4cVyZ96j4mMfrugHi6ev92iA7NgamuiqmrrYuS3PtgdIAzyYJIvWfPtt/tvLkiiJ+yEGTE/nD2s3RC3OTRTuD67AuZAF17o1BmsrAXwDBprbsZnKejO44ajmGa/pIdf1hv4SaSOmQJogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYp9AWFY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45BCC4CEEB;
	Thu, 21 Aug 2025 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755800168;
	bh=veW0qVFrmP47n0MUNc/joNwN/5xsR0WE60fQR3ZiOZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYp9AWFYRh3mF7NBTTSLlPoJwwxzpv25iOtNzhRzubHXstr/DOdqulCQZku3uk/jK
	 06P3dfIOcjm/M2pdaPVTrhlZitfvwtEgaoBctkDJSCnVHRc7ysQ5/mi9JE3kWBK7VV
	 7sUsQyv5eGwkFG/I1XIYUbo7T/d/tMtQJhQFKl0ORVnzrk52GEebLcreIsDWjQL417
	 lcQr48Dt7kxy0etfmqWrwGcuaQU6wryRmP7ThyHrkxQR+havRdB4bbmCym+5EuAvnp
	 QzLOP7I5ScwuC5aI1+t8HwNsEEiYFt31HfBZQknW9+7PSvOQJFYeY6aGNh+S2tWpPt
	 7KO+Bft3YJRnQ==
Date: Thu, 21 Aug 2025 19:16:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
Message-ID: <20250821-arrange-exhume-aed87b75305c@spud>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-7-biju.das.jz@bp.renesas.com>
 <20250820-onyx-salad-c5c96f6bd480@spud>
 <TY3PR01MB113464F2ED8BFBB823B038C038632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7GlMQwMLMmaJG8we"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113464F2ED8BFBB823B038C038632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--7GlMQwMLMmaJG8we
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 07:15:59AM +0000, Biju Das wrote:
> Hi Conor,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 20 August 2025 21:11
> > Subject: Re: [PATCH 06/11] dt-bindings: usb: Document Renesas RZ/G3E US=
B3HOST
> >=20
> > On Wed, Aug 20, 2025 at 06:17:53PM +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Document the Renesas RZ/G3E USB3.2 Gen2 Host Controller (a.k.a USB3HO=
ST).
> > > The USB3HOST is compliant with the Universal Serial Bus 3.2
> > > Specification Revision 1.0.
> > >  - Supports 1 downstream USB receptacles
> > >      - Number of SSP Gen2 or SS ports: 1
> > >      - Number of HS or FS or LS ports: 1
> > >  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
> > >    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbp=
s).
> > >  - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous=
, and
> > >    these split-transactions.
> > >  - Supports Power Control and Over Current Detection.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >=20
> > > +---
> > > +$id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
> >=20
> > > +    const: renesas,r9a09g047-xhci
> >=20
> > How come these don't match? I don't understand your naming scheme at al=
l, so idk which is even correct!
>=20
> r9a09g047 is SoC part number which also known as RZ/G3E SoC.
>=20
> I just followed the convention used in [1] and [2].
> Please let me know I should change rzg3e-xhci.yaml->r9a09g047-xhci.yaml ?

What's the benefit of using that instead of the compatible, other than
confusing me?

>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/Documentation/devicetree/bindings?h=3Dnext-20250820&id=3D44b91d61c505863b=
8ae90b7094aee5ca0dce808f
>=20
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/Documentation/devicetree/bindings?h=3Dnext-20250820&id=3Db2d25905366b4e67=
91f60e6bc76a636d1b88e6f8
>=20
> Cheers,
> Biju

--7GlMQwMLMmaJG8we
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdiYwAKCRB4tDGHoIJi
0hSPAPoDdOTqCsOU1Lt3flNQYSPU1t6vbvU4LII0fUo2sw2JvAEA4rYPc7+ZtKBS
xeByEQ0cVKS3bqvr0RWjOxjWXs2GRwA=
=hwrx
-----END PGP SIGNATURE-----

--7GlMQwMLMmaJG8we--

