Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E430123D552
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgHFCSb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgHFCSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83101C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2020 19:18:30 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F249AAC8;
        Thu,  6 Aug 2020 04:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680304;
        bh=rgiLuvdCwoAveA/sEYYdqQGjPQ8mdswzoi3ag8tM5kU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jhtr7E5f+NBqnob/lF67URi0fy+5000kudPEJJbakPM2PVn+nGUMU7Au48fwElTCn
         PwVv4LCmr4Toupuwg66tnrS6L52CBLwhw7kKg/lzq+MCHJqjAJOKGiiOABjxK7gaT2
         5U2bi22YtvIlJQat8odjlVos8MUmdgYqg+oiDKeA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/8] card: Rename has_has_universal_planes to has_universal_planes
Date:   Thu,  6 Aug 2020 05:18:00 +0300
Message-Id: <20200806021807.21863-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The has_has_universal_planes() method name includes a typo, fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/inc/kms++/card.h | 2 +-
 kms++/src/plane.cpp    | 2 +-
 utils/kmsprint.cpp     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
index 0a11747f7985..e9f90e3a1f96 100644
--- a/kms++/inc/kms++/card.h
+++ b/kms++/inc/kms++/card.h
@@ -50,7 +50,7 @@ public:
 
 	bool is_master() const { return m_is_master; }
 	bool has_atomic() const { return m_has_atomic; }
-	bool has_has_universal_planes() const { return m_has_universal_planes; }
+	bool has_universal_planes() const { return m_has_universal_planes; }
 	bool has_dumb_buffers() const { return m_has_dumb; }
 	bool has_kms() const;
 
diff --git a/kms++/src/plane.cpp b/kms++/src/plane.cpp
index b04088492c92..2df51c1ccdf8 100644
--- a/kms++/src/plane.cpp
+++ b/kms++/src/plane.cpp
@@ -51,7 +51,7 @@ bool Plane::supports_format(PixelFormat fmt) const
 
 PlaneType Plane::plane_type() const
 {
-	if (card().has_has_universal_planes()) {
+	if (card().has_universal_planes()) {
 		switch (get_prop_value("type")) {
 		case DRM_PLANE_TYPE_OVERLAY:
 			return PlaneType::Overlay;
diff --git a/utils/kmsprint.cpp b/utils/kmsprint.cpp
index 807aa62825ac..9d3d7ccfd9d4 100644
--- a/utils/kmsprint.cpp
+++ b/utils/kmsprint.cpp
@@ -372,7 +372,7 @@ static void print_as_list(Card& card)
 
 	for (Crtc* crtc : card.get_crtcs()) {
 		obs.push_back(crtc);
-		if (crtc->buffer_id() && !card.has_has_universal_planes()) {
+		if (crtc->buffer_id() && !card.has_universal_planes()) {
 			Framebuffer* fb = new Framebuffer(card, crtc->buffer_id());
 			fbs.push_back(fb);
 		}
@@ -423,7 +423,7 @@ static void print_as_tree(Card& card)
 				if (s_opts.print_props)
 					e3.lines = format_props(crtc);
 
-				if (crtc->buffer_id() && !card.has_has_universal_planes()) {
+				if (crtc->buffer_id() && !card.has_universal_planes()) {
 					Framebuffer fb(card, crtc->buffer_id());
 					Entry& e5 = add_entry(e3.children);
 
-- 
Regards,

Laurent Pinchart

