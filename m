Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E02B6933D6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 21:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjBKUzE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 15:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjBKUzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 15:55:03 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721C314492
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 12:55:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r2so8572322wrv.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 12:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYlxwB+2dIIFaYeb6W4/G/F7mYnyq57RNQAaa+ab3RY=;
        b=TXqR8ihihKPfYSdqm3+VnbBjYp4AFUntljh7vTiWF2vr8uUGi4cKRr/PuJMRDKF2nE
         AE0eaaCbw4+/dbHkw0VwHZHzDJvWFEB9LSS6iy4aUu+2MLcffvifFS600KUflho2gmeK
         2TDjz1Un2rfGdY1DAOPTd8UZib2lg2NuCdufLM9IWrqAaS7IWDm5WoYJkyD8CwZ20dnD
         lKPtzqS9OQJXpmyteQZPsM9EcfF/9VmuF/5BVEvYGpC8B68083P1eF+MHpUmvUPBB0Lt
         3fRAHpAO6lOJxxPhIBS/0+sqbmMom3yBrNN93xGb260cpghawuvZWpA2L3WVDgzRhJm4
         /4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYlxwB+2dIIFaYeb6W4/G/F7mYnyq57RNQAaa+ab3RY=;
        b=wfqaTYxUr8gGm62JwHYepQGjTkcBcm+hM9zcm0E8Hg+A7HTDBqUIGZ+wf0171oqKRj
         F10xc+hDb2pCV3+FQx7dJ+LHfu7XJgxuiAOAMmKbkm/jUSZg7h5FKVYXp26X9+Rd3+yw
         xOgTEaoMi4q2DUmfKFUPDppraezkqQzZzThTxZfwHjK0pZAKifWKHJFrj/kGryOWCi9j
         aY4o718om1s9JYq09AO95MmNQr4E+rsx4tThGrAOt4IWa34Zh356GlJnY3vdvMrVJyk8
         Pme3xRaWC/uF7hjNEWxZzbo0flBKg9agPt0TXHGJ30qWTwg1h9Fg1qaRuqWYKTbZ6kaz
         8ptA==
X-Gm-Message-State: AO0yUKUxsw/WLtV/SrisjznF1qssRHpRoUmsonWB+NQBVjAKl+2AkPf5
        Abwgs/rK4D3zqXuTe2e0qSC+GA==
X-Google-Smtp-Source: AK7set/6Dy7dWZa2AFGHa5pS99q/OkSJXEZ+caNDpDjIedejlhqYVwR6GZEASZPg5ILmCZThtpFG8Q==
X-Received: by 2002:adf:fd02:0:b0:2c5:4c7f:c91 with SMTP id e2-20020adffd02000000b002c54c7f0c91mr4134363wrr.66.1676148901022;
        Sat, 11 Feb 2023 12:55:01 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id q4-20020a05600000c400b002c54737e908sm5095531wrx.91.2023.02.11.12.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 12:55:00 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] media: rcar-vin: Gen3 can not scale NV12
Date:   Sat, 11 Feb 2023 21:54:31 +0100
Message-Id: <20230211205432.493102-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
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

The VIN modules on Gen3 can not scale NV12, fail format validation if
the user tries. Currently no frames are produced if this is attempted.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 98bfd445a649..cc6b59e5621a 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1312,6 +1312,11 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	}
 
 	if (rvin_scaler_needed(vin)) {
+		/* Gen3 can't scale NV12 */
+		if (vin->info->model == RCAR_GEN3 &&
+		    vin->format.pixelformat == V4L2_PIX_FMT_NV12)
+			return -EPIPE;
+
 		if (!vin->scaler)
 			return -EPIPE;
 	} else {
-- 
2.39.1

