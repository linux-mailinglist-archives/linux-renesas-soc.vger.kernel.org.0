Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B13F24777E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 02:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfFQAf7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Jun 2019 20:35:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbfFQAf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Jun 2019 20:35:58 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9957E2AF;
        Mon, 17 Jun 2019 02:35:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560731756;
        bh=8izVufNu8LLwRDlGn4ZGVax/LUiKLlxFSxEmWstn2kI=;
        h=From:To:Cc:Subject:Date:From;
        b=hokPeCznOZMGGqCCcb6POXIuguwbm/vAUB/WJp63MmdoiSSPX+40/OTyjNmtH3OSZ
         DD05M/oWPrzvW5/1fmb104BWyMkUzpXfU0zhUM/4ZRRi3USOoVkSRrVxZ5axhdOoKw
         iS+Mn7RHjFSEmjlyOsNDQPqgaLTkMQkMm4JDKqHk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-tests] [PATCH] tests: Extend BRU/BRS allocation test to cover M3-N
Date:   Mon, 17 Jun 2019 03:35:36 +0300
Message-Id: <20190617003536.30936-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The BRU/BRS allocation test only covers the H3 ES2.0 SoC as that was the
only hardware platform supported by the DU driver that offered the
required features at the time the test was written. Now that M3-N is
supported in the DU driver, support it in the test script.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-brxalloc.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index 2e3f6cb8b39e..f1902f3baf1d 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -17,11 +17,10 @@ class BRxAllocTest(kmstest.KMSTest):
     def main(self):
         # This test requires usage of two CRTCs connected to the same VSPDL
         # instance to test dynamic assignment of the BRU and BRS to pipelines.
-        # This is only occurs on H3 ES2.0 (and M3N which we don't support yet).
-        # Check the SoC model through sysfs as we can't detected it through the
-        # DRM/KMS API.
+        # This is only occurs on H3 ES2.0 and M3N. Check the SoC model through
+        # sysfs as we can't detected it through the DRM/KMS API.
         soc = open("/sys/devices/soc0/soc_id", "rb").read().strip().decode()
-        if soc != "r8a7795":
+        if soc != "r8a7795" and soc != "r8a77965":
             self.skip("VSPDL (BRU+BRS) not available")
             return
 
-- 
Regards,

Laurent Pinchart

