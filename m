Return-Path: <linux-renesas-soc+bounces-27391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Lz0BGFmdmkmQQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 19:52:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE481D71
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 19:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21A7D30099AB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 18:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA11248880;
	Sun, 25 Jan 2026 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mGXwa/qK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC862EFD98
	for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Jan 2026 18:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769367126; cv=none; b=NtxxBtsmdK8pMiYy6LWFfdngQ3RYYV5GU7/vGvbviG1idM2gHu3iQw8I2SJ0goTJ+wgujR2J5akhxgzcAM98R7Ht/ELjD5lDz4JDyUGyXe4aL23Vwh2m4Qs8XWTM/atqdv0K2EEMYIhXGiDMKXeXU5YLZe/v7x+PLc43wuioBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769367126; c=relaxed/simple;
	bh=+ZFxxMRGV+er1uLUbHWg8rtRWekQt6lAB9fazqpja64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3RSAoR0KrvROmhrgq3DsAL4+GRQGcBsycN5YWdF2KNIQV7rlfZkJCBlwfTIZ7eQYVd3cnKxBCEq7lSpds2ueBx7awtmxXi8tQ7qBTSGDdvsIkw0QEr0Rvd2fppJPx1d1DTlv3HY1V4Um/S+9cqOZdOD81Z+HbF5BVvS5ZoXPFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mGXwa/qK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2i01eb/5KZjgjDIKy97zZFmKpp66oep0XQIYt28IYWU=; b=mGXwa/
	qK5HINp7hvh+Mqu6YFodSCrhRbO4GYXO9l4XKuGAcYTfJuESBdPdyZNczNfDy7sA
	P8a5Mnf+5qN3fHNvJXpQOwyMZGNonK9LCOYfbqgZBqIeAcQmNxnlvQK3NFDjNwb4
	TmAImyhnKxBv+kLq31nNQb8Lu6VrsathR+o1VT4+GRGBWZCG44hVAvqAoJqPBM8D
	LbvXgn7RP/wWKGCkYdvj9+X1Vo3cx9L9GuDzMlz/wqvNvQp+Ldl4oPhP+yrUvxRl
	7eZtDncLrhjmt/syscDaPXWBD4zVV20mSX+y3itzE0CScbSXpsrpjQsVQx5SpMz/
	U1PfFDVN8jKMuC4Q==
Received: (qmail 2369592 invoked from network); 25 Jan 2026 19:51:51 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2026 19:51:51 +0100
X-UD-Smtp-Session: l3s3148p1@BkUn4jpJWhBtKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 2/4] hwspinlock: refactor existing headers into consumer.h
Date: Sun, 25 Jan 2026 19:46:53 +0100
Message-ID: <20260125184654.17843-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-27391-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,linux.alibaba.com,infradead.org,redhat.com,gmail.com,lwn.net,linuxfoundation.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C1AE481D71
X-Rspamd-Action: no action

The ultimate goal is to allow hwspinlock drivers outside of the
hwspinlock directory. So, the public and the internal header get
refactored into a more modern public provider/consumer pair. This patch
creates the consumer header. It is a plain move without functional
changes. Only the hwspinlock internal users are converted. The old
headerfile still exists as a plain link to the new one until all users
are converted. Documentation gets updated, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/locking/hwspinlock.rst          |   2 +-
 drivers/hwspinlock/hwspinlock_core.c          |   2 +-
 drivers/hwspinlock/u8500_hsem.c               |   2 +-
 include/linux/hwspinlock.h                    | 438 +-----------------
 .../{hwspinlock.h => hwspinlock/consumer.h}   |   8 +-
 5 files changed, 11 insertions(+), 441 deletions(-)
 rewrite include/linux/hwspinlock.h (99%)
 copy include/linux/{hwspinlock.h => hwspinlock/consumer.h} (98%)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1..001bcab86690 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -306,7 +306,7 @@ Typical usage
 
 ::
 
-	#include <linux/hwspinlock.h>
+	#include <linux/hwspinlock/consumer.h>
 	#include <linux/err.h>
 
 	int hwspinlock_example(void)
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 3ee4f4357e01..cafe204728f5 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -17,7 +17,7 @@
 #include <linux/err.h>
 #include <linux/jiffies.h>
 #include <linux/radix-tree.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/hwspinlock/provider.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index ff0730613929..de456b859ac7 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -18,7 +18,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/consumer.h>
 #include <linux/hwspinlock/provider.h>
 #include <linux/platform_device.h>
 
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
dissimilarity index 99%
index 7f38960c7162..7220f7f2368b 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -1,434 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Hardware spinlock public header
- *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
- */
-
-#ifndef __LINUX_HWSPINLOCK_H
-#define __LINUX_HWSPINLOCK_H
-
-#include <linux/err.h>
-#include <linux/sched.h>
-
-/* hwspinlock mode argument */
-#define HWLOCK_IRQSTATE		0x01 /* Disable interrupts, save state */
-#define HWLOCK_IRQ		0x02 /* Disable interrupts, don't save state */
-#define HWLOCK_RAW		0x03
-#define HWLOCK_IN_ATOMIC	0x04 /* Called while in atomic context */
-
-struct device;
-struct device_node;
-struct hwspinlock;
-struct hwspinlock_device;
-struct hwspinlock_ops;
-
-/**
- * struct hwspinlock_pdata - platform data for hwspinlock drivers
- * @base_id: base id for this hwspinlock device
- *
- * hwspinlock devices provide system-wide hardware locks that are used
- * by remote processors that have no other way to achieve synchronization.
- *
- * To achieve that, each physical lock must have a system-wide id number
- * that is agreed upon, otherwise remote processors can't possibly assume
- * they're using the same hardware lock.
- *
- * Usually boards have a single hwspinlock device, which provides several
- * hwspinlocks, and in this case, they can be trivially numbered 0 to
- * (num-of-locks - 1).
- *
- * In case boards have several hwspinlocks devices, a different base id
- * should be used for each hwspinlock device (they can't all use 0 as
- * a starting id!).
- *
- * This platform data structure should be used to provide the base id
- * for each device (which is trivially 0 when only a single hwspinlock
- * device exists). It can be shared between different platforms, hence
- * its location.
- */
-struct hwspinlock_pdata {
-	int base_id;
-};
-
-#ifdef CONFIG_HWSPINLOCK
-
-struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
-int hwspin_lock_free(struct hwspinlock *hwlock);
-int of_hwspin_lock_get_id(struct device_node *np, int index);
-int __hwspin_lock_timeout(struct hwspinlock *, unsigned int, int,
-							unsigned long *);
-int __hwspin_trylock(struct hwspinlock *, int, unsigned long *);
-void __hwspin_unlock(struct hwspinlock *, int, unsigned long *);
-int of_hwspin_lock_get_id_byname(struct device_node *np, const char *name);
-int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
-int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
-struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
-						     unsigned int id);
-#else /* !CONFIG_HWSPINLOCK */
-
-/*
- * We don't want these functions to fail if CONFIG_HWSPINLOCK is not
- * enabled. We prefer to silently succeed in this case, and let the
- * code path get compiled away. This way, if CONFIG_HWSPINLOCK is not
- * required on a given setup, users will still work.
- *
- * Note: ERR_PTR(-ENODEV) will still be considered a success for NULL-checking
- * users. Others, which care, can still check this with IS_ERR.
- */
-static inline struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-static inline int hwspin_lock_free(struct hwspinlock *hwlock)
-{
-	return 0;
-}
-
-static inline
-int __hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int to,
-					int mode, unsigned long *flags)
-{
-	return 0;
-}
-
-static inline
-int __hwspin_trylock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
-{
-	return 0;
-}
-
-static inline
-void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
-{
-}
-
-static inline int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id)
-{
-	return 0;
-}
-
-static inline int of_hwspin_lock_get_id(struct device_node *np, int index)
-{
-	return 0;
-}
-
-static inline
-int of_hwspin_lock_get_id_byname(struct device_node *np, const char *name)
-{
-	return 0;
-}
-
-static inline
-int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock)
-{
-	return 0;
-}
-
-static inline
-struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
-						     unsigned int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-#endif /* !CONFIG_HWSPINLOCK */
-
-/**
- * hwspin_trylock_irqsave() - try to lock an hwspinlock, disable interrupts
- * @hwlock: an hwspinlock which we want to trylock
- * @flags: a pointer to where the caller's interrupt state will be saved at
- *
- * This function attempts to lock the underlying hwspinlock, and will
- * immediately fail if the hwspinlock is already locked.
- *
- * Upon a successful return from this function, preemption and local
- * interrupts are disabled (previous interrupts state is saved at @flags),
- * so the caller must not sleep, and is advised to release the hwspinlock
- * as soon as possible.
- *
- * Returns 0 if we successfully locked the hwspinlock, -EBUSY if
- * the hwspinlock was already taken, and -EINVAL if @hwlock is invalid.
- */
-static inline
-int hwspin_trylock_irqsave(struct hwspinlock *hwlock, unsigned long *flags)
-{
-	return __hwspin_trylock(hwlock, HWLOCK_IRQSTATE, flags);
-}
-
-/**
- * hwspin_trylock_irq() - try to lock an hwspinlock, disable interrupts
- * @hwlock: an hwspinlock which we want to trylock
- *
- * This function attempts to lock the underlying hwspinlock, and will
- * immediately fail if the hwspinlock is already locked.
- *
- * Upon a successful return from this function, preemption and local
- * interrupts are disabled, so the caller must not sleep, and is advised
- * to release the hwspinlock as soon as possible.
- *
- * Returns 0 if we successfully locked the hwspinlock, -EBUSY if
- * the hwspinlock was already taken, and -EINVAL if @hwlock is invalid.
- */
-static inline int hwspin_trylock_irq(struct hwspinlock *hwlock)
-{
-	return __hwspin_trylock(hwlock, HWLOCK_IRQ, NULL);
-}
-
-/**
- * hwspin_trylock_raw() - attempt to lock a specific hwspinlock
- * @hwlock: an hwspinlock which we want to trylock
- *
- * This function attempts to lock an hwspinlock, and will immediately fail
- * if the hwspinlock is already taken.
- *
- * Caution: User must protect the routine of getting hardware lock with mutex
- * or spinlock to avoid dead-lock, that will let user can do some time-consuming
- * or sleepable operations under the hardware lock.
- *
- * Returns 0 if we successfully locked the hwspinlock, -EBUSY if
- * the hwspinlock was already taken, and -EINVAL if @hwlock is invalid.
- */
-static inline int hwspin_trylock_raw(struct hwspinlock *hwlock)
-{
-	return __hwspin_trylock(hwlock, HWLOCK_RAW, NULL);
-}
-
-/**
- * hwspin_trylock_in_atomic() - attempt to lock a specific hwspinlock
- * @hwlock: an hwspinlock which we want to trylock
- *
- * This function attempts to lock an hwspinlock, and will immediately fail
- * if the hwspinlock is already taken.
- *
- * This function shall be called only from an atomic context.
- *
- * Returns 0 if we successfully locked the hwspinlock, -EBUSY if
- * the hwspinlock was already taken, and -EINVAL if @hwlock is invalid.
- */
-static inline int hwspin_trylock_in_atomic(struct hwspinlock *hwlock)
-{
-	return __hwspin_trylock(hwlock, HWLOCK_IN_ATOMIC, NULL);
-}
-
-/**
- * hwspin_trylock() - attempt to lock a specific hwspinlock
- * @hwlock: an hwspinlock which we want to trylock
- *
- * This function attempts to lock an hwspinlock, and will immediately fail
- * if the hwspinlock is already taken.
- *
- * Upon a successful return from this function, preemption is disabled,
- * so the caller must not sleep, and is advised to release the hwspinlock
- * as soon as possible. This is required in order to minimize remote cores
- * polling on the hardware interconnect.
- *
- * Returns 0 if we successfully locked the hwspinlock, -EBUSY if
- * the hwspinlock was already taken, and -EINVAL if @hwlock is invalid.
- */
-static inline int hwspin_trylock(struct hwspinlock *hwlock)
-{
-	return __hwspin_trylock(hwlock, 0, NULL);
-}
-
-/**
- * hwspin_lock_timeout_irqsave() - lock hwspinlock, with timeout, disable irqs
- * @hwlock: the hwspinlock to be locked
- * @to: timeout value in msecs
- * @flags: a pointer to where the caller's interrupt state will be saved at
- *
- * This function locks the underlying @hwlock. If the @hwlock
- * is already taken, the function will busy loop waiting for it to
- * be released, but give up when @timeout msecs have elapsed.
- *
- * Upon a successful return from this function, preemption and local interrupts
- * are disabled (plus previous interrupt state is saved), so the caller must
- * not sleep, and is advised to release the hwspinlock as soon as possible.
- *
- * Returns 0 when the @hwlock was successfully taken, and an appropriate
- * error code otherwise (most notably an -ETIMEDOUT if the @hwlock is still
- * busy after @timeout msecs). The function will never sleep.
- */
-static inline int hwspin_lock_timeout_irqsave(struct hwspinlock *hwlock,
-				unsigned int to, unsigned long *flags)
-{
-	return __hwspin_lock_timeout(hwlock, to, HWLOCK_IRQSTATE, flags);
-}
-
-/**
- * hwspin_lock_timeout_irq() - lock hwspinlock, with timeout, disable irqs
- * @hwlock: the hwspinlock to be locked
- * @to: timeout value in msecs
- *
- * This function locks the underlying @hwlock. If the @hwlock
- * is already taken, the function will busy loop waiting for it to
- * be released, but give up when @timeout msecs have elapsed.
- *
- * Upon a successful return from this function, preemption and local interrupts
- * are disabled so the caller must not sleep, and is advised to release the
- * hwspinlock as soon as possible.
- *
- * Returns 0 when the @hwlock was successfully taken, and an appropriate
- * error code otherwise (most notably an -ETIMEDOUT if the @hwlock is still
- * busy after @timeout msecs). The function will never sleep.
- */
-static inline
-int hwspin_lock_timeout_irq(struct hwspinlock *hwlock, unsigned int to)
-{
-	return __hwspin_lock_timeout(hwlock, to, HWLOCK_IRQ, NULL);
-}
-
-/**
- * hwspin_lock_timeout_raw() - lock an hwspinlock with timeout limit
- * @hwlock: the hwspinlock to be locked
- * @to: timeout value in msecs
- *
- * This function locks the underlying @hwlock. If the @hwlock
- * is already taken, the function will busy loop waiting for it to
- * be released, but give up when @timeout msecs have elapsed.
- *
- * Caution: User must protect the routine of getting hardware lock with mutex
- * or spinlock to avoid dead-lock, that will let user can do some time-consuming
- * or sleepable operations under the hardware lock.
- *
- * Returns 0 when the @hwlock was successfully taken, and an appropriate
- * error code otherwise (most notably an -ETIMEDOUT if the @hwlock is still
- * busy after @timeout msecs). The function will never sleep.
- */
-static inline
-int hwspin_lock_timeout_raw(struct hwspinlock *hwlock, unsigned int to)
-{
-	return __hwspin_lock_timeout(hwlock, to, HWLOCK_RAW, NULL);
-}
-
-/**
- * hwspin_lock_timeout_in_atomic() - lock an hwspinlock with timeout limit
- * @hwlock: the hwspinlock to be locked
- * @to: timeout value in msecs
- *
- * This function locks the underlying @hwlock. If the @hwlock
- * is already taken, the function will busy loop waiting for it to
- * be released, but give up when @timeout msecs have elapsed.
- *
- * This function shall be called only from an atomic context and the timeout
- * value shall not exceed a few msecs.
- *
- * Returns 0 when the @hwlock was successfully taken, and an appropriate
- * error code otherwise (most notably an -ETIMEDOUT if the @hwlock is still
- * busy after @timeout msecs). The function will never sleep.
- */
-static inline
-int hwspin_lock_timeout_in_atomic(struct hwspinlock *hwlock, unsigned int to)
-{
-	return __hwspin_lock_timeout(hwlock, to, HWLOCK_IN_ATOMIC, NULL);
-}
-
-/**
- * hwspin_lock_timeout() - lock an hwspinlock with timeout limit
- * @hwlock: the hwspinlock to be locked
- * @to: timeout value in msecs
- *
- * This function locks the underlying @hwlock. If the @hwlock
- * is already taken, the function will busy loop waiting for it to
- * be released, but give up when @timeout msecs have elapsed.
- *
- * Upon a successful return from this function, preemption is disabled
- * so the caller must not sleep, and is advised to release the hwspinlock
- * as soon as possible.
- * This is required in order to minimize remote cores polling on the
- * hardware interconnect.
- *
- * Returns 0 when the @hwlock was successfully taken, and an appropriate
- * error code otherwise (most notably an -ETIMEDOUT if the @hwlock is still
- * busy after @timeout msecs). The function will never sleep.
- */
-static inline
-int hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int to)
-{
-	return __hwspin_lock_timeout(hwlock, to, 0, NULL);
-}
-
-/**
- * hwspin_unlock_irqrestore() - unlock hwspinlock, restore irq state
- * @hwlock: a previously-acquired hwspinlock which we want to unlock
- * @flags: previous caller's interrupt state to restore
- *
- * This function will unlock a specific hwspinlock, enable preemption and
- * restore the previous state of the local interrupts. It should be used
- * to undo, e.g., hwspin_trylock_irqsave().
- *
- * @hwlock must be already locked before calling this function: it is a bug
- * to call unlock on a @hwlock that is already unlocked.
- */
-static inline void hwspin_unlock_irqrestore(struct hwspinlock *hwlock,
-							unsigned long *flags)
-{
-	__hwspin_unlock(hwlock, HWLOCK_IRQSTATE, flags);
-}
-
-/**
- * hwspin_unlock_irq() - unlock hwspinlock, enable interrupts
- * @hwlock: a previously-acquired hwspinlock which we want to unlock
- *
- * This function will unlock a specific hwspinlock, enable preemption and
- * enable local interrupts. Should be used to undo hwspin_lock_irq().
- *
- * @hwlock must be already locked (e.g. by hwspin_trylock_irq()) before
- * calling this function: it is a bug to call unlock on a @hwlock that is
- * already unlocked.
- */
-static inline void hwspin_unlock_irq(struct hwspinlock *hwlock)
-{
-	__hwspin_unlock(hwlock, HWLOCK_IRQ, NULL);
-}
-
-/**
- * hwspin_unlock_raw() - unlock hwspinlock
- * @hwlock: a previously-acquired hwspinlock which we want to unlock
- *
- * This function will unlock a specific hwspinlock.
- *
- * @hwlock must be already locked (e.g. by hwspin_trylock()) before calling
- * this function: it is a bug to call unlock on a @hwlock that is already
- * unlocked.
- */
-static inline void hwspin_unlock_raw(struct hwspinlock *hwlock)
-{
-	__hwspin_unlock(hwlock, HWLOCK_RAW, NULL);
-}
-
-/**
- * hwspin_unlock_in_atomic() - unlock hwspinlock
- * @hwlock: a previously-acquired hwspinlock which we want to unlock
- *
- * This function will unlock a specific hwspinlock.
- *
- * @hwlock must be already locked (e.g. by hwspin_trylock()) before calling
- * this function: it is a bug to call unlock on a @hwlock that is already
- * unlocked.
- */
-static inline void hwspin_unlock_in_atomic(struct hwspinlock *hwlock)
-{
-	__hwspin_unlock(hwlock, HWLOCK_IN_ATOMIC, NULL);
-}
-
-/**
- * hwspin_unlock() - unlock hwspinlock
- * @hwlock: a previously-acquired hwspinlock which we want to unlock
- *
- * This function will unlock a specific hwspinlock and enable preemption
- * back.
- *
- * @hwlock must be already locked (e.g. by hwspin_trylock()) before calling
- * this function: it is a bug to call unlock on a @hwlock that is already
- * unlocked.
- */
-static inline void hwspin_unlock(struct hwspinlock *hwlock)
-{
-	__hwspin_unlock(hwlock, 0, NULL);
-}
-
-#endif /* __LINUX_HWSPINLOCK_H */
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Temporary. Until all users are converted. */
+
+#include <hwspinlock/consumer.h>
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock/consumer.h
similarity index 98%
copy from include/linux/hwspinlock.h
copy to include/linux/hwspinlock/consumer.h
index 7f38960c7162..89a95e3d35c6 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock/consumer.h
@@ -1,14 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Hardware spinlock public header
+ * Hardware spinlock public header for consumers
  *
  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
  *
  * Contact: Ohad Ben-Cohen <ohad@wizery.com>
  */
 
-#ifndef __LINUX_HWSPINLOCK_H
-#define __LINUX_HWSPINLOCK_H
+#ifndef __LINUX_HWSPINLOCK_CONSUMER_H
+#define __LINUX_HWSPINLOCK_CONSUMER_H
 
 #include <linux/err.h>
 #include <linux/sched.h>
@@ -431,4 +431,4 @@ static inline void hwspin_unlock(struct hwspinlock *hwlock)
 	__hwspin_unlock(hwlock, 0, NULL);
 }
 
-#endif /* __LINUX_HWSPINLOCK_H */
+#endif /* __LINUX_HWSPINLOCK_CONSUMER_H */
-- 
2.47.3


