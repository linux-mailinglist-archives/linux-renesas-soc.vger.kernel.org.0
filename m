Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8981E227B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 14:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731773AbgEZM7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 08:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731765AbgEZM7T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 08:59:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C86C03E96D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2020 05:59:19 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 176592A2CE4;
        Tue, 26 May 2020 13:59:17 +0100 (BST)
Date:   Tue, 26 May 2020 14:59:13 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guido =?UTF-8?B?R8O8bnRoZXI=?= <agx@sigxcpu.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Jyri Sarha <jsarha@ti.com>, Lubomir Rintel <lkundrak@v3.sk>,
        Maciej Purski <m.purski@samsung.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Russell King <linux@armlinux.org.uk>,
        Tomasz Stanislawski <t.stanislaws@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 10/27] drm: bridge: Pass drm_display_info to
 drm_bridge_funcs .mode_valid()
Message-ID: <20200526145913.3b13b0ee@collabora.com>
In-Reply-To: <20200526011505.31884-11-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
        <20200526011505.31884-11-laurent.pinchart+renesas@ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 26 May 2020 04:14:48 +0300
Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:

> When validating a mode, bridges may need to do so in the context of a
> display, as specified by drm_display_info. An example is the meson
> dw-hdmi bridge that needs to consider the YUV 4:2:0 output format to
> perform clock calculations.
> 
> Bridges that need the display info currently retrieve it from the
> drm_connector created by the bridge. This gets in the way of moving
> connector creation out of bridge drivers. To make this possible, pass
> the drm_display_info to drm_bridge_funcs .mode_valid().
> 
> Changes to the bridge drivers have been performed with the following
> coccinelle semantic patch and have been compile-tested.
> 
> @ rule1 @
> identifier funcs;
> identifier fn;
> @@
>  struct drm_bridge_funcs funcs = {
>  	...,
>  	.mode_valid = fn
>  };
> 
> @ depends on rule1 @
> identifier rule1.fn;
> identifier bridge;
> identifier mode;
> @@
>  enum drm_mode_status fn(
>  	struct drm_bridge *bridge,
> +	const struct drm_display_info *info,
>  	const struct drm_display_mode *mode
>  )
>  {
>  	...
>  }
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
