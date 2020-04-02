Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B3819C8F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 20:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389103AbgDBSnU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 14:43:20 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57577 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387866AbgDBSnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 14:43:19 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mt6wz-1j5AWS3U5p-00tVjG for <linux-renesas-soc@vger.kernel.org>; Thu, 02
 Apr 2020 20:43:17 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 962B5650A8B
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VhlYTESaXgnC for <linux-renesas-soc@vger.kernel.org>;
        Thu,  2 Apr 2020 20:43:17 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 3A1D164D593
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 20:43:17 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:43:17 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 768EB804FE; Thu,  2 Apr 2020 20:34:03 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:03 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v5 2/9] media: adv748x: include everything adv748x.h needs
 into the file
Message-ID: <046f909122e03286faf0a8916f30d56259656e14.1585852001.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:4snloNHITPD/ZfEol7FNceZfFL1O+RMDRsKqfGfnxnz8co6fJB6
 RVmqr5mLh3CnVwGFzphVBl4k1ClZh7Ot0Hj6pqi2C4JN48b9PL1sz4/O2Iddllw1ItRX6mj
 D1pQn6KyVOoCiBkInXuj0Gjuym74XluRCt2b/T9tNvKfVvOnsx7suiusFq6GX8cok/ug8ON
 LEzE+AtttGLNNWOVhfDLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PTQF1WLndsQ=:R9d+tZ8m+l97py+LAqAhwJ
 7Z8Mi1grTr0EbV3oQGa/wqYT8MjTLn7qH+EdqDgaRei5psw+se6cnAuW+EEzhX7D70gjNuyU1
 8LRKJfMOU2gQwU7onTJTWxQolrbG7GhrXUZ4EEuRjXflBUoP7lJV0Gyp5hLePSiWHfKks+4wR
 f0LS20WRga1u9o9obWY31MnAdZrseBBO/hyoynFUu2aQ0LLs6IqLsA0gWdoxHzgi4rNLUacRV
 u4H9d66hdkQIYQa+XByHMsyJsrK4Ce8HbyAGbtF8+PlrimDWU27oAPBeEIypuRjYDfnChQUOQ
 exsPFkP5E2Zmm8LzA88/E1kIRsSAZxsYfNek32d7hDe/gsFB/uIxILOBZybLjy6429OmMQUWn
 DAT8lS85hxTv9mtAuvT97gMRvmAPhj+lWLnN8uSqM3v14FsAfdAO4kbYL42ij4DC9zSCBUaPc
 qatDma4de2Xa4lTab7+xpb+BWwJ116H32mEh/NAw/a7U29p308n41Z7d7VHD8HIFJYkneFC3F
 jbV0lklCvSJ07/9Qi/q+JgOMwZXswAqNhyRJkVk63GXGCCs0csRnH83ExbJcI/X1kYbGezN7n
 yDwKK3J+9tdKtRcWqm0Yy6QRfSbnFdNPBTLTN0FpKA9KDDCgSAAqvRXrwNBsvSwxdbCmtSXZo
 G0CdXmKmyCSbGY9SXnVcV5FN2q0P57WA7FemjavXsBInA5QCkQBpF44gF9J9cqr+HGODckM3d
 OhIDqsB4AmQ4Fnbimg3Pp1Kp/bzsrDRvew4KVonhvH4rJiuvWx05nMK8gRnI7LYPMUP2mk7xA
 Kq1uHtT0ZoszdeTz84R1zXwqQB2X2kxaV+5agZSQiqaXTbRDavy+2eZvJXoNAbtRiBYvEwV
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To follow the established practice of not depending on others to
pull everything in. While at it, make sure it stays like this.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-afe.c  | 6 ++----
 drivers/media/i2c/adv748x/adv748x-core.c | 6 ++----
 drivers/media/i2c/adv748x/adv748x-csi2.c | 6 ++----
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 6 ++----
 drivers/media/i2c/adv748x/adv748x.h      | 2 ++
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index dbbb1e4d6363..5a25d1fbe25f 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -6,18 +6,16 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  */
 
+#include "adv748x.h"
+
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/v4l2-dv-timings.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-ioctl.h>
 
-#include "adv748x.h"
-
 /* -----------------------------------------------------------------------------
  * SDP
  */
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index c3fb113cef62..5c59aad319d1 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -10,6 +10,8 @@
  *	Kieran Bingham <kieran.bingham@ideasonboard.com>
  */
 
+#include "adv748x.h"
+
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -20,14 +22,10 @@
 #include <linux/slab.h>
 #include <linux/v4l2-dv-timings.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 
-#include "adv748x.h"
-
 /* -----------------------------------------------------------------------------
  * Register manipulation
  */
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index c43ce5d78723..c00d4f347d95 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -5,15 +5,13 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  */
 
+#include "adv748x.h"
+
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 
-#include "adv748x.h"
-
 static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
 					    unsigned int vc)
 {
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index c557f8fdf11a..f598acec3b5c 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -5,18 +5,16 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  */
 
+#include "adv748x.h"
+
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-ioctl.h>
 
 #include <uapi/linux/v4l2-dv-timings.h>
 
-#include "adv748x.h"
-
 /* -----------------------------------------------------------------------------
  * HDMI and CP
  */
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index fccb388ce179..09aab4138c3f 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -19,6 +19,8 @@
  */
 
 #include <linux/i2c.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
 
 #ifndef _ADV748X_H_
 #define _ADV748X_H_
-- 
2.25.1.25.g9ecbe7eb18


