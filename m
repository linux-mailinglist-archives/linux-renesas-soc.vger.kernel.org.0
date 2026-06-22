Return-Path: <linux-renesas-soc+bounces-34280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TuReLlf4OGookwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:54:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 613456ADF71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:54:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="lxuqKc m";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05E013048DFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 08:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF31C39479E;
	Mon, 22 Jun 2026 08:52:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC05392822
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118340; cv=none; b=Zxi1uKfyabnHq3MTmT5UEe47u/Cs6Ra63sMRy+updDtC93c9ois7UYetO/uwGugaqmF823mwaDU7OkIkVhhuy+BslXFToPyz6RPDH3HyfSYdXtJXBi07BcOyLC9xaD/ASse9TThRrTEdf8KOtQ2XB89j9OkqdO6KWp/gQti3P8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118340; c=relaxed/simple;
	bh=xKEdTEh6LuRAwqI1e6jOQFfbGCwYSh7t1j8ReNZRSQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEvNHF1yRAqMjg/Nrcws5PWH2Fw6dLNa/k9qLhYzoudldYujBM+AsPSda4FG5wpqRlywOl+gJVIPvuS/8CZFuEheSO90iF4RGX7D7ojOUeZr6V1cYwuTK5d96kK49HrT9rcPiirpKY7Sz1X5wFF5xk0bLTxluKAJAIR/QFFVKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lxuqKcm4; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3r1JsNWQPOwbbl0dLNXmqSlo1YhKZDJDei1uOqedRvc=; b=lxuqKc
	m4fS6NkjKrlZiH7B1jhS0X9BqTEMwXzZ8+OQvYX4mZc4OSBNgxMUq1kg6TiHtTCl
	xa5oZLaO7F1wYkAyIPhZLcXaaAUbhVAm/F5ZSUfaVPsb2VHQ2YsMfVevVEk3zahH
	xcvbgYXeXVYwS/HIrk2JT3QbhfB7gRNlfg7VJfjQRXDVw0DRI69xg+1fm7m5uBDF
	7ZaN6s+LrUiEssfi8T7eF64ndSFBSqclHxpWWix8G3uP2FLDHc3jWdpJwH4ptXki
	0WoSzAvWg5lFUoufI7Mzu8eqghOpEXFdTRUWDuJSxP/jCQu3xwoLHO61yG2h1sUB
	15xDOynUUm3BsTTw==
Received: (qmail 1894123 invoked from network); 22 Jun 2026 10:52:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:08 +0200
X-UD-Smtp-Session: l3s3148p1@s2/kwdNUBqUujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/4] radix-tree: allow more lock types with radix_tree_deref_slot_protected()
Date: Mon, 22 Jun 2026 10:52:01 +0200
Message-ID: <20260622085204.54248-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
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
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34280-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 613456ADF71

The 'treelock' parameter is type-checked to be of spinlock_t. The lock
to protect the tree might be something else, though. E.g. the hwspinlock
subsystem uses a mutex. 'treelock' is simply passed onto
lockdep_is_held() which supports way more lock types by using a #define
instead of an inline function. Use the same approach for
radix_tree_deref_slot_protected() to support more lock types, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/radix-tree.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/radix-tree.h b/include/linux/radix-tree.h
index b8997f07b2d4..a07e5a51eaf9 100644
--- a/include/linux/radix-tree.h
+++ b/include/linux/radix-tree.h
@@ -182,18 +182,16 @@ static inline void *radix_tree_deref_slot(void __rcu **slot)
 /**
  * radix_tree_deref_slot_protected - dereference a slot with tree lock held
  * @slot: slot pointer, returned by radix_tree_lookup_slot
- * @treelock: pointer to the spinlock protecting the tree
+ * @treelock: pointer to the lock protecting the tree. Any lock type supported
+ *            by lockdep_is_held() can be used
  *
  * Similar to radix_tree_deref_slot.  The caller does not hold the RCU read
  * lock but it must hold the tree lock to prevent parallel updates.
  *
  * Return: entry stored in that slot.
  */
-static inline void *radix_tree_deref_slot_protected(void __rcu **slot,
-							spinlock_t *treelock)
-{
-	return rcu_dereference_protected(*slot, lockdep_is_held(treelock));
-}
+#define radix_tree_deref_slot_protected(slot, treelock) \
+	rcu_dereference_protected(*(slot), lockdep_is_held(treelock))
 
 /**
  * radix_tree_deref_retry	- check radix_tree_deref_slot
-- 
2.47.3


