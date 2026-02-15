Return-Path: <linux-renesas-soc+bounces-28223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L6iFAFPkml8swEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:56:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF3140047
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A3EF303C020
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 22:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F07030B52A;
	Sun, 15 Feb 2026 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hLhCnQeu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8603043B2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196136; cv=none; b=FR9HWHSf0LU5jsJsYpRemZbIPTytitgB1oWzh40VoV4IZcWqb5+qLGJ7WT3qf+ZJU/tli6/7SISq0o+Ez9qKuo+0xA8SlWmnwAdrp11vYvYe6rwPV/tzHOGlEA/GPYiRliT09+t1s3EKrU2p/+W1KM0myCVLmjNH7fA7WXzGwJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196136; c=relaxed/simple;
	bh=O0/aSLtd3P/qTAdPO+zn8wpbnZclNDm5KCsrgJD7++w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcwpQVNNwtlSedm0OcmyNB196AMoS+PabOEl3PgHGOwGdSY8RHFZ3Iic2LHqHJfW3THEd1OwoXk++0EDEXUUKLxKioGibh0o87N3NIP7LTF3lculgd9CfvNksCr47E4lAxU2A4P8GutqQuRYaOwslW8rf/LLHUs4bMTOLwuNB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hLhCnQeu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=FsJWFDua2E4VYcmf2pdKCeoU+PWx+kDwobw5R2iufLI=; b=hLhCnQ
	euhtV/jxY4f6LKLbNi1MXzcLYstlKOb2w5Z5COu9Zendzk4SF2JcA897dta8kBW2
	TgeDH46NLhyn/OuEj7OoX+bXhErngmuRNCRaFihw1wDeRHEuPvbQEKn5VOD3PLoK
	EfKlPGUjS4zpnjYAnO2OKfun0DeXj4aattu9he8xUfJWXTdNqzbC3YJw05y52Y68
	M43L88b7cg1MFLN27OsF2kLzeAMTjl9O3YTf39YrLam9FYXwx7HuQ2FtS5JmdY+o
	I5jyb60xEaG2MetBYS0UoTurK0lYWDr4JONnpUGu14KNFxCEdtmFwMiEAPxksfsj
	ylpkBYOpss34EgGA==
Received: (qmail 3011603 invoked from network); 15 Feb 2026 23:55:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:17 +0100
X-UD-Smtp-Session: l3s3148p1@5f5fu+RKBsEujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 10/13] hwspinlock: remove internal header
Date: Sun, 15 Feb 2026 23:54:50 +0100
Message-ID: <20260215225501.6365-11-wsa+renesas@sang-engineering.com>
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
	TAGGED_FROM(0.00)[bounces-28223-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,wizery.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: E5EF3140047
X-Rspamd-Action: no action

Because the internal header is now used by the core only, it can also be
moved its source code. The header was small enough.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c     | 31 +++++++++++++++-
 drivers/hwspinlock/hwspinlock_internal.h | 46 ------------------------
 2 files changed, 30 insertions(+), 47 deletions(-)
 delete mode 100644 drivers/hwspinlock/hwspinlock_internal.h

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index e0227d027cf2..838bb2ab5eba 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
@@ -23,7 +24,35 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
-#include "hwspinlock_internal.h"
+struct hwspinlock_device;
+
+/**
+ * struct hwspinlock - this struct represents a single hwspinlock instance
+ * @bank: the hwspinlock_device structure which owns this lock
+ * @lock: initialized and used by hwspinlock core
+ * @priv: private data, owned by the underlying platform-specific hwspinlock drv
+ */
+struct hwspinlock {
+	struct hwspinlock_device *bank;
+	spinlock_t lock;
+	void *priv;
+};
+
+/**
+ * struct hwspinlock_device - a device which usually spans numerous hwspinlocks
+ * @dev: underlying device, will be used to invoke runtime PM api
+ * @ops: platform-specific hwspinlock handlers
+ * @base_id: id index of the first lock in this device
+ * @num_locks: number of locks in this device
+ * @lock: dynamically allocated array of 'struct hwspinlock'
+ */
+struct hwspinlock_device {
+	struct device *dev;
+	const struct hwspinlock_ops *ops;
+	int base_id;
+	int num_locks;
+	struct hwspinlock lock[];
+};
 
 /* retry delay used in atomic context */
 #define HWSPINLOCK_RETRY_DELAY_US	100
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
deleted file mode 100644
index 20ae531fc389..000000000000
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Hardware spinlocks internal header
- *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
- */
-
-#ifndef __HWSPINLOCK_HWSPINLOCK_H
-#define __HWSPINLOCK_HWSPINLOCK_H
-
-#include <linux/spinlock.h>
-#include <linux/device.h>
-
-struct hwspinlock_device;
-
-/**
- * struct hwspinlock - this struct represents a single hwspinlock instance
- * @bank: the hwspinlock_device structure which owns this lock
- * @lock: initialized and used by hwspinlock core
- * @priv: private data, owned by the underlying platform-specific hwspinlock drv
- */
-struct hwspinlock {
-	struct hwspinlock_device *bank;
-	spinlock_t lock;
-	void *priv;
-};
-
-/**
- * struct hwspinlock_device - a device which usually spans numerous hwspinlocks
- * @dev: underlying device, will be used to invoke runtime PM api
- * @ops: platform-specific hwspinlock handlers
- * @base_id: id index of the first lock in this device
- * @num_locks: number of locks in this device
- * @lock: dynamically allocated array of 'struct hwspinlock'
- */
-struct hwspinlock_device {
-	struct device *dev;
-	const struct hwspinlock_ops *ops;
-	int base_id;
-	int num_locks;
-	struct hwspinlock lock[];
-};
-
-#endif /* __HWSPINLOCK_HWSPINLOCK_H */
-- 
2.51.0


