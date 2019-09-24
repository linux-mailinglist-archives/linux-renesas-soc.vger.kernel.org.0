Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE47BD062
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 19:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395155AbfIXRPJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 13:15:09 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:53780 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395139AbfIXRPJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 13:15:09 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 20EA23C057C;
        Tue, 24 Sep 2019 19:15:05 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id s8tPHFbTrZBf; Tue, 24 Sep 2019 19:14:59 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 2CBB73C04C0;
        Tue, 24 Sep 2019 19:14:59 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 24 Sep
 2019 19:14:58 +0200
Date:   Tue, 24 Sep 2019 19:14:53 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
CC:     Frederic Weisbecker <fweisbec@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH V1 1/1] tick: broadcast-hrtimer: Fix a race in bc_set_next
Message-ID: <20190924171453.GA1804@vmlxhi-102.adit-jv.com>
References: <20190918144138.24839-1-balasubramani_vivekanandan@mentor.com>
 <20190918144138.24839-2-balasubramani_vivekanandan@mentor.com>
 <alpine.DEB.2.21.1909232041080.1934@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909232041080.1934@nanos.tec.linutronix.de>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 09:51:54PM +0200, Thomas Gleixner wrote:
> On Wed, 18 Sep 2019, Balasubramani Vivekanandan wrote:
> > 
> > When there are no more cpus subscribed to broadcast, the timer callback
> > might not set the expiry time for hrtimer. Therefore the callback timer
> > function is modified to set the state of broadcast clock to
> > CLOCK_EVT_STATE_ONESHOT_STOPPED which in turn will set the expiry time
> > of hrtimer to KTIME_MAX.
> 
> That's an ugly layering violation, really.
> 
> Aside of that the whole try to cancel logic and the comment that the
> hrtimer cannot be armed from within the callback is wrong. All of this can
> go way.
> 
> Find a completely untested patch below [1]
> 
> Thanks,
> 
> 	tglx
> 

jFTR, for the sake of anyone who lives on older kernels and happen to
deal with the same issue as reported by Balasubramani in this thread,
after enabling cpuidle [2-3] on R-Car H3ULCB (which seems to be a hard
prerequisite for seeing this issue reproduced), I got below [4,5,6]
backtraces on recent v5.3-12025-g4c07e2ddab5b using various intermittent
stress-ng loads. I believe they portray the issue reported by Bala.

I was not able to reproduce the RCU stalls after applying [1].

[1] https://lkml.org/lkml/2019/9/23/803
[2] https://patchwork.kernel.org/patch/10769701/
    ("[v2,1/5] arm64: dts: r8a7795: Add cpuidle support for CA57 cores")
[3] https://patchwork.kernel.org/patch/10769689/
    ("[v2,2/5] arm64: dts: r8a7795: Add cpuidle support for CA53 cores")

[4] RCU stall #1 reproduced on v5.3-12025-g4c07e2ddab5b + patches [2-3]

[  701.628630] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  701.635259] rcu:     1-...!: (0 ticks this GP) idle=5b4/0/0x0 softirq=178953/178953 fqs=0 last_accelerate: c1a9/209c, Nonlazy posted: ..D
[  701.648195] rcu:     3-...!: (667 GPs behind) idle=1a0/0/0x0 softirq=188640/188641 fqs=0 last_accelerate: c1a6/20a0, Nonlazy posted: .LD
[  701.660666] rcu:     5-...!: (0 ticks this GP) idle=674/0/0x0 softirq=39323/39323 fqs=0 last_accelerate: c380/20a0, Nonlazy posted: ..D
[  701.673046] rcu:     6-...!: (0 ticks this GP) idle=628/0/0x0 softirq=27147/27147 fqs=0 last_accelerate: c00c/20a0, Nonlazy posted: ..D
[  701.685419]  (detected by 2, t=25012 jiffies, g=392945, q=968)
[  701.691487] Task dump for CPU 1:
[  701.694873] swapper/1       R  running task        0     0      1 0x00000028
[  701.702227] Call trace:
[  701.704822]  __switch_to+0x2c4/0x2e8
[  701.708578]  num_spec.70129+0x177e7d/0x1d336c
[  701.713130] Task dump for CPU 3:
[  701.716514] swapper/3       R  running task        0     0      1 0x00000028
[  701.723865] Call trace:
[  701.726445]  __switch_to+0x2c4/0x2e8
[  701.730192]  0x3
[  701.732140] Task dump for CPU 5:
[  701.735524] swapper/5       R  running task        0     0      1 0x00000028
[  701.742874] Call trace:
[  701.745455]  __switch_to+0x2c4/0x2e8
[  701.749204]  num_spec.70129+0x177e7d/0x1d336c
[  701.753756] Task dump for CPU 6:
[  701.757139] swapper/6       R  running task        0     0      1 0x00000028
[  701.764489] Call trace:
[  701.767070]  __switch_to+0x2c4/0x2e8
[  701.770819]  num_spec.70129+0x177e7d/0x1d336c
[  701.775391] rcu: rcu_preempt kthread starved for 25068 jiffies! g392945 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=5
[  701.786394] rcu: RCU grace-period kthread stack dump:
[  701.791652] rcu_preempt     I    0    10      2 0x00000028
[  701.797369] Call trace:
[  701.799944]  __switch_to+0x2c4/0x2e8
[  701.803688]  __schedule+0xe1c/0xf58
[  701.807337]  schedule+0xc0/0x104
[  701.810721]  schedule_timeout+0x298/0x6ec
[  701.814911]  rcu_gp_kthread+0xf8c/0xf94
[  701.818923]  kthread+0x1c4/0x1dc
[  701.822304]  ret_from_fork+0x10/0x18
[  701.826061] Kernel panic - not syncing: RCU Stall
[  701.830964] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.3.0+ #18
[  701.837201] Hardware name: Renesas H3ULCB Kingfisher board based on r8a7795 ES2.0+ (DT)
[  701.845503] Call trace:
[  701.848072]  dump_backtrace+0x0/0x1ec
[  701.851893]  show_stack+0x24/0x30
[  701.855361]  dump_stack+0xcc/0x128
[  701.858915]  panic+0x288/0x5a4
[  701.862112]  panic_on_rcu_stall+0x2c/0x34
[  701.866293]  rcu_sched_clock_irq+0xe2c/0x1554
[  701.870835]  update_process_times+0x34/0x60
[  701.875196]  tick_sched_handle+0x80/0x98
[  701.879286]  tick_sched_timer+0x64/0xbc
[  701.883289]  __hrtimer_run_queues+0x5c8/0xb94
[  701.887829]  hrtimer_interrupt+0x1ec/0x454
[  701.892107]  arch_timer_handler_phys+0x40/0x58
[  701.896737]  handle_percpu_devid_irq+0x170/0x6f4
[  701.901548]  generic_handle_irq+0x3c/0x54
[  701.905729]  __handle_domain_irq+0x114/0x118
[  701.910178]  gic_handle_irq+0x70/0xac
[  701.913999]  el1_irq+0xbc/0x180
[  701.917289]  __asan_load8+0x40/0xb0
[  701.920934]  tick_check_broadcast_expired+0x70/0x8c
[  701.926011]  cpu_idle_poll+0x1ec/0x380
[  701.929925]  do_idle+0x188/0x354
[  701.933301]  cpu_startup_entry+0x28/0x2c
[  701.937396]  secondary_start_kernel+0x344/0x374
[  701.942184] SMP: stopping secondary CPUs
[  701.946316] Dumping ftrace buffer:
[  701.950694]    (ftrace buffer empty)
[  701.954445] Kernel Offset: disabled
[  701.958093] CPU features: 0x0002,21006004
[  701.962274] Memory Limit: none
[  701.965552] ---[ end Kernel panic - not syncing: RCU Stall ]---

[5] RCU stall #2 reproduced on v5.3-12025-g4c07e2ddab5b + patches [2-3]

[ 1193.212038] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:max-time=5 run; sleep 5; done                                                                                                                                    
[ 1193.218757] rcu:     4-...!: (0 ticks this GP) idle=17c/0/0x0 softirq=130361/130361 fqs=1 last_accelerate: 9cdc/a0d9, Nonlazy posted: .LD
[ 1193.231958]  (detected by 3, t=25021 jiffies, g=774405, q=58539)
[ 1193.238238] Task dump for CPU 4:
[ 1193.241641] swapper/4       R  running task        0     0      1 0x00000028
[ 1193.249021] Call trace:
[ 1193.251631]  __switch_to+0x2c4/0x2e8
[ 1193.255395]  0x1fffe000db4d0fe4
[ 1193.258720] rcu: rcu_preempt kthread starved for 7974 jiffies! g774405 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=4
[ 1193.270900] rcu: RCU grace-period kthread stack dump:
[ 1193.276542] rcu_preempt     I    0    10      2 0x00000028
[ 1193.282278] Call trace:
[ 1193.284864]  __switch_to+0x2c4/0x2e8
[ 1193.288619]  __schedule+0xe1c/0xf58
[ 1193.292278]  schedule+0xc0/0x104
[ 1193.295671]  schedule_timeout+0x298/0x6ec
[ 1193.299875]  rcu_gp_kthread+0xf8c/0xf94
[ 1193.303901]  kthread+0x1c4/0x1dc
[ 1193.307295]  ret_from_fork+0x10/0x18
[ 1193.311069] Kernel panic - not syncing: RCU Stall
[ 1193.315986] CPU: 3 PID: 2892 Comm: bash Not tainted 5.3.0+ #18
[ 1193.322056] Hardware name: Renesas H3ULCB Kingfisher board based on r8a7795 ES2.0+ (DT)
[ 1193.330372] Call trace:
[ 1193.332951]  dump_backtrace+0x0/0x1ec
[ 1193.336782]  show_stack+0x24/0x30
[ 1193.340259]  dump_stack+0xcc/0x128
[ 1193.343822]  panic+0x288/0x5a4
[ 1193.347026]  panic_on_rcu_stall+0x2c/0x34
[ 1193.351217]  rcu_sched_clock_irq+0xe2c/0x1554
[ 1193.355770]  update_process_times+0x34/0x60
[ 1193.360141]  tick_sched_handle+0x80/0x98
[ 1193.364240]  tick_sched_timer+0x64/0xbc
[ 1193.368252]  __hrtimer_run_queues+0x5c8/0xb94
[ 1193.372804]  hrtimer_interrupt+0x1ec/0x454
[ 1193.377092]  arch_timer_handler_phys+0x40/0x58
[ 1193.381734]  handle_percpu_devid_irq+0x170/0x6f4
[ 1193.386558]  generic_handle_irq+0x3c/0x54
[ 1193.390749]  __handle_domain_irq+0x114/0x118
[ 1193.395208]  gic_handle_irq+0x70/0xac
[ 1193.399037]  el1_irq+0xbc/0x180
[ 1193.402333]  lock_acquire+0x154/0x39c
[ 1193.406164]  _raw_spin_lock+0x4c/0x88
[ 1193.409997]  set_close_on_exec+0x44/0x1ac
[ 1193.414190]  do_fcntl+0x578/0xbf4
[ 1193.417664]  __arm64_sys_fcntl+0xa4/0xdc
[ 1193.421767]  el0_svc_common.constprop.0+0x158/0x1f8
[ 1193.426854]  el0_svc_handler+0x94/0xa0
[ 1193.430775]  el0_svc+0x8/0xc
[ 1193.433878] SMP: stopping secondary CPUs
[ 1193.438059] Dumping ftrace buffer:
[ 1193.442613]    (ftrace buffer empty)
[ 1193.446373] Kernel Offset: disabled
[ 1193.450028] CPU features: 0x0002,21006004
[ 1193.454217] Memory Limit: none
[ 1193.457508] ---[ end Kernel panic - not syncing: RCU Stall ]---

[6] RCU stall #3 reproduced on v5.3-12025-g4c07e2ddab5b + patches [2-3]

[66194.249069] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[66194.255718] rcu:     7-...!: (0 ticks this GP) idle=b34/0/0x0 softirq=1969905/1969905 fqs=1 last_accelerate: 36d8/7727, Nonlazy posted: .LD
[66194.268853]  (detected by 2, t=25021 jiffies, g=8936349, q=98599)
[66194.275195] Task dump for CPU 7:
[66194.278585] swapper/7       R  running task        0     0      1 0x00000028
[66194.285941] Call trace:
[66194.288537]  __switch_to+0x2c4/0x2e8
[66194.292298]  num_spec.70129+0x177e7d/0x1d336c
[66194.296872] rcu: rcu_preempt kthread starved for 16505 jiffies! g8936349 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=7
[66194.307968] rcu: RCU grace-period kthread stack dump:
[66194.313228] rcu_preempt     I    0    10      2 0x00000028
[66194.318949] Call trace:
[66194.321527]  __switch_to+0x2c4/0x2e8
[66194.325275]  __schedule+0xe1c/0xf58
[66194.328926]  schedule+0xc0/0x104
[66194.332310]  schedule_timeout+0x298/0x6ec
[66194.336502]  rcu_gp_kthread+0xf8c/0xf94
[66194.340516]  kthread+0x1c4/0x1dc
[66194.343900]  ret_from_fork+0x10/0x18
[66194.347664] Kernel panic - not syncing: RCU Stall
[66194.352574] CPU: 2 PID: 17232 Comm: stress-ng-cpu Not tainted 5.3.0+ #18
[66194.359535] Hardware name: Renesas H3ULCB Kingfisher board based on r8a7795 ES2.0+ (DT)
[66194.367848] Call trace:
[66194.370428]  dump_backtrace+0x0/0x1ec
[66194.374256]  show_stack+0x24/0x30
[66194.377730]  dump_stack+0xcc/0x128
[66194.381288]  panic+0x288/0x5a4
[66194.384493]  panic_on_rcu_stall+0x2c/0x34
[66194.388680]  rcu_sched_clock_irq+0xe2c/0x1554
[66194.393229]  update_process_times+0x34/0x60
[66194.397595]  tick_sched_handle+0x80/0x98
[66194.401691]  tick_sched_timer+0x64/0xbc
[66194.405700]  __hrtimer_run_queues+0x5c8/0xb94
[66194.410246]  hrtimer_interrupt+0x1ec/0x454
[66194.414528]  arch_timer_handler_phys+0x40/0x58
[66194.419167]  handle_percpu_devid_irq+0x170/0x6f4
[66194.423990]  generic_handle_irq+0x3c/0x54
[66194.428178]  __handle_domain_irq+0x114/0x118
[66194.432630]  gic_handle_irq+0x70/0xac
[66194.436454]  el0_irq_naked+0x50/0x5c
[66194.440261] SMP: stopping secondary CPUs
[66194.444571] Dumping ftrace buffer:
[66194.449132]    (ftrace buffer empty)
[66194.452890] Kernel Offset: disabled
[66194.456538] CPU features: 0x0002,21006004
[66194.460719] Memory Limit: none
[66194.463997] ---[ end Kernel panic - not syncing: RCU Stall ]---

-- 
Best Regards,
Eugeniu
