Return-Path: <linux-renesas-soc+bounces-24515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C28C54052
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 19:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7C014E1981
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 18:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852B934404F;
	Wed, 12 Nov 2025 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3PAt5os"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596CB27FD49;
	Wed, 12 Nov 2025 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762973302; cv=none; b=S+p88gfH3VXSM7sB/tfBuO8GYYLkzw4uJ4I6mP8W8QZ7oMt4Q7mxyrApR9ctEDNwcc209O3Y9X21XPjlhYOgZqr6HLqpusbF90jlCRz3wFarXNmbQVDJDLlFCl7viqStHBkrwBDqxkG22QB36xfLomrkyiJWaZAqgAOuCxULVro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762973302; c=relaxed/simple;
	bh=dxUWBNjSHg2QdfgaDnXYT/JYX+mehzTGcs5DtsDTJ9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K64x+pMAClkO0rkVL4beQVa+6h9ZVYeZSQnRqm9L2kCDuyOsQ1+nHeVol8rHJvPZv922zu3V6Qt4xPcmMmfZ/rWpMC3RnEWnYWYJxUqEBFjL4sQyV0D3AkpVKPt9Diwb5LF8LOu7qBHdvdctIbEFL2EqfLTWxiVTxCc2rFhwSFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3PAt5os; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F897C4CEF7;
	Wed, 12 Nov 2025 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762973302;
	bh=dxUWBNjSHg2QdfgaDnXYT/JYX+mehzTGcs5DtsDTJ9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3PAt5osYgKijUL2pFo/OcQJcuo8aKl5jV/Ro3uEVCVlD5OzT7hsi0AgBnOqQmH93
	 MuRxEyLqIgFC3RVgXpZ4r4sQT55Jd5ifjR8X9CiHVoxQE7GStm6zBj87jmCiZbwTUz
	 Z2dn9tro+uFRIdPzYPLS3Mj2nGDhhl/F/FjdvKikjLlzrj2/IWB1/hVX0K476FtIDc
	 N3pPQLOTKoMyP0B46dd3/S1sLGEt+qaBX5Fm5PKAu2wUvLLpOdqQmzQUySwi1iBX3i
	 8GRhi6DpOyCQ0cNxPJmzoymZA8KAomNA8jhW93SeN9tLnuAcwtgTQJgWwhw/0t6Jq9
	 kSe7689rBQsMQ==
Date: Wed, 12 Nov 2025 18:48:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Document VBUS_SEL mux
Message-ID: <20251112-launch-overcoat-18c3924b9b3f@spud>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <20251110-resonate-strict-c3d6c42f3e0d@spud>
 <aRJqfh7p9M3NHfCS@tom-desktop>
 <20251111-character-catnip-0832956a3fb1@spud>
 <20251112163712.GA1850277-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wi4VmUiHBPJH/1r5"
Content-Disposition: inline
In-Reply-To: <20251112163712.GA1850277-robh@kernel.org>


--Wi4VmUiHBPJH/1r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 10:37:12AM -0600, Rob Herring wrote:
> On Tue, Nov 11, 2025 at 05:49:24PM +0000, Conor Dooley wrote:
> > Tommaso, Rob,
> >=20
> > On Mon, Nov 10, 2025 at 11:43:37PM +0100, Tommaso Merciai wrote:
> > > Hi Conor,
> > > Thanks for your comment!
> > >=20
> > > On Mon, Nov 10, 2025 at 06:56:31PM +0000, Conor Dooley wrote:
> > > > On Mon, Nov 10, 2025 at 01:08:04PM +0100, Tommaso Merciai wrote:
> > > > > Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
> > > > > USB2PHY reset binding to support describing the USB VBUS_SEL
> > > > > multiplexer as a mux-controller.
> > > > >=20
> > > > > This is required to properly configure the USB PHY VBUS source on
> > > > > RZ/V2H(P), RZ/G3E SoCs.
> > > > >=20
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > ---
> > > > > v2->v3:
> > > > >  - Manipulate mux-controller as an internal node.
> > > >=20
> > > > Why is it a child node, rather than just putting the cell in the pa=
rent
> > > > reset node?
> > >=20
> > > Getting "make dt_binding_check errors" [1] in v2
> > > Adding #mux-state-cells =3D <1> into:
> > >=20
> > > 	usb20phyrst: reset-controller@15830000
> > > 	usb21phyrst: reset-controller@15840000
> > >=20
> > > Nodes.
> > >=20
> > > Please correct me if I'm wrong.
> >=20
> > I think that that binding is not working as intended. Why require a
> > node-name pattern, when it matches on other things too:
> > select:
> >   anyOf:
> >     - properties:
> >         $nodename:
> >           pattern: '^mux-controller'
> >     - required:
> >         - '#mux-control-cells'
> >     - required:
> >         - '#mux-state-cells'
> > if the node name always contained mux-controller, the second two here
> > would not be needed. Looks to me like the intention was for it to allow
> > putting these control/state-cells properties into mfd type nodes.
> >=20
> > I'd delete the node name property tbh. Rob, you converted this to
> > schema, what do you think?
>=20
> Yeah, I'd probably just comment it out and drop the select.

Is dropping the select okay to do, or should just the nodename portion
go? I think there's a couple users that would need to be fixed up if the
whole thing gets removed. E.g. gpio-mux and reg-mux bot rely on the
schema being applied automagically AFAICT, and maybe there's some others.
Although, 99% of mux-controllers seem to use gpio-mux, reg-mux and
mmio-mux which are covered by those two files.

> I'm not sure what to do here in general. Matching on node names was=20
> useful early on, but that becomes less useful as we have schemas for=20
> everything. I'd still like to document standard node names in schemas=20
> somehow, but obviously we can't require a certain name when a node is=20
> multiple providers. Ideally, every node name in the list in the DT spec=
=20
> would be in schemas and we could generate that list.
>=20
> Rob

--Wi4VmUiHBPJH/1r5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTWbwAKCRB4tDGHoIJi
0jBkAQD+fuaIvSWR60ndqX3CRSXBB7//qO2aOwu8ZSKwQj313gD/ebujckuMju4A
5EbhixmUxssMpXa/u63PrjPIR9oGowI=
=zSBW
-----END PGP SIGNATURE-----

--Wi4VmUiHBPJH/1r5--

