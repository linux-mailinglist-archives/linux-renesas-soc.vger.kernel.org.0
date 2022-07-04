Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1695564BE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbiGDCwi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGDCwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:52:37 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A142ADA
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:52:36 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n16-20020a17090ade9000b001ed15b37424so8205762pjv.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmhuCm9brp5mt6f3uHVK43St1tlnXn9UsMtpRIeG8p8=;
        b=A7Ff3bdAfbT0D0hxGYGcPVbr5FEd6Br1hgRpsx8LeLn/64N69ac7HZTN8G5Ae6VFHp
         5cJlHEB9DTAKorUrMBnEXVX7fGdgRbazNL5gk2nZiq3xjoy67V8zEPVloeUenID2bSKa
         KBGZS1dvZvY/8d6Ks3CkTXM3j2Hnb0p1tPRXTH+IbT3QKZNjvxn4VDXJ7FweZj4mDv/7
         tNV2JFmmA80Dhrsa0zvZNFrB+KXnPGvJolcnSYRjLgqeIrvoQbjtxWKPGg5F1L0If9j6
         C+6fy23yRjQ/qGljugVz1u6+BG5vNbthSw3+8Jtq2YB/UjWe9Ksh/rCDLLmFiSI0MHWZ
         KQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmhuCm9brp5mt6f3uHVK43St1tlnXn9UsMtpRIeG8p8=;
        b=vDFjyScUKBH2L1ti9K+7Do8NcbT5frNa5DzTjr7ow1wIKRTow2JPmACPgxJXKjHFoB
         EKcnbvW8w640/SHuTRZVXbqlUN7hX71+8QGKKHybfyBNWNmWqYKGlkbHhHfMq6zDIQcw
         CZu6JN0CX4FPUoyn8wvEbjYvAXBIiJHHltsogKQq7OWRW7QcTOth3XxLOaxvSHxJa1wZ
         vSu5Tk25w9k7qOzCG4hOY0ussZZCGUkxnxEUhZZbm/c8E4fsozA/lG0E6EaGpRrJxBWK
         VmfTboco8AdC5boVnwxv8o/G+KeGonQf8wHhdXqM91YuYUCvydOi8Gmvi/X7f3+ENSI3
         k+sA==
X-Gm-Message-State: AJIora8fNKVPx8XEZNqQ2nUAvPxNF7g6U+Wz5rD7SboSpQiDfA2ir/Z/
        fC/wKSQZI3sxbTPKR1WBhq+J8+P3rL+dUOCL
X-Google-Smtp-Source: AGRyM1vor7udaTpunpUWuttCOhbXPTjt5BlCE4py0pRe1SY/dk9ocxVkeuPRko4Gjpx/LhEc+2mq6w==
X-Received: by 2002:a17:902:8f89:b0:168:d336:ddba with SMTP id z9-20020a1709028f8900b00168d336ddbamr32355327plo.1.1656903155852;
        Sun, 03 Jul 2022 19:52:35 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:52:35 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 0/3] Add DRM pixel blend mode support to R-Car DU
Date:   Mon,  4 Jul 2022 11:52:28 +0900
Message-Id: <20220704025231.3911138-1-taki@igel.co.jp>
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

The series of patches adds support for DRM pixel blend mode to R-Car DU.
The current R-Car DU implicitly supports "Coverage" only.

Unfortunately, this changes the default blending mode of R-Car DU to
"Pre-multiplied" which is the default when pixel blend mode is
supported.

Takanari Hayama (3):
  media: vsp1: save pixel alpha info in vsp1_rwpf
  media: vsp1: add blend mode support
  drm: rcar-du: Add DRM blend mode support

 drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 17 +++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_drm.c  | 12 ++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  6 +++---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  2 ++
 include/media/vsp1.h                            | 14 ++++++++++++++
 5 files changed, 48 insertions(+), 3 deletions(-)

-- 
2.25.1

