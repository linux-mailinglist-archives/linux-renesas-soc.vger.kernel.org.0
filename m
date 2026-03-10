Return-Path: <linux-renesas-soc+bounces-29102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNRiEx3Pr2kfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:58:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0945246C8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 770E6305A6EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 07:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A11B3B95E9;
	Tue, 10 Mar 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WUxZQC63"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC83C36606C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129372; cv=none; b=LfpxmGBe6bztUjC3vo2JNL9t5FYmarKac2WYfiWKbkX4a+bhobvSHfNNcuhT2aWQ3uOmCHWwAsUMGfD6JRQO+Hmp6fD5d3M89bIIkDA4q9lrmaud6LWULZ2pv5BR2aUWIqXN+js4SfG3lL5lzm5MiHS+otMX/xfhr01dNjnbYOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129372; c=relaxed/simple;
	bh=QdAPQ/wgPjYWXA5UouD20DLZ3JnNeWjKMNF0ZnmgYT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFKDgPque6Iu5M+TM0ssT/bD8/sD5FRP6fbBIqHTzr8isi+AFB5ichjnx6zCxgfh93kP4RTUFfK2uOQAYP5m4X8CV0vP5xz+53h/4ifT3zfYG8qdDK4SNfPBqfl/YbrSVcj2Dju3tJ+kH1IygIwlu961sheut92XRw0L4OStYEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WUxZQC63; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=DrYbAeF/DBAGfsthsqCRbLaGggzDcpjeVSk1HFVUxu0=; b=WUxZQC
	63ndJu3cy8ghzOVpHbL/TxVuLnSZDeMa3nmXddnpEcDPGzGWJvTDW5+YbDTI8OhG
	mvBJy3nfTXwUWt26h98bBW2G/974SxMnWVBQpeMkbkIB0QLwgGfqb/w6fG9+CkUY
	fNav8drcTE8XHbiIWGi5zj2+LkXzuYK8TVYlJDGl8vRmbfJxa913Qp0KBgtQGqZQ
	hQvEtlfXIWk/M9a8Z9jq2peeXsXro5pUdeTWUX4PWVTBLhTdE9csqC1+ZPYbC9gA
	XXIMCpogydoswZ8Ky5VXdjyuUkxGINAX5ZlGTCzPSUzxBBKQj7wsPdsv9FyI+big
	24j9SMtKQ/rJ+WPQ==
Received: (qmail 3112640 invoked from network); 10 Mar 2026 08:55:52 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:52 +0100
X-UD-Smtp-Session: l3s3148p1@B5Yn2aZMtpAujntP
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
Subject: [PATCH v4 04/15] hwspinlock: add callback to fill private data of a hwspinlock
Date: Tue, 10 Mar 2026 08:55:19 +0100
Message-ID: <20260310075539.11701-5-wsa+renesas@sang-engineering.com>
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
X-Rspamd-Queue-Id: E0945246C8F
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29102-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Action: no action

To hide internal core structures from providers, a callback is added to
the ops which allows to set the 'priv' field of a hwspinlock. It is
called when a hwspinlock device is registered and, thus, iterated over
all locks. The register-functions are also extended to pass a data
pointer to this callback, so it can do necessary calculations for the
priv field of each hwspinlock. Providers are added only an empty
placeholder and are converted separately because these changes need
dedicated reviews.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c     | 19 +++++++++++++++----
 drivers/hwspinlock/hwspinlock_internal.h | 19 +++++++++++--------
 drivers/hwspinlock/omap_hwspinlock.c     |  2 +-
 drivers/hwspinlock/qcom_hwspinlock.c     |  2 +-
 drivers/hwspinlock/sprd_hwspinlock.c     |  2 +-
 drivers/hwspinlock/stm32_hwspinlock.c    |  2 +-
 drivers/hwspinlock/sun6i_hwspinlock.c    |  2 +-
 include/linux/hwspinlock.h               |  4 ++--
 8 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 2c9eceba7fe8..afe1e7ce2829 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -507,6 +507,7 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -516,10 +517,11 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * Returns: %0 on success, or an appropriate error code on failure
  */
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks)
+		const struct hwspinlock_ops *ops, int base_id, int num_locks,
+		void *init_data)
 {
 	struct hwspinlock *hwlock;
-	int ret = 0, i;
+	int ret, i;
 
 	if (!bank || !ops || !dev || !num_locks || !ops->trylock ||
 							!ops->unlock) {
@@ -538,6 +540,14 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		spin_lock_init(&hwlock->lock);
 		hwlock->bank = bank;
 
+		if (ops->init_priv) {
+			hwlock->priv = ops->init_priv(i, init_data);
+			if (IS_ERR(hwlock->priv)) {
+				ret = PTR_ERR(hwlock->priv);
+				goto reg_failed;
+			}
+		}
+
 		ret = hwspin_lock_register_single(hwlock, base_id + i);
 		if (ret)
 			goto reg_failed;
@@ -633,6 +643,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -644,7 +655,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks)
+			      int base_id, int num_locks, void *init_data)
 {
 	struct hwspinlock_device **ptr;
 	int ret;
@@ -653,7 +664,7 @@ int devm_hwspin_lock_register(struct device *dev,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks);
+	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks, init_data);
 	if (!ret) {
 		*ptr = bank;
 		devres_add(dev, ptr);
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index f298fc0ee5ad..3c835d96bf86 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -18,20 +18,23 @@ struct hwspinlock_device;
 /**
  * struct hwspinlock_ops - platform-specific hwspinlock handlers
  *
- * @trylock: make a single attempt to take the lock. returns 0 on
- *	     failure and true on success. may _not_ sleep.
- * @unlock:  release the lock. always succeed. may _not_ sleep.
- * @bust:    optional, platform-specific bust handler, called by hwspinlock
- *	     core to bust a specific lock.
- * @relax:   optional, platform-specific relax handler, called by hwspinlock
- *	     core while spinning on a lock, between two successive
- *	     invocations of @trylock. may _not_ sleep.
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
  */
 struct hwspinlock_ops {
 	int (*trylock)(struct hwspinlock *lock);
 	void (*unlock)(struct hwspinlock *lock);
 	int (*bust)(struct hwspinlock *lock, unsigned int id);
 	void (*relax)(struct hwspinlock *lock);
+	void *(*init_priv)(int local_id, void *init_data);
 };
 
 /**
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 5bf0061d3fd6..adff502bcbc4 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -120,7 +120,7 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 		bank->lock[i].priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
-						base_id, num_locks);
+						base_id, num_locks, NULL);
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 7ff89c3e8c6b..7960a4972eab 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -236,7 +236,7 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	}
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-					 0, QCOM_MUTEX_NUM_LOCKS);
+					 0, QCOM_MUTEX_NUM_LOCKS, NULL);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 0d08efbdfb07..0b91bdd4303d 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -132,7 +132,7 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 
 	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
 					 &sprd_hwspinlock_ops, 0,
-					 SPRD_HWLOCKS_NUM);
+					 SPRD_HWLOCKS_NUM, NULL);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 1d75dc03f4ad..51e8e533ac31 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -110,7 +110,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
 
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS);
+					0, STM32_MUTEX_NUM_LOCKS, NULL);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 8ff81cb5880a..a0c76bba3f05 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -180,7 +180,7 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks);
+					 SPINLOCK_BASE_ID, priv->nlocks, NULL);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index dffa1dff7289..094a6d0d39d6 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -30,7 +30,7 @@ struct hwspinlock_ops;
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks);
+		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
@@ -49,7 +49,7 @@ int devm_hwspin_lock_unregister(struct device *dev,
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks);
+			      int base_id, int num_locks, void *init_data);
 
 #else /* !CONFIG_HWSPINLOCK */
 
-- 
2.47.3


