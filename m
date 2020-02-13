Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8011915BEF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 14:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbgBMNJM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 08:09:12 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54945 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbgBMNJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 08:09:12 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C9A07C000C;
        Thu, 13 Feb 2020 13:09:10 +0000 (UTC)
Date:   Thu, 13 Feb 2020 14:11:52 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] max9286: balance v4l2_async refcnting
Message-ID: <20200213131152.glfpoxn6bwftmfil@uno.localdomain>
References: <20200212173727.19476-1-kieran.bingham+renesas@ideasonboard.com>
 <20200213102135.2179-1-kieran.bingham+renesas@ideasonboard.com>
 <8636f540-91fc-19ae-3e6a-7a9253c3c802@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="324itne7abuyc5vl"
Content-Disposition: inline
In-Reply-To: <8636f540-91fc-19ae-3e6a-7a9253c3c802@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--324itne7abuyc5vl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran!

On Thu, Feb 13, 2020 at 01:06:31PM +0000, Kieran Bingham wrote:
> On 13/02/2020 10:21, Kieran Bingham wrote:
> > When we add fwnodes to V4L2 notifiers through
> > v4l2_async_notifier_add_subdev they are stored internally in V4L2 core,
> > and have a reference count released upon any call to
> > v4l2_async_notifier_cleanup().
> >
> > Ensure that any source successfully added to a notifier gets its fwnode
> > reference count increased accordingly.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  drivers/media/i2c/max9286.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index f3311210a666..62615e6ab710 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -665,6 +665,11 @@ static int max9286_v4l2_async_register(struct max9286_priv *priv)
> >  			v4l2_async_notifier_cleanup(&priv->notifier);
> >  			return ret;
> >  		}
> > +
> > +		/* Balance the refernce counting handled through
>
> I've correctly moved this to a new line and fixed up the reference
> spelling :)

Good, thanks!

I think you could squash all of these in the next max9286 iteration!

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j
>
> > +		 * v4l2_async_notifier_cleanup()
> > +		 */
> > +		fwnode_handle_get(source->fwnode);
> >  	}
> >
> >  	priv->notifier.ops = &max9286_notify_ops;
> >
>

--324itne7abuyc5vl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl5FSxgACgkQcjQGjxah
Vjw9/RAAsLqlkbH7H3GeBApfmpGK8gZFufetOvTdTLNEk73y19EdsNJhOLiGwUUM
qKODbbEjqZK/Bf7wUgh0bFGqJ+x0a0abSb0dEekIEJifbwaJMoxMCM4WPklnBOuV
Lfha1EjbXr1Y3nnQ3VODAQpjKvj+H+ng3Ljb392IC3gLrMyoc+r/xbolvy5RQKSD
uUyC+pclIjQSvOFnaVGzPqFX8WS+Js4zXwPq17VesgcCoumBYs6rUcVUTmtfyO2V
rfm7kbOcca4MrIwV3ldXAEVEO7O+CRDMVRjMWj4TXo9BM5S0WtfIwLbldQ2ypByi
Tflbh4a/el60yczUwA9SVCo8z4bfUlToSpdcmy3xqzoNgUT8JbHjGrWRwn/OhUFc
SvyPKgnYluExDGMpc0G3yBti25wwn8l0tbKE1hfYm6qrSHX7NVZjU//MXD3vrPkR
3PlxGCv0GqzI7uMPVzCPgTV3VGdphyiWqoJZuzTa0N3kD5sv67DCqxGZDXh3tqvO
w9vN9mRa1a4NVeDUs5xv7Cvd6pp6vT6zGI9nJqI3C2XrbRWcr1KSPuyl2CLHHsjj
65kKWlw/YzqNa2dWwMyIkH6spBSt4bLqEISVb26+qhNMJAaroKzYGiNn7A6+mXR4
945+hIrjhCQICpwEC175Pw3x6kmGnW2APY1A1UsPcYwEcK1YDnc=
=gr/w
-----END PGP SIGNATURE-----

--324itne7abuyc5vl--
