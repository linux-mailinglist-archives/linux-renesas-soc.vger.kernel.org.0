Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7790922253F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 16:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgGPOX7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 10:23:59 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43885 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbgGPOX7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 10:23:59 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DA4FA1BF203;
        Thu, 16 Jul 2020 14:23:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 00/10] v4l2-subdev: Introduce [g|s]et_mbus_format pad op
Date:   Thu, 16 Jul 2020 16:27:03 +0200
Message-Id: <20200716142713.110655-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Minor update to add a new patch [6/10] to v4l2-mediabus.h with a usage
note on the V4L2_MBUS_* flags.

Also add Niklas' tag to [10/10] and address his final comment there.

Hans, this should now be ready to be hopefully collected.

Thanks
  j

v6.1->v7
- Add [6/10] as suggested by Hans
- Add Niklas tag and fix his last comment in [10/10]

v6->v6.1
- Address Niklas' comments in the last patch for rcar-csi2

v5->v6:
- Report V4L2_MBUS_DATA_ACTIVE_HIGH in ov6650 get_mbus_config
- Check for the return value of get_mbus_config() at the end of
  set_mbus_config() in ov6650 driver

v4->v5:
- Address Sakari's comment on documentation (s/should/shall)
- Use a local variable for the number of active lanes in 9/9
- Add Kieran's tags to 7/9 and 8/9
- Fix a warning on operator precedence on 3/9

v3->v4:
- Remove g/s_mbus_config video operation
- Adjust pxa quick capture interface to properly handle bus mastering
- Reword the two new operations documentation

v2->v3:
- Re-use v4l2_mbus_config and V4L2_MBUS_* flags
- Port existing drivers
- Update adv748x and rcar-csi2 patches to use V4L2_MBUS_* flags

v1->v2:
- Address Sakari's comment to use unsigned int in place of bools
- Add two new patches to address documentation
- Adjust rcar-csi2 patch as much as possible according to Niklas comments
- Add Niklas's tags

Jacopo Mondi (10):
  media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
  media: i2c: Use the new get_mbus_config pad op
  media: i2c: ov6650: Use new [get|set]_mbus_config ops
  media: pxa_camera: Use the new set_mbus_config op
  media: v4l2-subdev: Remove [s|g]_mbus_config video ops
  media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
  staging: media: imx: Update TODO entry
  media: i2c: adv748x: Adjust TXA data lanes number
  media: i2c: adv748x: Implement get_mbus_config
  media: rcar-csi2: Negotiate data lanes number

 drivers/media/i2c/adv7180.c                 |   7 +-
 drivers/media/i2c/adv748x/adv748x-core.c    |  31 +++-
 drivers/media/i2c/adv748x/adv748x-csi2.c    |  31 ++++
 drivers/media/i2c/adv748x/adv748x.h         |   1 +
 drivers/media/i2c/ml86v7667.c               |   7 +-
 drivers/media/i2c/mt9m001.c                 |   7 +-
 drivers/media/i2c/mt9m111.c                 |   7 +-
 drivers/media/i2c/ov6650.c                  |  56 ++++--
 drivers/media/i2c/ov9640.c                  |   7 +-
 drivers/media/i2c/tc358743.c                |   7 +-
 drivers/media/i2c/tvp5150.c                 |   7 +-
 drivers/media/platform/pxa_camera.c         | 189 ++++++--------------
 drivers/media/platform/rcar-vin/rcar-csi2.c |  75 +++++++-
 drivers/staging/media/imx/TODO              |   4 +
 include/media/v4l2-mediabus.h               |  33 +++-
 include/media/v4l2-subdev.h                 |  37 ++--
 16 files changed, 301 insertions(+), 205 deletions(-)

--
2.27.0

