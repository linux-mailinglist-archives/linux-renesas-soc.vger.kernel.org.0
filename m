Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194C7564BE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiGDCwj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGDCwj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:52:39 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836E12ADA
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:52:38 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id bh13so1788769pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BbPSpMez8xnrmoHOdUaXU+ajKB+3TOpV+ohNDV+XsDk=;
        b=BYmceRCcQvSn82mFF/HsQve/AffveQZCTUbJWICcFji0Fx3bbdZ6cdKI5MO2yfUULj
         fJxFMWNyH0/rSQToQnVlFtQFiTQ2t7sjkfEvqg8ap7UzJPgkea/Jv7+Px5ItxGHEAYDv
         j4z+eODnElEWhn7kJHO5kDnkDcB1xFMrtYCRA2i0huJkpKN33wVLw5jOcjxDP17Gabus
         AbBkX0kOdJI5xt4rcW0S9FIDYuDvoI4YWQh3mbGG33TkQRu5o3ch0WNCwnDg8ck5MWnW
         S2k1sxCvskT4kysOf+j5tuFYjZbreYmagPOWxw5bcNwAt3c2VS+e9h3bsMeEy0qOX6z4
         dAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BbPSpMez8xnrmoHOdUaXU+ajKB+3TOpV+ohNDV+XsDk=;
        b=J//qpYQFaVRSw+YnWAnqrkwRDW/ZLxkB9tC3xuAo1zA96kGb5gHKJcOrK7XE9dEtbI
         FKLloNUlu/1PQHG9Ihcgqg8Ih6L5/PyLCoWyZcry5wPMAhM30O/dGOuel4ghqGetsxGZ
         BUq0WdHJa9Fy++IkkMu+R278nRfhuh3kkXQ41pxGgAAaJa/2fcWTU9pV+mpq/8L+GSY9
         SgEJ/NJBujyDUgHqsKHF5DEve/5Uv2jaWNtdux7l6gR2W9XgoQvZf4lgfGGNRn1ba29e
         I88A0wh6qhycn2jdxS5yDTsG++XADUEpGIuyPM6Iq+IIievu8NKDqjs0czIgToGHhiIR
         R6qQ==
X-Gm-Message-State: AJIora8U6v4CHQq0iozKRccny2NNaFfzz3Fj6FulJXsf94SdCp7moSG+
        bB4+J74WG20ByBs18CaP3IytVh+Ajfi55MYK
X-Google-Smtp-Source: AGRyM1sqISqDaGGk3Vu/CgGdgUCMHgaePoGFbge3anE6UdgKtisdVwiuAdyE6DVU2fixJ4Lv5bcHrw==
X-Received: by 2002:a63:fd54:0:b0:40d:dfde:857c with SMTP id m20-20020a63fd54000000b0040ddfde857cmr23899918pgj.19.1656903157942;
        Sun, 03 Jul 2022 19:52:37 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:52:37 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 1/3] media: vsp1: save pixel alpha info in vsp1_rwpf
Date:   Mon,  4 Jul 2022 11:52:29 +0900
Message-Id: <20220704025231.3911138-2-taki@igel.co.jp>
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

In order to support DRM blend mode, we need to able to override pixel
alpha flag. When DRM_MODE_BLEND_PIXEL_NONE is desired, we'd like to let
VSP1 to ignore the pixel alpha by overriding the flag.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c  | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  | 6 +++---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h | 2 ++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 0c2507dc03d6..9ec3ac835987 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -600,6 +600,7 @@ static int vsp1_du_pipeline_set_rwpf_format(struct vsp1_device *vsp1,
 	rwpf->format.num_planes = fmtinfo->planes;
 	rwpf->format.plane_fmt[0].bytesperline = pitch;
 	rwpf->format.plane_fmt[1].bytesperline = pitch / chroma_hsub;
+	rwpf->pixel_alpha = fmtinfo->alpha;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 75083cb234fe..e6bd813dc68c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -152,13 +152,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	 * In all cases, disable color keying.
 	 */
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, VI6_RPF_ALPH_SEL_AEXT_EXT |
-		       (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
-				       : VI6_RPF_ALPH_SEL_ASEL_FIXED));
+		       (rpf->pixel_alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
+					 : VI6_RPF_ALPH_SEL_ASEL_FIXED));
 
 	if (entity->vsp1->info->gen == 3) {
 		u32 mult;
 
-		if (fmtinfo->alpha) {
+		if (rpf->pixel_alpha) {
 			/*
 			 * When the input contains an alpha channel enable the
 			 * alpha multiplier. If the input is premultiplied we
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
index eac5c04c2239..07ddebb78dfa 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
@@ -43,6 +43,8 @@ struct vsp1_rwpf {
 	const struct vsp1_format_info *fmtinfo;
 	unsigned int brx_input;
 
+	bool pixel_alpha;
+
 	unsigned int alpha;
 
 	u32 mult_alpha;
-- 
2.25.1

