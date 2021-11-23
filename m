Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B1A45A6E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 16:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbhKWP6C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 10:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhKWP6C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 10:58:02 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D3BC061714
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 07:54:53 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so2342879wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jVC8DNnSzPKsuhQfh7QreEU+ZM/Yxny8aN8089Ci8dk=;
        b=wspxmW92GjSaH2SBmxGU76BYJ9LdeUbn1Fa5LH6M+7ZmWkTIyDVVPcoWqUb7Y1ajce
         7YTEtU4hUtfCZ0+dWG3/5ccOIpEoSeAwNcXHsCtnm5WIRW5IyBTKciwzjhCsEPtlr97B
         PUFcgsNtZXTw+FIY9xjWaeAvLn0Wx6JaPek2ZRHIicuMNQWhBuZ8/im2hmPSz7/oqZyP
         qJNMBS0IrI8mL6UWBIIgmkzQMxA1RGLAOdYy3g6lYD4/9kgCJr6lBF/0MhJ6oOqDq8/B
         J99729SAXu+4tMQQZycX51nsToLkylkPxmv0N+d+jYyW2F8kemInSfiPKpqBO4nD5Hjd
         Masw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jVC8DNnSzPKsuhQfh7QreEU+ZM/Yxny8aN8089Ci8dk=;
        b=ZQHDD1vn2N2Ssx8uluNUQEyGwiM7R/fUGQcwmkYpWkJCAiES8qzzgvv6P+GXkJhOUn
         GLzURpVjccbklwv34fVhchPbkWVGG8ZxJPfc/ZMpAo9T5yHrP3Orm3hm4fuyI+6dS6Wt
         Mp332uO6M5hKUC1ypJygqE4xjtZiqFgvNL54hac9sjbrEpUvGy5sHwAz48L/OQuR3WCD
         9efEZRU8LV4aQSV8r80RLIRlPvXwA5B07oBNhAiFNX9tXJx/HHot0oFkH6diSTGt937G
         iEY1p3itM2i1xhbaB9DqxLlqokEK/AfdEjgg/zzpIKycnKhm1Q8b8YNY5ld6odQHS4HR
         91lA==
X-Gm-Message-State: AOAM533LF6CEW9JgN5i/UJE05UCr5hAbO74jKq+tJCJqWuNKue6xQewd
        +59NFlGxILtKJc1nzweBWNIO3BYrL259RQ==
X-Google-Smtp-Source: ABdhPJy5cPjOfn2fc4Kj96DEdWUZNJCQ+8T/EaPTINd96qK7y9h2zSimYmlBydU7sQSCQVlVMNmpxQ==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr4391692wmi.2.1637682892349;
        Tue, 23 Nov 2021 07:54:52 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id i15sm1892892wmq.18.2021.11.23.07.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 07:54:52 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Add check for completed capture before completing buffer
Date:   Tue, 23 Nov 2021 16:54:43 +0100
Message-Id: <20211123155443.3705143-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Before reading which slot was captured to by examining the module status
(VnMS) register, make sure something was captured at all by examining
the interrupt status register (VnINTS).

Failing this a buffer maybe completed before it was captured too.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 25ead9333d0046e7..87ccbdc3d11a0f2d 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -111,6 +111,9 @@
 #define VNIE_FIE		(1 << 4)
 #define VNIE_EFE		(1 << 1)
 
+/* Video n Interrupt Status Register bits */
+#define VNINTS_FIS		(1 << 4)
+
 /* Video n Data Mode Register bits */
 #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
 #define VNDMR_A8BIT_MASK	(0xff << 24)
@@ -1005,6 +1008,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	rvin_ack_interrupt(vin);
 	handled = 1;
 
+	/* Nothing to do if nothing was captured. */
+	if (!(int_status & VNINTS_FIS))
+		goto done;
+
 	/* Nothing to do if capture status is 'STOPPED' */
 	if (vin->state == STOPPED) {
 		vin_dbg(vin, "IRQ while state stopped\n");
-- 
2.34.0

