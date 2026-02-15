Return-Path: <linux-renesas-soc+bounces-28215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBDsK+lOkmlvswEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:55:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB713FF7A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8BAE3015463
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 22:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F405730BF5C;
	Sun, 15 Feb 2026 22:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MqcRvYoA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428CE30AD0B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196121; cv=none; b=Nwpe8p2A/Ea6sbe3zPZtw+H/CA4BqoCkDsOMZKx0Knh/k1AVp517pCeSxGSZGNSmC9ssMjr74rIm60wY0rFhnIjzEREemuz9NRlLSavz4QcJelOmuAruO+5Vx94hcD15eNS70XsYrj8FD17XvI3cHHR7EfqemZmgXCBuYidYg+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196121; c=relaxed/simple;
	bh=drJuZ8cYmbODEVJ0BD+lFN3VV7+akK+3fi5EoV0UbZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAHUwPZYW1KvRFobv5WApeFlOjEg/8xDq99SmkUj9O1fOHOvrDKBgGxP0HSlOXdIbZQnAlrxTef7dU0VibEoXkKyNS8CzS0YD4t64uyVYaDWaxioH9EpMURIZ+abDheVpqFxZdoo1vbYe7SGAtlK5JKd0dda8IexlWgnzWxBbps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MqcRvYoA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jn0mkrbIShFcsJPVeHZ53xi/cLQEfalMOWyFCxoe5g4=; b=MqcRvY
	oAN9UOzrOLnVKCXcYju/pdXdbAADVxdegs0B07XxLnMydhx/LWnWye7J2+MVjwUl
	YhnKXZHyHLHJkJ/S0BmTAMB5I/Sb+dondZrBdUjBioMrqWcFRAad63Rd0lHdtSTW
	NRLT4LFrfL3B7jBGr5emTNxcy9aJ37ngjS14k7mmAkxJUtPFv5tHl3nJB6hoh/Ap
	0DUqiBjJmTRI/WHSyiyk1e06miR7FQCDkBYkNF+jovDgzyVIRBovU3HxZ4AjuYhV
	CL7pSImG+2/CMJx+sj2T8rHcTq+EtRdJV/mPcd1yI4rbS5ropdIAWMaV95yJqZN9
	Stt04dNQvzylfrTQ==
Received: (qmail 3011365 invoked from network); 15 Feb 2026 23:55:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:07 +0100
X-UD-Smtp-Session: l3s3148p1@o3/FuuRKbIQujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private data of a hwspinlock
Date: Sun, 15 Feb 2026 23:54:42 +0100
Message-ID: <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28215-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 5BBB713FF7A
X-Rspamd-Action: no action

To hide internal core structures from providers, a callback is added to
the ops which allows to set the 'priv' field of a hwspinlock. It is
called when a hwspinlock device is registered and, thus, iterated over
all locks. The register-functions are also extended to pass a data
pointer to this callback, so it can do necessary calculations for the
priv field of each hwspinlock. Providers are converted separately
because these changes need dedicated reviews.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c     | 19 +++++++++++++++----
 drivers/hwspinlock/hwspinlock_internal.h | 19 +++++++++++--------
 include/linux/hwspinlock.h               |  4 ++--
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 2c9eceba7fe8..afe1e7ce2829 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -507,6 +507,7 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -516,10 +517,11 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * Returns: %0 on success, or an appropriate error code on failure
  */
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks)
+		const struct hwspinlock_ops *ops, int base_id, int num_locks,
+		void *init_data)
 {
 	struct hwspinlock *hwlock;
-	int ret = 0, i;
+	int ret, i;
 
 	if (!bank || !ops || !dev || !num_locks || !ops->trylock ||
 							!ops->unlock) {
@@ -538,6 +540,14 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		spin_lock_init(&hwlock->lock);
 		hwlock->bank = bank;
 
+		if (ops->init_priv) {
+			hwlock->priv = ops->init_priv(i, init_data);
+			if (IS_ERR(hwlock->priv)) {
+				ret = PTR_ERR(hwlock->priv);
+				goto reg_failed;
+			}
+		}
+
 		ret = hwspin_lock_register_single(hwlock, base_id + i);
 		if (ret)
 			goto reg_failed;
@@ -633,6 +643,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -644,7 +655,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks)
+			      int base_id, int num_locks, void *init_data)
 {
 	struct hwspinlock_device **ptr;
 	int ret;
@@ -653,7 +664,7 @@ int devm_hwspin_lock_register(struct device *dev,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks);
+	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks, init_data);
 	if (!ret) {
 		*ptr = bank;
 		devres_add(dev, ptr);
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index f298fc0ee5ad..3c835d96bf86 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -18,20 +18,23 @@ struct hwspinlock_device;
 /**
  * struct hwspinlock_ops - platform-specific hwspinlock handlers
  *
- * @trylock: make a single attempt to take the lock. returns 0 on
- *	     failure and true on success. may _not_ sleep.
- * @unlock:  release the lock. always succeed. may _not_ sleep.
- * @bust:    optional, platform-specific bust handler, called by hwspinlock
- *	     core to bust a specific lock.
- * @relax:   optional, platform-specific relax handler, called by hwspinlock
- *	     core while spinning on a lock, between two successive
- *	     invocations of @trylock. may _not_ sleep.
+ * @trylock:	make a single attempt to take the lock. returns 0 on
+ *		failure and true on success. may _not_ sleep.
+ * @unlock:	release the lock. always succeed. may _not_ sleep.
+ * @bust:	optional, platform-specific bust handler, called by hwspinlock
+ *		core to bust a specific lock.
+ * @relax:	optional, platform-specific relax handler, called by hwspinlock
+ *		core while spinning on a lock, between two successive
+ *		invocations of @trylock. may _not_ sleep.
+ * @init_priv:	optional, callback used when registering the hwspinlock device.
+ *		Its return value will be used to fill the per-lock 'priv' data.
  */
 struct hwspinlock_ops {
 	int (*trylock)(struct hwspinlock *lock);
 	void (*unlock)(struct hwspinlock *lock);
 	int (*bust)(struct hwspinlock *lock, unsigned int id);
 	void (*relax)(struct hwspinlock *lock);
+	void *(*init_priv)(int local_id, void *init_data);
 };
 
 /**
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index dffa1dff7289..094a6d0d39d6 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -30,7 +30,7 @@ struct hwspinlock_ops;
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks);
+		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
@@ -49,7 +49,7 @@ int devm_hwspin_lock_unregister(struct device *dev,
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks);
+			      int base_id, int num_locks, void *init_data);
 
 #else /* !CONFIG_HWSPINLOCK */
 
-- 
2.51.0


