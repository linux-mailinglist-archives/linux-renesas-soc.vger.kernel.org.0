Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13029CA07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2019 09:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbfHZHWI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 03:22:08 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:51429 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfHZHWI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 03:22:08 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E3890240005;
        Mon, 26 Aug 2019 07:22:03 +0000 (UTC)
Date:   Mon, 26 Aug 2019 09:23:30 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
Message-ID: <20190826072330.ymx52yr35tcaafrh@uno.localdomain>
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
 <20190825140135.12150-3-jacopo+renesas@jmondi.org>
 <20190825180603.GB5436@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4nmcyf3hbnqv5z7t"
Content-Disposition: inline
In-Reply-To: <20190825180603.GB5436@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--4nmcyf3hbnqv5z7t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sun, Aug 25, 2019 at 09:06:03PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> How about changing the subject to "drm: rcar-du: Document DT backward
> compatibility" ?
>
> On Sun, Aug 25, 2019 at 04:01:35PM +0200, Jacopo Mondi wrote:
> > Exand comment in the 'vsps' parsing routine to specify why the LIF
>
> s/Exand/Expand/
>
> > channel index is defaulted to 0 in case the second cell of the property
>
> s/is defaulted to 0/defaults to 0/
>
> > is not specified.
>
> You could explain it here too :-)
>

Expand comment in the 'vsps' parsing routine to specify the LIF
channel index defaults to 0 in case the second cell of the property
is not specified to remain compatible with older DT bindings.

Could you take this in when applying this patch or want me to resend?

Thanks
  j


> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 2dc9caee8767..0d59f390de19 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -585,7 +585,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> >
> >  		vsps[j].crtcs_mask |= BIT(i);
> >
> > -		/* Store the VSP pointer and pipe index in the CRTC. */
> > +		/*
> > +		 * Store the VSP pointer and pipe index in the CRTC. If the
> > +		 * second cell of the 'vsps' specifier isn't present, default
> > +		 * to 0 to remain compatible with older DT bindings.
> > +		 */
> >  		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
> >  		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
> >  	}
>
> --
> Regards,
>
> Laurent Pinchart

--4nmcyf3hbnqv5z7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jiPIACgkQcjQGjxah
VjxMshAAr3ccgl1ODaTfliQFny+I2Lm5XYhTcvCU57WiEIL1h5lMtP3oE/AQO7/2
1LHHSA2s4fKlTQR02FdGbFyN1lDDz86U+NuAWsiMo4+OMe83cqimLMSLwJp6a7ri
mvmE3ihmPbDU7EAxnIG+o1GwZygdTgKmUPwflvV98WVS+cXk2oOAKwNFYH+NQG92
by6j1kzgPAQHHT9pw29Hj/e6uU73Is5UgKNlSlFBWaB7snJle9eNPg/bfoB0+F2x
sJgtbxm6QC8J9FlyOTJs9cDW/+2CkOJ9y6TyOZnMzQP/WyeNKBvC/U/e7eQy3lFM
YZuWKxnKyzHUtx8SIRMweu8QDJvi4HhewqLRM4KIcEGq4079iXLuis0r0/gtUocL
/jSEzwom+7C+jOmLMebAThYPZvw9eXRZl5gpBOeq0QrD+TltV6/SYyxLB1VLdV0d
2BNRvWSe53I0xYluxJ/aUt4JeF1WFV7GR9e/iIBif9aoGCinxg3wwyFqleEAkKAu
lcCwTzFulwlDh8rC+4Q+2byL56lvQLOmAxD9kafTwGHWRzraGcMKqN2MXrk6mFee
9djpnkfonTZN1EKhymWVbrCWTLrCldHf/wp9Kn/wgGJFuPncd4Do0hA7vYdZeSEB
3HJnh1/MGTBpjRUCKT0tuaE8bj0d1xExfYtN2GtBZM7i4zTb684=
=1RBW
-----END PGP SIGNATURE-----

--4nmcyf3hbnqv5z7t--
