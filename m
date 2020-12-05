Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA8A2CF8EA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Dec 2020 03:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgLECUV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 21:20:21 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:15976 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLECUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 21:20:21 -0500
X-Halon-ID: e6c24d4b-369f-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id e6c24d4b-369f-11eb-a076-005056917f90;
        Sat, 05 Dec 2020 03:16:40 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] timekeeping: Fix change_clocksource() for PM and sh_cmt
Date:   Sat,  5 Dec 2020 03:19:19 +0100
Message-Id: <20201205021921.1456190-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series is an attempt to fix two potential deadlock situations and 
allowing the tools/testing/selftests/timers/clocksource-switch test to 
pass for the sh_cmt driver.

The two patches are not directly related, but patch 1/2 fixes a local 
problem in the sh_cmt driver that hides the issue in the timekeeping 
core addressed in patch 2/2. In trying to give as an complete view of my 
problem so I have opted to keep the two patches together.

I'm in no way an expert on the timekeeping core but with these two 
patches applied I can pass the clocksource-switch selftest on R-Car Gen2 
and Gen3 boards. The selftest rapidly switches clock sources and without 
these patches I lockup somewhere and the test fails, with this applied 
it passes. Please se end of cover-letter for logs of the selftest runs, 
and each patch for possible deadlock information.

For each patch the easiest way demonstrate the each of the deadlock 
situations all that is needed is to select the CMT clocksource,

  # echo e60f0000.timer > /sys/devices/system/clocksource/clocksource0/current_clocksource

I have tested on-top of v5.10-rc6 on R-Car M3-N (CMT0 and CMT1) and 
Koelsch (CMT0).

* R-Car M3-N without this series applied

  # ./clocksource-switch 
  Validating clocksource arch_sys_counter
  Consistent CLOCK_REALTIME                 [OK]
  Consistent CLOCK_MONOTONIC                [OK]
  Consistent CLOCK_PROCESS_CPUTIME_ID       [OK]
  Consistent CLOCK_THREAD_CPUTIME_ID        [OK]
  Consistent CLOCK_MONOTONIC_RAW            [OK]
  Consistent CLOCK_REALTIME_COARSE          [OK]
  Consistent CLOCK_MONOTONIC_COARSE         [OK]
  Consistent CLOCK_BOOTTIME                 [OK]
  Consistent CLOCK_TAI                      [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Nanosleep CLOCK_REALTIME                  [OK]
  Nanosleep CLOCK_MONOTONIC                 [OK]
  Nanosleep CLOCK_MONOTONIC_RAW             [UNSUPPORTED]
  Nanosleep CLOCK_REALTIME_COARSE           [UNSUPPORTED]
  Nanosleep CLOCK_MONOTONIC_COARSE          [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME                  [OK]
  Nanosleep CLOCK_REALTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_TAI                       [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Validating clocksource e60f0000.timer
  Consistent CLOCK_REALTIME                 [OK]
  Consistent CLOCK_MONOTONIC                [OK]
  Consistent CLOCK_PROCESS_CPUTIME_ID       [OK]
  Consistent CLOCK_THREAD_CPUTIME_ID        [OK]
  Consistent CLOCK_MONOTONIC_RAW            [OK]
  Consistent CLOCK_REALTIME_COARSE          [OK]
  Consistent CLOCK_MONOTONIC_COARSE         [OK]
  Consistent CLOCK_BOOTTIME                 [OK]
  Consistent CLOCK_TAI                      [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Nanosleep CLOCK_REALTIME                  [OK]
  Nanosleep CLOCK_MONOTONIC                 [OK]
  Nanosleep CLOCK_MONOTONIC_RAW             [UNSUPPORTED]
  Nanosleep CLOCK_REALTIME_COARSE           [UNSUPPORTED]
  Nanosleep CLOCK_MONOTONIC_COARSE          [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME                  [OK]
  Nanosleep CLOCK_REALTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_TAI                       [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Validating clocksource e6130000.timer
  Consistent CLOCK_REALTIME                 [OK]
  Consistent CLOCK_MONOTONIC                [OK]
  Consistent CLOCK_PROCESS_CPUTIME_ID       [OK]
  Consistent CLOCK_THREAD_CPUTIME_ID        [OK]
  Consistent CLOCK_MONOTONIC_RAW            [OK]
  Consistent CLOCK_REALTIME_COARSE          [OK]
  Consistent CLOCK_MONOTONIC_COARSE         [OK]
  Consistent CLOCK_BOOTTIME                 [OK]
  Consistent CLOCK_TAI                      [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Nanosleep CLOCK_REALTIME                  [OK]
  Nanosleep CLOCK_MONOTONIC                 [OK]
  Nanosleep CLOCK_MONOTONIC_RAW             [UNSUPPORTED]
  Nanosleep CLOCK_REALTIME_COARSE           [UNSUPPORTED]
  Nanosleep CLOCK_MONOTONIC_COARSE          [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME                  [OK]
  Nanosleep CLOCK_REALTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_TAI                       [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Running Asynchronous Switching Tests...
  Consistent CLOCK_REALTIME                 Sat Dec  5 01:52:28 2020
  
  1607133200:750182652
  1607133200:750182652
  1607133200:750182772
  1607133200:750182892
  1607133200:750182892
  1607133200:750183012
  1607133200:750183133
  1607133200:750183133
  1607133200:750183253
  1607133200:750183373
  1607133200:750183373
  1607133200:750183493
  1607133200:750183493
  1607133200:750183613
  1607133200:750183734
  1607133200:750183734
  1607133200:750183854
  1607133200:750183974
  1607133200:750183974
  1607133200:750184094
  1607133200:750184214
  1607133200:750184214
  1607133200:750184335
  1607133200:750184455
  1607133200:750184455
  1607133200:750184575
  1607133200:750184695
  1607133200:750184695
  1607133200:750184815
  1607133200:750184936
  1607133200:750184936
  1607133200:750185056
  1607133200:750185056
  1607133200:750185176
  1607133200:750185296
  1607133200:750185296
  1607133200:750185416
  1607133200:750185536
  1607133200:750185536
  1607133200:750185657
  1607133200:750185777
  1607133200:750185777
  1607133200:750185897
  1607133200:750186017
  1607133200:750295633
  1607133200:750295633
  1607133200:750541817
  1607133200:750541817
  1607133200:750541817
  1607133200:750541817
  1607133200:750541817
  1607133200:750541817
  1607133200:750541817
  --------------------
  1607133200:750541817
  1607133200:750295633
  --------------------
  1607133200:750295633
  1607133200:750295633
  1607133200:750295633
  1607133200:750295633
  1607133200:750295633
  1607133200:750295633
  1607133200:750295633
  1607133200:750295633
  1607133200:750295633
  Delta: 246184 ns
  Sat Dec  5 01:53:20 2020
  
  [FAILED]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0

* R-Car M3-N with this series applied

  # ./clocksource-switch 
  Validating clocksource arch_sys_counter
  Consistent CLOCK_REALTIME                 [OK]
  Consistent CLOCK_MONOTONIC                [OK]
  Consistent CLOCK_PROCESS_CPUTIME_ID       [OK]
  Consistent CLOCK_THREAD_CPUTIME_ID        [OK]
  Consistent CLOCK_MONOTONIC_RAW            [OK]
  Consistent CLOCK_REALTIME_COARSE          [OK]
  Consistent CLOCK_MONOTONIC_COARSE         [OK]
  Consistent CLOCK_BOOTTIME                 [OK]
  Consistent CLOCK_TAI                      [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Nanosleep CLOCK_REALTIME                  [OK]
  Nanosleep CLOCK_MONOTONIC                 [OK]
  Nanosleep CLOCK_MONOTONIC_RAW             [UNSUPPORTED]
  Nanosleep CLOCK_REALTIME_COARSE           [UNSUPPORTED]
  Nanosleep CLOCK_MONOTONIC_COARSE          [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME                  [OK]
  Nanosleep CLOCK_REALTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_TAI                       [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Validating clocksource e60f0000.timer
  Consistent CLOCK_REALTIME                 [OK]
  Consistent CLOCK_MONOTONIC                [OK]
  Consistent CLOCK_PROCESS_CPUTIME_ID       [OK]
  Consistent CLOCK_THREAD_CPUTIME_ID        [OK]
  Consistent CLOCK_MONOTONIC_RAW            [OK]
  Consistent CLOCK_REALTIME_COARSE          [OK]
  Consistent CLOCK_MONOTONIC_COARSE         [OK]
  Consistent CLOCK_BOOTTIME                 [OK]
  Consistent CLOCK_TAI                      [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Nanosleep CLOCK_REALTIME                  [OK]
  Nanosleep CLOCK_MONOTONIC                 [OK]
  Nanosleep CLOCK_MONOTONIC_RAW             [UNSUPPORTED]
  Nanosleep CLOCK_REALTIME_COARSE           [UNSUPPORTED]
  Nanosleep CLOCK_MONOTONIC_COARSE          [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME                  [OK]
  Nanosleep CLOCK_REALTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_TAI                       [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Validating clocksource e6130000.timer
  Consistent CLOCK_REALTIME                 [OK]
  Consistent CLOCK_MONOTONIC                [OK]
  Consistent CLOCK_PROCESS_CPUTIME_ID       [OK]
  Consistent CLOCK_THREAD_CPUTIME_ID        [OK]
  Consistent CLOCK_MONOTONIC_RAW            [OK]
  Consistent CLOCK_REALTIME_COARSE          [OK]
  Consistent CLOCK_MONOTONIC_COARSE         [OK]
  Consistent CLOCK_BOOTTIME                 [OK]
  Consistent CLOCK_TAI                      [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Nanosleep CLOCK_REALTIME                  [OK]
  Nanosleep CLOCK_MONOTONIC                 [OK]
  Nanosleep CLOCK_MONOTONIC_RAW             [UNSUPPORTED]
  Nanosleep CLOCK_REALTIME_COARSE           [UNSUPPORTED]
  Nanosleep CLOCK_MONOTONIC_COARSE          [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME                  [OK]
  Nanosleep CLOCK_REALTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_TAI                       [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Running Asynchronous Switching Tests...
  Consistent CLOCK_REALTIME                 [OK]
  Consistent CLOCK_MONOTONIC                [OK]
  Consistent CLOCK_PROCESS_CPUTIME_ID       [OK]
  Consistent CLOCK_THREAD_CPUTIME_ID        [OK]
  Consistent CLOCK_MONOTONIC_RAW            [OK]
  Consistent CLOCK_REALTIME_COARSE          [OK]
  Consistent CLOCK_MONOTONIC_COARSE         [OK]
  Consistent CLOCK_BOOTTIME                 [OK]
  Consistent CLOCK_TAI                      [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  Nanosleep CLOCK_REALTIME                  [OK]
  Nanosleep CLOCK_MONOTONIC                 [OK]
  Nanosleep CLOCK_MONOTONIC_RAW             [UNSUPPORTED]
  Nanosleep CLOCK_REALTIME_COARSE           [UNSUPPORTED]
  Nanosleep CLOCK_MONOTONIC_COARSE          [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME                  [OK]
  Nanosleep CLOCK_REALTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_BOOTTIME_ALARM            [UNSUPPORTED]
  Nanosleep CLOCK_TAI                       [OK]
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0

Niklas Söderlund (2):
  clocksource/drivers/sh_cmt: Fix potential deadlock when calling
    runtime PM
  timekeeping: Allow runtime PM from change_clocksource()

 drivers/clocksource/sh_cmt.c | 18 ++++++++++++++----
 kernel/time/timekeeping.c    | 36 +++++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 17 deletions(-)

-- 
2.29.2

