Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B719642407
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbiLEIEW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiLEIEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:04:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989E4140CA
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:03:57 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88B25327;
        Mon,  5 Dec 2022 09:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670227435;
        bh=RJSk9Ao0qd6V7FXWv0DRYRkusTmCqnEJ4tMuqhfM5/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tYWuavNtqiYxt4bCfcKPDXfevILxky9baK1OYnd1QSxo+ww7mcJLv8rFRcdQ+1PeA
         HF+2Nu4NTe0CK0d/+ezsH/24xxRAg1C1iG9Rt/OzjA5KN7+b6+ZYbBt+TQF0afVCln
         ew4dB6FVdUpVTHcEaLXTz1uF+ORhstOEFlcBipr8=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH kms++ v2 1/4] kms++: PixelFormats: Fix formatting
Date:   Mon,  5 Dec 2022 10:03:36 +0200
Message-Id: <20221205080339.12801-2-tomi.valkeinen+renesas@ideasonboard.com>
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

Fix formatting for some pixel formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/src/pixelformats.cpp | 76 +++++---------------------------------
 1 file changed, 10 insertions(+), 66 deletions(-)

diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
index d739efd..1f10f3a 100644
--- a/kms++/src/pixelformats.cpp
+++ b/kms++/src/pixelformats.cpp
@@ -32,109 +32,53 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 	{ PixelFormat::NV12, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
-				       { 8, 2, 2 } },
+				     { { 8, 1, 1 }, { 8, 2, 2 } },
 			     } },
 	{ PixelFormat::NV21, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
-				       { 8, 2, 2 } },
+				     { { 8, 1, 1 }, { 8, 2, 2 } },
 			     } },
 	{ PixelFormat::NV16, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
-				       { 8, 2, 1 } },
+				     { { 8, 1, 1 }, { 8, 2, 1 } },
 			     } },
 	{ PixelFormat::NV61, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
-				       { 8, 2, 1 } },
+				     { { 8, 1, 1 }, { 8, 2, 1 } },
 			     } },
 	/* YUV planar */
 	{ PixelFormat::YUV420, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
-					 { 8, 2, 2 },
-					 { 8, 2, 2 } },
+				       { { 8, 1, 1 }, { 8, 2, 2 }, { 8, 2, 2 } },
 			       } },
 	{ PixelFormat::YVU420, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
-					 { 8, 2, 2 },
-					 { 8, 2, 2 } },
+				       { { 8, 1, 1 }, { 8, 2, 2 }, { 8, 2, 2 } },
 			       } },
 	{ PixelFormat::YUV422, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
-					 { 8, 2, 1 },
-					 { 8, 2, 1 } },
+				       { { 8, 1, 1 }, { 8, 2, 1 }, { 8, 2, 1 } },
 			       } },
 	{ PixelFormat::YVU422, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
-					 { 8, 2, 1 },
-					 { 8, 2, 1 } },
+				       { { 8, 1, 1 }, { 8, 2, 1 }, { 8, 2, 1 } },
 			       } },
 	{ PixelFormat::YUV444, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
-					 { 8, 1, 1 },
-					 { 8, 1, 1 } },
+				       { { 8, 1, 1 }, { 8, 1, 1 }, { 8, 1, 1 } },
 			       } },
 	{ PixelFormat::YVU444, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
-					 { 8, 1, 1 },
-					 { 8, 1, 1 } },
+				       { { 8, 1, 1 }, { 8, 1, 1 }, { 8, 1, 1 } },
 			       } },
 	/* RGB8 */
 	{ PixelFormat::RGB332, {
-- 
2.34.1

