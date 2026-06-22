Return-Path: <linux-renesas-soc+bounces-34277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8+PYAEL4OGockwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:54:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7206ADF44
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:54:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=CmsDZozV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49AF3045DD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E793939B0;
	Mon, 22 Jun 2026 08:52:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEACA3921F6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118340; cv=none; b=ERwGSC5NkZjWJeRXnmAoOMxwk8j2jwJ0jX3r66DyWRGQYVP+3Xw/vDRdsFNJrWn8yATIrTB9DBr7XobgBX12qgZAH1XWN1wjRgSLnqBHmNZyB9GKFKG8FVoDv+eInbZp5HoursmPS0ozzHYvCXZpNmt2EBmtaaIBZrHrIweP+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118340; c=relaxed/simple;
	bh=7grLb8fpXdl88V/G0DH0d6VvzMgy79Jvs3Cd+JXNhTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTeErjBuyNArOeGeYf727WpEdRrwF5iXcD2COGLDtbhxj1ST4GC6v3jtkjZFG4m54GZeM9azQIq49wVbapAWQLkDsNdrkWLDJnJAeKF8F+DqgiahnQJhAmC7lfyBt6yW9NGp0WIoA0ZLfPHE2A83vSCWtWdOxM0irqkFBMYc3VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CmsDZozV; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=58x3xnDGzSsm6q
	cobwOQ+q8gCfYb7i9HbwnHo+j3tfk=; b=CmsDZozVLo3nc7WU2qYHIc+lVBOCLP
	tvkOye1So5m/IJgDibwOugLLlaUV1ZApQWy4ZZ756FJeoTgOql8V7JXlPmMK2avE
	UFtFfGuV19KDd8qUs8E6+KlK5nO9fhfkJjfrOZWgZTANdulF/COSHLgBiMGx7hU6
	KDj6sIcJ0LLLBF8gLiSeqgymCLyFDv3p1qkN79D1Wo2IVTJwme8TCLnp5azwIq51
	EwaLQ9Mz9V9FRjNPmp1Oy9Isd80034ilY6TBoysetdnb1UAHbjEQv79ibYh6Dgki
	VYqHxQZ7qHk5bwE4MMdE9yQQXHpahwsg9cDgXq59RMGfT3O3iYyYxvgQ==
Received: (qmail 1894039 invoked from network); 22 Jun 2026 10:52:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:06 +0200
X-UD-Smtp-Session: l3s3148p1@/wrPwdNU9qQujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Date: Mon, 22 Jun 2026 10:51:59 +0200
Message-ID: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
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
	TAGGED_FROM(0.00)[bounces-34277-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:mid,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D7206ADF44

Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
multiple instances and, thus, multiple spinlock providers. The spinlocks
are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
development on these systems, it is helpful to have an overview of
registered spinlocks in debugfs. This series adds support for that. The
first two patches update the radix-tree header to support more lock
types. The third patch fixes a missing RCU annotation for the slot
pointer. The fourth patch finally adds the desired functionality.

Because the radix tree seems to have no dedicated tree nor maintainer, I
suggest that all these patches go in via hwspinlock. This also keeps the
dependencies zero.

A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock

It has been tested on a SparrowHawk board (R-Car V4H) and an Ironhide
board (R-Car X5H).

Looking forward to comments.

Changes since v1:
* dropped patch inverting the HWSPINLOCK_UNUSED logic
* added radix tree patches to support the mutex treelock of hwspinlock
* included RCU annotation patch sent previously as independent patch
* addresses Sashiko comments in patch 4
	* ensure correct locking
	* add error codes
	* proper ppos handling
	* no leaking iterator when done
	* mark pointer dereference as protected (needs patch 2)
	* split up long lines


Wolfram Sang (4):
  radix-tree: add parameter doc for radix_tree_deref_slot_protected()
  radix-tree: allow more lock types with
    radix_tree_deref_slot_protected()
  hwspinlock: annotate slot pointer as RCU sensitive
  hwspinlock: add summary in debugfs

 drivers/hwspinlock/hwspinlock_core.c | 91 +++++++++++++++++++++++++++-
 include/linux/radix-tree.h           |  9 ++-
 2 files changed, 94 insertions(+), 6 deletions(-)

-- 
2.47.3


