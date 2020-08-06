Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A5F23D554
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgHFCSd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgHFCSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:32 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93886BB3;
        Thu,  6 Aug 2020 04:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680304;
        bh=d+iUtdR2N/TwG8Y9Nh2sBdu+qbpKZXzEgOFAfWAZ4/Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=myAItzQRZ2WWgvA7TY/s6ljvXNDEelSnMAocuVTYPpEphbkkR5eZfc1Hg0B0yz9gJ
         usQfCpdC/U651/aOPzXPVG0Ac4sqEhgYT9ebWQLN9hacY62RlSaFSyYzga91iGWfma
         n0bgg1kwSa20FB2gNp+q2kmhPeaSs4PX/fcztV88=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/8] dumbfb: Add support tri- or quadri-planar buffers
Date:   Thu,  6 Aug 2020 05:18:01 +0300
Message-Id: <20200806021807.21863-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DumbFrameBuffer class supports up to 4 planes, as required by the
DRM/KMS API, but only considers planes 0 and 1 when constructing the
buffer. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/src/dumbframebuffer.cpp | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/kms++/src/dumbframebuffer.cpp b/kms++/src/dumbframebuffer.cpp
index 3448fb149df2..18f3f152943d 100644
--- a/kms++/src/dumbframebuffer.cpp
+++ b/kms++/src/dumbframebuffer.cpp
@@ -56,9 +56,18 @@ DumbFramebuffer::DumbFramebuffer(Card& card, uint32_t width, uint32_t height, Pi
 	}
 
 	/* create framebuffer object for the dumb-buffer */
-	uint32_t bo_handles[4] = { m_planes[0].handle, m_planes[1].handle };
-	uint32_t pitches[4] = { m_planes[0].stride, m_planes[1].stride };
-	uint32_t offsets[4] = {  m_planes[0].offset, m_planes[1].offset };
+	uint32_t bo_handles[4] = {
+		m_planes[0].handle, m_planes[1].handle,
+		m_planes[2].handle, m_planes[3].handle,
+	};
+	uint32_t pitches[4] = {
+		m_planes[0].stride, m_planes[1].stride,
+		m_planes[2].stride, m_planes[3].stride,
+	};
+	uint32_t offsets[4] = {
+		m_planes[0].offset, m_planes[1].offset,
+		m_planes[2].offset, m_planes[3].offset,
+	};
 	uint32_t id;
 	r = drmModeAddFB2(card.fd(), width, height, (uint32_t)format,
 			  bo_handles, pitches, offsets, &id, 0);
-- 
Regards,

Laurent Pinchart

