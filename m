Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC45926DEA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 16:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgIQOqb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 10:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgIQOW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 10:22:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF28C061220
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 07:06:59 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0D4AE89;
        Thu, 17 Sep 2020 16:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600351495;
        bh=Gu9H/xV3s6YCY19HKwLUdp3+Syo05ZN2xbzwE55stos=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a45pVR1VsyzGTGVGUGJwsTD8X91bOtFnXnHuxP8eh1NedUCit6v8BwuzX+2h3XlRz
         y6CmKuXPVmPODKKsx5eK2eA/g5lL2dEyUqTHbkruOd3Hemn5NFpbiqWx1LS1mFWOO3
         3/vUzmgEfXCxE2jVPAebJDD3ttGxYOBLrpo706nI=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH v2 2/3] src: monotonic-ts: Monotonic timestamp logging
Date:   Thu, 17 Sep 2020 15:04:49 +0100
Message-Id: <20200917140450.12264-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917140450.12264-1-kieran.bingham@ideasonboard.com>
References: <20200917140450.12264-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Introduce a new utility which prefixes a monotonic timestamp rendered in the
same format as the kernel logs to all lines fed in through stdin.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v2:
 - Clean up Makefile
 - Use separate line for each installed binary
 - Remove blank line from c file

 src/Makefile       |  9 +++++++--
 src/monotonic-ts.c | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 src/monotonic-ts.c

diff --git a/src/Makefile b/src/Makefile
index d7f901f58be6..c40e95afca50 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -7,18 +7,23 @@ CFLAGS	?= -O0 -g -W -Wall -Wno-unused-parameter -Iinclude
 LDFLAGS	?=
 LIBS	:= -lm
 GEN-IMAGE := gen-image
+MONOTONIC-TS := monotonic-ts
 
 %.o : %.c
 	$(CC) $(CFLAGS) -c -o $@ $<
 
-all: $(GEN-IMAGE)
+all: $(GEN-IMAGE) $(MONOTONIC-TS)
 
 $(GEN-IMAGE): gen-image.o
 	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
 
+$(MONOTONIC-TS): monotonic-ts.o
+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+
 clean:
 	-rm -f *.o
-	-rm -f $(GEN-IMAGE)
+	-rm -f $(GEN-IMAGE) $(MONOTONIC_TS)
 
 install:
 	cp $(GEN-IMAGE) $(INSTALL_DIR)/
+	cp $(MONOTONIC-TS) $(INSTALL_DIR)/
diff --git a/src/monotonic-ts.c b/src/monotonic-ts.c
new file mode 100644
index 000000000000..69a1809de1d1
--- /dev/null
+++ b/src/monotonic-ts.c
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2020 Kieran Bingham <kieran.bingham@ideasonboard.com> */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <time.h>
+
+int main(int argc, char ** argv)
+{
+	struct timespec tp;
+	char *line = NULL;
+	size_t size = 0;
+	const char *label = "";
+
+	if (argc > 1)
+		label = argv[1];
+
+	/*
+	 * Explicitly set line buffering on stdin to be sure it is delivered
+	 * in a timely fashion for our timestamping purposes when data is fed
+	 * through a pipe.
+	 */
+	setlinebuf(stdin);
+
+	do {
+		if (getline(&line, &size, stdin) <= 0)
+			break;
+
+		clock_gettime(CLOCK_MONOTONIC, &tp);
+		printf("[%ld.%.9ld]%s %s", tp.tv_sec, tp.tv_nsec, label, line);
+	} while (!feof(stdin));
+
+	free(line);
+
+	return 0;
+}
-- 
2.25.1

