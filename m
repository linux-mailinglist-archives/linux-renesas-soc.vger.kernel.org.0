Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A975458B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238485AbiFIXky (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiFIXky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB5E208D5D
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:53 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CF639C7;
        Fri, 10 Jun 2022 01:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818043;
        bh=ScBpuzy4Orcg1xwE6Ng0/nKHeNX8hddCSCTjhEGcj1c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IzDTvl+beY1LBNTMFMD6Q6tA0TlJbX0cIKRabP5RguNtk1wZKg9yQSJ1WK46pr2v5
         km1gmQZVufPFANTEMIm4gdjgY7wbyln7BUaNBKlrmq9hGqloPrkeNOjxqtIVO230h2
         +BqHHmKRWnR2dfxcGhkqeii3WtsYKg3AaPd3eigs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 04/10] kmstest: Move props value formatting to AtomicRequest
Date:   Fri, 10 Jun 2022 02:40:25 +0300
Message-Id: <20220609234031.14803-5-laurent.pinchart@ideasonboard.com>
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

Centralize props value formatting in the AtomicRequest.add() function to
avoid having to call it manually through the code base.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 14e28cd47fbd..2afaa513aa4d 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -258,15 +258,20 @@ class AtomicRequest(pykms.AtomicReq):
         self.__test = test
         self.__props = {}
 
+    def __format_props(self, props):
+        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
+
     def add(self, obj, *kwargs):
         if obj.id not in self.__props:
             self.__props[obj.id] = {}
-        props = self.__props[obj.id]
+        obj_props = self.__props[obj.id]
 
         if len(kwargs) == 1 and isinstance(kwargs[0], collections.abc.Mapping):
-            props.update(kwargs[0])
+            props = self.__format_props(kwargs[0])
         elif len(kwargs) == 2:
-            props[kwargs[0]] = kwargs[1]
+            props = self.__format_props({ kwargs[0]: = kwargs[1] })
+
+        obj_props.update(props)
 
         super().add(obj, *kwargs)
 
@@ -309,9 +314,6 @@ class KMSTest(object):
     def __del__(self):
         self.logger.close()
 
-    def __format_props(self, props):
-        return {k: v & ((1 << 64) - 1) for k, v in props.items()}
-
     def atomic_crtc_disable(self, crtc, sync=True):
         req = AtomicRequest(self)
         req.add(crtc, {'ACTIVE': 0, 'MODE_ID': 0})
@@ -368,7 +370,7 @@ class KMSTest(object):
 
     def atomic_plane_set(self, plane, crtc, source, destination, fb, sync=False):
         req = AtomicRequest(self)
-        req.add(plane, self.__format_props({
+        req.add(plane, {
                     'FB_ID': fb.id,
                     'CRTC_ID': crtc.id,
                     'SRC_X': int(source.left * 65536),
@@ -379,7 +381,7 @@ class KMSTest(object):
                     'CRTC_Y': destination.top,
                     'CRTC_W': destination.width,
                     'CRTC_H': destination.height,
-        }))
+        })
         if sync:
             return req.commit_sync()
         else:
-- 
Regards,

Laurent Pinchart

