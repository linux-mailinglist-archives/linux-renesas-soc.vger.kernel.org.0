Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4540B1A62BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 07:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgDMFyP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 01:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgDMFyP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 01:54:15 -0400
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C550AC0A3BE0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2020 22:54:14 -0700 (PDT)
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id A802A8048A;
        Mon, 13 Apr 2020 07:54:10 +0200 (CEST)
Date:   Mon, 13 Apr 2020 07:54:09 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/4] drm: bridge: adv7511: Split EDID read to a separate
 function
Message-ID: <20200413055409.GC6324@ravnborg.org>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409004610.12346-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409004610.12346-2-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=PDnjrxCc1ieJvtjYf9YA:9
        a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

On Thu, Apr 09, 2020 at 03:46:07AM +0300, Laurent Pinchart wrote:
> To prepare for the implementation of the DRM bridge connector
> operations, move EDID read out of adv7511_get_modes() to a separate
> function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The code do not check if drm_do_get_edid() return NULL.
But all functions called with the edid seems to handle a NULL edid well.
So thats OK.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 23 ++++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 87b58c1acff4..58d02e92b6b9 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -589,11 +589,10 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>   * ADV75xx helpers
>   */
>  
> -static int adv7511_get_modes(struct adv7511 *adv7511,
> -			     struct drm_connector *connector)
> +static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
> +				     struct drm_connector *connector)
>  {
>  	struct edid *edid;
> -	unsigned int count;
>  
>  	/* Reading the EDID only works if the device is powered */
>  	if (!adv7511->powered) {
> @@ -612,15 +611,25 @@ static int adv7511_get_modes(struct adv7511 *adv7511,
>  	if (!adv7511->powered)
>  		__adv7511_power_off(adv7511);
>  
> -
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -
>  	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
>  			       drm_detect_hdmi_monitor(edid));
>  
>  	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
>  
> +	return edid;
> +}
> +
> +static int adv7511_get_modes(struct adv7511 *adv7511,
> +			     struct drm_connector *connector)
> +{
> +	struct edid *edid;
> +	unsigned int count;
> +
> +	edid = adv7511_get_edid(adv7511, connector);
> +
> +	drm_connector_update_edid_property(connector, edid);
> +	count = drm_add_edid_modes(connector, edid);
> +
>  	kfree(edid);
>  
>  	return count;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
