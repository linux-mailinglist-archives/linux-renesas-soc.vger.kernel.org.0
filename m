Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72D8F5B019
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2019 16:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfF3OMd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 30 Jun 2019 10:12:33 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:52257 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfF3OMc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jun 2019 10:12:32 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id B0DE020063;
        Sun, 30 Jun 2019 16:12:28 +0200 (CEST)
Date:   Sun, 30 Jun 2019 16:12:26 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1] drm/shmobile: drop use of drmP.h
Message-ID: <20190630141225.GA5444@ravnborg.org>
References: <20190630052126.6050-1-sam@ravnborg.org>
 <20190630112203.GA7043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190630112203.GA7043@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=4vd3_E1uAmGp2BPvN1gA:9 a=CjuIK1q_8ugA:10
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

Thanks for the detailed feedback.

> > If patch is OK, please apply to your tree
> > as this driver is maintained outside drm-misc.
> > 
> > I am happy to rebase on another tree, just let me know.
> 
> The shmobile driver hasn't seen changes for a long time and I don't have
> patches queued in my tree for it. If you don't mind taking this patch
> through drm-misc with the rest of the drmP.h removal series it would be
> easier for me. Otherwise please let me know and I'll handle it.
No problem, I will add to drm-misc when ready.
The motivation was alone to avoid later merge conflicts - which in this
case is a non-issue.

> > diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> > index 9ca6920641d8..bd35fe8f9028 100644
> > --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> > +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> > @@ -10,7 +10,6 @@
> >  #ifndef __SHMOB_DRM_CRTC_H__
> >  #define __SHMOB_DRM_CRTC_H__
> >  
> > -#include <drm/drmP.h>
> 
> I think you should include drm/drm_connector.h here. It gets pulled
> indirectly, but it's one of the top-level headers and I think it should
> be explicitly included to avoid future breakages.
> 
> While at it a forward declaration of struct drm_pending_vblank_event and
> struct shmob_drm_format_info could also be useful to make the header
> self-contained.
Good input.
I went through all shmobile header files - now gcc is happy with them all
when used individually (self-contained).

I will post a v2 a bit later today with the below fixup included.

	Sam

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
index bd35fe8f9028..21718843f46d 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
@@ -11,10 +11,13 @@
 #define __SHMOB_DRM_CRTC_H__
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>
 
 struct backlight_device;
+struct drm_pending_vblank_event;
 struct shmob_drm_device;
+struct shmob_drm_format_info;
 
 struct shmob_drm_crtc {
 	struct drm_crtc crtc;
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

