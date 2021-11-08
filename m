Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4C04498FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239433AbhKHQFh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239413AbhKHQFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:05:36 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E40AC061764
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Nov 2021 08:02:51 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id b12so27766058wrh.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Nov 2021 08:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qyp9SrPyLgYIMuwT9MuDBXOOdH5XssHnAfufE4fLJtg=;
        b=teDNng7JJhTgR6g//mAv6tFTA1F2vNBlEujo2RboVanS1aqq2v4MkPHC6ALJXenAMz
         rB9Vp8uLnztnLunjD05H6IQFuoXn7aUYpacPx8js0xETcPHHZcnkkykzYn0h/k3K6nzA
         T2wb046BpRLZD/WIFzKgqFIMPO323ntLKIMTt07jg6blQDWy2UHE4RCLsY2xu5hoICHg
         0gFLKLgWHnI2Cw4X1F78xs16J0tPkIKjqjFY4Yow5pK5z2qPe4IqIEmXNtQc0tODCIUN
         PQOsSFAYJVUUBiWA6kugzTNlLR2XkNu2amwTQQmu1OoAGgkSgK7ryS1FxAQsqE6rMPkV
         VaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qyp9SrPyLgYIMuwT9MuDBXOOdH5XssHnAfufE4fLJtg=;
        b=ie/Y9TwBnT+5EaA5iiF3ks3pGdLmUOxE5H7OxG60z8WbpUuUTmgiSoIpOIt6s8HIP3
         dzhpFsZs2y4L0yF2mbmrBqzcbyCyiJkjST1i0YVHLAc4i9iZP/88pRJ0rn55XyoQeKf5
         64nM/Kff/xgSEjy7JBLuQVsBLdK+vVG4gA/DKUe6MEfYFufWGGNnzQEbfz3e0tvH2aDO
         PLcm5+4fezmUNg1mCWsfbgBhb7Pss7ryc+LwXPMpSLUKlVTxcGQiOlPgmbqgLQ3Zr8kS
         iQr6Zkuh0xQimK6ENdt/8Tqv0+4uSEzpkLG1kUUSyNc79evciWF4FEEkAb61frW/F+A3
         y5rw==
X-Gm-Message-State: AOAM530d9UfELFKOJrDv8bsDstKqsXnOJaIcaYW6Q0N+tOSvocCoOfpX
        bMHKoFJsj/phYoJihi9tKC5qsg==
X-Google-Smtp-Source: ABdhPJzgV6DxAZiDjIs+PPHKUUwVqT+TIl1sbEIpjk8sXV0LxUM75hu0sHADPa+HtDYeSpyeSGQgvg==
X-Received: by 2002:a05:6000:1b8f:: with SMTP id r15mr246622wru.27.1636387370197;
        Mon, 08 Nov 2021 08:02:50 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id d16sm12703176wmb.37.2021.11.08.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:02:49 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer error
Date:   Mon,  8 Nov 2021 17:02:19 +0100
Message-Id: <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When a subdevice signals a transfer error stop the VIN in addition to
informing user-space of the event.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changes since v3
- Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
- Call vb2_queue_error() when encountering the event.

* Changes since v2
- Log using vin_dbg() instead of v4l2_info().
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
 static void rvin_notify_video_device(struct rvin_dev *vin,
 				     unsigned int notification, void *arg)
 {
+	const struct v4l2_event *event;
+
 	switch (notification) {
 	case V4L2_DEVICE_NOTIFY_EVENT:
-		v4l2_event_queue(&vin->vdev, arg);
+		event = arg;
+
+		switch (event->type) {
+		case V4L2_EVENT_XFER_ERROR:
+			vin_dbg(vin,
+				"Subdevice signaled transfer error, stopping.\n");
+			rvin_stop_streaming(vin);
+			vb2_queue_error(&vin->queue);
+			break;
+		default:
+			break;
+		}
+
+		v4l2_event_queue(&vin->vdev, event);
 		break;
 	default:
 		break;
-- 
2.33.1

