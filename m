Return-Path: <linux-renesas-soc+bounces-29882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKqEDNDXu2k6pAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:02:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 521112C9F30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 781033032055
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 11:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BEA3CC9FD;
	Thu, 19 Mar 2026 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P8VuVNmg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA63CA4AE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918041; cv=none; b=h+dUEnc+d3gJmj5a78hub/0jIKU8JPon9hkK6GdblHbQ8cHfeoBsh5r3C40SyWzemFr8VdWt/0POloShfbUm5KpKPbiiiZoi5XmXgmYlMdLA7AXfl5CanPTXONs7N+iVVewfoOUOPcoHA1CsZBFgM4XLjmEEgDRcDp1QO9KUDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918041; c=relaxed/simple;
	bh=2qHwj1Hj7wC4HlI3asFHikIH7wRdg857kdR/tWd/T/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDvWW2AwiXSmF0ygKiOSpgD9TQ5szmRUbv9boFG3RAnZYVqyZiwvnCi6NfEgQR9YmF1s3QZsrQ5KbeSQ7OTf6l5VG5aGiSIMUTELSs79Kil1Xl0FRdOO1q8UUSDW5sSL/k0d1Ow3+svT2cO8FO0bUs8u+ViKllU0U5/NkvPLYF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P8VuVNmg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/sFyPu9FMCDlNk9fEpqi+119BKQlqMiwj2wobIRKYUo=; b=P8VuVN
	mgfkF8El2hVCoCJiDSCT7G88SmOiJCyyGw2EWq1XkhkVbAz2TseH465w4JqFd0M1
	xBK2Q706tybEuIHF6hfPFotG9vehWezBN1TG+6iEfexY8Cod6d2seLI8MQKNx/Tx
	VHKYQ0ELAUs5+5aCh491pbeh8bfgDKVckLXciAhQulJ403lFfjNVIZPMYvXjNeYX
	VLbk0IquKUG0Z74rHrS5ufHeloKHnqtEpqE92ZuxbRfc0vXhpmMqrHsGSrWtZttK
	FlVPUyB0dexPfIH9bepaPgnyCk5B0ztqvlAMjIwO5JWgQZEebfr/y0qPHIoiXID3
	DrVMPMpZ7eJdAXnw==
Received: (qmail 1099928 invoked from network); 19 Mar 2026 12:00:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 12:00:09 +0100
X-UD-Smtp-Session: l3s3148p1@9o3TeF5NyK0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 12/15] hwspinlock: remove internal header
Date: Thu, 19 Mar 2026 11:59:34 +0100
Message-ID: <20260319105947.6237-13-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29882-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ti.com:url,wizery.com:email]
X-Rspamd-Queue-Id: 521112C9F30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Because the internal header is now used by the core only, it can also be
merged into source file itself. The header was small enough.

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


