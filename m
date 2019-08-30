Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6B4A3D58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 19:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfH3R7p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 13:59:45 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:43765 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3R7o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 13:59:44 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3E995100004;
        Fri, 30 Aug 2019 17:59:37 +0000 (UTC)
Date:   Fri, 30 Aug 2019 20:01:09 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190830180108.mlei4wbfn3mktj23@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
 <20190826101550.GB5031@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cdwthwydolvsh24c"
Content-Disposition: inline
In-Reply-To: <20190826101550.GB5031@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--cdwthwydolvsh24c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Mon, Aug 26, 2019 at 01:15:50PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Mon, Aug 26, 2019 at 09:59:43AM +0200, Jacopo Mondi wrote:
> > On Mon, Aug 26, 2019 at 09:34:41AM +0200, Geert Uytterhoeven wrote:
> > > On Sun, Aug 25, 2019 at 3:50 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > > Add device tree bindings documentation for the Renesas R-Car Display
> > > > Unit Color Management Module.
> > > >
> > > > CMM is the image enhancement module available on each R-Car DU video
> > > > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >
> > > Thanks for your patch!
> > >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > > > @@ -0,0 +1,33 @@
> > > > +* Renesas R-Car Color Management Module (CMM)
> > > > +
> > > > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > > > +
> > > > +Required properties:
> > > > + - compatible: shall be one or more of the following:
> > > > +   - "renesas,cmm-r8a7795": for R8A7795 (R-Car H3) compatible CMM.
> > > > +   - "renesas,cmm-r8a7796": for R8A7796 (R-Car M3-W) compatible CMM.
> > > > +   - "renesas,cmm-r8a77965": for R8A77965 (R-Car M3-N) compatible CMM.
> > > > +   - "renesas,cmm-r8a77990": for R8A77990 (R-Car E3) compatible CMM.
> > > > +   - "renesas,cmm-r8a77995": for R8A77995 (R-Car D3) compatible CMM.
> > >
> > > Please use "renesas,<socype->-cmm" instead of "renesas,cmm-<soctype>".
> >
> > I actually copied it from the r-car gpio bindings, and I liked
> > cmm-<soctype> better. If you prefer I can change it though.
> >
> > > > +   - "renesas,rcar-gen3-cmm": for a generic R-Car Gen3 compatible CMM.
> > > > +   - "renesas,rcar-gen2-cmm": for a generic R-Car Gen2 compatible CMM.
> > > > +
> > > > +   When the generic compatible string is specified, the SoC-specific
> > > > +   version corresponding to the platform should be listed first.
> > > > +
> > > > + - reg: the address base and length of the memory area where CMM control
> > > > +   registers are mapped to.
> > > > +
> > > > + - clocks: phandle and clock-specifier pair to the CMM functional clock
> > > > +   supplier.
> > >
> > > Thinking about yaml validation:
> > >
> > > power-domains?
> > > resets?
> >
> > They should indeed be documented.
>
> How about converting this binding to yaml alreay ? It should be fairly
> simple.

I'm trying to, and I'm having my portion of fun time at it.

The definition of the schema itself seems good, but I wonder, is this
the first renesas schema we have? Because it seems to me the schema
validator is having an hard time to digest the examplea 'clocks' and
'power-domains' properties, which have 1 phandle and 2 specifiers and 1
phandle and 1 specifier respectively for Rensas SoCs.

In other words, if in the example I have:

 examples:
   - |
     cmm0: cmm@fea40000 {
          compatible = "renesas,r8a7796-cmm";
          reg = <0 0xfea40000 0 0x1000>;
          clocks = <&cpg 711>              <---- 1 phandle + 1 specifier
          resets = <&cpg 711>;
          power-domains = <&sysc>;         <---- 1 phandle
     };

The schema validation is good.

While if I use an actual example
   - |
     cmm0: cmm@fea40000 {
          compatible = "renesas,r8a7796-cmm";
          reg = <0 0xfea40000 0 0x1000>;
          clocks = <&cpg CPG_MOD 711>         <---- 1 phandle + 2 specifier
          resets = <&cpg 711>;
          power-domains = <&sysc R8A7796_PD_ALWAYS_ON>; <---- 1 phandle
     };                                                       + 1 specfier

The schema validation fails...
Error: Documentation/devicetree/bindings/display/renesas,cmm.example.dts:20.29-30 syntax error
FATAL ERROR: Unable to parse input tree

Are clocks properties with > 2 entries and power-domains properties with
> 1 entries supported?

Because from what I read here:
https://github.com/robherring/yaml-bindings/blob/master/schemas/clock/clock.yaml
"The length of a clock specifier is defined by the value of a #clock-cells
property in the clock provider node."

And that's expected, but is the examples actually validated against the
clock provider pointed by the phandle? Because in that case, if we had a
yaml schema for the cpg-mssr provider, it would indeed specify clock-cells=2.

Do we need a schema for cpg-mssr first, or am I doing something else
wrong?

Thanks
   j

>
> > > > +Example:
> > > > +--------
> > > > +
> > > > +       cmm0: cmm@fea40000 {
> > > > +               compatible = "renesas,cmm-r8a7796";
> > > > +               reg = <0 0xfea40000 0 0x1000>;
> > > > +               power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > > > +               clocks = <&cpg CPG_MOD 711>;
> > > > +               resets = <&cpg 711>;
> > > > +       };
>
> --
> Regards,
>
> Laurent Pinchart

--cdwthwydolvsh24c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1pZGQACgkQcjQGjxah
VjzlaA//WrMjIoh5mpirNuc1YnVXSvW7ZqWWQ6jp/mCaKrsImVVmqAmb9VEGJcfK
KUZvxF2xlp7pEtQfPbDJWVLvEX6dey+EeNoEK2S2RwCS4AYmPkrVe7mdLZ7rXGbh
HhVsi347kR5qeIjWazR/TmRNySank+gp/HKWvjaNguYP0LCK0U7Ybmh2GA5hjsIe
wFJnHfvt2rOxujXtF+G0rNerKSUAI7bQJYlfcKfHyFF4471Orid05CVr5vRue/n5
vTd9TlmFfp4Hzfv6aftHV32RWyWxNKXSKvlvy2ukH+/4Q0Cx/cAb1+PNJW8m3pEM
O3k972DSykDQmclu4z5Ge2Z9pxScSROL6ypCCbcbLek1G2KxVuhV1VfHSQ+YgKZk
nW9T602yRaJC/4ZbwH3Vu5OwudQXc282AL6WE/MwljwZ0mhvGG0JWSdBt0344z9v
P00CPvZFgVuXjWeF2JQp0YYza7rIch+TQi/OLiwX8t4grcaZV+KsgQbRWl6M/FHv
mAim2SiLt6VhPJ+1FkBNHwjKp6SAsuXO8BW5q5beXvJSXusw6gPVVv6V/YnQMHbI
Eswoex0Kp54mWuZv/ejyaWs7pSL7288qzDj+yCwbCkUwg3AHHvN/avhdXc2BAPyn
cNOulOiRbiCpU8e2zKidbqYcx1fyBq3qeuPvFzuhvWWXPEozD3U=
=t2Px
-----END PGP SIGNATURE-----

--cdwthwydolvsh24c--
