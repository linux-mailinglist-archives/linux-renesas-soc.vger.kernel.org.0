Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58991564BE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbiGDCwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGDCwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:52:42 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2C8627A
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:52:42 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h9-20020a17090a648900b001ecb8596e43so8199953pjj.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lZVf3tUH/gMJbN3bSxzTMFNpOOUqgp+lgLlS3ACMryU=;
        b=A9/a5QZGd8dM7D5cLyfh/RBwOulvMmGuSV6TAXSKjvR5bCDNwQuEepesBQuDW8SDwb
         8CbBKhm7ZqDHMF/VqcEw6sCl2R5uOHdgdq8J8huUnKXR2Gs7b6d5I2YnpTw3o/UvbebG
         xWHjOMyxZyLntbG6DpnJOSsK1yEUGRQAe05b+a0NhjyFnaKK3NXm4cEtGLHLzzF2gNyu
         Y98Y/bCP0H6WNWa5hy11K955DDOQEjY8ymspAHFdP95b6y2CMHymzfsd5I/JUcZWYoiw
         Jxw1BQb+f2NRxwbu55/yLX9+xuNgJrhVyfQOtQ2RkyYWPx8iNen9ApIGFHz+2/SovUlT
         SbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZVf3tUH/gMJbN3bSxzTMFNpOOUqgp+lgLlS3ACMryU=;
        b=p2x+x06U98iQtH1tKKfGtpx9X6tNBfnfjdczTtNqQZEYPXTq8ueQgsuzns7lOm9xe3
         DI6gybv8UP5QhiX6O1iqP1UA7nS43mXLYt/0UXg481yUN6RY90XCDEo1L5oxWZ8iN0Vg
         8H/h1f24d0r9iL4Qp+PjK4zHKD28OZ2+f1QPvsr4g9KEekwfnlqxKkFfgvwNKxDq3OGF
         zC35fy4t12c3JbpxZ3sBOz5RWGaHjCVRKcTZctdEh0rQy7rgeFxJrfgL7GJSOJv2v+gV
         e6D3vrf4sVKpF+DR+vJKXQWyNzFokNzjrIlJlxM2uHfIg4Z8AaGqSOtPPXJuYk07gxyE
         2uRQ==
X-Gm-Message-State: AJIora9t3+N14RMq+Nv9gtph7iSAZgWjtADz0yg3SjCq5vd3jpsh1DW3
        hljTVqNA7KPFRRYMYaS2LAYH+g==
X-Google-Smtp-Source: AGRyM1vO/Njs9T0QhxWnmdp88EO+UHnV3xJPjx2zr3gtlS9l2dz9a1jSMTXQ3cQL+jJU+j1HJ2aYvg==
X-Received: by 2002:a17:90b:1bc5:b0:1ee:9563:2fca with SMTP id oa5-20020a17090b1bc500b001ee95632fcamr31487156pjb.87.1656903161569;
        Sun, 03 Jul 2022 19:52:41 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:52:41 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 3/3] drm: rcar-du: Add DRM blend mode support
Date:   Mon,  4 Jul 2022 11:52:31 +0900
Message-Id: <20220704025231.3911138-4-taki@igel.co.jp>
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

R-Car DU supports different blend modes via VSP1. Add DRM blend mode
supports to make it configurable.

As drm_plane_create_blend_mode_property() creates the blend mode
property with the default value of DRM_MODE_BLEND_PREMULTI, it changes
the default blending behavior on R-Car DU. The rcar-du's blend mode was
same as DRM_MODE_BLEND_COVERAGE, i.e., pixel color values have not been
pre-multitplied.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 8eb9b2b097ae..283327046aa5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -170,6 +170,18 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 	format = rcar_du_format_info(state->format->fourcc);
 	cfg.pixelformat = format->v4l2;
 
+	switch (state->state.pixel_blend_mode) {
+	case DRM_MODE_BLEND_PREMULTI:
+		cfg.blend_mode = VSP1_DU_BLEND_MODE_PREMULTI;
+		break;
+	case DRM_MODE_BLEND_COVERAGE:
+		cfg.blend_mode = VSP1_DU_BLEND_MODE_COVERAGE;
+		break;
+	case DRM_MODE_BLEND_PIXEL_NONE:
+		cfg.blend_mode = VSP1_DU_BLEND_MODE_PIXEL_NONE;
+		break;
+	}
+
 	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
 			      plane->index, &cfg);
 }
@@ -444,6 +456,11 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 						       num_planes - 1);
 		}
 
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
+
 		vsp->num_planes++;
 	}
 
-- 
2.25.1

