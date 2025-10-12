Return-Path: <linux-renesas-soc+bounces-22902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE6BD009A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Oct 2025 11:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2821188F73C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Oct 2025 09:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BC9258ED6;
	Sun, 12 Oct 2025 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="j6uvcizI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JIo36Q4i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5435B1DF75C;
	Sun, 12 Oct 2025 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760260222; cv=none; b=kCGoDaL9B6bmsyvYfWHdZ1VKvkuZ8QyZ58pMMYRobM+heMvxHYHjaliWa4Z6OvrkP/hFuVCzPBMsaHzwOBDzIpAK1RFgFsoyviqOd8CvyKbL2ya7W2UaOnDuzemVVT3TNpCLvOfmEinAx/Wayf2ZLo7DPUVOs/2i9+jGl/pdajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760260222; c=relaxed/simple;
	bh=xDpBKyZGWQQcWNVIHiQdA+vtVKHzl7PlZqOXpWdRo/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hAhKydVQRGaRzWF9xrc1WdroeLPofrKI4H1FIKlNaylZSNdIXDyesDrcgjXrxTThBzsJ3RxG0OGYrmHvnHa0/WTgFDGE9AmLdS65vJ+MAMJJ4IPRYMU8yuV+V2IP3bPgzualZTmqhenXKejAreJQHaU+37qDjIK4glba2q0UD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=j6uvcizI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JIo36Q4i; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 3D4D61D0008F;
	Sun, 12 Oct 2025 05:10:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 12 Oct 2025 05:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1760260218; x=1760346618; bh=7f
	rX8GKvKNbRKly8/kuZCwiIhsiAk9QYgkqq6TNn3QQ=; b=j6uvcizIaB/9QTxwCO
	zKQx2Glkah/9ALn4eAuOIZyJ0m5kmcUTon+qizM3TE01X8aAaR7FnRU8l/dVgMpD
	YUv66amSbChkKAFB/6Tkn0aNfQCJp39u1doHS6GQ61XiEpE+hUwhKc//Wc7Mvpo7
	iXn7Ux7TRZPH06HeD+zeCr9pTqNskdnQ20Sd8vgBmOtjgAygs0nXcDgqGCsCuOPZ
	rE3Nz5GCa4bDtwOyFrVCje71MdSGiVb7hEqjuFFHm9k/+rxDAbe8ga0/XmX0XpUu
	VWmZ6oznAiXb/R3aRTrcn5I/5kUI7sqiS6s88r2IwZKImojJVJ+344fo6XVbTGpp
	V7Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1760260218; x=1760346618; bh=7frX8GKvKNbRKly8/kuZCwiIhsiA
	k9QYgkqq6TNn3QQ=; b=JIo36Q4iY/+BZTF/kE+TfTHzgmQDDTG6+onQkwBC9jNj
	yW57k3iH15e3AIeyPio1/CHpSWiISRG/MD2ZBiYZmW3wJ5ragZk5DmIbMucOS0tv
	CVtiri9seM3/+lCGNmRWtKpMxmEpL4XZE/sEIBhgNqshv1yd+GALXm9J46J9eVvk
	vvXQxdbN65um4hvBi6S8SXGpE2PqPAv3iYSCI5igEMHmWY6TB3E7N2nDw/4xTrqt
	E8QsIsrWxvMilmTVH7/teSr2o1OjlG3GAqIpruDaumXs5K2H9kOXVB+m4dXwyUCE
	uWxLo2woO78tjnk+jOgr3RUPug4loJzkqiGV4hYNDw==
X-ME-Sender: <xms:eXDraDxBPn1qc0q5aStcp5V-3ESvgPv8YRidR0x_ohSHbt1NdqIBuw>
    <xme:eXDraEkeW1FzTkVAjnqxtId_D3fyEFzUmICqJvOok3H0GVcm8FG4DNhtVYYM46KSV
    bVQrSr270mC8_UP3KNstrQNF7M1bfyKyl6lPTCuuUkvK-8BybZlmgQ>
X-ME-Received: <xmr:eXDraElKwyAKMt630SlIKfT560oCSGXK1qfNweQ7gJVb1t-NtUUoEKNZnp4J_Hips3Jtp9XY-gQPS6EdGh_LpYZN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudegfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordho
    rhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    epghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthh
    drshgv
X-ME-Proxy: <xmx:eXDraOxVYMD5VtxGqxjjxxtKIV8W5s0ik-qfvJ6s6InCU-gC7Y6L3Q>
    <xmx:eXDraBoUz2FXqmQvdx4-TG73sSBKiP02xkjq06PGdkovU81_VKMm7w>
    <xmx:eXDraF7vAMT4u0rZEqrZUZXjKp8cD3R0otto56TuKc6laRDor6jzeQ>
    <xmx:eXDraAc7YGV0SMWwXp0HuLuJ4bmlzbHBRzGnfwriDhFtZaUu0mZohA>
    <xmx:enDraAs7d7Gq_RjHOAs_jB02CB3Gvmrthm-dcZwBMRrURmrJrHdApL8Z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Oct 2025 05:10:16 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC] clocksource/drivers/sh_cmt: Always leave device running after probe
Date: Sun, 12 Oct 2025 11:10:00 +0200
Message-ID: <20251012091000.1160751-1-niklas.soderlund+renesas@ragnatech.se>
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

This have worked for a long time, but recent improvements in PREEMPT_RT
and PROVE_LOCKING have highlighted an issue. As the CMT register itself
as a clockevent provided, clockevents_register_device(), it needs to use
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
---
---
 drivers/clocksource/sh_cmt.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 385eb94bbe7c..f4d4a8f7c6aa 100644
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
 
@@ -385,18 +377,12 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
 		dev_err(&ch->cmt->pdev->dev, "ch%u: cannot clear CMCNT\n",
 			ch->index);
 		ret = -ETIMEDOUT;
-		goto err1;
+		return ret;
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
@@ -407,9 +393,6 @@ static void sh_cmt_disable(struct sh_cmt_channel *ch)
 	/* disable interrupts in CMT block */
 	sh_cmt_write_cmcsr(ch, 0);
 
-	/* stop clock */
-	clk_disable(ch->cmt->clk);
-
 	dev_pm_syscore_device(&ch->cmt->pdev->dev, false);
 }
 
@@ -583,8 +566,6 @@ static int sh_cmt_start_clocksource(struct sh_cmt_channel *ch)
 	int ret = 0;
 	unsigned long flags;
 
-	pm_runtime_get_sync(&ch->cmt->pdev->dev);
-
 	raw_spin_lock_irqsave(&ch->lock, flags);
 
 	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
@@ -619,8 +600,6 @@ static void sh_cmt_stop_clocksource(struct sh_cmt_channel *ch)
 		sh_cmt_disable(ch);
 
 	raw_spin_unlock_irqrestore(&ch->lock, flags);
-
-	pm_runtime_put(&ch->cmt->pdev->dev);
 }
 
 static int sh_cmt_start_clockevent(struct sh_cmt_channel *ch)
@@ -631,7 +610,6 @@ static int sh_cmt_start_clockevent(struct sh_cmt_channel *ch)
 	raw_spin_lock_irqsave(&ch->lock, flags);
 
 	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
-		pm_runtime_get_sync(&ch->cmt->pdev->dev);
 		ret = sh_cmt_enable(ch);
 	}
 
@@ -658,7 +636,6 @@ static void sh_cmt_stop_clockevent(struct sh_cmt_channel *ch)
 
 	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
 		sh_cmt_disable(ch);
-		pm_runtime_put(&ch->cmt->pdev->dev);
 	}
 
 	/* adjust the timeout to maximum if only clocksource left */
@@ -1134,8 +1111,6 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 		mask &= ~(1 << hwidx);
 	}
 
-	clk_disable(cmt->clk);
-
 	platform_set_drvdata(pdev, cmt);
 
 	return 0;
@@ -1183,8 +1158,6 @@ static int sh_cmt_probe(struct platform_device *pdev)
  out:
 	if (cmt->has_clockevent || cmt->has_clocksource)
 		pm_runtime_irq_safe(&pdev->dev);
-	else
-		pm_runtime_idle(&pdev->dev);
 
 	return 0;
 }
-- 
2.51.0


