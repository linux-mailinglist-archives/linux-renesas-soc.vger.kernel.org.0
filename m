Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBECE3AE370
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 08:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhFUGrP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 02:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhFUGrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 02:47:04 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C93C06124C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 23:44:49 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id t32so1510942pfg.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 23:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MByV6cpfz5xYL+DMP3l1hiWnj/Gzo6aYK3LpWdzWngw=;
        b=b29mzE46OF31Q0CDVIkCAi2dK/16TmoZc6FE32WuI0K0eE59eopnCwAo/XS+aCT4GD
         vB678ZVcP9xoXMVTsUk/OR0Mp4ts1fhMvmiktvVyUyAQTpBttVz8JcQwp4b1Tdconwgw
         8zZWW7a9Xn2iGmAREWcAEk1GMReMXDFhOUGuG5ciepZCDjsZIk+ArbLPLDhRJy9/mGdh
         zW0hRFKpx3RbUO24fU/jL3PEyRpQhlckS0HPgcphPygMzI+PY49rzRGCrpTxkecJs8q2
         zy/GFkZ04RTUajYooN0PEQZQKFt5xsLgIJa5cBfu8VOd3Gdtpi0WXSeUA6RDAdJVgT63
         yZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MByV6cpfz5xYL+DMP3l1hiWnj/Gzo6aYK3LpWdzWngw=;
        b=NfV22FUgnAzBbrRCJrUUfq3gEiF3mpZrSvxDR70V6r0IxKmLs0ykpZsJgvOS0ZhDDV
         cR+B4UStf6lnrT6Kco9AwqeQj67i5L/MPYjB/239sqf8smfo/TOKAXo36eWc0mixZubD
         6pYHepDN0SikAMP4SsmTDdJad+XbaS1C2tmsUrz7Hw2VZOGb4TE2NJVfuIPuiyeV6/II
         1CUp3Wo02HCO2T3Qxi+eKv0qANpDqflpSe0xRRbwa2zhUbnLLpDo7C9dsKHFm5asvU6l
         hCX5N4NXOSgQu/TUcPxP8jv18AAjWdKJjTo8Qt8U8ZRc4o6ohI6L6wxax5P5tXCDceUC
         5ErA==
X-Gm-Message-State: AOAM530OAkxOZ/gg96hN+BkdG6LzCzMIxFvmK+EYlQIoIouB8UwFqKgi
        ZQec4/ZHzp5rqIzbo9Qg56F8mQ==
X-Google-Smtp-Source: ABdhPJwH4/eLR8eUZGuKN8dGXC6akwtVCwhZ4Ipv8+e+H+PA4zXKM/he9uNlz8M414i8BGg/A2nyGQ==
X-Received: by 2002:a63:ed08:: with SMTP id d8mr22298931pgi.373.1624257888998;
        Sun, 20 Jun 2021 23:44:48 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
        by smtp.gmail.com with ESMTPSA id o34sm12744450pgm.6.2021.06.20.23.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 23:44:48 -0700 (PDT)
From:   Tomohito Esaki <etom@igel.co.jp>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Tomohito Esaki <etom@igel.co.jp>
Subject: [PATH 4/4] doc-rst: Add virtual DRM documentation
Date:   Mon, 21 Jun 2021 15:44:03 +0900
Message-Id: <20210621064403.26663-5-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621064403.26663-1-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 Documentation/gpu/drivers.rst |  1 +
 Documentation/gpu/vdrm.rst    | 51 +++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/gpu/vdrm.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b4a0ed3ca961..bad0226de972 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -19,6 +19,7 @@ GPU Driver Documentation
    xen-front
    afbc
    komeda-kms
+   vdrm
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/vdrm.rst b/Documentation/gpu/vdrm.rst
new file mode 100644
index 000000000000..2ab1699c2f42
--- /dev/null
+++ b/Documentation/gpu/vdrm.rst
@@ -0,0 +1,51 @@
+=============================
+ drm/vdrm virtual DRM driver
+=============================
+
+Virtual DRM splits the overlay planes of a display controller into multiple
+virtual devices to allow each plane to be accessed by each process.
+
+This makes it possible to overlay images output from multiple processes on a
+display. For example, one process displays the camera image without compositor
+while another process overlays the UI.
+
+The virtual DRM creates standalone virtual device and make DRM planes from a
+master device (e.g. card0) accessible via one or more virtual device. However,
+these plane are no longer accessible from the original device.
+Each virtual device (and plane) can be accessed via a separate device file.
+
+The virtual DRM driver doesn't directly control the display hardware and has
+no access to the physical bus. Instead, the virtual DRM driver issues requests
+to the standard DRM device driver ("master" driver) when the hardware needs to
+be controlled. The master driver is modified to notify the virtual DRM driver
+of interrupt events from the display hardware.
+
+Plane position and size
+=======================
+The initial position, size and z-position of the plane used in virtual DRM is
+specified in the device tree. The position and size of the planes are set as
+properties and can be updated. The name of each property is as
+follows:
+* vdrm_offset_x: x-coordinate of the left-top of the plane on the screen
+* vdrm_offset_y: y-coordinate of the left-top of the plane on the screen
+* vdrm_width: width of the plane
+* vdrm_height: height of the plane
+
+Virtual DRM Functions Reference
+===============================
+
+.. kernel-doc:: drivers/gpu/drm/vdrm/vdrm_api.h
+    :internal:
+
+.. kernel-doc:: drivers/gpu/drm/vdrm/vdrm_drv.c
+    :export:
+
+Driver limitations
+==================
+1. Each virtual DRM device only supports one plane per CRTC.
+
+2. Virtual DRM doesn't support hot plug connector.
+
+3. If virtual DRM has multiple CRTCs, the initial position and size of the
+   virtual DRM planes is the same for all planes, since they cannot be set
+   for each plane in the device tree.
-- 
2.25.1

