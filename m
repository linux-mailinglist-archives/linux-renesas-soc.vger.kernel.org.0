Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342961D8906
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 22:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgERURc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 16:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgERURc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 16:17:32 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD41C061A0C;
        Mon, 18 May 2020 13:17:30 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z6so285514ljm.13;
        Mon, 18 May 2020 13:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuljtQBpIL0qjGzLVg3jHlIfvzyQopbP8u18XmNvs2w=;
        b=c/68PRJxvHcj3DE/yxZ0a6MERGu0//5Ick75ODI7dCtgrU5zBHrqVRNU4HqhHXpuZv
         d2t6doF3mTYCazJIDoW5wNqAvo295xPtO6XMe5O9De+h+U2GvwsbB9oRjv5mppLTNPiG
         IXXQ3kJPrN76Emfux8S/bccsLYFUG1rGlmLzl91IA3xyDGnNPQQwaB/xDvr7HfWHV7jG
         O+JQOi7F1hmaLXSoPNAE8hpr+hRZIOYwTkoTOe3MGG1R6c+S2gGHrdKZsu01ochO6/Hx
         s8HTJm6/tPmJeNBQuT+sIVCT81imNzDF4ndGjREky+I0LgIlKoYZosdlQ118PqrjndwO
         DrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuljtQBpIL0qjGzLVg3jHlIfvzyQopbP8u18XmNvs2w=;
        b=IlxpTFvaE8OdsWc5srF8l+3e7K3LrhtK5czmXw1WClpCPXMm7ob+zo72/DM7j1c7+x
         TInqZE1k16CpsJZuxxfZkIiK2Rom44Q6vbUeKvF91W+WrKabvLMYfGGc7HVQEgVfy+QT
         AjUhP/7Sa6aM747H9uzfUbD0/G6om7uJpCw+QQsgxhxajSLtWRMHTb5apGjRShnzCon9
         y9br9D04AURHH10PnjAMx+CyiaRPyxYE4IzHYuY8oEVGkV+ABvDEUdyOkoFCtaXsDH8c
         7QIXZoo7iWLsubX1ZxvUzIlCqBXuUQm3h8NkVy9frKQQ0EsS3g6U1QQmcRuDrWXz24bd
         vyGQ==
X-Gm-Message-State: AOAM533HMIbYBzvRG6iDiZTOGbP3rEoBgxbK+CvFFjXzEkdvEGdIbGi8
        vA1qSN3uhQcbStwmMJTpyk8=
X-Google-Smtp-Source: ABdhPJzuP8HWeS92/QB/RT+ANHc+zhMPanKEN1AyPO8zGrOkYxuf1y3OyGB+GMp7sTVVMOa9zz/V8w==
X-Received: by 2002:a2e:8ec9:: with SMTP id e9mr3069561ljl.204.1589833049193;
        Mon, 18 May 2020 13:17:29 -0700 (PDT)
Received: from polark.local (62-243-86-95-cable.dk.customer.tdc.net. [62.243.86.95])
        by smtp.gmail.com with ESMTPSA id r13sm6249279ljh.66.2020.05.18.13.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:17:28 -0700 (PDT)
From:   Daniel Gomez <dagmcr@gmail.com>
To:     daniel@ffwll.ch, airlied@linux.ie
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Gomez <dagmcr@gmail.com>
Subject: [PATCH] drm: rcar-du: Fix build error
Date:   Mon, 18 May 2020 22:16:46 +0200
Message-Id: <20200518201646.48312-1-dagmcr@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Select DRM_KMS_HELPER dependency.

Build error when DRM_KMS_HELPER is not selected:

drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'

Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..f65d1489dc50 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -31,6 +31,7 @@ config DRM_RCAR_DW_HDMI
 config DRM_RCAR_LVDS
 	tristate "R-Car DU LVDS Encoder Support"
 	depends on DRM && DRM_BRIDGE && OF
+	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select OF_FLATTREE
 	select OF_OVERLAY
-- 
2.26.2

