Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E65A26CD87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 23:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgIPVAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 17:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgIPQaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 12:30:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0ADC00217D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 07:45:15 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D876426B;
        Wed, 16 Sep 2020 16:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600267446;
        bh=vqpEThUN815HEH+3aLWRHIezd8cwcQPFVZJ1JB5ol3k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cyEa0EERzK7jTN3/LryXkFHi0vYRckamY4HtrbJdcnMuHwwS5QJmGr8rFMJ+EgTa1
         ftQQ8lU4G1lZCg2ByUqnMMODrru2XONUWmlTqA79dt1+LXFgAybe1Ux9gyMiRF3kcX
         8bUHeUIScAvFd09n5BsXt129ULM41tRyOQ1SvL+I=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 2/3] src: monotonic-ts: Monotonic timestamp logging
Date:   Wed, 16 Sep 2020 15:43:01 +0100
Message-Id: <20200916144302.1483470-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
References: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Introduce a new utility which prefixes a monotonic timestamp rendered in the
same format as the kernel logs to all lines fed in through stdin.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 src/Makefile       | 10 +++++++---
 src/monotonic-ts.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 src/monotonic-ts.c

diff --git a/src/Makefile b/src/Makefile
index d7f901f58be6..67216e81ffc4 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -7,18 +7,22 @@ CFLAGS	?= -O0 -g -W -Wall -Wno-unused-parameter -Iinclude
 LDFLAGS	?=
 LIBS	:= -lm
 GEN-IMAGE := gen-image
+MONOTONIC_TS := monotonic-ts
 
 %.o : %.c
 	$(CC) $(CFLAGS) -c -o $@ $<
 
-all: $(GEN-IMAGE)
+all: $(GEN-IMAGE) $(MONOTONIC_TS)
 
 $(GEN-IMAGE): gen-image.o
 	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
 
+$(MONOTONIC_TS): monotonic-ts.o
+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+
 clean:
 	-rm -f *.o
-	-rm -f $(GEN-IMAGE)
+	-rm -f $(GEN-IMAGE) $(MONOTONIC_TS)
 
 install:
-	cp $(GEN-IMAGE) $(INSTALL_DIR)/
+	cp $(GEN-IMAGE) $(MONOTONIC_TS) $(INSTALL_DIR)/
diff --git a/src/monotonic-ts.c b/src/monotonic-ts.c
new file mode 100644
index 000000000000..fcb671e06d27
--- /dev/null
+++ b/src/monotonic-ts.c
@@ -0,0 +1,37 @@
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
+
-- 
2.25.1

