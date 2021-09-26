Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CB6418A0E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Sep 2021 17:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhIZPzk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 26 Sep 2021 11:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbhIZPzk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Sep 2021 11:55:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6C3C061570
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Sep 2021 08:54:03 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i25so65655267lfg.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Sep 2021 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WraWdZ/CzTYmuzEHanbN0/OAtgST0aRafGy3nu87PmE=;
        b=Js4Vor9UROzDBLcAkvg/OhbJBleWHe31URp/HIfjGU6uP1TZtoWyOKhX1RQRGGt61T
         zz4jW+tHZ2wB5IUM2eOqmE00fmB/SGV/0/7dKg4v8rWoGO5Uv0WX3fUSFwhV71YecH/S
         LaqFIFV7rqLu1gHq3mBkGWthUkDtcddNe5wTEzpA3kYut3ro0caemRZrNZnnZm+caDlr
         0p4+hxxwRhkltonH+TjMUbh4cn7+L6CdvB+v33sBjpfnpFAwjBWjzhwFRnQdhrNk5SFm
         jV8dh2lyX/noz4Ez4NB+J+h/lrAEqSYahxrvcqboBzoFtiGTzQ6glM70Yg8U2Om77f6o
         6j8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WraWdZ/CzTYmuzEHanbN0/OAtgST0aRafGy3nu87PmE=;
        b=3FD+aI/Hn8ok7nsRrEuf5ofTLlt0yMe+wt4rXVPgunTMi7a00u0mL/GPlhpNJ15vpI
         lDlchU/8doxVi2uSeL8kU1maWB1DCIbM8AEFF7yO0ZFFVyq+1JizC5CJlcRAcRtW5Do9
         BVuAnDP00RkVkpITtGJ4qezyzTGk1hjtSS5Ta5DlUBhVSZliX2vXP2JqwqD9fIx15KtI
         GPcTgUCVi2T9scl6zrhSVjVY0ybUb2L/roSgDbKnqCRjux34F3GfQpz7sFvaJzZeRCdV
         5fnqNRnwrItRcxVH9JFdkrM0keddcfbDgWZEUWOLGEB5ThrLrYANTYDObM++zKdg260N
         JKXA==
X-Gm-Message-State: AOAM5304sqvWfd8w8Q7/HIjErh4D8NoeqdMiIIAbnzl7wn4qUO1HcIHt
        Jpx0y6E0r2qkxExOqrKxasAzOg==
X-Google-Smtp-Source: ABdhPJwhSuhNqmpQKcNCGuFpj3palWu3b0H+8Kk6qJhtRgBvJthM/hzRRlIMHcHqnaX61r7YNnIkrg==
X-Received: by 2002:a05:6512:32c6:: with SMTP id f6mr20773651lfg.304.1632671641694;
        Sun, 26 Sep 2021 08:54:01 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id a21sm1811770lji.135.2021.09.26.08.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 08:54:01 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] media: vsp1: mask interrupts before enabling
Date:   Sun, 26 Sep 2021 18:53:56 +0300
Message-Id: <20210926155356.23861-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Setting up VSP interrupt handler without masking interrupt before causes
interrupt handler to be immediately called (and crash due to null pointer
dereference) on r8a77951-ulcb-kf board.

Fix that by explicitly masking all interrupts before setting the interrupt
handler. To do so, have to set the interrupt handler later, after hw
revision is already detected and number of interrupts to mask gets
known.

Based on patch by Koji Matsuoka <koji.matsuoka.xm@renesas.com> included
in the Renesas BSP kernel. Updated that to use wfp_count as the number of
WPF interrupts to mask.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/media/platform/vsp1/vsp1_drv.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index de442d6c9926..0e9a6fad54f8 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -811,13 +811,6 @@ static int vsp1_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = devm_request_irq(&pdev->dev, irq->start, vsp1_irq_handler,
-			      IRQF_SHARED, dev_name(&pdev->dev), vsp1);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ\n");
-		return ret;
-	}
-
 	/* FCP (optional). */
 	fcp_node = of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
 	if (fcp_node) {
@@ -847,7 +840,6 @@ static int vsp1_probe(struct platform_device *pdev)
 		goto done;
 
 	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
-	vsp1_device_put(vsp1);
 
 	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
 		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
@@ -861,11 +853,26 @@ static int vsp1_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
 			vsp1->version);
 		ret = -ENXIO;
+		vsp1_device_put(vsp1);
 		goto done;
 	}
 
 	dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
 
+	for (i = 0; i < vsp1->info->lif_count; ++i)
+		vsp1_write(vsp1, VI6_DISP_IRQ_ENB(i), 0);
+	for (i = 0; i < vsp1->info->wpf_count; ++i)
+		vsp1_write(vsp1, VI6_WPF_IRQ_ENB(i), 0);
+
+	vsp1_device_put(vsp1);
+
+	ret = devm_request_irq(&pdev->dev, irq->start, vsp1_irq_handler,
+			       IRQF_SHARED, dev_name(&pdev->dev), vsp1);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request IRQ\n");
+		goto done;
+	}
+
 	/* Instantiate entities. */
 	ret = vsp1_create_entities(vsp1);
 	if (ret < 0) {
-- 
2.30.2

