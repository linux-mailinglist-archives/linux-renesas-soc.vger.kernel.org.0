Return-Path: <linux-renesas-soc+bounces-34281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 48eGE8j3OGoBkwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:52:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA06ADEEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:52:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="JgVr5Q N";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC19C3002893
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 08:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EB0394EAD;
	Mon, 22 Jun 2026 08:52:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF33932D0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118340; cv=none; b=NpYjb140dB5wCUJz1Sm3egYf4XFLRYgkAIi54IvO6W3hT/jYarejtUtUupDlGxtCB8+00bq505E24nqUnC66XMWCswIfUA3hFOy4nY5CXLV/8X2jtEadqge6LJgPTu6/FcGhdcuWgBG3Xc0bRnhjlGSirNqF3+ZEXA9ao3mlh6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118340; c=relaxed/simple;
	bh=RTyOZtIdeTSaFUwES659M9ai524WA/VsNh+Qed4szk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZEmQpP8MtL7MWsLUsEhFNHl0+2Bpy3RI4UgLQY7HCFuAwIY3geOGE5e/+FJhBw9yN8FT2hA+BT9SXACv+YYcxec7KEoJiqTrsDh1Bqdw26MybAB7abZKkpvI6EHtKC5y9kZLwTvUEz/+8obkOvPl6apR29nYr+zWNGWBEypH1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JgVr5QNT; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ncSNZE9jFd7SGHFxegEItKbjGImPH4AAn1/KzfKF990=; b=JgVr5Q
	NT3LMQwVybT0W8M75+niR4wCN9hPUdGLiuZeUSV5aVSovDY8tM64fgDDYbeJP+3U
	ES/g5IaOX1tZEQ+CyFozYG+MTvOY7o3J0KRu3P1ZgRNEfUyMJG9wbmiV+tloPZd5
	Am2aOe1CbtpoSJJQnvWjHzcWuH2Vtp8KxvhMxGIoAEipdaoomiPamCNxLa1HmhUo
	8RUM/Zr75BoAWLStWZRC+hJAc/aUrgtGbTn0oplF5qCrtQhXWIZiK9hEz34k4FWg
	vqsAEg9MmaRuTz9gvD+fnCkyHzUl2Hfe++xtIq+2+7/UHQkbCMhwnMHHr4jJaOwY
	ZK1eU99bwadwMi9w==
Received: (qmail 1894080 invoked from network); 22 Jun 2026 10:52:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:07 +0200
X-UD-Smtp-Session: l3s3148p1@I7PawdNUBKUujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/4] radix-tree: add parameter doc for radix_tree_deref_slot_protected()
Date: Mon, 22 Jun 2026 10:52:00 +0200
Message-ID: <20260622085204.54248-2-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34281-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24CA06ADEEE

Add the missing documentation for the 'treelock' parameter.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/radix-tree.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/radix-tree.h b/include/linux/radix-tree.h
index eae67015ce51..b8997f07b2d4 100644
--- a/include/linux/radix-tree.h
+++ b/include/linux/radix-tree.h
@@ -182,6 +182,7 @@ static inline void *radix_tree_deref_slot(void __rcu **slot)
 /**
  * radix_tree_deref_slot_protected - dereference a slot with tree lock held
  * @slot: slot pointer, returned by radix_tree_lookup_slot
+ * @treelock: pointer to the spinlock protecting the tree
  *
  * Similar to radix_tree_deref_slot.  The caller does not hold the RCU read
  * lock but it must hold the tree lock to prevent parallel updates.
-- 
2.47.3


