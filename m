Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3412959FABF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 15:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237810AbiHXNA5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 09:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237973AbiHXNAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 09:00:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B50F97B23
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 06:00:53 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 458924A8;
        Wed, 24 Aug 2022 15:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661346051;
        bh=TZTLKT1X06XXta7ywfGo9pLibQ9+6k6tgSFdKbj6Mcg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gzegaz1a7UNVoNlGsaDh89PahgognU+VxfcXeO6pvEY+ozuCrfYYrnWseCYzLkOH8
         3Oi4gQNUcCMDbY/h6P76CP3c7GYsf3LicAyNBRdzTEq/2lu48i1KZLNd+b2st5XtEV
         1Q5jy/ssBkxb+HzvNjR1Tze625hzIiRwuKpwCVmA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v5 1/4] drm/bridge: ti-sn65dsi86: check AUX errors better
Date:   Wed, 24 Aug 2022 16:00:31 +0300
Message-Id: <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The driver does not check AUX_IRQ_STATUS_NAT_I2C_FAIL bit at all when
sending AUX transfers, which leads to the driver not returning an error.

Add the check.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 90bbabde1595..ba84215c1511 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -582,6 +582,11 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 		goto exit;
 	}
 
+	if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
+		ret = -EIO;
+		goto exit;
+	}
+
 	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
 		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
 		if (ret)
-- 
2.34.1

