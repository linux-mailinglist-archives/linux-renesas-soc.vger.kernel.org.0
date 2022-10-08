Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA2C5F858E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Oct 2022 16:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiJHOMT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Oct 2022 10:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiJHOMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Oct 2022 10:12:18 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640524A817
        for <linux-renesas-soc@vger.kernel.org>; Sat,  8 Oct 2022 07:12:16 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a26so16678296ejc.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 08 Oct 2022 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0QbvPxiY+MeQIGR6l62aG+Bjcd6CIWsYg5jv5wW/DI=;
        b=uIo8g8OKRVj5jBu+TXV+hiKo+5/FKoWXQ116F8mawF2H9Gm/u116IDa3QGCaOnl41O
         AyZeCH1LZmnsyB24mETrP7vzs4U8oVmoaelZ7PKZHABxTsJf0s3LOLlTSHMlo/+3qJC4
         tCBYyTNxWiWjFiEdR6JZp/r+/WQwTo5ebAsOdY0OKxGiH5aEzD8SKptKNzoHQVcWdScY
         V5WspnxBgxZFGNQ+iWrv5TfiZKCqJN5Y+SGT8Z833eBgwztwD88i9ghMw29K4GoSmuhr
         W7XAN1G2sZyA4Pqqc+J+Q032SLbzHU3WAudolLxV4Bp8WBApI0v23f9Vu/TEJbAWJ2hG
         N7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0QbvPxiY+MeQIGR6l62aG+Bjcd6CIWsYg5jv5wW/DI=;
        b=We4i2ZKs0zxL+i2qdeh8Vuh9kRz4rveRJrXsF3z53dg/ZBVkX9M88HTgf8kjb6irnN
         PztdFJoSNEQfPKWwS0Wc5bpEEpvaJEYV10ImchaTj+zca5UpsxFYncbT7i+Jn6jJvc5Z
         NXmAzPbxOVdya2TVZtydKuV42UIvIhgBSpcCgm3/aX+/EB4/xA3hYa/jxxvS5+Wfauef
         XMpA2XCq6+ZA3Ija6rnsTH1USevBiB6dmj55DtE0j9LxzCNqkAwey4DvOODJo6TWy1y0
         f2AZA9BmIh6plSjFgy+QBnhFcKBpSNkuanCeWGd+1LusMGIGpctrzME7OyoAijvcnHgX
         03bw==
X-Gm-Message-State: ACrzQf28w8X4xlDzHqHHWShy+zcwXlX5ZEM3z7RblLZfnXO2csxkFcNM
        ptELQKp+UXHFCDduvzGKHSe9Bw==
X-Google-Smtp-Source: AMsMyM5VQ7yP5vR1PSJTzyrUtzBzRZG77J4y8z0Rg0wrxBDfPaKqgEyW6uYxQ3BBmJkJga4NwxFb3w==
X-Received: by 2002:a17:907:62a7:b0:789:48ea:ddb0 with SMTP id nd39-20020a17090762a700b0078948eaddb0mr7883069ejc.575.1665238334912;
        Sat, 08 Oct 2022 07:12:14 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5370.dip0.t-ipconnect.de. [84.172.83.112])
        by smtp.googlemail.com with ESMTPSA id i17-20020aa7c711000000b004575085bf18sm3500619edq.74.2022.10.08.07.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 07:12:14 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: i2c: adv748x: Remove dead function declaration
Date:   Sat,  8 Oct 2022 16:12:05 +0200
Message-Id: <20221008141205.3493964-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.37.3
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

There is no implementation of adv748x_register_subdevs(), remove the
declaration in the header file.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index d75eb3d8be5a..6f90f78f58cf 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -428,9 +428,6 @@ void adv748x_subdev_init(struct v4l2_subdev *sd, struct adv748x_state *state,
 			 const struct v4l2_subdev_ops *ops, u32 function,
 			 const char *ident);
 
-int adv748x_register_subdevs(struct adv748x_state *state,
-			     struct v4l2_device *v4l2_dev);
-
 int adv748x_tx_power(struct adv748x_csi2 *tx, bool on);
 
 int adv748x_afe_init(struct adv748x_afe *afe);
-- 
2.37.3

