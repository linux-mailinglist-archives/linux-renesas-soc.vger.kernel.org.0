Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8131A4BAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 23:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDJVzG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 17:55:06 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:38638 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726646AbgDJVzG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 17:55:06 -0400
X-Halon-ID: df3ec7cc-7b75-11ea-b7d8-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id df3ec7cc-7b75-11ea-b7d8-005056917a89;
        Fri, 10 Apr 2020 23:54:49 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC] rcar-vin: Add mbus_code filtering for format enumeration
Date:   Fri, 10 Apr 2020 23:54:12 +0200
Message-Id: <20200410215412.1110161-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support to filter which pixel formats are supported by a mbus_code
provided from user-space.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)
---
Hi Laurent,

I intend to squash this patch with the rcar-vin patch in the 
V4L2_CAP_IO_MC series. As I hope we can merged that series soon so
I wanted to get early feedback if possible on my take on ENUM_FMT.

// Niklas

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 96ddd36619167fd5..8c8866a8ee8dccfd 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -343,6 +343,29 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 	unsigned int i;
 	int matched;
 
+	/*
+	 * If mbus_code is set only enumerate supported pixel formats for that
+	 * bus code. Converting from YCbCr to RGB and RGB to YCbCr is possible
+	 * with VIN, so all supported YCbCr and RBB media bus codes can produce
+	 * all of the related pixel formats. If mbus_code is not set enumerate
+	 * all possible pixelformats.
+	 *
+	 * TODO: Once raw capture formats are added to the driver this needs
+	 * to be extended so raw media bus codes only result in a raw pixel
+	 * formats.
+	 */
+	switch (f->mbus_code) {
+	case 0:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY10_2X10:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	matched = -1;
 	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++) {
 		if (rvin_format_from_pixel(vin, rvin_formats[i].fourcc))
-- 
2.26.0

