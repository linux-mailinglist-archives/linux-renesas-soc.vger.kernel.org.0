Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932743DC261
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 03:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbhGaBkR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 21:40:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33220 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhGaBkQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 21:40:16 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14722BC0;
        Sat, 31 Jul 2021 03:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695609;
        bh=mK1sC34SkdfPesSr/ljz81ambUX1M83KGmYChMaWyRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pufoELx8ZCqFJsB9hE7XnbQxOidC0Aa4nNfmB2zZil7kvynm4ZtF9JjCKSvdRrkw9
         ZZhKDjQFDEzUwkLT2QoNTeeA92VOuai+7rUThdxXV9LvkmWy/9ZCi2iMEltruzyWCz
         f6S49U3EyJSxaSajFK6Sq5kg9xlC9ZD8gBWDTrio=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomba@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 1/9] drm/omap: Use correct printk format specifiers for size_t
Date:   Sat, 31 Jul 2021 04:39:46 +0300
Message-Id: <20210731013954.11926-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The correct format specifier for size_t is %zu. Using %d (or %u)
generates a warning on 64-bit platforms. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 5f1722b040f4..503b5d4bf2c2 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2094,7 +2094,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
 	u8 b1, b2, b3, b4;
 
 	if (dsi->debug_write)
-		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
+		DSSDBG("dsi_vc_send_long, %zu bytes\n", msg->tx_len);
 
 	/* len + header */
 	if (dsi->vc[vc].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
@@ -2390,7 +2390,7 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
 
 	return 0;
 err:
-	DSSERR("%s(vc %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
+	DSSERR("%s(vc %d, reqlen %zu) failed\n", __func__,  vc, msg->tx_len);
 	return r;
 }
 
-- 
Regards,

Laurent Pinchart

