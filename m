Return-Path: <linux-renesas-soc+bounces-29100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPdtL5jOr2kfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:56:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A40246B4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19E863027075
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 07:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAAA362127;
	Tue, 10 Mar 2026 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jSnsmLqY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4436495B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129367; cv=none; b=oeYFnlBzhWYbsr646th5TBU4qr6RGMSgot6YT0BRA4G3yLTafnUYpnjYHazuYifQO/sm5nwl9AUCB3lZ9xbLUhHLKKhIfnF4SNfyuh8z6L4+tXCn16u04gBQLblw7AX+n9iZx+RPxwrINlsgfJiRGdf3FiB0jX7ZakHrvCw85Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129367; c=relaxed/simple;
	bh=ie25SIPrCyJJGxZvKcNfxyNV67pa8xcffLXnNnSW+7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUjZfH6xhWXWZ86HqJwfcTfG4J+QSMKZ6EfytaS8+YbVtlLkWko6JpfsdCBTNJb5e1VQKydw8SNPQRfaEPYYRSZvX4tWngfZ7A9FSK0FJstSU2O4hl22GNybMeUfuCPD6Tu4CYy9KtY45rUiJCx6jm+EAXpIUPlKbbFzjzo61pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jSnsmLqY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Ww4nYucVcxYHOiIbxAnzL68uueWTV/h2bRDqOLnsme0=; b=jSnsmL
	qYMbsKvWcgJkDyGTS/MKc6CavAjUlEjTs7Jc1fq4TKz63lF18ap7o8k4SN8PXbyS
	AHL8q+PdihoH4HtcqxO1Zy9d6w3gs2vfEITGwDJ18954tz/bYbrqQpz/k5n1K+Nt
	vqA+pg0pr/pfiZ2fyH5RHWpZiNLfI2uD5UnE6EKKWdtKakY3rKSVsxEeWvmAX4PB
	+B3SdKbjJvBo2xJWzM61toM3yRYMNng1r3e81RTJbF7WjE0V86GHf4eX9TX5YlDv
	GFNVWeKy9ahgzUkxhBCCWgdgtJ2nAGza2RYfakik/k4ZYVxFHNsMPQILQ5qr5KgQ
	co7yFG/J9Xj4yChg==
Received: (qmail 3112619 invoked from network); 10 Mar 2026 08:55:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:50 +0100
X-UD-Smtp-Session: l3s3148p1@Bz4S2aZMrpAujntP
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
Subject: [PATCH v4 03/15] hwspinlock: add helpers to retrieve core data
Date: Tue, 10 Mar 2026 08:55:18 +0100
Message-ID: <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
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
X-Rspamd-Queue-Id: A8A40246B4D
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-29100-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Action: no action

This is a first step to hide internal core structs from hwspinlock
providers. It adds helper functions to retrieve the data needed by them.
Because all users are only within the hwspinlock subsystem and the
change there is trivial, conversion is included in this patch as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c  | 12 ++++++++++++
 drivers/hwspinlock/omap_hwspinlock.c  |  4 ++--
 drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++++++-----
 drivers/hwspinlock/sprd_hwspinlock.c  |  6 +++---
 drivers/hwspinlock/stm32_hwspinlock.c |  4 ++--
 drivers/hwspinlock/sun6i_hwspinlock.c |  4 ++--
 include/linux/hwspinlock.h            |  2 ++
 7 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..2c9eceba7fe8 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -888,5 +888,17 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock)
+{
+	return hwlock->priv;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_priv);
+
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock)
+{
+	return hwlock->bank->dev;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_dev);
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1832e0c3af6b..5bf0061d3fd6 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -37,7 +37,7 @@
 
 static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* attempt to acquire the lock by reading its value */
 	return (SPINLOCK_NOTTAKEN == readl(lock_addr));
@@ -45,7 +45,7 @@ static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void omap_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* release the lock by writing 0 to it */
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..7ff89c3e8c6b 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -27,7 +27,7 @@ struct qcom_hwspinlock_of_data {
 
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -44,7 +44,7 @@ static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -66,13 +66,14 @@ static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 
 static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
+	struct device *dev = hwspin_lock_get_dev(lock);
 	u32 owner;
 	int ret;
 
 	ret = regmap_field_read(field, &owner);
 	if (ret) {
-		dev_err(lock->bank->dev, "unable to query spinlock owner\n");
+		dev_err(dev, "unable to query spinlock owner\n");
 		return ret;
 	}
 
@@ -81,7 +82,7 @@ static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 
 	ret = regmap_field_write(field, 0);
 	if (ret) {
-		dev_err(lock->bank->dev, "failed to bust spinlock\n");
+		dev_err(dev, "failed to bust spinlock\n");
 		return ret;
 	}
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 22e2ffb91743..0d08efbdfb07 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -40,8 +40,8 @@ struct sprd_hwspinlock_dev {
 static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock =
-		dev_get_drvdata(lock->bank->dev);
-	void __iomem *addr = lock->priv;
+		dev_get_drvdata(hwspin_lock_get_dev(lock));
+	void __iomem *addr = hwspin_lock_get_priv(lock);
 	int user_id, lock_id;
 
 	if (!readl(addr))
@@ -59,7 +59,7 @@ static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 /* unlock the hardware spinlock */
 static void sprd_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(HWSPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..1d75dc03f4ad 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -27,7 +27,7 @@ struct stm32_hwspinlock {
 
 static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 	u32 status;
 
 	writel(STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID, lock_addr);
@@ -38,7 +38,7 @@ static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(STM32_MUTEX_COREID, lock_addr);
 }
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d314588046..8ff81cb5880a 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -62,14 +62,14 @@ static void sun6i_hwspinlock_debugfs_init(struct sun6i_hwspinlock_data *priv)
 
 static int sun6i_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);
 }
 
 static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 74b91244fe0e..dffa1dff7289 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,6 +27,8 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		const struct hwspinlock_ops *ops, int base_id, int num_locks);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
-- 
2.47.3


