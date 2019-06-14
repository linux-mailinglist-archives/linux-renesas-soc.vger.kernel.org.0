Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8FF4570A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 10:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfFNIPN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 04:15:13 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:56213 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfFNIPN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 04:15:13 -0400
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 399AA1BF207;
        Fri, 14 Jun 2019 08:14:53 +0000 (UTC)
Date:   Fri, 14 Jun 2019 10:15:52 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
 <20190607120304.GH7593@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="khgtppfahw6u47d7"
Content-Disposition: inline
In-Reply-To: <20190607120304.GH7593@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--khgtppfahw6u47d7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
   thanks for review

On Fri, Jun 07, 2019 at 03:03:04PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Jun 06, 2019 at 04:22:19PM +0200, Jacopo Mondi wrote:
> > Enable the GAMMA_LUT KMS property using the framework helpers to
> > register the proeprty and the associated gamma table size maximum size.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > index e6d3df37c827..c920fb5dba65 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -1207,6 +1207,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
> >  	    rcdu->cmms[swindex]) {
> >  		rcrtc->cmm = rcdu->cmms[swindex];
> >  		rgrp->cmms_mask |= BIT(hwindex % 2);
> > +
> > +		drm_mode_crtc_set_gamma_size(crtc, CMM_GAMMA_LUT_SIZE);
> > +		drm_crtc_enable_color_mgmt(crtc, 0, false, CMM_GAMMA_LUT_SIZE);
>
> This change looks good, but you also need to add support for legacy API.
> According to the function's documentation,
>
>  * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
>  * legacy &drm_crtc_funcs.gamma_set callback.
>

Drivers 'shuld' or drivers 'shall' ?
Isn't this required only to support the 'legacy APIs' ? Do we want that?

Thanks
   j

> >  	}
> >
> >  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> >
>
> --
> Regards,
>
> Laurent Pinchart

--khgtppfahw6u47d7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DV7gACgkQcjQGjxah
Vjz5Jg//aFLz0tKq8wZCeVMJnKKzD7XcpXLs8B+mK1kVLNxct1Exnl2h4SIPmr1s
/49MgCXJkN5/Aljw/y0WqifR4S4QvT5jFvuC/hc3Q1ggY0ycGxEICHSXXNyooV/a
VpxHLQpgtadlRtUWpdxIYErbD/o8idWN39UWueI4zRkDSrfWAbjWjsH/86hrAq3R
FMmfTaKbzddFytvX1Lh4x3gcKoO/64AvDwZoT/IMrVpINFZRTKw2sT7T7HeUFbh7
f94rAsGPrX/z0u+xcYucQoUeXLG4XCx3Xy95yzYdmNmLxwy5SW44QF9IVWM+cR6z
PaSfwATFHDRp5Shaq+kXhdPUlVHQTldm7McKw128xswE3oeChu1mFUseZxzJx6pi
jUL8aHE4FEdZ1C1fy6F7eaSf6Kha4uklxea5Fdl5gl/uRf9RK+5sJC+T6BaKy2J9
/fA2xnKXYbxeZabLGkeDp2mHSLv8w7fnv/AxcuW1O4+omnWzCMN364J5oUvfIs61
aRRi3T5lb7zi16Jcy88yjXnQXOFqNDx9+noFaJ0wv1nUOv4bX4h7l/q+PDd37onE
fdfxdEd9TsypZaVifSssDMRl1tkLFAgSkTtX1QmeJlqLz9Nfpo9YFeE4xxpiARcc
Zh6mYjr2gpp7336mA1agpxJgiibvViHLPgh3gBFq9bVdcOza5Hw=
=G1Ty
-----END PGP SIGNATURE-----

--khgtppfahw6u47d7--
