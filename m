Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA335464608
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 05:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346595AbhLAEnj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 23:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbhLAEnj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 23:43:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8E5C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 20:40:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0231AA15;
        Wed,  1 Dec 2021 05:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638333618;
        bh=8VN2j4uJzeEwURf5h3e5B07WTOsIM2x5UrMpvp3kHjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WO34FAJvjq8befW0H7YxdnU9eHf/N3NusxfPF4KAqQB6qwMLCUNck16TykouObJZj
         GYtidFM3FDzgJsHZxFsMs2ODdSpPAjERNOLTfnqbS49hcDrBG0/zrq/axlvrK4babD
         7GF+Q3TaYvHZiJcu7wlNcuu+/ZQznZIcWqSpedQQ=
Date:   Wed, 1 Dec 2021 06:39:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: rcar-du: mipi-dsi: Use
 devm_drm_of_get_bridge helper
Message-ID: <Yab8mQL7g/thyS00@pendragon.ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
 <20211130162513.2898302-3-kieran.bingham+renesas@ideasonboard.com>
 <163829113971.3059017.15142528562599981704@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <163829113971.3059017.15142528562599981704@Monstersaurus>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Tue, Nov 30, 2021 at 04:52:19PM +0000, Kieran Bingham wrote:
> Quoting Kieran Bingham (2021-11-30 16:25:13)
> > Instead of open coding the calls for
> >   drm_of_find_panel_or_bridge()
> >   devm_drm_panel_bridge_add()
> > 
> > use the devm_drm_of_get_bridge() helper directly.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > v2:
> >  - New patch
> > 
> >  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 19 ++++---------------
> >  1 file changed, 4 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > index 0a9f197ef62c..1dfe20d3d0f2 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > @@ -637,7 +637,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >                                         struct mipi_dsi_device *device)
> >  {
> >         struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> > -       struct drm_panel *panel;
> > +       struct device *dev = dsi->dev;
> >         int ret;
> >  
> >         if (device->lanes > dsi->num_data_lanes)
> > @@ -646,20 +646,9 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >         dsi->lanes = device->lanes;
> >         dsi->format = device->format;
> >  
> > -       ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> > -                                         &dsi->next_bridge);
> > -       if (ret) {
> > -               dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
> > -               return ret;
> > -       }
> > -
> > -       if (!dsi->next_bridge) {
> > -               dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
> > -               if (IS_ERR(dsi->next_bridge)) {
> > -                       dev_err(dsi->dev, "failed to create panel bridge\n");
> > -                       return PTR_ERR(dsi->next_bridge);
> > -               }
> > -       }
> > +       dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> > +       if (IS_ERR(dsi->next_bridge))
> > +               return PTR_ERR(dsi->next_bridge);
> 
> I did make a change here to make this:
> 
> 	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> 	if (IS_ERR(dsi->next_bridge)) {
> 		dev_err(dev, "failed to get next bridge\n");
> 		return PTR_ERR(dsi->next_bridge);
> 	}
> 
> But it seems I got out of sequence and saved out the wrong patch ;-(
> 
> If you think it's better with the error print, please add it while
> squashing, or if you really need, I can send an updated patch and
> retest.

I think an error message is useful, yes. I'll add it manually.

> >  
> >         /* Initialize the DRM bridge. */
> >         dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;

-- 
Regards,

Laurent Pinchart
