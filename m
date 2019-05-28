Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D342C6A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 14:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbfE1MgV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 08:36:21 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39455 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbfE1MgV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 08:36:21 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B75DB20008;
        Tue, 28 May 2019 12:36:16 +0000 (UTC)
Date:   Tue, 28 May 2019 14:37:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com
Subject: Re: [RFC 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190528123725.bqyutp4lxny4sraa@uno.localdomain>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-2-jacopo+renesas@jmondi.org>
 <20190511181618.GD13043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fballeotxoxi74yj"
Content-Disposition: inline
In-Reply-To: <20190511181618.GD13043@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fballeotxoxi74yj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sat, May 11, 2019 at 09:16:18PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, May 08, 2019 at 07:34:20PM +0200, Jacopo Mondi wrote:
> > Add device tree bindings documentation for the Renesas R-Car Display
> > Unit Color Management Module.
> >
> > CMM is the image enhancement module available on each R-Car DU video
> > channel.
>
> Not on all of them, V3M and V3H don't include a CMM module.
>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/display/renesas,cmm.txt          | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > new file mode 100644
> > index 000000000000..d7674417edb4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > @@ -0,0 +1,24 @@
> > +* Renesas R-Car Color Management Unit (CMM)
>
> It's called Color Management Module in the documentation (hence the CMM
> abbreviation)
>
> > +
> > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > +
> > +Required properties:
> > + - compatible: shall be:
> > +   - "renesas,cmm"
>
> There's a CMM in R-Car Gen2 with a different feature set, so I think you
> need at least two compatible strings. As far as I can tell SoC-specific
> compatible strings are required.

I assume you meant "SoC-specific compatible strings are NOT required" ?

Could you otherwise specify why do you think we need a per-SoC
compatible, since there are no platform specific data (for now, at
least, but considering the CMM seems identical in all SoCs I hardly
think we will have any in the near future).

Ack on the gen2/gen3 specific strings though.

Thanks
   j


>
> > +
> > + - reg: the address base and length of the memory area where CMM control
> > +   registers are mapped to.
> > +
> > + - clocks: phandle and clock-specifier pair to the CMM functional clock
> > +   supplier.
> > +
> > +Example:
> > +--------
> > +
> > +	cmm0: cmm@fea40000 {
> > +		compatible = "renesas,cmm";
> > +		reg = <0 0xfea40000 0 0x1000>;
> > +		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > +		clocks = <&cpg CPG_MOD 711>;
> > +		resets = <&cpg 711>;
> > +	};
>
> --
> Regards,
>
> Laurent Pinchart

--fballeotxoxi74yj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztK4UACgkQcjQGjxah
Vjz33Q/9FoUITutIDRdIGQMPkq9EzzRK0zC5+lIEWUD7GRR2fiNL8VhTaqCYhdCh
9LZu6/Zkf9zwA7jMGO8W2UU2atS/jPXP64/SorR827nqIL0c1tozbND0jX6FiZ6c
lNm8GqlBaXHTFWL21kZ/yMN10OycV5zGrZ4SL81qm5QZjt/+bo4WfaqpW41D/DCC
49dgNi7pMbMOXQOk2RyimF1fF4c1ARbRn3FAudIyCPfVyOiCOXvI5kbT/HgJodZZ
PmeIY0zbNiFjoPKtdb2ZRyaJp5v+XuCMNyvZtQL9d2TV0dT6W9iJC17an5mQobK0
o8IKBLUqqXlYJsGGp1lJYkduudFpCQMRAw1I9jALZpEaN5ql8qsPGDCFEciMBSVc
L6qMDmrbykk2U6l7hYP0PRLqVj7Zj8hQonYdSUtsx1ppftWASn8iYWtYj0MnXfWb
O4x00aOMCdRVq40NiktPk+OBuUFSFeH+j/1VbGdoFYtmdwiKgIo70Lwr5m4Frg6j
GA2GeHeRfR88Qv7VbKL+i7O6sz8BasOEbpdRckQU7ZfoDg7onqAh9VutgKDc2pZQ
qyf5H8liZweXQPnCF5U+gtkOHkBgiYHGrArm9jOr4lZZlzTRKhJZ/svTB2tgSddM
b7yYmVTbDXglqzJXewH6uBjYAuVVdkFEcJwfzqLLSCohJ8K7POI=
=dlIV
-----END PGP SIGNATURE-----

--fballeotxoxi74yj--
