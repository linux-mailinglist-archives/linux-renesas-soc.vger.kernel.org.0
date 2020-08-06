Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF4423D555
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgHFCSe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38264 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgHFCSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:32 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED6AEBC3;
        Thu,  6 Aug 2020 04:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680305;
        bh=hlds8rTizyxQna5vO+G/vZEjhxdvs9/ZPxi6OWbvdVk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WKWG9BX+xeGGoYI7p0CKI78KZmeJY6KFzts/tY6mOqngvlb44g9nUr79AEvoOQ4tF
         YleHdFISt/05NrvFdUpU1Qfu6oZjGH4VwbIgOGhi7Y8nyLQptF/qY9xBc9q17S9rDf
         aDjj8QDZZryncFsBOyZWq7ufcWuAd0iz5WY4A4RM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/8] dumbfb: Fix pitch for tri-planar formats
Date:   Thu,  6 Aug 2020 05:18:02 +0300
Message-Id: <20200806021807.21863-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The BO pitches are unconditionally set to the frame buffer pitch, for
all planes. This is correct for semiplanar YUV formats, as they
subsample chroma horizontally by two but combined U and V in a single
plane, cancelling each other. For fully planar YUV formats, however, the
horizontal subsampling need to be taken into account to compute the
pitch. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/src/dumbframebuffer.cpp | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kms++/src/dumbframebuffer.cpp b/kms++/src/dumbframebuffer.cpp
index 18f3f152943d..4c3c03164a90 100644
--- a/kms++/src/dumbframebuffer.cpp
+++ b/kms++/src/dumbframebuffer.cpp
@@ -42,6 +42,14 @@ DumbFramebuffer::DumbFramebuffer(Card& card, uint32_t width, uint32_t height, Pi
 		struct drm_mode_create_dumb creq = drm_mode_create_dumb();
 		creq.width = width;
 		creq.height = height / pi.ysub;
+		/*
+		 * For fully planar YUV buffers, the chroma planes don't combine
+		 * U and V components, their width must thus be divided by the
+		 * horizontal subsampling factor.
+		 */
+		if (format_info.type == PixelColorType::YUV &&
+		    format_info.num_planes == 3)
+			creq.width /= pi.xsub;
 		creq.bpp = pi.bitspp;
 		r = drmIoctl(card.fd(), DRM_IOCTL_MODE_CREATE_DUMB, &creq);
 		if (r)
-- 
Regards,

Laurent Pinchart

