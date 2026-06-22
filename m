Return-Path: <linux-renesas-soc+bounces-34310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oGroLmlAOWpNpQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:02:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 958256B0201
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:02:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=YG6XSx1B;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EE97303A99C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 14:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215B93B6359;
	Mon, 22 Jun 2026 13:59:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9D3BB12F;
	Mon, 22 Jun 2026 13:59:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136772; cv=none; b=XhlnNXKYM+WDwbIovAi5bERdAzLhHLRYCmEGHWFa30IRntUqK+oF0IlRZY646g4pukahLHTGlmKB8dPFl8/rDaMZW/cDmAzErAwIKuHcDLv9yNT69qQqZ8wsRnGaBOf9kn4B6XAR3drsWClsNNeybByUM579eCuldkh0FgpInYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136772; c=relaxed/simple;
	bh=FQE09fR0Ixu5Bl2Umm/99gcUwTCewvCEHOO3SMAKm+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSbuc4Gpvva7TZ46GDkYnbnwbLUVGGoFG3VOvUHTi3MKFIjnKiwvWwxE8Wmp1NEnESVUOfPhO26fNAWPw1aBYhNPBjONB+2vid/6WW+8z58DWBk4+Wsd0y9+Vgfb5K44a8wfRBiyLrA7NDIu9LhilRhmKYv3/A4cBle+WKbHw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YG6XSx1B; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=16eXztzjvZz9uTEFcy3hhq0oL9gQGsESCUoQ/xCycio=; b=YG6XSx1BLx6vyZ0VAj2ajDZ1Ti
	3BjGc0CKaz/I9U8nKkepT16/Hl/J9xaXxNJtDtnnJMS+gQ8lLL789ijeUd6DSRU+F9zMVBsAB8fcB
	7ejtybN9oEJaC5XlmNoxIfOMiZ/v7lErBiWzF8v2sTobEowoLICDVaNyJuyIImEW7z6WLlcf0v112
	Y/E4KThAi8Cd60R4bFGc4iPCu7dbk+YaJ3j+eRnmIhheN5WvfK1n45OHba+o5D/kt1I83f3OF7v09
	iegQKiVhktxtGNJQx6987WAY8m4h5XV3TCjr2QTFEEdGZNt1cOUah4Wz2wuBu8r5x+5DGgkOIp8Yk
	c1hvU8Og==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfBM-00000004LOh-080h;
	Mon, 22 Jun 2026 13:59:24 +0000
Date: Mon, 22 Jun 2026 14:59:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <ajk_u7TVT-kL8z2A@casper.infradead.org>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34310-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 958256B0201

On Mon, Jun 22, 2026 at 10:51:59AM +0200, Wolfram Sang wrote:
> Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
> R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
> multiple instances and, thus, multiple spinlock providers. The spinlocks
> are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
> development on these systems, it is helpful to have an overview of
> registered spinlocks in debugfs. This series adds support for that. The
> first two patches update the radix-tree header to support more lock
> types. The third patch fixes a missing RCU annotation for the slot
> pointer. The fourth patch finally adds the desired functionality.
> 
> Because the radix tree seems to have no dedicated tree nor maintainer, I
> suggest that all these patches go in via hwspinlock. This also keeps the
> dependencies zero.

The radix tree is deprecated.  I don't want to add any new functionality
to it.  Here's a replacement patch to convert hwspinlock to use an
XArray instead of a radix tree.  Compile tested only.

From 8ec88ed466e8153f546f7e8e69193cd5389488ee Mon Sep 17 00:00:00 2001
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Mon, 22 Jun 2026 09:38:30 -0400
Subject: [PATCH] hwspinlock: Convert to XArray

The radix tree is deprecated.  The XArray uses the same data structure
with a nicer interface.  The hwspinlock_tree_lock is not needed as the
spinlock built into the XArray is sufficient for all these cases.

hwspin_lock_register_single() used to always return 0.  Its caller
thinks it can return an errno, so I believe this to be a bug and so I
have restored its ability to return an error.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/hwspinlock/hwspinlock_core.c | 133 ++++++++++-----------------
 1 file changed, 50 insertions(+), 83 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..1dd68b8410dd 100644
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
-			continue;
-		if (radix_tree_deref_retry(hwlock)) {
-			slot = radix_tree_iter_retry(&iter);
+	xas_for_each(&xas, hwlock, ULONG_MAX) {
+		if (xas_retry(&xas, hwlock))
 			continue;
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
-	return 0;
+	return ret;
 }
 
 static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
 {
+	XA_STATE(xas, &hwspinlocks, id);
 	struct hwspinlock *hwlock = NULL;
-	int ret;
+	bool marked;
 
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
 
-	/* make sure the hwspinlock is not in use (tag is set) */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
+	/* make sure the hwspinlock is not in use (mark is set) */
+	marked = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
+	if (!marked) {
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
 
@@ -667,19 +643,20 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_register);
 
 /**
  * __hwspin_lock_request() - tag an hwspinlock as used and power it up
+ * @xas: XArray state
  * @hwlock: the target hwspinlock
  *
  * This is an internal function that prepares an hwspinlock instance
  * before it is given to the user. The function assumes that
- * hwspinlock_tree_lock is taken.
+ * the xarray lock is held.
  *
  * Returns: %0 or positive to indicate success, and a negative value to
  * indicate an error (with the appropriate error code)
  */
-static int __hwspin_lock_request(struct hwspinlock *hwlock)
+static int __hwspin_lock_request(struct xa_state *xas,
+		struct hwspinlock *hwlock)
 {
 	struct device *dev = hwlock->bank->dev;
-	struct hwspinlock *tmp;
 	int ret;
 
 	/* prevent underlying implementation from being removed */
@@ -697,16 +674,9 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 		return ret;
 	}
 
-	ret = 0;
+	xas_clear_mark(xas, HWSPINLOCK_UNUSED);
 
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
@@ -724,13 +694,14 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
  */
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 {
+	XA_STATE(xas, &hwspinlocks, id);
 	struct hwspinlock *hwlock;
 	int ret;
 
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
 
 	/* make sure this hwspinlock exists */
-	hwlock = radix_tree_lookup(&hwspinlock_tree, id);
+	hwlock = xas_load(&xas);
 	if (!hwlock) {
 		pr_warn("hwspinlock %u does not exist\n", id);
 		goto out;
@@ -740,7 +711,7 @@ struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 	WARN_ON(hwlock_to_id(hwlock) != id);
 
 	/* make sure this hwspinlock is unused */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
+	ret = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
 	if (ret == 0) {
 		pr_warn("hwspinlock %u is already in use\n", id);
 		hwlock = NULL;
@@ -748,12 +719,12 @@ struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 	}
 
 	/* mark as used and power up */
-	ret = __hwspin_lock_request(hwlock);
+	ret = __hwspin_lock_request(&xas, hwlock);
 	if (ret < 0)
 		hwlock = NULL;
 
 out:
-	mutex_unlock(&hwspinlock_tree_lock);
+	xas_unlock(&xas);
 	return hwlock;
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_request_specific);
@@ -772,8 +743,8 @@ EXPORT_SYMBOL_GPL(hwspin_lock_request_specific);
  */
 int hwspin_lock_free(struct hwspinlock *hwlock)
 {
+	XA_STATE(xas, &hwspinlocks, 0);
 	struct device *dev;
-	struct hwspinlock *tmp;
 	int ret;
 
 	if (!hwlock) {
@@ -782,11 +753,11 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	}
 
 	dev = hwlock->bank->dev;
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
+	xas_set(&xas, hwlock_to_id(hwlock));
 
 	/* make sure the hwspinlock is used */
-	ret = radix_tree_tag_get(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
+	ret = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
 	if (ret == 1) {
 		dev_err(dev, "%s: hwlock is already free\n", __func__);
 		dump_stack();
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


