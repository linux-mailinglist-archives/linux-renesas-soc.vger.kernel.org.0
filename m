Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36A5735E85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jun 2023 22:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjFSUch (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jun 2023 16:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFSUcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2023 16:32:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829C6FE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2023 13:32:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56EAD8D;
        Mon, 19 Jun 2023 22:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687206719;
        bh=GOqXUslFthZZ2S6DqkBYphyHABzWo2n3cYjSXAA+WHQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YtpeYCiaiBxNpKtbwziJIuPlW3tqviv/SflGrBgTE1GHLE2PI+EcM9oWafv3YnU79
         0G1Czr41GTDq6IMUJMPtwmZHbmak7nJcum4tTEkT3NfUrSyLkrSfiaOxkKbU7iU/Ww
         eI4p5IjIEVQkIlatv7a/U7LTyXlrObj+k0CBOTuI=
Date:   Mon, 19 Jun 2023 23:32:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge_connector: Handle
 drm_connector_init_with_ddc() failures
Message-ID: <20230619203233.GK10462@pendragon.ideasonboard.com>
References: <d2cf54b8bc216a2008a537f2a2696b6f77ba9296.1687177318.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d2cf54b8bc216a2008a537f2a2696b6f77ba9296.1687177318.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Mon, Jun 19, 2023 at 02:24:21PM +0200, Geert Uytterhoeven wrote:
> drm_connector_init_with_ddc() can fail, but the call in
> drm_bridge_connector_init() does not check that.  Fix this by adding
> the missing error handling.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 19ae4a177ac386b2..d2f5602ad4eb5953 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -317,7 +317,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_connector *connector;
>  	struct i2c_adapter *ddc = NULL;
>  	struct drm_bridge *bridge, *panel_bridge = NULL;
> -	int connector_type;
> +	int connector_type, ret;

With 'ret' declared on a separate line,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
>  	if (!bridge_connector)
> @@ -368,8 +368,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	drm_connector_init_with_ddc(drm, connector, &drm_bridge_connector_funcs,
> -				    connector_type, ddc);
> +	ret = drm_connector_init_with_ddc(drm, connector,
> +					  &drm_bridge_connector_funcs,
> +					  connector_type, ddc);
> +	if (ret) {
> +		kfree(bridge_connector);
> +		return ERR_PTR(ret);
> +	}
> +
>  	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
>  
>  	if (bridge_connector->bridge_hpd)

-- 
Regards,

Laurent Pinchart
