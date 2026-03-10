Return-Path: <linux-renesas-soc+bounces-29108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMFnGCjPr2kfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:58:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A76246C97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52FE3306EE26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 07:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8A8364E82;
	Tue, 10 Mar 2026 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B3cMMvxA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53A3D6692
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129387; cv=none; b=Z5zg0UyraN/q6LqlniCP0FMKVteHLNmzBGpYfccX3naBNiiPEwupkq8KADkJdQtGcysCpjABdRYCRBAcHqATnZ+MPlQRd+5F/zCXaCdDHuLhpszD/TPBPu3esUs2Ph1tK3uXVo39AjOQE2y6h3MxUx1KSXiv3PyD9LgwkJptOGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129387; c=relaxed/simple;
	bh=asNNZO3T9J/zCvAshr8ECVC12qbgcjwJBEdnKjW8eco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5x7TvDJKunTNAi8/y1mr1+UZahu6rFRGUl0K4j9uKg3HpGIC9tFxkrIsQdaoRCzDgn6JK1/Oqw6e/0cSddXOHECih0KL/2Jlp+VgrYDKRIcs/bV5qkYyeqS054kVPQvF+e7poRFRt9mKqNcfiF88Pj4XSv91QmhbVdGkJaiZ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B3cMMvxA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZRMTNQrz0U6t5XnH9AMNswJjY22nKrWom0qhpwEtk9U=; b=B3cMMv
	xA1iERRotAgLTpQZiW593f9fq1ZyAfoFw8Kx0QHNkAiBVip/JOl5Tnm4u9ejpyGA
	BGvA4PllKr6ecoahdZ/fqfMwheXAQSayWKmCdY62dLiOYEcSkcwu/Fbbp4rjyPQO
	5Q7hiLGbNajoBSpe8j+A1iIfncz/+qHWNmvra+WDHHvbSOIKh7ltP9vp384g8upr
	hg11kaab1P1HDSUkTowW3rtyuUzd8gETsTjr1lGcUOyoyvljuRRS4JGP01YRnnaS
	K7ucTKGy5UFVAU3fGm/HsWR9YNSqhZbY/mnFNVhoOBoUr5MhknaYC/Qpnw75u5uJ
	I3Y5DGJ3dQj/azaQ==
Received: (qmail 3112771 invoked from network); 10 Mar 2026 08:55:58 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:58 +0100
X-UD-Smtp-Session: l3s3148p1@tCuG2aZM5NIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
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
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 11/15] hwspinlock: move entries from internal to public header
Date: Tue, 10 Mar 2026 08:55:26 +0100
Message-ID: <20260310075539.11701-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E6A76246C97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29108-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,posteo.net,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,wizery.com:email,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Action: no action

Providers need the ops-structure and the hwlock_to_id-function. Move
these entries to the public header. With this change, all providers are
also updated to use the public header only. The internal header is now
used by the core only.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c     |  8 +++++++
 drivers/hwspinlock/hwspinlock_internal.h | 29 ------------------------
 drivers/hwspinlock/omap_hwspinlock.c     |  2 --
 drivers/hwspinlock/qcom_hwspinlock.c     |  2 --
 drivers/hwspinlock/sprd_hwspinlock.c     |  2 --
 drivers/hwspinlock/stm32_hwspinlock.c    |  2 --
 drivers/hwspinlock/sun6i_hwspinlock.c    |  2 --
 include/linux/hwspinlock.h               | 23 +++++++++++++++++++
 8 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a7610ba755b4..e0227d027cf2 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -915,5 +915,13 @@ struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock)
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_get_dev);
 
+int hwlock_to_id(struct hwspinlock *hwlock)
+{
+	int local_id = hwlock - &hwlock->bank->lock[0];
+
+	return hwlock->bank->base_id + local_id;
+}
+EXPORT_SYMBOL_GPL(hwlock_to_id);
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 3c835d96bf86..20ae531fc389 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -15,28 +15,6 @@
 
 struct hwspinlock_device;
 
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
 /**
  * struct hwspinlock - this struct represents a single hwspinlock instance
  * @bank: the hwspinlock_device structure which owns this lock
@@ -65,11 +43,4 @@ struct hwspinlock_device {
 	struct hwspinlock lock[];
 };
 
-static inline int hwlock_to_id(struct hwspinlock *hwlock)
-{
-	int local_id = hwlock - &hwlock->bank->lock[0];
-
-	return hwlock->bank->base_id + local_id;
-}
-
 #endif /* __HWSPINLOCK_HWSPINLOCK_H */
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 87ab30614e1d..41a8812708ef 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -23,8 +23,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* Spinlock register offsets */
 #define SYSSTATUS_OFFSET		0x0014
 #define LOCK_BASE_OFFSET		0x0800
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index e2836d6728e8..22cc6f9003df 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include "hwspinlock_internal.h"
-
 #define QCOM_MUTEX_APPS_PROC_ID	1
 #define QCOM_MUTEX_NUM_LOCKS	32
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index bbae37e25243..0f4fc622e3cd 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -15,8 +15,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* hwspinlock registers definition */
 #define HWSPINLOCK_RECCTRL		0x4
 #define HWSPINLOCK_MASTERID(_X_)	(0x80 + 0x4 * (_X_))
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index ed937bc26bf5..8eafe1a74b1b 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include "hwspinlock_internal.h"
-
 #define STM32_MUTEX_COREID	BIT(8)
 #define STM32_MUTEX_LOCK_BIT	BIT(31)
 #define STM32_MUTEX_NUM_LOCKS	32
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 8bbed23af5f4..145d284c5ab5 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -17,8 +17,6 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include "hwspinlock_internal.h"
-
 #define DRIVER_NAME		"sun6i_hwspinlock"
 
 #define SPINLOCK_BASE_ID	0 /* there is only one hwspinlock device per SoC */
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 58733cda7a9a..4f5b6932712e 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,8 +27,31 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
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
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
+int hwlock_to_id(struct hwspinlock *hwlock);
 struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
 					       int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
-- 
2.47.3


