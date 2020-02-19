Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FE316417E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 11:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgBSKWT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 05:22:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45807 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgBSKWS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 05:22:18 -0500
Received: by mail-wr1-f65.google.com with SMTP id g3so27482379wrs.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 02:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Bml+TgDz4wJQmY4Y0AO2RIjQQM/6g6ZVi6uO1lLgNg=;
        b=ir3v3wajtlCr4ILbn3QkFY7+TQrLgFx5ZRWnKzIRCOzBcBy0cWrnSuvsyR7UMSzfNo
         WPyiyRY5rHw3+mA5WrhwF0SB3GFy8c38ZVz9qVfe3bIB6ir1dk//KmkDAjMJGJ79MmiU
         UnymP+61UPdw9TisDpey+V6p+jNzbxRVfP4P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Bml+TgDz4wJQmY4Y0AO2RIjQQM/6g6ZVi6uO1lLgNg=;
        b=DlYKzyk7GoHc+Thckx2HJobDGNX1QiCxaqkWA3m5X3EH1I6sLc1oUMw8hflMYnObsw
         VH7adihByD7BdSm4X2/YfY3JwXGfd+L97NGsPlT1RdMd4vcyZwYRpatLUOxntu/L2X/C
         ZcgD5Jcj4Pgy6F3sJ9Oh0OBsqFiVABOQv9bQfQnY8bDctwYVYRbC2yRhReJvtNC4IDSQ
         wn1ah0Zx9Q47Iwxq5zaFB5istCz/0tRSu71fqwlfeteDLIdNqul9zuXkEAR1Ou5vq4YY
         Qoz/iZ/P4+grE9Wnmz/9xcaZuXiEs8pwFWBTYOJN3A1nSvGty5EyALnM82rYzhj98LSS
         DuJQ==
X-Gm-Message-State: APjAAAX5gbdEtY9Ui4dUlzx68HRQoqaykc5Jqe6YTypVB+wHF4oQNdfw
        n5Fh6bQHCfSMVYLzhBq0P19baw==
X-Google-Smtp-Source: APXvYqyFLn/iv1hus4X3HQJntx7j4Ea6eI8toIqgHSqju1nZFaJhtuHG7/Wo/6j5JXhJDOzdm+HWfg==
X-Received: by 2002:adf:eec3:: with SMTP id a3mr33086987wrp.337.1582107735503;
        Wed, 19 Feb 2020 02:22:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:22:14 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
Date:   Wed, 19 Feb 2020 11:21:07 +0100
Message-Id: <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It's right above the drm_dev_put().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 654e2dd08146..3e67cf70f040 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -530,7 +530,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 	drm_dev_unregister(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
-	drm_mode_config_cleanup(ddev);
 
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fcfd916227d1..dcdc1580b511 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -712,7 +712,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	unsigned int i;
 	int ret;
 
-	drm_mode_config_init(dev);
+	ret = drm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-- 
2.24.1

