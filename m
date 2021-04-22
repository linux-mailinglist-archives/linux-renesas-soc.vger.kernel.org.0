Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D14036809B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Apr 2021 14:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236416AbhDVMi0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Apr 2021 08:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbhDVMiE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Apr 2021 08:38:04 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83D0C06138B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Apr 2021 05:37:23 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id d21so33164538edv.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Apr 2021 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JR/ohowrtLcV5EoexnHkmXA7g/K6wA5k0ODCUc55MrQ=;
        b=EbTfS0OnjfPIo8CLI7Kw06qjI6nTvLfrOHGtaa4Z05qvmuPT+49XZcfL5GQ72Uf0Wp
         He5gTnnscXYAyWJbY2iKC05Y4WTZ7WyhTG3SJ8suG5gc+9GUsYLl7F0tjJK0dMYCh/uM
         bZ5AucQtsAlqOA1Q7MA9V68HIcCz/h2sWb5tfB21zfK4P2mqzIjk4jVa5f2YAo1tpIgE
         KqKkfA2c1UE0glKTmGNhaxaVx1YWndHzX7X2LgJlPRAu0q5Pdo6r2hZlTYQJU/jckorU
         NclYU9LFqEDHmqO3uBXA/BgyzUivg5/5ZfQ/bpvfcE191xDLHgZZbwbtvZHxsO0U0uUH
         QZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JR/ohowrtLcV5EoexnHkmXA7g/K6wA5k0ODCUc55MrQ=;
        b=iq5tebrYygIyEkPcl6N1k45hF6kRLnEVaIRiAMNTZAeuFmNww7RSdndEUO7/p/xjPT
         30cEM0MClBl8b5q7hzu5OLwV7Y5sZGlf5VBYmop4lHs4BViif4XkHSQ3tJkpvi2+N99l
         9WaR6TEV8iHW80y2FZ+fpYiFXfv49Io+UeAKwJpry74S6xX0p5/sU2HwjjT3PHsvu4EZ
         1NrB+i4rlqRc9uEvUm+JuFBExfs+pGrnjPU6RwCMlnxdW5tt6Mo7FF7ndTobx+YZ3NBo
         RbWXRP4mEwFMgRbRRUlb4k+GKL45DF1xzPUgfp1KLxSmjYw6qvTyXnfm9geTucub+aHU
         XcWA==
X-Gm-Message-State: AOAM533WedO/TpE/s9XbfKsLdZFfRv8Zfrw+dOP3iCudWItyHJddFLqc
        +Bj1BeaCSbprSv7Kp7CZkc09Yg==
X-Google-Smtp-Source: ABdhPJxAGETdhJq7JPBmmn3ZILGHdiFweVYF3EwOakSG1KETyfslEpfS8Tj8qpsB2rHK2mGdehIS+g==
X-Received: by 2002:a05:6402:785:: with SMTP id d5mr3599891edy.134.1619095042545;
        Thu, 22 Apr 2021 05:37:22 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id p24sm2064275edt.5.2021.04.22.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 05:37:22 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clocksource: sh_cmt: Fix wrong setting if don't request IRQ for clock source channel
Date:   Thu, 22 Apr 2021 14:34:43 +0200
Message-Id: <20210422123443.73334-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

If CMT instance has at least two channels, one channel will be used
as a clock source and another one used as a clock event device.
In that case, IRQ is not requested for clock source channel so
sh_cmt_clock_event_program_verify() might work incorrectly.
Besides, when a channel is only used for clock source, don't need to
re-set the next match_value since it should be maximum timeout as
it still is.

On the other hand, due to no IRQ, total_cycles is not counted up
when reaches compare match time (timer counter resets to zero),
so sh_cmt_clocksource_read() returns unexpected value.
Therefore, use 64-bit clocksoure's mask for 32-bit or 16-bit variants
will also lead to wrong delta calculation. Hence, this mask should
correspond to timer counter width, and above function just returns
the raw value of timer counter register.

Fixes: bfa76bb12f23 ("clocksource: sh_cmt: Request IRQ for clock event device only")
Fixes: 37e7742c55ba ("clocksource/drivers/sh_cmt: Fix clocksource width for 32-bit machines")
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clocksource/sh_cmt.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index c98f8851fd680454..cadd09ad1a0946b9 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -578,7 +578,8 @@ static int sh_cmt_start(struct sh_cmt_channel *ch, unsigned long flag)
 	ch->flags |= flag;
 
 	/* setup timeout if no clockevent */
-	if ((flag == FLAG_CLOCKSOURCE) && (!(ch->flags & FLAG_CLOCKEVENT)))
+	if (ch->cmt->num_channels == 1 &&
+	    flag == FLAG_CLOCKSOURCE && (!(ch->flags & FLAG_CLOCKEVENT)))
 		__sh_cmt_set_next(ch, ch->max_match_value);
  out:
 	raw_spin_unlock_irqrestore(&ch->lock, flags);
@@ -620,20 +621,25 @@ static struct sh_cmt_channel *cs_to_sh_cmt(struct clocksource *cs)
 static u64 sh_cmt_clocksource_read(struct clocksource *cs)
 {
 	struct sh_cmt_channel *ch = cs_to_sh_cmt(cs);
-	unsigned long flags;
 	u32 has_wrapped;
-	u64 value;
-	u32 raw;
 
-	raw_spin_lock_irqsave(&ch->lock, flags);
-	value = ch->total_cycles;
-	raw = sh_cmt_get_counter(ch, &has_wrapped);
+	if (ch->cmt->num_channels == 1) {
+		unsigned long flags;
+		u64 value;
+		u32 raw;
 
-	if (unlikely(has_wrapped))
-		raw += ch->match_value + 1;
-	raw_spin_unlock_irqrestore(&ch->lock, flags);
+		raw_spin_lock_irqsave(&ch->lock, flags);
+		value = ch->total_cycles;
+		raw = sh_cmt_get_counter(ch, &has_wrapped);
 
-	return value + raw;
+		if (unlikely(has_wrapped))
+			raw += ch->match_value + 1;
+		raw_spin_unlock_irqrestore(&ch->lock, flags);
+
+		return value + raw;
+	}
+
+	return sh_cmt_get_counter(ch, &has_wrapped);
 }
 
 static int sh_cmt_clocksource_enable(struct clocksource *cs)
@@ -696,7 +702,7 @@ static int sh_cmt_register_clocksource(struct sh_cmt_channel *ch,
 	cs->disable = sh_cmt_clocksource_disable;
 	cs->suspend = sh_cmt_clocksource_suspend;
 	cs->resume = sh_cmt_clocksource_resume;
-	cs->mask = CLOCKSOURCE_MASK(sizeof(u64) * 8);
+	cs->mask = CLOCKSOURCE_MASK(ch->cmt->info->width);
 	cs->flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
 	dev_info(&ch->cmt->pdev->dev, "ch%u: used as clock source\n",
-- 
2.31.1

