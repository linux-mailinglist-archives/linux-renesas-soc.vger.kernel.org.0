Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8D7585F74
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbiGaPUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiGaPUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B859260D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDDBC415;
        Sun, 31 Jul 2022 17:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280834;
        bh=jxokSrdOuulaS/ekU2uv7jdZrY7VBp/1BBKg6BYvGE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DZQx6SoxJBaSXWeP/WuyI/oT+UixGlOibY/OlPoBWH0B25n95KNvIXAEKum05b8Zq
         zn/7TslbUTSUUxTWg0qBUNairaes5F69pKo/dVAN5RZBLP6/1aG7j8p+Ua/XVbaumV
         xMUZoAvwfVZzIDTkmfhjP2ttNpmkXI+blphduQjw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 2/7] tests: modes: Fix access to RuntimeError message text
Date:   Sun, 31 Jul 2022 18:20:19 +0300
Message-Id: <20220731152024.24090-3-laurent.pinchart@ideasonboard.com>
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

The RuntimeError class has no message member. Use args[0] instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-modes.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
index c47848904ec4..14463add7802 100755
--- a/tests/kms-test-modes.py
+++ b/tests/kms-test-modes.py
@@ -60,7 +60,7 @@ class ModesTest(kmstest.KMSTest):
                     self.progress(i+1, len(modes))
                     self.test_mode(connector, crtc, modes[i])
                 except RuntimeError as e:
-                    self.fail(e.message)
+                    self.fail(e.args[0])
                     break
             else:
                 self.success()
-- 
Regards,

Laurent Pinchart

