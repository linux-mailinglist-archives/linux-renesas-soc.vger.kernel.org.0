Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916A71F118F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 04:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgFHCyL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 22:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgFHCyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 22:54:10 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A528AC08C5C3
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Jun 2020 19:54:10 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id g28so15950531qkl.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Jun 2020 19:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWLNoW8KwtbFLEoTy9JRXC4yS5h7+K+nZ8ogvjRFT10=;
        b=lUwQr79nu0C3CUTx5rkUX1JM2BAtkwxCfNCE3s1x0fNiY1Ai8Oup/EwKIwZl7tFBk8
         imyo6wV2crCPek4sz6POKBBuGTzfNEAnIioM82j5x4sKLb3jTEzrt8WisrFNH9ljoReg
         sntjJM3Xr0qK2z6azZds/Oyt6hOeL0uCARX6/gmI+KgCo7d/BMeJYZjJj8JyyDWuQbw8
         VPuDpLRZpKoNqW3h+sWnPEWNx0xnRrQ/2bkq6QHe+Y8d820PmLmcGuxc0/+H2JE3LkG5
         zUYikng65h8Uj7adKCb3tyN4hs4V7MlP6HyJT9go5Tnx4My3H24EVbJIUHBq4oZlwfaP
         byPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWLNoW8KwtbFLEoTy9JRXC4yS5h7+K+nZ8ogvjRFT10=;
        b=JCVhqLgNqCCTJDVcHF1ahXmnox48/D4ZVGSXWSqiwFzPrIemhFLa66VQVEzatA2U0t
         pLN4oYzvoosTumu9IqyODqpUMCFys04pljTujvLH3psBdjFUWE96t0AwKmV7Iu6y4ZEk
         SDaaECZ0+GKHBOlxieRrSzWg8XdiqLLC8Pn1LoMHIKjrHD21+jGGot/4nqFLhoxCt3hI
         dR8pnRGRJKMiIbkP2G7j5WXrm8elAN7eKwqUFNSP7rcwPFbQbqFH/7mygajZaludFpwJ
         Z7woipw7FjU4DeN3y8cTnEwIPv3rQQK30NLrYKPJopCjea+eWNdxxvlcOBAC/uH4F5+Q
         igCA==
X-Gm-Message-State: AOAM530UuRClClE95iGcpCR97bREIKgNyyRtqvOGI4Wr2awuSjQdN/uL
        iVdzXKIeP3Spv2MbezioLu5Hl2NLqAFZUw==
X-Google-Smtp-Source: ABdhPJyGzJC7FOghKl0SH2kp3RlUIH1JilMo/46+zxMu50q5mqLmutt+XqNuAc3oTVPvFZkULek9Ag==
X-Received: by 2002:a05:620a:1407:: with SMTP id d7mr19353966qkj.89.1591584849407;
        Sun, 07 Jun 2020 19:54:09 -0700 (PDT)
Received: from ovpn-112-81.phx2.redhat.com (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id x13sm6095629qkj.36.2020.06.07.19.54.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jun 2020 19:54:08 -0700 (PDT)
From:   Qian Cai <cai@lca.pw>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qian Cai <cai@lca.pw>
Subject: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date:   Sun,  7 Jun 2020 22:53:40 -0400
Message-Id: <20200608025340.3050-1-cai@lca.pw>
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

Let DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU instead.

Signed-off-by: Qian Cai <cai@lca.pw>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..3304b41f5611 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -48,3 +48,4 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
+	depends on DRM_RCAR_DU
-- 
2.21.0 (Apple Git-122.2)

