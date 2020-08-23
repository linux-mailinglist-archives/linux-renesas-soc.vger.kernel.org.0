Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D0224ECC5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Aug 2020 12:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgHWKpy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Aug 2020 06:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgHWKpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Aug 2020 06:45:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2CAC061573
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Aug 2020 03:45:51 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v12so6429240ljc.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Aug 2020 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Ial+5Nc2noRZ86O2pflKJVs+D+LQzvwReDE5AsQdzA=;
        b=aItt62qvVreI4OM2AS2Q+YTqggP7BNM3sCjEGwXFZC58BOmxs/kQK9OFI8jsO6uZ61
         doqW+ay95V1oLxkD2+dE1qf11Y74yrFDJDXQjS4W+DZc7nj9MvZDnf9g7EY0G5Ras6Jz
         5pxaxxcM1Ilzz3KUFu24KJTf+HStBQeRqe2SscXZ1CDXVHoYNAs2ifKA9//FR1TjIimU
         RoBksC8E0f2q5o1uF1+fJxqWM9zd3JJ2M0DShvMzYPlvg69yp6v0z1qVcEBEw4ryY6Ut
         p4gLOIbd82E+B2oMsdlTcLyAkBwQXlDnxoia7Fp9UFsSzqlp3pMbzNlIbZxiPJ0F9SKb
         O1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=5Ial+5Nc2noRZ86O2pflKJVs+D+LQzvwReDE5AsQdzA=;
        b=IT44S2JYNH16j65uL6hrDZ7cL7K2JLwVyW0U/4ET7Q5j906+PL0gam/C4n4xTPWQH9
         +tOwIWzS9kaLmRWSQ6dyLEFfNX+Gjxss2Thka1vmCeLFW5DVjmI++873RvhJOnaRPbOq
         vwlHrIeo1MRZdhGp9xLLWsn7IA3C6yd897WlMrPewznlIO+n11hf1iiL5HwdOrC/P8DV
         iwvOHSpbhqrTqMS1M9tr1QOU179DRqg65V9z/kYEXMKH8EI1hSiocUcFABR7MlBdKdHY
         UO8leYuxc3UCf97g7jHVvfDlvPtzjrTUKOVQqF6lzlwbC5OQw/S5vSdxVI4QHbIQcdIo
         tw/g==
X-Gm-Message-State: AOAM5332wiDezQpDHXrym8/HFEPBUrFTbz5uHAaw7AujQqfCPzboAcmi
        kmBPJeZr801h++jWmPIwzNY=
X-Google-Smtp-Source: ABdhPJztYredDYbqfU9prjYz75+tcEG+VEa9+w5D5KdAPAb1lS6xXhdElhL7Vs2yxI5jNwov/E162w==
X-Received: by 2002:a2e:a40b:: with SMTP id p11mr455753ljn.97.1598179548601;
        Sun, 23 Aug 2020 03:45:48 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
        by smtp.gmail.com with ESMTPSA id h13sm1516301lji.134.2020.08.23.03.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 03:45:47 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Rob Clark <robdclark@gmail.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Zheng Bin <zhengbin13@huawei.com>
Subject: [PATCH v2 0/24] backlight: add init macros and accessors
Date:   Sun, 23 Aug 2020 12:45:08 +0200
Message-Id: <20200823104532.1024798-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The first patch trims backlight_update_status() so it can be called with a NULL
backlight_device. Then the caller do not need to add this check just to avoid
a NULL reference.

The backlight drivers uses several different patterns when registering
a backlight:

- Register backlight and assign properties later
- Define a local backlight_properties variable and use memset
- Define a const backlight_properties and assign relevant properties

On top of this there was differences in what members was assigned.

To align how backlight drivers are initialized introduce following helper macros:
- DECLARE_BACKLIGHT_INIT_FIRMWARE()
- DECLARE_BACKLIGHT_INIT_PLATFORM()
- DECLARE_BACKLIGHT_INIT_RAW()

The macros are introduced in patch 2.

The backlight drivers used direct access to backlight_properties.
Encapsulate these in get/set access operations resulting in following benefits:
- The access methods can be called with a NULL pointer so logic around the
  access can be made simpler.
- The update_brightness and enable_brightness simplifies the users
- The code is in most cases more readable with the access operations.
- When everyone uses the access methods refactoring in the backlight core is simpler.

The get/set operations are introduced in patch 3.

The gpio backlight driver received a small overhaul in a set of three patches.
The result is a smaller and more readable driver.

The remaining patches updates all backlight users in drivers/gpu/drm/*
With this patch set all of drivers/gpu/drm/:
- All backlight references to FB_BLANK* are gone from drm/*
- All direct references to backlight properties are gone
- All panel drivers uses the devm_ variant for registering backlight
  Daniel Vetter had some concerns with this for future updates,
  but we are aligned now and can update if refoctoring demands it
- All panel drivers uses the backlight support in drm_panel

Individual patches are only sent to the people listed in the patch + a few more.
Please check https://lore.kernel.org/dri-devel/ for the full series.

v2:
  - Documented BACKLIGHT_PROPS as it may be used by drivers
  - Dropped backlight_set_power_{on,off}, they were a mistake (Daniel)
  - Added backlight_update_brightness() and use it (Daniel)
  - Added backlight_enable_brightness() and use it
  - Moved remaining drm_panel driver to use backlight support in drm_panel
  - gpio backlight driver overhaul

The patches are made on top of the for-backlight-next branch at
https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git
The branch needs v5.8-rc1 backported to build as dev_err_probe()
is used.

The first 6 patches are candidates for the backlight tree.
If they are applied then this should preferably be to an immutable
branch we can merge to drm-misc-next where the drm patches shall go.

The drm patches has known conflics and shall *not* be applied to the
backlight tree, they are included in this patchset to show how the
new functions are used.

Diffstat for the drm bits alone looks nice:
 25 files changed, 243 insertions(+), 460 deletions(-)

Feedback welcome!

	Sam

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Philippe CORNU <philippe.cornu@st.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Wambui Karuga <wambui.karugax@gmail.com>
Cc: Zheng Bin <zhengbin13@huawei.com>

Sam Ravnborg (24):
      backlight: Silently fail backlight_update_status() if no device
      backlight: Add DECLARE_* macro for device registration
      backlight: Add get/set operations for brightness properties
      backlight: gpio: Introduce backlight_{enable,disable}
      backlight: gpio: Use dev_err_probe()
      backlight: gpio: Use DECLARE_BACKLIGHT_INIT_RAW
      drm/gma500: Backlight update
      drm/panel: asus-z00t-tm5p5-n35596: Backlight update
      drm/panel: jdi-lt070me05000: Backlight update
      drm/panel: novatek-nt35510: Backlight update
      drm/panel: orisetech-otm8009a: Backlight update
      drm/panel: raydium-rm67191: Backlight update
      drm/panel: samsung-s6e63m0: Backlight update
      drm/panel: samsung-s6e63j0x03: Backlight update
      drm/panel: samsung-s6e3ha2: Backlight update
      drm/panel: sony-acx424akp: Backlight update
      drm/panel: sony-acx565akm: Backlight update
      drm/bridge: parade-ps8622: Backlight update
      drm/tilcdc: Backlight update
      drm/radeon: Backlight update
      drm/amdgpu/atom: Backlight update
      drm/i915: Backlight update
      drm/omap: display: Backlight update
      drm/shmobile: Backlight update

 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  19 +--
 drivers/gpu/drm/bridge/parade-ps8622.c             |  43 ++++---
 drivers/gpu/drm/gma500/backlight.c                 |  34 +----
 drivers/gpu/drm/gma500/cdv_device.c                |  24 ++--
 drivers/gpu/drm/gma500/mdfld_device.c              |   9 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |  10 +-
 drivers/gpu/drm/gma500/opregion.c                  |   2 +-
 drivers/gpu/drm/gma500/psb_device.c                |  10 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   7 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  88 ++++++-------
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c    |  37 +-----
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |  15 +--
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |  54 ++------
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   9 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |  14 +--
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |  11 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  70 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  53 ++++----
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |  25 ++--
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |  49 ++------
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |  47 +++----
 drivers/gpu/drm/radeon/atombios_encoders.c         |  24 ++--
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |  16 +--
 drivers/gpu/drm/shmobile/shmob_drm_backlight.c     |  20 ++-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |   9 +-
 drivers/video/backlight/gpio_backlight.c           |  41 +++---
 include/linux/backlight.h                          | 140 +++++++++++++++++++++
 27 files changed, 400 insertions(+), 480 deletions(-)


