Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF7529F9B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 01:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgJ3Aaz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 20:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJ3Aay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 20:30:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B11C0613D2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2020 17:30:54 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 2so5028693ljj.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Oct 2020 17:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcU6T4hccd5cIgxH69lq3LU3dv7XKAqa7a9Wy3kb2Dc=;
        b=leJqdVBahsfYuyVGnp9yBWGadv/E8WB9Ig4JGQiNyu3DnPfed0IwIVmf2uEAdtpuMB
         ICLXiiowdZVfibEEsDMCqRbfIl91S6AvQAV/+A5ydpcsVu+2/dl4vtIzGJRXDePNuGHU
         JPR7fquhT3lhSKFh61nxSr9dt9pBUBgf8JFbGPQkM4bGwd7ibRTpTjm9lhZvGS0HglWz
         qF8HP0VrVTBR8H0UY4K23h2f9qLhZe2BArWsOgoXQviCEeNcpqnmracXw+EZnSOGbP8t
         sa+c265v/OqRU1CmqKElqEBP86I09lB4vcMkMTblkYkyRH9ZwJkQPaJWCrbniyFLXYIz
         Uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcU6T4hccd5cIgxH69lq3LU3dv7XKAqa7a9Wy3kb2Dc=;
        b=CTsY5KlLWIN3OV6ZTzbLnfNBhk4HPMRIzlfF2GM6dvqT0VFH77jmk6iNlGee2lqppH
         NGnMK7V3E/Ix+KcE4pRVwRvnwEYe9KPq1K+J33jnHAfjC865Lf1cO39F1VPyudiL3qpV
         yVyTSaSCyffFv5kJqIaVV21ay3vIUkphKcvBVH2wyf0xlj+a0I62kIk8JZ21sqWuAbA+
         hS7EbGlo2Ivdh5JNuDIAPS5gq+8O+m5HlIi7nHPuDc3J1sOOjrbKWDLsVPbbLyn4P9+y
         4M7B2Zkll6EmJeT218dj2L6HybC5pwqwRZhNttXKMbIIyVxh6l1YX6LVR4ERKu8Po8Ng
         yD2w==
X-Gm-Message-State: AOAM530DiFFosRhoXxGVFklaXLe+ANaYFbICGZU8/MlO8njP/gt3VVsA
        wkt3jmMKL3xtBKde3bIJ+0I/kA==
X-Google-Smtp-Source: ABdhPJysATEz/+0sEJLgj3DA4+hz7bygNlLwNnEkTdEngOO0I/TIZuUL4RDZe3S4Qiv5MhxkgBI03A==
X-Received: by 2002:a2e:8049:: with SMTP id p9mr3121422ljg.9.1604017852754;
        Thu, 29 Oct 2020 17:30:52 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id j10sm497336ljb.93.2020.10.29.17.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 17:30:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] fbdev/sh_mobile: Drop unused include
Date:   Fri, 30 Oct 2020 01:28:50 +0100
Message-Id: <20201030002850.6495-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The driver includes <linux/gpio.h> but doesn't use any symbols
from this file.

Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index c1043420dbd3..027c74d7c010 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -16,7 +16,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/delay.h>
 #include <linux/fbcon.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/ioctl.h>
-- 
2.26.2

