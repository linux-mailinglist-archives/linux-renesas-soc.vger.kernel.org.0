Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C4F20C6F8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jun 2020 10:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgF1I2p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 04:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgF1I2p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 04:28:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8ACC061794
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Jun 2020 01:28:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DF074FB;
        Sun, 28 Jun 2020 10:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593332920;
        bh=oBX/5wjVeqa7bhZWtDN9knWFJSP6vnTUK9Kwaqds12E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d3vSgFZgB4VT4imIKKi0SZrBhlp6T2U9B8zcFwkFRnIl+aAJqkdZH6msOU11UKj2s
         WpiEwuvN+GwKGH+2aaRBKaT3VCwvNiJKAoFbV2NOERnOGWhdy4xJLDwCgYmMFtXrs0
         b2qqREmKyBscpWbY9n2ycgOqXfZ2XtAB73moZuoY=
Date:   Sun, 28 Jun 2020 11:28:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Liu Ying <victor.liu@oss.nxp.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 00/27] Converter R-Car DU to the DRM bridge connector
 helper
Message-ID: <20200628082837.GG6954@pendragon.ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200623185522.GA1795323@ravnborg.org>
 <a44094302002ab99a0b524dc87132198433d2c10.camel@oss.nxp.com>
 <20200627195539.GA41037@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200627195539.GA41037@ravnborg.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Sat, Jun 27, 2020 at 09:55:39PM +0200, Sam Ravnborg wrote:
> Hi Liu,
> 
> thanks for the notice.
> 
> Laurent, I trust you will take a look and resolve this.

I've just reviewed Liu's patches (and CC'ed you on 2/2).

> On Thu, Jun 25, 2020 at 04:48:01PM +0800, Liu Ying wrote:
> > On Tue, 2020-06-23 at 20:55 +0200, Sam Ravnborg wrote:
> >> On Tue, May 26, 2020 at 04:14:38AM +0300, Laurent Pinchart wrote:
> >>> Hello,
> >>> 
> >>> This patch series converts the R-Car DU driver to use the DRM bridge
> >>> connector helper drm_bridge_connector_init().
> >>> 
> >>> The bulk of the series is conversion of the adv7511, simple-bridge,
> >>> rcar-lbds and dw-hdmi drivers to make connector creation optional
> >>> (through the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag).
> >>> 
> >>> The series starts with the adv7511 driver, previously posted as "[PATCH
> >>> 0/4] drm: bridge: adv7511: Enable usage with DRM bridge connector
> >>> helper" ([1]). Patches 01/27 to 04/27 incorporate all the received
> >>> review comments.
> >>> 
> >>> The next three patches address the simple-bridge driver, previously
> >>> posted as "[PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM
> >>> bridge connector helper". Patch 05/27 is an additional fix that stems
> >>> from the review, and patches 06/27 and 07/27 incorporate all the
> >>> received review comments.
> >>> 
> >>> Patch 08/27 is a new patch that addresses the rcar-lvds driver. Instead
> >>> of implementing direct support for DRM_BRIDGE_ATTACH_NO_CONNECTOR, it
> >>> simply removes code that shouldn't have been in the driver in the first
> >>> place by switching to the panel bridge helper.
> >>> 
> >>> Patches 09/27 to 22/27 then address the dw-hdmi driver. That's a more
> >>> sizeable rework, due to the fact that the driver implements a mid- layer
> >>> for platform-specific glue, with the internal drm_connector being used
> >>> throughout the whole code. There's no rocket science there, but patch
> >>> 10/27 should be noted for adding a new argument to the
> >>> drm_bridge_funcs.mode_valid() function. Please see individual patches
> >>> for details.
> >>> 
> >>> Patch 23/27 adds support to the dw-hdmi driver to attach to a downstream
> >>> bridge if one is specified in DT. As the DT port number corresponding to
> >>> the video output differs between platforms that integrate the dw- hdmi
> >>> (some of them even don't have a video output port, which should probably
> >>> be fixed, but that's out of scope for this series), the port number has
> >>> to be specified by the platform glue layer. Patch 24/27 does so for the
> >>> R-Car dw-hdmi driver.
> >>> 
> >>> Patch 25/27 is a drive-by fix for an error path issue in the rcar- du
> >>> driver. Patch 26/27 finally makes use of the drm_bridge_connector_init()
> >>> helper.
> >>> 
> >>> Unfortunately, this breaks the VGA output on R-Car Gen3 platforms. On
> >>> those platforms, the VGA DDC lines are not connected, and there is no
> >>> mean for software to detect the VGA output connection status. When the
> >>> simple-bridge driver creates a connector, it automatically adds default
> >>> modes when no DDC is available. This behavious is also present int the
> >>> DRM probe helper drm_helper_probe_single_connector_modes(), but only
> >>> when the connector status is connector_status_connected. As the driver
> >>> (rightfully) reports connector_status_unconnected, no modes are added.
> >>> Patch 27/27 fixes this issue by extending addition of default modes in
> >>> drm_helper_probe_single_connector_modes() when the output status is
> >>> unknown. An alternative approach would be to implement this behaviour in
> >>> the bridge connector helper (drm_bridge_connector.c).
> >>> 
> >>> All the modified drivers have been compile-tested, and the series has
> >>> been tested on a Renesas R-Car Salvator-XS board with the VGA, HDMI and
> >>> LVDS outputs.
> >>> 
> >>> [1] 
> >>> https://lore.kernel.org/dri-devel/20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com/
> >>> [2] 
> >>> https://lore.kernel.org/dri-devel/20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com/
> >> 
> >> As we briefly discussed on IRC the first 21 patches are now applied to
> >> drm-misc-next.
> > 
> > I see patch '[22/27] drm: bridge: dw-hdmi: Make connector creation
> > optional' is applied to drm-misc-next.
> > That patch would introduce an uninitialized mutex accessing issue as I
> > mentioned in the patch[1]. And, the patch intends to fix the issue in
> > the first place.
> > 
> > [1] https://patchwork.freedesktop.org/patch/370560/
> > 
> >> The rcar-du specific patches was left out and the last patch was
> >> likewise not applied in this round- mostly because it was the coming
> >> after several rcar-du patches and I was not sure if there was some
> >> dependencies to consider.
> >> 
> >> With this set in we have more examples in the tree how to do proper
> >> bridges which is good.
> >> 
> >> While applying the new r-bs was ofc added.
> >> 
> >>> Laurent Pinchart (27):
> >>>   drm: bridge: adv7511: Split EDID read to a separate function
> >>>   drm: bridge: adv7511: Split connector creation to a separate function
> >>>   drm: bridge: adv7511: Implement bridge connector operations
> >>>   drm: bridge: adv7511: Make connector creation optional
> >>>   drm: bridge: Return NULL on error from drm_bridge_get_edid()
> >>>   drm: bridge: simple-bridge: Delegate operations to next bridge
> >>>   drm: bridge: simple-bridge: Make connector creation optional
> >>>   drm: rcar-du: lvds: Convert to DRM panel bridge helper
> >>>   drm: edid: Constify connector argument to infoframe functions
> >>>   drm: bridge: Pass drm_display_info to drm_bridge_funcs .mode_valid()
> >>>   drm: bridge: dw-hdmi: Pass private data pointer to .mode_valid()
> >>>   drm: bridge: dw-hdmi: Pass private data pointer to .configure_phy()
> >>>   drm: bridge: dw-hdmi: Remove unused field from dw_hdmi_plat_data
> >>>   drm: meson: dw-hdmi: Use dw_hdmi context to replace hack
> >>>   drm: bridge: dw-hdmi: Pass drm_display_info to .mode_valid()
> >>>   drm: bridge: dw-hdmi: Constify mode argument to dw_hdmi_phy_ops
> >>>     .init()
> >>>   drm: bridge: dw-hdmi: Constify mode argument to internal functions
> >>>   drm: bridge: dw-hdmi: Pass drm_display_info to dw_hdmi_support_scdc()
> >>>   drm: bridge: dw-hdmi: Split connector creation to a separate function
> >>>   drm: bridge: dw-hdmi: Store current connector in struct dw_hdmi
> >>>   drm: bridge: dw-hdmi: Pass drm_connector to internal functions as
> >>>     needed
> >>>   drm: bridge: dw-hdmi: Make connector creation optional
> >>>   drm: bridge: dw-hdmi: Attach to next bridge if available
> >>>   drm: rcar-du: dw-hdmi: Set output port number
> >>>   drm: rcar-du: Fix error handling in rcar_du_encoder_init()
> >>>   drm: rcar-du: Use drm_bridge_connector_init() helper
> >>>   drm: Add default modes for connectors in unknown state
> >>> 
> >>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  | 159 +++++---
> >>>  .../drm/bridge/analogix/analogix-anx6345.c    |   1 +
> >>>  .../drm/bridge/analogix/analogix-anx78xx.c    |   1 +
> >>>  drivers/gpu/drm/bridge/cdns-dsi.c             |   1 +
> >>>  drivers/gpu/drm/bridge/chrontel-ch7033.c      |   1 +
> >>>  drivers/gpu/drm/bridge/nwl-dsi.c              |   1 +
> >>>  drivers/gpu/drm/bridge/sii9234.c              |   1 +
> >>>  drivers/gpu/drm/bridge/sil-sii8620.c          |   1 +
> >>>  drivers/gpu/drm/bridge/simple-bridge.c        | 113 +++---
> >>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 357 ++++++++++++------
> >>>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |   1 +
> >>>  drivers/gpu/drm/bridge/tc358767.c             |   1 +
> >>>  drivers/gpu/drm/bridge/tc358768.c             |   1 +
> >>>  drivers/gpu/drm/bridge/thc63lvd1024.c         |   1 +
> >>>  drivers/gpu/drm/bridge/ti-tfp410.c            |  11 +-
> >>>  drivers/gpu/drm/drm_atomic_helper.c           |   3 +-
> >>>  drivers/gpu/drm/drm_bridge.c                  |  10 +-
> >>>  drivers/gpu/drm/drm_edid.c                    |  12 +-
> >>>  drivers/gpu/drm/drm_probe_helper.c            |   7 +-
> >>>  drivers/gpu/drm/i2c/tda998x_drv.c             |   1 +
> >>>  drivers/gpu/drm/imx/dw_hdmi-imx.c             |   6 +-
> >>>  drivers/gpu/drm/meson/meson_dw_hdmi.c         |  34 +-
> >>>  drivers/gpu/drm/omapdrm/dss/dpi.c             |   1 +
> >>>  drivers/gpu/drm/omapdrm/dss/sdi.c             |   1 +
> >>>  drivers/gpu/drm/omapdrm/dss/venc.c            |   1 +
> >>>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  26 +-
> >>>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c        |   7 +-
> >>>  drivers/gpu/drm/rcar-du/rcar_lvds.c           | 124 +-----
> >>>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |   6 +-
> >>>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |   6 +-
> >>>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |   3 +-
> >>>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        |   3 +-
> >>>  include/drm/bridge/dw_hdmi.h                  |  28 +-
> >>>  include/drm/drm_bridge.h                      |   3 +
> >>>  include/drm/drm_edid.h                        |   6 +-
> >>>  include/drm/drm_modeset_helper_vtables.h      |   8 +-
> >>>  36 files changed, 541 insertions(+), 406 deletions(-)

-- 
Regards,

Laurent Pinchart
