Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1E5B8EBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 12:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406050AbfITK6Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 06:58:24 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:35685 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405611AbfITK6Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 06:58:24 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id BBF233C057C;
        Fri, 20 Sep 2019 12:58:20 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tAlcWgkEYNsu; Fri, 20 Sep 2019 12:58:15 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 25BE63C04C0;
        Fri, 20 Sep 2019 12:58:15 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 20 Sep
 2019 12:58:14 +0200
Date:   Fri, 20 Sep 2019 12:58:11 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <fweisbec@gmail.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH V1 0/1] tick: broadcast-hrtimer: Fix a race in bc_set_next
Message-ID: <20190920105811.GA16527@vmlxhi-102.adit-jv.com>
References: <20190918144138.24839-1-balasubramani_vivekanandan@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190918144138.24839-1-balasubramani_vivekanandan@mentor.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+linux-renesas-soc

In hope that the issue reported in [1] was seen by other members of
Renesas community.

[1] https://lkml.org/lkml/2019/9/18/711

On Wed, Sep 18, 2019 at 04:41:37PM +0200, Balasubramani Vivekanandan wrote:
> I was investigating a rcu stall warning on ARM64 Renesas Rcar3
> platform. On analysis I found that rcu stall warning was because the
> rcu_preempt kthread was starved of cpu time. rcu_preempt was blocked in
> the function schedule_timeout() and never woken up. On further
> investigation I found that local timer interrupts were not happening on
> the cpu where the rcu_preempt kthread was blocked. So the rcu_preempt
> was not woken up after timeout.
> I continued my analysis to debug why the timer failed on the cpu. I
> found that when cpu goes through idle state cycle, the timer failure
> happens. When the cpu enters the idle state it subscribes to the tick
> broadcast clock and shutsdown the local timer. Then on exit from idle
> state the local timer is programmed to fire interrupts. But I found that
> the during the error scenario, cpu fails to program the local timer on
> exit from idle state. The below code in
> __tick_broadcast_oneshot_control() is where the idle code exit path goes
> through and fails to program the timer hardware
> 
> now = ktime_get();
> if (dev->next_event <= now) {
> 	cpumask_set_cpu(cpu, tick_broadcast_force_mask);
> 		goto out;
> }
> 
> The value in next_event will be earlier than current time because the
> tick broadcast clock did not wake up the cpu on its subcribed
> timeout. Later when the cpu is woken up due to some other event this
> condition will arise. After the cpu woken up, any further timeout
> requests by any task on the cpu might fail to program the timer
> hardware because the value in next_event will be earlier than the
> current time.
> Then I focussed on why the tick broadcast clock failed to wake up the
> cpu. I noticed a race condition in the hrtimer based tick broadcast
> clock. The race condition results in a condition where the tick
> broadcast hrtimer is never restarted. I have created a patch to fix the
> race condition. Please review 
> 
> Balasubramani Vivekanandan (1):
>   tick: broadcast-hrtimer: Fix a race in bc_set_next
> 
>  kernel/time/tick-broadcast-hrtimer.c | 58 ++++++++++++++++++++++------
>  kernel/time/tick-broadcast.c         |  2 +
>  2 files changed, 48 insertions(+), 12 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
Best Regards,
Eugeniu
