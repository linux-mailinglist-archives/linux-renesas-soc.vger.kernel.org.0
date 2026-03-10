Return-Path: <linux-renesas-soc+bounces-29107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCX4Iw3Pr2kfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:58:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD3246C81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C98AA3067B0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 07:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315633D349A;
	Tue, 10 Mar 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JeDwJroC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BF5366062
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129384; cv=none; b=eaEIqJ8zeI6twXzXAwKENdTMdLDyaCoNosgm7dNr/nA0gFWntlWfknQMDMlWaAP9SqvOUtRsZ7wmIBeKUcTCgXegckKmU2GVOkoE/bFR8WKaz1i1oouEJxvBt2Ws6X+bSeLF4RL3erbl8ackC3Ur56qSamP9FxaBcp+Mk5BtZ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129384; c=relaxed/simple;
	bh=AlOrengIMhbczEUUr+bbQBX5sdtAkgzqbeSlazfayXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWhFN8zuVELnYP3jpIM1YDQzNlwSUjWwqtqoikvR9zBI0NlJu3yQHxXYGhlhMg7v7U1am2F6AmVdJSTqf64Rlt9QUlPXYI0+Z6occ6bgTpWaxwAWnLle95+PSBEMb/+wLbMtEq/PUb5jiKKy6alwcpfmjz/acf2EiF3aSyT8Dwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JeDwJroC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EMGJQBKk3iRQb/TPpDntOCN2HXfcMFp2fpsLhTqCbd4=; b=JeDwJr
	oC5Qe93RjiDvMZBM9yNPNucdSc8YUUK/dmMzTJssnf+Rnkle3RTVkUd/zM9XHBu/
	BEkCfN1m3N2W0HgitJyyYPu6aZiIzlohzfucQcds8kMhXUBsAtGoAjUgFZL/nwv0
	g6rXG0pEuZ6U4VUSCTleHt5X3odrIKWsLFssAdV+OsPyWAp3qPzkRhFLqwTgri1m
	4F/8jbyFN85NnZDMoDOxCR8hW1pDsPsQhvOKDqDyDKl1bqNUj5dZZZOYTcpvkTaj
	eIFzwnMZgLhtcg2oglSuPar9vWgeT7ZY6chmAovmgc0tiJPL8Vbo853Wqt2V2BZ3
	9LBAYI358hZBtGfw==
Received: (qmail 3112752 invoked from network); 10 Mar 2026 08:55:56 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:56 +0100
X-UD-Smtp-Session: l3s3148p1@I0xx2aZM3NIujntP
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
Subject: [PATCH v4 10/15] hwspinlock: handle hwspinlock device allocation in the core
Date: Tue, 10 Mar 2026 08:55:25 +0100
Message-ID: <20260310075539.11701-11-wsa+renesas@sang-engineering.com>
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
X-Rspamd-Queue-Id: 16BD3246C81
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
	TAGGED_FROM(0.00)[bounces-29107-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Action: no action

Providers have been refactored to avoid using core internal structures.
As a result, they do not need to allocate the hwspinlock device on their
own anymore because they can access everything they need with helpers.

So, the allocation is moved to the core. As a result, the registering
functions now return a pointer to the (soon) opaque hwspinlock device
which may be needed for unregistering only.

Because the argument list of the registering functions is changed, all
users are changed here as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c  | 48 +++++++++++++++------------
 drivers/hwspinlock/omap_hwspinlock.c  | 10 ++----
 drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++----
 drivers/hwspinlock/sprd_hwspinlock.c  | 17 ++++------
 drivers/hwspinlock/stm32_hwspinlock.c |  7 ++--
 drivers/hwspinlock/sun6i_hwspinlock.c | 12 ++-----
 include/linux/hwspinlock.h            | 17 ++++++----
 7 files changed, 52 insertions(+), 70 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index afe1e7ce2829..a7610ba755b4 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/slab.h>
 
 #include "hwspinlock_internal.h"
 
@@ -502,7 +503,6 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
 
 /**
  * hwspin_lock_register() - register a new hw spinlock device
- * @bank: the hwspinlock device, which usually provides numerous hw locks
  * @dev: the backing device
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
@@ -514,21 +514,25 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  *
  * Should be called from a process context (might sleep)
  *
- * Returns: %0 on success, or an appropriate error code on failure
+ * Returns: a pointer to the device (needed for unregistering), or an
+ * appropriate error pointer on failure
  */
-int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks,
-		void *init_data)
+struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+					       int base_id, int num_locks, void *init_data)
 {
+	struct hwspinlock_device *bank;
 	struct hwspinlock *hwlock;
 	int ret, i;
 
-	if (!bank || !ops || !dev || !num_locks || !ops->trylock ||
-							!ops->unlock) {
+	if (!ops || !dev || !num_locks || !ops->trylock || !ops->unlock) {
 		pr_err("invalid parameters\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
+	bank = kzalloc(struct_size(bank, lock, num_locks), GFP_KERNEL);
+	if (!bank)
+		return ERR_PTR(-ENOMEM);
+
 	bank->dev = dev;
 	bank->ops = ops;
 	bank->base_id = base_id;
@@ -553,12 +557,13 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 			goto reg_failed;
 	}
 
-	return 0;
+	return bank;
 
 reg_failed:
 	while (--i >= 0)
 		hwspin_lock_unregister_single(base_id + i);
-	return ret;
+	kfree(bank);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_register);
 
@@ -589,6 +594,8 @@ int hwspin_lock_unregister(struct hwspinlock_device *bank)
 		WARN_ON(tmp != hwlock);
 	}
 
+	kfree(bank);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_unregister);
@@ -639,7 +646,6 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  * devm_hwspin_lock_register() - register a new hw spinlock device for
  *				 a managed device
  * @dev: the backing device
- * @bank: the hwspinlock device, which usually provides numerous hw locks
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
@@ -650,29 +656,27 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  *
  * Should be called from a process context (might sleep)
  *
- * Returns: %0 on success, or an appropriate error code on failure
+ * Returns: a pointer to the device (usable for unregistering), or an
+ * appropriate error pointer on failure
  */
-int devm_hwspin_lock_register(struct device *dev,
-			      struct hwspinlock_device *bank,
-			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks, void *init_data)
+struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+						    int base_id, int num_locks, void *init_data)
 {
-	struct hwspinlock_device **ptr;
-	int ret;
+	struct hwspinlock_device **ptr, *bank;
 
 	ptr = devres_alloc(devm_hwspin_lock_unreg, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks, init_data);
-	if (!ret) {
+	bank = hwspin_lock_register(dev, ops, base_id, num_locks, init_data);
+	if (!IS_ERR(bank)) {
 		*ptr = bank;
 		devres_add(dev, ptr);
 	} else {
 		devres_free(ptr);
 	}
 
-	return ret;
+	return bank;
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_register);
 
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 868b93131796..87ab30614e1d 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -80,7 +80,6 @@ static const struct hwspinlock_ops omap_hwspinlock_ops = {
 
 static int omap_hwspinlock_probe(struct platform_device *pdev)
 {
-	struct hwspinlock_device *bank;
 	void __iomem *io_base;
 	int num_locks, i, ret;
 	/* Only a single hwspinlock block device is supported */
@@ -117,13 +116,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 
 	num_locks = i * 32; /* actual number of locks in this device */
 
-	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
-			    GFP_KERNEL);
-	if (!bank)
-		return -ENOMEM;
-
-	return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
-					 base_id, num_locks, io_base + LOCK_BASE_OFFSET);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &omap_hwspinlock_ops, base_id,
+					       num_locks, io_base + LOCK_BASE_OFFSET);
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 73b280988109..e2836d6728e8 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -223,9 +223,7 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct qcom_hwspinlock_priv_init_data init;
-	struct hwspinlock_device *bank;
 	struct regmap *regmap;
-	size_t array_size;
 
 	regmap = qcom_hwspinlock_probe_syscon(pdev, &init.base, &init.stride);
 	if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
@@ -234,16 +232,11 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	array_size = QCOM_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
-	bank = devm_kzalloc(&pdev->dev, sizeof(*bank) + array_size, GFP_KERNEL);
-	if (!bank)
-		return -ENOMEM;
-
 	init.dev = &pdev->dev;
 	init.regmap = regmap;
 
-	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-					 0, QCOM_MUTEX_NUM_LOCKS, &init);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &qcom_hwspinlock_ops,
+					       0, QCOM_MUTEX_NUM_LOCKS, &init);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index f906f5fa74ef..bbae37e25243 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -33,15 +33,14 @@
 struct sprd_hwspinlock_dev {
 	void __iomem *base;
 	struct clk *clk;
-	struct hwspinlock_device bank;
 };
 
 /* try to lock the hardware spinlock */
 static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	struct sprd_hwspinlock_dev *sprd_hwlock =
-		dev_get_drvdata(hwspin_lock_get_dev(lock));
 	void __iomem *addr = hwspin_lock_get_priv(lock);
+	struct device *dev = hwspin_lock_get_dev(lock);
+	struct sprd_hwspinlock_dev *sprd_hwlock = dev_get_drvdata(dev);
 	int user_id, lock_id;
 
 	if (!readl(addr))
@@ -50,8 +49,7 @@ static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 	lock_id = hwlock_to_id(lock);
 	/* get the hardware spinlock master/user id */
 	user_id = readl(sprd_hwlock->base + HWSPINLOCK_MASTERID(lock_id));
-	dev_warn(sprd_hwlock->bank.dev,
-		 "hwspinlock [%d] lock failed and master/user id = %d!\n",
+	dev_warn(dev, "hwspinlock [%d] lock failed and master/user id = %d!\n",
 		 lock_id, user_id);
 	return 0;
 }
@@ -97,9 +95,7 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	sprd_hwlock = devm_kzalloc(&pdev->dev,
-				   struct_size(sprd_hwlock, bank.lock, SPRD_HWLOCKS_NUM),
-				   GFP_KERNEL);
+	sprd_hwlock = devm_kzalloc(&pdev->dev, sizeof(*sprd_hwlock), GFP_KERNEL);
 	if (!sprd_hwlock)
 		return -ENOMEM;
 
@@ -130,9 +126,8 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sprd_hwlock);
 
-	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
-					 &sprd_hwspinlock_ops, 0,
-					 SPRD_HWLOCKS_NUM, sprd_hwlock->base);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &sprd_hwspinlock_ops, 0,
+					       SPRD_HWLOCKS_NUM, sprd_hwlock->base);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 62214f31f909..ed937bc26bf5 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -22,7 +22,6 @@
 
 struct stm32_hwspinlock {
 	struct clk *clk;
-	struct hwspinlock_device bank;
 };
 
 static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
@@ -85,7 +84,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
-	hw = devm_kzalloc(dev, struct_size(hw, bank.lock, STM32_MUTEX_NUM_LOCKS), GFP_KERNEL);
+	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
 	if (!hw)
 		return -ENOMEM;
 
@@ -112,8 +111,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS, io_base);
+	ret = devm_hwspin_lock_register_errno(dev, &stm32_hwspinlock_ops,
+					      0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c3db81cb1793..8bbed23af5f4 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -27,7 +27,6 @@
 #define SPINLOCK_NOTTAKEN	0
 
 struct sun6i_hwspinlock_data {
-	struct hwspinlock_device *bank;
 	struct reset_control *reset;
 	struct clk *ahb_clk;
 	struct dentry *debugfs;
@@ -159,13 +158,6 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	priv->bank = devm_kzalloc(&pdev->dev, struct_size(priv->bank, lock, priv->nlocks),
-				  GFP_KERNEL);
-	if (!priv->bank) {
-		err = -ENOMEM;
-		goto bank_fail;
-	}
-
 	/* failure of debugfs is considered non-fatal */
 	sun6i_hwspinlock_debugfs_init(priv);
 	if (IS_ERR(priv->debugfs))
@@ -177,8 +169,8 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
+	return devm_hwspin_lock_register_errno(&pdev->dev, &sun6i_hwspinlock_ops, SPINLOCK_BASE_ID,
+					       priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 094a6d0d39d6..58733cda7a9a 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -29,8 +29,8 @@ struct hwspinlock_ops;
 
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
-int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
+struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+					       int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
@@ -46,10 +46,15 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
 int devm_hwspin_lock_unregister(struct device *dev,
 				struct hwspinlock_device *bank);
-int devm_hwspin_lock_register(struct device *dev,
-			      struct hwspinlock_device *bank,
-			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks, void *init_data);
+struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+						    int base_id, int num_locks, void *init_data);
+
+static inline int devm_hwspin_lock_register_errno(struct device *dev,
+						  const struct hwspinlock_ops *ops,
+						  int base_id, int num_locks, void *init_data)
+{
+	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
+}
 
 #else /* !CONFIG_HWSPINLOCK */
 
-- 
2.47.3


