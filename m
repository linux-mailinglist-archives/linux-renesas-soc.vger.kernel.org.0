Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999E323D574
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgHFC2f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgHFC2e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:28:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051DCC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2020 19:28:33 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7665EBB3;
        Thu,  6 Aug 2020 04:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680899;
        bh=Bdg/t007yqaz4RQ0TEfC982pna3T4lvPIj6b3LA8fP8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G8vc2jR2j8WpZrKRvFbTeRnz5iuwlgSnz/oCYTCfTKmeinKQcHY4WPOH2qRmCWtAO
         ztSbd57s+gfPJiBjp5C61JQUyI5vbliIzYOMsqIAqKgVb/brRbyhoSzKwE7dUzVbLZ
         AeDFHiPLmrNUCgKYwzvMlMgZgHLKW4ecST0d2iqs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/3] tests: formats: Improve error reporting
Date:   Thu,  6 Aug 2020 05:28:02 +0300
Message-Id: <20200806022802.22813-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806022802.22813-1-laurent.pinchart@ideasonboard.com>
References: <20200806022802.22813-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Improve the formats test by counting the number of formats that failed
and reporting failures appropriately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-formats.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index 93075561a843..86f16511f1ea 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -40,6 +40,8 @@ class FormatsTest(kmstest.KMSTest):
         self.logger.log("Testing connector %s, CRTC %u, mode %s" % \
               (connector.fullname, crtc.id, mode.name))
 
+        failed = 0
+
         num_formats = len(crtc.primary_plane.formats)
         for i in range(num_formats):
             format = crtc.primary_plane.formats[i]
@@ -51,6 +53,8 @@ class FormatsTest(kmstest.KMSTest):
             try:
                 fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, format)
             except ValueError:
+                self.logger.log("Failed to create frame buffer")
+                failed += 1
                 continue
 
             pykms.draw_test_pattern(fb)
@@ -58,12 +62,17 @@ class FormatsTest(kmstest.KMSTest):
             # Set the mode with a primary plane
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
             if ret < 0:
-                self.fail("atomic mode set failed with %d" % ret)
+                self.logger.log("atomic mode set failed with %d" % ret)
+                failed += 1
                 continue
 
             self.run(3)
 
         self.atomic_crtc_disable(crtc)
-        self.success()
+
+        if failed:
+            self.fail("%s/%s formats failed" % (failed, num_formats))
+        else:
+            self.success()
 
 FormatsTest().execute()
-- 
Regards,

Laurent Pinchart

