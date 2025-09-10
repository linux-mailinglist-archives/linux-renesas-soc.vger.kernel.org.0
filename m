Return-Path: <linux-renesas-soc+bounces-21729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E88B51948
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11A9756076D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF56132A3DE;
	Wed, 10 Sep 2025 14:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="j1wsQuik";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FWkXssLH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D323324B39;
	Wed, 10 Sep 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514442; cv=none; b=C14bMMp3/hdtW4XMlOYK5YpXCHjxPyYoEz8CfjLK7LZ1gpjAUtVOZ2IiRQUO07vRXsHSHXiDXYKBB4PbrFpRHFStrZ2xuJTr5MQSTPBqF63rlLAEm177ewI9BeJarf2HF2s2oX1KlOMhuInJU2BmjN0+2+i8XrG0dCjod3pJ0Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514442; c=relaxed/simple;
	bh=oVdxT8e4mIeiOUt1Wxhpec4L5BVhmotEmX1HMznrM5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=seN6uO3bor01bFk6Qq1QKa9nJvIp7s3QyJNWJuhDlGE1drtW+0WXAYdWOXYZGhzU8qfWMLkr3kyJ9BOMT39UFqBq+66bT1PD6mR6b5iF01YSuzwArcwGVWYSW60FRbnZs2dgp931IsHeF16e4Sz4QYPC341UY4Twk9u4MJ22zXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=j1wsQuik; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FWkXssLH; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id B4FF4EC0444;
	Wed, 10 Sep 2025 10:27:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 10 Sep 2025 10:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757514439;
	 x=1757600839; bh=Moy313tjpmEs6VRqUYX0WCS/yOFUFxPPxWuDqx9dbNY=; b=
	j1wsQuiko+rd2511d4uoNmmL09SSP/s+/6qSs87yWiq/E0R2caDMzZDefDDB7+dA
	o3pmKvUdHUdlaPW6hRTeCManZfn5gfaGyBcPXrvq1R4iq4f9HqE2HTCHL2Il73oG
	fcveG9vV1ZWAwthHTxnS/dLK4DA/4JlxDUI86QqIePxh33JEscoZGY9c4u97uvus
	y9wkY/65yBlP+h33bF30JhxVVTzpuly4fueGtpMpCmSOx1iDDNH2azU6l1NQl6JR
	H7PHvliY3toC2AegFuquM0vFv1aPLkD/AJOxHlAMgHDHB6udP6bjgiSLu2n3H6s3
	WMSKEDWC8yBqgIm3wSoDCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757514439; x=
	1757600839; bh=Moy313tjpmEs6VRqUYX0WCS/yOFUFxPPxWuDqx9dbNY=; b=F
	WkXssLH4UIocxU4tL1WeFBpFy/w3T7qMSRjRumU8AfmezdySQQjDi+EU04mBCkx5
	2RCDhHl6zDCDdLlLsR+6p6CDK/T7/2n1H4zTNzb1igQYpSWDVLA61TKkDsXRbT7R
	mrtvsixu/IebdNYyGeJrXQtOO50apZ3Mw4hSjyERD3nyukInX+n3twAcP7wNoSrN
	pE6s/U9v8mWJ1M91gaOEEbG941q3jpSQ3RdEGdT/Jeka5HedDrTwmEvxtLsRaccn
	Bg6LAZknmsNEvkZzHcGXPLxAqVSzLdfNw3OBlOPj0oCItjpCIWHKKeN8B42uPizi
	HkUP4yNqpljQlGhApuv5w==
X-ME-Sender: <xms:x4rBaGVIlU5ChuFFLEcpgkqonlNqEx0J91XYK3cQC5ZvYWB2QBiMnw>
    <xme:x4rBaDVgLE6xmlsq6t7TIr1xP5_cSbgIVvkUDpEjIstKFDpXZcTwon9P5sW88VbYF
    Q1KyQMZ6s4BxBkS_ig>
X-ME-Received: <xmr:x4rBaGizYF2Hup-sloi3HO8vfLQL_yA0myMGIW2cbn6lSzSMaxZISEob6-BrFJt5PZynHFNmDaX772dyorJC1qR9-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdr
    ohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtth
    hopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtg
    hhrdhsvg
X-ME-Proxy: <xmx:x4rBaOZJREXi8LPpfoOVDGsx039cMitg3hotZnNJEI2rt7w_hZp8qg>
    <xmx:x4rBaDofTmsqP-1XROZOHo_Hsik79c1Dd7Z-hrVLw06ikmi41wiYAg>
    <xmx:x4rBaLNDDeHPDh9hqg0wGoJ7BBAZx0hdzCythaf-xOJw8YftzSGAZw>
    <xmx:x4rBaGoTLO8USmgMq5K-MPhcZj7PTFa_7a3cKPiOMf6PuIs1maZ2Mg>
    <xmx:x4rBaE6k0T7sDhweFDjifo3UFuj5oGpdaF_oi3EAhRpzpHFKsC_lNxdk>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Sep 2025 10:27:18 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] clocksource/drivers/sh_cmt: Do not power down channels used for events
Date: Wed, 10 Sep 2025 16:26:57 +0200
Message-ID: <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
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
for all CMT channels which are used for clock events. Do this before
registering any clock source or event to avid having to take the
spin lock at probe time.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Move the unconditional power on case before registering any clock
  source or event to avoid having to use the spinlock to synchronize the
  powerup sequence in probe.
---
 drivers/clocksource/sh_cmt.c | 91 +++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 49 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 385eb94bbe7c..1d91730ee3cb 100644
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
@@ -968,6 +935,32 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 	ch->match_value = ch->max_match_value;
 	raw_spin_lock_init(&ch->lock);
 
+	if (clockevent) {
+		/*
+		 * To support clock events the CMT must always be ready to
+		 * accept new events, start it and leave no way for it to be
+		 * turned off.
+		 *
+		 * This is OK as we can't never unregister a CMT device. If this
+		 * is fixed in future an equal unconditional shutdown is needed.
+		 *
+		 * We don't need to hold the channel lock here as we have not
+		 * yet register any clock source or event so there is no
+		 * possible race. And holding the spinlock at probe time
+		 * produces lockdep warnings.
+		 */
+		pm_runtime_get_sync(&ch->cmt->pdev->dev);
+		ret = sh_cmt_enable(ch);
+		if (ret)
+			return ret;
+
+		/*
+		 * Flag that the channel is used as a clock event, it's not
+		 * allowed to be powered off!
+		 */
+		ch->flags |= FLAG_CLOCKEVENT;
+	}
+
 	ret = sh_cmt_register(ch, dev_name(&cmt->pdev->dev),
 			      clockevent, clocksource);
 	if (ret) {
-- 
2.51.0


