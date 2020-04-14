Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887FA1A7715
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2020 11:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437452AbgDNJLx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 05:11:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:58938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437448AbgDNJLf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 05:11:35 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586855494;
        bh=ypPWuzOFEV0WzaBXRYx5dduuwDmB3QKXzR42oMpAo30=;
        h=Subject:From:Date:To:From;
        b=Y1yjeTEB17zWQG4346XlrfT6QxWOreNyREgbpGMbh+BXI8rkubT2fYK7Pg2GU6Ju4
         Q+w9/dXKuFrzs5+kggW7ndzyfDWOzWjUp41BubdzfRo+ZVUJPaPGjekFaBQnwo2GbU
         kmdI7Zvaf/DUFk1yAKYkUpt+xghiyfdiRh3lugqg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158685549418.12046.12497677520906417854.git-patchwork-summary@kernel.org>
Date:   Tue, 14 Apr 2020 09:11:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Series: pwm: Renesas R-Car and TPU fixes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=256961
  Link: <20200316103216.29383-1-geert+renesas@glider.be>
    Patches: [1/3] pwm: rcar: Fix late Runtime PM enablement
             [2/3] pwm: renesas-tpu: Fix late Runtime PM enablement
             [3/3] pwm: renesas-tpu: Drop confusing registered message

Patch: [v3] dt-bindings: rcar-vin: Convert bindings to json-schema
  Submitter: Niklas Söderlund <niklas.soderlund@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=251545
  Link: <20200305005537.385602-1-niklas.soderlund@ragnatech.se>

Patch: drm/omapdrm: Fix trivial spelling
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213605
  Link: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>

Series: thermal: Add support for Renesas R-Car M3-W+
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=252353
  Link: <20200306105503.24267-1-geert+renesas@glider.be>
    Patches: [1/2] dt-bindings: thermal: rcar-gen3-thermal: Add r8a77961 support
             [2/2] thermal: rcar_gen3_thermal: Add r8a77961 support

Series: gpiolib: gpio_set_config() cleanups
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261317
  Link: <20200325100357.13705-1-geert+renesas@glider.be>
    Patches: [1/2] gpiolib: Pass gpio_desc to gpio_set_config()
             [2/2] gpiolib: Remove unused gpio_chip parameter from gpio_set_bias()

Patch: media: vsp1: tidyup VI6_HGT_LBn_H() macro
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214657
  Link: <87k173bp76.wl-kuninori.morimoto.gx@renesas.com>

Patch: arm64: dts: renesas: r8a77961: Add SCIF and HSCIF nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=262749
  Link: <20200327125926.22927-1-geert+renesas@glider.be>

Patch: dt-bindings: pwm: renesas-tpu: Document more R-Car Gen2 support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=256949
  Link: <20200316101453.27745-1-geert+renesas@glider.be>

Patch: media: rcar_drif: Do not print error in case of EPROBE_DEFER for dma channel
  Submitter: Peter Ujfalusi <peter.ujfalusi@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=247559
  Link: <20200226101420.9066-1-peter.ujfalusi@ti.com>

Patch: i2c: rcar: clean up after refactoring i2c_timings
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261989
  Link: <20200326100721.1265-1-wsa+renesas@sang-engineering.com>

Patch: [v2] dt-bindings: serial: sh-sci: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261309
  Link: <20200325095721.11946-1-geert+renesas@glider.be>

Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
