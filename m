Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4122178B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 22:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgGGUM6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 16:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgGGUM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 16:12:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B330C08C5E1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2020 13:12:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z2so24324824wrp.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2020 13:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWJo4Xms9xJyKH8uRObCjerwfD0/w2Bq7w9d1Tdqg68=;
        b=UOX4Dtrl9QRt0mnhEULXYaIhXEcwlQEl9dJZ6AKauST0v8/sueYjVcBr1H9gpshANp
         D7Leh7Gl+2NKEN7rDuk7xlozsQQmDcFZg1uLXs+bi5cvrSo2PcRAIgbCNAj4hEOLHs4E
         nH2oRdO8AAwxZVQ6SAlDyIBsQf7zFeXKTjhnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWJo4Xms9xJyKH8uRObCjerwfD0/w2Bq7w9d1Tdqg68=;
        b=oD1TdIpKpFu54uu7UnoezCS0hxx3w8hA6bv/xpgG5TmiRhuu4CkxyFba29lW0bQhPW
         yz1zcndhNeglWoUcpiRfpgmA8o/+onWz16glLyvIF3Pbl/djPaVVbgnxIXtmWdg9J5oq
         J+HLTPVyrstH359T8SdXFQwaHvSdCi2ygbk9KILDH8TUXNADzQ+8qEq0cJAhF17vQeaU
         2OLwTPlsGeut/ZffGtmeXtlBAxgVr7VI1U8VdmHTDonHWB08MHlCAYH748HGTFwX2Q2m
         Z+jqxMXw8vAc6S5myOoCKIPbIwRZVYepDbChlu+3dReRwGVC1+C2xuIB0sH5f6n5Mu8A
         jrXQ==
X-Gm-Message-State: AOAM5305BkwARYTp+9NbPBMmP9GVM5nr2rJRwF0eY5odzcEHXZjdnnvG
        AmZGQNyXquJqGgCUe1oEN/iHkO0WCXA=
X-Google-Smtp-Source: ABdhPJxDsyfr4zDexGLiiFYSg/7wzAGNH9tBkAAtd+Zc++yr8EV6rRAt45326uR5zE2Phg7PZ7uGVw==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr32057251wrs.345.1594152776092;
        Tue, 07 Jul 2020 13:12:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:12:55 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 12/25] drm/rcar-du: Annotate dma-fence critical section in commit path
Date:   Tue,  7 Jul 2020 22:12:16 +0200
Message-Id: <20200707201229.472834-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
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
index 482329102f19..42c5dc588435 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -391,6 +391,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	/*
 	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
@@ -417,6 +418,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
-- 
2.27.0

