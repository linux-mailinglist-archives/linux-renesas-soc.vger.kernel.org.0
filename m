Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2DB58E8DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Aug 2022 10:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbiHJIhW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Aug 2022 04:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbiHJIhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Aug 2022 04:37:21 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AC5FD1E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Aug 2022 01:37:20 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so1447805pjl.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Aug 2022 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+8Zc8rYa4ZxEs+Ek2Veiq0PdTVu1ampOcuivxciZFJ0=;
        b=4P/ZUbIZjm73r78BXFNP71nshS+JXMhpGurRsQ6u30PLvyV1/jSisEnt/wjw70iAKt
         dbh2AvaMkGOastO2TZ257O6ZVKxQWDR0KL5qIXa0Mx9LCRikzecreU8jOwNx+uM4neCb
         BpEyCCUL2HRor7KNQw1a3Nz/Wo/IG2uALiV+QuAgudl+/4gw9szJq4W0WMYtd9pZNEUM
         FzU9L1H0ONwYmZXIwHYOhU3vqV5WoQGf0klR64xK4iuiFGTS66Ydrwv1JPT3ojk8z41+
         xM51EvsgwdoJtAakJT1+9ueQ9RJl2T9JgoRafmqQIMP+PBz2OaDffRI8Ytka40vffp4B
         FBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+8Zc8rYa4ZxEs+Ek2Veiq0PdTVu1ampOcuivxciZFJ0=;
        b=ihkCD4uiXcxoxvZunUO7Mpw4NuN/aLmOThj15gJCFO3WnF9QeNhZ7HyvqOwreyPd6q
         ohbbsXrlIBKCMIFwwY+jRvs4Pe0e4csqi/SKmCeZyWOg9eVElXoXGAzls6vPFBLwhTfV
         gwr9WK0SCTRI0ZkXB32foLut2yWzHl2cpfzDTvzbud86BoljhJJVCz4vWfU92jKjVgiW
         1IgGRf8G/KHWPKDqociHC7337F+CtjxDdOTOm1cWOHdrgdTvUI+7x7yn7nXLv7y9GukR
         J0bfXbFoUrom42fFA4uFuAqUiUNfHWqsLrV99J3qI6AzBYVGPGRCF7KP3ct6tuckgqdO
         +ung==
X-Gm-Message-State: ACgBeo0q8yvsyBnNwSUZAQFczgb4n87v6zFYFpxPD+pGQiwUEGoxKkpU
        HeH3Xx99qf7HfY/a2BOGYN0v3A==
X-Google-Smtp-Source: AA6agR7L3QFrswCxE+ExkFevYhjKCaNMiyRwotJVapBpfZHxZ7APHHcKeHV4wMY7XBjhMm3S/Q8xBQ==
X-Received: by 2002:a17:902:f548:b0:16f:9649:be69 with SMTP id h8-20020a170902f54800b0016f9649be69mr21690874plf.134.1660120639828;
        Wed, 10 Aug 2022 01:37:19 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:37:19 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, mchehab@kernel.org,
        Takanari Hayama <taki@igel.co.jp>
Subject: [PATCH v2 0/3] Add DRM pixel blend mode support to R-Car DU
Date:   Wed, 10 Aug 2022 17:37:08 +0900
Message-Id: <20220810083711.219642-1-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The series of patches adds support for DRM pixel blend mode to R-Car DU
driver. The current R-Car DU implicitly supports "Coverage" only.

Unfortunately, this changes the default blending mode of R-Car DU to
"Pre-multiplied" which is the default when pixel blend mode is
supported.

v2:
 vsp1:
 - Add a premult flag instead of blend mode enum
 rcar-du:
 - Support DRM_MODE_BLEND_PREMULTI via the premult flag
 - Support DRM_MODE_BLEND_PIXEL_NONE via format override [1]

[1] https://lore.kernel.org/linux-renesas-soc/20220704025231.3911138-1-taki@igel.co.jp/T/#m3351cb5965cd5bf2d416fa5ca5007773260205bd

Takanari Hayama (3):
  media: vsp1: add premultiplied alpha support
  drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
  drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE support

 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 26 ++++++++++++++++++-
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  2 ++
 include/media/vsp1.h                          |  2 ++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.25.1

