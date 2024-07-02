Return-Path: <linux-renesas-soc+bounces-7005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D33D9247CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 21:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 496E11C20D69
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 19:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C126747F;
	Tue,  2 Jul 2024 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eYnnGdL0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vFXFlM/7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440121EB25;
	Tue,  2 Jul 2024 19:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947003; cv=none; b=SKwK7h5mgqrUi3+3Uxee0n7kpu9Vgd4DPEQkM3EjYx9wIlYtc+tYYpTpGpwyuyQJsSiMG+U4VBh9Dr8NoSiVoGSduC3K6Ur+2vBMbcmrhfgLYuw0oXRxXJ6IlMWuD1yIAPylgTURLFTxXKd/5DH3iBOS0CJF4EzPU3XNXGySR84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947003; c=relaxed/simple;
	bh=IYHGOWQYHzfej5qUuNd7psK1kiJHU76lRKzC9PeXtNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RxAoxthVT+EiOjD2QJTblyihN1vTTvkCGR6IIBZKtuGuvgD+A2u82fUUV+XpkUHSJZsgIOkNjwvZwRHPBaRAzVvC8WR17I4JnnlxyJzmXpgEyrN5WED4g+8QPLUeHgCrhePgJNFxiz7PidwWeM3GICfhwjG2i7T433ePCsIlqAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eYnnGdL0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vFXFlM/7; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id EC8671140175;
	Tue,  2 Jul 2024 15:03:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 02 Jul 2024 15:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1719946996; x=1720033396; bh=nQ
	YbCpa+E8n2YlgnyPwC0P6/tQ4hyVyrd8XEfm45oWI=; b=eYnnGdL0pYPDVVGht1
	dShxEo3pnCH8FYyAU+nVoKkAPoHtbB2niNzHh9Z8XcI7wxQxaa6ckVFvZSYP2LKx
	0V5DkkfN5pyQc862lrfM0rQLWVJjHvCJDvH/P1DYv3QKJ1fRip5IGc9QLoAlVrRL
	Q5MkC6Upuks4j2pfeKRhP2zoikbVm60phPdJqb4UUkZYVwLanR5K064Rs3+sy3Y9
	9kr605XNSxBULysrrG2OiWP0wTBSTKi9RA3Em5Gj9VOa+7kPThMak7HyNVsZ2ROo
	O4sV57vfLskDE+kFg4WAzObSys4ke8GbM4n/JL/P6iCY49B9Yk5bg+XwRFh+THxM
	ga7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1719946996; x=1720033396; bh=nQYbCpa+E8n2Y
	lgnyPwC0P6/tQ4hyVyrd8XEfm45oWI=; b=vFXFlM/7fv3z3ZVnjNUxTC8HyfAnF
	eBO/6g8EH5H1GWhaHm9S46hL+hqA5meG5ZCSQK63OCBhqt969WPp2HyDbsUfGSli
	5gxOxIPzWMX8dBV2Nsscz3Sj5yBwd9Sacdvvj3r2NI8Tvw/H11l/y86CKZXHM2jM
	Lk7Aw54lA/IKs2mHg2G/qyR5LroSTjqnw80vtSGqLFKp5OgLNivQ8MpKhO12mqfu
	9giV8QlZl16RBJVQ6H2+HBFGI8+2XfDzRQBbkx55WFqL+l/19E6RaSFLaTQVPYXS
	PU6E4114SrdK8I28nRDTyaiiqqY7E923tNHIU1YoCNhnj79Oyl8GCwC5w==
X-ME-Sender: <xms:9E6EZor_hxt7wsAhuEwNZhURVLah5Yprrgf4kbzbLSLIBcy1fWxPZA>
    <xme:9E6EZurlq2_5ekhT_dNNggswl2U8inNO1K60pIB_NZSjjIfx3exi9RIlItbAf8KRU
    kq41nzi8i34qiG-NB0>
X-ME-Received: <xmr:9E6EZtN42dNUc9RP_Mc9SHKlwds8VFb4i4kxMqZcSmEFUtPAj-0AcSmxiTppy6SEVEz0jm-pLUgSHYeS-EwdSwgiYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:9E6EZv5vjTd2eRo3WtGfHcCMITuRpFt3UzuGZxj2Z1tIqREtAm5SjA>
    <xmx:9E6EZn6nQnjYhb0yeEcmFH2WpMSfsHgQhWt6CIHZS2EgByaYOROr_A>
    <xmx:9E6EZvgg60PtLMoM0nenzDQsTLbFPLYVs3mYpblDECFXGYVq9TYofA>
    <xmx:9E6EZh5r-RExlLmVYEQ9KraDTeTNAXDxwFVf8E-HiipqOK80sJJgSA>
    <xmx:9E6EZtRAOJbdVZQNKnVI2-SXf36b-s7XxCoeH9j2fuy5IC4sbfP5QABe>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jul 2024 15:03:15 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clocksource/drivers/sh_cmt: Address race condition for clock events
Date: Tue,  2 Jul 2024 21:02:30 +0200
Message-ID: <20240702190230.3825292-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a race condition in the CMT interrupt handler. In the interrupt
handler the driver sets a driver private flag, FLAG_IRQCONTEXT. This
flag is used to indicate any call to set_next_event() should not be
directly propagated to the device, but instead cached. This is done as
the interrupt handler itself reprograms the device when needed before it
completes and this avoids this operation to take place twice.

It is unclear why this design was chosen, my suspicion is to allow the
struct clock_event_device.event_handler callback, which is called while
the FLAG_IRQCONTEXT is set, can update the next event without having to
write to the device twice.

Unfortunately there is a race between when the FLAG_IRQCONTEXT flag is
set and later cleared where the interrupt handler have already started to
write the next event to the device. If set_next_event() is called in
this window the value is only cached in the driver but not written. This
leads to the board to misbehave, or worse lockup and produce a splat.

   rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
   rcu:     0-...!: (0 ticks this GP) idle=f5e0/0/0x0 softirq=519/519 fqs=0 (false positive?)
   rcu:     (detected by 1, t=6502 jiffies, g=-595, q=77 ncpus=2)
   Sending NMI from CPU 1 to CPUs 0:
   NMI backtrace for cpu 0
   CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.10.0-rc5-arm64-renesas-00019-g74a6f86eaf1c-dirty #20
   Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
   pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : tick_check_broadcast_expired+0xc/0x40
   lr : cpu_idle_poll.isra.0+0x8c/0x168
   sp : ffff800081c63d70
   x29: ffff800081c63d70 x28: 00000000580000c8 x27: 00000000bfee5610
   x26: 0000000000000027 x25: 0000000000000000 x24: 0000000000000000
   x23: ffff00007fbb9100 x22: ffff8000818f1008 x21: ffff8000800ef07c
   x20: ffff800081c79ec0 x19: ffff800081c70c28 x18: 0000000000000000
   x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffc2c717d8
   x14: 0000000000000000 x13: ffff000009c18080 x12: ffff8000825f7fc0
   x11: 0000000000000000 x10: ffff8000818f3cd4 x9 : 0000000000000028
   x8 : ffff800081c79ec0 x7 : ffff800081c73000 x6 : 0000000000000000
   x5 : 0000000000000000 x4 : ffff7ffffe286000 x3 : 0000000000000000
   x2 : ffff7ffffe286000 x1 : ffff800082972900 x0 : ffff8000818f1008
   Call trace:
    tick_check_broadcast_expired+0xc/0x40
    do_idle+0x9c/0x280
    cpu_startup_entry+0x34/0x40
    kernel_init+0x0/0x11c
    do_one_initcall+0x0/0x260
    __primary_switched+0x80/0x88
   rcu: rcu_preempt kthread timer wakeup didn't happen for 6501 jiffies! g-595 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
   rcu:     Possible timer handling issue on cpu=0 timer-softirq=262
   rcu: rcu_preempt kthread starved for 6502 jiffies! g-595 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
   rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
   rcu: RCU grace-period kthread stack dump:
   task:rcu_preempt     state:I stack:0     pid:15    tgid:15    ppid:2      flags:0x00000008
   Call trace:
    __switch_to+0xbc/0x100
    __schedule+0x358/0xbe0
    schedule+0x48/0x148
    schedule_timeout+0xc4/0x138
    rcu_gp_fqs_loop+0x12c/0x764
    rcu_gp_kthread+0x208/0x298
    kthread+0x10c/0x110
    ret_from_fork+0x10/0x20

The design have been part of the driver since it was first merged in
early 2009. It becomes increasingly harder to trigger the issue the
older kernel version one tries. It only takes a few boots on v6.10-rc5,
while hundreds of boots are needed to trigger it on v5.10.

Close the race condition by using the CMT channel lock for the two
competing sections. The channel lock was added to the driver after its
initial design.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hello,

I only have access to R-Car based SoCs and that is what I have tested
this change on. I have not been able to test on any SH platforms which
also uses this driver.
---
 drivers/clocksource/sh_cmt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 26919556ef5f..b72b36e0abed 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -528,6 +528,7 @@ static void sh_cmt_set_next(struct sh_cmt_channel *ch, unsigned long delta)
 static irqreturn_t sh_cmt_interrupt(int irq, void *dev_id)
 {
 	struct sh_cmt_channel *ch = dev_id;
+	unsigned long flags;
 
 	/* clear flags */
 	sh_cmt_write_cmcsr(ch, sh_cmt_read_cmcsr(ch) &
@@ -558,6 +559,8 @@ static irqreturn_t sh_cmt_interrupt(int irq, void *dev_id)
 
 	ch->flags &= ~FLAG_SKIPEVENT;
 
+	raw_spin_lock_irqsave(&ch->lock, flags);
+
 	if (ch->flags & FLAG_REPROGRAM) {
 		ch->flags &= ~FLAG_REPROGRAM;
 		sh_cmt_clock_event_program_verify(ch, 1);
@@ -570,6 +573,8 @@ static irqreturn_t sh_cmt_interrupt(int irq, void *dev_id)
 
 	ch->flags &= ~FLAG_IRQCONTEXT;
 
+	raw_spin_unlock_irqrestore(&ch->lock, flags);
+
 	return IRQ_HANDLED;
 }
 
@@ -780,12 +785,18 @@ static int sh_cmt_clock_event_next(unsigned long delta,
 				   struct clock_event_device *ced)
 {
 	struct sh_cmt_channel *ch = ced_to_sh_cmt(ced);
+	unsigned long flags;
 
 	BUG_ON(!clockevent_state_oneshot(ced));
+
+	raw_spin_lock_irqsave(&ch->lock, flags);
+
 	if (likely(ch->flags & FLAG_IRQCONTEXT))
 		ch->next_match_value = delta - 1;
 	else
-		sh_cmt_set_next(ch, delta - 1);
+		__sh_cmt_set_next(ch, delta - 1);
+
+	raw_spin_unlock_irqrestore(&ch->lock, flags);
 
 	return 0;
 }
-- 
2.45.2


