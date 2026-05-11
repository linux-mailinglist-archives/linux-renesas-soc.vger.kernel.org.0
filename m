Return-Path: <linux-renesas-soc+bounces-32428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNYGILtlAmqZsQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:26:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7560517456
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AF343016805
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BAF2DEA75;
	Mon, 11 May 2026 23:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M5UOmVtQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424835F169
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 23:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541984; cv=none; b=D5H8iBPKriBVbGYR80FCuT/SRgys1T1K2QIFUPD2nXIOQJ0/YgYAdKJOhY5TqC6/aR4iEq6XD7anDfVCC7zxxNJ4Kzz1DZ6trPsqspa9q4rVdYilJBggVsaa6IgKNyZ12hXNbdWNVIsgMyn4TEXEZ0726wIv0XP7Imtbvb+tUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541984; c=relaxed/simple;
	bh=ZxM8RFcacNKxN9WX0TTV5i87cPeReDUnm17EXLN+MtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeIhJFV+DCU/K4J7FBmeIOwSG7ihxxhRuX5V/d8ozH2dsCisoEDf3dZZD0UtFu6FaVRnEArLXsYcF83DKdAAV3zu+eJD2JICkDTuLue9vaGGlsFh4ObtJ3IRq9ButfFJGCZMDz4ThCWYd+FRUbInrIj5kZ4QVrhDRW5OmY3DYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M5UOmVtQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA6E9103F;
	Tue, 12 May 2026 01:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778541963;
	bh=ZxM8RFcacNKxN9WX0TTV5i87cPeReDUnm17EXLN+MtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M5UOmVtQfmkwrqWjf0dIFPH0jmrbdY77niytvgA3HDVNAKP4wbaRc3P/zR16GDZND
	 1sZts0zltFs1iYZB0XljtZdn4bx0lCjjvwFI4jTSmLvs3EoBQjlWdXM+1ZU8jykOEN
	 /aT4uKBHHMNvi8QXVMeYx+thhfZRISfnWf26HL5Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-tests] [PATCH 2/4] kmstest: Take bandwidth constraints into account to select mode
Date: Tue, 12 May 2026 02:26:05 +0300
Message-ID: <20260511232607.3464470-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511232607.3464470-1-laurent.pinchart@ideasonboard.com>
References: <20260511232607.3464470-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E7560517456
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-32428-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,primary_plane.id:url,mode.name:url,0.0.0.24:email,0.0.0.30:email]
X-Rspamd-Action: no action

Memory and internal bus bandwidth is not infinite. When operating at
high resolutions with multiple planes, the DU and VSP can exceed their
bandwidths limits. This results in VSP underrun messages printed to the
kernel log, and corruption on the screen.

Tests that select the default mode for a connector typically end up
using the largest resolution, which triggers the underruns on a M3-N
with a 4K@30 HDMI monitor. Instead of selecting the default mode, take
bandwidth requirements into account to select the largest mode not
likely to cause underruns.

The bandwidth limits are not static, as memory bandwidth is shared by
the whole system. Nonetheless, runing multi-plane tests on an M3-N SoC
without any other significant system load showed a consistent bandwidth
limit for the display of about 3.2 GB/s. Hardcode it for now, the value
could be made SoC-dependent later.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-allplanes.py       | 17 ++++++++---
 tests/kms-test-brxalloc.py        | 23 +++++++++++---
 tests/kms-test-crc.py             | 17 ++++++++---
 tests/kms-test-plane-alpha.py     | 12 ++++++--
 tests/kms-test-plane-blendmode.py | 12 ++++++--
 tests/kms-test-plane-position.py  | 12 ++++++--
 tests/kms-test-plane-zpos.py      | 12 ++++++--
 tests/kmstest.py                  | 50 +++++++++++++++++++++++++++++++
 8 files changed, 135 insertions(+), 20 deletions(-)

diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index 03eb668acc6e..4d8662148c33 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -27,12 +27,11 @@ class AllPlanesTest(kmstest.KMSTest):
         for crtc in self.card.crtcs:
             self.start(f'composition on CRTC {crtc.id}')
 
-            # Get the connector and default mode
+            # Get the connector
             try:
                 connector = connectors[crtc];
-                mode = connector.get_default_mode()
             except KeyError:
-                self.skip('no connector or mode available')
+                self.skip('no connector available')
                 continue
 
             # List planes available for the CRTC
@@ -45,12 +44,22 @@ class AllPlanesTest(kmstest.KMSTest):
                 self.skip('no plane available for CRTC')
                 continue
 
+            # Pick the largest mode with a bandwidth that does not exceed the
+            # system limit.
+            pixelformat = 'XR24'
+            mode = self.get_largest_mode(connector, len(planes) + 1, pixelformat)
+
+            if not mode:
+                self.skip('no suitable mode available')
+                continue
+
             self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                             f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                             f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
             # Create a frame buffer
-            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay,
+                                       pixelformat)
             pykms.draw_test_pattern(fb)
 
             # Set the mode with a primary plane
diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index 04d4029a8c54..0223e7dab3b9 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -11,6 +11,7 @@ class Output(object):
         self.crtc = None
         self.connector = None
         self.fb = None
+        self.mode = None
 
 
 class BRxAllocTest(kmstest.KMSTest):
@@ -64,16 +65,30 @@ class BRxAllocTest(kmstest.KMSTest):
         self.start(f'Moving {len(planes)} planes from {outputs[0].connector.fullname} '
                    f'to {outputs[1].connector.fullname}')
 
+        # Pick the largest mode with a bandwidth that does not exceed the system
+        # limit.
+        pixelformat = 'XR24'
+
+        for output in outputs:
+            output.mode = self.get_largest_mode(connector, len(planes), pixelformat)
+            if not output.mode:
+                self.skip('no suitable mode available')
+                return
+
         # Set the initial mode for both outputs and wait 5s for the monitors to
         # wake up.
         for output in outputs:
-            # Get the default mode and create a framebuffer
-            mode = output.connector.get_default_mode()
-            output.fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+            # Create a framebuffer
+            output.fb = pykms.DumbFramebuffer(self.card, output.mode.hdisplay,
+                                              output.mode.vdisplay, pixelformat)
             pykms.draw_test_pattern(output.fb)
 
             # Set the mode with no plane
-            ret = self.atomic_crtc_mode_set(output.crtc, output.connector, mode, sync=True)
+            self.logger.log(f'Set mode {output.mode.name}@{output.mode.vrefresh} '
+                            f'on connector {output.connector.fullname} '
+                            f'(CRTC {output.crtc.id})')
+
+            ret = self.atomic_crtc_mode_set(output.crtc, output.connector, output.mode, sync=True)
             if ret < 0:
                 self.fail(f'atomic mode set on {output.connector.fullname} failed with {ret}')
                 return
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 18e7cee928b6..ace2e0d134ae 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -130,12 +130,11 @@ class CRCTest(kmstest.KMSTest):
                 self.skip(f'CRC support not available for CRTC {crtc.id}')
                 continue
 
-            # Get the connector and default mode
+            # Get the connector
             try:
                 connector = connectors[crtc];
-                mode = connector.get_default_mode()
             except KeyError:
-                self.skip('no connector or mode available')
+                self.skip('no connector available')
                 continue
 
             # List planes available for the CRTC
@@ -148,11 +147,21 @@ class CRCTest(kmstest.KMSTest):
                 self.skip('no plane available for CRTC')
                 continue
 
+            # Pick the largest mode with a bandwidth that does not exceed the
+            # system limit.
+            pixelformat = 'XR24'
+            mode = self.get_largest_mode(connector, len(planes) + 1, pixelformat)
+
+            if not mode:
+                self.skip('no suitable mode available')
+                continue
+
             self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                             f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes')
 
             # Create a frame buffer and draw a test pattern.
-            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay,
+                                       pixelformat)
             pykms.draw_test_pattern(fb)
 
             # Create a composer. This will compute the reference CRCs.
diff --git a/tests/kms-test-plane-alpha.py b/tests/kms-test-plane-alpha.py
index 50fb31e5c7ee..d7db649552e8 100755
--- a/tests/kms-test-plane-alpha.py
+++ b/tests/kms-test-plane-alpha.py
@@ -19,14 +19,22 @@ class PlaneAlphaTest(kmstest.KMSTest):
             self.skip('no suitable pipeline')
             return
 
-        mode = connector.get_default_mode()
+        # Pick the largest mode with a bandwidth that does not exceed the
+        # system limit.
+        pixelformat = 'XR24'
+        mode = self.get_largest_mode(connector, len(planes) + 1, pixelformat)
+
+        if not mode:
+            self.skip('no suitable mode available')
+            return
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                         f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
         # Create a frame buffer
-        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay,
+                                   pixelformat)
         pykms.draw_test_pattern(fb)
 
         # Set the mode with a primary plane
diff --git a/tests/kms-test-plane-blendmode.py b/tests/kms-test-plane-blendmode.py
index b14744be710b..e353a22bbf13 100755
--- a/tests/kms-test-plane-blendmode.py
+++ b/tests/kms-test-plane-blendmode.py
@@ -19,14 +19,22 @@ class PlaneBlendModeTest(kmstest.KMSTest):
             self.skip('no suitable pipeline')
             return
 
-        mode = connector.get_default_mode()
+        # Pick the largest mode with a bandwidth that does not exceed the
+        # system limit.
+        pixelformat = 'XR24'
+        mode = self.get_largest_mode(connector, len(planes) + 1, pixelformat)
+
+        if not mode:
+            self.skip('no suitable mode available')
+            return
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                         f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
         # Create a frame buffer for the primary plane
-        fb_primary = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+        fb_primary = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay,
+                                           pixelformat)
         pykms.draw_test_pattern(fb_primary)
 
         # Create a frame buffer for the overlay planes (half of the screen size)
diff --git a/tests/kms-test-plane-position.py b/tests/kms-test-plane-position.py
index bedc8eafd98b..d09c9df382e6 100755
--- a/tests/kms-test-plane-position.py
+++ b/tests/kms-test-plane-position.py
@@ -17,13 +17,21 @@ class PlanePositionTest(kmstest.KMSTest):
             self.skip('no suitable pipeline')
             return
 
-        mode = connector.get_default_mode()
+        # Pick the largest mode with a bandwidth that does not exceed the
+        # system limit.
+        pixelformat = 'XR24'
+        mode = self.get_largest_mode(connector, 2 , pixelformat)
+
+        if not mode:
+            self.skip('no suitable mode available')
+            return
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes')
 
         # Create a frame buffer
-        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay,
+                                   pixelformat)
         pykms.draw_test_pattern(fb)
 
         # Set the mode with no plane, wait 5s for the monitor to wake up
diff --git a/tests/kms-test-plane-zpos.py b/tests/kms-test-plane-zpos.py
index 750cc4d90643..17f442dcf2f1 100755
--- a/tests/kms-test-plane-zpos.py
+++ b/tests/kms-test-plane-zpos.py
@@ -19,14 +19,22 @@ class PlaneZPosTest(kmstest.KMSTest):
             self.skip('no suitable pipeline')
             return
 
-        mode = connector.get_default_mode()
+        # Pick the largest mode with a bandwidth that does not exceed the
+        # system limit.
+        pixelformat = 'XR24'
+        mode = self.get_largest_mode(connector, len(planes) + 1, pixelformat)
+
+        if not mode:
+            self.skip('no suitable mode available')
+            return
 
         self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
                         f'mode {mode.name}@{mode.vrefresh} with {len(planes)} planes '
                         f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
 
         # Create a frame buffer
-        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay,
+                                   pixelformat)
         pykms.draw_test_pattern(fb)
 
         # Set the mode with a primary plane, and position it on top of the
diff --git a/tests/kmstest.py b/tests/kmstest.py
index 2b60a77280e1..7c1a8ae77996 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -12,6 +12,25 @@ import selectors
 import sys
 import time
 
+
+PIXEL_FORMATS_BPP = {
+    'RGB8': 1,
+    'AR12': 2,
+    'XR12': 2,
+    'AR15': 2,
+    'XR15': 2,
+    'RG16': 2,
+    'BG24': 3,
+    'RG24': 3,
+    'BA24': 4,
+    'BX24': 4,
+    'AB24': 4,
+    'XB24': 4,
+    'AR24': 4,
+    'XR24': 4,
+}
+
+
 class Timer(object):
     def __init__(self, timeout, callback):
         self.timeout = time.clock_gettime(time.CLOCK_MONOTONIC) + timeout
@@ -525,6 +544,37 @@ class KMSTest(object):
 
         return selected
 
+    def get_largest_mode(self, connector, num_planes, pixelformat):
+        """Get the largest mode of a connector with bandwidth requirements that
+        fit in the system limits."""
+
+        # The hardware documentation does not explain exactly how the device
+        # performs memory accesses. It is however known that DMA occurs in
+        # bursts, and that a FIFO between the VSP and DU relaxes the timings.
+        # The FIFO size isn't known, assume it allows spreading the transfer of
+        # one line of pixels over the total line duration, including blanking.
+        def bandwidth(mode):
+            return mode.clock * 1000 / mode.htotal * mode.hdisplay * \
+                num_planes * PIXEL_FORMATS_BPP[pixelformat]
+
+        # The documentation also does not document a clear bandwidth limit.
+        # Tests on a M3-N SoC with different display modes and formats ran
+        # correctly at 3.110 GB/s (3840x2160@24 in RG24 with 4 overlay planes),
+        # and caused underruns at 3.222 GB/s (3840x2160@24 in XR24 with 3
+        # overlay planes). Set the limit at 3.200 GB/s.
+        bw_limit = 3.200e9
+
+        best_mode = None
+        best_bw = 0
+
+        for mode in connector.get_modes():
+            bw = bandwidth(mode)
+            if bw > best_bw and bw <= bw_limit:
+                best_bw = bw
+                best_mode = mode
+
+        return best_mode
+
     def output_connectors(self):
         for connector in self.card.connectors:
             if connector.fullname.startswith('Writeback-'):
-- 
Regards,

Laurent Pinchart


