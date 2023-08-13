Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8470377AA66
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Aug 2023 19:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjHMR2N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Aug 2023 13:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjHMR2M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Aug 2023 13:28:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1860A170C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Aug 2023 10:27:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFF293D4;
        Sun, 13 Aug 2023 19:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691947557;
        bh=0R4RQpoQqRsaY0BEuTsv0cGwFiJ6qM7MiG81ty63ULY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RoW5uEUf7CxCYcrDuEYdoWqBsLdJVIFqjZqDYOdNWtpiI6aphZZgHKF+MRjWiAEZC
         nnn+PjGlRX8bZ765fjWXFQXc5X6JPi4b5xH3QrMcnIMpBnkFK5jIOfxB9Iwk2GnxN+
         lxtjVhAUAP2P2fZK0CyKAYSnrU82KdKNxGOUIz3g=
Date:   Sun, 13 Aug 2023 20:27:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Phong LE <ple@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Message-ID: <20230813172715.GA19398@pendragon.ideasonboard.com>
References: <20230813080520.65813-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813080520.65813-1-biju.das.jz@bp.renesas.com>
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

On Sun, Aug 13, 2023 at 09:05:20AM +0100, Biju Das wrote:
> The driver has OF match table, still it uses ID lookup table for
> retrieving match data. Replace ID look up with i2c_get_match_data()
> for retrieving OF/ACPI/I2C match data by adding similar match data for
> OF table.

Could you please explain in the commit message *why* this is desired ?

> While at it, drop unused local varibale id from probe().

I'd drop this sentence, that's not a "while at it" change but an
integral part of this patch.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  This patch is only compile tested.
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 466641c77fe9..a80246ef4ffe 100644
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
> @@ -1523,7 +1522,7 @@ static int it66121_probe(struct i2c_client *client)
>  
>  	ctx->dev = dev;
>  	ctx->client = client;
> -	ctx->info = (const struct it66121_chip_info *) id->driver_data;
> +	ctx->info = i2c_get_match_data(client);
>  
>  	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>  	of_node_put(ep);
> @@ -1609,13 +1608,6 @@ static void it66121_remove(struct i2c_client *client)
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
> @@ -1628,6 +1620,13 @@ static const struct it66121_chip_info it6610_chip_info = {
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
