Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD3FC64240C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbiLEIE3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiLEIEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:04:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8608814D29
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:04:05 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED611E61;
        Mon,  5 Dec 2022 09:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670227437;
        bh=6wJnjausWa0Z2FuTFMYU+22uYsRViu0qKKBsV1hwgQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mfjgt+y5PmRxMMQ/vFv19iLbbp/Tr7Q3qLQr4FlPwtPDENApjt4uj9sonP1dk6lkb
         junQ8lFD9tfMqPn2Ye1K9CYZvt2ziuvLhoNQ6W709DEhpLUr2nGFwr48mL+lXHEE8V
         zu2e0vQRT+SppLZmJ0czfOA15UiTRNYrvpf6FdOk=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH kms++ v2 4/4] kms++util: Add Y21x drawing support
Date:   Mon,  5 Dec 2022 10:03:39 +0200
Message-Id: <20221205080339.12801-5-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com>
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

Add support for drawing Y210, Y212, Y216 pixels.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 kms++util/src/drawing.cpp | 63 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
index 79e0d90..5764b08 100644
--- a/kms++util/src/drawing.cpp
+++ b/kms++util/src/drawing.cpp
@@ -3,6 +3,7 @@
 
 #include <kms++/kms++.h>
 #include <kms++util/kms++util.h>
+#include <kms++util/endian.h>
 
 using namespace std;
 
@@ -179,6 +180,62 @@ static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigne
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
+		// XXX naive expansion to 10 bits, similar to 10-bit funcs in class RGB
+		uint16_t y0 = yuv1.y << 2;
+		uint16_t y1 = yuv2.y << 2;
+		uint16_t cb = ((yuv1.u  << 2) + (yuv2.u << 2)) / 2;
+		uint16_t cr = ((yuv1.v  << 2) + (yuv2.v << 2)) / 2;
+
+		// The 10 bits occupy the msb, so we shift left by 16-10 = 6
+		write16le(&p[0], y0 << 6);
+		write16le(&p[1], cb << 6);
+		write16le(&p[2], y1 << 6);
+		write16le(&p[3], cr << 6);
+		break;
+	}
+
+	case PixelFormat::Y212: {
+		// XXX naive expansion to 12 bits
+		uint16_t y0 = yuv1.y << 4;
+		uint16_t y1 = yuv2.y << 4;
+		uint16_t cb = ((yuv1.u  << 4) + (yuv2.u << 4)) / 2;
+		uint16_t cr = ((yuv1.v  << 4) + (yuv2.v << 4)) / 2;
+
+		// The 10 bits occupy the msb, so we shift left by 16-12 = 4
+		write16le(&p[0], y0 << 4);
+		write16le(&p[1], cb << 4);
+		write16le(&p[2], y1 << 4);
+		write16le(&p[3], cr << 4);
+		break;
+	}
+
+	case PixelFormat::Y216: {
+		// XXX naive expansion to 16 bits
+		uint16_t y0 = yuv1.y << 8;
+		uint16_t y1 = yuv2.y << 8;
+		uint16_t cb = ((yuv1.u  << 8) + (yuv2.u << 8)) / 8;
+		uint16_t cr = ((yuv1.v  << 8) + (yuv2.v << 8)) / 8;
+
+		write16le(&p[0], y0);
+		write16le(&p[1], cb);
+		write16le(&p[2], y1);
+		write16le(&p[3], cr);
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
@@ -257,6 +314,12 @@ void draw_yuv422_macropixel(IFramebuffer& buf, unsigned x, unsigned y, YUV yuv1,
 		draw_yuv422_packed_macropixel(buf, x, y, yuv1, yuv2);
 		break;
 
+	case PixelFormat::Y210:
+	case PixelFormat::Y212:
+	case PixelFormat::Y216:
+		draw_y2xx_packed_macropixel(buf, x, y, yuv1, yuv2);
+		break;
+
 	case PixelFormat::NV16:
 	case PixelFormat::NV61:
 		draw_yuv422_semiplanar_macropixel(buf, x, y, yuv1, yuv2);
-- 
2.34.1

