Return-Path: <linux-renesas-soc+bounces-28730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHKZH5M3p2lwfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 20:33:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 232C31F60F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 20:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C0673051AA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 19:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACA249218E;
	Tue,  3 Mar 2026 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AgMxdyKn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587AC38425B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 19:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566319; cv=none; b=Etgj3LMH39zpB7yUcRC98YOo1UoLnfBr7F1PXWrHlAvmdz7gMR0S10HfdZesVDslJUGkZefmJGnI2j99XAwUZI+q21hEvs7l5m+M4OmSEKG6bglLkphKdWpavtQdgxgbAXIPPABX71Jk09DtQRNth2fDis/q0KPNdiKx5net+cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566319; c=relaxed/simple;
	bh=uzc3fyoi8FSR6bwgllT3vuutQc1YoByfPGRM76QKxto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CseWHQvmgCDY4YfM+tL5/2Uk0sTaRGmJg3cTTyB5ltSn8I6hOjF6PIpEYqo7Flb1V2P1AFVQy9HrYL4Ljz2UPoF42fZX5ExzLztblytG6EtdVNPd1AGLgNAqKRcoKv9qaf4kNDSexSRZa3CZchv/KQGO52qt2kWMDkDT4tkbZMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AgMxdyKn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=huat1Y/wJ/zb768/t+yGa5XgKV25MRf5vTJTHiQcbnY=; b=AgMxdy
	KnDr6M+97zchJTQOZmBtEyKGpf5Kwm/4G1kAzt3yez5fujjTuGyc8mCPpmJDOOuv
	uHkdw3H0FNHIvVuEBk3EWKlStqQbVdi2w9rjOiVTD5N7S3S5tFsDH5i0zW6u075I
	J7/DBeBNqJoWAvuoV5KvVYImcWcmuA0AkEY6gLzaeaw0QncLREXWMoQVib84PKm5
	aPnvhDw6Gj05D2vshFEhXKnCfoumEF/1Ar1yrUXUbipqKXY83RpJ50HLJ/dylQrM
	02ktwynLlcTysaGvvOfZN9iUfxgp7BjH7XHP6XDLAfS8DpPm/jddxV5ic/zUJSgw
	NtYnip+yGb8exfBw==
Received: (qmail 430691 invoked from network); 3 Mar 2026 20:31:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 20:31:37 +0100
X-UD-Smtp-Session: l3s3148p1@V9eCwCNMJKgujnu+
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
Subject: [PATCH v3 11/15] hwspinlock: move entries from internal to public header
Date: Tue,  3 Mar 2026 20:26:03 +0100
Message-ID: <20260303192600.7224-28-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 232C31F60F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28730-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,posteo.net,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wizery.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
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
index f1ff6406db46..96fdc35ef642 100644
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
index 95b254e9b6a0..d2aa4714e2ea 100644
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
index a966e967dcdb..08762cd96cee 100644
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
index 8e17deb503c7..5c6d20eb24b5 100644
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
2.51.0


