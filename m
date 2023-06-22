Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616A6739D80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jun 2023 11:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjFVJg2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jun 2023 05:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232575AbjFVJfT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 05:35:19 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF162979
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 02:28:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
        by laurent.telenet-ops.be with bizsmtp
        id C9Uq2A00B1yfRTD019Uqq2; Thu, 22 Jun 2023 11:28:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGcS-000Byz-IC;
        Thu, 22 Jun 2023 11:28:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGcU-003W5Y-50;
        Thu, 22 Jun 2023 11:28:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Helge Deller <deller@gmx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] fbdev: sh_mobile_lcdcfb: Fix ARGB32 overlay format typo
Date:   Thu, 22 Jun 2023 11:28:48 +0200
Message-Id: <a48665d08e6d4d2bbbff1d53aab06dfeb19136f4.1687426052.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

When configurating a CHn Source Image Format Register (LDBBSIFR), one
should use the corresponding LDBBSIFR_RPKF_* definition for overlay
planes, not the DDFR_PKF_* definition for the primary plane.

Fortunately both definitions resolve to the same value, so this bug did
not cause any harm.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 093f035d12463a80..0adb2ba965e7120d 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -824,7 +824,7 @@ static void sh_mobile_lcdc_overlay_setup(struct sh_mobile_lcdc_overlay *ovl)
 		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB24;
 		break;
 	case V4L2_PIX_FMT_BGR32:
-		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
+		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;
 		break;
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
-- 
2.34.1

