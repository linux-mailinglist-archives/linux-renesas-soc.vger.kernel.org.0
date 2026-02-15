Return-Path: <linux-renesas-soc+bounces-28224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAWPNwJPkml5swEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:56:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C5140056
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 295EB303CA5C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 22:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129A930B53B;
	Sun, 15 Feb 2026 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KQv1WKkJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640B30BBAE
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196137; cv=none; b=nX+ilwJt7nXqxXNC/d+Iq6PFZHUB1BSlvUzAg4QU7FZetKe9WgrDMkrAQiPRpottnHGTqKdWSMPdtnQxt4ITAivLlsmBOdvzqGb189uozzsMYnXqeaWZyddTaa4KEv6XFzkKKRDuRXjlBsYJEzrlDYfUG28OefdJyE4QlnvtqNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196137; c=relaxed/simple;
	bh=psLxIyqJNNZuIdfYbYVd4a/LEBsH2BQjEtuLh1wEfx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwxcEFztprVFYKt/AED8yBQV/O41BrDoj49xkzltB6JdUb4YzVrccPE5jiYtNaull9CZnBPM8K9nKL21X5psYxMZVDpgYN5+l4kf46m1s6A1lRzOwvi1d/ITWzI25l997QpJ2eBAk7onIbQBhE0OQ5IbSvZZDCDp4G2bzSJ+sOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KQv1WKkJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=H4TWCWQvEKEnt9v/1rNXK1WIu2jDn+wGyrjvF/JjC0Y=; b=KQv1WK
	kJgiwsH/MMJgj3k6X21h0JWwah35yIDAjFGLj1ZXnuPmICVhAhoHUhp6FPopF1/6
	WljoaNzfXiPAsWJIrSTIzF091weMGVRIaXOqdlwx8ptVpiy/AzA9Fgn9Pom/ndEn
	yWxAciQJltdjwfbC3TD+f5rxO35GJ16aFkn9U06jUjh37m1sGVtGhZxDNDs2aHb+
	UcbSEbcDVI/TWce1fn5P/h8c/LXRgtoNVJ5YdpsGCoG/okjj+1wbLeBI8GX+2h4/
	L7NMB7kFXdhefFM6KlIq0V0skuDg8PXhw+4srKhR3vJTzywJO9D0Nro1Q83HMoiy
	NT7JjY4Q3/TWEDmw==
Received: (qmail 3011627 invoked from network); 15 Feb 2026 23:55:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:18 +0100
X-UD-Smtp-Session: l3s3148p1@fdlsu+RKEsEujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 11/13] hwspinlock: sort include and update copyright
Date: Sun, 15 Feb 2026 23:54:51 +0100
Message-ID: <20260215225501.6365-12-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28224-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,wizery.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 856C5140056
X-Rspamd-Action: no action

During the latest refactoring, unsorted includes were a bit annoying.
So, sort them to avoid this. Also, update the copyright due to said
refactorings.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 838bb2ab5eba..adf6fefb382f 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -3,26 +3,26 @@
  * Hardware spinlock framework
  *
  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
  */
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/spinlock.h>
-#include <linux/types.h>
 #include <linux/err.h>
-#include <linux/jiffies.h>
-#include <linux/radix-tree.h>
 #include <linux/hwspinlock.h>
-#include <linux/pm_runtime.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/radix-tree.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
 
 struct hwspinlock_device;
 
-- 
2.51.0


