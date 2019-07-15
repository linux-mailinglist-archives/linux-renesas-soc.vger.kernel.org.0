Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB2F685E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2019 11:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbfGOJCd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jul 2019 05:02:33 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:56964 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfGOJCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jul 2019 05:02:33 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 36E83803B1;
        Mon, 15 Jul 2019 11:02:29 +0200 (CEST)
Date:   Mon, 15 Jul 2019 11:02:27 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Airlie <airlied@linux.ie>, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/shmobile: drop use of drmP.h
Message-ID: <20190715090227.GA27652@ravnborg.org>
References: <20190630052126.6050-1-sam@ravnborg.org>
 <20190630112203.GA7043@pendragon.ideasonboard.com>
 <20190630141225.GA5444@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190630141225.GA5444@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=P1BnusSwAAAA:8 a=VwQbUJbxAAAA:8 a=kMHMJxhSLpEp1KH-nXwA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
        a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent
> > 
> > The shmobile driver hasn't seen changes for a long time and I don't have
> > patches queued in my tree for it. If you don't mind taking this patch
> > through drm-misc with the rest of the drmP.h removal series it would be
> > easier for me. Otherwise please let me know and I'll handle it.
> No problem, I will add to drm-misc when ready.
> The motivation was alone to avoid later merge conflicts - which in this
> case is a non-issue.
> 
> > > diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> > > index 9ca6920641d8..bd35fe8f9028 100644
> > > --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> > > +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> > > @@ -10,7 +10,6 @@
> > >  #ifndef __SHMOB_DRM_CRTC_H__
> > >  #define __SHMOB_DRM_CRTC_H__
> > >  
> > > -#include <drm/drmP.h>
> > 
> > I think you should include drm/drm_connector.h here. It gets pulled
> > indirectly, but it's one of the top-level headers and I think it should
> > be explicitly included to avoid future breakages.
> > 
> > While at it a forward declaration of struct drm_pending_vblank_event and
> > struct shmob_drm_format_info could also be useful to make the header
> > self-contained.
> Good input.
> I went through all shmobile header files - now gcc is happy with them all
> when used individually (self-contained).
> 
> I will post a v2 a bit later today with the below fixup included.

Here is the v2 that I have applied locally and will push out soonish.

	Sam

From 7a9ff461c095034f9339df1045a7e8a4177bfbfe Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 29 Jun 2019 11:27:23 +0200
Subject: [PATCH v2 1/1] drm/shmobile: drop use of drmP.h

Drop use of the deprecated drmP.h header file.
Fix fallout.

v2:
- Add additional include/forward to shmob_drm_crtc.h
  to avoid relying on indirect includes (Laurent)
- Add additional includes to shmob_drm_regs.h to make
  it self-contained
- Add additonal includes to shmob_drm_plane.h to make
  it self-contained

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 3 ++-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.h  | 4 +++-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c   | 4 +++-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c   | 1 -
 drivers/gpu/drm/shmobile/shmob_drm_plane.c | 2 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.h | 1 +
 drivers/gpu/drm/shmobile/shmob_drm_regs.h  | 3 +++
 7 files changed, 13 insertions(+), 5 deletions(-)

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
index 9ca6920641d8..21718843f46d 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
@@ -10,12 +10,14 @@
 #ifndef __SHMOB_DRM_CRTC_H__
 #define __SHMOB_DRM_CRTC_H__
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>
 
 struct backlight_device;
+struct drm_pending_vblank_event;
 struct shmob_drm_device;
+struct shmob_drm_format_info;
 
 struct shmob_drm_crtc {
 	struct drm_crtc crtc;
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
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.h b/drivers/gpu/drm/shmobile/shmob_drm_plane.h
index bae67cc8c628..e72b21a4288f 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.h
@@ -10,6 +10,7 @@
 #ifndef __SHMOB_DRM_PLANE_H__
 #define __SHMOB_DRM_PLANE_H__
 
+struct drm_plane;
 struct shmob_drm_device;
 
 int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index);
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_regs.h b/drivers/gpu/drm/shmobile/shmob_drm_regs.h
index 9eb0b3d01df8..058533685c4c 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_regs.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_regs.h
@@ -11,6 +11,9 @@
 #define __SHMOB_DRM_REGS_H__
 
 #include <linux/io.h>
+#include <linux/jiffies.h>
+
+#include "shmob_drm_drv.h"
 
 /* Register definitions */
 #define LDDCKPAT1R		0x400
-- 
2.20.1

