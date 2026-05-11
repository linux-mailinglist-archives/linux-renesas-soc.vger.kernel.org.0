Return-Path: <linux-renesas-soc+bounces-32378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL15CMzLAWqgjwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012650DCBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E851B3042242
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FF637B028;
	Mon, 11 May 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FkXldW/r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F8D3358D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502173; cv=none; b=clQKV4wmIhJTif5wvbUGdVfw1xO3YO3TGQwn1mVlu0/KXhmkr1nJ9koEksn92YSKc6J0JvBF20W0sL7VBOaP3q1JOgR52u7jtQJvmA8r66I88JBw0CM0aMgNFAwVM2ss9CJ52R5U4VqCAG895V+CRi7/BqFNG3pzJFzFgqGJt4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502173; c=relaxed/simple;
	bh=zfE0zgMqL4Lkf/53WPx8tYprdtjto5A4lIQc+sd1oeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFwCjyMu5QMOZNlHGUERe87PATiOZoAG/FVjJ37i+0T2aA3AO1ARY4vuJixvT0Bmy5Td/xMMl9xT3l8k7qUmAQDqD89xAfGE3SoOwKA4wVeP7PexYh18HI7IhFxOQ4q5RczO9HCu3v+bEdgneP/FLtTq+t97DdMUbXA0N4dWv0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FkXldW/r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 616F926D7;
	Mon, 11 May 2026 14:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502156;
	bh=zfE0zgMqL4Lkf/53WPx8tYprdtjto5A4lIQc+sd1oeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FkXldW/rtL+DBUiQ9wZkalCGWrxuPK2zeuEqqVlBQ4vQUYpR05aTU2MervJqRoVUa
	 NWuOFy1sAgfxFfrdeg+u+xC8xvsPXzsR5HG3TtkwPu2SvzMuHK8izEX3kuehvSbDiy
	 6ZTqtt0BV9SEfThQQ79rFG1h3lLCiuB81ATHiLvs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-test] [PATCH v1 3/5] kmstest: Factor out find_pipeline() function to KMSTest class
Date: Mon, 11 May 2026 15:22:35 +0300
Message-ID: <20260511122237.3084426-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
References: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7012650DCBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-32378-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,mode.name:url]
X-Rspamd-Action: no action

Three different tests duplicate the exact same find_pipeline() function,
and two more open-code it. Move it to the base KMSTest class.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-formats.py         | 28 +++++---------------------
 tests/kms-test-plane-alpha.py     | 28 ++------------------------
 tests/kms-test-plane-blendmode.py | 28 ++------------------------
 tests/kms-test-plane-position.py  | 33 +++++--------------------------
 tests/kms-test-plane-zpos.py      | 28 ++------------------------
 tests/kmstest.py                  | 30 ++++++++++++++++++++++++++++
 6 files changed, 46 insertions(+), 129 deletions(-)

diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index a4f4fbfa3071..ceb20cb0cd94 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -12,31 +12,13 @@ class FormatsTest(kmstest.KMSTest):
     def main(self):
         self.start('plane formats')
 
-        # Find a CRTC with a connected connector and at least one plane
-        for connector in self.output_connectors():
-            if not connector.connected():
-                self.logger.log(f'unconnected connector {connector.fullname}')
-                continue
-
-            try:
-                mode = connector.get_default_mode()
-            except ValueError:
-                continue
-
-            crtcs = connector.get_possible_crtcs()
-            for crtc in crtcs:
-                if crtc.primary_plane:
-                    break
-            else:
-                crtc = None
-
-            if crtc:
-                break
-
-        else:
-            self.skip('no CRTC available with connector')
+        crtc, connector, _ = self.find_pipeline()
+        if crtc is None:
+            self.skip('no suitable pipeline')
             return
 
+        mode = connector.get_default_mode()
+
         self.logger.log(f'Testing connector {connector.fullname}, '
                         f'CRTC {crtc.id}, mode {mode.name}')
 
diff --git a/tests/kms-test-plane-alpha.py b/tests/kms-test-plane-alpha.py
index 894e4ab8baaa..7caf864f05b8 100755
--- a/tests/kms-test-plane-alpha.py
+++ b/tests/kms-test-plane-alpha.py
@@ -11,39 +11,15 @@ class PlaneAlphaTest(kmstest.KMSTest):
     def handle_page_flip(self, frame, time):
         self.logger.log('Page flip complete')
 
-    def find_pipeline(self):
-        # Find a CRTC that has multiple planes with a connected connector
-        for connector in self.output_connectors():
-            # Skip disconnected connectors
-            if not connector.connected():
-                continue
-
-            # Add the connector to the map
-            for crtc in connector.get_possible_crtcs():
-                planes = []
-                for plane in self.card.planes:
-                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
-                        planes.append(plane)
-
-                if len(planes):
-                    return crtc, connector, planes
-
-        return None, None, None
-
     def main(self):
         self.start('composition with alpha control')
 
-        crtc, connector, planes = self.find_pipeline()
+        crtc, connector, planes = self.find_pipeline(1)
         if crtc is None:
             self.skip('no suitable pipeline')
             return
 
-        # Get the default mode
-        try:
-            mode = connector.get_default_mode()
-        except KeyError:
-            self.skip('no mode available')
-            return
+        mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name} with {len(planes)} planes '
diff --git a/tests/kms-test-plane-blendmode.py b/tests/kms-test-plane-blendmode.py
index 9b45d1805ada..bfefe6324380 100755
--- a/tests/kms-test-plane-blendmode.py
+++ b/tests/kms-test-plane-blendmode.py
@@ -11,39 +11,15 @@ class PlaneBlendModeTest(kmstest.KMSTest):
     def handle_page_flip(self, frame, time):
         self.logger.log('Page flip complete')
 
-    def find_pipeline(self):
-        # Find a CRTC that has multiple planes with a connected connector
-        for connector in self.output_connectors():
-            # Skip disconnected connectors
-            if not connector.connected():
-                continue
-
-            # Add the connector to the map
-            for crtc in connector.get_possible_crtcs():
-                planes = []
-                for plane in self.card.planes:
-                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
-                        planes.append(plane)
-
-                if len(planes):
-                    return crtc, connector, planes
-
-        return None, None, None
-
     def main(self):
         self.start('composition with blend modes')
 
-        crtc, connector, planes = self.find_pipeline()
+        crtc, connector, planes = self.find_pipeline(1)
         if crtc is None:
             self.skip('no suitable pipeline')
             return
 
-        # Get the default mode
-        try:
-            mode = connector.get_default_mode()
-        except KeyError:
-            self.skip('no mode available')
-            return
+        mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name} with {len(planes)} planes '
diff --git a/tests/kms-test-plane-position.py b/tests/kms-test-plane-position.py
index c85375adc0d2..d80f91657397 100755
--- a/tests/kms-test-plane-position.py
+++ b/tests/kms-test-plane-position.py
@@ -12,36 +12,13 @@ class PlanePositionTest(kmstest.KMSTest):
     def main(self):
         self.start('plane positioning boundaries')
 
-        # Find a CRTC with a connected connector and at least two planes
-        for connector in self.output_connectors():
-            if not connector.connected():
-                self.logger.log(f'unconnected connector {connector.fullname}')
-                continue
-
-            try:
-                mode = connector.get_default_mode()
-            except ValueError:
-                continue
-
-            crtcs = connector.get_possible_crtcs()
-            for crtc in crtcs:
-                planes = []
-                for plane in self.card.planes:
-                    if plane.supports_crtc(crtc):
-                        planes.append(plane)
-
-                if len(planes) > 1:
-                    break
-            else:
-                crtc = None
-
-            if crtc:
-                break
-
-        else:
-            self.skip('no CRTC available with connector and at least two planes')
+        crtc, connector, planes = self.find_pipeline(1)
+        if crtc is None:
+            self.skip('no suitable pipeline')
             return
 
+        mode = connector.get_default_mode()
+
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name} with {len(planes)} planes')
 
diff --git a/tests/kms-test-plane-zpos.py b/tests/kms-test-plane-zpos.py
index d27008823827..b87ae041936d 100755
--- a/tests/kms-test-plane-zpos.py
+++ b/tests/kms-test-plane-zpos.py
@@ -11,39 +11,15 @@ class PlaneZPosTest(kmstest.KMSTest):
     def handle_page_flip(self, frame, time):
         self.logger.log('Page flip complete')
 
-    def find_pipeline(self):
-        # Find a CRTC that has multiple planes with a connected connector
-        for connector in self.output_connectors():
-            # Skip disconnected connectors
-            if not connector.connected():
-                continue
-
-            # Add the connector to the map
-            for crtc in connector.get_possible_crtcs():
-                planes = []
-                for plane in self.card.planes:
-                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
-                        planes.append(plane)
-
-                if len(planes):
-                    return crtc, connector, planes
-
-        return None, None, None
-
     def main(self):
         self.start('composition with z-pos control')
 
-        crtc, connector, planes = self.find_pipeline()
+        crtc, connector, planes = self.find_pipeline(1)
         if crtc is None:
             self.skip('no suitable pipeline')
             return
 
-        # Get the default mode
-        try:
-            mode = connector.get_default_mode()
-        except KeyError:
-            self.skip('no mode available')
-            return
+        mode = connector.get_default_mode()
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name} with {len(planes)} planes '
diff --git a/tests/kmstest.py b/tests/kmstest.py
index 7df5bfdb78f3..490083aa0e08 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -479,6 +479,36 @@ class KMSTest(object):
         else:
             return req.commit(0)
 
+    def find_pipeline(self, min_planes=0):
+        """Find a CRTC that has a default mode, is wired to a connected
+        connector, and has at least min_planes overlay planes."""
+
+        for connector in self.output_connectors():
+            # Skip disconnected connectors and connectors without a default
+            # mode.
+            if not connector.connected():
+                continue
+
+            try:
+                mode = connector.get_default_mode()
+            except ValueError:
+                continue
+
+            # Find a CRTC with enough planes.
+            for crtc in connector.get_possible_crtcs():
+                if not crtc.primary_plane:
+                    continue
+
+                planes = []
+                for plane in self.card.planes:
+                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
+                        planes.append(plane)
+
+                if len(planes) >= min_planes:
+                    return crtc, connector, planes
+
+        return None, None, None
+
     def output_connectors(self):
         for connector in self.card.connectors:
             if connector.fullname.startswith('Writeback-'):
-- 
Regards,

Laurent Pinchart


