Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E91A69FE4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 23:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjBVWOw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 17:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjBVWOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 17:14:35 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D741C5B86
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 14:14:06 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id cy6so30889534edb.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Feb 2023 14:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGUJrtnlz9Yo3S83G8V63+H0kWn768DHMiymUEO8oRc=;
        b=VxGB6sPzhAIZM/XP47p7RUWvv+v6HYDJk5eU+CCIqVYqkRzjaH/GWNvz3F2+KZ4JGz
         mYHNTdFq66G8rEKmRtY5IjyEVpiXJ6Z/0dIpkYbWs0m7X4hFWKpdA2HtVQixrxTz42WF
         L46WsTdiuRbGWo0akeCzeSXsQxnXB2wtViFjDrm1AwWZm6UjkvzKguLARL0eJai+RFCp
         sQnWio5sMclVv8E8ykN7nUsZv8nFMXt3+0LjVp7MzC2+vpJhJ3Pl4cH2NqTczkJ3dE+x
         x29h82Vwva1vS9g6u/pnB4zXINjqdZZc3qwy7sLruh4oc2XDLs9MQ91hR7sXAWJXeFL0
         e2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGUJrtnlz9Yo3S83G8V63+H0kWn768DHMiymUEO8oRc=;
        b=qrk7w07BIcWfl3xAyZVbfccb8KP299++72Xrh76RXf3L4OMJLLBtqMfzI9YsPRBHjX
         3SdbsDjddnVCGvUr+8o4iHc3PBXPNWlnbmL4zdaj9PDKpdwM2B1I2TSki6mGUvua05Eu
         B7yEgmdIDWxN3RmQj/nMFmzQBQNiVx0nhBzmKzpA5BCQHTJHYLE88sD8m1pAVOdwpWuO
         BvKAwiyefGRRRVHsWXPE+kgPmqtwpkur4M/PxrKbNgoRTLA6VrPteh12N6H84h98Nq6j
         XH4CXBGrzcLxY51VuohnRV/h0VVlAfZo0WS5PftVDSVBfht518r2xsvvbguF52jYu/9/
         tJAg==
X-Gm-Message-State: AO0yUKWNjnsoJ5FV8AtkUNxNe/5D2fWKOrG+IFzPJ7UT3usKOStpvC8g
        aaMhIP1cvitiJEXsq/Jo2VkJag==
X-Google-Smtp-Source: AK7set9iKMN+331A78WOS0+283/LRLCQZcWvZJIXGOxwFzQXnHGwTGuTzqDRl1h2YTXjpvwyCnxIqw==
X-Received: by 2002:a17:907:98b1:b0:8e4:96c4:94a with SMTP id ju17-20020a17090798b100b008e496c4094amr4858736ejc.56.1677104041367;
        Wed, 22 Feb 2023 14:14:01 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id a26-20020a170906685a00b008b1b86bf668sm7711893ejs.4.2023.02.22.14.14.00
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
Subject: [PATCH 2/3] media: i2c: adv748x: Write initial DV timings to device
Date:   Wed, 22 Feb 2023 23:12:48 +0100
Message-Id: <20230222221249.1324102-3-niklas.soderlund+renesas@ragnatech.se>
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

When initializing the HDMI block during probe an initial set of timings
are selected. These timings are stored in the drivers private data, but
not written to the device.

This in itself is not bad, but in s_dv_timings() the timings stored in
the drivers private data are compared to the new timings, if they match
no action is taken. This creates the corner-case where the timing
selected at initialization is the first timings a user want to use as
the driver then never writes it to the device preventing proper
operation.

Fix this by writing the timings to the device at initialization in
addition to storing them in the drivers private data.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 1d62e05572cd..47688d1b6833 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -721,11 +721,10 @@ static int adv748x_hdmi_init_controls(struct adv748x_hdmi *hdmi)
 int adv748x_hdmi_init(struct adv748x_hdmi *hdmi)
 {
 	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
-	static const struct v4l2_dv_timings cea1280x720 =
-		V4L2_DV_BT_CEA_1280X720P30;
+	struct v4l2_dv_timings cea1280x720 = V4L2_DV_BT_CEA_1280X720P30;
 	int ret;
 
-	hdmi->timings = cea1280x720;
+	adv748x_hdmi_s_dv_timings(&hdmi->sd, &cea1280x720);
 
 	/* Initialise a default 16:9 aspect ratio */
 	hdmi->aspect_ratio.numerator = 16;
-- 
2.39.2

