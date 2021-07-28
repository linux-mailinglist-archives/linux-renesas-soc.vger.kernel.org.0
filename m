Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F883D9225
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 17:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236993AbhG1Phw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 11:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhG1Phv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 11:37:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BE4C061757;
        Wed, 28 Jul 2021 08:37:50 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E43644FB;
        Wed, 28 Jul 2021 17:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627486668;
        bh=7Q7V+jsv3j0J2Ca8fqxRrHdhfNI0Nw4sUBrOglR+KR0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LMw58EBTxjsgP/i5vJg/z7T48NOAM+djEzgfuaoKx+kdqwMlbp25pKJvYGAPUSP+p
         +XPESJp4/vGiLxwYFPLFDNYbguXaoHF31gAMJ4sW1OzkwP+evxk28PZIXQCWTyFlsF
         K1eZI7B6G831IBkGvnmyBA1g3JnNpzR3v7sFrtnc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
Subject: [PATCH 2/7] drm/sti: Use correct printk format specifiers for size_t
Date:   Wed, 28 Jul 2021 18:37:31 +0300
Message-Id: <20210728153736.15240-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The correct format specifier for size_t is %zu. Using %d (or %u)
generates a warning on 64-bit platforms. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

