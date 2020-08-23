Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9153224F00A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 00:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgHWWMo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Aug 2020 18:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgHWWMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Aug 2020 18:12:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A24C061573
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Aug 2020 15:12:43 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E52C6574;
        Mon, 24 Aug 2020 00:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598220756;
        bh=UipJGceDZ8yd8Tv3M4UXdcBI8MhD5lZ0bMpYfCO635Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RDOZe0YUeHad+4s/s/fWM+PL9lKl4VsynjdzCBfhTaiXXP7qjZdxcZLzBWeoycJfk
         kMVEi1L7GgNQCOdAh04OLUofU8r5axY1zyVn/BAzHzu065PSTkwVCys2dsVmB6/FsP
         pLVTRqnotE6FUug6iKfzsKQW6hWnRhR/NKxEO3hQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [kmsxx] [PATCH 2/2] utils: Add a dump_framebuffer() method
Date:   Mon, 24 Aug 2020 01:11:52 +0300
Message-Id: <20200823221152.31978-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200823221152.31978-1-laurent.pinchart@ideasonboard.com>
References: <20200823221152.31978-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a new method to write the contents of a framebuffer to a file
descriptor. This can be used to capture frames from writeback
connectors.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++util/inc/kms++util/kms++util.h | 2 ++
 kms++util/src/drawing.cpp           | 7 +++++++
 py/pykms/pykmsutil.cpp              | 6 +++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
index 8fc6c8b81e48..58ad7e6ef39f 100644
--- a/kms++util/inc/kms++util/kms++util.h
+++ b/kms++util/inc/kms++util/kms++util.h
@@ -29,6 +29,8 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t y, const std::string& str
 void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int width);
 
 void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
+
+void dump_framebuffer(IFramebuffer &fb, int fd);
 }
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
index 3752f94695e0..24a995489a9e 100644
--- a/kms++util/src/drawing.cpp
+++ b/kms++util/src/drawing.cpp
@@ -1,5 +1,6 @@
 
 #include <cmath>
+#include <unistd.h>
 
 #include <kms++/kms++.h>
 #include <kms++util/kms++util.h>
@@ -569,4 +570,10 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t y, const string& str, RGB
 		draw_char(buf, (x + 8 * i), y, str[i], color);
 }
 
+void dump_framebuffer(IFramebuffer &fb, int fd)
+{
+	for (unsigned int i = 0; i < fb.num_planes(); ++i)
+		::write(fd, fb.map(i), fb.size(i));
+}
+
 }
diff --git a/py/pykms/pykmsutil.cpp b/py/pykms/pykmsutil.cpp
index d5d7fde4a4e1..92d8ebc684b9 100644
--- a/py/pykms/pykmsutil.cpp
+++ b/py/pykms/pykmsutil.cpp
@@ -61,5 +61,9 @@ void init_pykmstest(py::module &m)
 		draw_circle(fb, xCenter, yCenter, radius, color);
 	} );
 	m.def("draw_text", [](Framebuffer& fb, uint32_t x, uint32_t y, const string& str, RGB color) {
-		draw_text(fb, x, y, str, color); } );
+		draw_text(fb, x, y, str, color);
+	} );
+	m.def("dump_framebuffer", [](Framebuffer& fb, int fd) {
+		dump_framebuffer(fb, fd);
+	} );
 }
-- 
Regards,

Laurent Pinchart

