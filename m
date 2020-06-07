Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5572D1F0938
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 03:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbgFGBTa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jun 2020 21:19:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40336 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgFGBTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jun 2020 21:19:30 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFEE1F9;
        Sun,  7 Jun 2020 03:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591492767;
        bh=u81/H9CAyOqMS3C1CPdRwHs+24yytBiYEBm8TjE2ZAk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZCkScCa/rPWdYKMiywT8oihPZj+FNcZedToSNQ8rR4q+5nABGsua2lRPIeJsefnrn
         d4uIfiDHJVFKzzsu1gqfAs+LSGRfiuTpytZ8OUppQBLZr2rofM7c/JBi7P4T1mje3v
         6R8uzX7Af2dIc5IdLJbzRTO9oaGLDH//iOyFKTSY=
Date:   Sun, 7 Jun 2020 04:19:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 22/27] drm: bridge: dw-hdmi: Make connector creation
 optional
Message-ID: <20200607011908.GV7339@pendragon.ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-23-laurent.pinchart+renesas@ideasonboard.com>
 <3146e372-f900-fd2b-1b2d-2f68cf8697c6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3146e372-f900-fd2b-1b2d-2f68cf8697c6@baylibre.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Neil,

On Tue, May 26, 2020 at 02:35:19PM +0200, Neil Armstrong wrote:
> On 26/05/2020 03:15, Laurent Pinchart wrote:
> > Implement the drm_bridge_funcs .detect() and .get_edid() operations, and
> > call drm_bridge_hpd_notify() notify to report HPD. This provides the
> > necessary API to support disabling connector creation, do so by
> > accepting DRM_BRIDGE_ATTACH_NO_CONNECTOR in dw_hdmi_bridge_attach().
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 104 +++++++++++++++-------
> >  1 file changed, 74 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index b69c14b9de62..6148a022569a 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -2323,15 +2323,8 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
> >  					  hdmi->rxsense);
> >  }
> >  
> > -/* -----------------------------------------------------------------------------
> > - * DRM Connector Operations
> > - */
> > -
> > -static enum drm_connector_status
> > -dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> > +static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
> >  {
> > -	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> > -					     connector);
> >  	enum drm_connector_status result;
> >  
> >  	mutex_lock(&hdmi->mutex);
> > @@ -2354,31 +2347,57 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >  	return result;
> >  }
> >  
> > -static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> > +static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
> > +				     struct drm_connector *connector)
> >  {
> > -	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> > -					     connector);
> >  	struct edid *edid;
> > -	int ret = 0;
> >  
> >  	if (!hdmi->ddc)
> > -		return 0;
> > +		return NULL;
> >  
> >  	edid = drm_get_edid(connector, hdmi->ddc);
> > -	if (edid) {
> > -		dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> > -			edid->width_cm, edid->height_cm);
> > -
> > -		hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> > -		hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
> > -		drm_connector_update_edid_property(connector, edid);
> > -		cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
> > -		ret = drm_add_edid_modes(connector, edid);
> > -		kfree(edid);
> > -	} else {
> > +	if (!edid) {
> >  		dev_dbg(hdmi->dev, "failed to get edid\n");
> > +		return NULL;
> >  	}
> >  
> > +	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> > +		edid->width_cm, edid->height_cm);
> > +
> > +	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> > +	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
> > +
> > +	return edid;
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * DRM Connector Operations
> > + */
> > +
> > +static enum drm_connector_status
> > +dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> > +{
> > +	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> > +					     connector);
> > +	return dw_hdmi_detect(hdmi);
> > +}
> > +
> > +static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> > +{
> > +	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> > +					     connector);
> > +	struct edid *edid;
> > +	int ret;
> > +
> > +	edid = dw_hdmi_get_edid(hdmi, connector);
> > +	if (!edid)
> > +		return 0;
> > +
> > +	drm_connector_update_edid_property(connector, edid);
> > +	cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
> > +	ret = drm_add_edid_modes(connector, edid);
> > +	kfree(edid);
> > +
> >  	return ret;
> >  }
> >  
> > @@ -2777,10 +2796,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
> >  {
> >  	struct dw_hdmi *hdmi = bridge->driver_private;
> >  
> > -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > -		DRM_ERROR("Fix bridge driver to make connector optional!");
> > -		return -EINVAL;
> > -	}
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return 0;
> >  
> >  	return dw_hdmi_connector_create(hdmi);
> >  }
> > @@ -2860,6 +2877,21 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> >  	mutex_unlock(&hdmi->mutex);
> >  }
> >  
> > +static enum drm_connector_status dw_hdmi_bridge_detect(struct drm_bridge *bridge)
> > +{
> > +	struct dw_hdmi *hdmi = bridge->driver_private;
> > +
> > +	return dw_hdmi_detect(hdmi);
> > +}
> > +
> > +static struct edid *dw_hdmi_bridge_get_edid(struct drm_bridge *bridge,
> > +					    struct drm_connector *connector)
> > +{
> > +	struct dw_hdmi *hdmi = bridge->driver_private;
> > +
> > +	return dw_hdmi_get_edid(hdmi, connector);
> > +}
> > +
> >  static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
> >  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > @@ -2873,6 +2905,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
> >  	.atomic_disable = dw_hdmi_bridge_atomic_disable,
> >  	.mode_set = dw_hdmi_bridge_mode_set,
> >  	.mode_valid = dw_hdmi_bridge_mode_valid,
> > +	.detect = dw_hdmi_bridge_detect,
> > +	.get_edid = dw_hdmi_bridge_get_edid,
> >  };
> >  
> >  /* -----------------------------------------------------------------------------
> > @@ -2988,10 +3022,18 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
> >  	}
> >  
> >  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> > +		enum drm_connector_status status = phy_int_pol & HDMI_PHY_HPD
> > +						 ? connector_status_connected
> > +						 : connector_status_disconnected;
> > +
> >  		dev_dbg(hdmi->dev, "EVENT=%s\n",
> > -			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
> > -		if (hdmi->bridge.dev)
> > +			status == connector_status_connected ?
> > +			"plugin" : "plugout");
> > +
> > +		if (hdmi->bridge.dev) {
> >  			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> > +			drm_bridge_hpd_notify(&hdmi->bridge, status);
> 
> I suspect I will also need to add drm_bridge_hpd_notify() in
> meson_dw_hdmi.c in dw_hdmi_top_thread_irq() for HPD event, right ?

If you want to support DRM_BRIDGE_ATTACH_NO_CONNECTOR (and I think you
should :-)), yes.

> > +		}
> >  	}
> >  
> >  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> > @@ -3337,6 +3379,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >  
> >  	hdmi->bridge.driver_private = hdmi;
> >  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> > +	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> > +			 | DRM_BRIDGE_OP_HPD;
> 
> same here for meson_dw_hdmi ?
> could I also assume we could disable the dw_hdmi bridge & hpd ops when
> using with meson_dw_hdmi and implement these in meson_dw_hdmi ?

I've only noticed now that meson_dw_hdmi has its own bridge. Could you
briefly explain how all that works ?

> >  #ifdef CONFIG_OF
> >  	hdmi->bridge.of_node = pdev->dev.of_node;
> >  #endif
> 
> Anyway
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

-- 
Regards,

Laurent Pinchart
