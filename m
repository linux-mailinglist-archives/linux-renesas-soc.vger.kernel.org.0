Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CC83640F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Apr 2021 13:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238940AbhDSLvD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 07:51:03 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:46622 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238897AbhDSLu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 07:50:59 -0400
Received: by mail-lf1-f42.google.com with SMTP id 12so55281795lfq.13;
        Mon, 19 Apr 2021 04:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I2GV2luP03v4PFCP8gBNSkHBPCk0UMPJa3Nbp692vdc=;
        b=iJe+Wkg7FlkSc8p9iX9UH538tLWO4HupKQIAmx4z5L0g+x5UeSZBQTTIgd9YqJRdHn
         sVlI4/r507UWuAQiWHXNe+wxHTWMpUn3GmxaWxZO6XrXH+hiphF9RLuVnpTwPuYXIx5C
         bx9h+k3w5/2i9Sy2qln8J4/DE7wm3vPwwP5W9ng3506+t4on5YPSefIZte75pkDnQlj6
         COrVlSCN9Qj1oqg9GG+D0ffqeFANCNIs4c84y4Y86VrmUYJlKJda/A70XCCt5iu+VAas
         iyVZWe4asCtslfuIcNSZwsO/Cnqc9ELXkbYUBzu5lBRdOJZRGUaxiIc7jvSTXAUP3IKE
         o9gw==
X-Gm-Message-State: AOAM532WAXVIwhpbNoGmQW5pW5CXxRs9gd9m1legeXadP8NhygkVX4ka
        8OT86dwALwMsfJ4W/DEbHPI=
X-Google-Smtp-Source: ABdhPJysF+Sptf5XgpWXUlkhrun66cRQKmpkxp3za0YcSguksCAdZ4uIZFn2AbbeckLpiCQZS8tmKQ==
X-Received: by 2002:a05:6512:110d:: with SMTP id l13mr12062966lfg.612.1618833020398;
        Mon, 19 Apr 2021 04:50:20 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id z13sm1806671lfr.285.2021.04.19.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 04:50:20 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:50:13 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Kees Cook <keescook@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: [PATCH v8 05/10] regulator: IRQ based event/error notification
 helpers
Message-ID: <301e14ec377444584a91a2933a1eb56c181206a9.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618832466.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide helper function for IC's implementing regulator notifications
when an IRQ fires. The helper also works for IRQs which can not be acked.
Helper can be set to disable the IRQ at handler and then re-enabling it
on delayed work later. The helper also adds regulator_get_error_flags()
errors in cache for the duration of IRQ disabling.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---
v8 onwards:
 - No changes since v7
v7 (mostly more fixes pointed by Andy)
 - fix regulator error_flags query
 - grammar/typos
 - do not BUG() but attempt to shut-down the system
 - use BITS_PER_TYPE()
v6 (fix issues noted by Andy):
 - remove unnecessary variable
 - use BIT(foo) instead of 1 << foo
 - use devm_add_action_or_reset()
 - do not check the irq parameter validity, leave that to
   request_threaded_irq()
 - put resource-managed function in devres.c
 - fix the kerneldocs for the new IRQ helpers
v5:
 - fix the pr_emerg print
v4:
 - Comment block styling
 - Added prints to point the potential HW failure before BUG()
 - Corrected typo from kerneldoc
 - added missing newlines
---
 drivers/regulator/Makefile       |   2 +-
 drivers/regulator/core.c         |  29 ++-
 drivers/regulator/devres.c       |  52 ++++
 drivers/regulator/irq_helpers.c  | 394 +++++++++++++++++++++++++++++++
 include/linux/regulator/driver.h | 135 +++++++++++
 5 files changed, 604 insertions(+), 8 deletions(-)
 create mode 100644 drivers/regulator/irq_helpers.c

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 44d2f8bf4b74..e25f1c2d6c9b 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -4,7 +4,7 @@
 #
 
 
-obj-$(CONFIG_REGULATOR) += core.o dummy.o fixed-helper.o helpers.o devres.o
+obj-$(CONFIG_REGULATOR) += core.o dummy.o fixed-helper.o helpers.o devres.o irq_helpers.o
 obj-$(CONFIG_OF) += of_regulator.o
 obj-$(CONFIG_REGULATOR_FIXED_VOLTAGE) += fixed.o
 obj-$(CONFIG_REGULATOR_VIRTUAL_CONSUMER) += virtual.o
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 16114aea099a..0c45814aabea 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4388,22 +4388,36 @@ unsigned int regulator_get_mode(struct regulator *regulator)
 }
 EXPORT_SYMBOL_GPL(regulator_get_mode);
 
+static int rdev_get_cached_err_flags(struct regulator_dev *rdev)
+{
+	int ret = 0;
+
+	if (rdev->use_cached_err) {
+		spin_lock(&rdev->err_lock);
+		ret = rdev->cached_err;
+		spin_unlock(&rdev->err_lock);
+	}
+	return ret;
+}
+
 static int _regulator_get_error_flags(struct regulator_dev *rdev,
 					unsigned int *flags)
 {
-	int ret;
+	int cached_flags, ret = 0;
 
 	regulator_lock(rdev);
 
-	/* sanity check */
-	if (!rdev->desc->ops->get_error_flags) {
+	cached_flags = rdev_get_cached_err_flags(rdev);
+
+	if (rdev->desc->ops->get_error_flags)
+		ret = rdev->desc->ops->get_error_flags(rdev, flags);
+	else if (!rdev->use_cached_err)
 		ret = -EINVAL;
-		goto out;
-	}
 
-	ret = rdev->desc->ops->get_error_flags(rdev, flags);
-out:
+	*flags |= cached_flags;
+
 	regulator_unlock(rdev);
+
 	return ret;
 }
 
@@ -5236,6 +5250,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		goto rinse;
 	}
 	device_initialize(&rdev->dev);
+	spin_lock_init(&rdev->err_lock);
 
 	/*
 	 * Duplicate the config so the driver could override it after
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 3091210889e3..a8de0aa88bad 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -481,3 +481,55 @@ void devm_regulator_unregister_notifier(struct regulator *regulator,
 		WARN_ON(rc);
 }
 EXPORT_SYMBOL_GPL(devm_regulator_unregister_notifier);
+
+static void regulator_irq_helper_drop(void *res)
+{
+	regulator_irq_helper_cancel(&res);
+}
+
+/**
+ * devm_regulator_irq_helper - resource managed registration of IRQ based
+ * regulator event/error notifier
+ *
+ * @dev:		device to which lifetime the helper's lifetime is
+ *			bound.
+ * @d:			IRQ helper descriptor.
+ * @irq:		IRQ used to inform events/errors to be notified.
+ * @irq_flags:		Extra IRQ flags to be OR'ed with the default
+ *			IRQF_ONESHOT when requesting the (threaded) irq.
+ * @common_errs:	Errors which can be flagged by this IRQ for all rdevs.
+ *			When IRQ is re-enabled these errors will be cleared
+ *			from all associated regulators
+ * @per_rdev_errs:	Optional error flag array describing errors specific
+ *			for only some of the regulators. These errors will be
+ *			or'ed with common errors. If this is given the array
+ *			should contain rdev_amount flags. Can be set to NULL
+ *			if there is no regulator specific error flags for this
+ *			IRQ.
+ * @rdev:		Array of pointers to regulators associated with this
+ *			IRQ.
+ * @rdev_amount:	Amount of regulators associated with this IRQ.
+ *
+ * Return: handle to irq_helper or an ERR_PTR() encoded error code.
+ */
+void *devm_regulator_irq_helper(struct device *dev,
+				const struct regulator_irq_desc *d, int irq,
+				int irq_flags, int common_errs,
+				int *per_rdev_errs,
+				struct regulator_dev **rdev, int rdev_amount)
+{
+	void *ptr;
+	int ret;
+
+	ptr = regulator_irq_helper(dev, d, irq, irq_flags, common_errs,
+				    per_rdev_errs, rdev, rdev_amount);
+	if (IS_ERR(ptr))
+		return ptr;
+
+	ret = devm_add_action_or_reset(dev, regulator_irq_helper_drop, ptr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return ptr;
+}
+EXPORT_SYMBOL_GPL(devm_regulator_irq_helper);
diff --git a/drivers/regulator/irq_helpers.c b/drivers/regulator/irq_helpers.c
new file mode 100644
index 000000000000..f57abb96e74c
--- /dev/null
+++ b/drivers/regulator/irq_helpers.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2021 ROHM Semiconductors
+// regulator IRQ based event notification helpers
+//
+// Logic has been partially adapted from qcom-labibb driver.
+//
+// Author: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/regulator/driver.h>
+
+#define REGULATOR_FORCED_SAFETY_SHUTDOWN_WAIT_MS 10000
+
+struct regulator_irq {
+	struct regulator_irq_data rdata;
+	struct regulator_irq_desc desc;
+	int irq;
+	int retry_cnt;
+	struct delayed_work isr_work;
+};
+
+/*
+ * Should only be called from threaded handler to prevent potential deadlock
+ */
+static void rdev_flag_err(struct regulator_dev *rdev, int err)
+{
+	spin_lock(&rdev->err_lock);
+	rdev->cached_err |= err;
+	spin_unlock(&rdev->err_lock);
+}
+
+static void rdev_clear_err(struct regulator_dev *rdev, int err)
+{
+	spin_lock(&rdev->err_lock);
+	rdev->cached_err &= ~err;
+	spin_unlock(&rdev->err_lock);
+}
+
+static void regulator_notifier_isr_work(struct work_struct *work)
+{
+	struct regulator_irq *h;
+	struct regulator_irq_desc *d;
+	struct regulator_irq_data *rid;
+	int ret = 0;
+	int tmo, i;
+	int num_rdevs;
+
+	h = container_of(work, struct regulator_irq,
+			    isr_work.work);
+	d = &h->desc;
+	rid = &h->rdata;
+	num_rdevs = rid->num_states;
+
+reread:
+	if (d->fatal_cnt && h->retry_cnt > d->fatal_cnt) {
+		if (!d->die)
+			return hw_protection_shutdown("Regulator HW failure? - no IC recovery",
+						      REGULATOR_FORCED_SAFETY_SHUTDOWN_WAIT_MS);
+		ret = d->die(rid);
+		/*
+		 * If the 'last resort' IC recovery failed we will have
+		 * nothing else left to do...
+		 */
+		if (ret)
+			return hw_protection_shutdown("Regulator HW failure. IC recovery failed",
+						      REGULATOR_FORCED_SAFETY_SHUTDOWN_WAIT_MS);
+
+		/*
+		 * If h->die() was implemented we assume recovery has been
+		 * attempted (probably regulator was shut down) and we
+		 * just enable IRQ and bail-out.
+		 */
+		goto enable_out;
+	}
+	if (d->renable) {
+		ret = d->renable(rid);
+
+		if (ret == REGULATOR_FAILED_RETRY) {
+			/* Driver could not get current status */
+			h->retry_cnt++;
+			if (!d->reread_ms)
+				goto reread;
+
+			tmo = d->reread_ms;
+			goto reschedule;
+		}
+
+		if (ret) {
+			/*
+			 * IC status reading succeeded. update error info
+			 * just in case the renable changed it.
+			 */
+			for (i = 0; i < num_rdevs; i++) {
+				struct regulator_err_state *stat;
+				struct regulator_dev *rdev;
+
+				stat = &rid->states[i];
+				rdev = stat->rdev;
+				rdev_clear_err(rdev, (~stat->errors) &
+						      stat->possible_errs);
+			}
+			h->retry_cnt++;
+			/*
+			 * The IC indicated problem is still ON - no point in
+			 * re-enabling the IRQ. Retry later.
+			 */
+			tmo = d->irq_off_ms;
+			goto reschedule;
+		}
+	}
+
+	/*
+	 * Either IC reported problem cleared or no status checker was provided.
+	 * If problems are gone - good. If not - then the IRQ will fire again
+	 * and we'll have a new nice loop. In any case we should clear error
+	 * flags here and re-enable IRQs.
+	 */
+	for (i = 0; i < num_rdevs; i++) {
+		struct regulator_err_state *stat;
+		struct regulator_dev *rdev;
+
+		stat = &rid->states[i];
+		rdev = stat->rdev;
+		rdev_clear_err(rdev, stat->possible_errs);
+	}
+
+	/*
+	 * Things have been seemingly successful => zero retry-counter.
+	 */
+	h->retry_cnt = 0;
+
+enable_out:
+	enable_irq(h->irq);
+
+	return;
+
+reschedule:
+	if (!d->high_prio)
+		mod_delayed_work(system_wq, &h->isr_work,
+				 msecs_to_jiffies(tmo));
+	else
+		mod_delayed_work(system_highpri_wq, &h->isr_work,
+				 msecs_to_jiffies(tmo));
+}
+
+static irqreturn_t regulator_notifier_isr(int irq, void *data)
+{
+	struct regulator_irq *h = data;
+	struct regulator_irq_desc *d;
+	struct regulator_irq_data *rid;
+	unsigned long rdev_map = 0;
+	int num_rdevs;
+	int ret, i, j;
+
+	d = &h->desc;
+	rid = &h->rdata;
+	num_rdevs = rid->num_states;
+
+	if (d->fatal_cnt)
+		h->retry_cnt++;
+
+	/*
+	 * we spare a few cycles by not clearing statuses prior to this call.
+	 * The IC driver must initialize the status buffers for rdevs
+	 * which it indicates having active events via rdev_map.
+	 *
+	 * Maybe we should just to be on a safer side(?)
+	 */
+	ret = d->map_event(irq, rid, &rdev_map);
+
+	/*
+	 * If status reading fails (which is unlikely) we don't ack/disable
+	 * IRQ but just increase fail count and retry when IRQ fires again.
+	 * If retry_count exceeds the given safety limit we call IC specific die
+	 * handler which can try disabling regulator(s).
+	 *
+	 * If no die handler is given we will just bug() as a last resort.
+	 *
+	 * We could try disabling all associated rdevs - but we might shoot
+	 * ourselves in the head and leave the problematic regulator enabled. So
+	 * if IC has no die-handler populated we just assume the regulator
+	 * can't be disabled.
+	 */
+	if (unlikely(ret == REGULATOR_FAILED_RETRY))
+		goto fail_out;
+
+	h->retry_cnt = 0;
+	/*
+	 * Let's not disable IRQ if there were no status bits for us. We'd
+	 * better leave spurious IRQ handling to genirq
+	 */
+	if (ret || !rdev_map)
+		return IRQ_NONE;
+
+	/*
+	 * Some events are bogus if the regulator is disabled. Skip such events
+	 * if all relevant regulators are disabled
+	 */
+	if (d->skip_off) {
+		for_each_set_bit(i, &rdev_map, num_rdevs) {
+			struct regulator_dev *rdev;
+			const struct regulator_ops *ops;
+
+			rdev = rid->states[i].rdev;
+			ops = rdev->desc->ops;
+
+			/*
+			 * If any of the flagged regulators is enabled we do
+			 * handle this
+			 */
+			if (ops->is_enabled(rdev))
+				break;
+		}
+		if (i == num_rdevs)
+			return IRQ_NONE;
+	}
+
+	/* Disable IRQ if HW keeps line asserted */
+	if (d->irq_off_ms)
+		disable_irq_nosync(irq);
+
+	/*
+	 * IRQ seems to be for us. Let's fire correct notifiers / store error
+	 * flags
+	 */
+	for_each_set_bit(i, &rdev_map, num_rdevs) {
+		struct regulator_err_state *stat;
+		struct regulator_dev *rdev;
+
+		stat = &rid->states[i];
+		rdev = stat->rdev;
+
+		for_each_set_bit(j, &stat->notifs, BITS_PER_TYPE(stat->notifs))
+			regulator_notifier_call_chain(rdev, BIT(j - 1), NULL);
+
+		rdev_flag_err(rdev, stat->errors);
+	}
+
+	if (d->irq_off_ms) {
+		if (!d->high_prio)
+			schedule_delayed_work(&h->isr_work,
+					      msecs_to_jiffies(d->irq_off_ms));
+		else
+			mod_delayed_work(system_highpri_wq,
+					 &h->isr_work,
+					 msecs_to_jiffies(d->irq_off_ms));
+	}
+
+	return IRQ_HANDLED;
+
+fail_out:
+	if (d->fatal_cnt && h->retry_cnt > d->fatal_cnt) {
+		/* If we have no recovery, just try shut down straight away */
+		if (!d->die) {
+			hw_protection_shutdown("Regulator failure. Retry count exceeded",
+					       REGULATOR_FORCED_SAFETY_SHUTDOWN_WAIT_MS);
+		} else {
+			ret = d->die(rid);
+			/* If die() failed shut down as a last attempt to save the HW */
+			if (ret)
+				hw_protection_shutdown("Regulator failure. Recovery failed",
+						       REGULATOR_FORCED_SAFETY_SHUTDOWN_WAIT_MS);
+		}
+	}
+
+	return IRQ_NONE;
+}
+
+static int init_rdev_state(struct device *dev, struct regulator_irq *h,
+			   struct regulator_dev **rdev, int common_err,
+			   int *rdev_err, int rdev_amount)
+{
+	int i;
+
+	h->rdata.states = devm_kzalloc(dev, sizeof(*h->rdata.states) *
+				       rdev_amount, GFP_KERNEL);
+	if (!h->rdata.states)
+		return -ENOMEM;
+
+	h->rdata.num_states = rdev_amount;
+	h->rdata.data = h->desc.data;
+
+	for (i = 0; i < rdev_amount; i++) {
+		h->rdata.states[i].possible_errs = common_err;
+		if (rdev_err)
+			h->rdata.states[i].possible_errs |= *rdev_err++;
+		h->rdata.states[i].rdev = *rdev++;
+	}
+
+	return 0;
+}
+
+static void init_rdev_errors(struct regulator_irq *h)
+{
+	int i;
+
+	for (i = 0; i < h->rdata.num_states; i++)
+		if (h->rdata.states[i].possible_errs)
+			h->rdata.states[i].rdev->use_cached_err = true;
+}
+
+/**
+ * regulator_irq_helper - register IRQ based regulator event/error notifier
+ *
+ * @dev:		device providing the IRQs
+ * @d:			IRQ helper descriptor.
+ * @irq:		IRQ used to inform events/errors to be notified.
+ * @irq_flags:		Extra IRQ flags to be OR'ed with the default
+ *			IRQF_ONESHOT when requesting the (threaded) irq.
+ * @common_errs:	Errors which can be flagged by this IRQ for all rdevs.
+ *			When IRQ is re-enabled these errors will be cleared
+ *			from all associated regulators
+ * @per_rdev_errs:	Optional error flag array describing errors specific
+ *			for only some of the regulators. These errors will be
+ *			or'ed with common errors. If this is given the array
+ *			should contain rdev_amount flags. Can be set to NULL
+ *			if there is no regulator specific error flags for this
+ *			IRQ.
+ * @rdev:		Array of pointers to regulators associated with this
+ *			IRQ.
+ * @rdev_amount:	Amount of regulators associated with this IRQ.
+ *
+ * Return: handle to irq_helper or an ERR_PTR() encoded error code.
+ */
+void *regulator_irq_helper(struct device *dev,
+			   const struct regulator_irq_desc *d, int irq,
+			   int irq_flags, int common_errs, int *per_rdev_errs,
+			   struct regulator_dev **rdev, int rdev_amount)
+{
+	struct regulator_irq *h;
+	int ret;
+
+	if (!rdev_amount || !d || !d->map_event || !d->name)
+		return ERR_PTR(-EINVAL);
+
+	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return ERR_PTR(-ENOMEM);
+
+	h->irq = irq;
+	h->desc = *d;
+
+	ret = init_rdev_state(dev, h, rdev, common_errs, per_rdev_errs,
+			      rdev_amount);
+	if (ret)
+		return ERR_PTR(ret);
+
+	init_rdev_errors(h);
+
+	if (h->desc.irq_off_ms)
+		INIT_DELAYED_WORK(&h->isr_work, regulator_notifier_isr_work);
+
+	ret = request_threaded_irq(h->irq, NULL, regulator_notifier_isr,
+				   IRQF_ONESHOT | irq_flags, h->desc.name, h);
+	if (ret) {
+		dev_err(dev, "Failed to request IRQ %d\n", irq);
+
+		return ERR_PTR(ret);
+	}
+
+	return h;
+}
+EXPORT_SYMBOL_GPL(regulator_irq_helper);
+
+/**
+ * regulator_irq_helper_cancel - drop IRQ based regulator event/error notifier
+ *
+ * @handle:		Pointer to handle returned by a successful call to
+ *			regulator_irq_helper(). Will be NULLed upon return.
+ *
+ * The associated IRQ is released and work is cancelled when the function
+ * returns.
+ */
+void regulator_irq_helper_cancel(void **handle)
+{
+	if (handle && *handle) {
+		struct regulator_irq *h = *handle;
+
+		free_irq(h->irq, h);
+		if (h->desc.irq_off_ms)
+			cancel_delayed_work_sync(&h->isr_work);
+
+		h = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(regulator_irq_helper_cancel);
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index d7c77ee370f3..c2ef1c35a5dd 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -409,6 +409,128 @@ struct regulator_config {
 	struct gpio_desc *ena_gpiod;
 };
 
+/**
+ * struct regulator_err_state - regulator error/notification status
+ *
+ * @rdev:		Regulator which status the struct indicates.
+ * @notifs:		Events which have occurred on the regulator.
+ * @errors:		Errors which are active on the regulator.
+ * @possible_errs:	Errors which can be signaled (by given IRQ).
+ */
+struct regulator_err_state {
+	struct regulator_dev *rdev;
+	unsigned long notifs;
+	unsigned long errors;
+	int possible_errs;
+};
+
+/**
+ * struct regulator_irq_data - regulator error/notification status date
+ *
+ * @states:	Status structs for each of the associated regulators.
+ * @num_states:	Amount of associated regulators.
+ * @data:	Driver data pointer given at regulator_irq_desc.
+ * @opaque:	Value storage for IC driver. Core does not update this. ICs
+ *		may want to store status register value here at map_event and
+ *		compare contents at 'renable' callback to see if new problems
+ *		have been added to status. If that is the case it may be
+ *		desirable to return REGULATOR_ERROR_CLEARED and not
+ *		REGULATOR_ERROR_ON to allow IRQ fire again and to generate
+ *		notifications also for the new issues.
+ *
+ * This structure is passed to 'map_event' and 'renable' callbacks for
+ * reporting regulator status to core.
+ */
+struct regulator_irq_data {
+	struct regulator_err_state *states;
+	int num_states;
+	void *data;
+	long opaque;
+};
+
+/**
+ * struct regulator_irq_desc - notification sender for IRQ based events.
+ *
+ * @name:	The visible name for the IRQ
+ * @fatal_cnt:	If this IRQ is used to signal HW damaging condition it may be
+ *		best to shut-down regulator(s) or reboot the SOC if error
+ *		handling is repeatedly failing. If fatal_cnt is given the IRQ
+ *		handling is aborted if it fails for fatal_cnt times and die()
+ *		callback (if populated) or BUG() is called to try to prevent
+ *		further damage.
+ * @reread_ms:	The time which is waited before attempting to re-read status
+ *		at the worker if IC reading fails. Immediate re-read is done
+ *		if time is not specified.
+ * @irq_off_ms:	The time which IRQ is kept disabled before re-evaluating the
+ *		status for devices which keep IRQ disabled for duration of the
+ *		error. If this is not given the IRQ is left enabled and renable
+ *		is not called.
+ * @skip_off:	If set to true the IRQ handler will attempt to check if any of
+ *		the associated regulators are enabled prior to taking other
+ *		actions. If no regulators are enabled and this is set to true
+ *		a spurious IRQ is assumed and IRQ_NONE is returned.
+ * @high_prio:	Boolean to indicate that high priority WQ should be used.
+ * @data:	Driver private data pointer which will be passed as such to
+ *		the renable, map_event and die callbacks in regulator_irq_data.
+ * @die:	Protection callback. If IC status reading or recovery actions
+ *		fail fatal_cnt times this callback or BUG() is called. This
+ *		callback should implement a final protection attempt like
+ *		disabling the regulator. If protection succeeded this may
+ *		return 0. If anything else is returned the core assumes final
+ *		protection failed and calls BUG() as a last resort.
+ * @map_event:	Driver callback to map IRQ status into regulator devices with
+ *		events / errors. NOTE: callback MUST initialize both the
+ *		errors and notifs for all rdevs which it signals having
+ *		active events as core does not clean the map data.
+ *		REGULATOR_FAILED_RETRY can be returned to indicate that the
+ *		status reading from IC failed. If this is repeated for
+ *		fatal_cnt times the core will call die() callback or BUG()
+ *		as a last resort to protect the HW.
+ * @renable:	Optional callback to check status (if HW supports that) before
+ *		re-enabling IRQ. If implemented this should clear the error
+ *		flags so that errors fetched by regulator_get_error_flags()
+ *		are updated. If callback is not implemented then errors are
+ *		assumed to be cleared and IRQ is re-enabled.
+ *		REGULATOR_FAILED_RETRY can be returned to
+ *		indicate that the status reading from IC failed. If this is
+ *		repeated for 'fatal_cnt' times the core will call die()
+ *		callback or BUG() as a last resort to protect the HW.
+ *		Returning zero indicates that the problem in HW has been solved
+ *		and IRQ will be re-enabled. Returning REGULATOR_ERROR_ON
+ *		indicates the error condition is still active and keeps IRQ
+ *		disabled. Please note that returning REGULATOR_ERROR_ON does
+ *		not retrigger evaluating what events are active or resending
+ *		notifications. If this is needed you probably want to return
+ *		zero and allow IRQ to retrigger causing events to be
+ *		re-evaluated and re-sent.
+ *
+ * This structure is used for registering regulator IRQ notification helper.
+ */
+struct regulator_irq_desc {
+	const char *name;
+	int irq_flags;
+	int fatal_cnt;
+	int reread_ms;
+	int irq_off_ms;
+	bool skip_off;
+	bool high_prio;
+	void *data;
+
+	int (*die)(struct regulator_irq_data *rid);
+	int (*map_event)(int irq, struct regulator_irq_data *rid,
+			  unsigned long *dev_mask);
+	int (*renable)(struct regulator_irq_data *rid);
+};
+
+/*
+ * Return values for regulator IRQ helpers.
+ */
+enum {
+	REGULATOR_ERROR_CLEARED,
+	REGULATOR_FAILED_RETRY,
+	REGULATOR_ERROR_ON,
+};
+
 /*
  * struct coupling_desc
  *
@@ -473,6 +595,9 @@ struct regulator_dev {
 
 	/* time when this regulator was disabled last time */
 	unsigned long last_off_jiffy;
+	int cached_err;
+	bool use_cached_err;
+	spinlock_t err_lock;
 };
 
 struct regulator_dev *
@@ -487,6 +612,16 @@ void devm_regulator_unregister(struct device *dev, struct regulator_dev *rdev);
 
 int regulator_notifier_call_chain(struct regulator_dev *rdev,
 				  unsigned long event, void *data);
+void *devm_regulator_irq_helper(struct device *dev,
+				const struct regulator_irq_desc *d, int irq,
+				int irq_flags, int common_errs,
+				int *per_rdev_errs, struct regulator_dev **rdev,
+				int rdev_amount);
+void *regulator_irq_helper(struct device *dev,
+			   const struct regulator_irq_desc *d, int irq,
+			   int irq_flags, int common_errs, int *per_rdev_errs,
+			   struct regulator_dev **rdev, int rdev_amount);
+void regulator_irq_helper_cancel(void **handle);
 
 void *rdev_get_drvdata(struct regulator_dev *rdev);
 struct device *rdev_get_dev(struct regulator_dev *rdev);
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
