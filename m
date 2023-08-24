Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00A47877C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 20:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242919AbjHXS0l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 14:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238588AbjHXS0L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 14:26:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D83E58
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2023 11:26:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BB01191A;
        Thu, 24 Aug 2023 20:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692901485;
        bh=2AnQjB1urJZiJcrvpwSIzp0BpsDSTYuL7TtrrEOrk/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KeHAlGkczJR/792WYAFzBhwpG9ZUwgYLrK4fM/+jzLMPSOrgLOKi38YfkCHdQKgkb
         6Likf1WzIpotsadyflTxrAiYxdAXZ4FXuu04Jz7itGKnjihH/aHgNJojUTcJIX2slt
         RER/9x6iwmEQujdDWJHIDavyhFxqLC+TIWiz0GAk=
Date:   Thu, 24 Aug 2023 21:26:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <groeck@chromium.org>,
        Zhu Wang <wangzhu9@huawei.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <20230824182609.GA6477@pendragon.ideasonboard.com>
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
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

On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> The driver has an ID table, but it uses the wrong API for retrieving match
> data and that will lead to a crash, if it is instantiated by user space or
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I wonder, as the device can only be instantiated from OF, should we add

	depends on OF

to Kconfig, and drop the

#if IS_ENABLED(CONFIG_OF)

from the driver ?

> ---
> v2->v3:
>  * Updated commit header.
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 800555aef97f..6169db73d2fe 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1367,12 +1367,6 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
>  	kfree(anx78xx->edid);
>  }
>  
> -static const struct i2c_device_id anx78xx_id[] = {
> -	{ "anx7814", 0 },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(i2c, anx78xx_id);
> -
>  static const struct of_device_id anx78xx_match_table[] = {
>  	{ .compatible = "analogix,anx7808", .data = anx7808_i2c_addresses },
>  	{ .compatible = "analogix,anx7812", .data = anx781x_i2c_addresses },
> @@ -1389,7 +1383,6 @@ static struct i2c_driver anx78xx_driver = {
>  		  },
>  	.probe = anx78xx_i2c_probe,
>  	.remove = anx78xx_i2c_remove,
> -	.id_table = anx78xx_id,
>  };
>  module_i2c_driver(anx78xx_driver);
>  

-- 
Regards,

Laurent Pinchart
