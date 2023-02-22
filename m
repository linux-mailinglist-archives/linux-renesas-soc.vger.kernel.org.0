Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DF169FE51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 23:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbjBVWOx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 17:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbjBVWOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 17:14:37 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C69474F9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 14:14:10 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cq23so36097002edb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 14:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEppd4OhzMYnVa+HKy8qqHzfPuUopXSp8sEG9Vdb4jM=;
        b=EYbRWsmMG++uhINyyeH8Zn2RewJQqhVUkAG2QqSYlgHoUF9HGkAGswoAPQAto2DPYr
         R9D+1rBmO2qgkg9vLq3g4hpo2S3D+WoUlA1vl/Lw6Xc1YTcQHv8n5FAXN7uVJt0+tNI3
         vPcMhwI8KWQzq29ktsN1DkbU9oKF4aiN9syhvikd2mMhpfz9hTo3ENUymVSiua4H5wqQ
         FGNDIk4+jdwZwMJ2OAx5MaBsmWJLAPO9FjXMmBqwDUdvoxEs9GX+GR9vJIuoRSoY/HTU
         zaDH+H/soh4TX3y/JG/Tu3ahVPw8SFzhFSxfsHGk5JX5Z1tco5S/5j2bFqUCqRuhZyjW
         n/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEppd4OhzMYnVa+HKy8qqHzfPuUopXSp8sEG9Vdb4jM=;
        b=O8hZHU9L3jPNiGUvtnm5ebNRJO0Wn+XPFNBmG+qcnVor/fLxrM7i7/v963NhVV5ne8
         gBzLPvaWznldkKVBEH/VF/CYIeubC9ggRolJmeoHyMNt5yWY0XJekWtuMbS3aVkckjGk
         TXwnDhzFP9QTBQatn7Zr/LC98rANlLKGCUfAOIjuOauighBWKVTCHOxzd1Ork81dGAKV
         vcIHTPaD3c4EFZHqIX9t0Z/PAaLYTOo6C9pV/Md3zHgYDMq77XNyWn5Iy3Gf2nhXG0wc
         xf+lIQs6FidJqUfRNHIRG5kYE/w2KYWzVsF9rLZ1pgMIBES/8sb3v/W/lo9wgSo6Arcp
         V62A==
X-Gm-Message-State: AO0yUKVK1O7JE0xmT0+ljZfxQPDOnGy0bEIpugO7mZ1Mb4dxu/KWfiW/
        S1zrBoxGMpyDs+/pJ+G3Q+O5qQWYsy4F/axviO0=
X-Google-Smtp-Source: AK7set8AfoeIZeyoOYhpqhlggdvn4LUAj2j06/1mpD2pGHua9C13pVdBojL2xs9rQt0Vu+33IahfIA==
X-Received: by 2002:a17:906:fe06:b0:8af:2fa1:619e with SMTP id wy6-20020a170906fe0600b008af2fa1619emr16755194ejb.18.1677104042279;
        Wed, 22 Feb 2023 14:14:02 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id a26-20020a170906685a00b008b1b86bf668sm7711893ejs.4.2023.02.22.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 14:14:01 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: i2c: adv748x: Report correct DV timings for pattern generator
Date:   Wed, 22 Feb 2023 23:12:49 +0100
Message-Id: <20230222221249.1324102-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222221249.1324102-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230222221249.1324102-1-niklas.soderlund+renesas@ragnatech.se>
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

If the pattern generator is enabled the device shall not be queried for
timings. Instead the timings programmed shall be reported as they are
the ones being used to generate the pattern.

Before this change an external HDMI source needed to be connected for
the pattern generator to work. The driver would query this external
HDMI source for timings and program the pattern generator using those.

With this change the user can control the timings and have the pattern
generator work without the need of an external HDMI source being
connected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 47688d1b6833..400d71c2745c 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -283,6 +283,16 @@ static int adv748x_hdmi_query_dv_timings(struct v4l2_subdev *sd,
 
 	memset(timings, 0, sizeof(struct v4l2_dv_timings));
 
+	/*
+	 * If the pattern generator is enabled the device shall not be queried
+	 * for timings. Instead the timings programmed shall be reported as they
+	 * are the ones being used to generate the pattern.
+	 */
+	if (cp_read(state, ADV748X_CP_PAT_GEN) & ADV748X_CP_PAT_GEN_EN) {
+		*timings = hdmi->timings;
+		return 0;
+	}
+
 	if (!adv748x_hdmi_has_signal(state))
 		return -ENOLINK;
 
-- 
2.39.2

