Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2702A3DC26A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 03:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhGaBkU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 21:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbhGaBkT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 21:40:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87689C06175F;
        Fri, 30 Jul 2021 18:40:14 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02763E81;
        Sat, 31 Jul 2021 03:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695611;
        bh=AYL6GFoeD+crZns3tBIIFsN+kRzv0ihNWl3ak38Yu9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pH/ZGh/kcA87XNIttHFobtNJq/2Ex41Mc8y+gPszSqxQcXIOI8b+QMeZe4qK2VBTd
         NrvfrkPbpjSYig1YzS7cjCswIfik6JWE9T0rUHcX4ghF2cS/MDovW99DS2CFLZnXuN
         zITWx36NXvtoc+0vG0VWsJ4zMC1reymVjUvfHLXw=
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
Subject: [PATCH v2 3/9] drm/sti: Use correct printk format specifiers for size_t
Date:   Sat, 31 Jul 2021 04:39:48 +0300
Message-Id: <20210731013954.11926-4-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index d09b08995b12..3c61ba8b43e0 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -927,12 +927,12 @@ static void sti_hqvdp_start_xp70(struct sti_hqvdp *hqvdp)
 
 	header = (struct fw_header *)firmware->data;
 	if (firmware->size < sizeof(*header)) {
-		DRM_ERROR("Invalid firmware size (%d)\n", firmware->size);
+		DRM_ERROR("Invalid firmware size (%zu)\n", firmware->size);
 		goto out;
 	}
 	if ((sizeof(*header) + header->rd_size + header->wr_size +
 		header->pmem_size + header->dmem_size) != firmware->size) {
-		DRM_ERROR("Invalid fmw structure (%d+%d+%d+%d+%d != %d)\n",
+		DRM_ERROR("Invalid fmw structure (%zu+%d+%d+%d+%d != %zu)\n",
 			  sizeof(*header), header->rd_size, header->wr_size,
 			  header->pmem_size, header->dmem_size,
 			  firmware->size);
-- 
Regards,

Laurent Pinchart

