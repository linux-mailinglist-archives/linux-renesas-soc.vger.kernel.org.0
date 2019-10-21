Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 246E9DF79C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 23:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJUVqD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Oct 2019 17:46:03 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42125 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUVqD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 17:46:03 -0400
Received: by mail-ot1-f67.google.com with SMTP id b16so1575743otk.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2019 14:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v85itWVb55sjk1S2/4vfjQdYVBkEeNhYbZwroc8bhoE=;
        b=VTehDItyPGZ4IfU6SF9ww9TbGI2D7+Ok1bIUM49j97S/svOaozZmWLJgAG6fsIFIS2
         hA9238BuIEI3Q29rwIRhgqSXbDW/P/uoLwcZAhHnLCy7xiGqotLFCy8Gz+2CrMuyfaVY
         pih5TT9/xINDouj3M7gUV3XX8aXBl4icjEy+ETC4nJ8NWFLjsecmZbn9lqcLo1j1sCK7
         gEl0CUYX8QOn7UMjWmWIGvR/3o+iGqqRcu8SbVXHlx6X6M8pPWP8ivjBiDIr2oyscQLu
         mA2DvlcvkiDlAtqKauWVL5wugM6bp/mLVTKBNiAe48SSQbg5Xa3I7Asl9iMBTO9j+Psl
         jEtg==
X-Gm-Message-State: APjAAAW8UZsb/1m64QIAmq6HUSExBnzhzRJRNDV/SE3imfNXuKCicp/H
        0KijYJxiBJTxZyz0e4cQDA==
X-Google-Smtp-Source: APXvYqzkNxCqlFqsK5HBa4boCVhpMxwfWAj66hdD/5mch5qmynl4RhUugcgkNWf4J602suw2X3Zo7Q==
X-Received: by 2002:a9d:5c0e:: with SMTP id o14mr57383otk.79.1571694361346;
        Mon, 21 Oct 2019 14:46:01 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 14:46:00 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>, CK Hu <ck.hu@mediatek.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rongrong Zou <zourongrong@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Vincent Abriou <vincent.abriou@st.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Brian Starkey <brian.starkey@arm.com>,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
Date:   Mon, 21 Oct 2019 16:45:48 -0500
Message-Id: <20191021214550.1461-5-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021214550.1461-1-robh@kernel.org>
References: <20191021214550.1461-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support in CMA helpers to handle callers specifying
DRM_MODE_DUMB_KERNEL_MAP flag. Existing behavior is maintained with this
change. drm_gem_cma_dumb_create() always creates a kernel mapping as
before. drm_gem_cma_dumb_create_internal() lets the caller set the flags
as desired. Therefore, update all the existing callers of
drm_gem_cma_dumb_create_internal() to also set the
DRM_MODE_DUMB_KERNEL_MAP flag.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  1 +
 drivers/gpu/drm/arm/malidp_drv.c              |  1 +
 drivers/gpu/drm/drm_gem_cma_helper.c          | 48 +++++++++++--------
 drivers/gpu/drm/meson/meson_drv.c             |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  1 +
 drivers/gpu/drm/stm/drv.c                     |  1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  1 +
 8 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index d49772de93e0..7cf0dc4cbfc1 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -31,6 +31,7 @@ static int komeda_gem_cma_dumb_create(struct drm_file *file,
 	u32 pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 
 	args->pitch = ALIGN(pitch, mdev->chip.bus_width);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_cma_dumb_create_internal(file, dev, args);
 }
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 8a76315aaa0f..aeb1a779ecc1 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -465,6 +465,7 @@ static int malidp_dumb_create(struct drm_file *file_priv,
 	u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 1);
 
 	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), alignment);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
 }
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 4cebfe01e6ea..f91e9e8adeaf 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -78,21 +78,8 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 	return ERR_PTR(ret);
 }
 
-/**
- * drm_gem_cma_create - allocate an object with the given size
- * @drm: DRM device
- * @size: size of the object to allocate
- *
- * This function creates a CMA GEM object and allocates a contiguous chunk of
- * memory as backing store. The backing memory has the writecombine attribute
- * set.
- *
- * Returns:
- * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
- * error code on failure.
- */
-struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
-					      size_t size)
+static struct drm_gem_cma_object *
+drm_gem_cma_create_flags(struct drm_device *drm, size_t size, u32 flags)
 {
 	struct drm_gem_cma_object *cma_obj;
 	int ret;
@@ -103,6 +90,9 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
+	if (!(flags & DRM_MODE_DUMB_KERNEL_MAP))
+		cma_obj->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+
 	cma_obj->vaddr = dma_alloc_attrs(drm->dev, size, &cma_obj->paddr,
 					 GFP_KERNEL | __GFP_NOWARN,
 					 cma_obj->dma_attrs);
@@ -119,6 +109,25 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	drm_gem_object_put_unlocked(&cma_obj->base);
 	return ERR_PTR(ret);
 }
+
+/**
+ * drm_gem_cma_create - allocate an object with the given size
+ * @drm: DRM device
+ * @size: size of the object to allocate
+ *
+ * This function creates a CMA GEM object and allocates a contiguous chunk of
+ * memory as backing store. The backing memory has the writecombine attribute
+ * set.
+ *
+ * Returns:
+ * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
+					      size_t size)
+{
+	return drm_gem_cma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
+}
 EXPORT_SYMBOL_GPL(drm_gem_cma_create);
 
 /**
@@ -139,14 +148,14 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
  */
 static struct drm_gem_cma_object *
 drm_gem_cma_create_with_handle(struct drm_file *file_priv,
-			       struct drm_device *drm, size_t size,
+			       struct drm_device *drm, size_t size, u32 flags,
 			       uint32_t *handle)
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *gem_obj;
 	int ret;
 
-	cma_obj = drm_gem_cma_create(drm, size);
+	cma_obj = drm_gem_cma_create_flags(drm, size, flags);
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
@@ -225,7 +234,7 @@ int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
 		args->size = args->pitch * args->height;
 
 	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 args->flags, &args->handle);
 	return PTR_ERR_OR_ZERO(cma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_internal);
@@ -256,9 +265,10 @@ int drm_gem_cma_dumb_create(struct drm_file *file_priv,
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	args->size = args->pitch * args->height;
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 args->flags, &args->handle);
 	return PTR_ERR_OR_ZERO(cma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create);
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 397c33182f4f..1593518dcbe4 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -81,6 +81,7 @@ static int meson_dumb_create(struct drm_file *file, struct drm_device *dev,
 	 */
 	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), SZ_64);
 	args->size = PAGE_ALIGN(args->pitch * args->height);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_cma_dumb_create_internal(file, dev, args);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 2dc9caee8767..c9b1f298ce7e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -299,6 +299,7 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 		align = 16 * args->bpp / 8;
 
 	args->pitch = roundup(min_pitch, align);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_cma_dumb_create_internal(file, dev, args);
 }
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 7582d0e6a60a..f09b9a035376 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
 	 * align to 64 bytes since Mali requires it.
 	 */
 	args->pitch = ALIGN(min_pitch, 64);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	args->size = args->pitch * args->height;
 
 	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 5a9f9aca8bc2..0f76a4ac95b3 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -47,6 +47,7 @@ static int stm_gem_cma_dumb_create(struct drm_file *file,
 	 */
 	args->pitch = roundup(min_pitch, 128);
 	args->height = roundup(args->height, 4);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_cma_dumb_create_internal(file, dev, args);
 }
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index a5757b11b730..f653a5d1e2d6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -34,6 +34,7 @@ static int drm_sun4i_gem_dumb_create(struct drm_file *file_priv,
 {
 	/* The hardware only allows even pitches for YUV buffers. */
 	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), 2);
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
 }
-- 
2.20.1

