Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F26910F8A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 08:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfLCHYy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 02:24:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57220 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfLCHYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 02:24:54 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0E87309;
        Tue,  3 Dec 2019 08:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575357891;
        bh=sAQFNNZ440Vab1+8Na2Bxa9TGm6vttJhJrontuPgDZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YD9x8SmLLYHikneU71eOyZ8x2fR/msfR6zJzJz8pqI9yULDm3Gmv01HVjW8BqAEU/
         TLO3y1j77KJFRcRvihUH6UIEo9145O7D9VROBibD3cpUSdelgQQzNQhWX9rzGc8OaV
         hQhTcoJxvfBQ7AjDlKEU0/lyx+8KH10mW6epkakg=
Date:   Tue, 3 Dec 2019 09:24:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
Message-ID: <20191203072443.GK4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Mon, Dec 02, 2019 at 08:32:04PM +0100, Sam Ravnborg wrote:
> This patchset include a couple of different
> things - all related to panels.
> 
> - The panel callbacks are optional - so drop error if
>   callback is not present.
>  
> - Add support for backlight in drm_panel.
>   This allows us to make much simpler backlight
>   support to most panels.
>   The patchset include conversion of most of the
>   trivial cases.
> 
> - Drop drm_connector from drm_panel.
>   This change required many changes to most
>   panels and many bridges and display drivers.
>   This is by far the most invasive change in this patchset.
> 
> - Drop the unused get_timings() callback.
>   No users, so no need to keep it around.
> 
> With this patchset drm_panel_(attach|detach) are nop's
> but they are kept for now.
> 
> A few of these patches has been sent out before - but versioning
> started again from v1 - as the most patches are new.
> 
> I have tested the panel-simple changes, and thus some
> of the infrastructure changes.
> The testing was done on an earlier iteration - and I ended
> up submitting this as Laurent and others started to depend on it.
> Jitao has a patch to add more callbacks, and I wanted the
> simplification of the callbacks before we add more callbacks.

Great series !!! Thanks for working on this.

> Sam Ravnborg (26):
>       drm/drm_panel: no error when no callback
>       drm/panel: add backlight support
>       drm/panel: simple: use drm_panel backlight support
>       drm: get drm_bridge_panel connector via helper
>       drm/panel: add drm_connector argument to get_modes()
>       drm/panel: decouple connector from drm_panel
>       drm/panel: remove get_timings
>       drm/panel: drop drm_device from drm_panel
>       drm/panel: feiyang-fy07024di26a30d: use drm_panel backlight support
>       drm/panel: ilitek-ili9881c: use drm_panel backlight support
>       drm/panel: innolux-p079zca: use drm_panel backlight support
>       drm/panel: kingdisplay-kd097d04: use drm_panel backlight support
>       drm/panel: lvds: use drm_panel backlight support
>       drm/panel: olimex-lcd-olinuxino: use drm_panel backlight support
>       drm/panel: osd-osd101t2587-53ts: use drm_panel backlight support
>       drm/panel: panasonic-vvx10f034n00: use drm_panel backlight support
>       drm/panel: raydium-rm68200: use drm_panel backlight support
>       drm/panel: rocktech-jh057n00900: use drm_panel backlight support
>       drm/panel: ronbo-rb070d30: use drm_panel backlight support
>       drm/panel: seiko-43wvf1g: use drm_panel backlight support
>       drm/panel: sharp-lq101r1sx01: use drm_panel backlight support
>       drm/panel: sharp-ls043t1le01: use drm_panel backlight support
>       drm/panel: sitronix-st7701: use drm_panel backlight support
>       drm/panel: sitronix-st7789v: use drm_panel backlight support
>       drm/panel: tpo-td028ttec1: use drm_panel backlight support
>       drm/panel: tpo-tpg110: use drm_panel backlight support

For patches 09/26 to 26/26,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   2 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   2 +-
>  drivers/gpu/drm/bridge/panel.c                     |  18 +++-
>  drivers/gpu/drm/bridge/parade-ps8622.c             |   2 +-
>  drivers/gpu/drm/bridge/tc358764.c                  |   2 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   2 +-
>  drivers/gpu/drm/drm_panel.c                        |  96 ++++++++++++++----
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   2 +-
>  drivers/gpu/drm/imx/imx-ldb.c                      |   2 +-
>  drivers/gpu/drm/imx/parallel-display.c             |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   2 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_out.c                  |   2 +-
>  drivers/gpu/drm/omapdrm/omap_connector.c           |   3 +-
>  drivers/gpu/drm/panel/panel-arm-versatile.c        |   6 +-
>  .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |  16 ++-
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  20 ++--
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  29 ++----
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  45 +++------
>  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |  11 ++-
>  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |  43 +++-----
>  drivers/gpu/drm/panel/panel-lg-lb035q02.c          |   6 +-
>  drivers/gpu/drm/panel/panel-lg-lg4573.c            |  12 +--
>  drivers/gpu/drm/panel/panel-lvds.c                 |  46 ++-------
>  drivers/gpu/drm/panel/panel-nec-nl8048hl11.c       |   6 +-
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c      |   6 +-
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |  27 ++---
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |  11 ++-
>  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |  37 +++----
>  .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |  58 +++--------
>  .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   9 +-
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c      |   8 +-
>  drivers/gpu/drm/panel/panel-raydium-rm68200.c      |  26 +++--
>  drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c |  35 +++----
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |  31 ++----
>  drivers/gpu/drm/panel/panel-samsung-ld9040.c       |   4 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   6 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |   4 +-
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |  72 +++-----------
>  drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |  34 +++----
>  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |   6 +-
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |  33 +++----
>  drivers/gpu/drm/panel/panel-simple.c               | 110 ++++++---------------
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  23 ++---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |  49 ++-------
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   6 +-
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |  20 ++--
>  drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |   6 +-
>  drivers/gpu/drm/panel/panel-tpo-tpg110.c           |  26 ++---
>  drivers/gpu/drm/panel/panel-truly-nt35597.c        |   4 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                  |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                      |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   2 +-
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   2 +-
>  drivers/gpu/drm/tegra/output.c                     |   2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c                |   2 +-
>  include/drm/drm_bridge.h                           |   1 +
>  include/drm/drm_panel.h                            |  49 ++++-----
>  68 files changed, 460 insertions(+), 664 deletions(-)

-- 
Regards,

Laurent Pinchart
