Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9A285FC54
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2019 19:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfGDRQW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jul 2019 13:16:22 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:64695 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727374AbfGDRQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jul 2019 13:16:22 -0400
X-Halon-ID: 6acd8e76-9e7f-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 6acd8e76-9e7f-11e9-8ab4-005056917a89;
        Thu, 04 Jul 2019 19:16:19 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 0/4] rcar-vin: Add support for RGB formats with alpha component
Date:   Thu,  4 Jul 2019 19:15:58 +0200
Message-Id: <20190704171602.29541-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This small series adds support for two new pixel formats for the
rcar-vin driver; V4L2_PIX_FMT_ARGB555 and V4L2_PIX_FMT_ABGR32. Both
formats have an alpha component so a new standard control is also added
to control its value, V4L2_CID_ALPHA_COMPONENT.

The series is based on the latest media-tree and is tested on both
Renesas Gen2 and Gen3 hardware without any regressions found.

Patch 1/4 fixes a badly named register name, 2/4 adds the new control
while 3/4 adds the two new pixel formats. Patch 4/4 is a clean up now
that Gen2 and Gen3 always have controls and v4l2_ctrl_handler_setup()
should be called for both cases.

* Changes since v3
- Fixed up commit message.
- Collected review tags.

* Changes since v2
- Protect the writing of the alpha value when streaming with the spin
  lock to make sure the streaming state is stable.
- Add patch 4/4 to call v4l2_ctrl_handler_setup() for the media
  controller centric Gen3 mode of the driver.

Niklas Söderlund (4):
  rcar-vin: Rename VNDMR_DTMD_ARGB1555 to VNDMR_DTMD_ARGB
  rcar-vin: Add control for alpha component
  rcar-vin: Add support for RGB formats with alpha component
  rcar-vin: Always setup controls when opening video device

 drivers/media/platform/rcar-vin/rcar-core.c | 53 ++++++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-dma.c  | 44 ++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 38 +++++++++------
 drivers/media/platform/rcar-vin/rcar-vin.h  |  5 ++
 4 files changed, 121 insertions(+), 19 deletions(-)

-- 
2.21.0

