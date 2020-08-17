Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD24024604C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Aug 2020 10:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgHQIeR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Aug 2020 04:34:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:47154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgHQIeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Aug 2020 04:34:16 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597653255;
        bh=HTdRP5Rd80kaEvWBWA+k3fjSQk4u9M6tSs7ftrtfXhw=;
        h=Subject:From:Date:To:From;
        b=PkD4/L3QHnnAi7Hkwy3s3/v3KSVJi5S8cKLsoekDzn8BQWquxx8UddMwbJKJH558Y
         CakAwMKMQ6YrbENwQa7tv+9nz2PA1JkXz3qeq7ia/Jao4LitwLTxq5BpTup8Jg+AK3
         Og2xtwChgW5HE4b+cNFCW/uIdnxVwf0uMxuH3M08=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159765325590.1012.1701508236822570738.git-patchwork-summary@kernel.org>
Date:   Mon, 17 Aug 2020 08:34:15 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: mmc: sh_mmcif: Use "kHz" for kilohertz
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=304833
  Link: <20200618080321.16678-1-geert+renesas@glider.be>

Patch: [v3] PCI: rcar: Fix runtime PM imbalance on error
  Submitter: Dinghao Liu <dinghao.liu@zju.edu.cn>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=315405
  Link: <20200709064356.8800-1-dinghao.liu@zju.edu.cn>

Patch: [v2] media: vsp1: dl: Fix NULL pointer dereference on unbind
  Submitter: Eugeniu Rosca <erosca@de.adit-jv.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=297331
  Link: <20200602195016.803-1-erosca@de.adit-jv.com>

Series: media: v4l2-async: Accept endpoints and devices for fwnode matching
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=310949
  Link: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
    Patches: [v4,1/4] device property: Add a function to test is a fwnode is a graph endpoint
             [v4,2/4] media: v4l2-async: Accept endpoints and devices for fwnode matching
             [v4,3/4] media: v4l2-async: Pass notifier pointer to match functions
             [v4,4/4] media: v4l2-async: Log message in case of heterogeneous fwnode match

Series: gpio: aggregator: Misc parsing improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=311169
  Link: <20200701114212.8520-1-geert+renesas@glider.be>
    Patches: [v2,1/2] gpio: aggregator: Drop pre-initialization in get_arg()
             [v2,2/2] gpio: aggregator: Use bitmap_parselist() for parsing GPIO offsets

Patch: i2c: core: do not use logical device when creating irq domain
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=311035
  Link: <20200701082318.11174-1-wsa+renesas@sang-engineering.com>

Patch: lib: update DEBUG_SHIRQ docs to match reality
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=301817
  Link: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>

Patch: [v2] thermal: rcar_gen3_thermal: Do not shadow thcode variable
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=300495
  Link: <20200610003300.884258-1-niklas.soderlund+renesas@ragnatech.se>

Series: media: rcar-vin: Enable MEDIA_BUS_FMT_SRGGB8_1X8 format
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=294159
  Link: <1590581810-19317-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
    Patches: [v5,1/3] media: rcar-vin: Invalidate pipeline if conversion is not possible on input formats
             [v5,2/3] media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
             [v5,3/3] media: rcar-csi2: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format

Patch: rcar-csi2: Rename confirm_start() to phy_post_init() to match its usage
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=301487
  Link: <20200611193232.128721-1-niklas.soderlund+renesas@ragnatech.se>

Series: dt-bindings: adv7180: Convert bindings to json-schema
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=312931
  Link: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
    Patches: [1/2] dt-bindings: adv7180: Convert bindings to json-schema
             [2/2] MAINTAINERS: Add ADV7180 bindings documentation

Series: mmc: core: add a new property/caps2
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=314071
  Link: <1594123122-13156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
    Patches: [v5,1/2] dt-bindings: mmc: Add full-pwr-cycle-in-suspend property
             [v5,2/2] mmc: core: Add MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND

Patch: [v10.1] dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=312573
  Link: <20200703133332.171912-1-jacopo+renesas@jmondi.org>

Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
