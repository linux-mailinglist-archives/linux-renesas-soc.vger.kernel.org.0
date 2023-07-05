Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29017487ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 17:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbjGEP0d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 11:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbjGEP0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 11:26:32 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF6C1732
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jul 2023 08:26:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
        by laurent.telenet-ops.be with bizsmtp
        id HTSR2A00A45Xpxs01TSRp8; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Ob-000ck4-Ma;
        Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Of-00AwXW-94;
        Wed, 05 Jul 2023 17:26:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     dri-devel@lists.freedesktop.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH libdrm 1/3] util: Add NV24 and NV42 frame buffer formats
Date:   Wed,  5 Jul 2023 17:26:15 +0200
Message-Id: <6cbabaedec836a3a1da332644d4129343fca44b0.1688570702.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688570702.git.geert+renesas@glider.be>
References: <cover.1688570702.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the missing entries for semi-planar YUV formats with
non-subsampled chroma planes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tests/util/format.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/util/format.c b/tests/util/format.c
index 1ca1b82ce947b2f4..f825027227ddba24 100644
--- a/tests/util/format.c
+++ b/tests/util/format.c
@@ -51,6 +51,8 @@ static const struct util_format_info format_info[] = {
 	{ DRM_FORMAT_NV21, "NV21", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 2) },
 	{ DRM_FORMAT_NV16, "NV16", MAKE_YUV_INFO(YUV_YCbCr, 2, 1, 2) },
 	{ DRM_FORMAT_NV61, "NV61", MAKE_YUV_INFO(YUV_YCrCb, 2, 1, 2) },
+	{ DRM_FORMAT_NV24, "NV24", MAKE_YUV_INFO(YUV_YCbCr, 1, 1, 2) },
+	{ DRM_FORMAT_NV42, "NV42", MAKE_YUV_INFO(YUV_YCrCb, 1, 1, 2) },
 	/* YUV planar */
 	{ DRM_FORMAT_YUV420, "YU12", MAKE_YUV_INFO(YUV_YCbCr, 2, 2, 1) },
 	{ DRM_FORMAT_YVU420, "YV12", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 1) },
-- 
2.34.1

