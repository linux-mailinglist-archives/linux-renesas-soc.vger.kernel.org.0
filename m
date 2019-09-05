Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12513AA09E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 12:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387964AbfIEK4o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 06:56:44 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41635 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731857AbfIEK4m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 06:56:42 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A2B11240017;
        Thu,  5 Sep 2019 10:56:35 +0000 (UTC)
Date:   Thu, 5 Sep 2019 12:58:09 +0200
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
Subject: Re: [PATCH v3 14/14] drm: rcar-du: Force CMM enablement when resuming
Message-ID: <20190905105809.iguzoqenlcriqegk@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-15-jacopo+renesas@jmondi.org>
 <20190827000517.GC5274@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hfnxteadwhag5ubx"
Content-Disposition: inline
In-Reply-To: <20190827000517.GC5274@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hfnxteadwhag5ubx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 27, 2019 at 03:05:17AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> (Question for Daniel below)
>
> Thank you for the patch.
>
> On Sun, Aug 25, 2019 at 03:51:54PM +0200, Jacopo Mondi wrote:
> > When resuming from system suspend, the DU driver is responsible for
> > reprogramming and enabling the CMM unit if it was in use at the time
> > the system entered the suspend state.
> >
> > Force the color_mgmt_changed flag to true if any of the DRM color
> > transformation properties was set in the CRTC state duplicated at
> > suspend time, as the CMM gets reprogrammed only if said flag is active in
> > the rcar_du_atomic_commit_update_cmm() method.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 018480a8f35c..6e38495fb78f 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/wait.h>
> >
> > +#include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_fb_cma_helper.h>
> >  #include <drm/drm_fb_helper.h>
> > @@ -482,6 +483,26 @@ static int rcar_du_pm_suspend(struct device *dev)
> >  static int rcar_du_pm_resume(struct device *dev)
> >  {
> >  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
> > +	struct drm_atomic_state *state = rcdu->ddev->mode_config.suspend_state;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < rcdu->num_crtcs; ++i) {
> > +		struct drm_crtc *crtc = &rcdu->crtcs[i].crtc;
> > +		struct drm_crtc_state *crtc_state;
> > +
> > +		crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
> > +		if (!crtc_state)
> > +			continue;
>
> Shouldn't you get the new state here ?
>

I have followed the drm_atomic_helper_suspend() call stack, that calls
drm_atomic_helper_duplicate_state() which then assign the crtct state
with drm_atomic_get_crtc_state(), where I read:

       	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
        ...
	state->crtcs[index].state = crtc_state;
	state->crtcs[index].old_state = crtc->state;
	state->crtcs[index].new_state = crtc_state;

So state or new_state for the purpose of getting back the crtc state
are the same if I'm not mistaken.

> > +
> > +		/*
> > +		 * Force re-enablement of CMM after system resume if any
> > +		 * of the DRM color transformation properties was set in
> > +		 * the state saved at system suspend time.
> > +		 */
> > +		if (crtc_state->gamma_lut || crtc_state->degamma_lut ||
> > +		    crtc_state->ctm)
>
> We don't support degamma_lut or crm, so I would drop those.

yeah, I added them as it was less code to change when we'll support
them. But for now they could be removed.

>
> With these small issues addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Shouldn't we however squash this with the previous patch to avoid
> bisection issues ?
>

Which one in your opinion?
"drm: rcar-du: kms: Update CMM in atomic commit tail" ?
It seems to me they do quite different things though..

Thanks
  j

> > +			crtc_state->color_mgmt_changed = true;
>
> Daniel, is this something that would make sense in the KMS core (or
> helpers) ?
>
> > +	}
> >
> >  	return drm_mode_config_helper_resume(rcdu->ddev);
> >  }
>
> --
> Regards,
>
> Laurent Pinchart

--hfnxteadwhag5ubx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1w6kEACgkQcjQGjxah
Vjw/ow//VHod5FHf7HpW3IVX+Y9nNCb2gUnLLQn3ogK+Bh1+QwkuX7aoEGWta/J3
WMZcgrtgq4uTo8ltszjDkUxProrGq7f24J5JQ2CJRPcs0GxW04wWx5KLBe4cuerV
/TUgyx3xv6Wj513ApwKF1uIzx7r41Cms9esjvpHknFLTmOsL2ig1dRuvjg5nY4JJ
YUcG3nO+zUwWMoSMt+KrUrTSvKMvdjjQ3ui0r9BsBV6RJGd00WXEOfi3bbwvPbZm
869/ZBDePiC29nccN3iD8zilZxygzhQ2hrqY/0aIID6vsAifqo8sw5p+xO3plet/
npLOwHfm7JriaoUQOZsWQDvAUdumQ63VOLiB2XmPuBkMnNvXz545v2/tMJisQlXP
rlfcyO39wVUVNvusp5iIzqmfxAfXFhWRPDtXqmtwfTFWA1CZehApDTvF2ZgZzJSw
GePRn9dkt+EE5hDfq/5ashOp8yWMdQCtiPrQ+ufkRfQzyWizR0k79UMUEuQHgKYh
kDveSbFpGpeWP3fU4HqtP7kfSOEM9N06UEtCij0U3/7+FUpqsPU63gDG6VVGWBoF
+sChRWL8rWibJVrFblWusSb9va1yqjAm4hfNcISlbaATRKH+HkCnByGViBnoOau4
u8Md+g2UtbDJRTNoSDfdpZnp+CyZ2+eNUkQJy/IL8HGUpHgpA6k=
=msos
-----END PGP SIGNATURE-----

--hfnxteadwhag5ubx--
