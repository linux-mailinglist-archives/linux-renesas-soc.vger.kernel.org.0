Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB706931C6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 15:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjBKOxa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 09:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBKOxa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 09:53:30 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45D91ADDC
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:53:28 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id o15so4647747wrc.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21aCSfYgBmZXft3zT57UcTlnbYW8Zgs6hoSqrZVY/Fw=;
        b=GN8PQ5ZJJgnOYnmXphfBhDHz5ZVg3ZQIczcBOjiklECLrYVuK3iIrOh8mMHvmyjz9Z
         IYWnjdA4rGoxnYvuE4QK/mPIuuyQP/iTv2y9+uQzo0ixU/zLu3u5q5fMd2XUeq4SuwYG
         /V4xqXIt3eXsBjrKzOJHutjZfSR2HClcV+CvzpDgD1WfDhbYUaSy97s5qea65zVsIbt/
         /+BvkO+AmZt42Dva6mOfs3+Ny9mu7Q2cvprwc4MT+I8rdQSN0rz7DYMfu9eKHSkYUhez
         wWrZfN4i7pYahEi7eH+QqxNsc8Xe3nhxNqPmOoDbALTqoJHxQqhdO81gbrGSPBNAdtCA
         LfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21aCSfYgBmZXft3zT57UcTlnbYW8Zgs6hoSqrZVY/Fw=;
        b=GgbYlcick88z9LoTz80z241ghhme6hU6xHwy7wy+LPV6nrdQo8Z1onFfOTTIzc2+tC
         4N5mBry7d92zq68AhsI2iw4FCx9y51Zof7VAw9HWdPdcq/eooqLcK/I27ALfFqiOxG9G
         L+1JeDHKfQi6mZhmTgW6vflwNSyVqDYPUiyK4UY8Azjo2w1GU+yOzvS4rdYqGYboooCN
         wsNxeFpOL5O1/NSJCXdSdv1ib9Nths8WFyVbI/1rzIppPtxPP59Pu96+5e3740FTaH9f
         MkKABhYDiAd88zBX1XYGumEBLCfpkura/uQISp1yv7TkNxrbK9HuA7mXqX1ux78K1Zsu
         hAmw==
X-Gm-Message-State: AO0yUKXZUsSYf+IoQpuaJExEeDtoJobAiEHz4OwhpWvolo9X9wssZWX7
        590BAKWt0TIiXu9Fty6UzMQXeQ==
X-Google-Smtp-Source: AK7set8898uSZ8seJGKUy7IR3Xr32jIV3OBQNzEqKASnD6Cp9kb5prHW6QBYKrx+xKLWPIlcCI8i+A==
X-Received: by 2002:a5d:46c8:0:b0:2c5:4a20:120f with SMTP id g8-20020a5d46c8000000b002c54a20120fmr4497671wrs.43.1676127207514;
        Sat, 11 Feb 2023 06:53:27 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id u10-20020a5d514a000000b002c3e28d0343sm6091344wrt.85.2023.02.11.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:53:26 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: rcar-csi2: Add support for V4H
Date:   Sat, 11 Feb 2023 15:53:07 +0100
Message-Id: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series adds support for Renesas R-Car V4H. The work depends on the 
series which adds the compatible value added to the bindings 
documentation, posted separately [1].

Patch 1/3 prepares the driver for R-Car Gen4 by creating function 
pointers for differences with Gen3. Patch 2/3 prepares for parsing CSI-2 
C-PHY properties. Finally patch 3/3 adds V4H support.

Tested on both Gen3 and Gen4 hardware without any regressions. Tested 
using both regular capture and v4l-compliance.

1. [PATCH 0/3] media: dt-bindings: media: Add bindings for video capture on R-Car V4H

Niklas Söderlund (3):
  media: rcar-csi2: Prepare for Gen4 support
  media: rcar-csi2: Prepare for C-PHY support
  media: rcar-csi2: Add support for C-PHY on R-Car V4H

 .../platform/renesas/rcar-vin/rcar-csi2.c     | 394 +++++++++++++++++-
 1 file changed, 379 insertions(+), 15 deletions(-)

-- 
2.39.1

