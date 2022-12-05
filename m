Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE1A642408
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbiLEIE0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbiLEIEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:04:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A76A2653
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:04:01 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07357CCE;
        Mon,  5 Dec 2022 09:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670227436;
        bh=cwFqxegfDkPxigOFKjnREtiv0SOZI+2rLLBZOCEaVx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ShKzfsQgcp6Ln4CEZjVFJ7wXqxRLrMWL55WhK/RNp7gJ8YgNTjt0tDyldTdwnDtZI
         yrKDWO6fw56XdVrz8Dxxn6fjJBob/z3gZDIitsUORP6SeNoyPrCz1q3zv642bLWkSv
         d09i0HC+h2/GspLVaxoL3QPlaoe4T2/NABEbAj3Y=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH kms++ v2 2/4] kms++: PixelFormats: Add Y21x formats
Date:   Mon,  5 Dec 2022 10:03:37 +0200
Message-Id: <20221205080339.12801-3-tomi.valkeinen+renesas@ideasonboard.com>
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

Add Y210, Y212, Y216 pixel formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 kms++/inc/kms++/pixelformats.h |  4 ++++
 kms++/src/pixelformats.cpp     | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
index 8ebb76b..e334ee6 100644
--- a/kms++/inc/kms++/pixelformats.h
+++ b/kms++/inc/kms++/pixelformats.h
@@ -31,6 +31,10 @@ enum class PixelFormat : uint32_t {
 	YVYU = MakeFourCC("YVYU"),
 	VYUY = MakeFourCC("VYUY"),
 
+	Y210 = MakeFourCC("Y210"),
+	Y212 = MakeFourCC("Y212"),
+	Y216 = MakeFourCC("Y216"),
+
 	XRGB8888 = MakeFourCC("XR24"),
 	XBGR8888 = MakeFourCC("XB24"),
 	RGBX8888 = MakeFourCC("RX24"),
diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
index 1f10f3a..5f13ef4 100644
--- a/kms++/src/pixelformats.cpp
+++ b/kms++/src/pixelformats.cpp
@@ -28,6 +28,22 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 				     1,
 				     { { 16, 2, 1 } },
 			     } },
+	{ PixelFormat::Y210, {
+				     PixelColorType::YUV,
+				     1,
+				     { { 32, 2, 1 } },
+			     } },
+	{ PixelFormat::Y212, {
+				     PixelColorType::YUV,
+				     1,
+				     { { 32, 2, 1 } },
+			     } },
+	{ PixelFormat::Y216, {
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

