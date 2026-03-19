Return-Path: <linux-renesas-soc+bounces-29881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLPMNpHXu2k4owIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:01:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB82C9E77
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F1B930374A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 11:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7612224AE0;
	Thu, 19 Mar 2026 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mbq0SY5U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0B13C5DD2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918040; cv=none; b=ZaSbY37hcam1hoo0rlTDDAs/tuzZQKk3QYQhsqDqDsJXWUDEHcBr58HbEbUesifLIXw2WX7VDwVmtVco07TRUyY5D9cb6WfLg1FDuRnw1SVH3eRHpJLMPzx265iy8ZNxw/VZ3HtIVz84wr/HMr2fllzTkAfrFWaict0hVZdLo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918040; c=relaxed/simple;
	bh=cGbDtwydlJZBcEqlFjz378ZiockJrW9wvEor5EyRyG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aaIw4vwa1D63SkMwzbpaXT6Lyn3W3aMehAybzO0GcVx5gv+x7EnR2GqHfyVU5lWl+jaf5WhceBTfZHOEaH5VKMxS12TeA27OTPQM/l7Hm2LMPNr7V7wvJsuWmWDyNNQWpWUkzzg1YgO4iqb0/pAsq+Kf89aErz7zqJz9QljDr0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mbq0SY5U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZQ5IlfCArlNYSNVvw0cWn0DqfDcbz6f67ibVvyNg+b0=; b=Mbq0SY
	5Uno1ei4rCyN213rlbTCj3LFC9wO1g1i09HMCMAZS9UZwLl2SbPjrDWfmQ7NtxRQ
	nShsRUTuxd8mVFRzDZktej+Jj+3Ov0iOaqB3A7TXVpzKpT9JGZCSp3D/CnW99HVR
	W2/oW2+wOxPCmY4uAF60q2WbF77CM/HyFMhxwHDIQpcdV/BGjXMNL0kKjv2pLyO6
	i7q1aK6dDW7eR+nkhMUDsJ9Myll7VYxKP/0kksHlpnPuS5RpgezPpro9JZWnz7ZF
	Ey/swtknAyi1VEZ2mBtXoHX8TTfDYkdNERXbVun2vYtuXB/N/fZ9eLfXmsQpQOxZ
	gEHmdM0Ntp7Yf1gg==
Received: (qmail 1099952 invoked from network); 19 Mar 2026 12:00:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 12:00:10 +0100
X-UD-Smtp-Session: l3s3148p1@C9bfeF5Nzq0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 13/15] hwspinlock: sort include and update copyright
Date: Thu, 19 Mar 2026 11:59:35 +0100
Message-ID: <20260319105947.6237-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29881-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,wizery.com:email]
X-Rspamd-Queue-Id: 58DB82C9E77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


