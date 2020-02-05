Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4438815285F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2020 10:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgBEJcc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Feb 2020 04:32:32 -0500
Received: from mga04.intel.com ([192.55.52.120]:47885 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728034AbgBEJcb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Feb 2020 04:32:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 01:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; 
   d="scan'208";a="224591382"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 05 Feb 2020 01:32:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 81BEC17C; Wed,  5 Feb 2020 11:32:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] drm: shmobile: Reduce include dependencies
Date:   Wed,  5 Feb 2020 11:32:26 +0200
Message-Id: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This file doesn't need everything provided by <linux/kernel.h>.
All it needs are some types, which are provided by <linux/types.h>.

Note, <drm/drm_mode.h> already includes <linux/types.h>, but
not relying on implicit includes is indeed a good thing.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: Update commit message (Geert, Laurent)
 include/linux/platform_data/shmob_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
index fe815d7d9f58..08605fdb2226 100644
--- a/include/linux/platform_data/shmob_drm.h
+++ b/include/linux/platform_data/shmob_drm.h
@@ -10,7 +10,7 @@
 #ifndef __SHMOB_DRM_H__
 #define __SHMOB_DRM_H__
 
-#include <linux/kernel.h>
+#include <linux/types.h>
 
 #include <drm/drm_mode.h>
 
-- 
2.24.1

