Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A8A1ABE1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504903AbgDPKiu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:38:50 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52045 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505113AbgDPKiU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:20 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C2A2160002;
        Thu, 16 Apr 2020 10:37:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 00/20] GMSL: max9286-v8-rc1 + RDAMC20-v8
Date:   Thu, 16 Apr 2020 12:40:32 +0200
Message-Id: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Kieran,
   please fine here a slight rework of your fixup series to be applied
on top of max9286-v7.

The main changes are:
- overlap window: write registers 0x63 and 0x64 directly. Going through the
                  function breaks RDACM21 operations. To be investigated.
- pixel rate control: Make mandatory for remotes to report pixel rate, and
		     use it calculate max9286 one.
- rebase on latest media-master

On top of that I have added v8 of RDACM20.
The changes compared to v7 are considerable, and reported in the single
patch change log. I have 30+ fixup patches on top of rdacm20-v7 that could
be singularly reviewed, but not to flood the list I squashed them in in
this version. As detailed in the patch change log the changes are available
singularly in a repository in my git tree.

I have tested this version on Salvator-X with 4 RDACM20.

Ideally, there could be a bit more cleanup to do in the max9286 probe routines
as suggested in the review of your series, but I left it out not to take away
all the fun from you :p

After a sanity check, I would propose to squash everything in and move
to linux-media to have this hopefully collected!

Thanks
  j

Jacopo Mondi (5):
  squash!: max9286: Rebase on latest media/master
  squash! max9286: Calculate pixel rate
  squash! max9286: Put of node on error
  dt-bindings: media: i2c: Add bindings for IMI RDACM2x
  media: i2c: Add RDACM20 driver

Kieran Bingham (15):
  media: i2c: Add MAX9286 driver
  fixup! media: i2c: Add MAX9286 driver
  squash! max9286: Update the bound_sources mask on unbind
  squash! max9286: convert probe kzalloc
  squash! max9286: Fix cleanup path from GPIO powerdown
  squash! max9286: cleanup GPIO device registration fail path
  squash! max9286: Convert to use devm_regulator_get()
  squash! max9286: Fit max9286_parse_dt print on one line
  squash! max9286: Move multi-device workarounds out of upstream
  squash! max9286: Remove I2C mod-table
  sqaush! max9286: Lock format changes
  squash! max9286: Implement Pixelrate control
  squash! max9286: Disable overlap window
  sqaush! max9286: Describe pad index usage
  sqaush! max9286: Remove poc_enabled workaround

 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  161 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   22 +
 drivers/media/i2c/Kconfig                     |   25 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/max9271.c                   |  330 ++++
 drivers/media/i2c/max9271.h                   |  224 +++
 drivers/media/i2c/max9286.c                   | 1349 +++++++++++++++++
 drivers/media/i2c/rdacm20.c                   |  668 ++++++++
 9 files changed, 2784 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h
 create mode 100644 drivers/media/i2c/max9286.c
 create mode 100644 drivers/media/i2c/rdacm20.c

--
2.26.0

