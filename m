Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E365D5072D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 18:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242353AbiDSQTm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 12:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354554AbiDSQTk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 12:19:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB443B017
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 09:16:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-6-68-nat.elisa-mobile.fi [85.76.6.68])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C616D4A8;
        Tue, 19 Apr 2022 18:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650385012;
        bh=DSSuR404nj5QPF2HLXbaPbvb+6H1UHjlTg9Av0gzTCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UyEQF6OYB7SDlZr5gM9iy8tWpriyOJcHVN9oA+ng9M/s52hGMXgUjEuPi1kIg6jKA
         Zf/DXot+AlL12+Pel0F7//mqUnpiK5+nXjgkSRcABPyCkrzniyX9VxGTEZGCFjFtNV
         cjKjneBJWjtzvXaad0PZOOPv4aGsYnQgsyWxeBwo=
Date:   Tue, 19 Apr 2022 19:16:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Sam Ravnborg <sam@ravnborg.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on
 HPD interrupt
Message-ID: <Yl7gdMJayGqb20bW@pendragon.ideasonboard.com>
References: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Apr 19, 2022 at 03:24:53PM +0100, Biju Das wrote:
> Connector detection using poll method won't work in case of bridge
> attached to the encoder with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR, as
> the code defaults to HPD.
> 
> Enable DRM_BRIDGE_OP_HPD based on HPD interrupt availability, so that
> it will fall back to polling, if HPD is not available.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 668dcefbae17..b3f10c54e064 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1292,8 +1292,10 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  		goto err_unregister_cec;
>  
>  	adv7511->bridge.funcs = &adv7511_bridge_funcs;
> -	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> -			    | DRM_BRIDGE_OP_HPD;
> +	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +	if (adv7511->i2c_main->irq)
> +		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
> +
>  	adv7511->bridge.of_node = dev->of_node;
>  	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  

-- 
Regards,

Laurent Pinchart
