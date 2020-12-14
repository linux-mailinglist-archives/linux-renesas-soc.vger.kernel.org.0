Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E032D95C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 11:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391938AbgLNKDz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 05:03:55 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:61467 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404657AbgLNKDt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 05:03:49 -0500
X-Originating-IP: 95.245.192.76
Received: from uno.localdomain (host-95-245-192-76.retail.telecomitalia.it [95.245.192.76])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AB5FB40007;
        Mon, 14 Dec 2020 10:03:05 +0000 (UTC)
Date:   Mon, 14 Dec 2020 11:03:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/9] drm: rcar-du: Release vsp device reference in all
 error paths
Message-ID: <20201214100315.jxcfeq6lilpugt2v@uno.localdomain>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201204220139.15272-3-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sat, Dec 05, 2020 at 12:01:32AM +0200, Laurent Pinchart wrote:
> Use drmm_add_action_or_reset() instead of drmm_add_action() to ensure
> the vsp device reference is released in case the function call fails.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Just in case... better safe than sorry

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index f6a69aa116e6..4dcb1bfbe201 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -364,7 +364,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>
>  	vsp->vsp = &pdev->dev;
>
> -	ret = drmm_add_action(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
> +	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
>  	if (ret < 0)
>  		return ret;
>
> --
> Regards,
>
> Laurent Pinchart
>
