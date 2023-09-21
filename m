Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B607A9614
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 19:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjIUQ6x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 12:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjIUQ6v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 12:58:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9051FCB;
        Thu, 21 Sep 2023 09:58:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3167DC116A6;
        Thu, 21 Sep 2023 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695293868;
        bh=D4CJzvXGDbUYSM2SUe0zO0nRz+N5sMZBQz4rRqjlLLY=;
        h=From:To:Cc:Subject:Date:From;
        b=ovyCAQunUD8FAaXg9OtUqXZhsrTYi1dn5KtiZMZH/U/3JXJVk4BzPUIQfGjILVryM
         PAltff/R3xr3GdI8B2rcpK+Z1SJ+2YFnH1uS8QZyQfrmtFk7Dar8+1iLruMuxMIGF7
         FECBrYYe4iUw9jKTSyvJIGMUXLaQlp4xE7M8Chg5OjVmmz3t6GZiMd8PaewRSV1Gl1
         MJHlMkDZ7PkbJzKZrrfl85+7hLMj8YBJDlAgTx+tGh4PFAysYBiW5VK5ujJ2T8XWVl
         FZDOJrP45soBmrVYcG1eUSEcmS3wwdCHXknnLO7dO5s56Z/S9eYq1c9lUvDtp0Vu4t
         dkeKkkqt7HFAQ==
From:   Maxime Ripard <mripard@kernel.org>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Russell King <linux@armlinux.org.uk>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: Update drm-misc entry to match all drivers
Date:   Thu, 21 Sep 2023 12:57:43 +0200
Message-ID: <20230921105743.2611263-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We've had a number of times when a patch slipped through and we couldn't
pick them up either because our MAINTAINERS entry only covers the
framework and thus we weren't Cc'd.

Let's take another approach where we match everything, and remove all
the drivers that are not maintained through drm-misc.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Edmund Dea <edmund.j.dea@intel.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org

Changes from v1:
- Remove ingenic and gma500 from the excluded list
---
 MAINTAINERS | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..1012402dada5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6860,12 +6860,27 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
 S:	Maintained
 W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/
+F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
-F:	drivers/gpu/drm/*
+F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
-F:	include/drm/drm*
+F:	include/drm/drm
 F:	include/linux/vga*
-F:	include/uapi/drm/drm*
+F:	include/uapi/drm/
+X:	drivers/gpu/drm/amd/
+X:	drivers/gpu/drm/armada/
+X:	drivers/gpu/drm/etnaviv/
+X:	drivers/gpu/drm/exynos/
+X:	drivers/gpu/drm/i915/
+X:	drivers/gpu/drm/imx/
+X:	drivers/gpu/drm/kmb/
+X:	drivers/gpu/drm/mediatek/
+X:	drivers/gpu/drm/msm/
+X:	drivers/gpu/drm/nouveau/
+X:	drivers/gpu/drm/radeon/
+X:	drivers/gpu/drm/renesas/
+X:	drivers/gpu/drm/tegra/
 
 DRM DRIVERS FOR ALLWINNER A10
 M:	Maxime Ripard <mripard@kernel.org>
-- 
2.41.0

