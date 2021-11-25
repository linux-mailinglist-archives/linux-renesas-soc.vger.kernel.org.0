Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49AC645E335
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 00:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347134AbhKYXNn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Nov 2021 18:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243043AbhKYXLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Nov 2021 18:11:43 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756D2C0613F8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Nov 2021 15:03:31 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so5632569wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Nov 2021 15:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z17KKRcYHCiS6VY7EKWJqLHKUJdF70M4GFqbDdSSuAc=;
        b=YYPZSU4x07QEl/ZaS+2y04aosT1oMivHlNE+SKDCioSWzJVzkn84Bunkc68sSki9YJ
         VNBfuWpJNlX+NsZ554fBMc5iLMYj+f9sh6Gy3nYQoFn7GVbxiK3OPvcOyWsapXQEjZGc
         oagc11UqVNiW2V0eS4pDu58nyJSzHzT0ZP89q2w/pKe7SkWygvXYXCOAVYnlgIyTskUO
         tzvuOvCLhoDH2tQJ5UCiBoK3BmC/9aKw16WvlDZq3V6opEBV6wTIcFAEVk7qB+kQt8rY
         xwpYFq1J+q7yh/wwrlOonxmC5cL3EUc2FvYGEcI1JlDROVeZrrfMTZpNcAwoYUTYTnMz
         bqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z17KKRcYHCiS6VY7EKWJqLHKUJdF70M4GFqbDdSSuAc=;
        b=Wp72ZPFcOMh9fvEVe3cIXoiuk2juhoG45oD6hnFgr2iG0usbD18Ppk/AH9n4LPZJur
         TbbPo02Q2F0bd3PT61en2U1shBdSfmRcmu72QP54aTIWgGQt8TmoeaBr01No4pyBYZ7N
         nWzWkzg15rTD7jx/CmpeuP3MBqPjWgkMUlNquH4ZBjUaN+5xKh6bTvhU1BywUtOwt0I3
         ToINsrLQ6KhzibheAzF1Z+tcqRaH75oqck0MShFV3tx1PExrf5Hbqe+3QvXT2dLYn08G
         k08ErHl80rxLzQx60HDb0Zhb6m6fZfNQdLpbpNBlpAbMqj2lHS1RBq+6syFnHJGUWQyc
         aLfA==
X-Gm-Message-State: AOAM5338gstiqwkal/QmGFGxB61CQP4HlouAFjz8hak4NvmPDmTRgpAI
        2oBcLwIPl+zPRgqD6WTJ6u5DgA==
X-Google-Smtp-Source: ABdhPJxzzWPMWp2wuMbAtcEeUbEWx/KiADKQTY8r3+Rz7mEbbnwwFCG+gN59yp07yq4Po2uqJ4cPSw==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr11420923wma.69.1637881410048;
        Thu, 25 Nov 2021 15:03:30 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id m125sm8989495wmm.39.2021.11.25.15.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 15:03:29 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Update format alignment constraints
Date:   Fri, 26 Nov 2021 00:02:57 +0100
Message-Id: <20211125230257.1334452-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This change fixes two issues with the size constraints for buffers.

- There is no width alignment constraints for RGB formats. Prior to this
  change they where treated as YUV and as a result was more restricted
  then needed. Add a new check to different between the two.

- The minimum width and height supported is 5x2, not 2x4, this is an
  artifact from the drivers soc-camera days. Fix this incorrect
  assumption.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index a5bfa76fdac6e55a..2e60b9fce03b05e0 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -179,20 +179,27 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 		break;
 	}
 
-	/* HW limit width to a multiple of 32 (2^5) for NV12/16 else 2 (2^1) */
+	/* Hardware limits width alignment based on format. */
 	switch (pix->pixelformat) {
+	/* Multiple of 32 (2^5) for NV12/16. */
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV16:
 		walign = 5;
 		break;
-	default:
+	/* Multiple of 2 (2^1) for YUV. */
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
 		walign = 1;
 		break;
+	/* No multiple for RGB. */
+	default:
+		walign = 0;
+		break;
 	}
 
 	/* Limit to VIN capabilities */
-	v4l_bound_align_image(&pix->width, 2, vin->info->max_width, walign,
-			      &pix->height, 4, vin->info->max_height, 2, 0);
+	v4l_bound_align_image(&pix->width, 5, vin->info->max_width, walign,
+			      &pix->height, 2, vin->info->max_height, 0, 0);
 
 	pix->bytesperline = rvin_format_bytesperline(vin, pix);
 	pix->sizeimage = rvin_format_sizeimage(pix);
-- 
2.34.0

