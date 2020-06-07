Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FE41F093A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 03:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgFGBXD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jun 2020 21:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgFGBXC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jun 2020 21:23:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26E1C08C5C2
        for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Jun 2020 18:23:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61D6F2C9;
        Sun,  7 Jun 2020 03:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591492976;
        bh=GfYUWJ3rl+8Z46RAmstfly6sP4vHuf5Edg/Puy6CRR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gr8bbu1mpen20+2nFPCCiwJuSYnaxiRojII7A3cZCrGymfdac3m8Y59PC4Ipy4Opa
         smZ4VYM6juyrpFD9WNAq/LLMT3dQnjdL8txy0e4MiPnr5YKelfRT31tUeX4SXKh0VO
         NIgk46jRnwZC7lCivdgsAUlYrKYZgubSoUQac2aw=
Date:   Sun, 7 Jun 2020 04:22:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 23/27] drm: bridge: dw-hdmi: Attach to next bridge if
 available
Message-ID: <20200607012237.GW7339@pendragon.ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-24-laurent.pinchart+renesas@ideasonboard.com>
 <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Neil,

On Tue, May 26, 2020 at 02:50:21PM +0200, Neil Armstrong wrote:
> On 26/05/2020 03:15, Laurent Pinchart wrote:
> > On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
> > require a video output port connected to an HDMI sink (most likely an
> > HDMI connector, in rare cases another bridges converting HDMI to another
> > protocol). For those platforms, retrieve the next bridge and attach it
> > from the dw-hdmi bridge attach handler.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 52 ++++++++++++++++++++++-
> >  include/drm/bridge/dw_hdmi.h              |  2 +
> >  2 files changed, 53 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 6148a022569a..512e67bb1c32 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
> >  struct dw_hdmi {
> >  	struct drm_connector connector;
> >  	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> >  
> >  	unsigned int version;
> >  
> > @@ -2797,7 +2798,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
> >  	struct dw_hdmi *hdmi = bridge->driver_private;
> >  
> >  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > -		return 0;
> > +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> > +					 bridge, flags);
> >  
> >  	return dw_hdmi_connector_create(hdmi);
> >  }
> > @@ -3179,6 +3181,50 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
> >  		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
> >  }
> >  
> > +static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
> > +{
> > +	struct device_node *endpoint;
> > +	struct device_node *remote;
> > +
> > +	if (!hdmi->plat_data->output_port)
> > +		return 0;
> > +
> > +	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
> > +						 hdmi->plat_data->output_port,
> > +						 -1);
> > +	if (!endpoint) {
> > +		/*
> > +		 * Don't treat this as a fatal error as the Rockchip DW-HDMI
> > +		 * binding doesn't make the output port mandatory.
> > +		 */
> > +		dev_dbg(hdmi->dev, "Missing endpoint in port@%u\n",
> > +			hdmi->plat_data->output_port);
> > +		return 0;
> > +	}
> > +
> > +	remote = of_graph_get_remote_port_parent(endpoint);
> > +	of_node_put(endpoint);
> > +	if (!remote) {
> > +		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
> > +			hdmi->plat_data->output_port);
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (!of_device_is_available(remote)) {
> > +		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
> > +			hdmi->plat_data->output_port);
> > +		of_node_put(remote);
> > +		return -ENODEV;
> > +	}
> > +
> > +	hdmi->next_bridge = of_drm_find_bridge(remote);
> > +	of_node_put(remote);
> > +	if (!hdmi->next_bridge)
> > +		return -EPROBE_DEFER;
> 
> I'll be safer to print a warn for now until all platforms has been tested.

Probe deferral isn't an error though, it can happen in normal
conditions, if the next bridge hasn't been probed yet. A WARN_ON() would
be pretty bad in that case, and even a dev_warn() may generate
unnecessary worry.

Given that this code only runs if hdmi->plat_data->output_port != 0, and
only the rcar-du driver sets the output_port field, I think it's safe to
not print any message.

> > +
> > +	return 0;
> > +}
> > +
> >  static struct dw_hdmi *
> >  __dw_hdmi_probe(struct platform_device *pdev,
> >  		const struct dw_hdmi_plat_data *plat_data)
> > @@ -3216,6 +3262,10 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >  	mutex_init(&hdmi->cec_notifier_mutex);
> >  	spin_lock_init(&hdmi->audio_lock);
> >  
> > +	ret = dw_hdmi_parse_dt(hdmi);
> > +	if (ret < 0)
> > +		return ERR_PTR(ret);
> > +
> >  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
> >  	if (ddc_node) {
> >  		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> > index ea34ca146b82..8ebeb65d6371 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
> >  struct dw_hdmi_plat_data {
> >  	struct regmap *regm;
> >  
> > +	unsigned int output_port;
> > +
> >  	unsigned long input_bus_encoding;
> >  	bool use_drm_infoframe;
> >  	bool ycbcr_420_allowed;
> > 
> 
> I must check on meson, since I'm not sure for now if the connector probes.
> 
> Anyway, this looks fine.
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

-- 
Regards,

Laurent Pinchart
