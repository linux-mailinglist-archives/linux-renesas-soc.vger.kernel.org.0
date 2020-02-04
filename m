Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB66151E1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 17:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgBDQTU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 11:19:20 -0500
Received: from mga14.intel.com ([192.55.52.115]:22675 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727308AbgBDQTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 11:19:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 08:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="429859862"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 04 Feb 2020 08:19:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 327F017C; Tue,  4 Feb 2020 18:19:16 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
Date:   Tue,  4 Feb 2020 18:19:16 +0200
Message-Id: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace with appropriate types.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

