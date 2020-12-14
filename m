Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720F32D9628
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 11:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391257AbgLNKLn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 05:11:43 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37393 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729091AbgLNKLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 05:11:43 -0500
X-Originating-IP: 95.245.192.76
Received: from uno.localdomain (host-95-245-192-76.retail.telecomitalia.it [95.245.192.76])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0FCEAE000C;
        Mon, 14 Dec 2020 10:10:58 +0000 (UTC)
Date:   Mon, 14 Dec 2020 11:11:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 3/9] drm: rcar-du: Drop unneeded encoder cleanup in error
 path
Message-ID: <20201214101108.kgdxqmskgz24lfys@uno.localdomain>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201204220139.15272-4-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sat, Dec 05, 2020 at 12:01:33AM +0200, Laurent Pinchart wrote:
> The encoder->name field can never be non-null in the error path, as that
> can only be possible after a successful call to
> drm_simple_encoder_init(). Drop the cleanup.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 2d40da98144b..0edce24f2053 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -124,11 +124,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	}
>
>  done:
> -	if (ret < 0) {
> -		if (encoder->name)
> -			encoder->funcs->destroy(encoder);

This is probably worth a Fixes tag, as accessing encoder->func if
drm_simple_encoder_init() has not completed might lead to a NULL
pointer dereference.


Apart from this, patch looks good
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> +	if (ret < 0)
>  		devm_kfree(rcdu->dev, renc);
> -	}
>
>  	return ret;
>  }
> --
> Regards,
>
> Laurent Pinchart
>
