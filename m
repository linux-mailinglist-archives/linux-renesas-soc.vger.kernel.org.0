Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF974498F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239435AbhKHQFg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239433AbhKHQFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:05:35 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE4CC061570
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Nov 2021 08:02:50 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d5so27772117wrc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Nov 2021 08:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=StolZF6As2JqwmKdnDrgpcrLCxn6sqYLr+z2iBrARUI=;
        b=Lzg9V3LwIO6BW8VHcKU+IXsxZw+mqxMRO8eTgcCvVyuyje9NQIxapwWKYGP/M4xCZF
         GREtinyfPzfLTOUUtax0pHMFGNyCzH2hCskcTj+opo7BlL0tIhCAeeTV5RVhprFdEgex
         1DWghRYQvBqRtSDqcuzsP1K1/gUAg5ObWOlZH0EITR417zkrAdfSrOgEzkbFYu2urK+G
         i5Z7jCNIIPPrVN29yG9MEFmuVrZOC9MnMhDMncPe/fzW4vcVkQ6drEcBX8psisbzr1T5
         B3ZJVHvUX6FUVRU3w2Dm4zaJyNpj3fxVH9Tv2t/fJj8caqlLqY3p59hgzO1lyIBjHBle
         bgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=StolZF6As2JqwmKdnDrgpcrLCxn6sqYLr+z2iBrARUI=;
        b=4/hrbqP5hlC6FMEK/3a/CgZwSIMEv6qYvoxNcDBCbt91XoRB8X6J26sR+k/PDNqC0b
         TL7D+2UrO+U/kT5jKJChM8mHJm//NQnMlcLJ1DVGyBsRUvhn7GFKYqW4AKow0RkiD034
         vZxcsEW6oVLWSWf4WGXhoF6acU5JgNcHnzi0QbGvbYBLVwkSG9hqEbnYlOjzG+FHBA+2
         H/haCHLiOMcTa6pN8lTh9PONsYoXEPZJMRY0u9nMp3P8ASM1L4yHFWTddOf88YLsWI18
         LuLj1XRTrSV6IgRmyYEoPHRBpC7B+W6+5Mi54NO6cVY7a3ZgseOPdPKfmjSJ0YTDMSso
         Cvmg==
X-Gm-Message-State: AOAM530tpQnxyVXBnrtm9lIAHyU9uE33A2ZqdUeJ04jl7Cm5H5749iVM
        nx+ZpFcBZRGeqEFi+zXXgFMyNQ==
X-Google-Smtp-Source: ABdhPJy7LHQJ5T1HTh4q+oz4n3P6YUYylIxM0wTwWI8oE1itpbmEYXg7r9t0vXP4WQV9v/IJe4xjKA==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr206664wrn.287.1636387369594;
        Mon, 08 Nov 2021 08:02:49 -0800 (PST)
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
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/4] media: videobuf2: Add a transfer error event
Date:   Mon,  8 Nov 2021 17:02:18 +0100
Message-Id: <20211108160220.767586-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a new V4L2_EVENT_XFER_ERROR event to signal if a unrecoverable error
happens during video transfer.

The use-case that sparked this new event is to signal to the video
device driver that an error has happen on the CSI-2 bus from the CSI-2
receiver subdevice.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/userspace-api/media/v4l/vidioc-dqevent.rst     | 5 +++++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
 include/uapi/linux/videodev2.h                               | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 6eb40073c906deba..84984641c9351aa9 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -182,6 +182,11 @@ call.
 	the regions changes. This event has a struct
 	:c:type:`v4l2_event_motion_det`
 	associated with it.
+    * - ``V4L2_EVENT_XFER_ERROR``
+      - 7
+      - This event is triggered when an transfer error is detected while
+        streaming. For example if a unrecoverable error is detected on a video
+        bus in the pipeline.
     * - ``V4L2_EVENT_PRIVATE_START``
       - 0x08000000
       - Base event number for driver-private events.
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index eb0b1cd37abd9381..7ed9884b879c888e 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -498,6 +498,7 @@ replace define V4L2_EVENT_CTRL event-type
 replace define V4L2_EVENT_FRAME_SYNC event-type
 replace define V4L2_EVENT_SOURCE_CHANGE event-type
 replace define V4L2_EVENT_MOTION_DET event-type
+replace define V4L2_EVENT_XFER_ERROR event-type
 replace define V4L2_EVENT_PRIVATE_START event-type
 
 replace define V4L2_EVENT_CTRL_CH_VALUE ctrl-changes-flags
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f118fe7a9f58d240..48d4738eb862418b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2373,6 +2373,7 @@ struct v4l2_streamparm {
 #define V4L2_EVENT_FRAME_SYNC			4
 #define V4L2_EVENT_SOURCE_CHANGE		5
 #define V4L2_EVENT_MOTION_DET			6
+#define V4L2_EVENT_XFER_ERROR			7
 #define V4L2_EVENT_PRIVATE_START		0x08000000
 
 /* Payload for V4L2_EVENT_VSYNC */
-- 
2.33.1

