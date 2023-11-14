Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105CB7EB102
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 14:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjKNNj2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 08:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjKNNj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 08:39:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1852CD41
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 05:39:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30AA4223;
        Tue, 14 Nov 2023 14:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699969137;
        bh=S5P5M73iyMep/W76OBVp5RbtgNxc0RB1IL+DIR8rsgs=;
        h=From:To:Cc:Subject:Date:From;
        b=uzZ0oplLLB5GYnnvJ9Yq52yLpBXdLni1+iOUnWtHdafk6DX5r+uQ3sSvvLCGExJTN
         /DquwS/YHVYwjZPZ9uyqxnvL170X6MhM6BWrXeVUaikGU1CJNpzEiAS0L7q1krvUWQ
         BxzyLTkLI0FqPaa2o+t/vS0EsnQ+hbrt1s9f5Koo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-tests] [PATCH] kmstest: Add support for specifying subset of tests on the command line
Date:   Tue, 14 Nov 2023 15:39:29 +0200
Message-ID: <20231114133929.26419-1-laurent.pinchart@ideasonboard.com>
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

The kmstest.py runner is a convenient way to run all the tests in the
current directory, in addition to running specific tests manually. It is
also useful to run a subset of the tests. Add support for this by
specifying them as command line arguments to kmstest.py.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 4bd4e0ad27a6..a86d689347d9 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -549,14 +549,23 @@ class KMSTest(object):
 
 
 if __name__ == '__main__':
+    import argparse
     import importlib
     import inspect
     import os
+    import sys
 
-    files = []
-    for path in os.scandir():
-        if path.is_file() and path.name.startswith('kms-test-') and path.name.endswith('.py'):
-            files.append(path.name)
+    parser = argparse.ArgumentParser()
+    parser.add_argument('test', type=str, nargs='*', help='Tests files')
+    args = parser.parse_args(sys.argv[1:])
+
+    if args.test:
+        files = args.test
+    else:
+        files = []
+        for path in os.scandir():
+            if path.is_file() and path.name.startswith('kms-test-') and path.name.endswith('.py'):
+                files.append(path.name)
 
     files.sort()
     for file in files:

base-commit: 2264236eefd15450320c0cdb34fa07ac0881f713
-- 
Regards,

Laurent Pinchart

