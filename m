Return-Path: <linux-renesas-soc+bounces-28110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGVDIfUPi2l/PQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:01:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD21119EC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D5BD300B446
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D753164C8;
	Tue, 10 Feb 2026 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jFrrk0ul"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9C311587
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721263; cv=none; b=gdOFvQBYm/PWfUBBz/0UGyjRYMh83RPtovGjg1FNnZS7TveuvgjxB97NOqs5P6rcoKmIvwE7HsiPAMjYRVEegQq5ITtJcG0VpHtxYWp2zkNpjwV1fG9Cj9HR9qSHTgSawcjIY+QoYBz3DBHall1OAhLXR7Ku5SKUTqQb0dSvxPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721263; c=relaxed/simple;
	bh=Pw3xnr+PlGIZMb2ozPIOWhDda8PU0AmZco41i4WTiH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ao+gvZTC3mYTifuBJRZ+R1wPckJEsdbrndF6Q/d8cVCuszjRgpriOUYGKwzlaik+5JO7T5Ilp8JyR67OMJoefhZNVfKBXcgJ7u9ij88ZtfzXwZG8Pm5YhRMC06Z8mC7JjhXQUajn5DHG790vsLd3am0mGXPMcsSC8DQpAECy4CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jFrrk0ul; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=5yj4wZBBBzbY5G
	wW0gijlrfVdaLRczFTHW/kmhaJEWI=; b=jFrrk0uliJtQL3ULoNT/MO/L5cvQdS
	KuaevCFevRkGbG8Im8C5ZVS4AogrsmD9WX/n35o42ETPKSYKIUtA3JSIXz3AL0h1
	+Ua4F9CGag1JtpoNtxrXlTz4JOsQQTrBtHNujnA7dDzWP5tbVjoaD+y3JqUhYuhD
	+Oqqq/woHeZrrE/8yvHVSSY23FBfV2tr3cfjupuiYizMJEE8s1cJwxki7Mo2r+tJ
	Rg2EJl7dIc0/VMkxZet8i6Zv6U/ax0+tlewSb6JAZoiWFqfhmffUqgRCJNK20+FH
	QhzAmkfJ4dfiFFIfZfjd8+27LbwRs9EaQ9MntZ5UDpWQ+Cj//g7wjcYw==
Received: (qmail 353793 invoked from network); 10 Feb 2026 12:01:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:01:00 +0100
X-UD-Smtp-Session: l3s3148p1@V+O1K3ZKmpkujnuT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Date: Tue, 10 Feb 2026 12:00:54 +0100
Message-ID: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28110-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:mid,sang-engineering.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0CD21119EC5
X-Rspamd-Action: no action

As stated in patch 1, the U8500 driver is clearly unused for more than a
decade. Removing it allows us to remove generic platform_data support.
Both removals make the upcoming refactoring (headers and lock
allocation) in the hwspinlock subsystem easier.

Wolfram Sang (2):
  hwspinlock: u8500: delete driver
  hwspinlock: remove now unused pdata from header file

 MAINTAINERS                     |   1 -
 drivers/hwspinlock/Kconfig      |  10 ---
 drivers/hwspinlock/Makefile     |   1 -
 drivers/hwspinlock/u8500_hsem.c | 155 --------------------------------
 include/linux/hwspinlock.h      |  28 ------
 5 files changed, 195 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c

-- 
2.51.0


