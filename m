Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59778BF465
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 15:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfIZNvZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 09:51:25 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:55410 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfIZNvZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 09:51:25 -0400
IronPort-SDR: H/CpLf6B6RrM9/c/UnrR9RPXSJCagK3mAxFDVQFlgIxPMHqcGFEjJ7bMoXcIe1jEH6f5Wte9aS
 VWfPmE8MGVyQ3uJrUjnx1YoeMHHDYB/9SPBrC/NC9DmCbbeb222ypB51xCnAq2baAJmm6fi6Du
 WNj+itsuiVSGEr1UfFhK6NvE6a9BOQm5aE3reutK28bfmrm8rlAKzIBw2rz6IGVHdRojP/U4ku
 bkwmXgAjtSHCLJY4Al1yMm21pi0ZIvUKdmhVv5hN5BZgzd8DQFKxGA82knuyuF6cWd02ayQRtp
 K1c=
X-IronPort-AV: E=Sophos;i="5.64,552,1559548800"; 
   d="scan'208";a="43527459"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Sep 2019 05:51:24 -0800
IronPort-SDR: g8IfhtlMsb+bCUzaayMGKyrbczKaCiaLHFFiTgLW3eR1Q99J3lChR3MmZaGd9Nk98lGTbjLO7y
 tygZjHTdG+FN2R2UFpCZqk+ZIqOiQ2OSEnESx0CTYQKC7IJw815r0yhHdlGgq2fpgPYTkr4xFY
 X6x/26OJSbHjYs5E76vA4Xp3kHK1HGd2BCpwSf2+P4v5pQUFRbo5Y7E/0yrTegr9hRh54To1+T
 t82fYI+/5h0+A8FNo4k3H4mrxPpBylbeJLyvYItUsqqcc4enfdYv74/jPuJ2Rxfpl9Wr/d57o5
 CFM=
From:   Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
To:     <fweisbec@gmail.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
        <peterz@infradead.org>
CC:     <balasubramani_vivekanandan@mentor.com>, <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V3 1/1] tick: broadcast-hrtimer: Fix a race in bc_set_next
Date:   Thu, 26 Sep 2019 15:51:01 +0200
Message-ID: <20190926135101.12102-2-balasubramani_vivekanandan@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926135101.12102-1-balasubramani_vivekanandan@mentor.com>
References: <alpine.DEB.2.21.1909261144250.5528@nanos.tec.linutronix.de>
 <20190926135101.12102-1-balasubramani_vivekanandan@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When a cpu requests broadcasting, before starting the tick broadcast
hrtimer, bc_set_next() checks if the timer callback (bc_handler) is
active using hrtimer_try_to_cancel(). But hrtimer_try_to_cancel() does
not provide the required synchronization when the callback is active on
other core.
The callback could have already executed
tick_handle_oneshot_broadcast() and could have also returned. But still
there is a small time window where the hrtimer_try_to_cancel() returns
-1. In that case bc_set_next() returns without doing anything, but the
next_event of the tick broadcast clock device is already set to a
timeout value.

In the race condition diagram below, CPU #1 is running the timer
callback and CPU #2 is entering idle state and so calls bc_set_next().

In the worst case, the next_event will contain an expiry time, but the
hrtimer will not be started which happens when the racing callback
returns HRTIMER_NORESTART. The hrtimer might never recover if all
further requests from the CPUs to subscribe to tick broadcast have
timeout greater than the next_event of tick broadcast clock device. This
leads to cascading of failures and finally noticed as rcu stall
warnings

Here is a depiction of the race condition

CPU #1 (Running timer callback)                   CPU #2 (Enter idle
                                                  and subscribe to
                                                  tick broadcast)
---------------------                             ---------------------

__run_hrtimer()                                   tick_broadcast_enter()

  bc_handler()                                      __tick_broadcast_oneshot_control()

    tick_handle_oneshot_broadcast()

      raw_spin_lock(&tick_broadcast_lock);

      dev->next_event = KTIME_MAX;                  //wait for tick_broadcast_lock
      //next_event for tick broadcast clock
      set to KTIME_MAX since no other cores
      subscribed to tick broadcasting

      raw_spin_unlock(&tick_broadcast_lock);

    if (dev->next_event == KTIME_MAX)
      return HRTIMER_NORESTART
    // callback function exits without
       restarting the hrtimer                      //tick_broadcast_lock acquired
                                                   raw_spin_lock(&tick_broadcast_lock);

                                                   tick_broadcast_set_event()

                                                     clockevents_program_event()

                                                       dev->next_event = expires;

                                                       bc_set_next()

                                                         hrtimer_try_to_cancel()
                                                         //returns -1 since the timer
                                                         callback is active. Exits without
                                                         restarting the timer
  cpu_base->running = NULL;

The comment that hrtimer cannot be armed from within the callback is
wrong. It is fine to start the hrtimer from within the callback. Also it
is safe to start the hrtimer from the enter/exit idle code while the
broadcast handler is active. The enter/exit idle code and the broadcast
handler are synchronized using tick_broadcast_lock. So there is no need
for the existing try to cancel logic. All this can be removed which will
eliminate the race condition as well.

Originally-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
---
 kernel/time/tick-broadcast-hrtimer.c | 58 ++++++++++++----------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/kernel/time/tick-broadcast-hrtimer.c b/kernel/time/tick-broadcast-hrtimer.c
index c1f5bb590b5e..f070f9734792 100644
--- a/kernel/time/tick-broadcast-hrtimer.c
+++ b/kernel/time/tick-broadcast-hrtimer.c
@@ -42,39 +42,35 @@ static int bc_shutdown(struct clock_event_device *evt)
  */
 static int bc_set_next(ktime_t expires, struct clock_event_device *bc)
 {
-	int bc_moved;
 	/*
-	 * We try to cancel the timer first. If the callback is on
-	 * flight on some other cpu then we let it handle it. If we
-	 * were able to cancel the timer nothing can rearm it as we
-	 * own broadcast_lock.
+	 * This is called either from enter/exit idle code or from the
+	 * broadcast handler. In all cases tick_broadcast_lock is held.
 	 *
-	 * However we can also be called from the event handler of
-	 * ce_broadcast_hrtimer itself when it expires. We cannot
-	 * restart the timer because we are in the callback, but we
-	 * can set the expiry time and let the callback return
-	 * HRTIMER_RESTART.
+	 * hrtimer_cancel() cannot be called here neither from the
+	 * broadcast handler nor from the enter/exit idle code. The idle
+	 * code can run into the problem described in bc_shutdown() and the
+	 * broadcast handler cannot wait for itself to complete for obvious
+	 * reasons.
 	 *
-	 * Since we are in the idle loop at this point and because
-	 * hrtimer_{start/cancel} functions call into tracing,
-	 * calls to these functions must be bound within RCU_NONIDLE.
+	 * Each caller tries to arm the hrtimer on its own CPU, but if the
+	 * handler is currently running hrtimer_start() does not move
+	 * it. It keeps it on the CPU on which it is assigned at the
+	 * moment.
 	 */
-	RCU_NONIDLE(
-		{
-			bc_moved = hrtimer_try_to_cancel(&bctimer) >= 0;
-			if (bc_moved) {
-				hrtimer_start(&bctimer, expires,
-					      HRTIMER_MODE_ABS_PINNED_HARD);
-			}
-		}
-	);
-
-	if (bc_moved) {
-		/* Bind the "device" to the cpu */
-		bc->bound_on = smp_processor_id();
-	} else if (bc->bound_on == smp_processor_id()) {
-		hrtimer_set_expires(&bctimer, expires);
-	}
+	RCU_NONIDLE( {
+		hrtimer_start(&bctimer, expires, HRTIMER_MODE_ABS_PINNED_HARD);
+		/*
+		 * The core tick broadcast mode expects bc->bound_on to be set
+		 * correctly to prevent a CPU which has the broadcast hrtimer
+		 * armed from going deep idle.
+		 *
+		 * As tick_broadcast_lock is held, nothing can change the cpu
+		 * base which was just established in hrtimer_start() above. So
+		 * the below access is safe even without holding the hrtimer
+		 * base lock.
+		 */
+		bc->bound_on = bctimer.base->cpu_base->cpu;
+	} );
 	return 0;
 }
 
@@ -100,10 +96,6 @@ static enum hrtimer_restart bc_handler(struct hrtimer *t)
 {
 	ce_broadcast_hrtimer.event_handler(&ce_broadcast_hrtimer);
 
-	if (clockevent_state_oneshot(&ce_broadcast_hrtimer))
-		if (ce_broadcast_hrtimer.next_event != KTIME_MAX)
-			return HRTIMER_RESTART;
-
 	return HRTIMER_NORESTART;
 }
 
-- 
2.17.1

