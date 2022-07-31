Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250B4585F75
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbiGaPUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiGaPUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21816260D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A87F856D;
        Sun, 31 Jul 2022 17:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280835;
        bh=PgII6PKbk6FEAQwwNtpY2aRWdHHo4rDqLUPCd2UzAPM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u3vcSUJvI8IyYv15CuyudmBdhZmt7aNq5ISXF++AdgAT4RgGiVECqmT8XoM/a/A9y
         eNLgsTLSifYsgOmEw0YEjVaKwlDcOBgN2RFeW/rnQnY6qql3taQDQJEzlVfX7zra8W
         kkJvzOIAlo3QnGAjLbBN6tl5+LQWcc61Jf70AsfQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 3/7] kmstest: Fix CRC directory name string
Date:   Sun, 31 Jul 2022 18:20:20 +0300
Message-Id: <20220731152024.24090-4-laurent.pinchart@ideasonboard.com>
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

The CRC directory name string was converted to a Python formatted string
literal incorrectly, with the f prefix within the string instead of just
before it. Fix it.

Fixes: dcbc93a117b0 ("tests: Convert to formatted string literals")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 18432375c1ca..177110ebd894 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -171,7 +171,7 @@ class CRCReader(object):
 
         # Hardcode the device minor to 0 as the KMSTest constructor opens the
         # default card object.
-        self.dir = os.open('f/sys/kernel/debug/dri/0/crtc-{self.pipe}/crc', 0)
+        self.dir = os.open(f'/sys/kernel/debug/dri/0/crtc-{self.pipe}/crc', 0)
         self.ctrl = os.open('control', os.O_WRONLY, dir_fd = self.dir)
         self.data = -1
 
-- 
Regards,

Laurent Pinchart

