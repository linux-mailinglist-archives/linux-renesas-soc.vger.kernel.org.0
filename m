Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA1478AEC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbjH1L0z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbjH1L0k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:26:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBAFC4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:26:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC49F4E6;
        Mon, 28 Aug 2023 13:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693221915;
        bh=GM+XJslD5h10LBk82PdayP/lt6/CuMxY/0uWWK/51EU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rOZWzH1gOxBnBeUesDaljUk2cVi2ppCOYmV+n/e1mZUzC8TWAK9H95VQrF51HBazu
         4M3dMOJ33yyE695ncwKrD/xQo2Xz7DO5WwytI3eP2V68uJyAKdXVRlG4NLs/hVB3sQ
         WJSiFiKH46mh6PEHABsDYgeZzuxoUk99Vyg0X3dY=
Date:   Mon, 28 Aug 2023 14:26:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node
 pointers
Message-ID: <20230828112646.GI14596@pendragon.ideasonboard.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Sat, Aug 26, 2023 at 08:19:01AM +0100, Biju Das wrote:
> Having conditional around the of_node pointers turns out to make driver
> code use ugly #ifdef and #if blocks. So drop the conditionals.
> 
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
>  include/drm/drm_bridge.h                           | 2 --

This should be split in two patches, one addressing drm_bridge.h (and
likely referencing the commit that dropped the conditionals in struct
device, as mentioned by Doug), and one for the drivers.

>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 6169db73d2fe..ad8241758896 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1231,9 +1231,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
>  
>  	mutex_init(&anx78xx->lock);
>  
> -#if IS_ENABLED(CONFIG_OF)
>  	anx78xx->bridge.of_node = client->dev.of_node;
> -#endif
>  
>  	anx78xx->client = client;
>  	i2c_set_clientdata(client, anx78xx);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c339fc85fd07..d49d5c03df3e 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -716,10 +716,8 @@ struct drm_bridge {
>  	struct drm_encoder *encoder;
>  	/** @chain_node: used to form a bridge chain */
>  	struct list_head chain_node;
> -#ifdef CONFIG_OF
>  	/** @of_node: device node pointer to the bridge */
>  	struct device_node *of_node;
> -#endif
>  	/** @list: to keep track of all added bridges */
>  	struct list_head list;
>  	/**

-- 
Regards,

Laurent Pinchart
