Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8C97828B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbjHUMMw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbjHUMMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:12:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EEE90
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 05:12:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BED626D5;
        Mon, 21 Aug 2023 14:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692619891;
        bh=wQ56MmYc4s3k/U5yMVZgSxazW0HtmwTXQNoLH5iCaCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KEeNqNqE7S43KBNGEFF7cgotD5k5tevDKZwmWDhM0B9ByEpD/2Ep8IBZpl2AXInYA
         pXv64BZwx4vVu7N+pyBFZsQMfbk2+o9AxOYsr9UcfJPZnWSMgQIA++jNd8jZaiPnIY
         l4cM8JHTlEjVmMUAN/aRCSb9q+eENfiOIKG05YL8=
Date:   Mon, 21 Aug 2023 15:12:54 +0300
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
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Message-ID: <20230821121254.GC10135@pendragon.ideasonboard.com>
References: <20230813080520.65813-1-biju.das.jz@bp.renesas.com>
 <20230813172715.GA19398@pendragon.ideasonboard.com>
 <OS0PR01MB592291F889F1BE13981169D78617A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592291F889F1BE13981169D78617A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Aug 14, 2023 at 09:06:46AM +0000, Biju Das wrote:
> Hi Laurent Pinchart,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH] drm: bridge: it66121: Extend match support for OF
> > tables
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Aug 13, 2023 at 09:05:20AM +0100, Biju Das wrote:
> > > The driver has OF match table, still it uses ID lookup table for
> > > retrieving match data. Replace ID look up with i2c_get_match_data()
> > > for retrieving OF/ACPI/I2C match data by adding similar match data for
> > > OF table.
> > 
> > Could you please explain in the commit message *why* this is desired ?
> 
> Currently the driver is working on the assumption that a
> I2C device registered via OF will always match a legacy
> I2C device ID. The correct approach is to have an
> OF device ID table using of_device_match_data()/device_match_data()/
> I2c_get_match_data() if the devices are registered via OF.
> 
> Basically, it is fixing
> 
> Fixes: 9a9f4a01bdae ("drm: bridge: it66121: Move VID/PID to new it66121_chip_info structure")
> 
> But i2c_get_match_data() is recently introduced.

Thanks for the explanation. Could you record this in the commit message
(if not done already) ?

It would be really nice if we could drop the i2c_device_id...

> Maybe one patch with fixes tag using of_device_get_match_data and
> ID lookup for retrieving match data from OF/I2C tables
> 
> and another patch to simplify using i2c_get_match_data() by replacing
> of_device_get_match_data and ID lookup.

I'm fine with a single patch.

> > > While at it, drop unused local varibale id from probe().
> > 
> > I'd drop this sentence, that's not a "while at it" change but an integral
> > part of this patch.
> 
> Agreed.
> 
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  This patch is only compile tested.
> > > ---
> > >  drivers/gpu/drm/bridge/ite-it66121.c | 17 ++++++++---------
> > >  1 file changed, 8 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ite-it66121.c
> > > b/drivers/gpu/drm/bridge/ite-it66121.c
> > > index 466641c77fe9..a80246ef4ffe 100644
> > > --- a/drivers/gpu/drm/bridge/ite-it66121.c
> > > +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> > > @@ -1501,7 +1501,6 @@ static const char * const it66121_supplies[] = {
> > >
> > >  static int it66121_probe(struct i2c_client *client)  {
> > > -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> > >  	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> > >  	struct device_node *ep;
> > >  	int ret;
> > > @@ -1523,7 +1522,7 @@ static int it66121_probe(struct i2c_client
> > > *client)
> > >
> > >  	ctx->dev = dev;
> > >  	ctx->client = client;
> > > -	ctx->info = (const struct it66121_chip_info *) id->driver_data;
> > > +	ctx->info = i2c_get_match_data(client);
> > >
> > >  	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
> > >  	of_node_put(ep);
> > > @@ -1609,13 +1608,6 @@ static void it66121_remove(struct i2c_client *client)
> > >  	mutex_destroy(&ctx->lock);
> > >  }
> > >
> > > -static const struct of_device_id it66121_dt_match[] = {
> > > -	{ .compatible = "ite,it66121" },
> > > -	{ .compatible = "ite,it6610" },
> > > -	{ }
> > > -};
> > > -MODULE_DEVICE_TABLE(of, it66121_dt_match);
> > > -
> > >  static const struct it66121_chip_info it66121_chip_info = {
> > >  	.id = ID_IT66121,
> > >  	.vid = 0x4954,
> > > @@ -1628,6 +1620,13 @@ static const struct it66121_chip_info it6610_chip_info = {
> > >  	.pid = 0x0611,
> > >  };
> > >
> > > +static const struct of_device_id it66121_dt_match[] = {
> > > +	{ .compatible = "ite,it66121", &it66121_chip_info },
> > > +	{ .compatible = "ite,it6610", &it6610_chip_info },
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, it66121_dt_match);
> > > +
> > >  static const struct i2c_device_id it66121_id[] = {
> > >  	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
> > >  	{ "it6610", (kernel_ulong_t) &it6610_chip_info },

-- 
Regards,

Laurent Pinchart
