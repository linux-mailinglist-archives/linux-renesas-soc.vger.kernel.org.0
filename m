Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A599E4EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 11:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbfH0Jxp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 05:53:45 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41897 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfH0Jxo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 05:53:44 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2CD171C0005;
        Tue, 27 Aug 2019 09:53:36 +0000 (UTC)
Date:   Tue, 27 Aug 2019 11:55:08 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
Message-ID: <20190827095508.lpp74fh5capobvcf@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org>
 <20190826224337.GL5031@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j65b5dlwaxdtql3o"
Content-Disposition: inline
In-Reply-To: <20190826224337.GL5031@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--j65b5dlwaxdtql3o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 27, 2019 at 01:43:37AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> Should you squash this with the patches that add CMM units to the other
> SoCs ?

I don't know, I guess it depends on Geert's preferences. Geert?


>
> On Sun, Aug 25, 2019 at 03:51:43PM +0200, Jacopo Mondi wrote:
> > Add CMM units to Renesas R-Car M3-W device tree and reference them from
> > the Display Unit they are connected to.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Apart from the issue pointed out by Geert,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 ++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > index 3dc9d73f589a..8d78e1f98a23 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -2613,6 +2613,30 @@
> >  			renesas,fcp = <&fcpvi0>;
> >  		};
> >
> > +		cmm0: cmm@fea40000 {
> > +			compatible = "renesas,cmm-r8a7796";
> > +			reg = <0 0xfea40000 0 0x1000>;
> > +			clocks = <&cpg CPG_MOD 711>;
> > +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +			resets = <&cpg 711>;
> > +		};
> > +
> > +		cmm1: cmm@fea50000 {
> > +			compatible = "renesas,cmm-r8a7796";
> > +			reg = <0 0xfea50000 0 0x1000>;
> > +			clocks = <&cpg CPG_MOD 710>;
> > +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +			resets = <&cpg 710>;
> > +		};
> > +
> > +		cmm2: cmm@fea60000 {
> > +			compatible = "renesas,cmm-r8a7796";
> > +			reg = <0 0xfea60000 0 0x1000>;
> > +			clocks = <&cpg CPG_MOD 709>;
> > +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +			resets = <&cpg 709>;
> > +		};
> > +
> >  		csi20: csi2@fea80000 {
> >  			compatible = "renesas,r8a7796-csi2";
> >  			reg = <0 0xfea80000 0 0x10000>;
> > @@ -2766,6 +2790,7 @@
> >  			status = "disabled";
> >
> >  			vsps = <&vspd0 &vspd1 &vspd2>;
> > +			cmms = <&cmm0 &cmm1 &cmm2>;
> >
> >  			ports {
> >  				#address-cells = <1>;
>
> --
> Regards,
>
> Laurent Pinchart

--j65b5dlwaxdtql3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1k/fsACgkQcjQGjxah
Vjxiaw//Z5HMC2bGdbZRpCxKiWUOZRLP1eFu80P2Jh/8TSVhc9CSIK5I95E4e1uJ
JfbbyuJwHRir1zIpQaEOI0xbCsA3iTgYEaAnsuM2cc39zqhKQ1XwaT3BS22/6A2v
zgav3dt2QH3n+XIKzapRAbTSHwXupoxEkuNBERTX6kPIxQCHW4SwKTvsJlc0bXGK
CvoWwg7pUi5+92WAQOuEkCrRIZ9sw3p+714MQqtEg6R8+FpkvmsnGFlWvEWr4uff
qs5nqLda8rkCGn+l3Z+wF2cOdV8t1TAApcBZIMPQTjGbLFqe1wXCsJGKuEdrapoX
UBVfMGieG3fML6gcxHaJN8z9FM+GTz/VJhjWYdvR2PMExJmmJp+2XFW5UnwJ/wsQ
kOjjoLNvo0ndZ64jbmsHoXZvkgORPuMsJXGzH4THPRLPInM7oAoCtPlybWVq2iP8
sy1TLvwXNUP/hHlv7GXbj+Im8uvwfmvRaIZEQqoXTDP4rXtIIDWsGgsUaZqZrpQr
f5k+cTSGhWHUZoTxNAZXykg2cSDLbQT1svfnJHQz9oEHaxapLTOfF2HFltAY+iCV
18vwyY1QytTIcyMC3EbW1eR+r+JvJdKk/TCzBkUV74PHWocxBLah0S2+DqApTGEu
VdDWLqs82AHrz3MvGvkTwf7A4gMIuJRPsXOoeWqgeWlinds78RA=
=s54F
-----END PGP SIGNATURE-----

--j65b5dlwaxdtql3o--
