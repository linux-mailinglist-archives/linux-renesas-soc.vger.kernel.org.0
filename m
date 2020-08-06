Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC8923D570
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgHFC2V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:28:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgHFC2U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:28:20 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4E14560;
        Thu,  6 Aug 2020 04:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680898;
        bh=J4fg+VdtFW9zMB911f36dnK/m+Ky9S7k6+TsyT8lPH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BXwpA7M2Ibl5PrDmRIoclvMDmj6u/R9nCtFELqqQV1iWzqHUx3ypdN+M/OQWW2ZKh
         HQJUGVFXr9wHj3F+W0b5P46Y/qYwmsUlyPxU74bvWsFCnYLq2GR9gnx+3EDGOXo/Zh
         Of9UKgrL8p2Tp9Dbj5rnUbm2O8K4C/y8T/GA55Oc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] tests: crc: Fix AtomicRequest usage
Date:   Thu,  6 Aug 2020 05:28:00 +0300
Message-Id: <20200806022802.22813-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806022802.22813-1-laurent.pinchart@ideasonboard.com>
References: <20200806022802.22813-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit 3cd7e6814cea ("kmstest.py: Fix CRTC disabling") modified the CRC
test to use the kmstest.AtomicRequest class, but failed to pass the
correct argument to the constructor. Fix it.

Fixes: 3cd7e6814cea ("kmstest.py: Fix CRTC disabling")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index d936d1d4fb90..dcdfcd4abb71 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -58,7 +58,7 @@ class CRCTest(kmstest.KMSTest):
                 self.fail("atomic mode set failed with %d" % ret)
                 continue
 
-            req = kmstest.AtomicRequest(self.card)
+            req = kmstest.AtomicRequest(self)
 
             offset = 100
             for plane in planes:
-- 
Regards,

Laurent Pinchart

