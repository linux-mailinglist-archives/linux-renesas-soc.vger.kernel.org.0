Return-Path: <linux-renesas-soc+bounces-35108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rkUEBC7eVGpggAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 14:46:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D574B10E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 14:46:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="LQOG/I 7";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A4BE3014768
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 12:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7AE40E8CA;
	Mon, 13 Jul 2026 12:46:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2013140D565
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 12:46:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946793; cv=none; b=YopdUC+n5+//L48KFshgWwHK14UUrcCrtDTlW8YZqQas+Rq4T6VDqpI0eULPJkXw9WYVN4BUEQnbasbJ+XT8qalO8QMy2/5K3qijEpoAMCgl1k6gTrZJJafaAXpb4rXz0XEw7qu0VvwUQqdC35tt7OYlVdpM2aPjTglK5KY0TYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946793; c=relaxed/simple;
	bh=kEbDPvoHKnFDTuqTaT46cgO2aDo5X9pVHfk/8M/6Etc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmGBwIJgWsSIu5QSiVrF7QxEReflz/G7LO2iDHIjGVMwQ2dzBIuSGG+d9Yc2nZNX73EQjUOizlFMS/ZCwf8/rzfeFdAzhCdtLSqChm7/8NrBxGA8OxZe/fFTQtm/yqcoh65LCUeQ7ZwZuxx7w1LVTibtksNxBd6W0H8tkvG/M/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LQOG/I7j; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=o65EcM74tOFLf0K+/X+NB6PpeOb0FlYiaWvFz58Om3g=; b=LQOG/I
	7juXDvwBMaYSmXvW2z0dpnMqjd8LdYXqsXRvPT3QntqBHPc4vaaVgwxArpHIXlfH
	iEEsxqLOJ66UYGtjBzHtgEnYdbempp9atLvcMmZ3Z9i3gDmcsFBqOjZh3j2u+qps
	ewgm5cDOA2ug3BXYaHo68Kvo0XGt4cOnG4sJXDwMma898GBaV9TYYw3/kJ+RZgCj
	OCrkCjwMdJtHwgn2heOd7V2iEFBMsG+JpCHlRUx6Nb6HMV7mAsfEfO5WKjs+Hv8t
	c7vtVEnBnqWySFIDY0Yra6l5cV3RmN2tP2cjt0x0wqH2oM9xGWfeK2GFJ0BRuj2R
	9eGfuqJbi8SzyUjw==
Received: (qmail 2634241 invoked from network); 13 Jul 2026 14:46:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2026 14:46:25 +0200
X-UD-Smtp-Session: l3s3148p1@Z71ren1WyNEujntq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 1/2] hwspinlock: Convert to XArray
Date: Mon, 13 Jul 2026 14:46:21 +0200
Message-ID: <20260713124622.63181-2-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-35108-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infradead.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:from_mime,sang-engineering.com:mid,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A40D574B10E

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

The radix tree is deprecated.  The XArray uses the same data structure
with a nicer interface.  The hwspinlock_tree_lock is not needed as the
spinlock built into the XArray is sufficient for all these cases after
we split a larger critical section in hwspin_lock_request_specific()
into two smaller ones.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Co-developed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since original implementation as a response to my v2:
* remove fix in hwspin_lock_register_single() which has been applied as
  a separate patch[1] meanwhile
* split the long critical section in hwspin_lock_request_specific() into
  two smaller ones suitable for a spinlock
* rename __hwspin_lock_request to hwspinlock_prepare and update docs
* handle return value of xas_get_mark() as bool not as int

[1] https://lore.kernel.org/r/178370682988.2572738.9921265128936208294.b4-ty@kernel.org

 drivers/hwspinlock/hwspinlock_core.c | 153 +++++++++++----------------
 1 file changed, 60 insertions(+), 93 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a509b73da190..55a5fa6aa200 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -16,7 +16,7 @@
 #include <linux/types.h>
 #include <linux/err.h>
 #include <linux/jiffies.h>
-#include <linux/radix-tree.h>
+#include <linux/xarray.h>
 #include <linux/hwspinlock.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
@@ -27,34 +27,21 @@
 /* retry delay used in atomic context */
 #define HWSPINLOCK_RETRY_DELAY_US	100
 
-/* radix tree tags */
-#define HWSPINLOCK_UNUSED	(0) /* tags an hwspinlock as unused */
+/* XArray search mark */
+#define HWSPINLOCK_UNUSED	XA_MARK_0 /* marks a hwspinlock as unused */
 
 /*
- * A radix tree is used to maintain the available hwspinlock instances.
+ * An XArray is used to maintain the available hwspinlock instances.
  * The tree associates hwspinlock pointers with their integer key id,
  * and provides easy-to-use API which makes the hwspinlock core code simple
  * and easy to read.
  *
- * Radix trees are quick on lookups, and reasonably efficient in terms of
+ * XArrays are quick on lookups, and reasonably efficient in terms of
  * storage, especially with high density usages such as this framework
  * requires (a continuous range of integer keys, beginning with zero, is
- * used as the ID's of the hwspinlock instances).
- *
- * The radix tree API supports tagging items in the tree, which this
- * framework uses to mark unused hwspinlock instances (see the
- * HWSPINLOCK_UNUSED tag above). As a result, the process of querying the
- * tree, looking for an unused hwspinlock instance, is now reduced to a
- * single radix tree API call.
- */
-static RADIX_TREE(hwspinlock_tree, GFP_KERNEL);
-
-/*
- * Synchronization of access to the tree is achieved using this mutex,
- * as the radix-tree API requires that users provide all synchronisation.
- * A mutex is needed because we're using non-atomic radix tree allocations.
+ * used as the ID of the hwspinlock instances).
  */
-static DEFINE_MUTEX(hwspinlock_tree_lock);
+static DEFINE_XARRAY(hwspinlocks);
 
 
 /**
@@ -369,10 +356,9 @@ of_hwspin_lock_simple_xlate(const struct of_phandle_args *hwlock_spec)
  */
 int of_hwspin_lock_get_id(struct device_node *np, int index)
 {
+	XA_STATE(xas, &hwspinlocks, 0);
 	struct of_phandle_args args;
 	struct hwspinlock *hwlock;
-	struct radix_tree_iter iter;
-	void **slot;
 	int id;
 	int ret;
 
@@ -389,15 +375,9 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	/* Find the hwspinlock device: we need its base_id */
 	ret = -EPROBE_DEFER;
 	rcu_read_lock();
-	radix_tree_for_each_slot(slot, &hwspinlock_tree, &iter, 0) {
-		hwlock = radix_tree_deref_slot(slot);
-		if (unlikely(!hwlock))
+	xas_for_each(&xas, hwlock, ULONG_MAX) {
+		if (xas_retry(&xas, hwlock))
 			continue;
-		if (radix_tree_deref_retry(hwlock)) {
-			slot = radix_tree_iter_retry(&iter);
-			continue;
-		}
-
 		if (device_match_of_node(hwlock->bank->dev, args.np)) {
 			ret = 0;
 			break;
@@ -452,51 +432,47 @@ EXPORT_SYMBOL_GPL(of_hwspin_lock_get_id_byname);
 
 static int hwspin_lock_register_single(struct hwspinlock *hwlock, int id)
 {
-	struct hwspinlock *tmp;
+	XA_STATE(xas, &hwspinlocks, id);
+	struct hwspinlock *existing;
 	int ret;
 
-	mutex_lock(&hwspinlock_tree_lock);
-
-	ret = radix_tree_insert(&hwspinlock_tree, id, hwlock);
-	if (ret) {
-		if (ret == -EEXIST)
-			pr_err("hwspinlock id %d already exists!\n", id);
-		goto out;
+	xas_lock(&xas);
+	existing = xas_load(&xas);
+	if (existing) {
+		pr_err("hwspinlock id %d already exists!\n", id);
+		xas_set_err(&xas, -EBUSY);
 	}
+	xas_store(&xas, hwlock);
 
 	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
+	xas_set_mark(&xas, HWSPINLOCK_UNUSED);
+	ret = xas_error(&xas);
+	xas_unlock(&xas);
 
-	/* self-sanity check which should never fail */
-	WARN_ON(tmp != hwlock);
-
-out:
-	mutex_unlock(&hwspinlock_tree_lock);
 	return ret;
 }
 
 static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
 {
+	XA_STATE(xas, &hwspinlocks, id);
 	struct hwspinlock *hwlock = NULL;
-	int ret;
+	bool unused;
 
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
 
-	/* make sure the hwspinlock is not in use (tag is set) */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
+	/* make sure the hwspinlock is not in use (mark is set) */
+	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
+	if (!unused) {
 		pr_err("hwspinlock %d still in use (or not present)\n", id);
 		goto out;
 	}
 
-	hwlock = radix_tree_delete(&hwspinlock_tree, id);
-	if (!hwlock) {
-		pr_err("failed to delete hwspinlock %d\n", id);
-		goto out;
-	}
+	hwlock = xas_store(&xas, NULL);
+	if (!hwlock)
+		pr_err("hwspinlock %d already deleted\n", id);
 
 out:
-	mutex_unlock(&hwspinlock_tree_lock);
+	xas_unlock(&xas);
 	return hwlock;
 }
 
@@ -666,20 +642,18 @@ int devm_hwspin_lock_register(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_register);
 
 /**
- * __hwspin_lock_request() - tag an hwspinlock as used and power it up
+ * hwspinlock_prepare() - prepare a hwspinlock
  * @hwlock: the target hwspinlock
  *
  * This is an internal function that prepares an hwspinlock instance
- * before it is given to the user. The function assumes that
- * hwspinlock_tree_lock is taken.
+ * before it is given to the user.
  *
  * Returns: %0 or positive to indicate success, and a negative value to
  * indicate an error (with the appropriate error code)
  */
-static int __hwspin_lock_request(struct hwspinlock *hwlock)
+static int hwspinlock_prepare(struct hwspinlock *hwlock)
 {
 	struct device *dev = hwlock->bank->dev;
-	struct hwspinlock *tmp;
 	int ret;
 
 	/* prevent underlying implementation from being removed */
@@ -697,16 +671,7 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 		return ret;
 	}
 
-	ret = 0;
-
-	/* mark hwspinlock as used, should not fail */
-	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
-
-	/* self-sanity check that should never fail */
-	WARN_ON(tmp != hwlock);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -724,13 +689,14 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
  */
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 {
+	XA_STATE(xas, &hwspinlocks, id);
 	struct hwspinlock *hwlock;
+	bool unused;
 	int ret;
 
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
 
-	/* make sure this hwspinlock exists */
-	hwlock = radix_tree_lookup(&hwspinlock_tree, id);
+	hwlock = xas_load(&xas);
 	if (!hwlock) {
 		pr_warn("hwspinlock %u does not exist\n", id);
 		goto out;
@@ -739,21 +705,25 @@ struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 	/* sanity check (this shouldn't happen) */
 	WARN_ON(hwlock_to_id(hwlock) != id);
 
-	/* make sure this hwspinlock is unused */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
+	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
+	if (!unused) {
 		pr_warn("hwspinlock %u is already in use\n", id);
 		hwlock = NULL;
 		goto out;
 	}
 
-	/* mark as used and power up */
-	ret = __hwspin_lock_request(hwlock);
-	if (ret < 0)
-		hwlock = NULL;
+	xas_clear_mark(&xas, HWSPINLOCK_UNUSED);
+	xas_unlock(&xas);
+
+	ret = hwspinlock_prepare(hwlock);
 
+	xas_lock(&xas);
+	if (ret < 0) {
+		hwlock = NULL;
+		xas_set_mark(&xas, HWSPINLOCK_UNUSED);
+	}
 out:
-	mutex_unlock(&hwspinlock_tree_lock);
+	xas_unlock(&xas);
 	return hwlock;
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_request_specific);
@@ -772,9 +742,10 @@ EXPORT_SYMBOL_GPL(hwspin_lock_request_specific);
  */
 int hwspin_lock_free(struct hwspinlock *hwlock)
 {
+	XA_STATE(xas, &hwspinlocks, 0);
 	struct device *dev;
-	struct hwspinlock *tmp;
-	int ret;
+	bool unused;
+	int ret = 0;
 
 	if (!hwlock) {
 		pr_err("invalid hwlock\n");
@@ -782,12 +753,12 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	}
 
 	dev = hwlock->bank->dev;
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
+	xas_set(&xas, hwlock_to_id(hwlock));
 
 	/* make sure the hwspinlock is used */
-	ret = radix_tree_tag_get(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
-	if (ret == 1) {
+	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
+	if (unused) {
 		dev_err(dev, "%s: hwlock is already free\n", __func__);
 		dump_stack();
 		ret = -EINVAL;
@@ -798,16 +769,12 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	pm_runtime_put(dev);
 
 	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
-
-	/* sanity check (this shouldn't happen) */
-	WARN_ON(tmp != hwlock);
+	xas_set_mark(&xas, HWSPINLOCK_UNUSED);
 
 	module_put(dev->driver->owner);
 
 out:
-	mutex_unlock(&hwspinlock_tree_lock);
+	xas_unlock(&xas);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_free);
-- 
2.47.3


