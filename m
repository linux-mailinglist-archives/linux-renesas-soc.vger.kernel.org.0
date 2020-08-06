Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6DE23D573
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHFC21 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgHFC2Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:28:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E7BC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2020 19:28:25 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C8DCAC8;
        Thu,  6 Aug 2020 04:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680899;
        bh=FCuLdrMAqAxF8sSwb9ni0c6CqMo6ju/I6GX1WAjdG4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VcTIC9q+T971VHo3D1156anOjrnwokopyH29WmzwqHlZtlxGionYcegHG+Br5/heD
         ydTYqdxNAfXmDAgCURpK2HssOYlKJhh3vISCvEp3x+uJn19DwN237iMi0wCIGPvSBc
         3WJQA06znOde6oQQlDdOHYPhSHtFDhSLx1Sg1C/c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/3] tests: formats: Add progress reporting
Date:   Thu,  6 Aug 2020 05:28:01 +0300
Message-Id: <20200806022802.22813-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806022802.22813-1-laurent.pinchart@ideasonboard.com>
References: <20200806022802.22813-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Improve the formats test by adding progress reporting, as the test is
long.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-formats.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index 77c9fe775a7c..93075561a843 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -40,8 +40,12 @@ class FormatsTest(kmstest.KMSTest):
         self.logger.log("Testing connector %s, CRTC %u, mode %s" % \
               (connector.fullname, crtc.id, mode.name))
 
-        for format in crtc.primary_plane.formats:
+        num_formats = len(crtc.primary_plane.formats)
+        for i in range(num_formats):
+            format = crtc.primary_plane.formats[i]
+
             self.logger.log("Testing format %s" % format)
+            self.progress(i+1, num_formats)
 
             # Create a frame buffer
             try:
-- 
Regards,

Laurent Pinchart

