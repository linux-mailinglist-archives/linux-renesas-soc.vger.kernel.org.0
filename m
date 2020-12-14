Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF2A2DA20B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 21:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503422AbgLNUxN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 15:53:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502972AbgLNUxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 15:53:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8F4C061793
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 12:52:22 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B94F75B0;
        Mon, 14 Dec 2020 21:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607979139;
        bh=ujCcvKlCpMqXC8K7Q3mgZMbr2E0FMgilxJpQEi2J9hE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vyiHBhjg8++K/OqC/D6F9AsjFP/YMeAF7SD7KtkN18uiH9Fq5TUST5flIVEcPY0TC
         PCUzHd+q3rr1p/VhIT7ZVCoU9pmNKubuLMChm3gvhurQn//0Nldz1JWiNN0xqz9LR1
         54CTDBxbx08EUHb84sz414xvy36IBCnl1ql8n18k=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 3/9] drm: rcar-du: Drop unneeded encoder cleanup in error path
Date:   Mon, 14 Dec 2020 22:52:02 +0200
Message-Id: <20201214205208.10248-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The encoder->name field can never be non-null in the error path, as that
can only be possible after a successful call to
drm_simple_encoder_init(). Drop the cleanup.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 50fc14534fa4..e4bac47caf16 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -123,11 +123,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
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

