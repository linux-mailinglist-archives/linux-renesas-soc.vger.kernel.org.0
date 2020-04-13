Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860201A6B92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 19:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732964AbgDMRlM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 13:41:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53832 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732943AbgDMRlJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 13:41:09 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA07B24B;
        Mon, 13 Apr 2020 19:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586799661;
        bh=7GGnxXz596xE6qXJCVCk00KXP0fqWA8iM/U7mwyRezo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Eug4XSG7xzVUXvMD7PhrSzcSJyWq73obVCJfrlebv65MgHWP36sJJkK9TN5J48wNb
         XCx0OHPPFIxKPSX6bXgLxqp1gU32R/fpkrwLnSdtSnsTaByliIJJtgFHedG7b/YHXm
         yVS6wM/NM3EvH72KE3PYf9Vxa7tAJ0/JUUYkOtIc=
Date:   Mon, 13 Apr 2020 20:40:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] drm: bridge: simple-bridge: Delegate operations to
 next bridge
Message-ID: <20200413174050.GE4875@pendragon.ideasonboard.com>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409003636.11792-2-laurent.pinchart+renesas@ideasonboard.com>
 <20200413053325.GA6324@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200413053325.GA6324@ravnborg.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Mon, Apr 13, 2020 at 07:33:25AM +0200, Sam Ravnborg wrote:
> On Thu, Apr 09, 2020 at 03:36:35AM +0300, Laurent Pinchart wrote:
> > Instead of poking into the DT node of the next bridge for its DDC bus
> > and implementing the .get_modes() and .detect() connector operations
> > manually, retrieve the next bridge in the chain and delegate these
> > operations to it.
> 
> I had the impression that we could have any number of bridges,
> and the approach was to request some info further down in the chain for
> info, without knowing if the next or the next->next was the bridge that
> could provide the information.
> But this seems not to be the case - here we assume ->next can get the
> edid - or if not we have a fallback.
> 
> The relation that the next bridge was the one with i2c was present
> before this patch - so it is not directly related to this patch but
> a more general observation.

You're absolutely right, and this is just an interim measure. Delegating
operations to the next bridge in the chain is legacy code, only used
when DRM_BRIDGE_ATTACH_NO_CONNECTOR isn't set. It should eventually go
away when all users will be converted to the new model.

> A few nits below. With these nits considered the patch is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 98 +++++++++-----------------
> >  1 file changed, 33 insertions(+), 65 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index a2dca7a3ef03..bac223d0430d 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -29,7 +29,7 @@ struct simple_bridge {
> >  
> >  	const struct simple_bridge_info *info;
> >  
> > -	struct i2c_adapter	*ddc;
> > +	struct drm_bridge	*next_bridge;
> >  	struct regulator	*vdd;
> >  	struct gpio_desc	*enable;
> >  };
> > @@ -52,29 +52,24 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
> >  	struct edid *edid;
> >  	int ret;
> >  
> > -	if (!sbridge->ddc)
> > -		goto fallback;
> > -
> > -	edid = drm_get_edid(connector, sbridge->ddc);
> > -	if (!edid) {
> > -		DRM_INFO("EDID readout failed, falling back to standard modes\n");
> > -		goto fallback;
> > +	edid = drm_bridge_get_edid(sbridge->next_bridge, connector);
> 
> drm_bridge_get_edid() is not documented to return NULL:
> "The retrieved EDID on success, or an error pointer otherwise."
> So IS_ERR() would do the trick here.

Except that drm_bridge_funcs.get_edid() is documented as returning NULL,
and drm_get_edid() returns NULL on errors. I'm thus tempted to just fix
the documentation of drm_bridge_get_edid() to return NULL on error.
There could be value in using error pointers through the whole EDID API,
but that's a subsystem-wide change that is out of scope for this series.

> > +	if (IS_ERR_OR_NULL(edid)) {
> > +		if (!edid)
> > +			DRM_INFO("EDID readout failed, falling back to standard modes\n");
> > +
> > +		/*
> > +		 * In case we cannot retrieve the EDIDs (missing or broken DDC
> > +		 * bus from the next bridge), fallback on the XGA standards and
> > +		 * prefer a mode pretty much anyone can handle.
> > +		 */
> > +		ret = drm_add_modes_noedid(connector, 1920, 1200);
> > +		drm_set_preferred_mode(connector, 1024, 768);
> > +		return ret;
> >  	}
> >  
> >  	drm_connector_update_edid_property(connector, edid);
> >  	ret = drm_add_edid_modes(connector, edid);
> >  	kfree(edid);
> > -	return ret;
> > -
> > -fallback:
> > -	/*
> > -	 * In case we cannot retrieve the EDIDs (broken or missing i2c
> > -	 * bus), fallback on the XGA standards
> > -	 */
> > -	ret = drm_add_modes_noedid(connector, 1920, 1200);
> > -
> > -	/* And prefer a mode pretty much anyone can handle */
> > -	drm_set_preferred_mode(connector, 1024, 768);
> >  
> >  	return ret;
> >  }
> > @@ -88,16 +83,7 @@ simple_bridge_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >  	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
> >  
> > -	/*
> > -	 * Even if we have an I2C bus, we can't assume that the cable
> > -	 * is disconnected if drm_probe_ddc fails. Some cables don't
> > -	 * wire the DDC pins, or the I2C bus might not be working at
> > -	 * all.
> > -	 */
> > -	if (sbridge->ddc && drm_probe_ddc(sbridge->ddc))
> > -		return connector_status_connected;
> > -
> > -	return connector_status_unknown;
> > +	return drm_bridge_detect(sbridge->next_bridge);
> >  }
> >  
> >  static const struct drm_connector_funcs simple_bridge_con_funcs = {
> > @@ -120,6 +106,11 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
> >  		return -EINVAL;
> >  	}
> >  
> > +	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
> > +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +	if (ret < 0)
> > +		return ret;
> > +
> >  	if (!bridge->encoder) {
> >  		DRM_ERROR("Missing encoder\n");
> >  		return -ENODEV;
> > @@ -130,7 +121,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
> >  	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,
> >  					  &simple_bridge_con_funcs,
> >  					  sbridge->info->connector_type,
> > -					  sbridge->ddc);
> > +					  sbridge->next_bridge->ddc);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to initialize connector\n");
> >  		return ret;
> > @@ -172,31 +163,10 @@ static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> >  	.disable	= simple_bridge_disable,
> >  };
> >  
> > -static struct i2c_adapter *simple_bridge_retrieve_ddc(struct device *dev)
> > -{
> > -	struct device_node *phandle, *remote;
> > -	struct i2c_adapter *ddc;
> > -
> > -	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
> > -	if (!remote)
> > -		return ERR_PTR(-EINVAL);
> > -
> > -	phandle = of_parse_phandle(remote, "ddc-i2c-bus", 0);
> > -	of_node_put(remote);
> > -	if (!phandle)
> > -		return ERR_PTR(-ENODEV);
> > -
> > -	ddc = of_get_i2c_adapter_by_node(phandle);
> > -	of_node_put(phandle);
> > -	if (!ddc)
> > -		return ERR_PTR(-EPROBE_DEFER);
> > -
> > -	return ddc;
> > -}
> > -
> >  static int simple_bridge_probe(struct platform_device *pdev)
> >  {
> >  	struct simple_bridge *sbridge;
> > +	struct device_node *remote;
> >  
> >  	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
> >  	if (!sbridge)
> > @@ -222,16 +192,17 @@ static int simple_bridge_probe(struct platform_device *pdev)
> >  		return PTR_ERR(sbridge->enable);
> >  	}
> >  
> > -	sbridge->ddc = simple_bridge_retrieve_ddc(&pdev->dev);
> > -	if (IS_ERR(sbridge->ddc)) {
> > -		if (PTR_ERR(sbridge->ddc) == -ENODEV) {
> > -			dev_dbg(&pdev->dev,
> > -				"No i2c bus specified. Disabling EDID readout\n");
> > -			sbridge->ddc = NULL;
> > -		} else {
> > -			dev_err(&pdev->dev, "Couldn't retrieve i2c bus\n");
> > -			return PTR_ERR(sbridge->ddc);
> > -		}
> > +	/* Get the next bridge in the pipeline. */
> > +	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> > +	if (!remote)
> > +		return -EINVAL;
> > +
> > +	sbridge->next_bridge = of_drm_find_bridge(remote);
> > +	of_node_put(remote);
> > +
> > +	if (!sbridge->next_bridge) {
> > +		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
>
> The patch mixes logging style.
> In some cases DRM_INFO(...), and here dev_dbg(...)

The patch tries to keep the existing coding style in the driver. I could
convert everything to dev_*, but that should go in a separate patch.

> > +		return -EPROBE_DEFER;
>
> Retreiving the next bridge may fail with a PROBE_DEFER.
> So should this be doen a little earlier in the probe function, so we
> fail as fast as we can?
> I am not sure it has any practical impact, was just wondering.

It's a good point, I'll fix that.

> >  	}
> >  
> >  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
> > @@ -249,9 +220,6 @@ static int simple_bridge_remove(struct platform_device *pdev)
> >  
> >  	drm_bridge_remove(&sbridge->bridge);
> >  
> > -	if (sbridge->ddc)
> > -		i2c_put_adapter(sbridge->ddc);
> > -
> >  	return 0;
> >  }
> >  

-- 
Regards,

Laurent Pinchart
