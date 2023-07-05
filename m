Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEE27487EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 17:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbjGEP0b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 11:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbjGEP0a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 11:26:30 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C67D171D
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jul 2023 08:26:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
        by baptiste.telenet-ops.be with bizsmtp
        id HTSR2A00G45Xpxs01TSRMZ; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Ob-000ck6-Mx;
        Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Of-00AwXZ-9g;
        Wed, 05 Jul 2023 17:26:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     dri-devel@lists.freedesktop.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH libdrm 2/3] util: Add pattern support for DRM_FORMAT_NV{24,42}
Date:   Wed,  5 Jul 2023 17:26:16 +0200
Message-Id: <eab4e871d026e39f98591840daaa8d82b9ccc637.1688570702.git.geert+renesas@glider.be>
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

Add support for drawing the SMPTE and tiles patterns in buffers using
semi-planar YUV formats with non-subsampled chroma planes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tests/util/pattern.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 158c0b160a2ee870..f45a26ccec38f202 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -698,6 +698,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
 		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
 		return fill_smpte_yuv_planar(&info->yuv, planes[0], u, v,
@@ -1023,6 +1025,8 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
 		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
 		return fill_tiles_yuv_planar(info, planes[0], u, v,
-- 
2.34.1

