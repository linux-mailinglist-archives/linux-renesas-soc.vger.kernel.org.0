Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65E1697638
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Feb 2023 07:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjBOGSj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 01:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBOGSi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 01:18:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC4C2A9A0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Feb 2023 22:18:37 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BA3E27C;
        Wed, 15 Feb 2023 07:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676441915;
        bh=lIC2L+gftRpP8lEiUF+76honibdcsHuUznoGrRYsaM4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GkyAPZLvp//akR4sHa4eaBt/guzyXcxkeMOqnpvMAnp3n0wXlyXHZv0I9vduW6+4x
         hagtmwmD8gnNXHAwjfj2krnr+zWZAvhajAqEQl2Q80Tvnf7VpS1Kjer93iIQPJ2cYH
         uSyda9wOPcucDWzwRSmeHW4HwugWndw//XaPNX/g=
Message-ID: <50c5113f-4389-dc40-73d8-1da5e6af23a9@ideasonboard.com>
Date:   Wed, 15 Feb 2023 08:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] drm: rcar-du: lvds: Call function directly instead of
 through pointer
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230214003736.18871-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230214003736.18871-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/02/2023 02:37, Laurent Pinchart wrote:
> When disabling the companion bridge in rcar_lvds_atomic_disable(),
> there's no need to go through the bridge's operations to call
> .atomic_disable(). Call rcar_lvds_atomic_disable() on the companion
> directly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 260ea5d8624e..61de18af62e6 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -582,8 +582,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>   
>   	/* Disable the companion LVDS encoder in dual-link mode. */
>   	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
> -		lvds->companion->funcs->atomic_disable(lvds->companion,
> -						       old_bridge_state);
> +		rcar_lvds_atomic_disable(lvds->companion, old_bridge_state);
>   
>   	pm_runtime_put_sync(lvds->dev);
>   }

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

