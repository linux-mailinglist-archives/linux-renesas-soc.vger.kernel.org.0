Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2185C2CF68C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 23:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729972AbgLDWDK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 17:03:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729490AbgLDWDK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 17:03:10 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F907FD8;
        Fri,  4 Dec 2020 23:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607119306;
        bh=+uOFXfjOaWvtsFQMWqqNF/iEBBOc5nMtwer/V3B36lM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q5DgGSnoLGn/G+63L4hFOCJ3aem7fLG2dHfW00dnBMR7JTmkQAFRoCQTPTRXQDC9d
         l2t35kgw+YQec8cNPpYm5sm+zKdb5X9yN6g/NAL6Z1eaJVLEhDd+eEriKiDhg9ve74
         ObaiAGAmNWK33PTCRbRNHTlMvEMZLP5G+NzII6QM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/9] drm: rcar-du: Drop unneeded encoder cleanup in error path
Date:   Sat,  5 Dec 2020 00:01:33 +0200
Message-Id: <20201204220139.15272-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The encoder->name field can never be non-null in the error path, as that
can only be possible after a successful call to
drm_simple_encoder_init(). Drop the cleanup.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 2d40da98144b..0edce24f2053 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -124,11 +124,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	}
 
 done:
-	if (ret < 0) {
-		if (encoder->name)
-			encoder->funcs->destroy(encoder);
+	if (ret < 0)
 		devm_kfree(rcdu->dev, renc);
-	}
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

