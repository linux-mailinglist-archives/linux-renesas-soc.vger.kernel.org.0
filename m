Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D53D23D553
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgHFCSb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgHFCSb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1811C061575
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2020 19:18:30 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0148750E;
        Thu,  6 Aug 2020 04:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680303;
        bh=3UAp4hYzcI5CX7ZOkSfNhuLQEl6hcG4xp2FsuTJffLU=;
        h=From:To:Cc:Subject:Date:From;
        b=Vr4eqPcJDa9d4EOwLs2wzAbcUMJ5eyzTxdl+WilLVNWwcHA+Uf/yzxKRlEG75q04x
         h+/8W/oS6cWoY9z+1oXXsrEnvVeluHL3PPcLijnyHuGxjMbuW+iFK6Mi/KbqClf3mu
         Zi0n8PioijzHz4VZTR1glnJsMwyzkOay7BqbNFhs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/8] kmsxx: Various fixes and improvements
Date:   Thu,  6 Aug 2020 05:17:58 +0300
Message-Id: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

This patch series fixes a few issues in kmsxx, mainly related to support
for additional pixel formats.

Patch 1/8 is a small API extension proposal to expose the card device
minor number, and patch 2/8 is a typo fix in a method name.

The remaining patches add support for additional RGB and YUV formats,
fixing a few issues in the dumb frame buffer class for fully planar
buffers (patches 3/8 and 4/8), and adding support for the new formats in
patches 5/8 to 8/8.

All the new formats have been tested on a Renesas R-Car Gen3 device,
which supports

- PixelFormat.RGB332
- PixelFormat.ARGB4444
- PixelFormat.XRGB4444
- PixelFormat.ARGB1555
- PixelFormat.XRGB1555
- PixelFormat.RGB565
- PixelFormat.BGR888
- PixelFormat.RGB888
- PixelFormat.BGRA8888
- PixelFormat.BGRX8888
- PixelFormat.ARGB8888
- PixelFormat.XRGB8888
- PixelFormat.UYVY
- PixelFormat.YUYV
- PixelFormat.YVYU
- PixelFormat.NV12
- PixelFormat.NV21
- PixelFormat.NV16
- PixelFormat.NV61
- PixelFormat.YUV420
- PixelFormat.YVU420
- PixelFormat.YUV422
- PixelFormat.YVU422
- PixelFormat.YUV444
- PixelFormat.YVU444

Laurent Pinchart (8):
  card: Add a method to retrieve the device minor
  card: Rename has_has_universal_planes to has_universal_planes
  dumbfb: Add support tri- or quadri-planar buffers
  dumbfb: Fix pitch for tri-planar formats
  pykmsbase: Add missing pixel formats
  kms++: Add support for semiplanar YUV422 formats (NV16 and NV61)
  kms++: Add support for the planar YUV formats
  kms++: Add support for missing 8 -and 16-bit RGB formats

 kms++/inc/kms++/card.h              |   5 +-
 kms++/inc/kms++/pixelformats.h      |  14 ++
 kms++/src/card.cpp                  |  11 ++
 kms++/src/dumbframebuffer.cpp       |  23 ++-
 kms++/src/pixelformats.cpp          |  18 +-
 kms++/src/plane.cpp                 |   2 +-
 kms++util/inc/kms++util/color.h     |   1 +
 kms++util/inc/kms++util/kms++util.h |   1 +
 kms++util/src/color.cpp             |   5 +
 kms++util/src/drawing.cpp           | 279 +++++++++++++++++++++++++---
 kms++util/src/testpat.cpp           |  16 +-
 py/pykms/pykmsbase.cpp              |  33 ++++
 utils/kmsprint.cpp                  |   4 +-
 13 files changed, 370 insertions(+), 42 deletions(-)

-- 
Regards,

Laurent Pinchart

