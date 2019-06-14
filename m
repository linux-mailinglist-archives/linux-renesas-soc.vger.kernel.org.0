Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4535A46A19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 22:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfFNUgx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 16:36:53 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40326 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfFNUgx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 16:36:53 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so5228056eds.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2019 13:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kl11cqZLKNVIoCSLq1T4z6E1blt5ws6QSMJdYDP8rFo=;
        b=NBcJIjf80TmUrTBIegjVHoFUGOlF/D8hw4ZE1QzyfrNv4QUQSHJXcT4JgHdO5xcZro
         NLzWWX32r13XWQAzC0XG7bq3Doc8Gs8gxkA6cqi5kAygbpTfDsLdrgao0gyQZssMLAkH
         WiMM4BtCJgsTlpwioTUr4Eke+8mBw8PO6WHZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kl11cqZLKNVIoCSLq1T4z6E1blt5ws6QSMJdYDP8rFo=;
        b=jK1JKz99CU9H8ojR3JuFEzTgGx9gW1HdRnWpZA1P5W7G/NTZ/G0L8WRBd+b9ZkPFaS
         3TOXhMRUGKpWcM7iYY6S7uLuH+RrMZRJ3MiCo1DtQ9BDqs75wtwZOsGjEvSGnqCWtKtR
         PKUG+XJtk8E+7473Ch50gYUk0RRlYtnD4UX1KEkIe/jIWrXWNNyDhd63gJ/4EDOvtJrO
         vwMg3kXLy9M8JeDgKjx3DrplJ/Y6ePgkXc3UVF8TG+imouEeBtTGsVtzYqH3uHEI1M4w
         AHJ0DCrMCPJmBY0iCVt4er4rOFh37Geg59WM/lkRDVh5Ribet676/GuT7Ld95iWc00p4
         eYYg==
X-Gm-Message-State: APjAAAVgbp/p5g8WTV7jzowdpfB2CaZEjmkYPfSQRoOb5shBAlQw4BNt
        1RIJbArWRQkEx1JD2SUJ/U56ww==
X-Google-Smtp-Source: APXvYqyJW7ZRxZMoGehzMOedZE2lv3ftKEGPQee9wy7+mZct/Ovqo2OEcePWE2F8tImwMp8lBLHMKg==
X-Received: by 2002:a50:9947:: with SMTP id l7mr42157954edb.305.1560544612213;
        Fri, 14 Jun 2019 13:36:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:36:51 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 26/59] drm/rcar-du: Drop drm_gem_prime_export/import
Date:   Fri, 14 Jun 2019 22:35:42 +0200
Message-Id: <20190614203615.12639-27-daniel.vetter@ffwll.ch>
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
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 83685250319d..9c93eb4fad8b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -446,8 +446,6 @@ static struct drm_driver rcar_du_driver = {
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

