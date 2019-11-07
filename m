Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1D9F3889
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 20:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfKGT0e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 14:26:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60824 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfKGT0e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 14:26:34 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3E7971D;
        Thu,  7 Nov 2019 20:26:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573154791;
        bh=BTjvrnkouWPguQyJ5E5PL72S3gkRE72vanKVV4Lz0HY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HFW77gimpx+nQZiUUzjKYt4Boqsz8CFp7kaCMQjJJCjHaUkosan5zswJZIcVbuQCB
         8Sp4mVGgsdFy0A6YE3rvMcI9lcvBJxUQSLyxO9XqjLCV1oS7+V/nWOAxbtd0g+I8D6
         I9p4JYi9j/OChFuJYYK97Gyfw/AxfDzPl0Ll9x7U=
Date:   Thu, 7 Nov 2019 21:26:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org
Subject: Re: [PATCH v3 3/8] drm: Add bus timings helper
Message-ID: <20191107192621.GH24983@pendragon.ideasonboard.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1567017402-5895-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Aug 28, 2019 at 07:36:37PM +0100, Fabrizio Castro wrote:
> Helper to provide bus timing information.

You may want to expand this a bit. And actually fix it too, as the
helper you introduce isn't related to timings (same for the subject
line).

> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v2->v3:
> * new patch
> ---
>  drivers/gpu/drm/Makefile          |  3 +-
>  drivers/gpu/drm/drm_bus_timings.c | 97 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bus_timings.h     | 21 +++++++++
>  3 files changed, 120 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/drm_bus_timings.c
>  create mode 100644 include/drm/drm_bus_timings.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 9f0d2ee..a270063 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -17,7 +17,8 @@ drm-y       :=	drm_auth.o drm_cache.o \
>  		drm_plane.o drm_color_mgmt.o drm_print.o \
>  		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>  		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> -		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
> +		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> +		drm_bus_timings.o
>  
>  drm-$(CONFIG_DRM_LEGACY) += drm_legacy_misc.o drm_bufs.o drm_context.o drm_dma.o drm_scatter.o drm_lock.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
> diff --git a/drivers/gpu/drm/drm_bus_timings.c b/drivers/gpu/drm/drm_bus_timings.c
> new file mode 100644
> index 0000000..e2ecd22
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_bus_timings.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <drm/drm_bus_timings.h>
> +#include <linux/errno.h>
> +#include <linux/of_graph.h>
> +#include <linux/of.h>
> +#include <linux/types.h>
> +
> +#define DRM_OF_LVDS_ODD		1
> +#define DRM_OF_LVDS_EVEN	2
> +
> +static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
> +{
> +	bool even_pixels, odd_pixels;
> +
> +	even_pixels = of_property_read_bool(port_node, "dual-lvds-even-pixels");
> +	odd_pixels = of_property_read_bool(port_node, "dual-lvds-odd-pixels");
> +	return  even_pixels * DRM_OF_LVDS_EVEN + odd_pixels * DRM_OF_LVDS_ODD;

s/  / /

But I would make these bitflags.

enum drm_of_lvds_pixels {
	DRM_OF_LVDS_EVEN = BIT(0),
	DRM_OF_LVDS_ODD = BIT(1),
};

static int drm_of_lvds_get_port_pixels_type(struct device_node *port)
{
	bool even_pixels = of_property_read_bool(port, "dual-lvds-even-pixels");
	bool odd_pixels = of_property_read_bool(port, "dual-lvds-odd-pixels");

	return (even_pixels ? DRM_OF_LVDS_EVEN : 0) |
	       (odd_pixels ? DRM_OF_LVDS_ODD : 0);
}

> +}
> +
> +/**
> + * drm_of_lvds_get_dual_link_configuration - get the dual-LVDS configuration

Should we name this drm_of_lvds_get_dual_link_pixel_order to better
reflect its purpose ?

> + * @p1: device tree node corresponding to the first port of the source
> + * @p2: device tree node corresponding to the second port of the source

Maybe port1 and port2 to make this more explicit ?

> + *
> + * An LVDS dual-link bus is made of two connections, even pixels transit on one
> + * connection, and odd pixels transit on the other connection.

To match the DT bindings documentation, I would recommand

"An LVDS dual-link connection is made of two links, with even pixels
transitting on one link, and odd pixels on the other link."

> + * This function walks the DT (from the source ports to the sink ports) looking
> + * for a dual-LVDS bus. A dual-LVDS bus is identfied by markers found on the DT
> + * ports of the sink device(s). If such a bus is found, this function returns
> + * its configuration (either p1 connected to the even pixels port and p2
> + * connected to the odd pixels port, or p1 connected to the odd pixels port and
> + * p2 connected to the even pixels port).

"walking the DT" sounds like the function goes through the whole graph.
How about the following ?

/**
 * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
 * @port1: First DT port node of the Dual-link LVDS source
 * @port2: Second DT port node of the Dual-link LVDS source
 *
 * An LVDS dual-link connection is made of two links, with even pixels
 * transitting on one link, and odd pixels on the other link. This function
 * returns, for two ports of an LVDS dual-link source, which port shall transmit
 * the even and off pixels, based on the requirements of the connected sink.
 *
 * The pixel order is determined from the dual-lvds-even-pixels and
 * dual-lvds-odd-pixels properties in the sink's DT port nodes. If those
 * properties are not present, or if their usage is not valid, this function
 * returns -EINVAL.
 *
 * @port1 and @port2 are typically DT sibling nodes, but may have different
 * parents when, for instance, two separate LVDS encoders carry the even and odd
 * pixels.
 *
 * Return:
 * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries even pixels and @port2
 *   carries odd pixels
 * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries odd pixels and @port1
 *   carries even pixels
 * * -EINVAL - @port1 and @port2 are not connected to a dual-link LVDS sink, or
 *   the sink configuration is invalid
 */

We could also add -EPIPE as a return code for the case where port1 or
port2 are not connected.

> + *
> + * Return: A code describing the bus configuration when a valid dual-LVDS bus is
> + * found, or an error code when no valid dual-LVDS bus is found
> + *
> + * Possible codes for the bus configuration are:
> + *
> + * - DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS: when p1 is connected to the even pixels
> + *   port and p2 is connected to the odd pixels port
> + * - DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS: when p1 is connected to the odd pixels
> + *   port and p2 is connected to the even pixels port
> + *
> + */
> +int drm_of_lvds_get_dual_link_configuration(const struct device_node *p1,
> +					    const struct device_node *p2)
> +{
> +	struct device_node *remote_p1 = NULL, *remote_p2 = NULL;
> +	struct device_node *parent_p1 = NULL, *parent_p2 = NULL;

There's no need to initialize those two variables.

> +	struct device_node *ep1 = NULL, *ep2 = NULL;
> +	u32 reg_p1, reg_p2;
> +	int ret = -EINVAL, remote_p1_pt, remote_p2_pt;

Please split this last line, as it otherwise hides the initialization of
ret in the middle.

> +
> +	if (!p1 || !p2)
> +		return ret;

You can return -EINVAL directly.


> +	if (of_property_read_u32(p1, "reg", &reg_p1) ||
> +	    of_property_read_u32(p2, "reg", &reg_p2))
> +		return ret;

Same here.

> +	parent_p1 = of_get_parent(p1);
> +	parent_p2 = of_get_parent(p2);
> +	if (!parent_p1 || !parent_p2)
> +		goto done;
> +	ep1 = of_graph_get_endpoint_by_regs(parent_p1, reg_p1, 0);
> +	ep2 = of_graph_get_endpoint_by_regs(parent_p2, reg_p2, 0);
> +	if (!ep1 || !ep2)
> +		goto done;

If you only support the first endpoint, this should be mentioned in the
documentation. Alternatively you could pass the endpoint nodes instead
of the port nodes, or you could pass the endpoint number.

It's also a bit inefficient to use of_graph_get_endpoint_by_regs() when
you already have the port nodes. How about adding the following helper
function ?

struct device_node *of_graph_get_port_endpoint(struct device_node *port, int reg)
{
	struct device_node *endpoint = NULL;

	for_each_child_of_node(port, endpoint) {
		u32 id;

		if (!of_node_name_eq(endpoint, "endpoint") ||
			continue;

		if (reg == -1)
			return endpoint;

		if (of_property_read_u32(node, "reg", &id) < 0)
			continue;

		if (reg == id)
			return endpoint;
	}

	return NULL;
}

If you're concerned that adding a core helper would delay this patch
series, you could add it as a local helper, and move it to of_graph.h in
a second step.

> +	remote_p1 = of_graph_get_remote_port(ep1);
> +	remote_p2 = of_graph_get_remote_port(ep2);
> +	if (!remote_p1 || !remote_p2)
> +		goto done;
> +	remote_p1_pt = drm_of_lvds_get_port_pixels_type(remote_p1);
> +	remote_p2_pt = drm_of_lvds_get_port_pixels_type(remote_p2);
> +	/*
> +	 * A valid dual-lVDS bus is found when one remote port is marked with
> +	 * "dual-lvds-even-pixels", and the other remote port is marked with
> +	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
> +	 */
> +	if (!remote_p1_pt || !remote_p2_pt ||
> +	    remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
> +		goto done;
> +	if (remote_p1_pt == DRM_OF_LVDS_EVEN)
> +		/* The sink expects even pixels through the first port */
> +		ret = DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
> +	else
> +		/* The sink expects odd pixels through the first port */
> +		ret = DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> +
> +done:
> +	of_node_put(ep1);
> +	of_node_put(ep2);
> +	of_node_put(parent_p1);
> +	of_node_put(parent_p2);
> +	of_node_put(remote_p1);
> +	of_node_put(remote_p2);
> +	return ret;

This is heavy, I would add blank lines to make the code easier to read.

> +}
> +EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_configuration);
> diff --git a/include/drm/drm_bus_timings.h b/include/drm/drm_bus_timings.h
> new file mode 100644
> index 0000000..db8a385
> --- /dev/null
> +++ b/include/drm/drm_bus_timings.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __DRM_BUS_TIMINGS__
> +#define __DRM_BUS_TIMINGS__
> +
> +struct device_node;
> +
> +#define DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS	0
> +#define DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS	1

These should be documented with kerneldoc. How about also turning them
into an enum ?

> +
> +#ifdef CONFIG_OF
> +int drm_of_lvds_get_dual_link_configuration(const struct device_node *p1,
> +					    const struct device_node *p2);
> +#else
> +int drm_of_lvds_get_dual_link_configuration(const struct device_node *p1,
> +					    const struct device_node *p2)
> +{
> +	return -EINVAL;
> +}
> +#endif
> +
> +#endif /* __DRM_BUS_TIMINGS__ */

-- 
Regards,

Laurent Pinchart
