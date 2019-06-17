Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E95F748785
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 17:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfFQPjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 11:39:35 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45298 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbfFQPjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 11:39:35 -0400
Received: by mail-ed1-f67.google.com with SMTP id a14so16760694edv.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ie6V4/TRcgdvGzoxLYWW2yYXEDbRcbfIZ3mNqXhQ/lw=;
        b=P4cqluHFTtV/Kzgd4G6huXy7j3oseRxvYgxp4qzYMYRD2RI0oZ/Oi3+z7AhX7A7Zwa
         ItldnOgJ2oXgDQTJajgm9YOQjYjxb/gOzi+6IZ83+8WtTq+IZdVH6oDlcU6bOsgw5FvJ
         e1dJ+Rs9P6GWQs48bcLDWsNwITGDglrr7SpHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ie6V4/TRcgdvGzoxLYWW2yYXEDbRcbfIZ3mNqXhQ/lw=;
        b=Cp6oxTNoTTE46rOxJIxaJAnlzOtaYPGbXmyqoemjUctwJCooKG59sIcra+qSWkkUZK
         VFLOQGRD8UDvetSWVmZRdBE3EwQcQNFKLfg/MLdDSNagZ5b86BOUsMp7jew6YYfijXbO
         /oOjKm2ZCz4TV5ZRXsbeihhZtzZVk/rnu9RSyovKjbdbiM0f/8+VVMjqNzBV3CaWmV8g
         7lkA3DfJ+QjkgJfsqhT0LhHiFLWMuA8HOTBiXa9Bi43yrAgaSp/dKPpNYDHzCrsKlpy6
         UUzl/gpwzF2ChZw5AKTmMaosQ7QCMvDhy9BNmURGwM8EwV8K8QtbpFw+7RDZtitYgqgy
         AOjw==
X-Gm-Message-State: APjAAAUy/LU9Nne48TNMmdkVtsARlcw0umJVfolX3j+3YByB0sBODaxO
        9SW+suKHmVQMQqDhUbEW3/iPCg==
X-Google-Smtp-Source: APXvYqwiiI6giVfMSmv7pkWIVuVJboE0qbpINGZSoaC+zGQnvmB94aL1etPa7Twg74yMJEEyOGGh0A==
X-Received: by 2002:a17:906:7e58:: with SMTP id z24mr81723282ejr.64.1560785971170;
        Mon, 17 Jun 2019 08:39:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id q11sm3806889edd.51.2019.06.17.08.39.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 08:39:30 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, Eric Anholt <eric@anholt.net>,
        Daniel Vetter <daniel.vetter@intel.com>,
        amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        spice-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        xen-devel@lists.xenproject.org
Subject: [PATCH] drm/prime: Actually remove DRIVER_PRIME everywhere
Date:   Mon, 17 Jun 2019 17:39:24 +0200
Message-Id: <20190617153924.414-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Split out to make the functional changes stick out more.

v2: amdgpu gained DRIVER_SYNCOBJ_TIMELINE.

v3: amdgpu lost DRIVER_SYNCOBJ_TIMELINE.

v4: Don't add a space in i915_drv.c (Sam)

Cc: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-tegra@vger.kernel.org
Cc: nouveau@lists.freedesktop.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: spice-devel@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         | 2 +-
 drivers/gpu/drm/arc/arcpgu_drv.c                | 3 +--
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                 | 4 +---
 drivers/gpu/drm/arm/malidp_drv.c                | 3 +--
 drivers/gpu/drm/armada/armada_drv.c             | 3 +--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         | 3 +--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    | 4 +---
 drivers/gpu/drm/bochs/bochs_drv.c               | 3 +--
 drivers/gpu/drm/cirrus/cirrus.c                 | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c           | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_drv.c         | 2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 3 +--
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 3 +--
 drivers/gpu/drm/i915/i915_drv.c                 | 2 +-
 drivers/gpu/drm/imx/imx-drm-core.c              | 3 +--
 drivers/gpu/drm/lima/lima_drv.c                 | 2 +-
 drivers/gpu/drm/mcde/mcde_drv.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 3 +--
 drivers/gpu/drm/meson/meson_drv.c               | 4 +---
 drivers/gpu/drm/msm/msm_drv.c                   | 1 -
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               | 3 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c           | 2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c              | 2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c         | 3 +--
 drivers/gpu/drm/pl111/pl111_drv.c               | 2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                   | 3 +--
 drivers/gpu/drm/radeon/radeon_drv.c             | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c           | 3 +--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 3 +--
 drivers/gpu/drm/shmobile/shmob_drm_drv.c        | 3 +--
 drivers/gpu/drm/sti/sti_drv.c                   | 3 +--
 drivers/gpu/drm/stm/drv.c                       | 3 +--
 drivers/gpu/drm/sun4i/sun4i_drv.c               | 2 +-
 drivers/gpu/drm/tegra/drm.c                     | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c             | 3 +--
 drivers/gpu/drm/tinydrm/hx8357d.c               | 2 +-
 drivers/gpu/drm/tinydrm/ili9225.c               | 3 +--
 drivers/gpu/drm/tinydrm/ili9341.c               | 2 +-
 drivers/gpu/drm/tinydrm/mi0283qt.c              | 3 +--
 drivers/gpu/drm/tinydrm/repaper.c               | 3 +--
 drivers/gpu/drm/tinydrm/st7586.c                | 3 +--
 drivers/gpu/drm/tinydrm/st7735r.c               | 3 +--
 drivers/gpu/drm/tve200/tve200_drv.c             | 3 +--
 drivers/gpu/drm/udl/udl_drv.c                   | 2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                   | 1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.c            | 2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                   | 1 -
 drivers/gpu/drm/vgem/vgem_drv.c                 | 3 +--
 drivers/gpu/drm/virtio/virtgpu_drv.c            | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c             | 2 +-
 drivers/gpu/drm/xen/xen_drm_front.c             | 3 +--
 drivers/gpu/drm/zte/zx_drm_drv.c                | 3 +--
 include/drm/drm_drv.h                           | 6 ------
 54 files changed, 50 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 0a577a389024..8e1b269351e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1309,7 +1309,7 @@ static struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_ATOMIC |
 	    DRIVER_GEM |
-	    DRIVER_PRIME | DRIVER_RENDER | DRIVER_MODESET | DRIVER_SYNCOBJ,
+	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_SYNCOBJ,
 	.load = amdgpu_driver_load_kms,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index af60c6d7a5f4..74240cc1c300 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -135,8 +135,7 @@ static int arcpgu_debugfs_init(struct drm_minor *minor)
 #endif
 
 static struct drm_driver arcpgu_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
-			   DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name = "arcpgu",
 	.desc = "ARC PGU Controller",
 	.date = "20160219",
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 86f6542afb40..0c6396dc323f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -56,7 +56,7 @@ static irqreturn_t komeda_kms_irq_handler(int irq, void *data)
 
 static struct drm_driver komeda_kms_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC |
-			   DRIVER_PRIME | DRIVER_HAVE_IRQ,
+			   DRIVER_HAVE_IRQ,
 	.lastclose			= drm_fb_helper_lastclose,
 	.irq_handler			= komeda_kms_irq_handler,
 	.gem_free_object_unlocked	= drm_gem_cma_free_object,
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 8fc0b884c428..b126555895d8 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -229,9 +229,7 @@ static int hdlcd_debugfs_init(struct drm_minor *minor)
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver hdlcd_driver = {
-	.driver_features = DRIVER_GEM |
-			   DRIVER_MODESET | DRIVER_PRIME |
-			   DRIVER_ATOMIC,
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.irq_handler = hdlcd_irq,
 	.irq_preinstall = hdlcd_irq_preinstall,
 	.irq_postinstall = hdlcd_irq_postinstall,
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index af1992f06a1d..5dccc7130739 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -568,8 +568,7 @@ static int malidp_debugfs_init(struct drm_minor *minor)
 #endif //CONFIG_DEBUG_FS
 
 static struct drm_driver malidp_driver = {
-	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC |
-			   DRIVER_PRIME,
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.dumb_create = malidp_dumb_create,
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index e660c5ca52ae..78c8ad73ae1e 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -43,8 +43,7 @@ static struct drm_driver armada_drm_driver = {
 	.name			= "armada-drm",
 	.desc			= "Armada SoC DRM",
 	.date			= "20120730",
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET |
-				  DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.ioctls			= armada_ioctls,
 	.fops			= &armada_drm_fops,
 };
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index eeb22eccd1fc..ada2f6aca906 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -194,8 +194,7 @@ static void aspeed_gfx_unload(struct drm_device *drm)
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver aspeed_gfx_driver = {
-	.driver_features        = DRIVER_GEM | DRIVER_MODESET |
-				DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.gem_create_object	= drm_cma_gem_create_object_default_funcs,
 	.dumb_create		= drm_gem_cma_dumb_create,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index fb2e7646daeb..274fdf18cde8 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -834,9 +834,7 @@ static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver atmel_hlcdc_dc_driver = {
-	.driver_features = DRIVER_GEM |
-			   DRIVER_MODESET | DRIVER_PRIME |
-			   DRIVER_ATOMIC,
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.irq_handler = atmel_hlcdc_dc_irq_handler,
 	.irq_preinstall = atmel_hlcdc_dc_irq_uninstall,
 	.irq_postinstall = atmel_hlcdc_dc_irq_postinstall,
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index 8f3a5bda9d03..78ad6c98861d 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -65,8 +65,7 @@ static const struct file_operations bochs_fops = {
 };
 
 static struct drm_driver bochs_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC |
-				  DRIVER_PRIME,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &bochs_fops,
 	.name			= "bochs-drm",
 	.desc			= "bochs dispi vga interface (qemu stdvga)",
diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
index be4ea370ba31..36a69aec8a4b 100644
--- a/drivers/gpu/drm/cirrus/cirrus.c
+++ b/drivers/gpu/drm/cirrus/cirrus.c
@@ -513,7 +513,7 @@ static void cirrus_mode_config_init(struct cirrus_device *cirrus)
 DEFINE_DRM_GEM_SHMEM_FOPS(cirrus_fops);
 
 static struct drm_driver cirrus_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC | DRIVER_PRIME,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
 	.name		 = DRIVER_NAME,
 	.desc		 = DRIVER_DESC,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7eb7cf9c3fa8..db3b00031fcf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -462,9 +462,7 @@ static const struct file_operations fops = {
 };
 
 static struct drm_driver etnaviv_drm_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_PRIME |
-				DRIVER_RENDER,
+	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
 	.open               = etnaviv_open,
 	.postclose           = etnaviv_postclose,
 	.gem_free_object_unlocked = etnaviv_gem_free_object,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index ba8932af9b43..e43640fc42d3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -114,7 +114,7 @@ static const struct file_operations exynos_drm_driver_fops = {
 };
 
 static struct drm_driver exynos_drm_driver = {
-	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM
 				  | DRIVER_ATOMIC | DRIVER_RENDER,
 	.open			= exynos_drm_open,
 	.lastclose		= drm_fb_helper_lastclose,
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index e81daaaa5965..d18ff729d7f6 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -133,8 +133,7 @@ static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
 DEFINE_DRM_GEM_CMA_FOPS(fsl_dcu_drm_fops);
 
 static struct drm_driver fsl_dcu_drm_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET
-				| DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.load			= fsl_dcu_load,
 	.unload			= fsl_dcu_unload,
 	.irq_handler		= fsl_dcu_drm_irq,
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 7cb7c042b93f..73f2b53f32cc 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -117,8 +117,7 @@ static int kirin_gem_cma_dumb_create(struct drm_file *file,
 }
 
 static struct drm_driver kirin_drm_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &kirin_drm_fops,
 
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 535b9be4fc58..446cad529a24 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -3194,7 +3194,7 @@ static struct drm_driver driver = {
 	 * deal with them for Intel hardware.
 	 */
 	.driver_features =
-	    DRIVER_GEM | DRIVER_PRIME |
+	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ,
 	.release = i915_driver_release,
 	.open = i915_driver_open,
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 3e8bece620df..384db6d86da0 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -147,8 +147,7 @@ static const struct drm_ioctl_desc imx_drm_ioctls[] = {
 };
 
 static struct drm_driver imx_drm_driver = {
-	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
 	.dumb_create		= drm_gem_cma_dumb_create,
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index b29c26cd13b2..beb10bc1a7f3 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -252,7 +252,7 @@ static const struct file_operations lima_drm_driver_fops = {
 };
 
 static struct drm_driver lima_drm_driver = {
-	.driver_features    = DRIVER_RENDER | DRIVER_GEM | DRIVER_PRIME | DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
 	.open               = lima_drm_driver_open,
 	.postclose          = lima_drm_driver_postclose,
 	.ioctls             = lima_drm_driver_ioctls,
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index baf63fb6850a..f731d689d52f 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -237,7 +237,7 @@ DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
 
 static struct drm_driver mcde_drm_driver = {
 	.driver_features =
-		DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME | DRIVER_ATOMIC,
+		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.release = mcde_release,
 	.lastclose = drm_fb_helper_lastclose,
 	.ioctls = NULL,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 95fdbd0fbcac..1f8b8943b0c6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -321,8 +321,7 @@ static const struct file_operations mtk_drm_fops = {
 };
 
 static struct drm_driver mtk_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
-			   DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
 	.gem_free_object_unlocked = mtk_drm_gem_free_object,
 	.gem_vm_ops = &drm_gem_cma_vm_ops,
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 2310c96fff46..140363f93575 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -93,9 +93,7 @@ static int meson_dumb_create(struct drm_file *file, struct drm_device *dev,
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver meson_driver = {
-	.driver_features	= DRIVER_GEM |
-				  DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
 	/* IRQ */
 	.irq_handler		= meson_irq,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 31deb87abfc6..87f92d3906ab 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1016,7 +1016,6 @@ static const struct file_operations fops = {
 
 static struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
-				DRIVER_PRIME |
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 6fafc90da4ec..b5bcaf4036bd 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -313,8 +313,7 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver mxsfb_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET |
-				  DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.irq_handler		= mxsfb_irq_handler,
 	.irq_preinstall		= mxsfb_irq_preinstall,
 	.irq_uninstall		= mxsfb_irq_preinstall,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7c2fcaba42d6..8cb174f95448 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1105,7 +1105,7 @@ nouveau_driver_fops = {
 static struct drm_driver
 driver_stub = {
 	.driver_features =
-		DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME | DRIVER_RENDER
+		DRIVER_GEM | DRIVER_MODESET | DRIVER_RENDER
 #if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
 		| DRIVER_KMS_LEGACY_CONTEXT
 #endif
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 672e0f8ad11c..5929f8688e5a 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -524,7 +524,7 @@ static const struct file_operations omapdriver_fops = {
 };
 
 static struct drm_driver omap_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM  | DRIVER_PRIME |
+	.driver_features = DRIVER_MODESET | DRIVER_GEM  |
 		DRIVER_ATOMIC | DRIVER_RENDER,
 	.open = dev_open,
 	.lastclose = drm_fb_helper_lastclose,
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index d11e2281dde6..ed2e29826f62 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -342,8 +342,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 DEFINE_DRM_GEM_SHMEM_FOPS(panfrost_drm_driver_fops);
 
 static struct drm_driver panfrost_drm_driver = {
-	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_PRIME |
-				  DRIVER_SYNCOBJ,
+	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
 	.open			= panfrost_open,
 	.postclose		= panfrost_postclose,
 	.ioctls			= panfrost_drm_driver_ioctls,
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 01f8462aa2db..dd4aaa380250 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -224,7 +224,7 @@ DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
 
 static struct drm_driver pl111_drm_driver = {
 	.driver_features =
-		DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME | DRIVER_ATOMIC,
+		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.ioctls = NULL,
 	.fops = &drm_fops,
 	.name = "pl111",
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index f33e349c4ec5..61e1ce16fc25 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -247,8 +247,7 @@ static struct pci_driver qxl_pci_driver = {
 };
 
 static struct drm_driver qxl_driver = {
-	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-			   DRIVER_ATOMIC,
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
 	.dumb_create = qxl_mode_dumb_create,
 	.dumb_map_offset = qxl_mode_dumb_mmap,
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index a6cbe11f79c6..3b07aa6e551d 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -539,7 +539,7 @@ radeon_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
 
 static struct drm_driver kms_driver = {
 	.driver_features =
-	    DRIVER_USE_AGP | DRIVER_GEM | DRIVER_PRIME | DRIVER_RENDER,
+	    DRIVER_USE_AGP | DRIVER_GEM | DRIVER_RENDER,
 	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 6df37c2a9678..83685250319d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -441,8 +441,7 @@ MODULE_DEVICE_TABLE(of, rcar_du_of_table);
 DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
 
 static struct drm_driver rcar_du_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
-				| DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 53d2c5bd61dc..59091b6241ec 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -212,8 +212,7 @@ static const struct file_operations rockchip_drm_driver_fops = {
 };
 
 static struct drm_driver rockchip_drm_driver = {
-	.driver_features	= DRIVER_MODESET | DRIVER_GEM |
-				  DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.lastclose		= drm_fb_helper_lastclose,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
 	.gem_free_object_unlocked = rockchip_gem_free_object,
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index cb821adfc321..9047a49ff35e 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -127,8 +127,7 @@ static irqreturn_t shmob_drm_irq(int irq, void *arg)
 DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
 
 static struct drm_driver shmob_drm_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET
-				| DRIVER_PRIME,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
 	.irq_handler		= shmob_drm_irq,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index bb6ae6dd66c9..d9f63c9f287b 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -141,8 +141,7 @@ static void sti_mode_config_init(struct drm_device *dev)
 DEFINE_DRM_GEM_CMA_FOPS(sti_driver_fops);
 
 static struct drm_driver sti_driver = {
-	.driver_features = DRIVER_MODESET |
-	    DRIVER_GEM | DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.dumb_create = drm_gem_cma_dumb_create,
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 5659572151a8..4026c33ccc39 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -54,8 +54,7 @@ static int stm_gem_cma_dumb_create(struct drm_file *file,
 DEFINE_DRM_GEM_CMA_FOPS(drv_driver_fops);
 
 static struct drm_driver drv_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
-			   DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name = "stm",
 	.desc = "STMicroelectronics SoC DRM",
 	.date = "20170330",
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 1a1b52e6f73e..d0fda2bf8224 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -38,7 +38,7 @@ static int drm_sun4i_gem_dumb_create(struct drm_file *file_priv,
 DEFINE_DRM_GEM_CMA_FOPS(sun4i_drv_fops);
 
 static struct drm_driver sun4i_drv_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
 	/* Generic Operations */
 	.fops			= &sun4i_drv_fops,
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 0c5f1e6a0446..87a1443406ab 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1007,7 +1007,7 @@ static int tegra_debugfs_init(struct drm_minor *minor)
 #endif
 
 static struct drm_driver tegra_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
+	.driver_features = DRIVER_MODESET | DRIVER_GEM |
 			   DRIVER_ATOMIC | DRIVER_RENDER,
 	.load = tegra_drm_load,
 	.unload = tegra_drm_unload,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3030af9e7b35..92307959435a 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -512,8 +512,7 @@ static int tilcdc_debugfs_init(struct drm_minor *minor)
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver tilcdc_driver = {
-	.driver_features    = (DRIVER_GEM | DRIVER_MODESET |
-			       DRIVER_PRIME | DRIVER_ATOMIC),
+	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.irq_handler        = tilcdc_irq,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_print_info     = drm_gem_cma_print_info,
diff --git a/drivers/gpu/drm/tinydrm/hx8357d.c b/drivers/gpu/drm/tinydrm/hx8357d.c
index 5773d0fb6ca1..be197c5c3211 100644
--- a/drivers/gpu/drm/tinydrm/hx8357d.c
+++ b/drivers/gpu/drm/tinydrm/hx8357d.c
@@ -193,7 +193,7 @@ static const struct drm_display_mode yx350hv15_mode = {
 DEFINE_DRM_GEM_CMA_FOPS(hx8357d_fops);
 
 static struct drm_driver hx8357d_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &hx8357d_fops,
 	.release		= mipi_dbi_release,
 	DRM_GEM_CMA_VMAP_DRIVER_OPS,
diff --git a/drivers/gpu/drm/tinydrm/ili9225.c b/drivers/gpu/drm/tinydrm/ili9225.c
index ea69019f2f33..7a8e1b4a37ee 100644
--- a/drivers/gpu/drm/tinydrm/ili9225.c
+++ b/drivers/gpu/drm/tinydrm/ili9225.c
@@ -350,8 +350,7 @@ static const struct drm_display_mode ili9225_mode = {
 DEFINE_DRM_GEM_CMA_FOPS(ili9225_fops);
 
 static struct drm_driver ili9225_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &ili9225_fops,
 	.release		= mipi_dbi_release,
 	DRM_GEM_CMA_VMAP_DRIVER_OPS,
diff --git a/drivers/gpu/drm/tinydrm/ili9341.c b/drivers/gpu/drm/tinydrm/ili9341.c
index 4ade9e4b924f..00f28b8e4345 100644
--- a/drivers/gpu/drm/tinydrm/ili9341.c
+++ b/drivers/gpu/drm/tinydrm/ili9341.c
@@ -149,7 +149,7 @@ static const struct drm_display_mode yx240qv29_mode = {
 DEFINE_DRM_GEM_CMA_FOPS(ili9341_fops);
 
 static struct drm_driver ili9341_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &ili9341_fops,
 	.release		= mipi_dbi_release,
 	DRM_GEM_CMA_VMAP_DRIVER_OPS,
diff --git a/drivers/gpu/drm/tinydrm/mi0283qt.c b/drivers/gpu/drm/tinydrm/mi0283qt.c
index fdefa53455d4..7a14d6b355f2 100644
--- a/drivers/gpu/drm/tinydrm/mi0283qt.c
+++ b/drivers/gpu/drm/tinydrm/mi0283qt.c
@@ -153,8 +153,7 @@ static const struct drm_display_mode mi0283qt_mode = {
 DEFINE_DRM_GEM_CMA_FOPS(mi0283qt_fops);
 
 static struct drm_driver mi0283qt_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &mi0283qt_fops,
 	.release		= mipi_dbi_release,
 	DRM_GEM_CMA_VMAP_DRIVER_OPS,
diff --git a/drivers/gpu/drm/tinydrm/repaper.c b/drivers/gpu/drm/tinydrm/repaper.c
index 97a874b40394..85acfccefcdb 100644
--- a/drivers/gpu/drm/tinydrm/repaper.c
+++ b/drivers/gpu/drm/tinydrm/repaper.c
@@ -925,8 +925,7 @@ static const u8 repaper_e2271cs021_cs[] = { 0x00, 0x00, 0x00, 0x7f,
 DEFINE_DRM_GEM_CMA_FOPS(repaper_fops);
 
 static struct drm_driver repaper_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &repaper_fops,
 	.release		= repaper_release,
 	DRM_GEM_CMA_VMAP_DRIVER_OPS,
diff --git a/drivers/gpu/drm/tinydrm/st7586.c b/drivers/gpu/drm/tinydrm/st7586.c
index 9ac626265152..204face7b311 100644
--- a/drivers/gpu/drm/tinydrm/st7586.c
+++ b/drivers/gpu/drm/tinydrm/st7586.c
@@ -296,8 +296,7 @@ static const struct drm_display_mode st7586_mode = {
 DEFINE_DRM_GEM_CMA_FOPS(st7586_fops);
 
 static struct drm_driver st7586_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &st7586_fops,
 	.release		= mipi_dbi_release,
 	DRM_GEM_CMA_VMAP_DRIVER_OPS,
diff --git a/drivers/gpu/drm/tinydrm/st7735r.c b/drivers/gpu/drm/tinydrm/st7735r.c
index ce9109e613e0..b23899788f5b 100644
--- a/drivers/gpu/drm/tinydrm/st7735r.c
+++ b/drivers/gpu/drm/tinydrm/st7735r.c
@@ -123,8 +123,7 @@ static const struct drm_display_mode jd_t18003_t01_mode = {
 DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
 
 static struct drm_driver st7735r_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC,
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &st7735r_fops,
 	.release		= mipi_dbi_release,
 	DRM_GEM_CMA_VMAP_DRIVER_OPS,
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 6e695fbeb6bc..a1f614e21fcc 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -137,8 +137,7 @@ static int tve200_modeset_init(struct drm_device *dev)
 DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
 
 static struct drm_driver tve200_drm_driver = {
-	.driver_features =
-		DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.ioctls = NULL,
 	.fops = &drm_fops,
 	.name = "tve200",
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 4a49facb608d..ae53bf75c1d6 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -54,7 +54,7 @@ static void udl_driver_release(struct drm_device *dev)
 }
 
 static struct drm_driver driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM,
 	.release = udl_driver_release,
 
 	/* gem hooks */
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index fea597f4db8a..a1604705faee 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -188,7 +188,6 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
 static struct drm_driver v3d_drm_driver = {
 	.driver_features = (DRIVER_GEM |
 			    DRIVER_RENDER |
-			    DRIVER_PRIME |
 			    DRIVER_SYNCOBJ),
 
 	.open = v3d_open,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 02537ab9cc08..a7fd194c81a9 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -196,7 +196,7 @@ static const struct file_operations vbox_fops = {
 
 static struct drm_driver driver = {
 	.driver_features =
-	    DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME | DRIVER_ATOMIC,
+	    DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
 	.lastclose = drm_fb_helper_lastclose,
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 0f99ad03614e..ed4fe7ed9e64 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -180,7 +180,6 @@ static struct drm_driver vc4_drm_driver = {
 			    DRIVER_ATOMIC |
 			    DRIVER_GEM |
 			    DRIVER_RENDER |
-			    DRIVER_PRIME |
 			    DRIVER_SYNCOBJ),
 	.open = vc4_open,
 	.postclose = vc4_close,
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 11a8f99ba18c..68c340cfde51 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -427,8 +427,7 @@ static void vgem_release(struct drm_device *dev)
 }
 
 static struct drm_driver vgem_driver = {
-	.driver_features		= DRIVER_GEM | DRIVER_PRIME |
-					  DRIVER_RENDER,
+	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
 	.release			= vgem_release,
 	.open				= vgem_open,
 	.postclose			= vgem_postclose,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index c50868753132..0afdf51fdcfd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -195,7 +195,7 @@ static const struct file_operations virtio_gpu_driver_fops = {
 };
 
 static struct drm_driver driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME | DRIVER_RENDER | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 4ff11a0077e1..89b8eb047583 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1548,7 +1548,7 @@ static const struct file_operations vmwgfx_driver_fops = {
 
 static struct drm_driver driver = {
 	.driver_features =
-	DRIVER_MODESET | DRIVER_PRIME | DRIVER_RENDER | DRIVER_ATOMIC,
+	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC,
 	.load = vmw_driver_load,
 	.unload = vmw_driver_unload,
 	.lastclose = vmw_lastclose,
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 84aa4d61dc42..aeffec82a5ce 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -485,8 +485,7 @@ static const struct vm_operations_struct xen_drm_drv_vm_ops = {
 };
 
 static struct drm_driver xen_drm_driver = {
-	.driver_features           = DRIVER_GEM | DRIVER_MODESET |
-				     DRIVER_PRIME | DRIVER_ATOMIC,
+	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.release                   = xen_drm_drv_release,
 	.gem_vm_ops                = &xen_drm_drv_vm_ops,
 	.gem_free_object_unlocked  = xen_drm_drv_free_object_unlocked,
diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
index 28e8d6072910..060ad5266bc7 100644
--- a/drivers/gpu/drm/zte/zx_drm_drv.c
+++ b/drivers/gpu/drm/zte/zx_drm_drv.c
@@ -38,8 +38,7 @@ static const struct drm_mode_config_funcs zx_drm_mode_config_funcs = {
 DEFINE_DRM_GEM_CMA_FOPS(zx_drm_fops);
 
 static struct drm_driver zx_drm_driver = {
-	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-			   DRIVER_ATOMIC,
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.dumb_create = drm_gem_cma_dumb_create,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 5e1ba16d19c6..7bc4795319c4 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -61,12 +61,6 @@ enum drm_driver_feature {
 	 * Driver supports mode setting interfaces (KMS).
 	 */
 	DRIVER_MODESET			= BIT(1),
-	/**
-	 * @DRIVER_PRIME:
-	 *
-	 * Driver implements DRM PRIME buffer sharing.
-	 */
-	DRIVER_PRIME			= BIT(2),
 	/**
 	 * @DRIVER_RENDER:
 	 *
-- 
2.20.1

