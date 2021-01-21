Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4706D2FEEDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 16:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbhAUPbx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 10:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733015AbhAUPbk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 10:31:40 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41916C061797
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jan 2021 07:30:16 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id a1so2150493wrq.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jan 2021 07:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x+uDI94Qw4eCyYW0v0o9rlbjS7vCzG2/PuZcRGrnOYM=;
        b=JMy1rlperfiiscGLWeNqMi0dYx5oz6fG5yEKEXH+EWYyjX4VIcWByZo1P6mlxYetyN
         bk3fWUbXiaH38xoRtQuyJdCKLwX5Z937hxtNAkJ3SN3wm51/Q+E9yj7J9nXL+kib/87z
         vmCq/z2AOQKEi7FKmbQLTPrfjN1DvwhyHITrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+uDI94Qw4eCyYW0v0o9rlbjS7vCzG2/PuZcRGrnOYM=;
        b=SQ/vSMj6jV4bud9GgS7WJXubvKoitIaMvi1Sj3j76fnEBj6a/dDFzUrNVPzmskWTj0
         0mJUq2CClCcls6gYmeDSMjOzBhnR6wHu4+TTCfQD0DPjtN0tVa7vdIuhdh9nJwSYFdks
         2FBHSsxQtarW8gAtGT7UFkK5fyCYh7eMKun5LukTq7mssM3YvJRQpXyc9MGu3fwRbx3Z
         ZqvwRC1R15FcT0psVcU3x+n3DfhXnXKLEX+cjE1w3bm0EXwjRHUcjKrxR37zrH5Wppkr
         C9khVx22YNJH7eMf3JaLwDDxfPe600t4Qo+AmcNC9Yf2eGgH3TknEzateuwE2zrqmZ6y
         nUTw==
X-Gm-Message-State: AOAM532X+gH2msAZK+bHjR3nakwpwahjubxv3lqj0NCa7v6OenPdMurp
        /KgQxdaHpH4rxf9mc0z5kQdLaw==
X-Google-Smtp-Source: ABdhPJwbrDgcMH/A2JeA///UqHgkhJo/iRlMZPM0Ih6GMosNi0SIkfMyiUc+Tj+iCg8P0W0XpbPNHQ==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr14973709wru.291.1611243014995;
        Thu, 21 Jan 2021 07:30:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 07:30:14 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 09/11] drm/rcar-du: Annotate dma-fence critical section in commit path
Date:   Thu, 21 Jan 2021 16:29:57 +0100
Message-Id: <20210121152959.1725404-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
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
index fdb8a0d127ad..734e2e614fd2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -442,6 +442,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	/*
 	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
@@ -468,6 +469,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
-- 
2.30.0

