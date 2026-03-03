Return-Path: <linux-renesas-soc+bounces-28732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBsSJ444p2mofwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 20:37:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA21F6299
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 20:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB0AF31B280C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 19:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C7D397FA2;
	Tue,  3 Mar 2026 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A4hk2ueJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372F4F7983
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566322; cv=none; b=dvSyoGgwupvEbctjIkeZw0NsIodfOUyYghx7orWOyzbnA6VAsfsMdMkXfqZUSAiZwwcmplil14VYugSvAJwjteerf1pMMvXCYB8/ApBAY/RQfiT/Bgg6hSS7plKJ5oZ37YReN/D3loUFjyOT8GSpUya9LXqUR4Hs7my+zQy6WRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566322; c=relaxed/simple;
	bh=cGbDtwydlJZBcEqlFjz378ZiockJrW9wvEor5EyRyG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfnPM5Gfmvakl8bEBzC95ofpVhShPpCgBJFWJBeBqTp/wANILB30TBtmzxnRRHd9t8F9dUQXUWs4b/92Kn6lk970NzWabX4i9BIvwoigjDg8yM3pLPhZkcgg6WJQDzzCRrtdGpcyu1TmxkQXglye3+TIyfnF1KeNoDKkOUQ25no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A4hk2ueJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZQ5IlfCArlNYSNVvw0cWn0DqfDcbz6f67ibVvyNg+b0=; b=A4hk2u
	eJNs/5lrPPTqohOJOkFBK0Klr5nmh16C4bWwhqYA5Awmqn0+wmfI08B2GcK9RxiD
	Fzga4KgU3LsAZxaC7tY28EJ2jte7T0YUa5rSM6oaij34RrZ6URllRaMKLEqhwvbS
	OMtkWFbmKPB+3eaF6paVZmRkQQdYtsTdJ3PN3Gzu1Bu1SJAjdcAyUTwUSd9ibYuG
	VOMLsVDPR7d9Y724VuKimxIBw6Nw76aZdilkdIGi04FxTg5pOpQ+dTNLE7SiN5d2
	457pdW7deHGjHsrRMO8A4j3vDpusrSz8ODH68WlXp09ZKfqDw3poucni6jdUcf+C
	MW4Nc+MgCfp9wNLQ==
Received: (qmail 430756 invoked from network); 3 Mar 2026 20:31:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 20:31:39 +0100
X-UD-Smtp-Session: l3s3148p1@37udwCNMPqgujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 13/15] hwspinlock: sort include and update copyright
Date: Tue,  3 Mar 2026 20:26:05 +0100
Message-ID: <20260303192600.7224-30-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 46BA21F6299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28732-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wizery.com:email,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,ti.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

During the latest refactoring, unsorted includes were a bit annoying.
So, sort them to avoid this. Also, update the copyright due to said
refactorings and remove the contact field in favor of MAINTAINERS
entries.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 838bb2ab5eba..adf6fefb382f 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -3,26 +3,26 @@
  * Hardware spinlock framework
  *
  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
  */
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/spinlock.h>
-#include <linux/types.h>
 #include <linux/err.h>
-#include <linux/jiffies.h>
-#include <linux/radix-tree.h>
 #include <linux/hwspinlock.h>
-#include <linux/pm_runtime.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/radix-tree.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
 
 struct hwspinlock_device;
 
-- 
2.51.0


