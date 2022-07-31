Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38FF585F79
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbiGaPUp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbiGaPUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789DC6321
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA34A56D;
        Sun, 31 Jul 2022 17:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280842;
        bh=KuMe3zFeEt4xUdUmdKtkeB0lYKDCMajCOuwwK4Ir6i4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pdd9Ny4OPp6CVE3IRWOLKyvQU2VYhUbmatck4XOdJJ7uM0R2VPueb3JudalBct7Nl
         m9Bam7FMTzuzfrJVzR9m/0+BFHSr8GxFf2wsaHHrHonvMl3vaPUSl8FX7K9KfEjuQM
         qSOgWSXulYGZs1C60Ly28ETFLUjdPZsoqLIeWfJY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 7/7] kmstest: Implement test runner when executed directly
Date:   Sun, 31 Jul 2022 18:20:24 +0300
Message-Id: <20220731152024.24090-8-laurent.pinchart@ideasonboard.com>
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

Run all tests from the current directory when the kmstest.py script it
executed directly, as opposed to being imported by individual tests.
This simplifies running all tests.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 960c27f301ce..e84d8fe859f4 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -334,7 +334,17 @@ class KMSTest(object):
         if use_default_key_handler:
             self.loop.register(sys.stdin, selectors.EVENT_READ, self.__read_key)
 
+    def __enter__(self):
+        return self
+
+    def __exit__(self, *err):
+        self.card = None
+        self.loop.close()
+        self.logger.close()
+
     def __del__(self):
+        self.card = None
+        self.loop.close()
         self.logger.close()
 
     def atomic_crtc_disable(self, crtc, sync=True):
@@ -520,3 +530,33 @@ class KMSTest(object):
         sys.stdout.write(f'\rTesting {self.test_name}: SUCCESS\n')
         sys.stdout.flush()
 
+
+if __name__ == '__main__':
+    import importlib
+    import inspect
+    import os
+
+    files = []
+    for path in os.scandir():
+        if path.is_file() and path.name.startswith('kms-test-') and path.name.endswith('.py'):
+            files.append(path.name)
+
+    files.sort()
+    for file in files:
+        print(f'- {file}')
+        module = importlib.import_module(file[:-3])
+        tests = []
+        for name in dir(module):
+            obj = getattr(module, name)
+            if not isinstance(obj, type):
+                continue
+
+            if 'KMSTest' in [cls.__name__ for cls in inspect.getmro(obj)]:
+                tests.append(obj)
+
+        for test in tests:
+            # Use a context manager to ensure proper cleanup after each test,
+            # otherwise state from one test may leak to the other based on when
+            # objects end up being deleted.
+            with test() as test:
+                test.execute()
-- 
Regards,

Laurent Pinchart

