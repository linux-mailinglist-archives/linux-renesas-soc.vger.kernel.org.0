Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4BD37C0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 20:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfFFSRo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 14:17:44 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36249 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfFFSRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 14:17:44 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C60521BF209;
        Thu,  6 Jun 2019 18:17:30 +0000 (UTC)
Date:   Thu, 6 Jun 2019 20:18:36 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/20] clk: renesas: r8a7795: Add CMM clocks
Message-ID: <20190606181836.jwvboktulgfp4rqh@uno.localdomain>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-6-jacopo+renesas@jmondi.org>
 <20190606165857.GL12825@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="24eq63pjbemb53vd"
Content-Disposition: inline
In-Reply-To: <20190606165857.GL12825@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--24eq63pjbemb53vd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Jun 06, 2019 at 07:58:57PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Jun 06, 2019 at 04:22:05PM +0200, Jacopo Mondi wrote:
> > Add clock definitions for CMM units on Renesas R-Car Gen3 H3.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/clk/renesas/r8a7795-cpg-mssr.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > index 86842c9fd314..e8f1d5ec0455 100644
> > --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > @@ -200,6 +200,10 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
> >  	DEF_MOD("ehci0",		 703,	R8A7795_CLK_S3D4),
> >  	DEF_MOD("hsusb",		 704,	R8A7795_CLK_S3D4),
> >  	DEF_MOD("hsusb3",		 705,	R8A7795_CLK_S3D4),
> > +	DEF_MOD("cmm3",			 708,	R8A7795_CLK_S2D1),
> > +	DEF_MOD("cmm2",			 709,	R8A7795_CLK_S2D1),
> > +	DEF_MOD("cmm1",			 710,	R8A7795_CLK_S2D1),
> > +	DEF_MOD("cmm0",			 711,	R8A7795_CLK_S2D1),
>
> Could you try to get confirmation that S2D1 is the right parent (for all
> SoCs) ? Apart from that,

It's not.. for r8a7799x it's S1D1, the same parent as the DU clock.
The patches in the BSP use the same clocks I have used here, so I
assume at least that part is correct.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks
   j

>
> >  	DEF_MOD("csi21",		 713,	R8A7795_CLK_CSI0), /* ES1.x */
> >  	DEF_MOD("csi20",		 714,	R8A7795_CLK_CSI0),
> >  	DEF_MOD("csi41",		 715,	R8A7795_CLK_CSI0),
>
> --
> Regards,
>
> Laurent Pinchart

--24eq63pjbemb53vd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlz5WPwACgkQcjQGjxah
VjwseQ/+J+84+R1mHAiH/rFo1WaNcyE9JgiFNOwoGPK0cBxQI1gDdRlnk+TlmHeA
msrJIC7gbxTYcFu+4Ysg2SSqxOpFL3xim6SJk96cFWSgWsa7XieLbFr6zx7oOTIC
BK77O+4iZza+3mQQIIaGJ3tFxpu1qPcFOlivOh5bRUjocB2Yox3UYNuIcER+ilMx
O5bNlOGP4Xjh2hj3jjWWbpANgAjzKEavLA/NrK+O2oqPiNvBLjLqpFQtYTs/ihBJ
FKkrFHogJFDBIBzB9FjbA5keKDO+J+K3JI2IHVs6DBbWlha8swYXuEahwalmPRDv
rGISe7xUdFf7kJGal1nfMd3O5ZTDH+TsY1gZ08UIqL32to+f9htfw2wgXdmIUQG4
ZVNFQ3pwKGco6PacHnhNo5FA9kjYKs2akhVzgdt0R3gotaQ73AZFE+fq3ImXJdIT
Eikzi2c621wkm//iN+yxj4t9btWI3cT7zBJfUzpBQ9jyCPyV+utJEJ/9roQibwOZ
Mh5L2LAHkFOBiV90w4VIc/6exH1CyS0Dly5VaV0dyb7/l9Yb9pzwkZCf8Upo4IKX
ibND/505eabPgC73vkSmwj9Hnbr64VASX+AbCTdxGlE+CAGt9uF+1u6OpN00W0VC
TK62LY/l8oEdXoA7W9JpxUG/TW0IqwzgZVavC68fRG60MsGm+mY=
=6gym
-----END PGP SIGNATURE-----

--24eq63pjbemb53vd--
