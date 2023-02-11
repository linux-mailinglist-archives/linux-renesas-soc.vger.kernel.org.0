Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5016933DA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 21:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjBKUzt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 15:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjBKUzs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 15:55:48 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89097BDE7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 12:55:47 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso6369063wms.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 12:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNuItG44CntmkYMhtfKeGSc/7F9CzOVvqfF8Ba1obbk=;
        b=tw69hdIouupI0DwNU6PnzE3wxd11vBGR/8opYSnT5vSN/5FjDWBZoK+bIL2M7VjrJY
         XuMglYy6FgpTC1TIL1wLaeVycHUd6CzbZRyTGCSYSYroGp5lEDRtZVNkGITnONiaqlzs
         qz+CDf4NsahDQibHC6zA+f/k79Q8rvn3nDuwmqFkvJIXJzxhsNxIBae9ACC5i0oo4g0P
         U0ta7pTBdtpjEZ+reSyGUO4hwxMSuGY8MtZ/VRY2L+oV5wpIlRhnEUemQlF+FlV1qQjh
         fVj8+LQFcSiixqnv/iPF4UC6Cn0AsTsUFxny8HfhMQhfcpxWRpxCmwK9jjf0MAC0bnPA
         RyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNuItG44CntmkYMhtfKeGSc/7F9CzOVvqfF8Ba1obbk=;
        b=IXt3MMZMQedD5iyk19CSb7+b3dx3/Eak9ZgVjz2Rk9gb13D/vk1aU4pe63vGtHn2co
         VQirEDWRDq3/nUeWf2u2ffDLMvUAz4KdYe2UC8zxK7Vdd97iM7bgOIU2Km6BqqPhMGs+
         0TR3bDRA6teaxFPOo3aVMCA0IUvn+LGGkHshe4SDaxIKAiJQRPNkpsHvjqz6KMnwXs5z
         oRT0srKr9IxRpYJZuyidK1duiD8c6DQMSAui56raXgNo4XJp57N2sD9FLQ+yd3ErYSiG
         NiDN79V1S4h+g2qMn6wUpb/hzbQ3lUh1UJ5Kb0moU8kGQkve75jd4EMtjo10zNIOvJI/
         DoRg==
X-Gm-Message-State: AO0yUKWn8hhAC5ibSMyvuzBUVeLov6ML7QNw/QDx8s3d8mePOCmt91q/
        F9tPg46fb8X1ZZIa1VliWYx4NQ==
X-Google-Smtp-Source: AK7set/F29yGrmEh8QS3Z4/aqCYIDy+R6Xd9kZkQEUGUtr/BPx9b32wHxYcry4CRZj31yR7brGyGMw==
X-Received: by 2002:a05:600c:160a:b0:3df:ffab:a391 with SMTP id m10-20020a05600c160a00b003dfffaba391mr15454751wmn.24.1676148946168;
        Sat, 11 Feb 2023 12:55:46 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id l40-20020a05600c1d2800b003dd1b00bd9asm10304826wms.32.2023.02.11.12.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 12:55:45 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Select correct interrupt mode for V4L2_FIELD_ALTERNATE
Date:   Sat, 11 Feb 2023 21:55:34 +0100
Message-Id: <20230211205534.493789-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When adding proper support for V4L2_FIELD_ALTERNATE it was missed that
this field format should trigger an interrupt for each field, not just
for the whole frame. Fix this by marking it as progressive in the
capture setup, which will then select the correct interrupt mode.

Tested on both Gen2 and Gen3 with the result of a doubling of the frame
rate for V4L2_FIELD_ALTERNATE. From a PAL video source the frame rate is
now 50, which is expected for alternate field capture.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 23598e22adc7..2a77353f10b5 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -728,12 +728,10 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_FIELD_SEQ_TB:
 	case V4L2_FIELD_SEQ_BT:
 	case V4L2_FIELD_NONE:
+	case V4L2_FIELD_ALTERNATE:
 		vnmc = VNMC_IM_ODD_EVEN;
 		progressive = true;
 		break;
-	case V4L2_FIELD_ALTERNATE:
-		vnmc = VNMC_IM_ODD_EVEN;
-		break;
 	default:
 		vnmc = VNMC_IM_ODD;
 		break;
-- 
2.39.1

