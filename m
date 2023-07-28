Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C1F7676BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 22:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjG1UHl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 16:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjG1UHl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 16:07:41 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6764487
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 13:07:39 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bba48b0bd2so16040385ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1690574859; x=1691179659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dGyL1Lliy4sMGhP4x4gJQppxXscqT/ISt433fAY9RA=;
        b=s6U7BS0q7z0qtro9bHXdVq5BC1p3hXjPrOeucRC0GzbIZcbfMKBhOQl/xLux2UIGNO
         thfzCUO7CbcHfM/k8FL1Al1aUMWLa6qIlYfQ54Q+0FE9cuk73AI/+9sBaB69F/+TxWPx
         Cs448XMcw2U6tumGjfZWiKzBH0PAlkmP/i8SNdHJCbKXbDS/7d3nOiB73e9/iEl2T3yH
         IEpKH8O6ewhE8hZ8RVNDiOSy9A+OUMfPvHdYqAqWRauauDOFTzyZETtJcG4n480k0y2y
         Kpc7UPP7RVUszzo9WRnRaFbWx08EfpD0mhSLvpqUqynZKQ7zFk/6Knb6Hp5Nfak7Epsz
         UkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690574859; x=1691179659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dGyL1Lliy4sMGhP4x4gJQppxXscqT/ISt433fAY9RA=;
        b=doRop3/k6vXunZMk3jn7d8wb+unJJ1B+q/3vP1DebbZ3b3LsB9Fj5T3Gom1U+Mcjef
         r/kDPH5YWrBrvJAVuuLJIf6HVMJMGaWMUd/Bh0KlJc5lHq9Fjup9ZnoXzQ7pY32EKVfx
         qBymy5wUiEN+NDhnZ7fcGIzCAoTOAlB70C4sHIn6i26VWS/mYumBZbHt4RPPwk9Esrk6
         dbGjDyibq/cIHmozNp8PhmsIAdbvwiVVzY3nAQzqr8jzINfSibjxaYP7OOwT1RradvO5
         rC3ctUxlw+tJ+F2QW9w84Ce/ev0ttvozarZuNuDVNq2/BuuytsbUdv6OjcLf15CdiiTJ
         F41Q==
X-Gm-Message-State: ABy/qLa2UQ8rWv3XrccChe5SwuXlX5xL/NaKqu8L+6jv+ZGd06TDJWzZ
        0jJ8x49VSsX/1Hrv6NZHIsezU4F8Ju5hJ1JOc7o=
X-Google-Smtp-Source: APBJJlF7QzLqxFraslwo86e5wHaek5rbivk5hmKBqyqAKscJabDE4Vi3qBlicb81r5kyjn/cjIZ73w==
X-Received: by 2002:a17:903:11d0:b0:1b6:bced:1dd6 with SMTP id q16-20020a17090311d000b001b6bced1dd6mr2871541plh.35.1690574859061;
        Fri, 28 Jul 2023 13:07:39 -0700 (PDT)
Received: from D100-Linux.hq.igel.co.jp (69-165-247-94.cable.teksavvy.com. [69.165.247.94])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001b830d8bc40sm3980848plh.74.2023.07.28.13.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 13:07:38 -0700 (PDT)
From:   Damian Hobson-Garcia <dhobsong@igel.co.jp>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     taki@igel.co.jp, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: [PATCH 1/2] drm: rcar-du: Add more formats to DRM_MODE_BLEND_PIXEL_NONE support
Date:   Fri, 28 Jul 2023 16:07:13 -0400
Message-Id: <20230728200714.2084223-1-dhobsong@igel.co.jp>
X-Mailer: git-send-email 2.25.1
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

Add additional pixel formats for which blending is disabling when
DRM_MODE_BLEND_PIXEL_NONE is set.

Refactor the fourcc selection into a separate function to handle the
increased number of formats.

Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 45c05d0ffc70..96241c03b60f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
 	DRM_FORMAT_Y212,
 };
 
+static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
+{
+	u32 fourcc = state->format->fourcc;
+
+	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		switch (fourcc) {
+		case DRM_FORMAT_ARGB1555:
+			fourcc = DRM_FORMAT_XRGB1555;
+			break;
+
+		case DRM_FORMAT_ARGB4444:
+			fourcc = DRM_FORMAT_XRGB4444;
+			break;
+
+		case DRM_FORMAT_ARGB8888:
+			fourcc = DRM_FORMAT_XRGB8888;
+			break;
+
+		case DRM_FORMAT_BGRA8888:
+			fourcc = DRM_FORMAT_BGRX8888;
+			break;
+
+		case DRM_FORMAT_RGBA1010102:
+			fourcc = DRM_FORMAT_RGBX1010102;
+			break;
+		}
+	}
+
+	return fourcc;
+}
+
 static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 {
 	struct rcar_du_vsp_plane_state *state =
@@ -189,7 +220,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		.alpha = state->state.alpha >> 8,
 		.zpos = state->state.zpos,
 	};
-	u32 fourcc = state->format->fourcc;
+	u32 fourcc = rcar_du_vsp_state_get_format(state);
 	unsigned int i;
 
 	cfg.src.left = state->state.src.x1 >> 16;
@@ -206,22 +237,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
 			   + fb->offsets[i];
 
-	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
-		switch (fourcc) {
-		case DRM_FORMAT_ARGB1555:
-			fourcc = DRM_FORMAT_XRGB1555;
-			break;
-
-		case DRM_FORMAT_ARGB4444:
-			fourcc = DRM_FORMAT_XRGB4444;
-			break;
-
-		case DRM_FORMAT_ARGB8888:
-			fourcc = DRM_FORMAT_XRGB8888;
-			break;
-		}
-	}
-
 	format = rcar_du_format_info(fourcc);
 	cfg.pixelformat = format->v4l2;
 
-- 
2.25.1

