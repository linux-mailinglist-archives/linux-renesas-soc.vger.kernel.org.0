Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219FF58E8E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Aug 2022 10:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbiHJIh2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Aug 2022 04:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbiHJIh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Aug 2022 04:37:27 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1B921271
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Aug 2022 01:37:26 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gj1so14123001pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Aug 2022 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jZE/fMa3whjYdRXk0oQ0myv5N7zyZKLStFntjy3bwEI=;
        b=7izV4xzqPBcm+fkGJWQIWEYXXyBl2KJE72/4VWAYy62YD15G97Ha+FQ7JAASfztKKX
         2XbzwrixQzYP67EER7qP3Uch8n7LGJ3tilyLpiibbUMrlq1wpOX3aCLqQus00U00Vs5U
         XkjIGhmt0gdTU29kmMhJZeayU27DKxFc+0lz4mbQ1MxIVcEv0Lz0pzgbn2SJ79cqPgtM
         pKL74U+gySXOOWjI2QN+nKFRdBkYYtDQgWilsQT1qP6SY4JuoFEqvjyIXycc4QASNwE4
         DwtushkKw3ADZQZkEhwi3gQZU29mugL4ocadBfdmNJRqNjU86DU7SB66Zz6U26+kOs8C
         TuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jZE/fMa3whjYdRXk0oQ0myv5N7zyZKLStFntjy3bwEI=;
        b=H1oUgv8klKy6RDEQSabCZugpPKpHTLp+sOJFiyFP4LfjJpatTNBqmRwuuuQ2CXIxTZ
         VjxapfkZCb/0Lla6pwbxod1B/S7tYkoUeZr+E31rZ88GJUCn/n/skQylo7q5uZA31DQB
         fmz1mknyFnQ1s14PHEzJUHYaGEfz9xj57b78cz6VMwS0xIeCyK2Xdd/W8XBUTSMWfX1m
         LEMOoGIcs6FnJPhFrwq2ABn3CI+er4vdvm/knNoxog5ROtr6kbDV5lBCf6d/9l7r3fCX
         hCcI1Wx4xAqM+a8GN/12W5F+wu3y5SQeuwZk35Cqqm7NMz+Y7cCcL4qycTdAiJjZoxoc
         Bs3A==
X-Gm-Message-State: ACgBeo30S9CH4AMBR4j7f+YEQYEXvzAsAqJF3/mrko7wmUg3YzBR8ASs
        bxbZyT31lEaQhzcYSygQ6DIpSw==
X-Google-Smtp-Source: AA6agR6fRL4zAL56XiuF0fIRADvxgqbnar/ch8938KFYKoyIOFDHiYvHp5/BaQbSepd5w8c4gsQUww==
X-Received: by 2002:a17:902:d503:b0:16f:1503:4815 with SMTP id b3-20020a170902d50300b0016f15034815mr26788702plg.17.1660120645661;
        Wed, 10 Aug 2022 01:37:25 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:37:25 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org,
        Takanari Hayama <taki@igel.co.jp>
Subject: [PATCH v2 2/3] drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
Date:   Wed, 10 Aug 2022 17:37:10 +0900
Message-Id: <20220810083711.219642-3-taki@igel.co.jp>
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

R-Car DU driver implicitly supports DRM_MODE_BLEND_COVERAGE only.
This adds a support for DRM_MODE_BLEND_PREMULTI. As a consequence,
DRM_MODE_BLEND_PREMULTI becomes the default. If DRM_MODE_BLEND_COVERAGE
is desired, it should be set explicitly.

This behavior comes from how DRM blend mode is supported.
drm_plane_create_blend_mode_property() creates the blend mode property
with the default value of DRM_MODE_BLEND_PREMULTI. This default value
cannot be modified from the atomic driver.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 8eb9b2b097ae..b9580fcfec7a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -167,6 +167,8 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
 			   + fb->offsets[i];
 
+	cfg.premult = (state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI);
+
 	format = rcar_du_format_info(state->format->fourcc);
 	cfg.pixelformat = format->v4l2;
 
@@ -444,6 +446,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 						       num_planes - 1);
 		}
 
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
+
 		vsp->num_planes++;
 	}
 
-- 
2.25.1

