Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE7B39A1B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 14:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhFCNAd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 09:00:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:49508 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230426AbhFCNAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 09:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=izaio6OYOi5/cS210qcp/hZqBx9
        Kcznl+daTmtcK+PA=; b=VCnTWd5/N0C8pbs1JZvHP6THBoO8cO3EN8xAOjEIT50
        66OE1Hq05vBy4rB3N0TF5XBajrVaVSJbHS0bS5nC0u7Aqcgdainm5Z93ICxAs/OT
        qLzd6EVYgF7w+LQm6SFLwTtoMUyMMvuD7ghBdn76BmggAV278emou0lK/gNc+z+I
        =
Received: (qmail 1026719 invoked from network); 3 Jun 2021 14:58:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2021 14:58:46 +0200
X-UD-Smtp-Session: l3s3148p1@QuyxItzDPqEgARa4RTZoAT2JZZqL3FPj
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] docs: fault-injection: fix non-working usage of negative values
Date:   Thu,  3 Jun 2021 14:58:41 +0200
Message-Id: <20210603125841.27436-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fault injection uses debugfs in a way that the provided values via sysfs
are interpreted as u64. Providing negative numbers results in an error:

/sys/kernel/debug/fail_function# echo -1 > times
sh: write error: Invalid argument

Update the docs and examples to use "printf %#x <val>" in these cases.
For "retval", reword the paragraph a little and fix a typo.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../fault-injection/fault-injection.rst       | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index 31ecfe44e5b4..f47d05ed0d94 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -78,8 +78,10 @@ configuration of fault-injection capabilities.
 
 - /sys/kernel/debug/fail*/times:
 
-	specifies how many times failures may happen at most.
-	A value of -1 means "no limit".
+	specifies how many times failures may happen at most. A value of -1
+	means "no limit". Note, though, that this file only accepts unsigned
+	values. So, if you want to specify -1, you better use 'printf' instead
+	of 'echo', e.g.: $ printf %#x -1 > times
 
 - /sys/kernel/debug/fail*/space:
 
@@ -167,11 +169,13 @@ configuration of fault-injection capabilities.
 	- ERRNO: retval must be -1 to -MAX_ERRNO (-4096).
 	- ERR_NULL: retval must be 0 or -1 to -MAX_ERRNO (-4096).
 
-- /sys/kernel/debug/fail_function/<functiuon-name>/retval:
+- /sys/kernel/debug/fail_function/<function-name>/retval:
 
-	specifies the "error" return value to inject to the given
-	function for given function. This will be created when
-	user specifies new injection entry.
+	specifies the "error" return value to inject to the given function.
+	This will be created when the user specifies a new injection entry.
+	Note that this file only accepts unsigned values. So, if you want to
+	use a negative errno, you better use 'printf' instead of 'echo', e.g.:
+	$ printf %#x -12 > retval
 
 Boot option
 ^^^^^^^^^^^
@@ -255,7 +259,7 @@ Application Examples
     echo Y > /sys/kernel/debug/$FAILTYPE/task-filter
     echo 10 > /sys/kernel/debug/$FAILTYPE/probability
     echo 100 > /sys/kernel/debug/$FAILTYPE/interval
-    echo -1 > /sys/kernel/debug/$FAILTYPE/times
+    printf %#x -1 > /sys/kernel/debug/$FAILTYPE/times
     echo 0 > /sys/kernel/debug/$FAILTYPE/space
     echo 2 > /sys/kernel/debug/$FAILTYPE/verbose
     echo 1 > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
@@ -309,7 +313,7 @@ Application Examples
     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
     echo 10 > /sys/kernel/debug/$FAILTYPE/probability
     echo 100 > /sys/kernel/debug/$FAILTYPE/interval
-    echo -1 > /sys/kernel/debug/$FAILTYPE/times
+    printf %#x -1 > /sys/kernel/debug/$FAILTYPE/times
     echo 0 > /sys/kernel/debug/$FAILTYPE/space
     echo 2 > /sys/kernel/debug/$FAILTYPE/verbose
     echo 1 > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
@@ -336,11 +340,11 @@ Application Examples
     FAILTYPE=fail_function
     FAILFUNC=open_ctree
     echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
-    echo -12 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
+    printf %#x -12 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
-    echo -1 > /sys/kernel/debug/$FAILTYPE/times
+    printf %#x -1 > /sys/kernel/debug/$FAILTYPE/times
     echo 0 > /sys/kernel/debug/$FAILTYPE/space
     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
 
-- 
2.30.2

