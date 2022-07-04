Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36F54564BE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbiGDCwl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGDCwk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:52:40 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D08B2ADA
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:52:40 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d5so7369652plo.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KoE/Nl7CA68voHNLmRyXiLiHPFnMwUitmY6p2+8OjAM=;
        b=ME6L4Ur68fTru7929aD2k6RPdLKaJEFrAcHqqjHocKoH9iJobzUocCY8YxK64z5jid
         xxinLsGajnw1g+D0HaIisFuOACzPvfoUUoDmvllUJUjHijA+drCHJu0qCOxXvmPo7Eaz
         wWTy9Y9qTXdeSZkMrCuaK3vU/0ZJg1AuuT8X8sXXymi52N65BEfQSJay/x4BXtKu0L0c
         efPGx/kWQ1zFjL7KgPFZzf8e+JJIdm0Q71u0rFiOWDskIagBoXpatQlAHHZWx0rIubEr
         QSVB6yryAmSTeR1uVVMNNvA/RlKGbx50ZoqJFyhaDXG4gb6jNI5y4929G5TpbENavZdb
         K8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KoE/Nl7CA68voHNLmRyXiLiHPFnMwUitmY6p2+8OjAM=;
        b=auDBZ6f9Q6IYbATDiHFwhvudghHbk+AIMzxDkGYMHGu68P5nBXnNf9Fohjewvi2Fx9
         5I0sskzh2qZ73Ito7Qo9RYjwDd0jtkY/jT1aotV77cSuOOg90ppE0ZA87y+dBpDI9s1f
         gAU5eVQzGyI3E2U4FCpbYfJP5OlBHGAhpvB38MjT1atge3HxqCT01pPXM0PAL4WerAEn
         eRuQfn5d4viheAsV+Pq6PKGg02JV6gkqSE/IS3N85BZb4tRl7ykYxKsl3eoc9HLuHt0T
         KtHPeApHl6oInUWrQJ/EqB9mFcOF+SOOWXGm2WKsOrZo6jrTwxG75xGPphl/9mpygKgm
         Q9sw==
X-Gm-Message-State: AJIora/TAGSopDhsGwgMvavgXnvq5Ax7zDLoetkTqECM6IiO9gyrvHat
        XZZUA43cLYwS7D5ytiEkiryg2Q==
X-Google-Smtp-Source: AGRyM1teqaW2blXchXZwLy8aBx9cHEM0uu5yx9xOZVRKxK+PDV0HQ+8fi6KboYsUL02Yg2h3b7Re+w==
X-Received: by 2002:a17:90b:4ac7:b0:1ed:20a2:f547 with SMTP id mh7-20020a17090b4ac700b001ed20a2f547mr33629569pjb.19.1656903159678;
        Sun, 03 Jul 2022 19:52:39 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:52:39 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 2/3] media: vsp1: add blend mode support
Date:   Mon,  4 Jul 2022 11:52:30 +0900
Message-Id: <20220704025231.3911138-3-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704025231.3911138-1-taki@igel.co.jp>
References: <20220704025231.3911138-1-taki@igel.co.jp>
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

To support DRM blend mode in R-Car DU driver, we must add blend mode
support in VSP1. Although VSP1 hardware is capable to support all blend
mode defined in DRM, the current R-Car DU driver implicitly supports
DRM_MODE_BLEND_COVERAGE only.

We add a new property to vsp1_du_atomic_config, so that R-Car DU driver
can pass the desired blend mode.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 11 +++++++++++
 include/media/vsp1.h                           | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 9ec3ac835987..ed0cf552fce2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -861,6 +861,17 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
 	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
 
+	switch (cfg->blend_mode) {
+	case VSP1_DU_BLEND_MODE_PREMULTI:
+		rpf->format.flags = V4L2_PIX_FMT_FLAG_PREMUL_ALPHA;
+		break;
+	case VSP1_DU_BLEND_MODE_PIXEL_NONE:
+		rpf->pixel_alpha = false;
+		fallthrough;
+	case VSP1_DU_BLEND_MODE_COVERAGE:
+		rpf->format.flags = 0;
+	}
+
 	drm_pipe->pipe.inputs[rpf_index] = rpf;
 
 	return 0;
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index cc1b0d42ce95..1ba7459b7a06 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -42,6 +42,18 @@ struct vsp1_du_lif_config {
 int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 		      const struct vsp1_du_lif_config *cfg);
 
+/**
+ * enum vsp1_du_blend_mode - Pixel blend mode
+ * @VSP1_DU_BLEND_MODE_PREMULTI: Pixel alpha is pre-mutiplied
+ * @VSP1_DU_BLEND_MODE_COVERAGE: Pixel alpha is not pre-mutiplied
+ * @VSP1_DU_BLEND_MODE_PIXEL_NONE: Ignores the pixel alpha
+ */
+enum vsp1_du_blend_mode {
+	VSP1_DU_BLEND_MODE_PREMULTI,
+	VSP1_DU_BLEND_MODE_COVERAGE,
+	VSP1_DU_BLEND_MODE_PIXEL_NONE,
+};
+
 /**
  * struct vsp1_du_atomic_config - VSP atomic configuration parameters
  * @pixelformat: plane pixel format (V4L2 4CC)
@@ -51,6 +63,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
  * @dst: destination rectangle on the display (integer coordinates)
  * @alpha: alpha value (0: fully transparent, 255: fully opaque)
  * @zpos: Z position of the plane (from 0 to number of planes minus 1)
+ * @blend_mode: Pixel blend mode of the plane
  */
 struct vsp1_du_atomic_config {
 	u32 pixelformat;
@@ -60,6 +73,7 @@ struct vsp1_du_atomic_config {
 	struct v4l2_rect dst;
 	unsigned int alpha;
 	unsigned int zpos;
+	enum vsp1_du_blend_mode blend_mode;
 };
 
 /**
-- 
2.25.1

