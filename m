Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D4F3B1622
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 10:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFWIsI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 04:48:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhFWIsI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 04:48:08 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7390C9B1;
        Wed, 23 Jun 2021 10:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624437950;
        bh=vdil5caf9R7y+sZCCneZTTgcfclZfdMpg+nhInQs7Vc=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=ULHV8yQfdAxEKAdH/t90iz16PyBGMq0f9ilNegrWIS+osdgoWjIBJoeYOaY0+O22g
         6+J49pQ+KiNXrN1l4D6hZGHKxXRsoDlI56KlI5+edxlUUy1J16EmTWlOv2QGpmMfrp
         BELta1AWAOQZEsUy0JBz/qWNqWb+Gi4e5nVujH/Q=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: lvds: Don't set bridge driver_private field
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210623030545.7627-1-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <afc45f0a-28c4-696a-51fb-70ff0fee1581@ideasonboard.com>
Date:   Wed, 23 Jun 2021 09:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623030545.7627-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 23/06/2021 04:05, Laurent Pinchart wrote:
> The drm_bridge.driver_private field is set but never used. Don't set it.

Doesn't seem harmful to keep it though.. but if it's not needed..

It looks like we get the driver context structure through container_of
with bridge_to_rcar_lvds(), as the bridge is embedded there so indeed
it's not needed.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 70dbbe44bb23..5909173b26eb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -919,7 +919,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	lvds->bridge.driver_private = lvds;
>  	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
>  	lvds->bridge.of_node = pdev->dev.of_node;
>  
> 
