Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE252CF8E9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Dec 2020 03:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgLECUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 21:20:23 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:16007 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgLECUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 21:20:23 -0500
X-Halon-ID: eabca0e9-369f-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id eabca0e9-369f-11eb-a076-005056917f90;
        Sat, 05 Dec 2020 03:16:43 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] timekeeping: Allow runtime PM from change_clocksource()
Date:   Sat,  5 Dec 2020 03:19:21 +0100
Message-Id: <20201205021921.1456190-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205021921.1456190-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201205021921.1456190-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The struct clocksource callbacks enable() and disable() are described as
a way to allow clock sources to enter a power save mode [1]. But using
runtime PM from these callbacks triggers a cyclic lockdep warning when
switching clock source using change_clocksource().

This change allows the new clocksource to be enabled() and the old one
to be disabled() without holding the timekeeper_lock. This solution is
modeled on timekeeping_resume() and timekeeping_suspend() where the
struct clocksource resume() and suspend() callbacks are called without
holding the timekeeper_lock.

Triggering and log of the deadlock warning,

  # echo e60f0000.timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
  [  118.081095] ======================================================
  [  118.087455] WARNING: possible circular locking dependency detected
  [  118.093821] 5.10.0-rc6-arm64-renesas-00002-ga0cf8106e584 #37 Not tainted
  [  118.100712] ------------------------------------------------------
  [  118.107069] migration/0/11 is trying to acquire lock:
  [  118.112269] ffff0000403ed220 (&dev->power.lock){-...}-{2:2}, at: __pm_runtime_resume+0x40/0x74
  [  118.121172]
  [  118.121172] but task is already holding lock:
  [  118.127170] ffff8000113c8f88 (tk_core.seq.seqcount){----}-{0:0}, at: multi_cpu_stop+0xa4/0x190
  [  118.136061]
  [  118.136061] which lock already depends on the new lock.
  [  118.136061]
  [  118.144461]
  [  118.144461] the existing dependency chain (in reverse order) is:
  [  118.152149]
  [  118.152149] -> #2 (tk_core.seq.seqcount){----}-{0:0}:
  [  118.158900]        lock_acquire.part.0+0x120/0x330
  [  118.163834]        lock_acquire+0x64/0x80
  [  118.167971]        seqcount_lockdep_reader_access.constprop.0+0x74/0x100
  [  118.174865]        ktime_get+0x28/0xa0
  [  118.178729]        hrtimer_start_range_ns+0x210/0x2dc
  [  118.183934]        generic_sched_clock_init+0x70/0x88
  [  118.189134]        sched_clock_init+0x40/0x64
  [  118.193622]        start_kernel+0x494/0x524
  [  118.197926]
  [  118.197926] -> #1 (hrtimer_bases.lock){-.-.}-{2:2}:
  [  118.204491]        lock_acquire.part.0+0x120/0x330
  [  118.209424]        lock_acquire+0x64/0x80
  [  118.213557]        _raw_spin_lock_irqsave+0x7c/0xc4
  [  118.218579]        hrtimer_start_range_ns+0x68/0x2dc
  [  118.223690]        rpm_suspend+0x308/0x5dc
  [  118.227909]        rpm_idle+0xc4/0x2a4
  [  118.231771]        pm_runtime_work+0x98/0xc0
  [  118.236171]        process_one_work+0x294/0x6f0
  [  118.240836]        worker_thread+0x70/0x45c
  [  118.245143]        kthread+0x154/0x160
  [  118.249007]        ret_from_fork+0x10/0x20
  [  118.253222]
  [  118.253222] -> #0 (&dev->power.lock){-...}-{2:2}:
  [  118.259607]        check_noncircular+0x128/0x140
  [  118.268774]        __lock_acquire+0x13b0/0x204c
  [  118.277780]        lock_acquire.part.0+0x120/0x330
  [  118.287001]        lock_acquire+0x64/0x80
  [  118.295375]        _raw_spin_lock_irqsave+0x7c/0xc4
  [  118.304623]        __pm_runtime_resume+0x40/0x74
  [  118.313644]        sh_cmt_start+0x1c4/0x260
  [  118.322275]        sh_cmt_clocksource_enable+0x28/0x50
  [  118.331891]        change_clocksource+0x9c/0x160
  [  118.340910]        multi_cpu_stop+0xa4/0x190
  [  118.349522]        cpu_stopper_thread+0x90/0x154
  [  118.358429]        smpboot_thread_fn+0x244/0x270
  [  118.367265]        kthread+0x154/0x160
  [  118.375158]        ret_from_fork+0x10/0x20
  [  118.383284]
  [  118.383284] other info that might help us debug this:
  [  118.383284]
  [  118.402810] Chain exists of:
  [  118.402810]   &dev->power.lock --> hrtimer_bases.lock --> tk_core.seq.seqcount
  [  118.402810]
  [  118.425597]  Possible unsafe locking scenario:
  [  118.425597]
  [  118.439130]        CPU0                    CPU1
  [  118.447413]        ----                    ----
  [  118.455641]   lock(tk_core.seq.seqcount);
  [  118.463335]                                lock(hrtimer_bases.lock);
  [  118.473507]                                lock(tk_core.seq.seqcount);
  [  118.483787]   lock(&dev->power.lock);
  [  118.491120]
  [  118.491120]  *** DEADLOCK ***
  [  118.491120]
  [  118.507666] 2 locks held by migration/0/11:
  [  118.515424]  #0: ffff8000113c9278 (timekeeper_lock){-.-.}-{2:2}, at: change_clocksource+0x2c/0x160
  [  118.528257]  #1: ffff8000113c8f88 (tk_core.seq.seqcount){----}-{0:0}, at: multi_cpu_stop+0xa4/0x190
  [  118.541248]
  [  118.541248] stack backtrace:
  [  118.553226] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.10.0-rc6-arm64-renesas-00002-ga0cf8106e584 #37
  [  118.566923] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
  [  118.579051] Call trace:
  [  118.585649]  dump_backtrace+0x0/0x190
  [  118.593505]  show_stack+0x14/0x30
  [  118.601001]  dump_stack+0xe8/0x130
  [  118.608567]  print_circular_bug+0x1f0/0x200
  [  118.616930]  check_noncircular+0x128/0x140
  [  118.625231]  __lock_acquire+0x13b0/0x204c
  [  118.633451]  lock_acquire.part.0+0x120/0x330
  [  118.641958]  lock_acquire+0x64/0x80
  [  118.649630]  _raw_spin_lock_irqsave+0x7c/0xc4
  [  118.658186]  __pm_runtime_resume+0x40/0x74
  [  118.666483]  sh_cmt_start+0x1c4/0x260
  [  118.674327]  sh_cmt_clocksource_enable+0x28/0x50
  [  118.683170]  change_clocksource+0x9c/0x160
  [  118.691460]  multi_cpu_stop+0xa4/0x190
  [  118.699384]  cpu_stopper_thread+0x90/0x154
  [  118.707672]  smpboot_thread_fn+0x244/0x270
  [  118.715961]  kthread+0x154/0x160
  [  118.723360]  ret_from_fork+0x10/0x20
  [  118.731465] clocksource: Switched to clocksource e60f0000.timer

1. commit 4614e6adafa2c5e6 ("clocksource: add enable() and disable() callbacks")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 kernel/time/timekeeping.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 6858a31364b6456f..41f587359ca8db0e 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1433,35 +1433,45 @@ static void __timekeeping_set_tai_offset(struct timekeeper *tk, s32 tai_offset)
 static int change_clocksource(void *data)
 {
 	struct timekeeper *tk = &tk_core.timekeeper;
-	struct clocksource *new, *old;
+	struct clocksource *new, *old = NULL;
 	unsigned long flags;
+	bool change = false;
 
 	new = (struct clocksource *) data;
 
-	raw_spin_lock_irqsave(&timekeeper_lock, flags);
-	write_seqcount_begin(&tk_core.seq);
-
-	timekeeping_forward_now(tk);
 	/*
 	 * If the cs is in module, get a module reference. Succeeds
 	 * for built-in code (owner == NULL) as well.
 	 */
 	if (try_module_get(new->owner)) {
-		if (!new->enable || new->enable(new) == 0) {
-			old = tk->tkr_mono.clock;
-			tk_setup_internals(tk, new);
-			if (old->disable)
-				old->disable(old);
-			module_put(old->owner);
-		} else {
+		if (!new->enable || new->enable(new) == 0)
+			change = true;
+		else
 			module_put(new->owner);
-		}
 	}
+
+	raw_spin_lock_irqsave(&timekeeper_lock, flags);
+	write_seqcount_begin(&tk_core.seq);
+
+	timekeeping_forward_now(tk);
+
+	if (change) {
+		old = tk->tkr_mono.clock;
+		tk_setup_internals(tk, new);
+	}
+
 	timekeeping_update(tk, TK_CLEAR_NTP | TK_MIRROR | TK_CLOCK_WAS_SET);
 
 	write_seqcount_end(&tk_core.seq);
 	raw_spin_unlock_irqrestore(&timekeeper_lock, flags);
 
+	if (old) {
+		if (old->disable)
+			old->disable(old);
+
+		module_put(old->owner);
+	}
+
 	return 0;
 }
 
-- 
2.29.2

