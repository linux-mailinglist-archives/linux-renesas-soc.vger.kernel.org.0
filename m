Return-Path: <linux-renesas-soc+bounces-32113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cExLNIrs+mkZUQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 09:23:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302D4D72AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 09:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A64F301A734
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 07:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D4037418F;
	Wed,  6 May 2026 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WzNnBmcY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7A368271
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778052037; cv=none; b=j45QbxHPkLtpnH7VG/hAbRUQ9DsYgLcFFrwUoMsurx+L6NBSG10aJgGQD2J/XzBMij8sIbWFrAJKW8dNxhGH7noSvbS8CJYwB60c/npt7YSA6wYep2V7EDB8TPU/ebAaKuDsmKqeLVk5Ob9zgCJ5SDvSiA61HbqdAx1pmVL9r/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778052037; c=relaxed/simple;
	bh=DQ8l+LhXfMiI0/8/s4jrgxM9hhNcUgGoh3wrwwBlO1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fcKDwVHU/xh2PEAt5GA8eMPyrp7lMRq12rhVHAiadAV/cZDhdDfxaM1uEHRPoaXpgLrG45QKOlDwBDUtVvaut28wL+Zb5jUVcZTfiUQ2KO4aWMpP3+Oj5PvhbFpajhJcHXhvFMuVt6xxVneKsbM0cCNUZSrFOhW+80Z3aNeSoh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WzNnBmcY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3oLvX8H0JfjMnE
	asSxxrTvaptE77qSSWzUL4EZLI0U0=; b=WzNnBmcY1Zt0SDo0UvEHOz1bW4WroW
	liwrviQn3ePoPxT+J/LoVwWkD4CkngWqcFEAKVVo7u0MAfloAp1xZC/uli58orJH
	9wgaChla5f6j+M1TP7WbU3hoHnOJ0fMD4EDFE6zqN46gtAspESs1HmorEKrKDPRQ
	I6iFh+S/T2nqGuAs7jXAiW32z0WcRiUBLNAH1Rx43m5dkiNQRqmay4XJWE0VBF+i
	1jc77tnH9RfMOsB+oEii/D86wLCzRPNVzLlAlgR12ffQogDpuYHS3HJKd23Dyujm
	2PqEGzbNsSJB91p1tquiMnaLSdNjAsnbgUdDybaxFy+J/Uk8w7vbblvA==
Received: (qmail 583450 invoked from network); 6 May 2026 09:20:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2026 09:20:32 +0200
X-UD-Smtp-Session: l3s3148p1@XavD/yBRMMoujnsj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v5] mailbox: add list of used channels to debugfs
Date: Wed,  6 May 2026 09:16:06 +0200
Message-ID: <20260506072030.4288-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3302D4D72AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32113-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email,sang-engineering.com:dkim,sang-engineering.com:mid]

During development, it is useful to see which mailboxes are currently
obtained. Use a seq-file in debugfs to list the currently registered
controllers and their used channels. Example output from a Renesas R-Car
X5H based system:

 # cat /sys/kernel/debug/mailbox/mailbox_summary

189e0000.system-controller:
   0: c1000000.mailbox_test_send_to_recv
   1: c1000100.mailbox_test_recv_to_send
 128: c1000100.mailbox_test_recv_to_send
 129: c1000000.mailbox_test_send_to_recv
189e1000.system-controller:
   4: scmi_dev.1
   5: scmi_dev.2

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch was created on top of "[PATCH v3] mailbox: don't free the
channel if the startup callback failed". It is no dependency, though.
The patch applies without it with just some line offsets.

Changes since v4:
* improved comment to explain the initcall situation
* rebased to v7.1-rc2

 drivers/mailbox/mailbox.c | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 006ea5a5c320..3716b8ccbe7f 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -16,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
 static LIST_HEAD(mbox_cons);
@@ -636,3 +638,66 @@ int devm_mbox_controller_register(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(devm_mbox_controller_register);
+
+#ifdef CONFIG_DEBUG_FS
+static void *mbox_seq_start(struct seq_file *s, loff_t *pos)
+{
+	mutex_lock(&con_mutex);
+	return seq_list_start(&mbox_cons, *pos);
+}
+
+static void *mbox_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	return seq_list_next(v, &mbox_cons, pos);
+}
+
+static void mbox_seq_stop(struct seq_file *s, void *v)
+{
+	mutex_unlock(&con_mutex);
+}
+
+static int mbox_seq_show(struct seq_file *seq, void *v)
+{
+	const struct mbox_controller *mbox = list_entry(v, struct mbox_controller, node);
+
+	seq_printf(seq, "%s:\n", dev_name(mbox->dev));
+
+	for (unsigned int i = 0; i < mbox->num_chans; i++) {
+		struct mbox_chan *chan = &mbox->chans[i];
+
+		scoped_guard(spinlock_irqsave, &chan->lock) {
+			if (chan->cl) {
+				struct device *cl_dev = chan->cl->dev;
+
+				seq_printf(seq, " %3u: %s\n", i,
+					   cl_dev ? dev_name(cl_dev) : "NULL device");
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct seq_operations mbox_sops = {
+	.start = mbox_seq_start,
+	.next = mbox_seq_next,
+	.stop = mbox_seq_stop,
+	.show = mbox_seq_show,
+};
+DEFINE_SEQ_ATTRIBUTE(mbox);
+
+/*
+ * subsys_initcall() is used here but controllers may already have been
+ * registered earlier or will be later. The rationale is that debugfs is
+ * accessed only late, i.e. from userspace. So, files created here must make no
+ * assumptions about initcall ordering.
+ */
+static int __init mbox_init(void)
+{
+	struct dentry *mbox_debugfs = debugfs_create_dir("mailbox", NULL);
+
+	debugfs_create_file("mailbox_summary", 0444, mbox_debugfs, NULL, &mbox_fops);
+	return 0;
+}
+subsys_initcall(mbox_init);
+#endif	/* DEBUG_FS */
-- 
2.51.0


