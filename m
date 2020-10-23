Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA22A296E65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 14:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463618AbgJWMWl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 08:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463616AbgJWMWl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:22:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD11C0613CE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:22:39 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n6so1552774wrm.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3NZe7vLn6lD7nkDNbTprNLF6a+N9v1C4Qxxx3dRr+E=;
        b=OJpDzpwTCtfzVlTdltudrfVKKES1edfNiS35w78x9FwDemsY3lSs+MLaUdUVQbJpij
         dKAosS1nxMHPgDo9SZ6KaLlc1KTEcKmWWwqTjJ0a0Gb1LOebCLYats1VPhAmFInNfAFn
         5ykwXufwXxwmuyHPkAc7oKXCl2rcqd29y0Hzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3NZe7vLn6lD7nkDNbTprNLF6a+N9v1C4Qxxx3dRr+E=;
        b=irmPSMH6QRwYlxWw8GNlgKt0/oRkwr46o1zTBNb/17r6+iICna4GGUkV18HdfTa6/r
         xrtr5QHCu3X+qwMEECiE9A/cwTvmxSpV3KDILqBvYmp9WrZhs+admihMDP4Szr11vfoh
         knXWUqvN31/fzcqf7ELlJhzlAlAGmsNz/TIMMIHLTWIfER45y4NkJdQ1o3rGvtrTnYbE
         raPCwC26NcHULkFGVVApQ9EGW0tG71TxDyw1AF+uaF8z+F58V7tMAIccNELMqviuN1Vy
         FVzT8gADD59VJDLzfRyo7m/oJ4e0JtFyWatzqXbGx2Jm8uMpmLOopUrCDQfaFnTSzZPB
         YD8A==
X-Gm-Message-State: AOAM5302nbm7vqhQshInEIl7qj6nNj4RdciveBrvbTXSvKjeYPdNoiey
        Q4MonGr7ZrA2vmWzcTjON5Dj0w==
X-Google-Smtp-Source: ABdhPJzSNL4sJERp/2eSQ+h8FWQR4c5/iIHCJq+1OAZs58Faet0em60bngY5pomBtc8/sRioPM8fIA==
X-Received: by 2002:adf:ab50:: with SMTP id r16mr2243426wrc.235.1603455758304;
        Fri, 23 Oct 2020 05:22:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:37 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 14/65] drm/rcar-du: Annotate dma-fence critical section in commit path
Date:   Fri, 23 Oct 2020 14:21:25 +0200
Message-Id: <20201023122216.2373294-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ends right after drm_atomic_helper_commit_hw_done(), absolutely
nothing fancy going on here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 72dda446355f..8d91140151cc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -441,6 +441,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	/*
 	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
@@ -467,6 +468,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
-- 
2.28.0

