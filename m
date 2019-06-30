Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD765AEA3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2019 07:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfF3FVb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 30 Jun 2019 01:21:31 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35026 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF3FVb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jun 2019 01:21:31 -0400
Received: by mail-lf1-f66.google.com with SMTP id a25so6557610lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2019 22:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlgX7+30V9nDLK7tt8DxD2la983PD+8bCuPllcAPD5Q=;
        b=BznaIRUNMgu8SGnNc9enkg97zvKuPbeZDpE94vbWrJWhYxNqn/Rr45CnFWvDu/pgpV
         hLaxyL1QYAJ3F7sy34QYGsu6vkptWKUc1C6GaoNwH3yKx1nTJ6whElTYSvGedAjXzJ3p
         q6lNRFmD3EhSNmXK9/5xikQdAs4idlGlGoPjZEROaUe0KH7ft+gtijL0L81LjPsjnx63
         ATwudORDE5Vf715kB4em2AWp90VFhWzAp+ZsbPvqd4IPrdAkj7LaSZZGdV8pIsVAQjTQ
         BYv49hpHSE/xDUbky8ZG9BehAHntCnFWbSAI8r+l1BLa+TAKneGxeKrk6rQVXRUKIMjk
         OI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=UlgX7+30V9nDLK7tt8DxD2la983PD+8bCuPllcAPD5Q=;
        b=jpU6CNv9lzkXXuXmhMKzz2Z/GuDP0/zzvHEC14jM8JEWGQeVPGSbcC8NIW577W/sAl
         kqn23yH6iOfrscYItpWMOtd2bOCxPbY86IApeDE6SOeYtp7wj4ZER/kiA8AOwrvP2XSb
         3O5xLoE1Se1pKa+SGTQ9KkkZkwFUixCimV7jQCDwNCxD8wgtdu8YTGgxp0l/3Zh9yAeU
         uzSsiU1pogD6PVfadHetoFegG9qD1rwNH71TZh+HbxAk4CV8dyfQve38qb5YZSO28sD1
         cTZFGrO2Syc1HmIdS6PuDLGSYNnNrsi+vLB4fa52Ti7aBYmJ482d86AB3EuKJ7QFDKPK
         SWLg==
X-Gm-Message-State: APjAAAVxpRO3S+0dX0qMuLd8PVsFxthTrMPEAkcpe/EGvMQZic3OvnGy
        qshtla5C9y9QMuAIpLliEPs=
X-Google-Smtp-Source: APXvYqyfYXtdLaKYykR2tlk8x4xWgHmDi1eYQRiy1bSIwsH7Takm57sBV2N76+nJW50z260KCgwoMg==
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr9142810lfm.36.1561872088824;
        Sat, 29 Jun 2019 22:21:28 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id j14sm2333416ljc.67.2019.06.29.22.21.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 22:21:28 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1] drm/shmobile: drop use of drmP.h
Date:   Sun, 30 Jun 2019 07:21:26 +0200
Message-Id: <20190630052126.6050-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop use of the deprecated drmP.h header file.
Fix fallout.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org
---
The patch is build tested using several configs and
several architectures (including arm, arm64, x86).

The patch is based on drm-misc.

If patch is OK, please apply to your tree
as this driver is maintained outside drm-misc.

I am happy to rebase on another tree, just let me know.

        Sam

 drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 3 ++-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.h  | 1 -
 drivers/gpu/drm/shmobile/shmob_drm_drv.c   | 4 +++-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c   | 1 -
 drivers/gpu/drm/shmobile/shmob_drm_plane.c | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index b6988a6d698e..75a752d59ef1 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -10,13 +10,14 @@
 #include <linux/backlight.h>
 #include <linux/clk.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "shmob_drm_backlight.h"
 #include "shmob_drm_crtc.h"
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
index 9ca6920641d8..bd35fe8f9028 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
@@ -10,7 +10,6 @@
 #ifndef __SHMOB_DRM_CRTC_H__
 #define __SHMOB_DRM_CRTC_H__
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 6c106b7a3bfe..b8c0930959c7 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -15,10 +15,12 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_irq.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "shmob_drm_drv.h"
 #include "shmob_drm_kms.h"
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
index 2e08bc203bf9..c51197b6fd85 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -7,7 +7,6 @@
  * Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_cma_helper.h>
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index 1d1ee5e51351..cbc464f006b4 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -7,10 +7,10 @@
  * Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 
 #include "shmob_drm_drv.h"
-- 
2.20.1

