Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B947346B61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 22:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbhCWVwL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 17:52:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44372 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233684AbhCWVvk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 17:51:40 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B248CB1D;
        Tue, 23 Mar 2021 22:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616536297;
        bh=DhPUhvIplQwn5uEXEluALoP9uxyM3s9ihKpOZ/rIOFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=smznc+OwvmR1QkvFJPEVk7pjpscfZ+D7+lwFRzUq4+jkmFLPO37RzDv9z+qMGTvrK
         N5SXUusqHAr82QnQC1vsUOEFB8WwJlgMJ04LF1kv2OHhacCMZbqidbfJNCwFHzuk5s
         cmz2ck/JEQT0EJf+yURHgfreMkGaFtklNLWQOmec=
Date:   Tue, 23 Mar 2021 23:50:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
Message-ID: <YFpiv5hVgrsptWXG@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
 <161648364484.3012082.8827104507556270267@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <161648364484.3012082.8827104507556270267@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Tue, Mar 23, 2021 at 12:14:04AM -0700, Stephen Boyd wrote:
> Quoting Laurent Pinchart (2021-03-21 20:01:22)
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 1d1be791d5ba..c21a7f7d452b 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -418,8 +420,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> >         }
> >         pdata->dsi = dsi;
> >  
> > +       /* Attach the next bridge */
> > +       ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> > +                               &pdata->bridge, flags);
> > +       if (ret < 0) {
> > +               DRM_ERROR("failed to attach next bridge\n");
> 
> Can this be pushed into drm_bridge_attach() instead of in each caller?

Good idea.

> > +               goto err_dsi_detach;
> > +       }
> > +
> >         return 0;
> >  
> > +err_dsi_detach:
> > +       mipi_dsi_detach(dsi);
> >  err_dsi_attach:
> >         mipi_dsi_device_unregister(dsi);
> >  err_dsi_host:
> >  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > @@ -1245,6 +1249,14 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >                 return ret;
> >         }
> >  
> > +       pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev,
> > +                                                      pdata->panel);
> > +       if (IS_ERR(pdata->next_bridge)) {
> > +               DRM_ERROR("failed to create panel bridge\n");
> > +               ret = PTR_ERR(pdata->next_bridge);
> > +               return ret;
> 
> Just return PTR_ERR(pdata->next_bridge)?

Indeed. Bad copy and paste.

> > +       }
> > +
> >         dev_set_drvdata(&client->dev, pdata);

-- 
Regards,

Laurent Pinchart
