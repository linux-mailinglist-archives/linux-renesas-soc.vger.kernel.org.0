Return-Path: <linux-renesas-soc+bounces-34278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id evZDK074OGolkwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:54:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDDC6ADF66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:54:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="WNYuxs E";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87EAE30479F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 08:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2A5394499;
	Mon, 22 Jun 2026 08:52:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E683932DC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118340; cv=none; b=W+LL1im3ziMQhnI6fXXc2150lwp3VZ/or12utRiE1zL3ROb7AErZOLYVsqgqKTM+6fMXWEcqPqFeawc1M5ZotC89rbtfOkSfjwVRNRjBzTiVLBXiR3Z+RgTPJ1O+QPSGV+njF2ABStqCWbwuwaHMNbfifhYYNcUeuOHHsGgR4ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118340; c=relaxed/simple;
	bh=eW5CEjp5oPCLohwGPhaXYx2BqS8El6bS1qdPHFb+TfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRdVtzn7oXjkUyg6kZvJqEnpgyVVou2ycjJsr27Qh4zoHI6EvGQ+sR/UiTr8p3pIBhpkw14p2WgTa176dMatZ8Fxe6Wdme4wv4fb0cc3md/ZaFEFkPADkuihb6f+CodJfOhCu2n6NS7iZbvYybsnvguN0qVE52fj/qnLEkx/Hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WNYuxsEF; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=5jyOYvvpYirIPQNjSrR9lQ6VjRePGmcGcXwKDCTXjrg=; b=WNYuxs
	EFrfWP2NjYb9M69i9gZo7UOqgqfGX8oxp9sfL6zPcj8F+eFna8B6yX86yAG/oxEu
	qjDaP4xUUs6RjsL908FmwQ2nmJJI//kFgrHu2P3eXbBBNYj2rktTukZQyw38xzp1
	8ACHwz1hs2faMN4Jsimt+o6WmNJCyanYADFVT875qqmdSfz1UATPrWa1FqwJanpc
	PT3uRWGsrN+PlBHTJmBU8FvUceKGWMl72LAsOHSBpFBWZdOcrsmjugrLCIcCnYvg
	xsP2sVVg61IFV9pvu+FkAle6mrzQQ5IfqiECFzjkkfPgkhT29kmUI0AUEz9/W0fN
	+b0/16kbA/kUwSbg==
Received: (qmail 1894161 invoked from network); 22 Jun 2026 10:52:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:08 +0200
X-UD-Smtp-Session: l3s3148p1@zR7uwdNUFKUujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [PATCH v2 3/4] hwspinlock: annotate slot pointer as RCU sensitive
Date: Mon, 22 Jun 2026 10:52:02 +0200
Message-ID: <20260622085204.54248-4-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34278-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:baolin.wang@linux.alibaba.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FDDC6ADF66

Because 'slot' is used within an RCU read-lock, it must not be accessed
directly but with RCU helpers. Annotate the pointer to enforce checking
this. Sparse confirms the missing annotation:

drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:393:48: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:393:48:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:393:48:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:397:30:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a509b73da190..c97d68050102 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -372,7 +372,7 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	struct of_phandle_args args;
 	struct hwspinlock *hwlock;
 	struct radix_tree_iter iter;
-	void **slot;
+	void __rcu **slot;
 	int id;
 	int ret;
 
-- 
2.47.3


