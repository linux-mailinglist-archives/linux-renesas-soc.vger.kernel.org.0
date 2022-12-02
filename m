Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CA4640797
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 14:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbiLBNRb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 08:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbiLBNRa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 08:17:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AAAD0391
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 05:17:29 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25C9016C4;
        Fri,  2 Dec 2022 14:17:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669987045;
        bh=YnxGlYAV8mV1R7AK/9SpjDzziSeonFLwYY+ZQAtaZw0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qr1AhCSLzbHP15LBwTxCqppNmtEr8PM2jsJFd/MsSVMU5K15MPb7UeNsiLvQPDMOF
         s9GmaIu3cwz1oqP5RFviQrV+iERbU8lLGMryKWG+UsFh6gI1pKrPcz36fY8s4B7IVU
         F1MJaPd6aOsrGEHT6Wf38eCgKG8q+0nA1yXs+n2g=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH kms++ 4/4] kms++util: Add Y210 drawing support
Date:   Fri,  2 Dec 2022 15:16:58 +0200
Message-Id: <20221202131658.434114-5-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for drawing Y210 pixels.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 kms++util/src/drawing.cpp | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
index 79e0d90..7e1b40b 100644
--- a/kms++util/src/drawing.cpp
+++ b/kms++util/src/drawing.cpp
@@ -3,6 +3,7 @@
 
 #include <kms++/kms++.h>
 #include <kms++util/kms++util.h>
+#include <kms++util/endian.h>
 
 using namespace std;
 
@@ -179,6 +180,32 @@ static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigne
 	}
 }
 
+static void draw_y2xx_packed_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
+					  YUV yuv1, YUV yuv2)
+{
+	const uint32_t macro_size = 4;
+	uint16_t* p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * macro_size);
+
+	switch (buf.format()) {
+	case PixelFormat::Y210: {
+		// XXX naive shift left, similar to 10-bit funcs in class RGB
+		uint16_t y0 = yuv1.y << 2;
+		uint16_t y1 = yuv2.y << 2;
+		uint16_t cb = ((yuv1.u  << 2) + (yuv2.u << 2)) / 2;
+		uint16_t cr = ((yuv1.v  << 2) + (yuv2.v << 2)) / 2;
+
+		write16le(y0, &p[0]);
+		write16le(cb, &p[1]);
+		write16le(y1, &p[2]);
+		write16le(cr, &p[3]);
+		break;
+	}
+
+	default:
+		throw std::invalid_argument("invalid pixelformat");
+	}
+}
+
 static void draw_yuv422_semiplanar_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
 					      YUV yuv1, YUV yuv2)
 {
@@ -257,6 +284,10 @@ void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1,
 		draw_yuv422_packed_macropixel(buf, x, y, yuv1, yuv2);
 		break;
 
+	case PixelFormat::Y210:
+		draw_y2xx_packed_macropixel(buf, x, y, yuv1, yuv2);
+		break;
+
 	case PixelFormat::NV16:
 	case PixelFormat::NV61:
 		draw_yuv422_semiplanar_macropixel(buf, x, y, yuv1, yuv2);
-- 
2.34.1

