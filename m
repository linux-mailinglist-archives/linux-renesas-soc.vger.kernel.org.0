Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432F658E8E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Aug 2022 10:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiHJIhZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Aug 2022 04:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbiHJIhY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Aug 2022 04:37:24 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5406118B23
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Aug 2022 01:37:23 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id o3so13646333ple.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Aug 2022 01:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d90Ctq/OPngocvREk+GXxmfwi7GNqq+AEV+FEzVAMS8=;
        b=kXHsqDzg9eFLQNS73LhRngPr30CHfcOtnrah6S6sVl9bt1OpLuScI1Zn6wFnBUBXIq
         cKku8Wa99+gE+HGDwuBY0f6+iBb8Y0laxczs5RIzTZyjyOaN1bZXzMXsRd6HhrzF4Flr
         kekIFKWe8xGQopgxPPi6GWS5K2ACZZ4BILipySPbsz+GHkOfcFaQua392ZOTQG459rK6
         IOT9emkCQ3BZwgec3fRYs9v9rrnbVoLMMguWToloIJ6J9te3ehVNYTK0HXUh1LxuTf1t
         C9PfZWgKkCt6enCdmtIWEyjyXLnD4HL2miXLeevY3sL/5/TlfD3Um7xxi0FgiVcgY5fL
         TXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d90Ctq/OPngocvREk+GXxmfwi7GNqq+AEV+FEzVAMS8=;
        b=GARD8vPEHZ9FeHSptcmeS49mVUDCG6Hk/YaFKSjwfeJE+WO4etVFU91mmpy6ZcAg+1
         ZlrLOvKaaR0/EYT7wNoVC9PmvzdRk7gl4xAAt7inq3f+cADoQLeznC1dclgsCFGDTm0I
         js+V0Fv2h1Q28/7QOUSx4nvTuQ7gZejetrBn0zggkiVvKYk1kmwZy1GjPHBdL8mOA2bF
         hye+FuoxRfdlFdaTQHxTeB9kuiXcpLtdamFmKvG/xM5LFZ4Ut9HC4v9/NeC082rwIzQN
         H66YHQ3gTZrq0RB/N7l1L4v9RjLQhEKWnDTirj7J/iYwJZ0PoAkMoKpVSlfmYga0kg1L
         d80w==
X-Gm-Message-State: ACgBeo1qpx/gA/PwJmCpqDK5oT3z7HHsrGcgcEVc8FSc6Q9q0Xmm+99J
        EvaFMBL4Z9mX5nKK96BFxs/Pwg==
X-Google-Smtp-Source: AA6agR7U/tzZCTxijYOzxq+LH0GDr3RTwNGfEtRLSKlLBM1JnsO6+XPGZRMXp+ZL6lnN4uyCR67a/w==
X-Received: by 2002:a17:903:25d2:b0:16d:d026:daed with SMTP id jc18-20020a17090325d200b0016dd026daedmr27123381plb.101.1660120642794;
        Wed, 10 Aug 2022 01:37:22 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:37:22 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org,
        Takanari Hayama <taki@igel.co.jp>
Subject: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
Date:   Wed, 10 Aug 2022 17:37:09 +0900
Message-Id: <20220810083711.219642-2-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810083711.219642-1-taki@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To support DRM blend mode in R-Car DU driver, we must be able to pass
a plane with the premultiplied alpha. Adding a new property to
vsp1_du_atomic_config allows the R-Car DU driver to pass the
premultiplied alpha plane.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
 include/media/vsp1.h                           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 0c2507dc03d6..019e18976bd8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	rpf->mem.addr[1] = cfg->mem[1];
 	rpf->mem.addr[2] = cfg->mem[2];
 
+	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
+
 	vsp1->drm->inputs[rpf_index].crop = cfg->src;
 	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
 	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index cc1b0d42ce95..48f4a5023d81 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -51,6 +51,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
  * @dst: destination rectangle on the display (integer coordinates)
  * @alpha: alpha value (0: fully transparent, 255: fully opaque)
  * @zpos: Z position of the plane (from 0 to number of planes minus 1)
+ * @premult: true for premultiplied alpha
  */
 struct vsp1_du_atomic_config {
 	u32 pixelformat;
@@ -60,6 +61,7 @@ struct vsp1_du_atomic_config {
 	struct v4l2_rect dst;
 	unsigned int alpha;
 	unsigned int zpos;
+	bool premult;
 };
 
 /**
-- 
2.25.1

