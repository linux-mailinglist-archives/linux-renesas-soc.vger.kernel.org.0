Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D004498FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239413AbhKHQFh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239389AbhKHQFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:05:36 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22900C061570
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Nov 2021 08:02:52 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id u1so27746137wru.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Nov 2021 08:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mojgCVLJMoKThIT8DUdaUryxFtRnWF1rpJJ1434yAp0=;
        b=CpYHFkMqPklcIrKCPcb9eQ3PWegg8QW5dmM9XK+Q2liuQZzWtDbnCtOb9DE4AevjHS
         51bnluVKvKFBF4Lj3a4NOTmBRuH3cqTwwf/aVHrq23pgc0vG/YRgv7j4sX4RtrnErI7Y
         2NgjNtudKHb7D/CucFTZ5Mvpcci1aqFcjn18Hmf7TSugtkwBhCd+6nlPaKWjNyABATWS
         +y03y/GJGj88HM4bgdjYirt0r4OQ2c2adozYXzr1Vb9KKJMbnvpYj3fX+qrMtRqc3IrZ
         WJ/jYmPgopSjn9UM4KMq/ctSTMN0V4aWuJw+oVe7LPaJBxucfhDOifUllLdXISjSl9YN
         x00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mojgCVLJMoKThIT8DUdaUryxFtRnWF1rpJJ1434yAp0=;
        b=FqP0URf7zzNjtEUNICnwG22EJLWnPERxXdJDyX8Q0p22okJKl0NqnryRI0AqtFf2RY
         T1R6iXs3Zda8cZ54k2CD4MfYLxsWQTmovqT+F+uLzJXvphgvUsyLXR7r4TaKN5wLX8Ob
         uW0faY2ngt3snZOadxmq1k3VHM80QiLtmHKgAXVU688yp36DOO+vSczkNeqAWMD63QVA
         dotP8+V3EoqzJd3z2XMKLSMmIYlzvoTw1sYtZcYuLUXjJg46cploSpWwLliUJyzy72b1
         BwFJbBZJ1q6/rYOVmrobxlDGN6MPrIBHE9PlN9jiOCS1OqqI5Eakn4bUnT8tfme1/oAn
         +6vg==
X-Gm-Message-State: AOAM530y8yHP+6QMpoZNZmB+2Zgm0iLr1GaoLOMVSF2eSxUy478X9yQ8
        aWJsJnj3oC7AobY9M6w9HHo5oA==
X-Google-Smtp-Source: ABdhPJxRphq9a3euntBalVq9JviSuH8jleCNvnOHhYdStDqT3fLL+rjN7xD1FCFxzWRTqLnF9FnK8w==
X-Received: by 2002:adf:eece:: with SMTP id a14mr203998wrp.333.1636387370792;
        Mon, 08 Nov 2021 08:02:50 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id d16sm12703176wmb.37.2021.11.08.08.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:02:50 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 4/4] rcar-csi2: Do not try to recover after transfer error
Date:   Mon,  8 Nov 2021 17:02:20 +0100
Message-Id: <20211108160220.767586-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of restarting the R-Car CSI-2 receiver if a transmission error
is detected, inform the R-Car VIN driver of the error so it can stop the
whole pipeline and inform user-space. This is done to reflect a updated
usage recommendation in later versions of the datasheet.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changes since v3
- Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
- Disable error interrupts after the first one to not spam the error
  event.

* Changes since v2
- Update spelling in commit message.
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 11848d0c4a55cb4c..427c236243a03ec2 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -902,21 +902,22 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
 
 	rcsi2_write(priv, INTERRSTATE_REG, err_status);
 
-	dev_info(priv->dev, "Transfer error, restarting CSI-2 receiver\n");
-
 	return IRQ_WAKE_THREAD;
 }
 
 static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 {
 	struct rcar_csi2 *priv = data;
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_XFER_ERROR,
+	};
 
-	mutex_lock(&priv->lock);
-	rcsi2_stop(priv);
-	usleep_range(1000, 2000);
-	if (rcsi2_start(priv))
-		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
-	mutex_unlock(&priv->lock);
+	/* Disable further interrupts to not spam the transfer error event. */
+	rcsi2_write(priv, INTEN_REG, 0);
+
+	dev_err(priv->dev, "Transfer error detected.\n");
+
+	v4l2_subdev_notify_event(&priv->subdev, &event);
 
 	return IRQ_HANDLED;
 }
-- 
2.33.1

