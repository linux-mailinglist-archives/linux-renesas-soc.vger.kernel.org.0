Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13802CF8E8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Dec 2020 03:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725300AbgLECUW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 21:20:22 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:15994 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgLECUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 21:20:22 -0500
X-Halon-ID: ea02dce1-369f-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id ea02dce1-369f-11eb-a076-005056917f90;
        Sat, 05 Dec 2020 03:16:42 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] clocksource/drivers/sh_cmt: Fix potential deadlock when calling runtime PM
Date:   Sat,  5 Dec 2020 03:19:20 +0100
Message-Id: <20201205021921.1456190-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205021921.1456190-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201205021921.1456190-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ch->lock is used to protect the whole enable() and read() of
sh_cmt's implementation of struct clocksource. The enable()
implementation calls pm_runtime_get_sync() which may result in the clock
source to be read() triggering a cyclic lockdep warning for the
ch->lock.

The sh_cmt driver implement its own balancing of calls to
sh_cmt_{enable,disable}() with flags in sh_cmt_{start,stop}(). It does
this to deal with that start and stop are shared between the clock
source and clock event providers. While this could be improved on
verifying corner cases based on any substantial rework on all devices
this driver supports might prove hard.

As a first step separate the PM handling for clock event and clock
source. Always put/get the device when enabling/disabling the clock
source but keep the clock event logic unchanged. This allows the sh_cmt
implementation of struct clocksource to call PM without holding the
ch->lock and avoiding the deadlock.

Triggering and log of the deadlock warning,

  # echo e60f0000.timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
  [   46.948370] ======================================================
  [   46.954730] WARNING: possible circular locking dependency detected
  [   46.961094] 5.10.0-rc6-arm64-renesas-00001-g0e5fd7414e8b #36 Not tainted
  [   46.967985] ------------------------------------------------------
  [   46.974342] migration/0/11 is trying to acquire lock:
  [   46.979543] ffff0000403ed220 (&dev->power.lock){-...}-{2:2}, at: __pm_runtime_resume+0x40/0x74
  [   46.988445]
  [   46.988445] but task is already holding lock:
  [   46.994441] ffff000040ad0298 (&ch->lock){....}-{2:2}, at: sh_cmt_start+0x28/0x210
  [   47.002173]
  [   47.002173] which lock already depends on the new lock.
  [   47.002173]
  [   47.010573]
  [   47.010573] the existing dependency chain (in reverse order) is:
  [   47.018262]
  [   47.018262] -> #3 (&ch->lock){....}-{2:2}:
  [   47.024033]        lock_acquire.part.0+0x120/0x330
  [   47.028970]        lock_acquire+0x64/0x80
  [   47.033105]        _raw_spin_lock_irqsave+0x7c/0xc4
  [   47.038130]        sh_cmt_start+0x28/0x210
  [   47.042352]        sh_cmt_clocksource_enable+0x28/0x50
  [   47.047644]        change_clocksource+0x9c/0x160
  [   47.052402]        multi_cpu_stop+0xa4/0x190
  [   47.056799]        cpu_stopper_thread+0x90/0x154
  [   47.061557]        smpboot_thread_fn+0x244/0x270
  [   47.066310]        kthread+0x154/0x160
  [   47.070175]        ret_from_fork+0x10/0x20
  [   47.074390]
  [   47.074390] -> #2 (tk_core.seq.seqcount){----}-{0:0}:
  [   47.081136]        lock_acquire.part.0+0x120/0x330
  [   47.086070]        lock_acquire+0x64/0x80
  [   47.090203]        seqcount_lockdep_reader_access.constprop.0+0x74/0x100
  [   47.097096]        ktime_get+0x28/0xa0
  [   47.100960]        hrtimer_start_range_ns+0x210/0x2dc
  [   47.106164]        generic_sched_clock_init+0x70/0x88
  [   47.111364]        sched_clock_init+0x40/0x64
  [   47.115853]        start_kernel+0x494/0x524
  [   47.120156]
  [   47.120156] -> #1 (hrtimer_bases.lock){-.-.}-{2:2}:
  [   47.126721]        lock_acquire.part.0+0x120/0x330
  [   47.136042]        lock_acquire+0x64/0x80
  [   47.144461]        _raw_spin_lock_irqsave+0x7c/0xc4
  [   47.153721]        hrtimer_start_range_ns+0x68/0x2dc
  [   47.163054]        rpm_suspend+0x308/0x5dc
  [   47.171473]        rpm_idle+0xc4/0x2a4
  [   47.179550]        pm_runtime_work+0x98/0xc0
  [   47.188209]        process_one_work+0x294/0x6f0
  [   47.197142]        worker_thread+0x70/0x45c
  [   47.205661]        kthread+0x154/0x160
  [   47.213673]        ret_from_fork+0x10/0x20
  [   47.221957]
  [   47.221957] -> #0 (&dev->power.lock){-...}-{2:2}:
  [   47.236292]        check_noncircular+0x128/0x140
  [   47.244907]        __lock_acquire+0x13b0/0x204c
  [   47.253332]        lock_acquire.part.0+0x120/0x330
  [   47.262033]        lock_acquire+0x64/0x80
  [   47.269826]        _raw_spin_lock_irqsave+0x7c/0xc4
  [   47.278430]        __pm_runtime_resume+0x40/0x74
  [   47.286758]        sh_cmt_start+0x84/0x210
  [   47.294537]        sh_cmt_clocksource_enable+0x28/0x50
  [   47.303449]        change_clocksource+0x9c/0x160
  [   47.311783]        multi_cpu_stop+0xa4/0x190
  [   47.319720]        cpu_stopper_thread+0x90/0x154
  [   47.328022]        smpboot_thread_fn+0x244/0x270
  [   47.336298]        kthread+0x154/0x160
  [   47.343708]        ret_from_fork+0x10/0x20
  [   47.351445]
  [   47.351445] other info that might help us debug this:
  [   47.351445]
  [   47.370225] Chain exists of:
  [   47.370225]   &dev->power.lock --> tk_core.seq.seqcount --> &ch->lock
  [   47.370225]
  [   47.392003]  Possible unsafe locking scenario:
  [   47.392003]
  [   47.405314]        CPU0                    CPU1
  [   47.413569]        ----                    ----
  [   47.421768]   lock(&ch->lock);
  [   47.428425]                                lock(tk_core.seq.seqcount);
  [   47.438701]                                lock(&ch->lock);
  [   47.447930]   lock(&dev->power.lock);
  [   47.455172]
  [   47.455172]  *** DEADLOCK ***
  [   47.455172]
  [   47.471433] 3 locks held by migration/0/11:
  [   47.479099]  #0: ffff8000113c9278 (timekeeper_lock){-.-.}-{2:2}, at: change_clocksource+0x2c/0x160
  [   47.491834]  #1: ffff8000113c8f88 (tk_core.seq.seqcount){----}-{0:0}, at: multi_cpu_stop+0xa4/0x190
  [   47.504727]  #2: ffff000040ad0298 (&ch->lock){....}-{2:2}, at: sh_cmt_start+0x28/0x210
  [   47.516541]
  [   47.516541] stack backtrace:
  [   47.528480] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.10.0-rc6-arm64-renesas-00001-g0e5fd7414e8b #36
  [   47.542147] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
  [   47.554241] Call trace:
  [   47.560832]  dump_backtrace+0x0/0x190
  [   47.568670]  show_stack+0x14/0x30
  [   47.576144]  dump_stack+0xe8/0x130
  [   47.583670]  print_circular_bug+0x1f0/0x200
  [   47.592015]  check_noncircular+0x128/0x140
  [   47.600289]  __lock_acquire+0x13b0/0x204c
  [   47.608486]  lock_acquire.part.0+0x120/0x330
  [   47.616953]  lock_acquire+0x64/0x80
  [   47.624582]  _raw_spin_lock_irqsave+0x7c/0xc4
  [   47.633114]  __pm_runtime_resume+0x40/0x74
  [   47.641371]  sh_cmt_start+0x84/0x210
  [   47.649115]  sh_cmt_clocksource_enable+0x28/0x50
  [   47.657916]  change_clocksource+0x9c/0x160
  [   47.666165]  multi_cpu_stop+0xa4/0x190
  [   47.674056]  cpu_stopper_thread+0x90/0x154
  [   47.682308]  smpboot_thread_fn+0x244/0x270
  [   47.690560]  kthread+0x154/0x160
  [   47.697927]  ret_from_fork+0x10/0x20
  [   47.708447] clocksource: Switched to clocksource e60f0000.timer

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clocksource/sh_cmt.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 760777458a9091cd..19fa3ef75e3bd62b 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -319,7 +319,6 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
 {
 	int k, ret;
 
-	pm_runtime_get_sync(&ch->cmt->pdev->dev);
 	dev_pm_syscore_device(&ch->cmt->pdev->dev, true);
 
 	/* enable clock */
@@ -394,7 +393,6 @@ static void sh_cmt_disable(struct sh_cmt_channel *ch)
 	clk_disable(ch->cmt->clk);
 
 	dev_pm_syscore_device(&ch->cmt->pdev->dev, false);
-	pm_runtime_put(&ch->cmt->pdev->dev);
 }
 
 /* private flags */
@@ -562,10 +560,16 @@ static int sh_cmt_start(struct sh_cmt_channel *ch, unsigned long flag)
 	int ret = 0;
 	unsigned long flags;
 
+	if (flag & FLAG_CLOCKSOURCE)
+		pm_runtime_get_sync(&ch->cmt->pdev->dev);
+
 	raw_spin_lock_irqsave(&ch->lock, flags);
 
-	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
+	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
+		if (flag & FLAG_CLOCKEVENT)
+			pm_runtime_get_sync(&ch->cmt->pdev->dev);
 		ret = sh_cmt_enable(ch);
+	}
 
 	if (ret)
 		goto out;
@@ -590,14 +594,20 @@ static void sh_cmt_stop(struct sh_cmt_channel *ch, unsigned long flag)
 	f = ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE);
 	ch->flags &= ~flag;
 
-	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
+	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
 		sh_cmt_disable(ch);
+		if (flag & FLAG_CLOCKEVENT)
+			pm_runtime_put(&ch->cmt->pdev->dev);
+	}
 
 	/* adjust the timeout to maximum if only clocksource left */
 	if ((flag == FLAG_CLOCKEVENT) && (ch->flags & FLAG_CLOCKSOURCE))
 		__sh_cmt_set_next(ch, ch->max_match_value);
 
 	raw_spin_unlock_irqrestore(&ch->lock, flags);
+
+	if (flag & FLAG_CLOCKSOURCE)
+		pm_runtime_put(&ch->cmt->pdev->dev);
 }
 
 static struct sh_cmt_channel *cs_to_sh_cmt(struct clocksource *cs)
-- 
2.29.2

