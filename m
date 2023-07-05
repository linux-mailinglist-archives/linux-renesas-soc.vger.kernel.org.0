Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C837487EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 17:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbjGEP0d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 11:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbjGEP0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 11:26:32 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81631988
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jul 2023 08:26:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
        by andre.telenet-ops.be with bizsmtp
        id HTSR2A00J45Xpxs01TSRt7; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Ob-000ckB-NU;
        Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qH4Of-00AwXe-AH;
        Wed, 05 Jul 2023 17:26:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     dri-devel@lists.freedesktop.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH libdrm 3/3] modetest: Add support for DRM_FORMAT_NV{24,42}
Date:   Wed,  5 Jul 2023 17:26:17 +0200
Message-Id: <1e43eba23f3a73ed4c18ec4516869a5abc39a475.1688570702.git.geert+renesas@glider.be>
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

Add support for creating buffers using semi-planar YUV formats with
non-subsampled chroma planes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tests/modetest/buffers.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 0b55aeddfef9a854..0605b12552bb8eec 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -129,6 +129,8 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
 		bpp = 8;
@@ -208,6 +210,11 @@ bo_create(int fd, unsigned int format,
 		virtual_height = height * 2;
 		break;
 
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
+		virtual_height = height * 3;
+		break;
+
 	default:
 		virtual_height = height;
 		break;
@@ -255,6 +262,19 @@ bo_create(int fd, unsigned int format,
 		planes[1] = virtual + offsets[1];
 		break;
 
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
+		offsets[0] = 0;
+		handles[0] = bo->handle;
+		pitches[0] = bo->pitch;
+		pitches[1] = pitches[0] * 2;
+		offsets[1] = pitches[0] * height;
+		handles[1] = bo->handle;
+
+		planes[0] = virtual;
+		planes[1] = virtual + offsets[1];
+		break;
+
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
 		offsets[0] = 0;
-- 
2.34.1

