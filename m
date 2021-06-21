Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF983AE32A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 08:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhFUGbr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 02:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhFUGbp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 02:31:45 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69725C061756
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 23:29:31 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id m2so13316644pgk.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 23:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=joRwT0q9NaqfpgsKIsE3xhVvDKPswfCw3wuGCcbWU2U=;
        b=oO4+NEa7uCveb6pA1vB1tapg9Nc9Gohnks3tl90Ha5Gb2poOGoVmMLjFK+QALZMfnj
         0qA807ILIHnQt2K70J0DOVZRObs+plL0B/UgmCeFxtk+b/7fVk27gL5t359qMsjIT80H
         TEIqx1mTZpYGqe7jrHDD00+9uUS3qy38Bi/djH0KJcmQ5F1CKQLrDBUvEZnPs9GObLMI
         dUDavRlrV7H2muuL6FaeNUl4MRo5q12NU+eiQxP2cRrO82v/eDHTok7AzfFfI31bd4S2
         pJ3v/r0a3h4AiVlEHBoiwFTcidRcXQeXbvp9K3BLbB5a4IJmZG3cOLwi5yUiFjTMBFVE
         Y18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=joRwT0q9NaqfpgsKIsE3xhVvDKPswfCw3wuGCcbWU2U=;
        b=CqfA9LbHVTqswL0gE097mJXtx11ERxVHyooSEGv1QxVVl8poldlzRmwYYdm2trX408
         ZPdJDdYu3aHXRQ+uaWUqXTgcvD8FslLRn9MlivAaXmRqf7fnVc7e/B/MUWr0grm2VszS
         sICVGBDeM/ljOOC5H747Qp5EOXhtPT8XmD+Q4GLymdeVwcy93OYnzayB0vc6WJ/fh4fX
         Ytfmq9JMCSd3mKj18Y44IlxgGNV3ovn7qW8AqH3/bi8p5T3VAskrs9TvKROpF8j3lwuN
         a8sOq2GVi7IRAelGNyyt02W8yqKLUkO3b+LmMAuBZTmK47EDvp1QBjNFiud3XVEijfxp
         hQSw==
X-Gm-Message-State: AOAM531+97Fhs7244DrX8SYYK8h4ScOHVPI/r6ZctFSLfvA/DWwo2kVG
        gg/Q/vIDjlFfJ0sbax74HXAHuA==
X-Google-Smtp-Source: ABdhPJxqN3aYleZ+K19phKa2Swh5uRmE7K7oupOwouOyZpn9sDK4DrLqmVdFg3wJv+07R55WJ5zn6Q==
X-Received: by 2002:a63:d06:: with SMTP id c6mr9256885pgl.121.1624256970905;
        Sun, 20 Jun 2021 23:29:30 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
        by smtp.gmail.com with ESMTPSA id j19sm15266018pgm.44.2021.06.20.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 23:29:30 -0700 (PDT)
From:   Tomohito Esaki <etom@igel.co.jp>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devlel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        Tomohito Esaki <etom@igel.co.jp>
Subject: [PATH 0/4] [RFC] Support virtual DRM
Date:   Mon, 21 Jun 2021 15:27:38 +0900
Message-Id: <20210621062742.26073-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Virtual DRM splits the overlay planes of a display controller into multiple
virtual devices to allow each plane to be accessed by each process.

This makes it possible to overlay images output from multiple processes on a
display. For example, one process displays the camera image without compositor
while another process overlays the UI.

Virtual DRM driver doesn’t directly control the display hardware and has no
access to the physical bus. Instead, the virtual DRM driver issues requests to
the standard DRM device driver (parent) when the hardware needs to be
controlled. The parent is modified to notify the virtual DRM driver of
interruptevents from the display hardware. Therefore, in order to use virtual
DRM, each DRM device driver needs to add code to support virutal DRM.

The only driver supported in this patch series is rcar-du. This patch series
is divided into multiple. The first patch adds vDRM feature to DRM, and the
second patch support vDRM for the rcar-du driver. The other patches add
documentation.

In particular, I would appreciate your advice on the following points:
* virtual DRM generalization
  I've only tested with rcar-du, is there anything I should consider to make
  virtual DRM work with other drivers?

* Integration to upstream
  I think it is a good idea to add virtual DRM to the DRM core functionality,
  but I would appreciate any suggestions on what needs to be improved for
  integration to upstream.

* dumb_create and fb_create callback
  I think that the dumb_create and fb_create callbacks need to be done by the
  parent, and it is preferable to use the parent's callbacks as they are.
  However, since the dumb buffer needs to be registered in the parent and
  the fb handle needs to be registered in the drm_file of the vDRM, the
  dumb_create callbacks from the parent driver cannot be used as is.
  Therefore, the current implementation of the dumb_create callback is
  workarround.
  What do you think is the best way to deal with this issue?


Tomohito Esaki (4):
  Add Virtual DRM device driver
  rcar-du: Add support virtual DRM device
  dt-bindings: display: Add virtual DRM
  doc-rst: Add virtual DRM documentation

 .../devicetree/bindings/display/vdrm.yaml     |  67 ++
 Documentation/gpu/drivers.rst                 |   1 +
 Documentation/gpu/vdrm.rst                    |  51 ++
 drivers/gpu/drm/Kconfig                       |   7 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/rcar-du/Kconfig               |   4 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  42 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c        | 191 ++++
 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h        |  67 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  22 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |   1 +
 drivers/gpu/drm/vdrm/vdrm_api.h               |  68 ++
 drivers/gpu/drm/vdrm/vdrm_drv.c               | 859 ++++++++++++++++++
 drivers/gpu/drm/vdrm/vdrm_drv.h               |  80 ++
 18 files changed, 1491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml
 create mode 100644 Documentation/gpu/vdrm.rst
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h
 create mode 100644 drivers/gpu/drm/vdrm/vdrm_api.h
 create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.c
 create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.h

-- 
2.25.1

