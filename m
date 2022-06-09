Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E020A5458B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236565AbiFIXk7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiFIXk6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF4820C273
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:57 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26E591248;
        Fri, 10 Jun 2022 01:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818045;
        bh=PpQS2LyGHkVE12YdC5c8wxptz74+/XZWHYBqPJZZF/Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kTXNZy0Xg60YG3dHzupKr40OVVlXPS111xvvzld3P5U4hawJiK5rbeZmcojoj4itA
         hEyhuRZBMs9BAFbTUE4MDtg4OlNkh/D02C7dXBAv6P2eoR7QGT/9Ztxw2/jZVVvUTE
         3XZsmJC8jxRoXCwhqF7TMAbuC3tu9CIfjBZoIcBA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 08/10] kmstest: Support specifying zpos value for planes
Date:   Fri, 10 Jun 2022 02:40:29 +0300
Message-Id: <20220609234031.14803-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add an optional zpos argument to the atomic_plane_set() function to
allow controlling the zpos of a plane.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 1c2a1b46ebe7..11cc328b5b32 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -385,7 +385,7 @@ class KMSTest(object):
         else:
             return req.commit(0, True)
 
-    def atomic_plane_set(self, plane, crtc, source, destination, fb, alpha=None, sync=False):
+    def atomic_plane_set(self, plane, crtc, source, destination, fb, alpha=None, zpos=None, sync=False):
         req = AtomicRequest(self)
         req.add(plane, {
                     'FB_ID': fb.id,
@@ -401,6 +401,8 @@ class KMSTest(object):
         })
         if alpha is not None:
             req.add(plane, 'alpha', alpha)
+        if zpos is not None:
+            req.add(plane, 'zpos', zpos)
         if sync:
             return req.commit_sync()
         else:
-- 
Regards,

Laurent Pinchart

