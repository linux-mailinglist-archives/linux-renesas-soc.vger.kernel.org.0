Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECBF4697FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 15:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245495AbhLFOKZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 09:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245601AbhLFOKD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 09:10:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033F2C0698C7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Dec 2021 06:06:33 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83B03EE;
        Mon,  6 Dec 2021 15:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638799592;
        bh=cZT2SBcfWH0H0gI7gi7bgjX7Ar0Y5zrYq0N68SgLME8=;
        h=From:To:Cc:Subject:Date:From;
        b=pIhN4x65j62Y3DCzuHNzJXySpKufkTv/xX5q1xyQ391uJ/j8CVc1bymWXkunKbSKm
         LuCD6kOQaL+WySyem5Yc1ETQbhh4BAL/fXTx6u0kwrEr+xN4paaXhwOKL7aDxs9Lqy
         PbGIaXhfJBDX5NtTcz1/JylM2qWWoZeult/+I1RY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm: rcar-du: dsi: Fix hsfreq range matching
Date:   Mon,  6 Dec 2021 16:06:01 +0200
Message-Id: <20211206140601.18912-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When iterating over hsfreqrange_table, rcar_mipi_dsi_parameters_calc()
may dereference the sentinel table entry. Fix the loop condition to
break as soon as a suitable entry is found, defined by the lower bound
of the frequency range stored in the table being equal to or higher than
the target frequency.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
I will squash this with "drm: rcar-du: Add R-Car DSI driver", but I'm
posting it separately to ease review.
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index faf993eae564..891bb956fd61 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -219,9 +219,8 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 	/* Find hsfreqrange */
 	hsfreq = fout_target * 2;
 	for (i = 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
-		if (hsfreq > hsfreqrange_table[i][0] &&
-			hsfreq <= hsfreqrange_table[i+1][0]) {
-			setup_info->hsfreqrange = hsfreqrange_table[i+1][1];
+		if (hsfreqrange_table[i][0] >= hsfreq) {
+			setup_info->hsfreqrange = hsfreqrange_table[i][1];
 			break;
 		}
 	}

base-commit: c18c8891111bb5e014e144716044991112f16833
prerequisite-patch-id: dc9121a1b85ea05bf3eae2b0ac2168d47101ee87
prerequisite-patch-id: 6754b2ec4caec03e235550004003fe63c1cc793b
prerequisite-patch-id: d69c605df34d40934fa5d4e00f23d5785105099d
prerequisite-patch-id: 7d9edfb4758cafe8aec92d32709c0ad25a50942c
prerequisite-patch-id: 86c526fb41f9f9cbe95c50ba8a140e20484f187f
prerequisite-patch-id: a9649b53b55858f023b8d3d29afb9be7ad39ea3b
-- 
Regards,

Laurent Pinchart

