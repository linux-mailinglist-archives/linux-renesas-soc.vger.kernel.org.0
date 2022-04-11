Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12A94FBC99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Apr 2022 14:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243800AbiDKNAV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 09:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345215AbiDKNAU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 09:00:20 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8D5B60
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 05:58:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:b509:6862:2557:437a])
        by albert.telenet-ops.be with bizsmtp
        id HQy4270061G7NMJ06Qy4b8; Mon, 11 Apr 2022 14:58:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ndtcJ-000ASK-O6; Mon, 11 Apr 2022 14:58:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ndtcJ-009JP5-5O; Mon, 11 Apr 2022 14:58:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Helge Deller <deller@gmx.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] video: fbdev: sh_mobile_lcdcfb: Remove sh_mobile_lcdc_check_var() declaration
Date:   Mon, 11 Apr 2022 14:58:01 +0200
Message-Id: <632d1ef6be69c93cd37b9336a133f8c5ec779c8a.1649681814.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 0fe66f327c464943 ("fbdev/sh_mobile: remove
sh_mobile_lcdc_display_notify"), there is no longer a need for a foward
declaration of sh_mobile_lcdc_check_var().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index aa4ebe3192ec9735..9a4417430b4e948f 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -531,9 +531,6 @@ static void sh_mobile_lcdc_display_off(struct sh_mobile_lcdc_chan *ch)
 		ch->tx_dev->ops->display_off(ch->tx_dev);
 }
 
-static int sh_mobile_lcdc_check_var(struct fb_var_screeninfo *var,
-				    struct fb_info *info);
-
 /* -----------------------------------------------------------------------------
  * Format helpers
  */
-- 
2.25.1

