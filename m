Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0691323BE64
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Aug 2020 18:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbgHDQvi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Aug 2020 12:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgHDQvc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 12:51:32 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E0AC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2020 09:51:31 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r2so32982789wrs.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2020 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wUbgutt9s0+CCMHi1qud9oNrcmOOFtkb66mgbjS4rEA=;
        b=IN57bkXjy0RshEYGFTxN/4j5lylwCW1mPwLmhq2YXvUbI3Wd9JDSoJzBPwZcL9ne3Z
         Ex451xozQNGVqEwiyxyIjQvrJFe7P80s6Nq1GfTnu994wYpwFdGXVkScEPlhUYrsPQg7
         1pFzVXlji7qZ2Q3SbPmtYaDk7Q+aSkCa+EVNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wUbgutt9s0+CCMHi1qud9oNrcmOOFtkb66mgbjS4rEA=;
        b=btq9pwF5W30JGcd/Jace8l0A453fA3rtWSuIl0SooIFjS9SfXVZ3/fQLm8HqSB+YDk
         LtPEZb5qfG9E0MYyoycT/dKRwxzDlju6w6da4bIi72ofA3Oo8uSpAPPgJqIidnXKDBMX
         UUYrMzt9vWP+8NEcTwzL0MuRp/xnTE+etV3rvxnuOBT09twXVprSbIdvQMZ8c4w5ex7d
         4dOPed0ezY4+XxJ/KW3jbRDHNbxMUQ7h8TQiKkDFR2qAgv9ybUKWIqsTQMBTNP8yBSJ2
         4R6uKjq6wKNBA3PEMBST87lcvypVrfMzch1RDJTV5BPhEYa9PbFj/9TPRcxLzvtBOekR
         8sFg==
X-Gm-Message-State: AOAM5339fbJH1xAbnBuzHwPAz5RQKq9GCiOucj3tYoHssI/hBOGg4vPJ
        LoZXROcDWBqDqIaqab8CTXQDSA==
X-Google-Smtp-Source: ABdhPJyt77JgawFZyjfhRmRpXgrohlDBQM6vv3o2xf0fZLT0bJ/pclPUCZUGXIWMuIDtEjV+vmatWA==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr19848772wrs.273.1596559890052;
        Tue, 04 Aug 2020 09:51:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o125sm5719234wma.27.2020.08.04.09.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 09:51:28 -0700 (PDT)
Date:   Tue, 4 Aug 2020 18:51:26 +0200
From:   daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans de Goede <hdegoede@redhat.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Jyri Sarha <jsarha@ti.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Rob Clark <robdclark@gmail.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Zheng Bin <zhengbin13@huawei.com>
Subject: Re: [RFC PATCH v1 0/22] backlight: add init macros and accessors
Message-ID: <20200804165126.GM6419@phenom.ffwll.local>
References: <20200802110636.1018743-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 02, 2020 at 01:06:14PM +0200, Sam Ravnborg wrote:
> The backlight drivers uses several different patterns when registering
> a backlight:
> 
> - Register backlight and assign properties later
> - Define a local backlight_properties variable and use memset
> - Define a const backlight_properties and assign relevant properties
> 
> On top of this there was differences in what members was assigned in
> backlight_properties.
> 
> To align how backlight drivers are initialized introduce following helper macros:
> - DECLARE_BACKLIGHT_INIT_FIRMWARE()
> - DECLARE_BACKLIGHT_INIT_PLATFORM()
> - DECLARE_BACKLIGHT_INIT_RAW()
> 
> The macros are introduced in patch 2.
> 
> The backlight drivers used direct access to backlight_properties.
> Encapsulate these in get/set access operations resulting in following benefits:
> - The drivers no longer need to be concerned about the confusing power states,
>   as there is now only a set_power_on() and set_power_off() operation.
> - The access methods can be called with a NULL pointer so logic around the
>   access can be made simpler.
> - The code is in most cases more readable with the access operations.
> - When everyone uses the access methods refactroring in the backlight core is simpler.
> 
> The get/set operations are introduced in patch 3.
> 
> The first patch trims backlight_update_status() so it can be called with a NULL
> backlight_device. Then the called do not need to add this check just to avoid
> a NULL reference.
> 
> The fourth patch introduce the new macros and get/set operations for the
> gpio backlight driver, as an example.
> 
> The remaining patches updates most backlight users in drivers/gpu/drm/*
> With this patch set applied then:
> - Almost all references to FB_BLANK* are gone from drm/*
> - All panel drivers uses devm_ variant for registering backlight
> - Almost all direct references to backlight properties are gone
> 
> The drm/* patches are  used as examples how drivers can benefit from the
> new macros and get/set operations.
> 
> Individual patches are only sent to the people listed in the patch + a few more.
> Please check https://lore.kernel.org/dri-devel/ for the full series.
> 
> Feedback welcome!

Since this needs backlight patches queued up outside of drm there's two
options:

- merge the backlight stuff through drm-misc (imo simplest, we have all
  the fbdev stuff in there too by now)
- shared topic branch merged in drm-misc and optionally backlight tree

Otherwise this is going to be a pain to merge.
-Daniel

> 
> 	Sam
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Konrad Dybcio <konradybcio@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Philippe CORNU <philippe.cornu@st.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Zheng Bin <zhengbin13@huawei.com>
> 
> Sam Ravnborg (22):
>       backlight: Silently fail backlight_update_status() if no device
>       backlight: Add DECLARE_* macro for device registration
>       backlight: Add get/set operations for brightness/power properties
>       backlight: gpio: Use DECLARE_BACKLIGHT_INIT_RAW and get/setters
>       drm/gma500: Backlight support
>       drm/panel: asus-z00t-tm5p5-n35596: Backlight update
>       drm/panel: jdi-lt070me05000: Backlight update
>       drm/panel: novatek-nt35510: Backlight update
>       drm/panel: orisetech-otm8009a: Backlight update
>       drm/panel: raydium-rm67191: Backlight update
>       drm/panel: samsung-s6e63m0: Backlight update
>       drm/panel: samsung-s6e63j0x03: Backlight update
>       drm/panel: samsung-s6e3ha2: Backlight update
>       drm/panel: sony-acx424akp: Backlight update
>       drm/panel: sony-acx565akm: Backlight update
>       drm/bridge: parade-ps8622: Backlight update
>       drm/tilcdc: Backlight update
>       drm/radeon: Backlight update
>       drm/amdgpu/atom: Backlight update
>       drm/i915: Backlight update
>       drm/omap: display: Backlight update
>       drm/shmobile: Backlight update
> 
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  15 ++-
>  drivers/gpu/drm/bridge/parade-ps8622.c             |  43 ++++----
>  drivers/gpu/drm/gma500/backlight.c                 |  35 ++----
>  drivers/gpu/drm/gma500/cdv_device.c                |  29 +++--
>  drivers/gpu/drm/gma500/mdfld_device.c              |   9 +-
>  drivers/gpu/drm/gma500/oaktrail_device.c           |  10 +-
>  drivers/gpu/drm/gma500/opregion.c                  |   2 +-
>  drivers/gpu/drm/gma500/psb_device.c                |  10 +-
>  drivers/gpu/drm/gma500/psb_drv.c                   |   8 +-
>  drivers/gpu/drm/i915/display/intel_panel.c         |  88 +++++++--------
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c    |  35 ++----
>  .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |  15 +--
>  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |  17 ++-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   9 +-
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |  14 +--
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c      |  11 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  68 ++++++------
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  56 +++++-----
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |  25 ++---
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c       |  49 ++-------
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c       |  44 +++-----
>  drivers/gpu/drm/radeon/atombios_encoders.c         |  23 ++--
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |  15 ++-
>  drivers/gpu/drm/shmobile/shmob_drm_backlight.c     |  20 ++--
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c              |  11 +-
>  drivers/video/backlight/gpio_backlight.c           |  17 ++-
>  include/linux/backlight.h                          | 120 +++++++++++++++++++++
>  27 files changed, 377 insertions(+), 421 deletions(-)
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
