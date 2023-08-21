Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5357478290A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbjHUMaO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbjHUMaN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:30:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695DEEA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 05:30:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BD24B1;
        Mon, 21 Aug 2023 14:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692620931;
        bh=Fquzj1T2o3bHPZSg6/rb4XphtFyGlZaw1xngTYaSB8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jPg8ozpKvlnFHeNjytrt9vV5xS1P11w8ug06UTUIX+lxl/XBWn72F6e4rKi8e4XPt
         QzhDeaUheFgA8gSeFotJXn05XNTqbSWJNEiQce517F9yExdKZAVGJMIA/V33oFLsqf
         Sl7dWss4eQSIOWRMFOK9U7xwfvRf3nYctDJbXR4I=
Date:   Mon, 21 Aug 2023 15:30:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Phong LE <ple@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm: bridge: it66121: Extend match support for OF
 tables
Message-ID: <20230821123015.GF10135@pendragon.ideasonboard.com>
References: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
 <20230818191817.340360-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230818191817.340360-2-biju.das.jz@bp.renesas.com>
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

On Fri, Aug 18, 2023 at 08:18:16PM +0100, Biju Das wrote:
> The driver has OF match table, still it uses ID lookup table for
> retrieving match data. Currently the driver is working on the
> assumption that a I2C device registered via OF will always match a
> legacy I2C device ID. The correct approach is to have an OF device ID
> table using of_device_match_data() if the devices are registered via OF.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2->v3:
>  * Removed fixes tag as nothing broken.
>  * Added Rb tag from Andy.
> v2:
>  * New patch.
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 466641c77fe9..ba95ad46e259 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1523,7 +1523,10 @@ static int it66121_probe(struct i2c_client *client)
>  
>  	ctx->dev = dev;
>  	ctx->client = client;
> -	ctx->info = (const struct it66121_chip_info *) id->driver_data;
> +	if (dev_fwnode(&client->dev))
> +		ctx->info = of_device_get_match_data(&client->dev);
> +	else
> +		ctx->info = (const struct it66121_chip_info *) id->driver_data;
>  
>  	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>  	of_node_put(ep);
> @@ -1609,13 +1612,6 @@ static void it66121_remove(struct i2c_client *client)
>  	mutex_destroy(&ctx->lock);
>  }
>  
> -static const struct of_device_id it66121_dt_match[] = {
> -	{ .compatible = "ite,it66121" },
> -	{ .compatible = "ite,it6610" },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, it66121_dt_match);
> -
>  static const struct it66121_chip_info it66121_chip_info = {
>  	.id = ID_IT66121,
>  	.vid = 0x4954,
> @@ -1628,6 +1624,13 @@ static const struct it66121_chip_info it6610_chip_info = {
>  	.pid = 0x0611,
>  };
>  
> +static const struct of_device_id it66121_dt_match[] = {
> +	{ .compatible = "ite,it66121", &it66121_chip_info },
> +	{ .compatible = "ite,it6610", &it6610_chip_info },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, it66121_dt_match);
> +
>  static const struct i2c_device_id it66121_id[] = {
>  	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
>  	{ "it6610", (kernel_ulong_t) &it6610_chip_info },

-- 
Regards,

Laurent Pinchart
