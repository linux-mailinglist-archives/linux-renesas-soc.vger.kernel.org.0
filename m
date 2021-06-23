Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5013B1270
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFWDuB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:50:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFWDuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:50:01 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E74375FA6;
        Wed, 23 Jun 2021 05:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420061;
        bh=VWbaPXeunQapg+T1nOyAt8m2XuXqrMn7CdqvrrqPYBk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=plXYTLltEL7xZPvfol5UC+9xfXWen4lqPqfvQA+TLazvbQHeKNaKZdeqWMNTwyKN3
         ri9httw3l5EM6uSsTYy8j+SP9mj4TKNqyzJXR0AMAg98lyZsI3f1WqSoBHqa/SHLvH
         K3Hxw8LxyOK9PMrwIU59orbu8pXpeo+7bIBiWiCM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 15/15] drm: rcar-du: dsi: Include the DSI header
Date:   Wed, 23 Jun 2021 06:46:56 +0300
Message-Id: <20210623034656.10316-16-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The rcar_mipi_dsi.h header declares the interface for the CRTC component
to use.

The lack of inclusion of the header causes a compiler warning.

Include the header correctly at the beginning of the component to ensure
consistency.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 381b5bc9bce1..f708bcf5984c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2020 Renesas Electronics Corporation
  */
 
+#include "rcar_mipi_dsi.h"
+
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-- 
Regards,

Laurent Pinchart

