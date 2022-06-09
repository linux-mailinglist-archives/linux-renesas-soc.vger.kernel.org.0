Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91BCF5458B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238537AbiFIXk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238503AbiFIXk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7933320A70A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:55 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39EFFD59;
        Fri, 10 Jun 2022 01:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818044;
        bh=eIHekD/s4Hz5xJ2AIF5PkgFzsH8EN+p087Hk/7mJhKs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=No8cNA6oJ8IFXbmlXYVFCt9sI1fr3D/yDm0XuzOMvzi+oWSP7wjnQP695t1WB1AQE
         izhZayTntCAidGaTNLDRkbB0xw5LWyaACTyAXRoaQLIq2rFBKHRDLUTsGYHnGyeiOj
         KRk9RWHk+YVYNGQ04FTFCVklp22kJMUGT3yxxR7U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 06/10] kmstest: Support specifying alpha value for planes
Date:   Fri, 10 Jun 2022 02:40:27 +0300
Message-Id: <20220609234031.14803-7-laurent.pinchart@ideasonboard.com>
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

Add an optional alpha argument to the atomic_plane_set() function to
specify the alpha value for the plane.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index a99bf3b89d34..1c2a1b46ebe7 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -385,7 +385,7 @@ class KMSTest(object):
         else:
             return req.commit(0, True)
 
-    def atomic_plane_set(self, plane, crtc, source, destination, fb, sync=False):
+    def atomic_plane_set(self, plane, crtc, source, destination, fb, alpha=None, sync=False):
         req = AtomicRequest(self)
         req.add(plane, {
                     'FB_ID': fb.id,
@@ -399,6 +399,8 @@ class KMSTest(object):
                     'CRTC_W': destination.width,
                     'CRTC_H': destination.height,
         })
+        if alpha is not None:
+            req.add(plane, 'alpha', alpha)
         if sync:
             return req.commit_sync()
         else:
-- 
Regards,

Laurent Pinchart

