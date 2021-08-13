Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171623EB7D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 17:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241320AbhHMPJb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 11:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241270AbhHMPJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 11:09:26 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF96C061292
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 08:08:59 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h13so13785051wrp.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MiAu4Z8LjA1jtagE+o9XE0peuWMmYw2d2UPpNQceGYc=;
        b=WRJfD/axNkbzHc9ld30D07yJhZJ15RrKg+KTlUlBVnaJVm2YY6INSzzoEJELkl9gK0
         aGPwC2USk/z8fxeC7giIeFVwHF1Isd1WL/I0s1crNqQKxvLhw97+g/00Q1Do1EgpHtoy
         4hIRQ8XfZWGkVTiStaVDOoj9LFO5ergZOfjI1T590JCLwxff8LpHjtH4XHAuWyDD7H++
         zIPkJM3wWg3i3G7Wqrjh+IXTNdXl0RuiuZN7sktBYAbJanwfn5AiDcDDJJJU2eB3d6eU
         62loY/tZs09qqg6VBvZ4QBniTtpU6J/b9Bt5jcIZpZW6VQOYC9fmrbd23/USVV45Nw0E
         4//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MiAu4Z8LjA1jtagE+o9XE0peuWMmYw2d2UPpNQceGYc=;
        b=fa5u4T/MYPaNmdoUnaTqK3kwwE3RzhCAlxx0iULaxf7rzuIbWfiwhWn2Uh8Nsv4CyU
         mpNuYxEdUcHItWV28O/BnsbKLlD0VoWEcLkjhZq7UscQ0qymQPUffcTVAw7NN44cRmbw
         HJe9LA7I7guqD8vt3ZZyJ6tVsbemgRVyXSjnrkNJeFgObxI6p7kEGbNPiDLuj1PqPCb0
         wmjbtKNPaZBUxc36Q8HPh4itu2IpKP1/gd6+qivlnIXm47FA9yUPdk0i1JWKnj/+rbyS
         3xBKPcGd+aBL7coNX/1vQLodgR1DTYlVtAN6RexAjSM6StqkFLp3qh81jBnumuykv0Yg
         igPA==
X-Gm-Message-State: AOAM531Klh3MI/KHVWQ/w0upxsFjJviUKQCWdNMfStSDRaZH+H0jpQYK
        gkWJumsclU+e2AlAkrGhx2j1Cg==
X-Google-Smtp-Source: ABdhPJww6+pIROS9DTmsoIAwxtvURwjRSmy+0UbYqqK5noP6fvneTtzPZmdA+CaS/72OCFTUiWzW4w==
X-Received: by 2002:adf:e107:: with SMTP id t7mr3726923wrz.165.1628867338451;
        Fri, 13 Aug 2021 08:08:58 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h4sm1799575wrm.42.2021.08.13.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:08:57 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Suresh Udipi <sudipi@jp.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: rcar-csi2: Correct the selection of hsfreqrange
Date:   Fri, 13 Aug 2021 17:07:54 +0200
Message-Id: <20210813150756.131826-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813150756.131826-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210813150756.131826-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Suresh Udipi <sudipi@jp.adit-jv.com>

hsfreqrange should be chosen based on the calculated mbps which
is closer to the default bit rate  and within the range as per
table[1]. But current calculation always selects first value which
is greater than or equal to the calculated mbps which may lead
to chosing a wrong range in some cases.

For example for 360 mbps for H3/M3N
Existing logic selects
Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]

This hsfreqrange is out of range.

The logic is changed to get the default value which is closest to the
calculated value [1]

Calculated value 360Mbps : Default 350Mbps  Range [320.625 -380.625 mpbs]

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]

Please note that According to Renesas in Table 25.9 the range for
220 default value is corrected as below

 |Range (Mbps)     |  Default  Bit rate (Mbps) |
 -----------------------------------------------
 | 197.125-244.125 |     220                   |
 -----------------------------------------------

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 711b52ba42b54afd..d042967335edbd6a 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -543,16 +543,23 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
 static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 {
 	const struct rcsi2_mbps_reg *hsfreq;
+	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
 
-	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
+	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
 		if (hsfreq->mbps >= mbps)
 			break;
+		hsfreq_prev = hsfreq;
+	}
 
 	if (!hsfreq->mbps) {
 		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
 
+	if (hsfreq_prev &&
+	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
+		hsfreq = hsfreq_prev;
+
 	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
 
 	return 0;
-- 
2.32.0

