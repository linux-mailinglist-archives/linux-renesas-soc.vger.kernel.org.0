Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677E14914E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 22:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfFQUZc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 16:25:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38652 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfFQUZc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 16:25:32 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4C402AF;
        Mon, 17 Jun 2019 22:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560803130;
        bh=375R4laECwHXGIe3II/QbP0fnB7CeCRxX2C3jmppBzA=;
        h=From:To:Cc:Subject:Date:From;
        b=k6NFNos9cpNzOP1de5J0u6h10xlAwiYpPdnn8wp3ey62a37F8cW0x3MhC4A7W7JBt
         RpBhxAaw4uN0qVCaXA8eUCfl3QiG9gUbwwTP+TS1wk5iysLFem1eR+eH93z+riox2A
         mE2l0SrOcbjAP5tlQ2nmGz1gRHBNS+dbtVeDKZAw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] tests: Add an output routing test
Date:   Mon, 17 Jun 2019 23:25:09 +0300
Message-Id: <20190617202509.25897-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a test that moves an output connector between multiple CRTCs with a
single mode set operation at each step, without going through disable
and reenable cycles. This helps testing the routing configuration code
paths in the commit tail handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-routing.py | 148 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100755 tests/kms-test-routing.py

diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
new file mode 100755
index 000000000000..2cf02ddcc6b5
--- /dev/null
+++ b/tests/kms-test-routing.py
@@ -0,0 +1,148 @@
+#!/usr/bin/python3
+
+import kmstest
+import pykms
+import time
+
+class Pipeline(object):
+    def __init__(self, crtc):
+        self.crtc = crtc
+        self.connector = None
+        self.plane = None
+        self.mode_blob = None
+
+
+class RoutingTest(kmstest.KMSTest):
+    """Test output routing."""
+
+    def main(self):
+
+        # Create the reverse map from CRTC to possible connectors and calculate
+        # the largest resolution.
+        self.crtc_to_connectors = {}
+        max_hdisplay = 0
+        max_vdisplay = 0
+
+        for connector in self.card.connectors:
+            if connector.fullname.startswith('writeback-'):
+                continue
+
+            mode = connector.get_default_mode()
+            max_hdisplay = max(mode.hdisplay, max_hdisplay)
+            max_vdisplay = max(mode.vdisplay, max_vdisplay)
+
+            for crtc in connector.get_possible_crtcs():
+                if not crtc in self.crtc_to_connectors:
+                    self.crtc_to_connectors[crtc] = []
+                self.crtc_to_connectors[crtc].append(connector)
+
+        # Find a connector that can be routed to at least two CRTCs that have
+        # at least two output routes each.
+        shared_connector = None
+        for connector in self.card.connectors:
+            if connector.fullname.startswith('writeback-'):
+                continue
+
+            pipes = []
+            for crtc in connector.get_possible_crtcs():
+                if len(self.crtc_to_connectors[crtc]) >= 2:
+                    pipes.append(Pipeline(crtc))
+
+            if len(pipes) >= 2:
+                shared_connector = connector
+                break
+
+        if not shared_connector:
+            self.skip("No suitable connector")
+            return
+
+        # Allocate planes for each CRTC.
+        pool = [(pipe, list(pipe.crtc.possible_planes)) for pipe in pipes]
+        while len(pool):
+            pool.sort(key=lambda elem: len(elem[1]), reverse=True)
+            pipe, planes = pool[-1]
+            pipe.plane = planes[0]
+            pool = [(elem[0], [p for p in elem[1] if p != pipe.plane]) for elem in pool[:-1]]
+
+        # Create a framebuffer big enough for all connectors.
+        fb = pykms.DumbFramebuffer(self.card, max_hdisplay, max_vdisplay, "XR24")
+        pykms.draw_test_pattern(fb)
+
+        self.start("Moving connector %s between CRTCs %s" % \
+                   (shared_connector.fullname, [pipe.crtc.id for pipe in pipes]))
+
+        self.logger.log("Highest display resolution: %ux%u" % (max_hdisplay, max_vdisplay))
+
+        for master_pipe in pipes:
+            req = kmstest.AtomicRequest(self)
+            connectors = self.allocate_connectors(pipes, master_pipe, shared_connector)
+            route = []
+
+            for pipe in pipes:
+                if pipe.connector and not pipe.connector in connectors.values():
+                    req.add(pipe.connector, 'CRTC_ID', 0)
+
+                pipe.connector = connectors[pipe.crtc]
+                mode = pipe.connector.get_default_mode()
+                pipe.mode_blob = mode.to_blob(self.card)
+
+                req.add(pipe.connector, 'CRTC_ID', pipe.crtc.id)
+                req.add(pipe.crtc, {'ACTIVE': 1, 'MODE_ID': pipe.mode_blob.id})
+                req.add(pipe.plane, {
+                            'FB_ID': fb.id,
+                            'CRTC_ID': pipe.crtc.id,
+                            'SRC_X': 0,
+                            'SRC_Y': 0,
+                            'SRC_W': int(mode.hdisplay * 65536),
+                            'SRC_H': int(mode.vdisplay * 65536),
+                            'CRTC_X': 0,
+                            'CRTC_Y': 0,
+                            'CRTC_W': mode.hdisplay,
+                            'CRTC_H': mode.vdisplay,
+                        })
+
+                route.append("CRTC %u to connector %s" % (pipe.crtc.id, pipe.connector.fullname))
+
+            self.logger.log("Routing " + ", ".join(route))
+
+            ret = req.commit_sync(True)
+            if ret < 0:
+                self.fail("atomic commit failed with %d" % ret)
+                return
+
+            time.sleep(5)
+
+        self.success()
+
+        for pipe in pipes:
+            self.atomic_crtc_disable(pipe.crtc)
+
+
+    def allocate_connectors(self, pipes, master_pipe, shared_connector):
+        # Allocate one connector for each CRTC. Create a pool of available
+        # connectors for each CRTC, sorted by the number of connectors, and
+        # allocate started with the CRTC that has the least number of options.
+        # The master CRTC is always given the shared connector.
+        pool = []
+        for pipe in pipes:
+            if pipe == master_pipe:
+                pool.append((pipe.crtc, [shared_connector]))
+                continue
+
+            pool.append((pipe.crtc, list(self.crtc_to_connectors[pipe.crtc])))
+
+        allocated = {}
+        while len(pool):
+            pool.sort(key=lambda elem: len(elem[1]), reverse=True)
+            crtc, connectors = pool[-1]
+
+            connector = connectors[0]
+            allocated[crtc] = connector
+
+            # Remove the selected connector from all elements in the pool
+            pool = [(elem[0], [c for c in elem[1] if c != connector]) for elem in pool[:-1]]
+
+        return allocated
+
+
+RoutingTest().execute()
-- 
Regards,

Laurent Pinchart

