Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FC8640795
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 14:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbiLBNR3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 08:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiLBNR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 08:17:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02ACDD0391
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 05:17:28 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33FB2158D;
        Fri,  2 Dec 2022 14:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669987044;
        bh=Njv56V9L49c5sQ3FG5DlqfUC69eMZkcsCMS7VJwV4FU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSyWbjYOQ5lpwqZdzvWBMDAH8VLQVRbxdV9FSVnvO8l8lqWFM1rkpVriqdnpPQSug
         03kABvomh7tRFXT+0JpbT3Czlw/GOfgSse3IVwkVcJnULcD38B0ZqYuiOMIcaL1G5Z
         5IU2YFVZsBKPIksr6xPvCsnpGSBPyBkWyTkPqGLw=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH kms++ 2/4] kms++: PixelFormats: Add Y210 format
Date:   Fri,  2 Dec 2022 15:16:56 +0200
Message-Id: <20221202131658.434114-3-tomi.valkeinen+renesas@ideasonboard.com>
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

Add Y210 pixel format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 kms++/inc/kms++/pixelformats.h | 2 ++
 kms++/src/pixelformats.cpp     | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
index 6f2671b..35261a9 100644
--- a/kms++/inc/kms++/pixelformats.h
+++ b/kms++/inc/kms++/pixelformats.h
@@ -31,6 +31,8 @@ enum class PixelFormat : uint32_t {
 	YVYU = MakeFourCC("YVYU"),
 	VYUY = MakeFourCC("VYUY"),
 
+	Y210 = MakeFourCC("Y210"),
+
 	XRGB8888 = MakeFourCC("XR24"),
 	XBGR8888 = MakeFourCC("XB24"),
 	RGBX8888 = MakeFourCC("RX24"),
diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
index 7afbf09..89eece4 100644
--- a/kms++/src/pixelformats.cpp
+++ b/kms++/src/pixelformats.cpp
@@ -28,6 +28,12 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 				     1,
 				     { { 16, 2, 1 } },
 			     } },
+	{ PixelFormat::Y210, {
+				     PixelColorType::YUV,
+				     1,
+				     { { 32, 2, 1 } },
+			     } },
+
 	/* YUV semi-planar */
 	{ PixelFormat::NV12, {
 				     PixelColorType::YUV,
-- 
2.34.1

