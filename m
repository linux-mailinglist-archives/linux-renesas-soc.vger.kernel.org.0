Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AE3585F73
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbiGaPUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236805AbiGaPUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1D3260D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BE6556D;
        Sun, 31 Jul 2022 17:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280832;
        bh=nHMSxXUMO60p2RGhdvdsIsFyJwSAZsVSA7ctIlCt+lY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ezb/NOJx8D98pKknccl1Bb9Gzo8RvM1baT2dTE7B+NqhBXNATFfjw0w420BZ3ihgr
         qxCfGmyjrVBlRwBxrr3mzjb45k4b1QEIwPj3ynxECpbeY218znZXoFAqEsTQwefkVz
         asarRY6gfMAJxyzEJEDVMWk8BAH9+W4c3rhECRvQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 1/7] tests: brxalloc: Fix test start log message
Date:   Sun, 31 Jul 2022 18:20:18 +0300
Message-Id: <20220731152024.24090-2-laurent.pinchart@ideasonboard.com>
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

The test start log message incorrectly prints the same connector twice
instead of the source and destination connectors. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-brxalloc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index 7170ee6c7708..c80d2e33c846 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -62,7 +62,7 @@ class BRxAllocTest(kmstest.KMSTest):
             return
 
         self.start(f'Moving {len(planes)} planes from {outputs[0].connector.fullname} '
-                   f'to {outputs[0].connector.fullname}')
+                   f'to {outputs[1].connector.fullname}')
 
         # Set the initial mode for both outputs and wait 5s for the monitors to
         # wake up.
-- 
Regards,

Laurent Pinchart

