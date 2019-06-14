Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D33504574C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 10:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfFNISZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 04:18:25 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37557 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfFNISZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 04:18:25 -0400
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3EF2DE0005;
        Fri, 14 Jun 2019 08:18:07 +0000 (UTC)
Date:   Fri, 14 Jun 2019 10:19:13 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/20] drm: rcar-du: kms: Update CMM in atomic commit tail
Message-ID: <20190614081913.n5yxpotto5fzl7sh@uno.localdomain>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-21-jacopo+renesas@jmondi.org>
 <20190607120633.GI7593@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cvgh7guoqqbi6mcf"
Content-Disposition: inline
In-Reply-To: <20190607120633.GI7593@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--cvgh7guoqqbi6mcf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Fri, Jun 07, 2019 at 03:06:33PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Jun 06, 2019 at 04:22:20PM +0200, Jacopo Mondi wrote:
> > Update CMM settings at in the atomic commit tail helper method.
> >
> > The CMM is updated with new gamma values provided to the driver
> > in the GAMMA_LUT blob property.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 36 +++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 5a910a04e1d9..29a2020a46b5 100644
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
> > @@ -367,6 +368,38 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
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
> > +	    (old_state->gamma_lut->base.id !=
> > +	    crtc->state->gamma_lut->base.id))
> > +		cmm_config.lut.size = crtc->state->gamma_lut->length
> > +				    / sizeof(cmm_config.lut.table[0]);
>
> Do you need to call rcar_cmm_setup() at all in this case ?
>

Do you mean in case the lut.size field is set to 0 ?
I considered it useful when the CMM has to be re-enabled without
updateing the LUT table entries? It is not required in your opinion?

Thanks
   j

> > +	else
> > +		cmm_config.lut.size = 0;
> > +
> > +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> > +}
> > +
> >  static int rcar_du_atomic_check(struct drm_device *dev,
> >  				struct drm_atomic_state *state)
> >  {
> > @@ -409,6 +442,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
> >  			rcdu->dpad1_source = rcrtc->index;
> >  	}
> >
> > +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> > +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> > +
> >  	/* Apply the atomic update. */
> >  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >  	drm_atomic_helper_commit_planes(dev, old_state,
>
> --
> Regards,
>
> Laurent Pinchart

--cvgh7guoqqbi6mcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DWIEACgkQcjQGjxah
VjzwpQ//WMAXXg0Iqe84pOeR3FpXuQ4vkqCDArzdNFG5VcdNm4npoe6ZnjnSy7Ae
dPhB8oQVdcRmjmGbNvre5amsEmxONrfcGwiyzCJhoW8T28sztdv0LGzSoTHV6ejt
0xY2qG02Ek0UPOWwiCMzvfxCK+hJEbXEukD31pDOoVc1EoB3P7FEI1NLe5MJZVKD
Encdf+0v8nCnbrRG2oWCvBp3CJy5UuBLbu+EuAr6rawekdHYulJCjtolDqKQO7jr
fPMR5vfNm2MsWr7em2vdeI2O/zmPw5ixIWyauAz4Kzz2CC+7elXSFona/gMYpry0
xKKJso48zJ3NcZlwjDhXDtKuu5vE21r4qmvVmxGFFphxGdXIIudOWqIUo+0N+2Jr
fQKK7HpGK4XsG7Vv/lJkgDEntZYBRj99QqE+2u0fzbAryUv9Sl//RlHBxUZRGdl7
Vbp3QdCgJZvS7qGsR6s1dMi5lCfWbiP8k3nQGb7MaW1hWmjTeUSswSCdorOxWSfZ
y4SVNfGKP7g+gWaeBZidUrDiveV8hz8RaB3a84LTPC0UYd78VYJLHUwmgKGtd1Ti
ipIfzhCoY8UcHJn/3EiiuiQJMd4tiw6b/vkB79fdPp8lMTDlAaglS3uPSW1REsAc
OS0k2lCyh+L/sW0um5QPM8DeLUa3psCuDgzi0u043tLe1pqFnDk=
=jqfj
-----END PGP SIGNATURE-----

--cvgh7guoqqbi6mcf--
