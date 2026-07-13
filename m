Return-Path: <linux-renesas-soc+bounces-35109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z7nfIzPeVGpkgAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 14:46:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D393174B123
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 14:46:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="h+d0wN J";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D48DC300698E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 12:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B4C40C5D4;
	Mon, 13 Jul 2026 12:46:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26526371878
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 12:46:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946795; cv=none; b=o0ogKCvWzT69YsW56ILiqH4sJItml20NGx00Vxr1TwWKU5P4JYvqBAIPuyQk0YxXpsGm1aKkT92CsxFnHb6XFbZ9Vo60x/KfXr9CrGSMnA4FxvmxqClk5wuKz3COm0jTezfyZExNvL2U6IG+o4chaGlettYo2kalQrr9Mc/iVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946795; c=relaxed/simple;
	bh=Hv07QRhhVF1DwO+pIY2fQERR+gvrBOayIFFnmll4AeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTMUnqhIHY0YMWLuG+SFFb3OwfmaU08YNhW8w/hFV2Hcqbt2IH2gjIaSrMDMvKQOmkUorTsquHaP6CGJ3FnLT4Ndu1Vi7dO3Luft0IMMpI6Zaf/2PaA+Rg72gBNvNsgz81G6okYSVtQY0zPN4OuoDQ2nF3slV2BreeooqqWz9ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h+d0wNJT; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=86wLsPRtTRFHCf74+RL0VqB/6gvDzyqgEHtR+ImBwaQ=; b=h+d0wN
	JTNxP0r6c7PJXUHJWVWjyB4i+Ty7kzZjwAKPiPlI2IkKRgdhUFgUnL71E3jVY0n0
	C/hL9JJDM1kfMa+IFA6h6lcXUZETvgIvlCBjk47lP1kA+XP6CKPQ1TgR6jgPhUtn
	tcPd/Iq5aEYkc2f2GFcsKCH3zmnQu0Vly92icwYLUYRZGtFMCM7j4KrECn6XK8p8
	hkAds/HzCEbOX+cXMvL2kBUvrqddOnH0AuvCsTgRT5R+YMszwc490hofH8QbCbyJ
	6sCCs3kqtXa5oxvRUGFG0n7bUA76HTu9U9eqtUadVPWmba8C1V2CxRfi/vebwnlV
	Iv6UYhdMjJ+GI1nA==
Received: (qmail 2634281 invoked from network); 13 Jul 2026 14:46:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2026 14:46:25 +0200
X-UD-Smtp-Session: l3s3148p1@0/91en1WytEujntq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 2/2] hwspinlock: add list of mailboxes to debugfs
Date: Mon, 13 Jul 2026 14:46:22 +0200
Message-ID: <20260713124622.63181-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713124622.63181-1-wsa+renesas@sang-engineering.com>
References: <20260713124622.63181-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:willy@infradead.org,m:wsa+renesas@sang-engineering.com,m:andersson@kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-remoteproc@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35109-lists,linux-renesas-soc=lfdr.de,renesas];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:mid,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D393174B123

To help debugging, offer a list of registered hwspinlocks in debugfs. It
will also print the responsible hwspinlock_device and if the spinlock is
currently used. It does not show if the lock is taken because of
side-effects. Often, reading a lock means actually taking it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* totally rewritten because it traverses an XArray now instead of a
  radix tree

 drivers/hwspinlock/hwspinlock_core.c | 67 ++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 55a5fa6aa200..d5c6807631d3 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -21,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/seq_file.h>
 
 #include "hwspinlock_internal.h"
 
@@ -855,5 +857,70 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+#ifdef CONFIG_DEBUG_FS
+static void *hwspinlock_seq_start(struct seq_file *s, loff_t *ppos)
+{
+	unsigned long index = *ppos;
+	struct hwspinlock *hwlock;
+
+	rcu_read_lock();
+	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
+	*ppos = index;
+
+	return hwlock;
+}
+
+static void *hwspinlock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
+{
+	/* Increase ppos here to avoid endless loops. Don't use xa_find_after() */
+	unsigned long index = *ppos + 1;
+	struct hwspinlock *hwlock;
+
+	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
+	*ppos = index;
+
+	return hwlock;
+}
+
+static void hwspinlock_seq_stop(struct seq_file *s, void *v)
+{
+	rcu_read_unlock();
+}
+
+static int hwspinlock_seq_show(struct seq_file *s, void *v)
+{
+	struct hwspinlock *hwlock = v;
+	bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
+
+	seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",
+		   dev_name(hwlock->bank->dev));
+	return 0;
+}
+
+static const struct seq_operations hwspinlock_sops = {
+	.start = hwspinlock_seq_start,
+	.next = hwspinlock_seq_next,
+	.stop = hwspinlock_seq_stop,
+	.show = hwspinlock_seq_show,
+};
+DEFINE_SEQ_ATTRIBUTE(hwspinlock);
+
+/*
+ * subsys_initcall() is used here but controllers may already have been
+ * registered earlier or will be later. The rationale is that debugfs is
+ * accessed only late, i.e. from userspace. So, files created here must make no
+ * assumptions about initcall ordering.
+ */
+static int __init hwspinlock_init(void)
+{
+	struct dentry *hwspinlock_debugfs = debugfs_create_dir("hwspinlock", NULL);
+
+	debugfs_create_file("hwspinlock_summary", 0444, hwspinlock_debugfs,
+			    NULL, &hwspinlock_fops);
+	return 0;
+}
+subsys_initcall(hwspinlock_init);
+#endif	/* DEBUG_FS */
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
-- 
2.47.3


