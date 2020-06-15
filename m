Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540E11F94AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2020 12:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgFOKh0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jun 2020 06:37:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728369AbgFOKh0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 06:37:26 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592217445;
        bh=aw+t2EctBNRE0KicwtDekJKaE4MNIEzhQq4v0i8bnTc=;
        h=Subject:From:Date:To:From;
        b=x1vTS9By0fXWmcXHu2zNEIjenu8PXMvybLomYCypfG8T1C7AA2O68nyh0aXVo7gK+
         L5FZjasqvP99Y0fzeEYqD08RqzWz8PuCImcd1tHxwOipKk6wxlLdY3OvIcx8Pd4ox0
         TqItcsMYawrrV9zHlNHZJJeqQp5HqTsmnz81ULsE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159221744566.22898.15433856849270156321.git-patchwork-summary@kernel.org>
Date:   Mon, 15 Jun 2020 10:37:25 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: [GIT,PULL] clk: renesas: Updates for v5.8 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=290931
  Link: <20200520125336.16173-1-geert+renesas@glider.be>

Patch: i2c: slave-eeprom: add support for 24c512 EEPROMs
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=286513
  Link: <20200512142046.26454-1-wsa+renesas@sang-engineering.com>

Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.8 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=290937
  Link: <20200520125357.16281-1-geert+renesas@glider.be>

Series: RZ/G1H enable sound support
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=293769
  Link: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
    Patches: [1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
             [2/2] ARM: dts: r8a7742: Add audio support

Patch: dt-bindings: media: Add missing clock domain description
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=289983
  Link: <20200519074229.22308-1-geert+renesas@glider.be>

Patch: [v2] i2c: regroup documentation of bindings
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=271477
  Link: <20200415105100.11164-1-wsa+renesas@sang-engineering.com>

Patch: clk: renesas: cpg-mssr: Fix STBCR suspend/resume handling
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=283671
  Link: <20200507074713.30113-1-geert+renesas@glider.be>

Patch: [v2] thermal: rcar_thermal: Clean up rcar_thermal_update_temp()
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=287891
  Link: <20200514152505.1927634-1-niklas.soderlund+renesas@ragnatech.se>

Patch: media: rcar-csi2: Fix comment of VCDT/VCDT2 register
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=276691
  Link: <20200424103945.2836-1-wsa+renesas@sang-engineering.com>

Patch: misc: pci_endpoint_test: Add Device ID for RZ/G2E PCIe controller
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=288091
  Link: <1589493809-2602-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>

Patch: [v5] dt-bindings: display: renesas: du: Document optional reset properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=241469
  Link: <20200214082623.4893-1-geert+renesas@glider.be>

Patch: dt-bindings: clock: renesas: div6: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=283675
  Link: <20200507075026.31941-1-geert+renesas@glider.be>

Patch: ASoC: fsi: Add missing properties to DT bindings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=289999
  Link: <20200519075858.27869-1-geert+renesas@glider.be>

Patch: [v2] media: platform: fcp: Set appropriate DMA parameters
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=267589
  Link: <20200407154417.17082-1-kieran.bingham+renesas@ideasonboard.com>

Patch: MAINTAINERS: Renesas Pin Controllers are supported
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=289299
  Link: <20200518081836.23890-1-geert+renesas@glider.be>

Patch: [v2] drm: plane: Verify that no or all planes have a zpos property
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=287441
  Link: <20200513225835.19361-1-laurent.pinchart+renesas@ideasonboard.com>

Patch: [GIT,PULL] clk: renesas: Updates for v5.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=279977
  Link: <20200430084902.1540-1-geert+renesas@glider.be>

Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=279981
  Link: <20200430084909.1599-1-geert+renesas@glider.be>

Patch: [v2] MAINTAINERS: Add entry for Renesas R-Car thermal drivers
  Submitter: Niklas Söderlund <niklas.soderlund@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=251557
  Link: <20200305012721.425330-1-niklas.soderlund@ragnatech.se>

Patch: [v2] vimc: cap: Report a colorspace
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=272929
  Link: <20200417150929.2872477-1-niklas.soderlund+renesas@ragnatech.se>

Patch: [v2] dt-bindings: timer: renesas: cmt: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=282715
  Link: <20200505155127.4836-1-geert+renesas@glider.be>

Patch: i2c: reword explanation about atomic transfers
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=282723
  Link: <20200505160101.12399-1-wsa+renesas@sang-engineering.com>

Patch: pinctrl: rza1: Fix flag name in comment
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=283667
  Link: <20200507074516.29903-1-geert+renesas@glider.be>

Patch: [RFC] media: sh_veu: Remove driver
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=283853
  Link: <20200507122757.30119-1-geert+renesas@glider.be>

Patch: [v2] drm: rcar-du: Set primary plane zpos immutably at initializing
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=266471
  Link: <20200404182015.26481-1-laurent.pinchart+renesas@ideasonboard.com>

Patch: [v2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for camera DB
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=299275
  Link: <1591552659-21314-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>

Total patches: 27

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
