Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6363F78290C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbjHUMas (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbjHUMas (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:30:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1ECCD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 05:30:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF23DB1;
        Mon, 21 Aug 2023 14:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692620969;
        bh=1mrJxLkC99gzp16A8v/85IwSqPWDBwEaC6o1axzK1+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jJdWTkmwg9PKH5oXH6XKlBpTf48/vROskAJCPWV/jQ4fPQIdDmV6GooTDKLWgESbm
         sC01DKCXwryFl13ZL95A3IVj/h9r8kfQXpCsewwREgvs3wTHS7C7ASl4T8kbxUfqHU
         UYS6x4FzGmU5ao8cZ85lFoiOalgW8it33qh4NZCU=
Date:   Mon, 21 Aug 2023 15:30:53 +0300
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
Subject: Re: [PATCH v3 2/2] drm: bridge: it66121: Simplify probe()
Message-ID: <20230821123053.GG10135@pendragon.ideasonboard.com>
References: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
 <20230818191817.340360-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230818191817.340360-3-biju.das.jz@bp.renesas.com>
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

On Fri, Aug 18, 2023 at 08:18:17PM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup
> for retrieving match data by i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2->v3:
>  * Added Rb tag from Andy.
> v1->v2:
>  * Dropped sentence for dropping local variable as it is integral part of
>    the patch.
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index ba95ad46e259..a80246ef4ffe 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1501,7 +1501,6 @@ static const char * const it66121_supplies[] = {
>  
>  static int it66121_probe(struct i2c_client *client)
>  {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>  	struct device_node *ep;
>  	int ret;
> @@ -1523,10 +1522,7 @@ static int it66121_probe(struct i2c_client *client)
>  
>  	ctx->dev = dev;
>  	ctx->client = client;
> -	if (dev_fwnode(&client->dev))
> -		ctx->info = of_device_get_match_data(&client->dev);
> -	else
> -		ctx->info = (const struct it66121_chip_info *) id->driver_data;
> +	ctx->info = i2c_get_match_data(client);
>  
>  	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>  	of_node_put(ep);

-- 
Regards,

Laurent Pinchart
