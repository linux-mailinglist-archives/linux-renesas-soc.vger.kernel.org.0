Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762004498F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239192AbhKHQFf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239380AbhKHQFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:05:35 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670A3C061746
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Nov 2021 08:02:50 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so27810089wrb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Nov 2021 08:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m1WqzcjlgMOIezM3Do4q/Hqs3GubepKnTprvWPIb2Vg=;
        b=sA/zVbmFu61dEZxvBhXBQWZcR+W4FNHy55CU08xUYyQQqmDEUmZ6Jeh3PMJeeLz71f
         xcioG9il13KMQhbAQoI8QuUL5clyQjeGEA9H+U+10hS2+M8QL25G6AKWegWkf6QmWWf6
         Gm7bJdU9TUWei9s/jENpgWFGpulPfSl5DYevmZvvWYOw36xxmMAJF6Wq3zLqg8X9JU5R
         wqgWzGa9T/eisPDRt6gmIJ16JaKZuCDh0tc+9kB8UuwG7PQjM7POWRu6GVKDQabe+IAu
         nSJZ+lgxz55mAeNZvQGFDCV1LG8htD9EfqY+cO9+cyMJJwy9ndLDCtAK/DnfMyAJaz4t
         fXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m1WqzcjlgMOIezM3Do4q/Hqs3GubepKnTprvWPIb2Vg=;
        b=qz3Rmpft1qGwewWofQ/aQw7N9pcemPmZ08EyCVodNTSpEI/GQrlE3+yiVPm9ayw05y
         3UCDyDLmylUnG2iS8GRV3TZ/0D3jYx6+3+Bo04TYqFUY3s56OtEvZQhWgoL90vxFM4yC
         No1lcCnCwlxaF6bPzymtxkO5g1JHyHGxrSLTwxI2Ia/UfkHZ78dLjdd7P2mx69p0Q3G1
         8vUw6OTzH6b5nfgSsRSfcpbYx9teiAwwH71ndb2HHzagy/Qsh8bRyHQCeGxc4IUl9VB+
         CPMStgSkhSOn96e1sadNQSGrgHbtA18s6ui5wjmbtTnVnsZkYo083rJr4n5zJ9e1Be30
         FSvg==
X-Gm-Message-State: AOAM532Gajbf08z/GtfFSIa2222SF6EMakbYip8oogIt7LdsfL+FCMhu
        AWg+KQtC+32DbKFbXYJ0VA3iszhKLQnBghny
X-Google-Smtp-Source: ABdhPJzcHbVKB3IgU5vC1uiyzzMhri/gd0h3nG9NyH8NzUyg74mSz/ZHlH15/grVx6pPxl72ytofpw==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr225459wrn.135.1636387369022;
        Mon, 08 Nov 2021 08:02:49 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id d16sm12703176wmb.37.2021.11.08.08.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:02:48 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/4] media: rcar-vin: Free buffers with error if hardware stop fails
Date:   Mon,  8 Nov 2021 17:02:17 +0100
Message-Id: <20211108160220.767586-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver already have logic to detect if it fails to stop properly and
report this error to the user. The driver however did not report the
unused buffers or buffers given to the hardware (if any) with an error,
the buffers where instead returned to user-space in the active state.

Build on the existing detection of the error condition and correctly
return the buffers with an error if it triggers.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 25ead9333d0046e7..79bb9081853f8781 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1371,6 +1371,16 @@ void rvin_stop_streaming(struct rvin_dev *vin)
 
 	spin_unlock_irqrestore(&vin->qlock, flags);
 
+	/* If something went wrong, free buffers with an error. */
+	if (!buffersFreed) {
+		return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
+		for (i = 0; i < HW_BUFFER_NUM; i++) {
+			if (vin->buf_hw[i].buffer)
+				vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
+						VB2_BUF_STATE_ERROR);
+		}
+	}
+
 	rvin_set_stream(vin, 0);
 
 	/* disable interrupts */
-- 
2.33.1

