Return-Path: <linux-renesas-soc+bounces-24477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B6C4F4FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 18:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A04C14E72C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 17:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE3A3730DC;
	Tue, 11 Nov 2025 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE9XwjjX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34F366567;
	Tue, 11 Nov 2025 17:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762883371; cv=none; b=XFJFA0CnsOnOHaQKLIOBTqjB5LigMxs5kX0Ot7wZ/Dplpr9jG1LSYAroL+rOoiw60aHeGlhYpBhK8svzZm+ZEWJKSLpzOhXuDtv/kq/RV8g87UC7jdZPivgcINo9rZGFUQC8amnerc5irEZCLM3kvdqLRykDiIowe7V0VX+0x90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762883371; c=relaxed/simple;
	bh=zocJ862gCjpDuUNubmzgR6h99aJwcneiyYTLTKnNI3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwGpDouyXWY0h7UdgVrw8vPuwhpG9A2jRAKRCYTyXgqcoIIJ1yOYzR2xquJu1aAuMDWMgFnyf9Q9t7vYfEJyxUgJg/ScoCuLATujpv3ZP+JFHWxtwKjl8e3Ch1YlvQnvpvVvIMBcK9eBhiXXC9CwgzyliNJ1DdgammYYA/BMagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE9XwjjX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB74C4CEF7;
	Tue, 11 Nov 2025 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762883370;
	bh=zocJ862gCjpDuUNubmzgR6h99aJwcneiyYTLTKnNI3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oE9XwjjXJ4zuViCgUJhNrma+dXIqJlBP2R6zTUD36jZAWS90+BR0ADBOISmI1EtA5
	 OB+N5/fxR2Y/H3F75CR4mlfqvLiYBW6l6uKuZbPn/uWOYnSdGh2FhP1etlOu3eP/MY
	 atbndOludtfppNkDkZ8zzbX+s3S9C6+6Xaj1quxlWsNZHr9qJTj+0b+8btYRL5cvZL
	 GRD0fWynnQ95Dy/SC93tYylHIyF4CZXpdahIA453u0AQLXTIydKaePMGkrpMh0h8vf
	 ek4KHdC/1dSOSlA3hBoQtVltPPsbhH2s5w2v223bcFc2cIvSoSzWFNq5MUm/kft1Uk
	 VqlK7Fk95LtJA==
Date: Tue, 11 Nov 2025 17:49:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, robh@kernel.org
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <20251111-character-catnip-0832956a3fb1@spud>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <20251110-resonate-strict-c3d6c42f3e0d@spud>
 <aRJqfh7p9M3NHfCS@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i+5JGchjTRlwEy8H"
Content-Disposition: inline
In-Reply-To: <aRJqfh7p9M3NHfCS@tom-desktop>


--i+5JGchjTRlwEy8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Tommaso, Rob,

On Mon, Nov 10, 2025 at 11:43:37PM +0100, Tommaso Merciai wrote:
> Hi Conor,
> Thanks for your comment!
>=20
> On Mon, Nov 10, 2025 at 06:56:31PM +0000, Conor Dooley wrote:
> > On Mon, Nov 10, 2025 at 01:08:04PM +0100, Tommaso Merciai wrote:
> > > Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
> > > USB2PHY reset binding to support describing the USB VBUS_SEL
> > > multiplexer as a mux-controller.
> > >=20
> > > This is required to properly configure the USB PHY VBUS source on
> > > RZ/V2H(P), RZ/G3E SoCs.
> > >=20
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  - Manipulate mux-controller as an internal node.
> >=20
> > Why is it a child node, rather than just putting the cell in the parent
> > reset node?
>=20
> Getting "make dt_binding_check errors" [1] in v2
> Adding #mux-state-cells =3D <1> into:
>=20
> 	usb20phyrst: reset-controller@15830000
> 	usb21phyrst: reset-controller@15840000
>=20
> Nodes.
>=20
> Please correct me if I'm wrong.

I think that that binding is not working as intended. Why require a
node-name pattern, when it matches on other things too:
select:
  anyOf:
    - properties:
        $nodename:
          pattern: '^mux-controller'
    - required:
        - '#mux-control-cells'
    - required:
        - '#mux-state-cells'
if the node name always contained mux-controller, the second two here
would not be needed. Looks to me like the intention was for it to allow
putting these control/state-cells properties into mfd type nodes.

I'd delete the node name property tbh. Rob, you converted this to
schema, what do you think?

Cheers,
Conor.
=20
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/961741af=
7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renes=
as.com/
>=20
> >=20
> > >  - Improved commit body.
> > >=20
> > > v1->v2:
> > >  - New patch
> > >=20
> > >  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml   | 11 +++++++++=
++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-us=
b2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-us=
b2phy-reset.yaml
> > > index c1b800a10b53..03da74ff2d08 100644
> > > --- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-r=
eset.yaml
> > > +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-r=
eset.yaml
> > > @@ -37,6 +37,12 @@ properties:
> > >    '#reset-cells':
> > >      const: 0
> > > =20
> > > +  mux-controller:
> > > +    $ref: /schemas/mux/mux-controller.yaml#
> > > +    description: Mux controller for USB VBUS source selection.
> > > +    type: object
> > > +    unevaluatedProperties: false
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -44,6 +50,7 @@ required:
> > >    - resets
> > >    - power-domains
> > >    - '#reset-cells'
> > > +  - mux-controller
> > > =20
> > >  additionalProperties: false
> > > =20
> > > @@ -58,4 +65,8 @@ examples:
> > >          resets =3D <&cpg 0xaf>;
> > >          power-domains =3D <&cpg>;
> > >          #reset-cells =3D <0>;
> > > +
> > > +        mux-controller {
> > > +          #mux-state-cells =3D <1>;
> > > +        };
> > >      };
> > > --=20
> > > 2.43.0
> > >=20
>=20
>=20

--i+5JGchjTRlwEy8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRN3JAAKCRB4tDGHoIJi
0kOLAQCI5K2A+ibI0FbtW+1ELPWJuLm5VD2WFoSS+aZuH4mZngD+KEH6LZ/MiVEc
Ck342874THE4WX4OIe2YftYE5Z1hago=
=Z10t
-----END PGP SIGNATURE-----

--i+5JGchjTRlwEy8H--

