Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7792DB7FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 01:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgLPAvz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 19:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgLPAvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 19:51:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440B4C0613D6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Dec 2020 16:51:14 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24BBBBBE;
        Wed, 16 Dec 2020 01:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608079832;
        bh=7qhbhjQahaK9N+tXjfFkjKUsFUKQOo1QWnXmw+ag19U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kCb5MfBu8KsUCJ8SNxHjMGqLV6E8YtIpNwGNTURK7i/tCERJm8bBack8in/KWA0DL
         UqG/9bnRHCtyYBcm2Zf+jR3V9XQdbzC9LRNDCDGv5IiT5hQb1onA0VUy5chHIeEjNX
         w1bH20Rcgmvvdiw5BC7fBPw9P43WForB5GjC1Hw0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 3/4] drm: rcar-du: dw-hdmi: Set output port number
Date:   Wed, 16 Dec 2020 02:50:20 +0200
Message-Id: <20201216005021.19518-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Report the DT output port number in dw_hdmi_plat_data to connect to the
next bridge in the dw-hdmi driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 7b8ec8310699..18ed14911b98 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -75,6 +75,7 @@ static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
 }
 
 static const struct dw_hdmi_plat_data rcar_dw_hdmi_plat_data = {
+	.output_port = 1,
 	.mode_valid = rcar_hdmi_mode_valid,
 	.configure_phy	= rcar_hdmi_phy_configure,
 };
-- 
Regards,

Laurent Pinchart

