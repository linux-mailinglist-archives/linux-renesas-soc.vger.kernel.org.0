Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8AB46A1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 22:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbfFNUg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 16:36:56 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39488 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfFNUg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 16:36:56 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so5242458edv.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2019 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZnZIGyd1ihO1nLfm2kHYBUDq0QLZnlqf87UlfFfYuA=;
        b=kzZDdnxGoG4YaTE/yWsfd1f965HNGM9GX0WqC7/ybtqTyBFTNmd1srGb3BqL/n7d81
         L3PhsxAuqdhniFBg/1xCADlT17vif/Y3ZR018eGdHfsp4HoGkJvraSYs7d2JPbFQqM80
         0gTKHruNH/EmQ8ezzVcS7eVnmCvq5UtM2ukE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZnZIGyd1ihO1nLfm2kHYBUDq0QLZnlqf87UlfFfYuA=;
        b=is9/VuAYAA6+0GF2EJmLUJ0cnFVa8OppIpdLoKqtRm1mnCCt03jk2gWnRFD3reg/vy
         oodly33RUW4WIWCQb9xEeaTk1dXxDYmItyK3rn+A2A1Z6sYJ7UHvwFt5i8DWGcyYd2Pm
         N5NAe7NN7hEstRIszU+obrJLQd6BGKL+pUuhnKl8/5xegfL+3CepyGWIjfa6pHbW2Mi0
         2JA809vN/ggHeMo41xN7YLbsbZGp8hR5LxwILUl5oDl/FX4AhD6oFgAk375Bxp9HvC8V
         gmuzKlppoQsdic+KdQof7S18br7muDHllq01CqmtmfjkgDMD6aobbKxegx1y7F/DY+Hk
         J7Mw==
X-Gm-Message-State: APjAAAWGzeHaXuzsnx7ZxF1kfBX14RUw/4dOK7JovQWQlfddVvYC4GTz
        pqWy3KoPA1X8oLGVfYhrZbMcdQ==
X-Google-Smtp-Source: APXvYqzo7c4YiPdXTA1nMAho/q+VBz1pYUv8KpGFQpxV23HAOoQaukZtx6FVAfVwxPqMc+arUrfA5Q==
X-Received: by 2002:a50:a5ec:: with SMTP id b41mr75365674edc.52.1560544614283;
        Fri, 14 Jun 2019 13:36:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:36:53 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 28/59] drm/shmob: Drop drm_gem_prime_export/import
Date:   Fri, 14 Jun 2019 22:35:44 +0200
Message-Id: <20190614203615.12639-29-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

They're the default.

Aside: Would be really nice to switch the others over to
drm_gem_object_funcs.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 9047a49ff35e..6c106b7a3bfe 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -133,8 +133,6 @@ static struct drm_driver shmob_drm_driver = {
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_import	= drm_gem_prime_import,
-	.gem_prime_export	= drm_gem_prime_export,
 	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
 	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
-- 
2.20.1

