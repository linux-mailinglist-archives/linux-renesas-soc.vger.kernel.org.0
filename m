Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527DE99FB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 21:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403988AbfHVTSD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 15:18:03 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52417 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403983AbfHVTSC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 15:18:02 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 52EAEC0007;
        Thu, 22 Aug 2019 19:17:56 +0000 (UTC)
Date:   Thu, 22 Aug 2019 21:19:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20190822191925.dnbdihnt3ole2nqx@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-20-jacopo+renesas@jmondi.org>
 <20190820184215.GM10820@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3qbfvdcd762hsr7u"
Content-Disposition: inline
In-Reply-To: <20190820184215.GM10820@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3qbfvdcd762hsr7u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 20, 2019 at 09:42:15PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Sat, Jul 06, 2019 at 04:07:46PM +0200, Jacopo Mondi wrote:
> > Update CMM settings at in the atomic commit tail helper method.
> >
> > The CMM is updated with new gamma values provided to the driver
> > in the GAMMA_LUT blob property.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 35 +++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index b79cda2f5531..f9aece78ca5f 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/wait.h>
> >
> > +#include "rcar_cmm.h"
> >  #include "rcar_du_crtc.h"
> >  #include "rcar_du_drv.h"
> >  #include "rcar_du_encoder.h"
> > @@ -287,6 +288,37 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> >   * Atomic Check and Update
> >   */
> >
> > +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> > +					     struct drm_crtc_state *old_state)
> > +{
> > +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > +	struct rcar_cmm_config cmm_config = {};
> > +
> > +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> > +		return;
> > +
> > +	if (!crtc->state->gamma_lut) {
> > +		cmm_config.lut.enable = false;
> > +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > +
> > +		return;
> > +	}
> > +
> > +	cmm_config.lut.enable = true;
> > +	cmm_config.lut.table = (struct drm_color_lut *)
> > +			       crtc->state->gamma_lut->data;
> > +
> > +	/* Set LUT table size to 0 if entries should not be updated. */
> > +	if (!old_state->gamma_lut ||
> > +	    old_state->gamma_lut->base.id != crtc->state->gamma_lut->base.id)
> > +		cmm_config.lut.size = crtc->state->gamma_lut->length
> > +				    / sizeof(cmm_config.lut.table[0]);
> > +	else
> > +		cmm_config.lut.size = 0;
> > +
> > +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > +}
> > +
> >  static int rcar_du_atomic_check(struct drm_device *dev,
> >  				struct drm_atomic_state *state)
> >  {
> > @@ -329,6 +361,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >  			rcdu->dpad1_source = rcrtc->index;
> >  	}
> >
> > +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> > +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> > +
>
> I think this looks good overall, but I wonder if we couldn't simplify
> the CMM driver suspend/resume and LUT caching due to config while not
> enabled by handling it on the DU side. I have a rework on the commit
> tail handler in progress, I'll think how this could be done. For now I
> think you can leave it as is.
>

Does this mean I have your R-b tag ? :)

Thanks
  j

> >  	/* Apply the atomic update. */
> >  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >  	drm_atomic_helper_commit_planes(dev, old_state,
>
> --
> Regards,
>
> Laurent Pinchart

--3qbfvdcd762hsr7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1e6r0ACgkQcjQGjxah
VjwIoBAAnnFT2D1f5giY7bIuwi3DtCaXzY6/kEPbXXSqxroLRiNDRATdQXBA+HVr
Z212k0ILVX4BkLQcksmd6ZXdac9TxS2y6/ejFF6474NE8LJ5TpkDQzSzgSMb1Y0F
LrJOEw7xVImUIDt5Lo7tpFoyT3KdMRgYbpGYFDVRvhxGsApsmDz8KIA/QTrw+PTB
P74B9kKM5V0FxMbSaTJotxiyqY5J1mQtwCNGdX2ud8rZc1AC1uhKVOxtYLTLPiIp
PIOTWPimzIpVmFN7GLQDfObLARsrN6kfnqk3SZheOJCA7AG1YGoW8nza7iX/cWkl
Dn+Tvs955Czre7c+z1HOAo/bc6Ch3Ejux7sMtkF1b26Pgvrb3u5GSiByf+4nnfk1
uGox2IFORT0pfKHDnqDfQwVYD3vWrOBa6fZvsv1+rk/WldQrinYeDf9HPNG1KH+J
AJBrEbKMmvjJvQNWNOGGdyuHngQtfMPNFQ980olWNhAj5Rgl44dnY0/kIgOXuEN+
St996VyO46itGP7zygleeEtmWIFryzbDymhBTUaahhL0WUyUutNauZ6KZ7iwNQzY
FVZzaq8ZtjRifFiwy8F924rJd+VdNwjDHaY8lmEmr18m3EWoL73sva3qn/AZ57cV
CWzAE/kTGqiyxfMRSnIM5bU4GXMdpg5sBnWzHoftuLI/i5xjTLw=
=IuZt
-----END PGP SIGNATURE-----

--3qbfvdcd762hsr7u--
