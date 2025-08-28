Return-Path: <linux-renesas-soc+bounces-21057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E42B3ACE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 23:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 050FE68572B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 21:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639CB2C08D6;
	Thu, 28 Aug 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Nbu7fz3X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nmZkY9q+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8641718FDDB;
	Thu, 28 Aug 2025 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756417526; cv=none; b=KKEi5LSulC7KjbTzJrmScpgPYowFHydHcGIoUWKKSMWA7P8Pu2mVOkzVQ87DJ8cvGQpsUEEYi+mdv+FRLWmJxjNJakI18SxqFnJVkVI48EPU7PThSZh3DkAioMXq3c/Crf65OXuGIsMzVYNu5N/BJM+Xp+g/gXdd2oY+fJCOthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756417526; c=relaxed/simple;
	bh=v+cxwuPu/+b+5/r8kmCkXdPsvr04h6eyGwDiTpoi2WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UU3doumipHGO3GvbfmcTCvGXNj4nGH/L7+ZrQFy0HvDu1zbRb1NeUIv1+SXpLz9uFrtQGrb+BUZUMjiAHZmH35ttuX7KiTOSpcpjT/dS1ICH45c0w08kOJO8ZNIeo34I0EX9WGZmSuy/zQaVx0px+9R7bOzyuFbCnOrpJ1Bvjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Nbu7fz3X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nmZkY9q+; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 96CEBEC00A5;
	Thu, 28 Aug 2025 17:45:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 28 Aug 2025 17:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756417521;
	 x=1756503921; bh=V5M1xhIb8PZcf2L7bH9L3u0qjKJeog8JWRzYd4FrVLs=; b=
	Nbu7fz3XO4kIix66lgPogehxMGs13URhm6yk08dyIY9p1l/OnBLHg/CjRIdV34YR
	3AKri2oSfTToccfNv1q0uZsHWzMUuChMlOLlhctlTWXAR2HGQlwOjJ/4a6s0QxZL
	Ll/BjAUJ/BfwIkQs/kCAjS3y5kCU9QtWcOLKWJSSUS8T+DyGsKK3RRJ3CO4ZpINU
	MWdZUb/QNdfbA9mSu2scoesn0EF4nc7F3bIG/cJwE/Uqt7+3wnFvkoNU6busC6bV
	ChttYqizkNjBo6f2gphmDnT2/sgIZg1AuaY3ByRIvI9+KCJP+44if7Y2HG28b+IH
	CTgwrcpdiLlcBxIHL1EhKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756417521; x=
	1756503921; bh=V5M1xhIb8PZcf2L7bH9L3u0qjKJeog8JWRzYd4FrVLs=; b=n
	mZkY9q+0Q8OM3zaLjWKDTvWfBhTVGQncT6kNxX1Mjbpp+pAEmSVh12/JjvfCfLxy
	3uOoGwjE6tPeuH7AW6H3a+JOnYX/eNcLo/THcpkwpXl/CfvXDvSsfGwijaWgFP2S
	d2TsCB7o9pFDKDI4IxkqU60TrEeeI3RQ6r2WBd/YYdVIMU3lI1j1pKnLOcRwhIpz
	1NSMWyTOzpPhwFY8f4DKWl9qneGOr0sa//JDxdvcX1sJ1PuepGV1GIKgvr/6SVFc
	S2QuXEjJri6k6FBrUVtQ0J8vkXSceLGo2hZM+1iLSygcEEdxrBYDPNqYCN77Tvwz
	glr6JTaiBTuFzfq7AY0Tg==
X-ME-Sender: <xms:8c2waFOzWlyv15Tmpzx4D5RYg2q_TFz03uEMplqVKWxL-T0koDz_uA>
    <xme:8c2waFGpVE-Zfe7pFQmpCBsInjhTQXxJjV5BfMAQXb8W8PS7xU6L5Yo3-8PaCCJvl
    TuG-EG8rcC328tswxE>
X-ME-Received: <xmr:8c2waDQ30y8USpCvEZPTbQSWYlnozc4nL1QD5YAy_kYKIWDzZEf-r-k2rSFrWPuBQLZ3_qae1Zz_98aQ2du886D26w>
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
X-ME-Proxy: <xmx:8c2waCuBsHKaAE6dDxrROWeE5rz0FinxaNCPS-DchqHQWU-CeiUQzQ>
    <xmx:8c2waLLiSL5_t-a5OfgPv23BOBpbkwovJJtK9lScS9Lpo53s2Me67Q>
    <xmx:8c2waHnMjyE0VnN2ELc5txJyIkyOp1bQ_eDXqrEPuurB5vHYQAJRaA>
    <xmx:8c2waEI1aM0b1_06nMjzFSsL8nmYs-iyvOuzN5U3Mk9Bp7RexvQ0Jg>
    <xmx:8c2waBZ-33JwqdGdJfiwaSG7unQj98dKAgcWGXusDC--m5ssUMe5fr5w>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 17:45:20 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] clocksource/drivers/sh_cmt: Split start/stop of clock source and events
Date: Thu, 28 Aug 2025 23:44:02 +0200
Message-ID: <20250828214403.1765311-2-niklas.soderlund+renesas@ragnatech.se>
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

The CMT do a housekeeping such as dealing with runtime PM and
enable/disable clocks when either a clock source is enabled, or when a
new clock event is registered.

Doing this type of housekeeping for when a clock event is registered is
not always possible as it can happen in contexts where holding spinlocks
is not possible. However doing it when registering a clock source is
possible.

As a first step to address this design break apart the CMT start and
stop functions. The path for clock sources need not change, while the
one for clock events need to be reworked in future work.

There is no indented functional change, just breaking the two use-cases
controlled by a flag into two distinct functions.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clocksource/sh_cmt.c | 94 ++++++++++++++++++++++++------------
 1 file changed, 64 insertions(+), 30 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index b72b36e0abed..385eb94bbe7c 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -578,37 +578,74 @@ static irqreturn_t sh_cmt_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int sh_cmt_start(struct sh_cmt_channel *ch, unsigned long flag)
+static int sh_cmt_start_clocksource(struct sh_cmt_channel *ch)
 {
 	int ret = 0;
 	unsigned long flags;
 
-	if (flag & FLAG_CLOCKSOURCE)
-		pm_runtime_get_sync(&ch->cmt->pdev->dev);
+	pm_runtime_get_sync(&ch->cmt->pdev->dev);
 
 	raw_spin_lock_irqsave(&ch->lock, flags);
 
-	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
-		if (flag & FLAG_CLOCKEVENT)
-			pm_runtime_get_sync(&ch->cmt->pdev->dev);
+	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
 		ret = sh_cmt_enable(ch);
-	}
 
 	if (ret)
 		goto out;
-	ch->flags |= flag;
+
+	ch->flags |= FLAG_CLOCKSOURCE;
 
 	/* setup timeout if no clockevent */
-	if (ch->cmt->num_channels == 1 &&
-	    flag == FLAG_CLOCKSOURCE && (!(ch->flags & FLAG_CLOCKEVENT)))
+	if (ch->cmt->num_channels == 1 && !(ch->flags & FLAG_CLOCKEVENT))
 		__sh_cmt_set_next(ch, ch->max_match_value);
+out:
+	raw_spin_unlock_irqrestore(&ch->lock, flags);
+
+	return ret;
+}
+
+static void sh_cmt_stop_clocksource(struct sh_cmt_channel *ch)
+{
+	unsigned long flags;
+	unsigned long f;
+
+	raw_spin_lock_irqsave(&ch->lock, flags);
+
+	f = ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE);
+
+	ch->flags &= ~FLAG_CLOCKSOURCE;
+
+	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
+		sh_cmt_disable(ch);
+
+	raw_spin_unlock_irqrestore(&ch->lock, flags);
+
+	pm_runtime_put(&ch->cmt->pdev->dev);
+}
+
+static int sh_cmt_start_clockevent(struct sh_cmt_channel *ch)
+{
+	int ret = 0;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&ch->lock, flags);
+
+	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
+		pm_runtime_get_sync(&ch->cmt->pdev->dev);
+		ret = sh_cmt_enable(ch);
+	}
+
+	if (ret)
+		goto out;
+
+	ch->flags |= FLAG_CLOCKEVENT;
  out:
 	raw_spin_unlock_irqrestore(&ch->lock, flags);
 
 	return ret;
 }
 
-static void sh_cmt_stop(struct sh_cmt_channel *ch, unsigned long flag)
+static void sh_cmt_stop_clockevent(struct sh_cmt_channel *ch)
 {
 	unsigned long flags;
 	unsigned long f;
@@ -616,22 +653,19 @@ static void sh_cmt_stop(struct sh_cmt_channel *ch, unsigned long flag)
 	raw_spin_lock_irqsave(&ch->lock, flags);
 
 	f = ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE);
-	ch->flags &= ~flag;
+
+	ch->flags &= ~FLAG_CLOCKEVENT;
 
 	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
 		sh_cmt_disable(ch);
-		if (flag & FLAG_CLOCKEVENT)
-			pm_runtime_put(&ch->cmt->pdev->dev);
-	}
-
-	/* adjust the timeout to maximum if only clocksource left */
-	if ((flag == FLAG_CLOCKEVENT) && (ch->flags & FLAG_CLOCKSOURCE))
-		__sh_cmt_set_next(ch, ch->max_match_value);
-
-	raw_spin_unlock_irqrestore(&ch->lock, flags);
-
-	if (flag & FLAG_CLOCKSOURCE)
 		pm_runtime_put(&ch->cmt->pdev->dev);
+	}
+
+	/* adjust the timeout to maximum if only clocksource left */
+	if (ch->flags & FLAG_CLOCKSOURCE)
+		__sh_cmt_set_next(ch, ch->max_match_value);
+
+	raw_spin_unlock_irqrestore(&ch->lock, flags);
 }
 
 static struct sh_cmt_channel *cs_to_sh_cmt(struct clocksource *cs)
@@ -672,7 +706,7 @@ static int sh_cmt_clocksource_enable(struct clocksource *cs)
 
 	ch->total_cycles = 0;
 
-	ret = sh_cmt_start(ch, FLAG_CLOCKSOURCE);
+	ret = sh_cmt_start_clocksource(ch);
 	if (!ret)
 		ch->cs_enabled = true;
 
@@ -685,7 +719,7 @@ static void sh_cmt_clocksource_disable(struct clocksource *cs)
 
 	WARN_ON(!ch->cs_enabled);
 
-	sh_cmt_stop(ch, FLAG_CLOCKSOURCE);
+	sh_cmt_stop_clocksource(ch);
 	ch->cs_enabled = false;
 }
 
@@ -696,7 +730,7 @@ static void sh_cmt_clocksource_suspend(struct clocksource *cs)
 	if (!ch->cs_enabled)
 		return;
 
-	sh_cmt_stop(ch, FLAG_CLOCKSOURCE);
+	sh_cmt_stop_clocksource(ch);
 	dev_pm_genpd_suspend(&ch->cmt->pdev->dev);
 }
 
@@ -708,7 +742,7 @@ static void sh_cmt_clocksource_resume(struct clocksource *cs)
 		return;
 
 	dev_pm_genpd_resume(&ch->cmt->pdev->dev);
-	sh_cmt_start(ch, FLAG_CLOCKSOURCE);
+	sh_cmt_start_clocksource(ch);
 }
 
 static int sh_cmt_register_clocksource(struct sh_cmt_channel *ch,
@@ -740,7 +774,7 @@ static struct sh_cmt_channel *ced_to_sh_cmt(struct clock_event_device *ced)
 
 static void sh_cmt_clock_event_start(struct sh_cmt_channel *ch, int periodic)
 {
-	sh_cmt_start(ch, FLAG_CLOCKEVENT);
+	sh_cmt_start_clockevent(ch);
 
 	if (periodic)
 		sh_cmt_set_next(ch, ((ch->cmt->rate + HZ/2) / HZ) - 1);
@@ -752,7 +786,7 @@ static int sh_cmt_clock_event_shutdown(struct clock_event_device *ced)
 {
 	struct sh_cmt_channel *ch = ced_to_sh_cmt(ced);
 
-	sh_cmt_stop(ch, FLAG_CLOCKEVENT);
+	sh_cmt_stop_clockevent(ch);
 	return 0;
 }
 
@@ -763,7 +797,7 @@ static int sh_cmt_clock_event_set_state(struct clock_event_device *ced,
 
 	/* deal with old setting first */
 	if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ced))
-		sh_cmt_stop(ch, FLAG_CLOCKEVENT);
+		sh_cmt_stop_clockevent(ch);
 
 	dev_info(&ch->cmt->pdev->dev, "ch%u: used for %s clock events\n",
 		 ch->index, periodic ? "periodic" : "oneshot");
-- 
2.51.0


