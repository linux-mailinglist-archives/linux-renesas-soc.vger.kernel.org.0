Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238112D96FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 12:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407556AbgLNLGW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 06:06:22 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52515 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407150AbgLNLGQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 06:06:16 -0500
X-Originating-IP: 95.245.192.76
Received: from uno.localdomain (host-95-245-192-76.retail.telecomitalia.it [95.245.192.76])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 59DCD1C0026;
        Mon, 14 Dec 2020 11:05:33 +0000 (UTC)
Date:   Mon, 14 Dec 2020 12:05:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 9/9] drm: rcar-du: Drop local encoder variable
Message-ID: <20201214110543.v3bt3ckz3bsen6c2@uno.localdomain>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-10-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201204220139.15272-10-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,
On Sat, Dec 05, 2020 at 12:01:39AM +0200, Laurent Pinchart wrote:

> The local encoder variable is an alias for &renc->base, and is only use
> twice. It doesn't help much, drop it, along with the
> rcar_encoder_to_drm_encoder() macro that is then unused.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.h | 2 --
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 49c0b27e2f5a..9a565bd3380d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -61,7 +61,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 struct device_node *enc_node)
>  {
>  	struct rcar_du_encoder *renc;
> -	struct drm_encoder *encoder;
>  	struct drm_bridge *bridge;
>  	int ret;
>
> @@ -108,12 +107,11 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>
>  	rcdu->encoders[output] = renc;
>  	renc->output = output;
> -	encoder = rcar_encoder_to_drm_encoder(renc);
>
>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
>  		enc_node, output);
>
> -	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> +	ret = drm_encoder_init(&rcdu->ddev, &renc->base, &rcar_du_encoder_funcs,
>  			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
>  		goto error;
> @@ -127,7 +125,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	 * Attach the bridge to the encoder. The bridge will create the
>  	 * connector.
>  	 */
> -	return drm_bridge_attach(encoder, bridge, NULL, 0);
> +	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
>
>  error:
>  	kfree(renc);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> index df9be4524301..73560563fb31 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> @@ -22,8 +22,6 @@ struct rcar_du_encoder {
>  #define to_rcar_encoder(e) \
>  	container_of(e, struct rcar_du_encoder, base)
>
> -#define rcar_encoder_to_drm_encoder(e)	(&(e)->base)
> -
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node);
> --
> Regards,
>
> Laurent Pinchart
>
