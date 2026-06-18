Return-Path: <linux-renesas-soc+bounces-34207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V3JmC4UeNGoRPAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:36:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37A6A1A12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:36:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="UtH8YW /";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE89530BA765
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 16:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6F830C153;
	Thu, 18 Jun 2026 16:34:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321405A79B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 16:34:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800476; cv=none; b=ntvEgdWA2hC7cHbJ+7v7yu4B5WpqO2635vQM9u9K7PDxBoaUuz2eC6/PUf1R6WNhPypUbDI11MbItTF7QB39arua0tcOdlsFgrU015olxvhO6nkpsH65SuAvhkjThWo77fBVJGjRoKqWAOK15A2FZeUogiZkZ4oSqUuUnu0ALm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800476; c=relaxed/simple;
	bh=Sj3RfsSIO6qyKYUEzO7R0vceO+/XAC0MrwPun2AUTbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZzBy/7GRui8LavPQ9cmEkUHyI7R5rFsxlcpnGjE+TqlgkuCWiz+Jv0MHcrW0I056XZ+87yWUCtSXrY89ltyZwx9RgZJDOH247Ky07pO7GfT+yP8G6cTS49KgqvP5SSB+oHvJKLlGdIwCIr9sZ6QvzkadoLnKPTFDiO73Ty7F+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UtH8YW/r; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yWS8RuFjfXqBkEnMw2TrzWYgDNNfcz1UYfOGBL/vf8s=; b=UtH8YW
	/rvuYn7oACsv3g9sByyrrdx5mNxDdGL4Ddaoogbu2eU2W5pukpkyTyEq9dBn8906
	Rj1h9nLtYeMjgE0iJXtQ8qvKle7MK8nYyc2ulOXWJ9or4RQ7Yp0JT+Oh/sgQTILb
	vsPhGacYL9fPXjHs0aw9MXwPx9iDnrUHhGAzZyrYiMqwVww1IAaQ4N7otOQKjIpj
	MyUCNmMtxODyYJEyeQdr2hq4fSMWC3pX/xDo/UCU3Ggpz0EW3O/fFmjATnT/2QVY
	BFZgTVREYKxgQyDEzvN3xvOUjJKke0pBoICHqlh+wOqNiDB1gOpsh3g5llB8koq4
	7xiK3DxIYpqPLG4w==
Received: (qmail 638273 invoked from network); 18 Jun 2026 18:34:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2026 18:34:28 +0200
X-UD-Smtp-Session: l3s3148p1@pcX0v4lUTL8ujnsq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/2] hwspinlock: add summary in debugfs
Date: Thu, 18 Jun 2026 18:34:22 +0200
Message-ID: <20260618163422.17604-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
References: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:andersson@kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-remoteproc@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34207-lists,linux-renesas-soc=lfdr.de,renesas];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,wizery.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC37A6A1A12

Add a subsystem entry in debugfs and place a summary file there. It
informs about registered locks, if they are in use, and to which device
they belong. The state of the lock itself is usually not accessible
without modifying the state, so there is no plan to add support for
that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 80 ++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 7aa597a28eec..dbfedc47abc5 100644
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
 
@@ -888,5 +890,83 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+#ifdef CONFIG_DEBUG_FS
+struct hwspinlock_seq_iterator {
+	void __rcu **slot;
+	struct radix_tree_iter iter;
+};
+
+static void *hwspinlock_seq_start(struct seq_file *s, loff_t *ppos)
+{
+	struct hwspinlock_seq_iterator *hwsp_seq_iter = kzalloc(sizeof(*hwsp_seq_iter), GFP_KERNEL);
+
+	seq_puts(s, "id\tstatus\tdevice\n");
+
+	if (!hwsp_seq_iter)
+		return NULL;
+
+	mutex_lock(&hwspinlock_tree_lock);
+	radix_tree_iter_init(&hwsp_seq_iter->iter, *ppos);
+	hwsp_seq_iter->slot = radix_tree_next_chunk(&hwspinlock_tree, &hwsp_seq_iter->iter, 0);
+
+	return hwsp_seq_iter->slot ? hwsp_seq_iter : NULL;
+}
+
+static void *hwspinlock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
+{
+	struct hwspinlock_seq_iterator *hwsp_seq_iter = v;
+
+	++*ppos;
+
+	hwsp_seq_iter->slot = radix_tree_next_slot(hwsp_seq_iter->slot, &hwsp_seq_iter->iter, 0);
+	if (!hwsp_seq_iter->slot)
+		hwsp_seq_iter->slot = radix_tree_next_chunk(&hwspinlock_tree, &hwsp_seq_iter->iter, 0);
+
+	return hwsp_seq_iter->slot ? hwsp_seq_iter : NULL;
+}
+
+static void hwspinlock_seq_stop(struct seq_file *s, void *v)
+{
+	kfree(v);
+	mutex_unlock(&hwspinlock_tree_lock);
+}
+
+static int hwspinlock_seq_show(struct seq_file *s, void *v)
+{
+	struct hwspinlock_seq_iterator *hwsp_seq_iter = v;
+	unsigned long id = hwsp_seq_iter->iter.index;
+	struct hwspinlock *hwlock;
+	int used;
+
+	used = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_USED);
+	hwlock = radix_tree_deref_slot(hwsp_seq_iter->slot);
+	seq_printf(s, "%4lu:\t%s\t%s\n", id, used ? "in use" : "free", dev_name(hwlock->bank->dev));
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
+	debugfs_create_file("hwspinlock_summary", 0444, hwspinlock_debugfs, NULL, &hwspinlock_fops);
+	return 0;
+}
+subsys_initcall(hwspinlock_init);
+#endif	/* DEBUG_FS */
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
-- 
2.51.0


