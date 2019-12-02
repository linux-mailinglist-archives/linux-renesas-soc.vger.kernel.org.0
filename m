Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE32B10F133
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 20:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbfLBT7n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 14:59:43 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:47027 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727586AbfLBT7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:59:42 -0500
Received: by mail-il1-f195.google.com with SMTP id t17so815051ilm.13;
        Mon, 02 Dec 2019 11:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/1GIiVAt9IkBpoZ9Uj4zenbh/EnV7XYXqjcP5Gkayek=;
        b=InHq5aiL3hR9tFDnhuqx6aayq30VOPnHw69PCMZh0fSzKM55HtwqVJl0b4YhHu7o0S
         +vKSRzTuJwrb/lXpHGExaIBaelO+6e1no2J7UB2BWeJc2O8zSrV6zrjf11Joenv7+K+O
         bIOK66rwnalFLRsaiCMoP1L5Q+Gri2cgksvOUQua6x2NZ9JNO0modjT5LhxhvqbmC8dc
         2FZZWCxZ4UxsFPSHkDVN45m1Rxjv8DMuTLQZdROk5eqrpDHYKSl4SPzzPtiTLnQvNG4L
         Gdc25pYlvp0qSQqCaGqVXUgLhtnumBY8uup6p7tMk8yK2DpH0DcOK17AODcn1FefgjKv
         oLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/1GIiVAt9IkBpoZ9Uj4zenbh/EnV7XYXqjcP5Gkayek=;
        b=EP9OBlmFSylY4Q11Sems+Yi8x1vH/6WD5rWtnltu/NMokHQvz/wQutueTHejM0txvi
         Ifgw9montiJScWkTuzdjPJI3FlRiSmJZ55clpxm0gCdwYFoQrjZk4v/dRkkrIzYkkvnE
         ZpItF8eu8iFIS+xvnwf2EpmUSbt+VemT7s6LXCjpIp4Tm0TJUetFRPPqX5gkrctYKAhR
         dB6IMSI4AJRysKUm2nkxMJoeFpxTemzIrxVUup2fi/Wz6fEkBkYqE4lEHcjbKXbDKhHB
         SHjPZMYYQThj3wnnyP3OHGI+igAwOd6XFOS5Hl/tk2AdEfmGJCkbdqu4tUMQxhiBUoCs
         uChA==
X-Gm-Message-State: APjAAAUIh0yZnbqSI8B6EekfzYDRarb9+pI6514M5jb54TU5mwHvouw7
        4j50BaqCMxOzBxr04tPygL0ijzSdVELnsqlZijM=
X-Google-Smtp-Source: APXvYqx6YUMOUm+z16ig9xldwuTeM19+Bd22B3aBAblOLhFaOGglg7N1XrSehMoTWzvuuSea3OH9TLlXRGuqdFXhTE0=
X-Received: by 2002:a92:4891:: with SMTP id j17mr565262ilg.33.1575316780879;
 Mon, 02 Dec 2019 11:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 2 Dec 2019 12:59:29 -0700
Message-ID: <CAOCk7NoKPoxcETLYQ4CyAtYGnPwvYapdSavZM=aRdswDydTLEA@mail.gmail.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Purism Kernel Team <kernel@puri.sm>,
        linux-renesas-soc@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 2, 2019 at 12:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
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
>
>         Sam
>
>
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

How come the diff stat in the cover letter here indicates a change to
this file, yet I cannot find a change to this file in any of the
patches?  What am I missing?
