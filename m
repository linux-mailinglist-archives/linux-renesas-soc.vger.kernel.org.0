Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368F5640794
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 14:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbiLBNR2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 08:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbiLBNR1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 08:17:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF843D11EB
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 05:17:25 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8228151A;
        Fri,  2 Dec 2022 14:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669987044;
        bh=L+/4y0Ua/KqkzQDKv6gUlR2Gp2tUoQ4VfYnyEM5M9LE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oXEbBDmsuJX9bwj9UjK5rH1jaoTCFd5BrXNSyJl+byq4IS+zvF3bdYVU1MGILmbnO
         4Q80iukC/M8/oKzvti9zQclvBsrbZJyPxtF2pTx1rHDhZ7+WDtTX6I3LeX/iRkdGzC
         VxO9ANfvNeV88khOrffFS87WFeWklQk12HoZZMxc=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH kms++ 1/4] kms++: PixelFormats: Fix formatting
Date:   Fri,  2 Dec 2022 15:16:55 +0200
Message-Id: <20221202131658.434114-2-tomi.valkeinen+renesas@ideasonboard.com>
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

Fix formatting for some pixel formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 kms++/src/pixelformats.cpp | 60 +++++++-------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/kms++/src/pixelformats.cpp b/kms++/src/pixelformats.cpp
index d739efd..7afbf09 100644
--- a/kms++/src/pixelformats.cpp
+++ b/kms++/src/pixelformats.cpp
@@ -32,107 +32,67 @@ static const map<PixelFormat, PixelFormatInfo> format_info_array = {
 	{ PixelFormat::NV12, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
+				     { { 8, 1, 1 },
 				       { 8, 2, 2 } },
 			     } },
 	{ PixelFormat::NV21, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
+				     { { 8, 1, 1 },
 				       { 8, 2, 2 } },
 			     } },
 	{ PixelFormat::NV16, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
+				     { { 8, 1, 1 },
 				       { 8, 2, 1 } },
 			     } },
 	{ PixelFormat::NV61, {
 				     PixelColorType::YUV,
 				     2,
-				     { {
-					       8,
-					       1,
-					       1,
-				       },
+				     { { 8, 1, 1 },
 				       { 8, 2, 1 } },
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
+				       { { 8, 1, 1 },
 					 { 8, 2, 2 },
 					 { 8, 2, 2 } },
 			       } },
 	{ PixelFormat::YVU420, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
+				       { { 8, 1, 1 },
 					 { 8, 2, 2 },
 					 { 8, 2, 2 } },
 			       } },
 	{ PixelFormat::YUV422, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
+				       { { 8, 1, 1 },
 					 { 8, 2, 1 },
 					 { 8, 2, 1 } },
 			       } },
 	{ PixelFormat::YVU422, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
+				       { { 8, 1, 1 },
 					 { 8, 2, 1 },
 					 { 8, 2, 1 } },
 			       } },
 	{ PixelFormat::YUV444, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
+				       { { 8, 1, 1 },
 					 { 8, 1, 1 },
 					 { 8, 1, 1 } },
 			       } },
 	{ PixelFormat::YVU444, {
 				       PixelColorType::YUV,
 				       3,
-				       { {
-						 8,
-						 1,
-						 1,
-					 },
+				       { { 8, 1, 1 },
 					 { 8, 1, 1 },
 					 { 8, 1, 1 } },
 			       } },
-- 
2.34.1

