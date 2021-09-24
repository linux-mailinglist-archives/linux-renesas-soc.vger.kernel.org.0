Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C25416E1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 10:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244772AbhIXImy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 04:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244765AbhIXImx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 04:42:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8BEC061756
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 01:41:20 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u18so36219819lfd.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFI9bps7IbHfOO0gIV+McFr6/uVR+ZVUtcTIA3+eNAM=;
        b=dq/Wlwkc0dMahTBqxcrNSXunslpLRvvzHamp+OQlGeeME8FijiNEYkaYD239izFRA+
         zcJP/TJ5axFZltdu1fuOsT/Tg84uLBXUSxV2B56Qtf3nucPp7KRFY+LBVqvogCbF1cR1
         D6/6n2GpOEVsQMedM2I9VXW3EjN9x29blZF5BYZtyd/HNFXJnZ/9kogm0zXVDj4jrT5R
         MUWtlF4U4129BshHc0NWhgV/4oEzQB0kTkuiYHRpB4PMIF9QJKTczJIGodw9gcYNyARC
         fAgUIVJamUyG58tBIRqK2GAwatsVsX/PCZ1VjeWtc+maClw0ISUZ1tmSS5DuBsACtofc
         yBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFI9bps7IbHfOO0gIV+McFr6/uVR+ZVUtcTIA3+eNAM=;
        b=xi+fv8I0kZO+LkG3qjZQORv9naj1ZmdwSb18UyU9VdIhlzh85by5RlxCbnUgijeR36
         deho/26j6Q8fYxa7bJcbj3AF+BRsjMDb4d+kebNcs4WOK+I50TblXWkm0S3LVEvy5sO6
         okVgJM2fFtLuhM2xLX1dKDg5UA7RUBV3UYqvRFwIO2kA3LWy4S7CGuJ+5YoeUBQBm4Ht
         /1kRouCg9nk+RaSR/wv/I92vpwUrCY4WsJDoHblXgp8CkEraIJCwigUB6gB13y44fjaY
         HB7/8llU38X/ERFo1dAfXsrVlFPorbo+6fzxixvl9sPjDvIGkvlYN3EZWuWxCDahRdUb
         0r0Q==
X-Gm-Message-State: AOAM530krxUWRcmhruhCJDn5gD2izYoItTmg3dZLB7/p4xlXw+IIT5JA
        o5WgejYBO+Y92BcLuJ0qyoz9uA==
X-Google-Smtp-Source: ABdhPJzuk9BiBh8IoJ/j6d5vF7hrgBcyQ7091sVzx+wEf2caJmgpeMd3viH6xWbGnr53Yr3RomiuYA==
X-Received: by 2002:a2e:956:: with SMTP id 83mr10101010ljj.183.1632472879142;
        Fri, 24 Sep 2021 01:41:19 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id d4sm859026ljl.98.2021.09.24.01.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 01:41:18 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] media: rcar-vin: add G/S_PARM ioctls
Date:   Fri, 24 Sep 2021 11:41:15 +0300
Message-Id: <20210924084115.2340-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

This adds g/s_parm ioctls for parallel interface.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index bdeff51bf768..de9f8dd55a30 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -527,6 +527,24 @@ static int rvin_s_selection(struct file *file, void *fh,
 	return 0;
 }
 
+static int rvin_g_parm(struct file *file, void *priv,
+		       struct v4l2_streamparm *parm)
+{
+	struct rvin_dev *vin = video_drvdata(file);
+	struct v4l2_subdev *sd = vin_to_source(vin);
+
+	return v4l2_g_parm_cap(video_devdata(file), sd, parm);
+}
+
+static int rvin_s_parm(struct file *file, void *priv,
+		       struct v4l2_streamparm *parm)
+{
+	struct rvin_dev *vin = video_drvdata(file);
+	struct v4l2_subdev *sd = vin_to_source(vin);
+
+	return v4l2_s_parm_cap(video_devdata(file), sd, parm);
+}
+
 static int rvin_g_pixelaspect(struct file *file, void *priv,
 			      int type, struct v4l2_fract *f)
 {
@@ -743,6 +761,9 @@ static const struct v4l2_ioctl_ops rvin_ioctl_ops = {
 	.vidioc_g_selection		= rvin_g_selection,
 	.vidioc_s_selection		= rvin_s_selection,
 
+	.vidioc_g_parm			= rvin_g_parm,
+	.vidioc_s_parm			= rvin_s_parm,
+
 	.vidioc_g_pixelaspect		= rvin_g_pixelaspect,
 
 	.vidioc_enum_input		= rvin_enum_input,
-- 
2.30.2

