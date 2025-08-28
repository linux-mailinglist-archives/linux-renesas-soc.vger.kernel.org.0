Return-Path: <linux-renesas-soc+bounces-21058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F1B3ACE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 23:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BECE567D92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 21:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2222C11F0;
	Thu, 28 Aug 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="g7TwXRlc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JS0KMtpP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732220E715;
	Thu, 28 Aug 2025 21:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756417526; cv=none; b=jr4EzgJgn1qk382+j8Q72kds31wGAbqpRpBky7dxWlg3OeuuO8ftsFjmkHAAAR/q8JP8eHzsZVZYss1dS2M3vWYzINoUfsV9Nw1funp1UFDx/5Pv2l35WlfD/E2eEkw8CedAnzrKq7CZJdFfA7rmO9d62LD9Ie86O64hUz+Ow7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756417526; c=relaxed/simple;
	bh=6BkI8/aVBf20pV9Bg3H+f6IE09nJupW+qtiGe68ymxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EbDS2cXdA7/Muxn0A1Gq4Qy9AKNZLat2wBglt3pM2AwnTb1rA/CyLOg0kokUDB+UQNy+m9sAAAu3ddW6M7ENKDmh0g46O1yFyE2Fr58FfOw/oYUOWJ8xTw5lRgVHWtPeYTSRDk9T8oq98yzYGtioX87jIV/mmKlNUnK8idSJqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=g7TwXRlc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JS0KMtpP; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8D473140011F;
	Thu, 28 Aug 2025 17:45:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 28 Aug 2025 17:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756417523;
	 x=1756503923; bh=GbAoYu7sNjBNua8XfgMVVnWr13d3p8SJ3P1MbagYRZE=; b=
	g7TwXRlcBV75JMAb+Dyjs+GgbxraNW7yUgzCaEoVIrqnQgLKkulcf1BhSo90fjqJ
	8J2pkL7lmvfW32iwv1+mBdm7BV/9iTzSJNegjg/80ODBPBHsUeA0kwBNAlyOcnZ1
	3wPhrZAai0YLom2QmNlSVoyvcmZbQGVNNYA0mAivga05DUKSpnkfFsGLQeAmRRwB
	hbkyUMBEOqh31PvvsxhsutBeu2+zFdXhzL5xsvWjnhiASbmmGIW58i4Y6i4Ha8Yi
	WB0dA6xVVp8wmJFg+hTyDug396Mg+GYpU4XjNA5SFC8VrP8ZT9m7R8yy7jygZ5tR
	1qzYy68uS2MUcH7erD4cXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756417523; x=
	1756503923; bh=GbAoYu7sNjBNua8XfgMVVnWr13d3p8SJ3P1MbagYRZE=; b=J
	S0KMtpPvWe6/IUMOt20daCWCSf/EpcjtX0pHRjcfRTyZaRdGt1phvKdUNNDO8Vbf
	GcHGYKo7+YRLULLdVKJqB8KjU6yjO6VvOKK1XEmDFSm1C2DeG+MP3IHsB9wcUNNN
	OIubG3VcTcwQ+wOp8gTmYTsKzL5wg6r4bYzlllsgxNqeJf7+eqbrnOrnNCG1DqUY
	piwpA+spjs/DyXShprcS3t1Fy7IhyqhvoDypAz/KkV8wDvUFPJ1uMs0n5F8Fw/Pp
	711foiSmCb5ZFmYbmZilIGYYR7NrRaDGatJAx5RYkDapPx4EEck7Z3pSWC8WIs7B
	ZJwxjULsA4wJI0UB2UI7A==
X-ME-Sender: <xms:882waLErr0rF_gA6oxPQZAuN0dMudiP6llU_d9UuWScEpeDoamgkAQ>
    <xme:882waBT6_vaMV5_tUZDm73y5CYIfAUyfac4H75gRdnzXz7JGJR6cTaUnfd3NBIlot
    HHHOGbFHZTpW2zfnR8>
X-ME-Received: <xmr:882waIu653eVdJwhc3cYz8wj70FUDc6ix1iXGgpWKxCfe9HQongL9Jjg7WKFMrTiZZgMEk9OqnhHVw89_ezJtZHosg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedvudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeehpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhho
    rdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshes
    rhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:882waJKQ2LgQbUofRlgeP0kaO6RYgfuCtLHnocgin4B7MLsJljHB-A>
    <xmx:882waNkUdHHcKT2OFtQPneHMCgQ_Zm-mdixzfOvX3TuuKAKNiaVTiQ>
    <xmx:882waCJGIeN0ykiCNYU6T_obs_EXx1Bubjw3UhzQjm6-4x_ccQkaoQ>
    <xmx:882waK43-yNgp7w0Zb9NAdh9VVdMILGCS9hqxJmOcDutkZbCosNLew>
    <xmx:882waCTnnjwl8XtOGqtU02gEUN6CiiEO4EyCkTr_D8-zDp6PNdBxsBKh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 17:45:22 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] clocksource/drivers/sh_cmt: Do not power down channels used for events
Date: Thu, 28 Aug 2025 23:44:03 +0200
Message-ID: <20250828214403.1765311-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828214403.1765311-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250828214403.1765311-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CMT do runtime PM and call clk_enable()/clk_disable() when a new
clock event is register and the CMT is not already started. This is not
always possible as a spinlock is also needed to sync the internals of
the CMT. Running with PROVE_LOCKING uncovers one such issue.

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

Fix this by unconditionally powering on and enabling the needed clocks
for all CMT channels which are used for clock events.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clocksource/sh_cmt.c | 87 ++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 49 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 385eb94bbe7c..a57d5523f63b 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 2008 Magnus Damm
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
@@ -623,51 +624,6 @@ static void sh_cmt_stop_clocksource(struct sh_cmt_channel *ch)
 	pm_runtime_put(&ch->cmt->pdev->dev);
 }
 
-static int sh_cmt_start_clockevent(struct sh_cmt_channel *ch)
-{
-	int ret = 0;
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&ch->lock, flags);
-
-	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
-		pm_runtime_get_sync(&ch->cmt->pdev->dev);
-		ret = sh_cmt_enable(ch);
-	}
-
-	if (ret)
-		goto out;
-
-	ch->flags |= FLAG_CLOCKEVENT;
- out:
-	raw_spin_unlock_irqrestore(&ch->lock, flags);
-
-	return ret;
-}
-
-static void sh_cmt_stop_clockevent(struct sh_cmt_channel *ch)
-{
-	unsigned long flags;
-	unsigned long f;
-
-	raw_spin_lock_irqsave(&ch->lock, flags);
-
-	f = ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE);
-
-	ch->flags &= ~FLAG_CLOCKEVENT;
-
-	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
-		sh_cmt_disable(ch);
-		pm_runtime_put(&ch->cmt->pdev->dev);
-	}
-
-	/* adjust the timeout to maximum if only clocksource left */
-	if (ch->flags & FLAG_CLOCKSOURCE)
-		__sh_cmt_set_next(ch, ch->max_match_value);
-
-	raw_spin_unlock_irqrestore(&ch->lock, flags);
-}
-
 static struct sh_cmt_channel *cs_to_sh_cmt(struct clocksource *cs)
 {
 	return container_of(cs, struct sh_cmt_channel, cs);
@@ -774,19 +730,30 @@ static struct sh_cmt_channel *ced_to_sh_cmt(struct clock_event_device *ced)
 
 static void sh_cmt_clock_event_start(struct sh_cmt_channel *ch, int periodic)
 {
-	sh_cmt_start_clockevent(ch);
-
 	if (periodic)
 		sh_cmt_set_next(ch, ((ch->cmt->rate + HZ/2) / HZ) - 1);
 	else
 		sh_cmt_set_next(ch, ch->max_match_value);
 }
 
+static void sh_cmt_clock_event_stop(struct sh_cmt_channel *ch)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&ch->lock, flags);
+
+	/* adjust the timeout to maximum if only clocksource left */
+	if (ch->flags & FLAG_CLOCKSOURCE)
+		__sh_cmt_set_next(ch, ch->max_match_value);
+
+	raw_spin_unlock_irqrestore(&ch->lock, flags);
+}
+
 static int sh_cmt_clock_event_shutdown(struct clock_event_device *ced)
 {
 	struct sh_cmt_channel *ch = ced_to_sh_cmt(ced);
 
-	sh_cmt_stop_clockevent(ch);
+	sh_cmt_clock_event_stop(ch);
 	return 0;
 }
 
@@ -797,7 +764,7 @@ static int sh_cmt_clock_event_set_state(struct clock_event_device *ced,
 
 	/* deal with old setting first */
 	if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ced))
-		sh_cmt_stop_clockevent(ch);
+		sh_cmt_clock_event_stop(ch);
 
 	dev_info(&ch->cmt->pdev->dev, "ch%u: used for %s clock events\n",
 		 ch->index, periodic ? "periodic" : "oneshot");
@@ -908,6 +875,28 @@ static int sh_cmt_register(struct sh_cmt_channel *ch, const char *name,
 		ret = sh_cmt_register_clockevent(ch, name);
 		if (ret < 0)
 			return ret;
+
+		/*
+		 * To support clock events the CMT must always be ready to
+		 * accept new events, start it and leave no way for it to be
+		 * turned off.
+		 *
+		 * This is OK as we can't never unregister a CMT device. If this
+		 * is fixed in future an equal unconditional shutdown is needed.
+		 */
+		pm_runtime_get_sync(&ch->cmt->pdev->dev);
+
+		scoped_guard(raw_spinlock_irqsave, &ch->lock) {
+			ret = sh_cmt_enable(ch);
+			if (ret)
+				return ret;
+
+			/*
+			 * Flag that the channel is used as a clock event, it's not
+			 * allowed to be powered off!
+			 */
+			ch->flags |= FLAG_CLOCKEVENT;
+		}
 	}
 
 	if (clocksource) {
-- 
2.51.0


