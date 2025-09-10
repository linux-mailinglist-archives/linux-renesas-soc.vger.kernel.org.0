Return-Path: <linux-renesas-soc+bounces-21728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105CB51946
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F333BB6FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4EE326D54;
	Wed, 10 Sep 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VgQkqlKd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dGkiLFiM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD321FBC8C;
	Wed, 10 Sep 2025 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514440; cv=none; b=Ap4CsjW7w8WMxuVyQvjSjMbsT0bNXgTE90cUErpmyNTxHQ7bXfiJwW6P7Nr0yd5tVMdpgrKnGr8PNtmPCDpNai/LTi4WXVW1T7yz/h7pF2uCkh/OUcHgcOW7aKAywHe64oia4pzPCI5ogFI6DVBftBhHzhTgA7QIi/3c4E/m+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514440; c=relaxed/simple;
	bh=PCPepHdV2Vy5tpAzVJmxJ8j5Q9lZ2wvd8/Sxsayvt0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FzCpogCfCn5q8rOyuuNwP0qrSIuj7oQ3T9ixtkhSJGUX5Y2wLvN21uTZNb0Afpa2tShzB/xVt3tyqlg4JBoRUYYPk7M7fnt9unaEr7bmisEfCnktOkOFPpYVaguu3zDGIseRR7kochYQNpgU/iRw7bFisPFvidumXHPqk0z8kWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VgQkqlKd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dGkiLFiM; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 738631400333;
	Wed, 10 Sep 2025 10:27:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 10 Sep 2025 10:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757514437;
	 x=1757600837; bh=mUyNLrwVn8Ddwdpic0mdUnTE94lBlBUX/IMQMQLHubo=; b=
	VgQkqlKdektNxd+kZgfuGXsGGITxgQ57AqSZkt9rdzFA5EtVuF7Rlh5XmtXzZTqc
	+4eN9sccorRQMAts9ZCcMw1kmG0SPbYYQu7/eLC0WtyiQbJL0GV9ep/i1+10fNmb
	R0hes8XwoIExwzxaLOk42JR4TMpzkuzNENU05gOXnIsURCTM4ddx8wr4/P48zUVT
	OFolL6WnNhoSZBWzcRM8ECa3BP/MnoHK92jmaFI1F2eJNQnqi7bNA0/NHXy0Uhox
	7JrGlKnp3HS0Py4T+xwYHIaf7M5lPgxp478ohxzFdtHsd/Vc/p7TjNoiuVW45tQW
	T7I7csVqSPnRw2fjCELhJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757514437; x=
	1757600837; bh=mUyNLrwVn8Ddwdpic0mdUnTE94lBlBUX/IMQMQLHubo=; b=d
	GkiLFiMa0uz50yEQHoEuDXf8f26NsHPj0WmVm0hpagDgmrCAIQqGkrH5UtonO4cy
	a+smsH/j8eBhWUJKyrekREJBmvmMF/eWzNvUdY0FNvYGT9MbL5AY6Pq4H6znELJN
	zfj5BEQqJ2ox/KT8XxP/oV02MXjVybvmVi8/L2GmxNZdHTOAxeQcM4YI0hYjGs3C
	J4YCvnKo26UNYOMj80ESDQajnHRH/ogNGyAD0e9KAS6q1jAUjhjTWyHoy2FfsxK8
	C/PtA0rBQ+Pwvc7MUAAJp8nlZ2wDemKeyNjh9JdZ7SbMC4lMoCXXz8l/4n0jCk4q
	6CQf64aXPtxTv2T92K0oA==
X-ME-Sender: <xms:xYrBaAJo9yWx0Z-VjYgaaPB2Zl0uwuR85kDjM17LQ2AhGG1omI58aA>
    <xme:xYrBaD_pVVfFcjjtxlmaN99K_Lda-8itFODoa3oUb5pGlKktomhDORPfNffqB-psl
    MgJZ6HQg8BZMg0Zops>
X-ME-Received: <xmr:xYrBaJxJhFl3fF1tRKYELRfa1HNff25KYHQjBC5L6NTPFVSluJgKWtk2SeP1r4nc_s8M0_RIRY7CNyI7EeDrWkVXgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdr
    ohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtth
    hopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtg
    hhrdhsvgdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
X-ME-Proxy: <xmx:xYrBaA7bH4-p2YQ9lNKaaYduempowb7L2h784ODm_B70gyIrqphYhg>
    <xmx:xYrBaA_UrzJqOtmidf6aed1fbLBObkQrj1kXDN3taU7QHuWhyjp9wQ>
    <xmx:xYrBaFqCw6CFVTWbe0To7UIjBI9MBa2xj2_6QcMedv01CC41VuAF5g>
    <xmx:xYrBaBp6PMYPJCLTr14j05ep0al85YQUolXgTiJUo3Ih5QVPlhKSAw>
    <xmx:xYrBaKNHuOCNO-cju0OLOOo-n2jiEZIXhhuQM4ZtyfN8xds1Es2bDRwI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Sep 2025 10:27:16 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] clocksource/drivers/sh_cmt: Split start/stop of clock source and events
Date: Wed, 10 Sep 2025 16:26:56 +0200
Message-ID: <20250910142657.1148696-2-niklas.soderlund+renesas@ragnatech.se>
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
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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


