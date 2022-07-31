Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913BD585F77
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbiGaPUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbiGaPUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F218630C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D12056D;
        Sun, 31 Jul 2022 17:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280838;
        bh=oougXVdBnWnqFqSl9zia5AsdVAllO259xkmmRVwOuAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XB4ewKQtguxTK62EJH5fl5y5ppXX88R/6wZu1THha4aLajXs2dZxHSt2RC+cvCA1H
         NbdFtNMigY6QfyvvJ29IFxUmJmPzNqgUr4grWnTF83Vr3BYu7GCDFuOlKKX0VU+3ve
         u51WnDrySM8DqFJ1ghQ7z2vp3rdOE02oTzW1yQ2c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 5/7] tests: crc: Skip test if CRC support isn't available
Date:   Sun, 31 Jul 2022 18:20:22 +0300
Message-Id: <20220731152024.24090-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
References: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If CRC support isn't available (most likely caused by debugfs not being
mounted), the CRCReader constructor will throw an exception that the crc
test doesn't handle. Move construction of the CRCReader earlier and skip
the test if it fails.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index efb3cf0dbe41..01f9606f2de9 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -123,6 +123,13 @@ class CRCTest(kmstest.KMSTest):
         for crtc in self.card.crtcs:
             self.start(f'CRC calculation on CRTC {crtc.id}')
 
+            try:
+                crc_reader = kmstest.CRCReader(crtc)
+            except:
+                self.logger.log('Failed to create CRC reader, check that debugfs is mounted')
+                self.skip(f'CRC support not available for CRTC {crtc.id}')
+                continue
+
             # Get the connector and default mode
             try:
                 connector = connectors[crtc];
@@ -198,7 +205,6 @@ class CRCTest(kmstest.KMSTest):
                 # Set the CRC source and acquire 10 CRC values. Discard the
                 # first value, as the device is running and the new source
                 # needs one frame to take effect.
-                crc_reader = kmstest.CRCReader(crtc)
                 crc_reader.start(crc_source)
                 crcs = crc_reader.read(10)
                 crc_reader.stop()
-- 
Regards,

Laurent Pinchart

