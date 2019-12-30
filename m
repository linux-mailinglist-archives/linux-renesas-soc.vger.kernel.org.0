Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA1B12D027
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Dec 2019 14:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfL3NGR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Dec 2019 08:06:17 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:43982 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfL3NGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Dec 2019 08:06:17 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id kD6C2100g5USYZQ06D6CbD; Mon, 30 Dec 2019 14:06:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilukO-0001EE-Og; Mon, 30 Dec 2019 14:06:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilukO-000852-Lb; Mon, 30 Dec 2019 14:06:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/mipi_dbi: Fix off-by-one bugs in mipi_dbi_blank()
Date:   Mon, 30 Dec 2019 14:06:04 +0100
Message-Id: <20191230130604.31006-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When configuring the frame memory window, the last column and row
numbers are written to the column resp. page address registers.  These
numbers are thus one less than the actual window width resp. height.

While this is handled correctly in mipi_dbi_fb_dirty() since commit
03ceb1c8dfd1e293 ("drm/tinydrm: Fix setting of the column/page end
addresses."), it is not in mipi_dbi_blank().  The latter still forgets
to subtract one when calculating the most significant bytes of the
column and row numbers, thus programming wrong values when the display
width or height is a multiple of 256.

Fixes: 02dd95fe31693626 ("drm/tinydrm: Add MIPI DBI support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e34058c721becd6b..16bff1be4b8ac622 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -367,9 +367,9 @@ static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
 	memset(dbidev->tx_buf, 0, len);
 
 	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS, 0, 0,
-			 (width >> 8) & 0xFF, (width - 1) & 0xFF);
+			 ((width - 1) >> 8) & 0xFF, (width - 1) & 0xFF);
 	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS, 0, 0,
-			 (height >> 8) & 0xFF, (height - 1) & 0xFF);
+			 ((height - 1) >> 8) & 0xFF, (height - 1) & 0xFF);
 	mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_START,
 			     (u8 *)dbidev->tx_buf, len);
 
-- 
2.17.1

