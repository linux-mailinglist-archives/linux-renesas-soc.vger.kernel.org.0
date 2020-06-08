Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E791F1124
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 03:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgFHBsl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 21:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbgFHBsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 21:48:39 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF82DC08C5C3
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Jun 2020 18:48:37 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id w1so15841351qkw.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Jun 2020 18:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+d1Eg/67SeROyIrXeX/NcuRKSdM7i+nQ7oJN4CqZ1s=;
        b=UAH4VeW8rcw5ifVzbhD0DAIm3EmtBlTSzdIjL4I3tUMNCd6rB0fHVN/Tcng7OXy/Im
         Igf39lXIWhkgyvfK6zpoYxZeHJ9SCdJ+f8d3by/31azigmWdLCtLGvTDBYcyx8rHCPDu
         5jS/dLex42d2wwtqbMlNX8B0gvlKzm5hNSvqdPjknfhKgf32GJAgLCJolzLhot278uUO
         NOYi+obqJcXHL6zWcPYKXYqTy4Jov9QFB1Zie2De44J2c4GaRa+XLY6a220Zff0kA0BO
         s5OGDXB3WVZmUVCRNZyBV0m+GVxHUC8TEXA+qs7zf0m5oqqoLjNbzFAB9wDZmxxdWSBv
         60aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u+d1Eg/67SeROyIrXeX/NcuRKSdM7i+nQ7oJN4CqZ1s=;
        b=HxO3M7BdwHwML1AlQw1WYdwyD624ispjfLym68bijNhFgMHG4jhsHO56UMPx7dAlMn
         xekpBV+MI3RqovAlnWPR/rsRYkyqK5CqoyMpNICqr5oB8zyhpA15OCHdWimWAzVZU4jM
         giWbxAs+7RPRSMxWDeJBNRRhZvE1abB4OZW9kjMSseNhWBN3GGhNUjWZ5OaCxs/u8DEC
         VdPY0jaPJrOLHLuuMHX+cFVN4YiUllyxyLd2XC/gWocnF7m4eZ6opnbSSeJ6pmYdG953
         ds0+ywQbXg1N8ajTRSbL2sVzKjivQahNguv2Iuu4hBOGSIa8wltf5hlK1GJ4UEyvdTcg
         xhcg==
X-Gm-Message-State: AOAM530YEsT8iwaoecmrOAAO9PA94HInu7nLcq/hoQdum0pTl+HEOoDy
        n8nN2+QYa5+RMNwSp35yptAL3soeFLE0vA==
X-Google-Smtp-Source: ABdhPJxXcwD2HMq3mQYT+qLBtgZad05Y4KCfdKEMeIYCHdA/aBMZUtrEsncE5ONgoG1uUECyN+C8vg==
X-Received: by 2002:a37:a801:: with SMTP id r1mr21062926qke.174.1591580917048;
        Sun, 07 Jun 2020 18:48:37 -0700 (PDT)
Received: from ovpn-112-81.phx2.redhat.com (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id f30sm6423106qtb.9.2020.06.07.18.48.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jun 2020 18:48:36 -0700 (PDT)
From:   Qian Cai <cai@lca.pw>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qian Cai <cai@lca.pw>
Subject: [PATCH] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date:   Sun,  7 Jun 2020 21:48:18 -0400
Message-Id: <20200608014818.2814-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
the generated .config a bit ugly.

 # ARM devices
 #
 # end of ARM devices

 CONFIG_DRM_RCAR_WRITEBACK=y

 #
 # Frame buffer Devices

Signed-off-by: Qian Cai <cai@lca.pw>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..d80696455d3e 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -48,3 +48,4 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
+	depends on DRM
-- 
2.21.0 (Apple Git-122.2)

