Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD9E8D58E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 02:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbfJNAIK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Oct 2019 20:08:10 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:63190 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbfJNAIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Oct 2019 20:08:09 -0400
X-Halon-ID: adf85926-ee16-11e9-903a-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id adf85926-ee16-11e9-903a-005056917f90;
        Mon, 14 Oct 2019 02:08:03 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] rcar-vin: Do not enumerate unsupported pixel formats
Date:   Mon, 14 Oct 2019 02:07:50 +0200
Message-Id: <20191014000750.2863254-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If a pixel format is not supported by the hardware NULL is returned by
rvin_format_from_pixel() for that fourcc. Verify that the pixel format
is supported using this or skip it when enumerating.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 9a9b89c0dc0b3be4..13b7cd5d2e40415a 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -296,12 +296,22 @@ static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
 static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 				 struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rvin_formats))
-		return -EINVAL;
-
-	f->pixelformat = rvin_formats[f->index].fourcc;
+	struct rvin_dev *vin = video_drvdata(file);
+	unsigned int i;
+	int matched;
+
+	matched = -1;
+	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++) {
+		if (rvin_format_from_pixel(vin, rvin_formats[i].fourcc))
+			matched++;
+
+		if (matched == f->index) {
+			f->pixelformat = rvin_formats[i].fourcc;
+			return 0;
+		}
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int rvin_g_selection(struct file *file, void *fh,
-- 
2.23.0

