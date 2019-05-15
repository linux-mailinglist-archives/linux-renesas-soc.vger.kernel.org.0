Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A72231F63A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 16:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfEOOLf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 10:11:35 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:45931 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfEOOLe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 10:11:34 -0400
X-Originating-IP: 95.125.122.220
Received: from uno.localdomain (220.red-95-125-122.dynamicip.rima-tde.net [95.125.122.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6FD6040006;
        Wed, 15 May 2019 14:11:27 +0000 (UTC)
Date:   Wed, 15 May 2019 16:12:20 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com
Subject: Re: [RFC 2/9] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190515141220.xgyfqt6iyfgdgqd7@uno.localdomain>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-3-jacopo+renesas@jmondi.org>
 <20190511182330.GF13043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z6pmujz2uiqv2u4r"
Content-Disposition: inline
In-Reply-To: <20190511182330.GF13043@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--z6pmujz2uiqv2u4r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
   thanks for the comments

On Sat, May 11, 2019 at 09:23:30PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, May 08, 2019 at 07:34:21PM +0200, Jacopo Mondi wrote:
> > Document the newly added 'cmms' property which accepts a list of phandle
> > and channel index pairs that point to the CMM units available for each
> > Display Unit output video channel.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > index aedb22b4d161..2ccf78bf9a18 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -44,6 +44,10 @@ Required Properties:
> >      instance that serves the DU channel, and the channel index identifies the
> >      LIF instance in that VSP.
> >
> > +  - cmms: A list of phandle and channel index tuples to the CMM modules
> > +    connected to DU channels. The phandle identifies the CMM instance that
> > +    serves the DU channel identified by the index.
>
> Do we need the index ?
>

Well, I struggled a bit at deciding if this was a good idea or not.
In the end I decided to use the index, as in this version, by just
providing the cmm phandle, the CMM gets enabled for the DU channel it
is associated to. It is true I could just enumerate them, and assign
the CMM corresponding to the first phandle to channel #0, the second
to channel #1 and so on, but in the (very unlikely?) case where a
developer what to enable CMM for, say, channel #0 and #2 but not #1,
this scheme would break, as I have then decided to have a mandatory
channel index to make the association stable. True that a CMM unit is
associated to a DU channel only, and I could derive this from the base
address or a custom property (like 'renesa,du-channel) in the CMM
device node, but this seems better handled here.

Now that I wrote this, I wonder if I actually need to know which
channel a CMM is associated to, or I could just go and enable the ones
listed in the 'cmms' property and that's it. Was this the idea behind
your question?

Thanks
   j
> It should also be noted that the property is optional for SoCs that
> don't have any CMM.
>
> > +
> >  Required nodes:
> >
> >  The connections to the DU output video ports are modeled using the OF graph
>
> Could you update the example ?
>
> --
> Regards,
>
> Laurent Pinchart

--z6pmujz2uiqv2u4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzcHkQACgkQcjQGjxah
Vjy+JQ/9FEb5x54/H4i7dRuYpUczE0yQ4MwpL8DQB4DhngerVGkrJH5kCcQQim0S
HVYdl8nrT8LUaiJNSXwqhjgDaERQ3qaX2BjRmA3yYtzYScTXvHRJ4KpnpglumlTS
/aT0fRnOnVHvPecw8QeIvjznIQi6STAwn8bJeVrCUykwCCpC6jCDAj2bIH6FMUDX
umOH4uyysHKyHz71hIICQL6HMm+t07OsQFc2LYrhC5KX0iV/MkC5C2ggV4QOuz3I
qB52Jn3kh3UON0ZH08ecEGC1fh20D+F4YoTuw4haAT9zxhHB8JLGuXc6bKZgUdqU
DsgbbkL+ULHos8+VRevuEgAkwSaASlM9lyY+J/3s3LRT8wD1DOF39E50zGgY8oZs
n5JZ9o5r7UdsvE/3L7PpG8nobpFKKqyVnuWQrRFQh2OdFZszofY7/c7u5s8bVRtH
rzZFmQtb/QxiUJUTydAzSKANkHrtx4a4wumKKITySOrZlOBJ3LP11MldjxcvmZez
wZe/ZK9pW/0uLOEtxjZdOjiis0VZHIpFB5CxtL8QAD9nDFK025Lf2e+PhSr+jI6G
lNYKa8ORd2Y26TGjZ5tc1qDmq0UIvCUOntT3OWMQ8rgYLL0YsDYo1EuCQgzoRzZP
ATOqh5ht9fw9e7BXXTCXPog2Fd07zS4WbDXKcNYXksoJComlAro=
=swdz
-----END PGP SIGNATURE-----

--z6pmujz2uiqv2u4r--
