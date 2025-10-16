Return-Path: <linux-renesas-soc+bounces-23182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6326BE5088
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54E0C3B3260
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B18B225760;
	Thu, 16 Oct 2025 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="oNAgFMTc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YOM0GlfU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A91223DD1;
	Thu, 16 Oct 2025 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638835; cv=none; b=oth7kAZe2IwDy7X6hX2wNxHHakgxTmg0gMq+89D5dC3nVENExwJeEB6IlaRxRd3axhumOoU/iKj421yWdWeyP7YbZdoYnTbOdKgbTb/codJcy1q8nh3j2xvoY8Ibk8FuVV0d/U/W52TmW5QU/yfEN2W3sgd/HyOp8zmiJRJvOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638835; c=relaxed/simple;
	bh=3m61dWDLGWKI3TZh45zGRYqUpX7Z+UCeUHpbBmxa6YU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gwKXIxpH/EfalUF7UkcBZMxd/Ox9xSKrA3KUXkpiD3UnPmvNFrBMVduXey9n89pfJWtZDCjGMFyPno/wBPQ35c5KktWgKeMVtP1kQ4X9e3sn0BcbgIVA/0So7DDvloq/1mL4UNmQoXAII3xGXhJN7hVJHwEOb0mdC1fEB7KCyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=oNAgFMTc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YOM0GlfU; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 10D717A009F;
	Thu, 16 Oct 2025 14:20:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 16 Oct 2025 14:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1760638831; x=1760725231; bh=WA
	ZjVgfWykFsgaH4ofSXsLVke538TxveX//qoFJqRqs=; b=oNAgFMTc5AUYwfc3iN
	/eLWkA26A7kaDRL1zOr4Ci383sg+dqPokihreYjqD+VYGOfX5AU6P0t0Niqz55Gp
	exXhInnvUJlsEOIVRbY12HFF7e35yBhyRMKGdwmg9z1labT31IehNhTDPsl9MwvG
	87QoEXu5VCfjqE+ERFd8TlEff0EpKCPWhZM0e69FPO430KxI6m/LeI8mGOYF5Y4I
	mu+tGntsTx8dCC2tKwxlHXPhPyt22MLgXq4EnNMKvUb+veoGERC0UIDRaGdmpWd7
	XQiyDEQjiYxr1VBz3qQpV5NNtrf8bnmsxLb0BP0VoVpMYhmvGjyKftHZrYkyA8oQ
	DpNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1760638831; x=1760725231; bh=WAZjVgfWykFsgaH4ofSXsLVke538
	TxveX//qoFJqRqs=; b=YOM0GlfUPxynpFboxXYGTpii7rmo3Vwo6vSpsGo0Am3D
	eoD5cp7nPw0M2YuY+fpaC6B02SzgEN8GwXG0ElfNTwvG3wAvgdWeiO0hthutvOdO
	gv8+SmNEX7Tt2iFono0aC6QkzNAN/kOh7+ZgW4tzm8EPmaJNcwy5BT/umFY0sqUj
	spzwv5eTr+VWLnDFcNOCldnfDg/3fwjXQtZitOXoziLW0qjAYW9BLMVnghqmyVfQ
	NnQ/Ch2KvKOJAl4u0Vdw4FnQbTDZpmrxTTO0hbq1QmQsj6fxHt+hr+bmsaNO+QzG
	yu1+OpKdSLtghKh0f4AdCHY0ez2xbQFoKMRxhrJJaQ==
X-ME-Sender: <xms:bzfxaA5_L4S1Xo-oh4BhO-SfDIPHUlsaCm5MoRmUdJIp2No1TodRWw>
    <xme:bzfxaCkb98f5mBUtrRZZ0mioXe1N1eGSFgAYzBdnK1qYJMHFvdw3VelepxKiLfNH_
    KQKLry4dF-iMzM9_xjPOrqD0cZHPftezxDp6ZolkCCszgnT8XneouCT>
X-ME-Received: <xmr:bzfxaNo6HgaZzSC_Z9D_FRFTmmDe83rmXy61Osus3XACn-6pT9JxeR-xHwrFjnILwBL0SYTXBj6xCDijXP5HsgpW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeileelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordho
    rhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    epghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgvpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvg
X-ME-Proxy: <xmx:bzfxaJtKBGMUfifco9-Fw4sGahhYK20U2kK7ExDeBxh9URO05Xwbmw>
    <xmx:bzfxaKFhmagvwTouBWloCoWK5DWJianf_bvmEpC1g4oA28q14vvujQ>
    <xmx:bzfxaKYy2sOsCdlWJTTGSt93SN-YO9ACcoYprqN28_xj4SmpHNG5FQ>
    <xmx:bzfxaKVy_aVMytEuv8ynaXIWvP36-PgkoM3gPmT78pE3Zyqvd2ZotQ>
    <xmx:bzfxaEkDg_ldNTyH7GY3h5ZnSJoMTetqd5bpW1DKAdWAuv7h2-TMdxPx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 14:20:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device running after probe
Date: Thu, 16 Oct 2025 20:20:22 +0200
Message-ID: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CMT device can be used as both a clocksource and a clockevent
provider. The driver tries to be smart and power itself on and off, as
well as enabling and disabling its clock when it's not in operation.
This behavior is slightly altered if the CMT is used as an early
platform device in which case the device is left powered on after probe,
but the clock is still enabled and disabled at runtime.

This has worked for a long time, but recent improvements in PREEMPT_RT
and PROVE_LOCKING have highlighted an issue. As the CMT registers itself
as a clockevent provider, clockevents_register_device(), it needs to use
raw spinlocks internally as this is the context of which the clockevent
framework interacts with the CMT driver. However in the context of
holding a raw spinlock the CMT driver can't really manage its power
state or clock with calls to pm_runtime_*() and clk_*() as these calls
end up in other platform drivers using regular spinlocks to control
power and clocks.

This mix of spinlock contexts trips a lockdep warning.

    =============================
    [ BUG: Invalid wait context ]
    6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
    -----------------------------
    swapper/1/0 is trying to lock:
    ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume+0x38/0x88
    ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400001/0xDCC63000, Driver version 5.0
    other info that might help us debug this:
    ccree e6601000.crypto: ARM ccree device initialized
    context-{5:5}
    2 locks held by swapper/1/0:
     #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_control+0xa4/0x3a8
     #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
    usbcore: registered new interface driver usbhid
    , at: sh_cmt_start+0x30/0x364
    stack backtrace:
    CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 PREEMPT
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
    Call trace:
     show_stack+0x14/0x1c (C)
     dump_stack_lvl+0x6c/0x90
     dump_stack+0x14/0x1c
     __lock_acquire+0x904/0x1584
     lock_acquire+0x220/0x34c
     _raw_spin_lock_irqsave+0x58/0x80
     __pm_runtime_resume+0x38/0x88
     sh_cmt_start+0x54/0x364
     sh_cmt_clock_event_set_oneshot+0x64/0xb8
     clockevents_switch_state+0xfc/0x13c
     tick_broadcast_set_event+0x30/0xa4
     __tick_broadcast_oneshot_control+0x1e0/0x3a8
     tick_broadcast_oneshot_control+0x30/0x40
     cpuidle_enter_state+0x40c/0x680
     cpuidle_enter+0x30/0x40
     do_idle+0x1f4/0x26c
     cpu_startup_entry+0x34/0x40
     secondary_start_kernel+0x11c/0x13c
     __secondary_switched+0x74/0x78

For non-PREEMPT_RT builds this is not really an issue, but for
PREEMPT_RT builds where normal spinlocks can sleep this might be an
issue. Be cautious and always leave the power and clock running after
probe.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since RFC
- Simplify a ret = -ETIMEDOUT; return ret; to return -ETIMEDOUT;.
- Remove { } for single if-statement bodies created by this patch.
- Update spelling in commit message.
---
 drivers/clocksource/sh_cmt.c | 36 +++---------------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 385eb94bbe7c..791b298c995b 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -355,14 +355,6 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
 
 	dev_pm_syscore_device(&ch->cmt->pdev->dev, true);
 
-	/* enable clock */
-	ret = clk_enable(ch->cmt->clk);
-	if (ret) {
-		dev_err(&ch->cmt->pdev->dev, "ch%u: cannot enable clock\n",
-			ch->index);
-		goto err0;
-	}
-
 	/* make sure channel is disabled */
 	sh_cmt_start_stop_ch(ch, 0);
 
@@ -384,19 +376,12 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
 	if (ret || sh_cmt_read_cmcnt(ch)) {
 		dev_err(&ch->cmt->pdev->dev, "ch%u: cannot clear CMCNT\n",
 			ch->index);
-		ret = -ETIMEDOUT;
-		goto err1;
+		return -ETIMEDOUT;
 	}
 
 	/* enable channel */
 	sh_cmt_start_stop_ch(ch, 1);
 	return 0;
- err1:
-	/* stop clock */
-	clk_disable(ch->cmt->clk);
-
- err0:
-	return ret;
 }
 
 static void sh_cmt_disable(struct sh_cmt_channel *ch)
@@ -407,9 +392,6 @@ static void sh_cmt_disable(struct sh_cmt_channel *ch)
 	/* disable interrupts in CMT block */
 	sh_cmt_write_cmcsr(ch, 0);
 
-	/* stop clock */
-	clk_disable(ch->cmt->clk);
-
 	dev_pm_syscore_device(&ch->cmt->pdev->dev, false);
 }
 
@@ -583,8 +565,6 @@ static int sh_cmt_start_clocksource(struct sh_cmt_channel *ch)
 	int ret = 0;
 	unsigned long flags;
 
-	pm_runtime_get_sync(&ch->cmt->pdev->dev);
-
 	raw_spin_lock_irqsave(&ch->lock, flags);
 
 	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
@@ -619,8 +599,6 @@ static void sh_cmt_stop_clocksource(struct sh_cmt_channel *ch)
 		sh_cmt_disable(ch);
 
 	raw_spin_unlock_irqrestore(&ch->lock, flags);
-
-	pm_runtime_put(&ch->cmt->pdev->dev);
 }
 
 static int sh_cmt_start_clockevent(struct sh_cmt_channel *ch)
@@ -630,10 +608,8 @@ static int sh_cmt_start_clockevent(struct sh_cmt_channel *ch)
 
 	raw_spin_lock_irqsave(&ch->lock, flags);
 
-	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
-		pm_runtime_get_sync(&ch->cmt->pdev->dev);
+	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
 		ret = sh_cmt_enable(ch);
-	}
 
 	if (ret)
 		goto out;
@@ -656,10 +632,8 @@ static void sh_cmt_stop_clockevent(struct sh_cmt_channel *ch)
 
 	ch->flags &= ~FLAG_CLOCKEVENT;
 
-	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
+	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
 		sh_cmt_disable(ch);
-		pm_runtime_put(&ch->cmt->pdev->dev);
-	}
 
 	/* adjust the timeout to maximum if only clocksource left */
 	if (ch->flags & FLAG_CLOCKSOURCE)
@@ -1134,8 +1108,6 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 		mask &= ~(1 << hwidx);
 	}
 
-	clk_disable(cmt->clk);
-
 	platform_set_drvdata(pdev, cmt);
 
 	return 0;
@@ -1183,8 +1155,6 @@ static int sh_cmt_probe(struct platform_device *pdev)
  out:
 	if (cmt->has_clockevent || cmt->has_clocksource)
 		pm_runtime_irq_safe(&pdev->dev);
-	else
-		pm_runtime_idle(&pdev->dev);
 
 	return 0;
 }
-- 
2.51.0


