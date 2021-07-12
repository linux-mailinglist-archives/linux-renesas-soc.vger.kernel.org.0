Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731303C5C07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 14:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhGLMX2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 08:23:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:36500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230229AbhGLMX2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 08:23:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2B52A610FA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626092440;
        bh=XTo4Co+PpynxsT3gqxlff+7IfrNhlIfhNRPO727NA7o=;
        h=Subject:From:Date:To:From;
        b=Rr/FCQutlmvvnrND91xG4cphAPEDexirozHIJ8OOKhTEDqqO6pYoc/jRNsTIHL35a
         Qkfr6B4bQk+suiN3tL/dAfqruMIL9TV6gpBy4wR1qeSxwPTWfuEgE0TeHn4wbvY2HA
         oRDC6COTjNGA9mxMnsYHArQnYvMSXeNx4jZWtqNrzwfQ45XhcWe6FBpFF5dRatX9oq
         h6O/dmi/LhbgqbQT4kFvMCUl8SAkULq3geWeNSAqiYBsMIXMS4pLnt2Z8rYN5M+pKb
         q5WBYDUfqIWOC3uQ6gCq4Ab6d1gH7FEIIe0NV8ezeVmO2nc3nPtbbxQuTLqbIpIZHZ
         32piYiqPeUvVA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 183A0600E8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 12:20:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162609244003.31074.16590737597674140694.git-patchwork-summary@kernel.org>
Date:   Mon, 12 Jul 2021 12:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: media: gmsl: Reliability improvements
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=501551
  Lore link: https://lore.kernel.org/r/20210616124616.49249-1-jacopo+renesas@jmondi.org
    Patches: [v5,01/15] media: i2c: max9286: Adjust parameters indent
             [v5,02/15] media: i2c: max9286: Rename reverse_channel_mv
             [v5,03/15] media: i2c: max9286: Cache channel amplitude
             [v5,04/15] media: i2c: max9286: Define high channel amplitude
             [v5,05/15] media: i2c: max9286: Rework comments in .bound()
             [v5,06/15] media: i2c: max9271: Check max9271_write() return
             [v5,07/15] media: i2c: max9271: Introduce wake_up() function
             [v5,08/15] media: i2c: rdacm21: Add delay after OV490 reset
             [v5,09/15] media: i2c: rdacm21: Fix OV10640 powerup
             [v5,10/15] media: i2c: rdacm21: Power up OV10640 before OV490
             [v5,11/15] media: i2c: rdacm20: Enable noise immunity
             [v5,12/15] media: i2c: rdacm20: Embed 'serializer' field
             [v5,13/15] media: i2c: rdacm20: Report camera module name
             [v5,14/15] media: i2c: rdacm20: Check return values
             [v5,15/15] media: i2c: rdacm20: Re-work ov10635 reset
Series: Extend regulator notification support
  Submitter: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=493015
  Lore link: https://lore.kernel.org/r/cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com
    Patches: [RESEND,v10,01/11] dt_bindings: Add protection limit properties
             [RESEND,v10,02/11] reboot: Add hardware protection power-off
             [RESEND,v10,03/11] thermal: Use generic HW-protection shutdown API
             [RESEND,v10,04/11] regulator: add warning flags
             [RESEND,v10,05/11] regulator: move rdev_print helpers to internal.h
             [RESEND,v10,06/11] regulator: IRQ based event/error notification helpers
             [RESEND,v10,07/11] regulator: add property parsing and callbacks to set protection limits
             [RESEND,v10,08/11] dt-bindings: regulator: bd9576 add FET ON-resistance for OCW
             [RESEND,v10,09/11] regulator: bd9576: Support error reporting
             [RESEND,v10,10/11] regulator: bd9576: Fix the driver name in id table
             [RESEND,v10,11/11] MAINTAINERS: Add reviewer for regulator irq_helpers
Patch: docs: fault-injection: fix non-working usage of negative values
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=493341
  Lore link: https://lore.kernel.org/r/20210603125841.27436-1-wsa+renesas@sang-engineering.com
Patch: [RFC] mmc: improve function name when aborting a tuning cmd
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=496469
  Lore link: https://lore.kernel.org/r/20210608180620.40059-1-wsa+renesas@sang-engineering.com
Patch: dt-bindings: Fix 'unevaluatedProperties' errors in DT graph users
  Submitter: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505911
  Lore link: https://lore.kernel.org/r/20210623164344.2571043-1-robh@kernel.org
Series: Remove shdma DT support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498749
  Lore link: https://lore.kernel.org/r/cover.1623405675.git.geert+renesas@glider.be
    Patches: [1/3] dt-bindings: dmaengine: Remove SHDMA Device Tree bindings
             [2/3] dmaengine: sh: Remove unused shdma-of driver
             [3/3] ARM: dts: r8a73a4: Remove non-functional DMA support
Series: [v2,1/5] dt-bindings: i2c: renesas,iic: Always declare generic compatibility
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=503185
  Lore link: https://lore.kernel.org/r/760fec5fa71bfff4c7bfe944cfc385f9d8e1945b.1624013699.git.geert+renesas@glider.be
    Patches: [v2,1/5] dt-bindings: i2c: renesas,iic: Always declare generic compatibility
             [v2,2/5] ARM: dts: rzg1: Add generic compatible strings to IIC nodes
             [v2,3/5] arm64: dts: renesas: r8a774c0: Add generic compatible string to IIC node
             [v2,4/5] arm64: dts: renesas: r8a77990: Add generic compatible string to IIC node
             [v2,5/5] dt-bindings: i2c: renesas,iic: Convert to json-schema
Patch: dt-bindings: input: touchscreen: st1232: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498905
  Lore link: https://lore.kernel.org/r/fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be
Patch: mmc: debugfs: add description for module parameter
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=494081
  Lore link: https://lore.kernel.org/r/20210604104459.7574-1-wsa+renesas@sang-engineering.com
Patch: dt-bindings: display: renesas,du: Fix 'ports' reference
  Submitter: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505909
  Lore link: https://lore.kernel.org/r/20210623164308.2570164-1-robh@kernel.org
Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.14 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498723
  Lore link: https://lore.kernel.org/r/cover.1623404609.git.geert+renesas@glider.be
Patch: dt-bindings: interrupt-controller: arm,gic-v3: Describe GIV-v3 optional properties
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=494141
  Lore link: https://lore.kernel.org/r/20210604121123.650-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Patch: [v2] dt-bindings: interrupt-controller: arm,gic-v3: Describe GICv3 optional properties
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=497375
  Lore link: https://lore.kernel.org/r/20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Patch: dt-bindings: rtc: ti,bq32k: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=501605
  Lore link: https://lore.kernel.org/r/42d9c71b4ee1f120e0cdcf6b266547d29d1fb9a4.1623851377.git.geert+renesas@glider.be
Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.14
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=490145
  Lore link: https://lore.kernel.org/r/cover.1622191662.git.geert+renesas@glider.be
Patch: [GIT,PULL] clk: renesas: Updates for v5.14
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=490149
  Lore link: https://lore.kernel.org/r/cover.1622191519.git.geert+renesas@glider.be
Patch: dt-bindings: rtc: nxp,pcf8563: Absorb pcf85263/pcf85363 bindings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498881
  Lore link: https://lore.kernel.org/r/e4f48d97f0e16d78a796f02b77ea3a0018904185.1623416431.git.geert+renesas@glider.be
Patch: [GIT,PULL] clk: renesas: Updates for v5.14 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498721
  Lore link: https://lore.kernel.org/r/cover.1623404713.git.geert+renesas@glider.be

Total patches: 48

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


