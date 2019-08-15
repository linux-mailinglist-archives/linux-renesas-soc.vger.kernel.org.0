Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30FCC8EC90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 15:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbfHONSp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 09:18:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45670 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731306AbfHONSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 09:18:45 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 359172AF;
        Thu, 15 Aug 2019 15:18:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565875121;
        bh=7QbJ4Du/XnlBN1gYFnN5imwadM72F3m3mwA3dcBOKEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kuFpq7IijfpLmgWtufJF+7RYZ9k1X/R4ZECkPbri1bp7Z39wiO7OPtdHgkNOX8OWD
         NxOfCRQ37iexNAV37FSIXtLaCJBf00PI+DPNeNCMe4zRupmVeZy6OfdQQ9k2TOCB2M
         qITK9bZ1tBQqRmNjYmBndbZyL8DBdJCMV7It9Ags=
Date:   Thu, 15 Aug 2019 16:18:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Eric Anholt <eric@anholt.net>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Message-ID: <20190815131838.GP5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

(CC'ing Greg as the architect of the SPDX move)

On Thu, Aug 15, 2019 at 12:04:27PM +0100, Fabrizio Castro wrote:
> The information represented by drm_bridge_timings is also
> needed by panels, therefore rename drm_bridge_timings to
> drm_timings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Link: https://www.spinics.net/lists/linux-renesas-soc/msg43271.html
> 
> ---
> v1->v2:
> * new patch
> 
> I have copied the license from include/drm/drm_bridge.h as that's
> where the struct originally came from. What's the right SPDX license
> to use in this case?

https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files

Greg, any idea on how we should handle this ?

>  drivers/gpu/drm/bridge/dumb-vga-dac.c |  6 ++--
>  drivers/gpu/drm/bridge/sii902x.c      |  2 +-
>  drivers/gpu/drm/bridge/thc63lvd1024.c |  2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c    |  6 ++--
>  drivers/gpu/drm/pl111/pl111_display.c |  2 +-
>  include/drm/drm_bridge.h              | 40 ++---------------------
>  include/drm/drm_timings.h             | 60 +++++++++++++++++++++++++++++++++++
>  7 files changed, 71 insertions(+), 47 deletions(-)
>  create mode 100644 include/drm/drm_timings.h
> 
> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> index d32885b..bb1d928 100644
> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> @@ -228,7 +228,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
>   * NOTE: the ADV7123EP seems to have other timings and need a new timings
>   * set if used.
>   */
> -static const struct drm_bridge_timings default_dac_timings = {
> +static const struct drm_timings default_dac_timings = {
>  	/* Timing specifications, datasheet page 7 */
>  	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
>  	.setup_time_ps = 500,
> @@ -239,7 +239,7 @@ static const struct drm_bridge_timings default_dac_timings = {
>   * Information taken from the THS8134, THS8134A, THS8134B datasheet named
>   * "SLVS205D", dated May 1990, revised March 2000.
>   */
> -static const struct drm_bridge_timings ti_ths8134_dac_timings = {
> +static const struct drm_timings ti_ths8134_dac_timings = {
>  	/* From timing diagram, datasheet page 9 */
>  	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
>  	/* From datasheet, page 12 */
> @@ -252,7 +252,7 @@ static const struct drm_bridge_timings ti_ths8134_dac_timings = {
>   * Information taken from the THS8135 datasheet named "SLAS343B", dated
>   * May 2001, revised April 2013.
>   */
> -static const struct drm_bridge_timings ti_ths8135_dac_timings = {
> +static const struct drm_timings ti_ths8135_dac_timings = {
>  	/* From timing diagram, datasheet page 14 */
>  	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
>  	/* From datasheet, page 16 */
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index dd7aa46..0c63065 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -914,7 +914,7 @@ static int sii902x_i2c_bypass_deselect(struct i2c_mux_core *mux, u32 chan_id)
>  	return 0;
>  }
>  
> -static const struct drm_bridge_timings default_sii902x_timings = {
> +static const struct drm_timings default_sii902x_timings = {
>  	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE
>  		 | DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
>  		 | DRM_BUS_FLAG_DE_HIGH,
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index 3d74129b..9047a9e 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -34,7 +34,7 @@ struct thc63_dev {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next;
>  
> -	struct drm_bridge_timings timings;
> +	struct drm_timings timings;
>  };
>  
>  static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index dbf35c7..c086b06c 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -32,7 +32,7 @@ struct tfp410 {
>  	struct delayed_work	hpd_work;
>  	struct gpio_desc	*powerdown;
>  
> -	struct drm_bridge_timings timings;
> +	struct drm_timings timings;
>  
>  	struct device *dev;
>  };
> @@ -190,7 +190,7 @@ static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static const struct drm_bridge_timings tfp410_default_timings = {
> +static const struct drm_timings tfp410_default_timings = {
>  	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE
>  			 | DRM_BUS_FLAG_DE_HIGH,
>  	.setup_time_ps = 1200,
> @@ -199,7 +199,7 @@ static const struct drm_bridge_timings tfp410_default_timings = {
>  
>  static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  {
> -	struct drm_bridge_timings *timings = &dvi->timings;
> +	struct drm_timings *timings = &dvi->timings;
>  	struct device_node *ep;
>  	u32 pclk_sample = 0;
>  	u32 bus_width = 24;
> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> index 15d2755..c82b21f 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -188,7 +188,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
>  	}
>  
>  	if (bridge) {
> -		const struct drm_bridge_timings *btimings = bridge->timings;
> +		const struct drm_timings *btimings = bridge->timings;
>  
>  		/*
>  		 * Here is when things get really fun. Sometimes the bridge
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 7616f65..8270a38 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -27,9 +27,9 @@
>  #include <linux/ctype.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_timings.h>
>  
>  struct drm_bridge;
> -struct drm_bridge_timings;
>  struct drm_panel;
>  
>  /**
> @@ -337,42 +337,6 @@ struct drm_bridge_funcs {
>  };
>  
>  /**
> - * struct drm_bridge_timings - timing information for the bridge
> - */
> -struct drm_bridge_timings {
> -	/**
> -	 * @input_bus_flags:
> -	 *
> -	 * Tells what additional settings for the pixel data on the bus
> -	 * this bridge requires (like pixel signal polarity). See also
> -	 * &drm_display_info->bus_flags.
> -	 */
> -	u32 input_bus_flags;
> -	/**
> -	 * @setup_time_ps:
> -	 *
> -	 * Defines the time in picoseconds the input data lines must be
> -	 * stable before the clock edge.
> -	 */
> -	u32 setup_time_ps;
> -	/**
> -	 * @hold_time_ps:
> -	 *
> -	 * Defines the time in picoseconds taken for the bridge to sample the
> -	 * input signal after the clock edge.
> -	 */
> -	u32 hold_time_ps;
> -	/**
> -	 * @dual_link:
> -	 *
> -	 * True if the bus operates in dual-link mode. The exact meaning is
> -	 * dependent on the bus type. For LVDS buses, this indicates that even-
> -	 * and odd-numbered pixels are received on separate links.
> -	 */
> -	bool dual_link;
> -};
> -
> -/**
>   * struct drm_bridge - central DRM bridge control structure
>   */
>  struct drm_bridge {
> @@ -393,7 +357,7 @@ struct drm_bridge {
>  	 *
>  	 * the timing specification for the bridge, if any (may be NULL)
>  	 */
> -	const struct drm_bridge_timings *timings;
> +	const struct drm_timings *timings;
>  	/** @funcs: control functions */
>  	const struct drm_bridge_funcs *funcs;
>  	/** @driver_private: pointer to the bridge driver's internal context */
> diff --git a/include/drm/drm_timings.h b/include/drm/drm_timings.h
> new file mode 100644
> index 0000000..4af8814
> --- /dev/null
> +++ b/include/drm/drm_timings.h
> @@ -0,0 +1,60 @@
> +/*
> + * Permission to use, copy, modify, distribute, and sell this software and its
> + * documentation for any purpose is hereby granted without fee, provided that
> + * the above copyright notice appear in all copies and that both that copyright
> + * notice and this permission notice appear in supporting documentation, and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific,
> + * written prior permission.  The copyright holders make no representations
> + * about the suitability of this software for any purpose.  It is provided "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#ifndef __DRM_TIMINGS_H__
> +#define __DRM_TIMINGS_H__
> +
> +/**
> + * struct drm_timings - timing information

This dangerously relates to video timings. I would name the structure
drm_bus_timings, or drm_bus_params (or something similar) as it contains
more than timings.

> + */
> +struct drm_timings {
> +	/**
> +	 * @input_bus_flags:
> +	 *
> +	 * Tells what additional settings for the pixel data on the bus
> +	 * are required (like pixel signal polarity). See also
> +	 * &drm_display_info->bus_flags.
> +	 */
> +	u32 input_bus_flags;
> +	/**
> +	 * @setup_time_ps:
> +	 *
> +	 * Defines the time in picoseconds the input data lines must be
> +	 * stable before the clock edge.
> +	 */
> +	u32 setup_time_ps;
> +	/**
> +	 * @hold_time_ps:
> +	 *
> +	 * Defines the time in picoseconds taken for the bridge to sample the
> +	 * input signal after the clock edge.
> +	 */
> +	u32 hold_time_ps;
> +	/**
> +	 * @dual_link:
> +	 *
> +	 * True if the bus operates in dual-link mode. The exact meaning is
> +	 * dependent on the bus type. For LVDS buses, this indicates that even-
> +	 * and odd-numbered pixels are received on separate links.
> +	 */
> +	bool dual_link;
> +};
> +
> +#endif /* __DRM_TIMINGS_H__ */

-- 
Regards,

Laurent Pinchart
