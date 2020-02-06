Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E9C1542BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 12:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbgBFLMg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 06:12:36 -0500
Received: from mga01.intel.com ([192.55.52.88]:8628 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727585AbgBFLMg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 06:12:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Feb 2020 03:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,409,1574150400"; 
   d="scan'208";a="430473269"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2020 03:12:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7BB01101; Thu,  6 Feb 2020 13:12:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3] drm: shmobile: Reduce include dependencies
Date:   Thu,  6 Feb 2020 13:12:32 +0200
Message-Id: <20200206111232.75309-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This file doesn't need everything provided by <linux/kernel.h>.
All it needs are some types, which are provided by <drm/drm_mode.h>.

Drop unneeded <linux/kernel.h> completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: Drop header completely (Laurent)
 include/linux/platform_data/shmob_drm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
index fe815d7d9f58..d661399b217d 100644
--- a/include/linux/platform_data/shmob_drm.h
+++ b/include/linux/platform_data/shmob_drm.h
@@ -10,8 +10,6 @@
 #ifndef __SHMOB_DRM_H__
 #define __SHMOB_DRM_H__
 
-#include <linux/kernel.h>
-
 #include <drm/drm_mode.h>
 
 enum shmob_drm_clk_source {
-- 
2.24.1

