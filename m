Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4438948867
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 18:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfFQQMl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 12:12:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35452 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfFQQMl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 12:12:41 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A24712AF;
        Mon, 17 Jun 2019 18:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560787958;
        bh=XmbA4nnMUb37UZwfG9v2d7nn7oTvfYFlVTkTgNtHAPE=;
        h=From:To:Cc:Subject:Date:From;
        b=Zjzv51LH89KEZLb0Aa6Bluh8i8MIjbzqi0/qMq41m0tRbTUlnjQK0GTVSrEskxA+A
         YOP4X2SI07Nf8ji6k5sranxQ97dLwM+PEjr30n7yy8VG08Nzd9BN9svtb/QhalDxwU
         AnMCqX6lRTQZjQ8c18hzUlU+xiztNItPmXhLbpeg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-tests] [PATCH 1/2] kmstest.py: Fix CRTC disabling
Date:   Mon, 17 Jun 2019 19:12:16 +0300
Message-Id: <20190617161217.22463-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The KMSTest.atomic_crtc_disable() method deactivate a CRTC but doesn't
fully disables it, which requires setting the MODE_ID to 0. Furthermore
it doesn't de-associate the CRTC from connectors and planes, which cause
atomic check failures as a fully disabled CRTC can't be associated with
connectors. It can also lead to the next test failing due to resources
still being allocated to the CRTC.

To fix this, introduce an AtomicRequest class that wraps around
pykms.AtomicReq, and stores a copy of all the properties. When the
request is committed the properties are added to a global state, which
is then used to locate and release connectors and planes associated with
the CRTC in KMSTest.atomic_crtc_disable().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py |  2 +-
 tests/kmstest.py      | 65 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 30d8bea796dc..29147e5bd0a3 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -56,7 +56,7 @@ class CRCTest(kmstest.KMSTest):
                 self.fail("atomic mode set failed with %d" % ret)
                 continue
 
-            req = pykms.AtomicReq(self.card)
+            req = kmstest.AtomicRequest(self.card)
 
             offset = 100
             for plane in planes:
diff --git a/tests/kmstest.py b/tests/kmstest.py
index 12454df12f2d..adb67c82c368 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -1,5 +1,6 @@
 #!/usr/bin/python3
 
+import collections.abc
 import errno
 import fcntl
 import os
@@ -208,6 +209,40 @@ class Rect(object):
         self.height = height
 
 
+class AtomicRequest(pykms.AtomicReq):
+    def __init__(self, test):
+        super().__init__(test.card)
+        self.__test = test
+        self.__props = {}
+
+    def add(self, obj, *kwargs):
+        if not obj.id in self.__props:
+            self.__props[obj.id] = {}
+        props = self.__props[obj.id]
+
+        if len(kwargs) == 1 and isinstance(kwargs[0], collections.abc.Mapping):
+            props.update(kwargs[0])
+        elif len(kwargs) == 2:
+            props[kwargs[0]] = kwargs[1]
+
+        super().add(obj, *kwargs)
+
+    def commit(self, data=0, allow_modeset=False):
+        ret = super().commit(data, allow_modeset)
+        if ret == 0:
+            self.__test._props.update(self.__props)
+        return ret
+
+    def commit_sync(self, allow_modeset=False):
+        ret = super().commit_sync(allow_modeset)
+        if ret == 0:
+            self.__test._props.update(self.__props)
+        return ret
+
+    def __repr__(self):
+        return repr(self.__props)
+
+
 class KMSTest(object):
     def __init__(self, use_default_key_handler=False):
         if not getattr(self, 'main', None):
@@ -217,6 +252,8 @@ class KMSTest(object):
         if not self.card.has_atomic:
             raise RuntimeError("Device doesn't support the atomic API")
 
+        self._props = {}
+
         logname = self.__class__.__name__
         self.logger = Logger(logname)
 
@@ -233,8 +270,24 @@ class KMSTest(object):
         return {k: v & ((1 << 64) - 1) for k, v in props.items()}
 
     def atomic_crtc_disable(self, crtc, sync=True):
-        req = pykms.AtomicReq(self.card)
-        req.add(crtc, 'ACTIVE', False)
+        req = AtomicRequest(self)
+        req.add(crtc, { 'ACTIVE': 0, 'MODE_ID': 0 })
+        for connector in self.card.connectors:
+            if connector.id in self._props:
+                props = self._props[connector.id]
+                try:
+                    if props['CRTC_ID'] == crtc.id:
+                        req.add(connector, 'CRTC_ID', 0)
+                except:
+                    pass
+        for plane in self.card.planes:
+            if plane.id in self._props:
+                props = self._props[plane.id]
+                try:
+                    if props['CRTC_ID'] == crtc.id:
+                        req.add(plane, {'CRTC_ID': 0, 'FB_ID': 0})
+                except:
+                    pass
         if sync:
             return req.commit_sync(True)
         else:
@@ -249,7 +302,7 @@ class KMSTest(object):
         # the commit completes.
         mode_blob = mode.to_blob(self.card)
 
-        req = pykms.AtomicReq(self.card)
+        req = AtomicRequest(self)
         req.add(connector, 'CRTC_ID', crtc.id)
         req.add(crtc, { 'ACTIVE': 1, 'MODE_ID': mode_blob.id })
         if fb:
@@ -271,7 +324,7 @@ class KMSTest(object):
             return req.commit(0, True)
 
     def atomic_plane_set(self, plane, crtc, source, destination, fb, sync=False):
-        req = pykms.AtomicReq(self.card)
+        req = AtomicRequest(self)
         req.add(plane, self.__format_props({
                     'FB_ID': fb.id,
                     'CRTC_ID': crtc.id,
@@ -290,7 +343,7 @@ class KMSTest(object):
             return req.commit(0)
 
     def atomic_plane_disable(self, plane, sync=True):
-        req = pykms.AtomicReq(self.card)
+        req = AtomicRequest(self)
         req.add(plane, { "FB_ID": 0, 'CRTC_ID': 0 })
 
         if sync:
@@ -299,7 +352,7 @@ class KMSTest(object):
             return req.commit(0)
 
     def atomic_planes_disable(self, sync=True):
-        req = pykms.AtomicReq(self.card)
+        req = AtomicRequest(self)
         for plane in self.card.planes:
             req.add(plane, { "FB_ID": 0, 'CRTC_ID': 0 })
 
-- 
Regards,

Laurent Pinchart

