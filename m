Return-Path: <linux-renesas-soc+bounces-25511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8606C9D304
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 23:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9230D3A21B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 22:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A12F2F8BD2;
	Tue,  2 Dec 2025 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UeIwrulm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nBF2iP0y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1C2F6935;
	Tue,  2 Dec 2025 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713664; cv=none; b=oo0lpTTOsLWC8wXM3Vlc7M4tEYx76g6scm/xzW/XZb0zsP2ydqKcm5SP3VOsK2jBONTjXfkslRL00XS9tSlysmS8GHfTvNKPyCQj7/z+1hgdoU6wKkJWOLXlsb5gvOImZnqQYvRNn3HLkr2tFd8ofY2wW6Mk6kLOwyma3tt3wPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713664; c=relaxed/simple;
	bh=KjXGh7NJ6KR4ww0VZGYVF0KD3ejBzhTEccNtEtkqfQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HVRB/j1IZPCf4FQQ/UMpNbOeRurDM7ESBLELMoQ7+cZKMfkk4VWvkhYJkPjI+krXl6GenOCmP0g2Ng7ewOr7wbSsBTPm72A0RN8SR2DUsGBwsphz18aDm9kwjPNrx/rfY1PQHnH2dsxxHGtoLQg8aavjGuGbXReWAUU7K7K04l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UeIwrulm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nBF2iP0y; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CB7B81D00218;
	Tue,  2 Dec 2025 17:14:19 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 02 Dec 2025 17:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1764713658; x=1764800058; bh=TI
	R4kL1ULib1unMgWZcvX7SmHVfw2mrwAq4SO4WXFoM=; b=UeIwrulm3Zyz985mIZ
	R3RvcKgO0ylT5HY8HDgeAbWzQkl8crXQ59G2KA9Zh4I5nk00NUtLVLzMYw9dazIM
	G8HWj3PILR3ZI76j9cRpv9mq4sD8/rvK/lcvI2DENoXDXGNXgaulBIeliR9ZW2w7
	EUtKYUojMhfuB8Ogkk15aZSNnrpaQXqcA/52AzMV0FcsvdCM+Nfs8X987+MKRuVz
	p/kOZFEHjHStMmmkDMvqZ/TwJGQ/FXQwg6dlgGuFB7xvmCz7EIAZheXyBGX+NVO0
	XKP/qImy/pYJYp5Ca+4NCz3u4k6+VTUd5SGppfQgxVt6DxVypd8SlFXuG+l3pG91
	ti8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764713658; x=1764800058; bh=TIR4kL1ULib1unMgWZcvX7SmHVfw
	2mrwAq4SO4WXFoM=; b=nBF2iP0yZBSX+w+nPVqc3XNIlHFdV1P7s5d8GF0dEpAK
	QYXwJx44q17mZTwOHaRyHmpYOn9WwynTrxmJbFff+8wS3bB7xEBprErUfWfwJphC
	kzVq0UybPHUeoGkN9+2KdSDoS+pysm8eh6SGlShPSoNLvZt0i9m1VUN2qvz9JDXr
	x0M7CR/C0N8ECcHPWe0dcELL/j7dNg3DKpK0HzPSsNhcf0d+YMlUpnYWwYO0W0p5
	xWCYeTUL/W11kBk1nayZfYZ0Ydvnwp9U+HQVSv/BOBpMdkzwtGe+nb+7QnpeXDoq
	Wr4DXTrTiQGodk7DUxt6hFDCrcHRJUF35yOUXyhl6w==
X-ME-Sender: <xms:uWQvaZoh0ThBEDPYqNotsrrVL5niOkPjwXkQovwBId1EB0KDXtROmw>
    <xme:uWQvaU8aIX8hdNFG3IDaD4HY6-PX1ISZ9vGW-w9tBqJATlYiBEnRLOQqJ95kwQE1O
    t0v9F0H8UJRE4nwfI6aSKD0eZukXGQLsU7KFgq8t-6vt57ylV_Xna8>
X-ME-Received: <xmr:uWQvadf8BAgc23VqgNXxnOZgzit6sCH9h3hSO2DW7R44rRLiFyOLZBwKKfySNm7cNMSei5HzOUMz1GTtk29fWXTK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpn
    uggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffefudef
    uedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnuges
    rhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhg
    pdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepgh
    gvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrh
    gvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gv
X-ME-Proxy: <xmx:umQvaWLwrPzEGExetuydvz2bmQOQrSa-d1SGOksPD4ZMUkYlBhFwVw>
    <xmx:umQvaVjc-plg_5Hp2FnCjn14BHATx3mqORkI5jy2YKV817D0M0MrjA>
    <xmx:umQvacTltGFQJrJ6-irzXf6BhGciNLYjePSVU0GADVeBcDM-ObTfRg>
    <xmx:umQvaXXIZ9Q0wVnY3_rhHMlPApQGahK8mokp5ptVqcuwxD6YvBDq8Q>
    <xmx:umQvaSjPLpTWKRV2lzDvLuqXjG-FOQ8AD83upRstMK-rD1oLQT_c9PGC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Dec 2025 17:14:17 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clocksource/drivers/sh_tmu: Always leave device running after probe
Date: Tue,  2 Dec 2025 23:13:41 +0100
Message-ID: <20251202221341.1856773-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The TMU device can be used as both a clocksource and a clockevent
provider. The driver tries to be smart and power itself on and off, as
well as enabling and disabling its clock when it's not in operation.
This behavior is slightly altered if the TMU is used as an early
platform device in which case the device is left powered on after probe,
but the clock is still enabled and disabled at runtime.

This has worked for a long time, but recent improvements in PREEMPT_RT
and PROVE_LOCKING have highlighted an issue. As the TMU registers itself
as a clockevent provider, clockevents_register_device(), it needs to use
raw spinlocks internally as this is the context of which the clockevent
framework interacts with the TMU driver. However in the context of
holding a raw spinlock the TMU driver can't really manage its power
state or clock with calls to pm_runtime_*() and clk_*() as these calls
end up in other platform drivers using regular spinlocks to control
power and clocks.

This mix of spinlock contexts trips a lockdep warning.

    =============================
    [ BUG: Invalid wait context ]
    6.18.0-arm64-renesas-09926-gee959e7c5e34 #1 Not tainted
    -----------------------------
    swapper/0/0 is trying to lock:
    ffff000008c9e180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume+0x38/0x88
    other info that might help us debug this:
    context-{5:5}
    1 lock held by swapper/0/0:
    ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400001/0xDCC63000, Driver version 5.0
     #0: ffff8000817ec298
    ccree e6601000.crypto: ARM ccree device initialized
     (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_control+0xa4/0x3a8
    stack backtrace:
    CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-arm64-renesas-09926-gee959e7c5e34 #1 PREEMPT
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
    Call trace:
     show_stack+0x14/0x1c (C)
     dump_stack_lvl+0x6c/0x90
     dump_stack+0x14/0x1c
     __lock_acquire+0x904/0x1584
     lock_acquire+0x220/0x34c
     _raw_spin_lock_irqsave+0x58/0x80
     __pm_runtime_resume+0x38/0x88
     sh_tmu_clock_event_set_oneshot+0x84/0xd4
     clockevents_switch_state+0xfc/0x13c
     tick_broadcast_set_event+0x30/0xa4
     __tick_broadcast_oneshot_control+0x1e0/0x3a8
     tick_broadcast_oneshot_control+0x30/0x40
     cpuidle_enter_state+0x40c/0x680
     cpuidle_enter+0x30/0x40
     do_idle+0x1f4/0x280
     cpu_startup_entry+0x34/0x40
     kernel_init+0x0/0x130
     do_one_initcall+0x0/0x230
     __primary_switched+0x88/0x90

For non-PREEMPT_RT builds this is not really an issue, but for
PREEMPT_RT builds where normal spinlocks can sleep this might be an
issue. Be cautious and always leave the power and clock running after
probe.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clocksource/sh_tmu.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/clocksource/sh_tmu.c b/drivers/clocksource/sh_tmu.c
index beffff81c00f..3fc6ed9b5630 100644
--- a/drivers/clocksource/sh_tmu.c
+++ b/drivers/clocksource/sh_tmu.c
@@ -143,16 +143,6 @@ static void sh_tmu_start_stop_ch(struct sh_tmu_channel *ch, int start)
 
 static int __sh_tmu_enable(struct sh_tmu_channel *ch)
 {
-	int ret;
-
-	/* enable clock */
-	ret = clk_enable(ch->tmu->clk);
-	if (ret) {
-		dev_err(&ch->tmu->pdev->dev, "ch%u: cannot enable clock\n",
-			ch->index);
-		return ret;
-	}
-
 	/* make sure channel is disabled */
 	sh_tmu_start_stop_ch(ch, 0);
 
@@ -174,7 +164,6 @@ static int sh_tmu_enable(struct sh_tmu_channel *ch)
 	if (ch->enable_count++ > 0)
 		return 0;
 
-	pm_runtime_get_sync(&ch->tmu->pdev->dev);
 	dev_pm_syscore_device(&ch->tmu->pdev->dev, true);
 
 	return __sh_tmu_enable(ch);
@@ -187,9 +176,6 @@ static void __sh_tmu_disable(struct sh_tmu_channel *ch)
 
 	/* disable interrupts in TMU block */
 	sh_tmu_write(ch, TCR, TCR_TPSC_CLK4);
-
-	/* stop clock */
-	clk_disable(ch->tmu->clk);
 }
 
 static void sh_tmu_disable(struct sh_tmu_channel *ch)
@@ -203,7 +189,6 @@ static void sh_tmu_disable(struct sh_tmu_channel *ch)
 	__sh_tmu_disable(ch);
 
 	dev_pm_syscore_device(&ch->tmu->pdev->dev, false);
-	pm_runtime_put(&ch->tmu->pdev->dev);
 }
 
 static void sh_tmu_set_next(struct sh_tmu_channel *ch, unsigned long delta,
@@ -552,7 +537,6 @@ static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_device *pdev)
 		goto err_clk_unprepare;
 
 	tmu->rate = clk_get_rate(tmu->clk) / 4;
-	clk_disable(tmu->clk);
 
 	/* Map the memory resource. */
 	ret = sh_tmu_map_memory(tmu);
@@ -626,8 +610,6 @@ static int sh_tmu_probe(struct platform_device *pdev)
  out:
 	if (tmu->has_clockevent || tmu->has_clocksource)
 		pm_runtime_irq_safe(&pdev->dev);
-	else
-		pm_runtime_idle(&pdev->dev);
 
 	return 0;
 }
-- 
2.52.0


