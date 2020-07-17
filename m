Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662A3223EA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 16:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgGQOuU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 10:50:20 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:40817 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgGQOuU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 10:50:20 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6A4EB24001A;
        Fri, 17 Jul 2020 14:50:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 05/10] media: v4l2-subdev: Remove [s|g]_mbus_config video ops
Date:   Fri, 17 Jul 2020 16:53:19 +0200
Message-Id: <20200717145324.292820-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
References: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With all sensor and platform drivers now converted to use the new
get_mbus_config and set_mbus_config pad operations, remove the
deprecated video operations g_mbus_config and s_mbus_config.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 57226e13ef91..546df7aef333 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -402,12 +402,6 @@ struct v4l2_mbus_frame_desc {
  *
  * @query_dv_timings: callback for VIDIOC_QUERY_DV_TIMINGS() ioctl handler code.
  *
- * @g_mbus_config: get supported mediabus configurations
- *
- * @s_mbus_config: set a certain mediabus configuration. This operation is added
- *	for compatibility with soc-camera drivers and should not be used by new
- *	software.
- *
  * @s_rx_buffer: set a host allocated memory buffer for the subdev. The subdev
  *	can adjust @size to a lower value and must not write more data to the
  *	buffer starting at @data than the original value of @size.
@@ -435,10 +429,6 @@ struct v4l2_subdev_video_ops {
 			struct v4l2_dv_timings *timings);
 	int (*query_dv_timings)(struct v4l2_subdev *sd,
 			struct v4l2_dv_timings *timings);
-	int (*g_mbus_config)(struct v4l2_subdev *sd,
-			     struct v4l2_mbus_config *cfg);
-	int (*s_mbus_config)(struct v4l2_subdev *sd,
-			     const struct v4l2_mbus_config *cfg);
 	int (*s_rx_buffer)(struct v4l2_subdev *sd, void *buf,
 			   unsigned int *size);
 };
-- 
2.27.0

