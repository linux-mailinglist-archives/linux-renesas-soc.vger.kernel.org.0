Return-Path: <linux-renesas-soc+bounces-28225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC6MOAJPkml8swEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:56:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C96140057
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 23:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92AAE3037152
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 22:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6078C3043B2;
	Sun, 15 Feb 2026 22:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P4ZzrPOn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C82B30BBAE
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196139; cv=none; b=RWZjYQEaeaPnrVZCJeUSOHvbvCEicjqthUOrTeSC2p6a7jX/3rS6c9gLNShcH2Q1yPoob/gXc9kO3KKqLbMIcjUBFHe6lVjx8baLae4O8ugWyTWnS7Mf38xDG9rjRPKjnTtQBDIl/IrYSGSYw7bG1+MaKGp+Qw8hq6QZANqyHYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196139; c=relaxed/simple;
	bh=B6oiWoJekyOt88Ci/SiJiaCueiS0d3nbQCbuLNiyKMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyqRpL7C4FEcHDno/zqIN+t+MOSRh0pztv9e7kCKSrONJOPv2DXdAa7Zm8lPk/IR4v4U2C4rM0gdSrid/hbNTHdcrrO2arNZmgGJAd25yl3I0P5M5SdBn3KLw9Zl36iV9Sh5uNmNGlSklGltKNU5KKqK1z3RUg0GA+YyGOwWLNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P4ZzrPOn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=v5n+dNUs/sl4SVM136Ix4+IYgDSC7nyhR22DxT/PH9E=; b=P4ZzrP
	OnYDGDcT2KBiLdRtqM/EPxiZL2p7kiz0Mz6ufSheZsOytf2TpDaW1NI4bcBFm++H
	QSRMalkbG6J2o4iwB8lV/rnS5+FIImoETc55izlAnCmSm28k+4fBu+1EW9/pht8s
	vuPLZ0xG9Y3l0yDChNTesAVV5oVathKPYejDH+/jv/rQ6wuDceFit6Nn7QG6gouz
	Q94NGQ+p0tyC8L22d8e/hR46EaeS+tYJU8cZCOZlHXr1QHtNdcdxSYd1amfgKcIp
	92CFF/PJ9YB/1dkSvyamILR6UucVLRMDkLZwkOccmLQnxpmZK6hkYNqBN6Cniufy
	OdMVWyk7LViMEXhQ==
Received: (qmail 3011705 invoked from network); 15 Feb 2026 23:55:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:19 +0100
X-UD-Smtp-Session: l3s3148p1@XC6Hu+RKIMEujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH v2 12/13] hwspinlock: refactor provider.h from public header
Date: Sun, 15 Feb 2026 23:54:52 +0100
Message-ID: <20260215225501.6365-13-wsa+renesas@sang-engineering.com>
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
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28225-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,lists.infradead.org,sang-engineering.com,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,posteo.net,sholland.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 88C96140057
X-Rspamd-Action: no action

Factor out the entries only needed for providers from the generic public
header. This allows for a clean separation between providers and
consumers. All providers are in the hwspinlock subsystem currently and
are trivially converted here as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS                           |  1 +
 drivers/hwspinlock/hwspinlock_core.c  |  1 +
 drivers/hwspinlock/omap_hwspinlock.c  |  2 +-
 drivers/hwspinlock/qcom_hwspinlock.c  |  2 +-
 drivers/hwspinlock/sprd_hwspinlock.c  |  2 +-
 drivers/hwspinlock/stm32_hwspinlock.c |  2 +-
 drivers/hwspinlock/sun6i_hwspinlock.c |  2 +-
 include/linux/hwspinlock.h            | 44 --------------------
 include/linux/hwspinlock/provider.h   | 60 +++++++++++++++++++++++++++
 9 files changed, 67 insertions(+), 49 deletions(-)
 create mode 100644 include/linux/hwspinlock/provider.h

diff --git a/MAINTAINERS b/MAINTAINERS
index dcdbb7c10dce..f9131b8cd5d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11215,6 +11215,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hw
 F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
+F:	include/linux/hwspinlock/
 F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index adf6fefb382f..6c8a03deb00c 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 96fdc35ef642..338ae9fa89f0 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -19,7 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 22cc6f9003df..7fdbb1e58b29 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2015, Sony Mobile Communications AB
  */
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index d2aa4714e2ea..f6014b314432 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -7,7 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 08762cd96cee..a22ebabe1921 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -6,7 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 5c6d20eb24b5..4dab91800745 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -7,7 +7,7 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 4f5b6932712e..4fe1c8831cd1 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,34 +27,6 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
-/**
- * struct hwspinlock_ops - platform-specific hwspinlock handlers
- *
- * @trylock:	make a single attempt to take the lock. returns 0 on
- *		failure and true on success. may _not_ sleep.
- * @unlock:	release the lock. always succeed. may _not_ sleep.
- * @bust:	optional, platform-specific bust handler, called by hwspinlock
- *		core to bust a specific lock.
- * @relax:	optional, platform-specific relax handler, called by hwspinlock
- *		core while spinning on a lock, between two successive
- *		invocations of @trylock. may _not_ sleep.
- * @init_priv:	optional, callback used when registering the hwspinlock device.
- *		Its return value will be used to fill the per-lock 'priv' data.
- */
-struct hwspinlock_ops {
-	int (*trylock)(struct hwspinlock *lock);
-	void (*unlock)(struct hwspinlock *lock);
-	int (*bust)(struct hwspinlock *lock, unsigned int id);
-	void (*relax)(struct hwspinlock *lock);
-	void *(*init_priv)(int local_id, void *init_data);
-};
-
-void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
-struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
-int hwlock_to_id(struct hwspinlock *hwlock);
-struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
-					       int base_id, int num_locks, void *init_data);
-int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
 int of_hwspin_lock_get_id(struct device_node *np, int index);
@@ -67,18 +39,6 @@ int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
-int devm_hwspin_lock_unregister(struct device *dev,
-				struct hwspinlock_device *bank);
-struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
-						    int base_id, int num_locks, void *init_data);
-
-static inline int devm_hwspin_lock_register_errno(struct device *dev,
-						  const struct hwspinlock_ops *ops,
-						  int base_id, int num_locks, void *init_data)
-{
-	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
-}
-
 #else /* !CONFIG_HWSPINLOCK */
 
 /*
@@ -87,10 +47,6 @@ static inline int devm_hwspin_lock_register_errno(struct device *dev,
  * code path get compiled away. This way, if CONFIG_HWSPINLOCK is not
  * required on a given setup, users will still work.
  *
- * The only exception is hwspin_lock_register/hwspin_lock_unregister, with which
- * we _do_ want users to fail (no point in registering hwspinlock instances if
- * the framework is not available).
- *
  * Note: ERR_PTR(-ENODEV) will still be considered a success for NULL-checking
  * users. Others, which care, can still check this with IS_ERR.
  */
diff --git a/include/linux/hwspinlock/provider.h b/include/linux/hwspinlock/provider.h
new file mode 100644
index 000000000000..73c7b0cb6735
--- /dev/null
+++ b/include/linux/hwspinlock/provider.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hardware spinlock public header for providers
+ *
+ * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
+ */
+
+#ifndef __LINUX_HWSPINLOCK_PROVIDER_H
+#define __LINUX_HWSPINLOCK_PROVIDER_H
+
+#include <linux/err.h>
+
+struct device;
+struct hwspinlock;
+struct hwspinlock_device;
+
+/**
+ * struct hwspinlock_ops - platform-specific hwspinlock handlers
+ *
+ * @trylock:	make a single attempt to take the lock. returns 0 on
+ *		failure and true on success. may _not_ sleep.
+ * @unlock:	release the lock. always succeed. may _not_ sleep.
+ * @bust:	optional, platform-specific bust handler, called by hwspinlock
+ *		core to bust a specific lock.
+ * @relax:	optional, platform-specific relax handler, called by hwspinlock
+ *		core while spinning on a lock, between two successive
+ *		invocations of @trylock. may _not_ sleep.
+ * @init_priv:	optional, callback used when registering the hwspinlock device.
+ *		Its return value will be used to fill the per-lock 'priv' data.
+ */
+struct hwspinlock_ops {
+	int (*trylock)(struct hwspinlock *lock);
+	void (*unlock)(struct hwspinlock *lock);
+	int (*bust)(struct hwspinlock *lock, unsigned int id);
+	void (*relax)(struct hwspinlock *lock);
+	void *(*init_priv)(int local_id, void *init_data);
+};
+
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
+int hwlock_to_id(struct hwspinlock *hwlock);
+struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+					       int base_id, int num_locks, void *init_data);
+int hwspin_lock_unregister(struct hwspinlock_device *bank);
+
+struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+						    int base_id, int num_locks, void *init_data);
+int devm_hwspin_lock_unregister(struct device *dev,
+				struct hwspinlock_device *bank);
+
+static inline int devm_hwspin_lock_register_errno(struct device *dev,
+						  const struct hwspinlock_ops *ops,
+						  int base_id, int num_locks, void *init_data)
+{
+	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
+}
+
+#endif /* __LINUX_HWSPINLOCK_PROVIDER_H */
-- 
2.51.0


