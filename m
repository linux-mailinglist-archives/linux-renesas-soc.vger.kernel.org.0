Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7786C7EB826
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 22:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjKNVHT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 16:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjKNVHT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 16:07:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF452BF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 13:07:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26CF8D49;
        Tue, 14 Nov 2023 22:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699996007;
        bh=rm33E8/1rOfXB4A6XF7o0/J8hGu2nPUB6HQ+25V96LU=;
        h=From:To:Cc:Subject:Date:From;
        b=nqeWjvgwhRE+aGViQeNNZapVp1AOT2U7d2Yb6MS3EuG4t9vO93sLR9rdCbIY65Eyb
         yhSJwh7+c19ZGRxZOoSVQ94qOQomlesXbyOq9t4wHe2kPY/aLgnK3kPlR0qeP9mkij
         E1WD/sZVZNUfpO7t3O/+OuTj19Rus4RjOUNcC6A8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [kms-tests] [PATCH] kmstest: Print summary after running tests
Date:   Tue, 14 Nov 2023 23:07:19 +0200
Message-ID: <20231114210719.32739-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

When running multiple tests, a summary helps getting a quick overview of
the results. Accumulate the number of success, skip and fail, and print
them at the end:

	28 tests: 24 SUCCESS, 4 SKIP, 0 FAIL

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 tests/kmstest.py | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index a86d689347d9..3cc8f1a3e306 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -3,6 +3,7 @@
 # SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import collections.abc
+from dataclasses import dataclass
 import errno
 import fcntl
 import os
@@ -329,6 +330,22 @@ class AtomicRequest(pykms.AtomicReq):
 
 
 class KMSTest(object):
+
+    @dataclass
+    class Stats:
+        success: int = 0
+        skip: int = 0
+        fail: int = 0
+
+        def __add__(self, other):
+            return KMSTest.Stats(success=self.success + other.success,
+                                 skip=self.skip + other.skip,
+                                 fail=self.fail + other.fail)
+
+        @property
+        def total(self):
+            return self.success + self.skip + self.fail
+
     def __init__(self, use_default_key_handler=False):
         if not getattr(self, 'main', None):
             raise RuntimeError('Test class must implement main method')
@@ -348,6 +365,8 @@ class KMSTest(object):
         if use_default_key_handler:
             self.loop.register(sys.stdin, selectors.EVENT_READ, self.__read_key)
 
+        self.__stats = KMSTest.Stats()
+
     def __enter__(self):
         return self
 
@@ -533,6 +552,8 @@ class KMSTest(object):
         sys.stdout.write(f'\rTesting {self.test_name}: FAIL\n')
         sys.stdout.flush()
 
+        self.__stats.fail += 1
+
     def skip(self, reason):
         """Complete a test with skip."""
         self.logger.log(f'Test skipped. Reason: {reason}')
@@ -540,6 +561,8 @@ class KMSTest(object):
         sys.stdout.write('SKIP\n')
         sys.stdout.flush()
 
+        self.__stats.skip += 1
+
     def success(self):
         """Complete a test with success."""
         self.logger.log('Test completed successfully')
@@ -547,6 +570,12 @@ class KMSTest(object):
         sys.stdout.write(f'\rTesting {self.test_name}: SUCCESS\n')
         sys.stdout.flush()
 
+        self.__stats.success += 1
+
+    @property
+    def stats(self):
+        return self.__stats
+
 
 if __name__ == '__main__':
     import argparse
@@ -567,6 +596,8 @@ if __name__ == '__main__':
             if path.is_file() and path.name.startswith('kms-test-') and path.name.endswith('.py'):
                 files.append(path.name)
 
+    stats = KMSTest.Stats()
+
     files.sort()
     for file in files:
         print(f'- {file}')
@@ -586,3 +617,6 @@ if __name__ == '__main__':
             # objects end up being deleted.
             with test() as test:
                 test.execute()
+                stats = stats + test.stats
+
+    print(f'{stats.total} tests: {stats.success} SUCCESS, {stats.skip} SKIP, {stats.fail} FAIL')

base-commit: 2264236eefd15450320c0cdb34fa07ac0881f713
prerequisite-patch-id: d24ee333fe0548c916988bc5c1d9fb2c80d9f149
-- 
Regards,

Laurent Pinchart

