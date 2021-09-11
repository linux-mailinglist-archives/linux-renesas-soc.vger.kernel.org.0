Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D6D407A3C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Sep 2021 21:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhIKTVZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Sep 2021 15:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233567AbhIKTVY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Sep 2021 15:21:24 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF2BC061574
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Sep 2021 12:20:11 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 140so173428wma.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Sep 2021 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZ0XD7mm87qUJaHuITbMVG4HWCUP1XkKnasqAUw7UPU=;
        b=ur6x98D2JLCbt0CY8lUr9w/oiyo8s3uF9mgwn4J4BW3UplzV95Njh7ex8HTXSy3Eag
         QZHe+z5To4zJMTa5ETQ1rGM8mK3vA1VPSrTpnLVNbfGbFhkwkIs21flxS20LZdc46ooL
         zQmixwO6ZYrNFGka/h1WbmmzhExM9RMQPqd1YVHk4ldIxCfz4gld+k2xSk4ClHDs2uLn
         EuT2d0UFgsyIQmI+ae+WPJRQwuceblMsXsGpl0YRilyvFGPq1ulCQZGzDFnNGNA+U5Qh
         SnBD+MVap9Zm51TO1ync/SnpMOe14z8CVv+Tu8Hf4uLusvF0xukX/NvMdwBqvdOCq7/D
         ocng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZ0XD7mm87qUJaHuITbMVG4HWCUP1XkKnasqAUw7UPU=;
        b=wXq45Lvbu4lfNiZXyVT0PENn5LbqylBJRhQjAuljr6SE50tzun2hHIkIzrARq2NeQk
         PiaPNhD1ZpvFRgdPMGNIiD8FQYhpV+2j9tWJY4QQRHmrHLGyUROSsMhff38nTGCMZNWo
         hvF4kaiq5k6JAsH6nbXUUn7nKMbWs/q1Akp9SP+k3T+pMLHdIPRsbEPLqRjS+Qi6ItGE
         EtoJHpGgJm0Q0dRyKRIuFezup+6YUBFdk3bu7QQHSBtp16TSLiP2I0NXTjmkUkb/vBDp
         Jbo4NNJJAYRMtZoPv/0nY3bNDhCI4mS+z2E6MPZQJpvRjVfIwBB4S7dtjW/jfCcuP/GA
         /+wQ==
X-Gm-Message-State: AOAM5311eXg7omOv65nsssx05XcPCOI6hitvZavdImZFpCf2vnVE6XGA
        P6o3EX8kCI4pYSSNvmMq5utO6b7MZzDDHMrw
X-Google-Smtp-Source: ABdhPJywQ7J+ekP7HDUo0Ih5pJx5sA3x//a3aOdNS8vXvXm1dyJuhq/EDeR3cLsTqlh30mGsdsJhbg==
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr3886368wmh.126.1631388010112;
        Sat, 11 Sep 2021 12:20:10 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id k22sm2469909wrd.59.2021.09.11.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 12:20:09 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Use user proved buffers when starting
Date:   Sat, 11 Sep 2021 21:19:58 +0200
Message-Id: <20210911191958.1547743-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When adding an internal scratch buffer to improve buffer handling when
stopping it was also erroneously used when syncing at capture start.
This lead to that the first three buffers captured where always dropped
as they where captured in the scratch buffer instead of in a buffer
provided by the user.

Allow the hardware to be given user provided buffers when preparing for
captured in the stopped state. This still allows the driver to sync with
the hardware and always completes the buffers to user-space in the
correct order as no buffers is completed before the sync is complete.
This changes improves the driver as buffers are completed and given to
the user three frames earlier then before.

The change also fixes a warning produced by v4l2-compliance,

    warn: v4l2-test-buffers.cpp(448): got sequence number 3, expected 0

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 58718e52ae541a87..e5162bf42bd0e3ab 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -906,7 +906,8 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 				vin->format.sizeimage / 2;
 			break;
 		}
-	} else if (vin->state != RUNNING || list_empty(&vin->buf_list)) {
+	} else if ((vin->state != STOPPED && vin->state != RUNNING) ||
+		   list_empty(&vin->buf_list)) {
 		vin->buf_hw[slot].buffer = NULL;
 		vin->buf_hw[slot].type = FULL;
 		phys_addr = vin->scratch_phys;
-- 
2.33.0

