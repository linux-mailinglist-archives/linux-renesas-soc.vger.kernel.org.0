Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA76E349E6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 02:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhCZBHl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Mar 2021 21:07:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60814 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhCZBHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Mar 2021 21:07:35 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A104443;
        Fri, 26 Mar 2021 02:07:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616720854;
        bh=y74YFIeevRlwE5RBrGfsHg2CMgmPqzDERAKQwOXXbc0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZyDBfJBQsNXY9WijS1gOvie5Oh77sykQAXa+bjfobuMfwy7swT/SFr+vRoAhWqbeE
         q3XKBxVndZctpeIM6HBbGsJ75q9w1KOTvWlCEYWQEK5fW/pltovSyq4v98NBPkegKa
         fP6pJpg5I4VkfeNr3i3OeYLLGreDDIfoZkJrtPaU=
Date:   Fri, 26 Mar 2021 03:06:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
Message-ID: <YF0zq3fPbxqx++5Z@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=VFwphwow7W_v7XHn+1dQHq0zwT-TyJyp9BaFgcs_t9VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=VFwphwow7W_v7XHn+1dQHq0zwT-TyJyp9BaFgcs_t9VQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Doug,

On Wed, Mar 24, 2021 at 03:44:39PM -0700, Doug Anderson wrote:
> On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> >
> > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > let the DRM bridge helpers handle chaining of operations.
> >
> > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > requires all components in the display pipeline to be represented by
> > bridges.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 +++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 1d1be791d5ba..c21a7f7d452b 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -124,6 +124,7 @@
> >   * @edid:         Detected EDID of eDP panel.
> >   * @refclk:       Our reference clock.
> >   * @panel:        Our panel.
> > + * @next_bridge:  The next bridge.
> 
> To make it easier for folks who don't work with DRM all day, could you
> somehow clarify which direction "next" is talking about. AKA the next
> "outward" (towards the sink) or the next "inward" (toward the source)?

Sure, I'll expand the comment.

> >   * @enable_gpio:  The GPIO we toggle to enable the bridge.
> >   * @supplies:     Data for bulk enabling/disabling our regulators.
> >   * @dp_lanes:     Count of dp_lanes we're using.
> > @@ -152,6 +153,7 @@ struct ti_sn_bridge {
> >         struct mipi_dsi_device          *dsi;
> >         struct clk                      *refclk;
> >         struct drm_panel                *panel;
> > +       struct drm_bridge               *next_bridge;
> 
> There's no reason to store the "panel" pointer anymore, right? It can
> just be a local variable in probe?

Good point, I'll fix that.

> > @@ -850,8 +856,6 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> >          */
> >         regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> >                            HPD_DISABLE);
> > -
> > -       drm_panel_prepare(pdata->panel);
> 
> Ugh, I guess conflicts with my EDID patch [1] which assumes that this
> function will directly turn the panel on. I'll see if I can find some
> solution...
> 
> [1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/

Would using the drm_bridge_connector help ? It's a helper that creates a
connector based on a chain of bridges. It implements the .get_modes()
connector operation (see drm_bridge_connector_get_modes()), based on the
.get_edid() operation provided by the bridges. As it has a full view of
the chain, it could enable bridges prior to reading the EDID, and then
power them off, including the panel-bridge.

-- 
Regards,

Laurent Pinchart
