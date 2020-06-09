Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FCF1F3B07
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgFIMqj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729578AbgFIMqf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:35 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FA7631F;
        Tue,  9 Jun 2020 14:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706793;
        bh=m/oYp7me1NruD0GAf/abMULsiM+tiK5uhnzcpuktL+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MrjGAS0t6AF2+NkuMA8jJzexW9whsEhCW26zQuvRhW6eQ2/1Xaxsc3rXA7yqta95x
         cRvsheZNPNrfJj909v36JqRU6FoYJmOCp8OAD8J5AUWAtYlhWlygdzAoJXH1HuSTlp
         hBwC3qJHYwJzXxD7r5LAN37UQ9wXwjDbyGYuFcj4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jiri Kosina <trivial@kernel.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 08/17] drivers: gpu: drm: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:46:01 +0100
Message-Id: <20200609124610.3445662-9-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 include/drm/drm_dp_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 19c99dddcb99..8f1b329df16d 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1365,7 +1365,7 @@ EXPORT_SYMBOL(drm_dp_get_edid_quirks);
 /**
  * drm_dp_read_desc - read sink/branch descriptor from DPCD
  * @aux: DisplayPort AUX channel
- * @desc: Device decriptor to fill from DPCD
+ * @desc: Device descriptor to fill from DPCD
  * @is_branch: true for branch devices, false for sink devices
  *
  * Read DPCD 0x400 (sink) or 0x500 (branch) into @desc. Also debug log the
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 2035ac44afde..1165ec105638 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1701,7 +1701,7 @@ enum drm_dp_quirk {
 
 /**
  * drm_dp_has_quirk() - does the DP device have a specific quirk
- * @desc: Device decriptor filled by drm_dp_read_desc()
+ * @desc: Device descriptor filled by drm_dp_read_desc()
  * @edid_quirks: Optional quirk bitmask filled by drm_dp_get_edid_quirks()
  * @quirk: Quirk to query for
  *
-- 
2.25.1

