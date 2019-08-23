Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FDD9A79A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 08:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404435AbfHWGbG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 02:31:06 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44703 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404394AbfHWGbG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 02:31:06 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DE7611C0005;
        Fri, 23 Aug 2019 06:31:01 +0000 (UTC)
Date:   Fri, 23 Aug 2019 08:32:27 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: Add LIF channel index to 'vsps'
Message-ID: <20190823063227.7soxv2gx7t7acsqq@uno.localdomain>
References: <20190822195600.30787-1-jacopo+renesas@jmondi.org>
 <20190823001209.GO5027@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yt4wyxlnmndfww2i"
Content-Disposition: inline
In-Reply-To: <20190823001209.GO5027@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--yt4wyxlnmndfww2i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Fri, Aug 23, 2019 at 03:12:09AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Aug 22, 2019 at 09:56:00PM +0200, Jacopo Mondi wrote:
> > According to the Renesas R-Car DU bindings documentation, the 'vsps'
> > property should be composed by a phandle to the VSP instance and the
>
> s/composed by/composed of/
>
> > index of the LIF channel assigned to the DU channel. Some SoC device
> > tree source files do not specify any LIF channel index, relying on the
> > driver defaulting it to 0 if not specified.
> >
> > Align all device tree files by specifying the LIF channel index as
> > prescribed by the bindings documentation. While at it, add a comment to
> > the 'vsps' property parsing routine to point out the LIF channel index
> > is still defaulted to 0 for backward compatibility with non-standard DTB
> > found in the wild.
>
> I wouldn't say non-standard, I would instead mention compatible with a
> previous version of the DT bindings.
>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >
> > Patch based on Geert's latest renesas-devel master branch
> > ---
> >
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi    | 2 +-
> >  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
> >  arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 2 +-
> >  arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 2 +-
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c        | 9 ++++++++-
> >  6 files changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index 06c7c849c8ab..d179ee3da308 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -2651,7 +2651,7 @@
> >  			clock-names = "du.0", "du.1", "du.2";
> >  			status = "disabled";
> >
> > -			vsps = <&vspd0 &vspd1 &vspd2>;
> > +			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> >
> >  			ports {
> >  				#address-cells = <1>;
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> > index e4650ae5b75a..14d8513d2a47 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> > @@ -30,7 +30,7 @@
> >  };
> >
> >  &du {
> > -	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
> > +	vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd3 0>;
> >  };
> >
> >  &fcpvb1 {
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > index 3dc9d73f589a..8c9bf985d436 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -2765,7 +2765,7 @@
> >  			clock-names = "du.0", "du.1", "du.2";
> >  			status = "disabled";
> >
> > -			vsps = <&vspd0 &vspd1 &vspd2>;
> > +			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> >
> >  			ports {
> >  				#address-cells = <1>;
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > index 0cd3b376635d..2c4ab70e2a39 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -1120,7 +1120,7 @@
> >  			clock-names = "du.0";
> >  			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> >  			resets = <&cpg 724>;
> > -			vsps = <&vspd0>;
> > +			vsps = <&vspd0 0>;
> >  			status = "disabled";
> >
> >  			ports {
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > index 461a47ea656d..042f4089e546 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > @@ -1495,7 +1495,7 @@
> >  			clock-names = "du.0";
> >  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> >  			resets = <&cpg 724>;
> > -			vsps = <&vspd0>;
> > +			vsps = <&vspd0 0>;
> >  			status = "disabled";
> >
> >  			ports {
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 2dc9caee8767..1a9e182b2b55 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -585,7 +585,14 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> >
> >  		vsps[j].crtcs_mask |= BIT(i);
> >
> > -		/* Store the VSP pointer and pipe index in the CRTC. */
> > +		/*
> > +		 * Store the VSP pointer and pipe index in the CRTC.
> > +		 *
> > +		 * FIXME: According to the DT bindings, the LIF pipe instance
> > +		 * index shall always be specified. For backward compatibility
> > +		 * with older DTB without any index specified, default it to 0
> > +		 * if cells < 1.
>
> No need for a FIXME, there's nothing to be fixed here. I would write
> this as
>
> 		 * If the second cell of the VSP specifier isn't
> 		 * present, default to 0 to remain compatible with older
> 		 * DT bindings.
>
> With this fixed here and in the commit message,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>

Thanks

> Note that Simon or Geert will likely ask you to split this patch in two,
> in which case I'll take the driver part in my tree.

I was not sure how to split this in facts.. Simon, Geert, would you
like a v2 with DT changes separated from the driver comment update?
(for the DT changes, one patch per SoC, or a single one?)

Thanks
   j

>
> > +		 */
> >  		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
> >  		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
> >  	}
>
> --
> Regards,
>
> Laurent Pinchart

--yt4wyxlnmndfww2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1fiHcACgkQcjQGjxah
VjxJBg/+OyiyMiX0o2eBDPbpMzuuug800NK7NJNkHwiGDCzk3VBXdsQF4oT4hkSF
A6SoRwGvx5Wl024MwiJPCiUXRdRfCN3OKMhPnUemvsD7PrlLBjD8wiml0eQsHHHr
D2hXdk9z2znogruZ0Zo+p/LElVHCBFwKRNppexlzCqF+Pd9tRCTqVEvPAaxHSyn0
PTlavm4AtB59NWlA7pZ2jh8j1t3cVNmok2CWeZ0SdedpdM08M4whnDOr3jqESY0Z
5TPlZOfSuMdHNpKdvwVRVf+O3lEaF40OgBmXE0klgmHdi8BCa8qO0G+/mPIYK8GB
b7NrQCFZGHeL8+xUZqB/0ekIslX8aoWIKUtuNhcJNW3GdlVuniTqIbbx4xLobIdQ
wLUb6pF8ndV6lVpxDmVFz7zIPOy0y/waHw/B+wkhV4bCKQBeNTNAOG3e8fCPgd6e
rTPVAZZ4aeWKtC+7YyNR9WpmG56XmeivQPWwaJ0B4sTTYlCoiPJD6Ls+W9SEufDZ
vuvEfU+7u7/pOYl1LdBXqAWylTLsCWfsT3XhvLC3Mh9CuMRymy/D79+8Z/sOHgt8
snSuhKWP5rxeyfboWJAI3+pvlNdptplmtfdRzH3cDnYd41fNhlSBh9h/oMfjQmhr
wL+IDb/lHHNDwOPZB9QrK5SpfIUbvfXB50QP55rj8lD55scyQ+E=
=e5Zv
-----END PGP SIGNATURE-----

--yt4wyxlnmndfww2i--
